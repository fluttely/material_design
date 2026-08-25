#!/usr/bin/env dart
// Printing is this script's entire output channel.
// ignore_for_file: avoid_print

/// Budgets the agent context window, by ring.
///
/// ## Why a gate and not a note
///
/// Context is not only cost and not only a physical limit — it is a **quality
/// variable**. An inflated window degrades an answer three ways: the relevant
/// signal is diluted, the middle of the window gets less attention than either
/// end, and contradictory instructions pile up as a file grows. So trimming the
/// permanent ring is a precision win, not a thrift measure.
///
/// The failure mode is inertia. Every rule feels important enough to write into
/// `CLAUDE.md`, nothing ever feels important enough to take out, and the file
/// that is loaded on *every single call* grows without anyone deciding that it
/// should. Nobody makes that decision because nobody is shown the number. This
/// script shows the number and fails when it is exceeded, which converts "keep
/// CLAUDE.md focused" from an intention into a gate.
///
/// ## The three rings
///
/// | Ring | Loaded | Owner | Budgeted |
/// | :--- | :--- | :--- | :--- |
/// | **always** | every call | `CLAUDE.md` | yes, hard |
/// | **on demand** | when a command or skill fires | `.claude/` | yes, per file |
/// | **retrieved** | when an agent greps for it | `lib/`, docs | no — reported |
///
/// The retrieved ring is deliberately unbudgeted: it is two orders of magnitude
/// larger than the permanent one and that is exactly right. Retrieval is how a
/// large corpus stays out of the window until the moment it is needed. It is
/// printed so the ratio stays visible — when the permanent ring starts to look
/// large next to what is retrieved on demand, something has been filed in the
/// wrong ring.
///
/// ## On the token numbers
///
/// Counts are `characters / 3.7`, an estimate, and are labelled `~` everywhere
/// they are printed. An exact tokenizer would mean a dependency and a network
/// call for a number whose only job is to trigger a decision at the right order
/// of magnitude. The trend and the ceiling matter; the third digit does not.
///
/// ```sh
/// dart run tool/check_context.dart
/// ```
///
/// Exits non-zero when a budgeted ring is over.
library;

import 'dart:io';

/// The permanent ring's ceiling, in estimated tokens.
///
/// Every call in this repository pays this, so it is the one number in the
/// project that is charged per request rather than per release. The ceiling is
/// set a little above the current size on purpose: it is not meant to fail
/// today, it is meant to fail the *next* time someone adds a section without
/// removing one, and to make that person choose between trimming and moving the
/// section to the on-demand ring. Raising it is a legitimate decision; raising
/// it silently, to make a red build green, is the inertia this file exists to
/// stop. Say why in the changelog.
const alwaysBudgetTokens = 7000;

/// Ceiling for a single on-demand file, in estimated tokens.
///
/// Per file, not summed: only one command or skill body enters the window at a
/// time. A procedure that cannot be stated in this much text is usually two
/// procedures.
const onDemandBudgetTokens = 1500;

/// Warn at this share of a budget, so the ceiling arrives as a heads-up rather
/// than as a surprise on the commit that crosses it.
const warnAt = 0.85;

final _errors = <String>[];
final _warnings = <String>[];

void main() {
  print('  Ring 1 — always loaded (every call pays this)');
  final always = _measure('CLAUDE.md');
  _print(always, budget: alwaysBudgetTokens);
  _budget(always, alwaysBudgetTokens, 'the always-loaded ring');

  print('\n  Ring 2 — on demand (one body at a time)');
  final onDemand = [
    ..._glob('.claude/commands', '.md'),
    ..._glob('.claude/skills', 'SKILL.md'),
  ]..sort((a, b) => a.path.compareTo(b.path));
  for (final file in onDemand) {
    _print(file, budget: onDemandBudgetTokens);
    _budget(file, onDemandBudgetTokens, 'an on-demand file');
  }
  final headers = onDemand.fold<int>(0, (sum, f) => sum + f.headerTokens);
  print(
    '    ${'└ headers always in context'.padRight(38)} '
    '~$headers tokens across ${onDemand.length} file(s)',
  );

  print('\n  Ring 3 — retrieved (grep/read; never loaded wholesale)');
  final retrieved = <_Measured>[
    _measureAll('lib', '.dart'),
    _measureAll('demo/lib', '.dart'),
    _measureAll('documentation', '.md'),
    _measure('CHANGELOG.md'),
    _measure('README.md'),
  ];
  for (final entry in retrieved) {
    _print(entry);
  }

  final retrievedTokens = retrieved.fold<int>(0, (sum, e) => sum + e.tokens);
  final ratio = (retrievedTokens / always.tokens).round();
  print(
    '\n  Retrieved is $ratio× the permanent ring — '
    'retrieval is doing its job.',
  );

  _report();
  exit(_errors.isEmpty ? 0 : 1);
}

// ─────────────────────────────────────────────────────────────────────────────
// Budgets
// ─────────────────────────────────────────────────────────────────────────────

void _budget(_Measured file, int budget, String what) {
  final share = file.tokens / budget;
  final knob = budget == alwaysBudgetTokens
      ? 'alwaysBudgetTokens'
      : 'onDemandBudgetTokens';
  if (share > 1) {
    _errors.add(
      '${file.path} is ~${file.tokens} tokens, over the $budget-token budget '
      'for $what by ~${file.tokens - budget}. Move a section to the on-demand '
      'ring (a command or a skill body), or cut it. Raising $knob is a '
      'decision to argue for in the changelog, not a way to make this green.',
    );
  } else if (share > warnAt) {
    _warnings.add(
      '${file.path} is at ${(share * 100).round()}% of its budget. The next '
      'section added is the one that will not fit.',
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Measurement
// ─────────────────────────────────────────────────────────────────────────────

/// One measured unit of context: a file, or a whole directory rolled up.
class _Measured {
  const _Measured(this.path, this.tokens, {this.headerTokens = 0, this.files});

  final String path;
  final int tokens;

  /// For an on-demand file, the size of the part that is *always* in
  /// context — the frontmatter name and description the model matches against
  /// to decide whether to load the body. Progressive disclosure only pays off
  /// when this stays small.
  final int headerTokens;

  /// Number of files, when this is a rolled-up directory.
  final int? files;
}

/// Characters per token. An estimate — see the library doc.
const _charsPerToken = 3.7;

int _tokens(String text) => (text.length / _charsPerToken).round();

_Measured _measure(String path) {
  final file = File(path);
  if (!file.existsSync()) return _Measured(path, 0);
  return _Measured(path, _tokens(file.readAsStringSync()));
}

_Measured _measureAll(String dir, String suffix) {
  final directory = Directory(dir);
  if (!directory.existsSync()) return _Measured('$dir/', 0);
  var tokens = 0;
  var files = 0;
  for (final entity in directory.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith(suffix)) {
      tokens += _tokens(entity.readAsStringSync());
      files++;
    }
  }
  return _Measured('$dir/', tokens, files: files);
}

/// On-demand files, with their frontmatter measured separately.
List<_Measured> _glob(String dir, String suffix) {
  final directory = Directory(dir);
  if (!directory.existsSync()) return const [];
  final found = <_Measured>[];
  for (final entity in directory.listSync(recursive: true)) {
    if (entity is! File || !entity.path.endsWith(suffix)) continue;
    final source = entity.readAsStringSync();
    // The header is the YAML frontmatter: `name` and `description` are what
    // the model reads to decide whether the body is relevant.
    final header = RegExp(r'^---\n(.*?)\n---', dotAll: true).firstMatch(source);
    found.add(
      _Measured(
        entity.path,
        _tokens(source),
        headerTokens: header == null ? 0 : _tokens(header.group(1)!),
      ),
    );
  }
  return found;
}

// ─────────────────────────────────────────────────────────────────────────────
// Output
// ─────────────────────────────────────────────────────────────────────────────

void _print(_Measured file, {int? budget}) {
  final label =
      file.files == null ? file.path : '${file.path} (${file.files} files)';
  final size = '~${file.tokens} tokens';
  if (budget == null) {
    print('    ${label.padRight(38)} $size');
    return;
  }
  final share = (file.tokens / budget * 100).round();
  final mark = file.tokens > budget
      ? '✗'
      : file.tokens / budget > warnAt
          ? '⚠'
          : '✓';
  print(
    '  $mark ${label.padRight(38)} ${size.padRight(16)} '
    '$share% of $budget',
  );
}

void _report() {
  for (final warning in _warnings) {
    print('  ⚠ $warning');
  }
  if (_errors.isEmpty) {
    print(
      '\n✓ Context budgets hold'
      '${_warnings.isEmpty ? '.' : ' (${_warnings.length} warning(s)).'}',
    );
    return;
  }
  print('\n✗ The context window is over budget:\n');
  for (final error in _errors) {
    print('  • $error\n');
  }
}
