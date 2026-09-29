#!/usr/bin/env dart
// Printing is this script's entire output channel.
// ignore_for_file: avoid_print

/// Checks that what changed in `lib/` since the last release is what the
/// changelog, and at release time the version, say changed.
///
/// ## Why
///
/// This package's product *is* its public API: the contract is a set of types
/// and `const` values, and `CLAUDE.md` says a change that breaks the
/// `const`-ness of an existing API is a breaking change. Until this script, the
/// only thing classifying a change as breaking was whoever wrote it — the
/// version bump and the `### 💥 Breaking Changes` heading were both judgement
/// calls with nothing under them.
///
/// ## How
///
/// The baseline is the last release commit — the newest commit whose subject is
/// `## x.y.z`, which the commit rules already require — exported from git, so
/// the comparison is offline and is against exactly what shipped. Two diffs run
/// against it:
///
/// 1. **`dart_apitool`** — removals, renames and signature changes, classified
///    as breaking or additive.
/// 2. **The const surface**, read by this script — every public
///    `static const`, every public `const` constructor, and every extension
///    type's `const`-ness, representation and `implements` clause. This half
///    exists because `dart_apitool` does not see any of it: probed on this
///    package, it reported *no changes* for `static const` → `static final`,
///    for a constructor losing `const`, and for an extension type losing
///    `implements double`. Those are the three breaks most specific to this
///    package.
///
/// Then the repository's version policy is applied to the result:
///
/// - `lib/` changed at all ⇒ a `## Unreleased` section exists (the entry ships
///   with the change — see the `commit` skill). `pubspec.yaml` stays on the
///   release; the script prints the least bump the diff requires, for
///   `/release` to use.
/// - a break ⇒ a `### 💥 Breaking Changes` subsection in the top section.
/// - once `pubspec.yaml` is bumped — the release commit — the bump must be at
///   least what the diff requires: a minor for an addition, and for a break a
///   minor while [breakingTakesMinor] holds, a major once it does not.
///
/// ```sh
/// dart pub global activate dart_apitool 0.23.2   # once
/// dart run tool/check_api.dart
/// ```
///
/// Exits non-zero on any error.
library;

import 'dart:convert';
import 'dart:io';

/// The post-1.0 breaking policy in `CLAUDE.md`, "Versioning & releases":
/// `1.0.0` has no external adopters, so a breaking change takes a minor bump.
///
/// Flip this to `false` the day the policy is revisited, and every break from
/// then on will require a major.
const breakingTakesMinor = true;

/// Pinned so that the local gate and CI classify changes the same way.
const apitoolVersion = '0.23.2';

final _errors = <String>[];

Future<void> main() async {
  final release = _lastRelease();
  if (release == null) {
    _report(const _Diff());
    exit(1);
  }

  final pubspec = _pubspecVersion();
  print('  baseline  ## ${release.version} (${release.sha.substring(0, 7)})');
  print('  pubspec   $pubspec');

  if (!_libChangedSince(release.sha)) {
    print('  ✓ lib/ is unchanged since ## ${release.version}');
    _report(const _Diff());
    exit(0);
  }

  final baseline = Directory.systemTemp.createTempSync('check_api_');
  try {
    _export(release.sha, baseline.path);
    final diff = _apitool(baseline.path).plus(_constSurfaceDiff(baseline.path));
    _applyPolicy(release.version, pubspec, diff);
    _report(diff);
  } finally {
    baseline.deleteSync(recursive: true);
  }
  exit(_errors.isEmpty ? 0 : 1);
}

// ─────────────────────────────────────────────────────────────────────────────
// Baseline
// ─────────────────────────────────────────────────────────────────────────────

class _Release {
  const _Release(this.sha, this.version);
  final String sha;
  final String version;
}

/// The newest `## x.y.z` commit. Merge commits are skipped by construction:
/// their subject is `Merge pull request …`, never the version.
_Release? _lastRelease() {
  final shallow = _git(['rev-parse', '--is-shallow-repository']).trim();
  if (shallow == 'true') {
    _errors.add(
      'The clone is shallow, so the last release commit is not in history. In '
      'CI, check out with `fetch-depth: 0`.',
    );
    return null;
  }
  final subject = RegExp(r'^([0-9a-f]{40}) ## (\d+\.\d+\.\d+\S*)$');
  for (final line in _git(['log', '--format=%H %s']).split('\n')) {
    final match = subject.firstMatch(line);
    if (match != null) return _Release(match.group(1)!, match.group(2)!);
  }
  _errors.add('No `## x.y.z` release commit found in history.');
  return null;
}

String _pubspecVersion() => RegExp(r'^version:\s*(\S+)', multiLine: true)
    .firstMatch(File('pubspec.yaml').readAsStringSync())!
    .group(1)!;

/// Working tree against the release, untracked files included — a new file in
/// `lib/` is a change even before it is staged.
bool _libChangedSince(String sha) {
  final tracked = Process.runSync('git', ['diff', '--quiet', sha, '--', 'lib']);
  if (tracked.exitCode != 0) return true;
  return _git(['ls-files', '--others', '--exclude-standard', 'lib'])
      .trim()
      .isNotEmpty;
}

void _export(String sha, String into) {
  const paths = 'lib pubspec.yaml analysis_options.yaml LICENSE';
  final pipeline = 'git archive $sha $paths | tar -x -C "$into"';
  final result = Process.runSync('bash', ['-c', pipeline]);
  if (result.exitCode != 0) {
    throw StateError('git archive failed: ${result.stderr}');
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 1. dart_apitool
// ─────────────────────────────────────────────────────────────────────────────

class _Diff {
  const _Diff({this.breaking = const [], this.additive = const []});
  final List<String> breaking;
  final List<String> additive;

  _Diff plus(_Diff other) => _Diff(
        breaking: [...breaking, ...other.breaking],
        additive: [...additive, ...other.additive],
      );
}

_Diff _apitool(String baseline) {
  final installed = Process.runSync('dart', ['pub', 'global', 'list']);
  if (!'${installed.stdout}'.contains('dart_apitool')) {
    _errors.add(
      'dart_apitool is not installed, so removals and signature changes cannot '
      'be classified. Install it once:\n\n'
      '      dart pub global activate dart_apitool $apitoolVersion',
    );
    return const _Diff();
  }

  final report = '$baseline/.api_report.json';
  final result = Process.runSync('dart', [
    'pub',
    'global',
    'run',
    'dart_apitool:main',
    'diff',
    '--old',
    baseline,
    '--new',
    '.',
    '--version-check-mode',
    'none',
    '--report-format',
    'json',
    '--report-file-path',
    report,
  ]);
  if (result.exitCode != 0 || !File(report).existsSync()) {
    final tail = '${result.stdout}\n${result.stderr}'.trim().split('\n');
    _errors.add(
      'dart_apitool failed (exit ${result.exitCode}):\n      '
      '${tail.skip(tail.length > 8 ? tail.length - 8 : 0).join('\n      ')}',
    );
    return const _Diff();
  }

  final json =
      jsonDecode(File(report).readAsStringSync()) as Map<String, dynamic>;
  final body = json['report'] as Map<String, dynamic>;
  List<String> changes(
    String key,
    bool Function(Map<String, dynamic>) keep,
  ) {
    final out = <String>[];
    void walk(Object? node, List<String> path) {
      if (node is! Map<String, dynamic>) return;
      if (node.containsKey('changeDescription')) {
        if (keep(node)) {
          out.add([...path, node['changeDescription']].join(' › '));
        }
        return;
      }
      final label = node['label'];
      final here =
          label is String && node != body[key] ? [...path, label] : path;
      for (final child in (node['children'] as List? ?? const [])) {
        walk(child, here);
      }
    }

    walk(body[key], const []);
    return out;
  }

  return _Diff(
    breaking: changes('breakingChanges', (_) => true),
    // `minor` is dart_apitool's word for "adds API". A `patch` entry adds
    // nothing a consumer can call, so it does not raise the required bump.
    additive: changes('nonBreakingChanges', (c) => c['type'] == 'minor'),
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// 2. The const surface
// ─────────────────────────────────────────────────────────────────────────────

/// Every promise the old release made about `const` that the working tree no
/// longer keeps. Additions are not reported — a new `const` is a new member,
/// which dart_apitool already counts.
_Diff _constSurfaceDiff(String baseline) {
  final before = _constSurface('$baseline/lib');
  final after = _constSurface('lib');
  return _Diff(
    breaking: [
      for (final promise in before.difference(after))
        'no longer true: $promise',
    ],
  );
}

final _extensionType = RegExp(
  r'^extension type\s+(const\s+)?(\w+)(?:<[^>]*>)?(?:\.\w+)?'
  r'\(([^)]*)\)\s*(?:implements\s+([^{]+?))?\s*\{',
);
final _typeHeader = RegExp(
  r'^(?:(?:abstract|final|base|sealed|interface|mixin)\s+)*'
  r'(?:class|mixin|enum)\s+(\w+)|^extension\s+(\w+)\s+on\b',
);
final _staticConst = RegExp(r'^  static const [^=]*?\b(\w+)\s*=');
final _constCtor = RegExp(r'^  const (?:factory )?(\w+)(?:\.(\w+))?\(');
final _topLevelConst = RegExp(r'^const [^=]*?\b(\w+)\s*=');

Set<String> _constSurface(String root) {
  final promises = <String>{};
  bool public(String name) => !name.startsWith('_');

  for (final entity in Directory(root).listSync(recursive: true)) {
    if (entity is! File || !entity.path.endsWith('.dart')) continue;
    String? owner;
    for (final line in entity.readAsLinesSync()) {
      final ext = _extensionType.firstMatch(line);
      if (ext != null) {
        owner = ext.group(2);
        if (!public(owner!)) continue;
        if (ext.group(1) != null) {
          promises.add('extension type $owner is const');
        }
        final representation = ext.group(3)!.trim().split(RegExp(r'\s+'));
        if (public(representation.last)) {
          final shown = representation.join(' ');
          promises.add('$owner exposes its representation as `$shown`');
        }
        for (final type in (ext.group(4) ?? '').split(',')) {
          if (type.trim().isNotEmpty) {
            promises.add('$owner implements ${type.trim()}');
          }
        }
        continue;
      }

      final header = _typeHeader.firstMatch(line);
      if (header != null) {
        owner = header.group(1) ?? header.group(2);
        continue;
      }

      final top = _topLevelConst.firstMatch(line);
      if (top != null && public(top.group(1)!)) {
        promises.add('top-level ${top.group(1)} is const');
        continue;
      }

      if (owner == null || !public(owner)) continue;

      final member = _staticConst.firstMatch(line);
      if (member != null && public(member.group(1)!)) {
        promises.add('$owner.${member.group(1)} is const');
      }

      final ctor = _constCtor.firstMatch(line);
      if (ctor != null && ctor.group(1) == owner) {
        final named = ctor.group(2);
        if (named == null) {
          promises.add('$owner() is a const constructor');
        } else if (public(named)) {
          promises.add('$owner.$named() is a const constructor');
        }
      }
    }
  }
  return promises;
}

// ─────────────────────────────────────────────────────────────────────────────
// 3. Policy
// ─────────────────────────────────────────────────────────────────────────────

enum _Bump { none, patch, minor, major }

_Bump _bumpBetween(String from, String to) {
  List<int> core(String v) =>
      v.split(RegExp('[-+]')).first.split('.').map(int.parse).toList();
  final a = core(from);
  final b = core(to);
  if (b[0] != a[0]) return b[0] > a[0] ? _Bump.major : _Bump.none;
  if (b[1] != a[1]) return b[1] > a[1] ? _Bump.minor : _Bump.none;
  if (b[2] != a[2]) return b[2] > a[2] ? _Bump.patch : _Bump.none;
  return _Bump.none;
}

/// The least bump the diff allows: a break takes the policy's, an addition a
/// minor, anything else a patch.
_Bump _required(_Diff diff) {
  if (diff.breaking.isNotEmpty) {
    return breakingTakesMinor ? _Bump.minor : _Bump.major;
  }
  return diff.additive.isNotEmpty ? _Bump.minor : _Bump.patch;
}

String _bumped(String version, _Bump bump) {
  final v = version.split(RegExp('[-+]')).first.split('.').map(int.parse);
  final [major, minor, patch] = v.toList();
  return switch (bump) {
    _Bump.major => '${major + 1}.0.0',
    _Bump.minor => '$major.${minor + 1}.0',
    _ => '$major.$minor.${patch + 1}',
  };
}

void _applyPolicy(String released, String pubspec, _Diff diff) {
  final required = _required(diff);
  final bump = _bumpBetween(released, pubspec);
  final section = _topSection();

  if (bump == _Bump.none) {
    // Between releases: the version is not decided yet, so what is checked is
    // that the change is documented where the release will pick it up.
    print('  next      at least ${_bumped(released, required)} '
        '(${required.name}), decided by /release');
    if (section.heading != 'Unreleased') {
      _errors.add(
        'lib/ has changed since ## $released, and CHANGELOG.md has no '
        '`## Unreleased` section. The entry ships with the change: open '
        '`## Unreleased` in this commit (see the `commit` skill). pubspec.yaml '
        'stays on $released until the release.',
      );
      return;
    }
  } else if (bump.index < required.index) {
    // A release commit in progress: the number is being decided now.
    final why = diff.breaking.isNotEmpty
        ? 'a breaking change, which takes a ${required.name} bump'
            '${breakingTakesMinor ? ' while the post-1.0 policy holds' : ''}'
        : 'new public API, which is a feature and takes a minor bump';
    _errors.add('lib/ carries $why — $released → $pubspec is a ${bump.name}.');
  }

  if (diff.breaking.isNotEmpty &&
      !section.body.contains('### 💥 Breaking Changes')) {
    _errors.add(
      'This is a breaking change, and `## ${section.heading}` has no '
      '`### 💥 Breaking Changes` subsection. A break always ships with its '
      'migration mapping (old name → new name).',
    );
  }
}

/// The top `## ` section of CHANGELOG.md — `Unreleased` between releases, the
/// version being cut during a release commit.
({String heading, String body}) _topSection() {
  final sections = File('CHANGELOG.md').readAsStringSync().split('\n## ');
  if (sections.length < 2) return (heading: '', body: '');
  final lines = sections[1].split('\n');
  return (heading: lines.first.trim(), body: lines.skip(1).join('\n'));
}

// ─────────────────────────────────────────────────────────────────────────────
// Plumbing
// ─────────────────────────────────────────────────────────────────────────────

String _git(List<String> args) => '${Process.runSync('git', args).stdout}';

void _report(_Diff diff) {
  if (diff.breaking.isNotEmpty) {
    print('\n  Breaking (${diff.breaking.length})');
    for (final change in diff.breaking) {
      print('    • $change');
    }
  }
  if (diff.additive.isNotEmpty) {
    print('\n  Additive (${diff.additive.length})');
    for (final change in diff.additive) {
      print('    • $change');
    }
  }
  if (_errors.isEmpty) {
    print('\n✓ The version says what lib/ did.');
    return;
  }
  print('\n✗ The version and lib/ disagree:\n');
  for (final error in _errors) {
    print('  • $error\n');
  }
}
