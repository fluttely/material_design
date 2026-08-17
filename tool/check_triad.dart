#!/usr/bin/env dart
// Printing is this script's entire output channel.
// ignore_for_file: avoid_print

/// Enforces the documentation triad: **README ↔ example ↔ demo must never
/// drift apart**.
///
/// `CLAUDE.md` has stated that rule in prose since 1.0. Prose does not fail CI,
/// so the triad drifted anyway — this script is the rule with a compiler behind
/// it. It checks four things no Dart compiler can:
///
/// 1. **Canonical section order.** README, `example/lib/main.dart` and this file
///    agree on the numbered "API tour" sections, in the same order. The list in
///    [canonicalSections] is the single source of truth; a family added to an
///    existing area takes a `b` suffix rather than renumbering everything after
///    it.
/// 2. **Demo navigation sections.** The demo's four groups exist and are named
///    as documented.
/// 3. **Token scale coverage.** Every `abstract final class M3Xs` publishing a
///    `values` list is named in all three artifacts. A scale that ships without
///    a README line, an example and a demo page is a scale nobody can find.
/// 4. **Dead API names in prose and UI strings.** Nothing renders an `M3*`
///    identifier that no longer exists in `lib/`. Pre-1.0 the demo's headings
///    advertised deleted `M3*Token` enums for months, because no compiler
///    checks a string.
///
/// ```sh
/// dart run tool/check_triad.dart
/// ```
///
/// Exits non-zero on any error. Warnings are printed but do not fail the build.
library;

import 'dart:io';

/// The canonical "API tour" order, shared by README.md and
/// `example/lib/main.dart`.
///
/// Only the identifiers are checked, never the titles — the three artifacts are
/// allowed to phrase a heading differently for their medium. What may not
/// differ is which sections exist and in what order.
const canonicalSections = <String>[
  '1', // Spacing & layout
  '2', // Shape & borders
  '3', // Elevation & surfaces
  '4', // Typography
  '4b', // Icons
  '5', // Color
  '5b', // Schemes, variants & contrast
  '6', // Interaction states & focus
  '7', // Motion
  '8', // Adaptive & responsive
  '8b', // Component measurements
  '9', // Accessibility
  '10', // M3 Expressive (experimental)
  '11', // Breaking the contract (M3Contract)
];

/// The demo's navigation groups, as documented in `CLAUDE.md`.
///
/// Expressive leads deliberately: it is the newest part of the spec and the
/// part of the package a visitor is least likely to know exists, so it gets
/// the position that costs no scrolling. The three stable groups follow in
/// spec order.
const canonicalDemoSections = <String>[
  'Expressive',
  'Foundations',
  'Styles',
  'Utilities',
];

/// `M3*` names that appear outside `lib/` on purpose even though they no longer
/// exist — historical references that explain a migration.
///
/// This is the triad checker's `M3Contract`: deviation stays possible, but it
/// is deliberate and greppable. Add a name here only with a reason.
const historicalNames = <String, String>{
  // README, "The rules behind the API": explains why the unwrap-based token
  // enums were removed. Naming the dead API is the entire point of the line.
  'M3SpacingToken': 'README documents its removal (1.0 migration)',
  'M3ElevationToken': 'README/CHANGELOG document its removal',
  'M3ShapeToken': 'README/CHANGELOG document its removal',
  'M3TypeScaleToken': 'README/CHANGELOG document its removal',
};

/// Scales that deliberately have no demo page of their own.
const demoCoverageExemptions = <String, String>{
  'M3Contract': 'shown inline on every page as the escape hatch, not a page',
  'M3EdgeInsetsPatterns': 'exercised by the Spacing page rather than named',
};

final _errors = <String>[];
final _warnings = <String>[];

void main() {
  final readme = File('README.md').readAsStringSync();
  final example = File('example/lib/main.dart').readAsStringSync();
  final destinations = File(
    'demo/lib/showcase/showcase_destinations.dart',
  ).readAsStringSync();
  final demoSources = _readAll(Directory('demo/lib'));
  final libSources = _readAll(Directory('lib'));

  _checkSectionOrder('README.md', _readmeSections(readme));
  _checkSectionOrder('example/lib/main.dart', _exampleSections(example));
  _checkDemoSections(destinations);
  _checkScaleCoverage(libSources, readme, example, demoSources);
  _checkDeadNames(libSources, readme, demoSources);

  _report();
  exit(_errors.isEmpty ? 0 : 1);
}

// ─────────────────────────────────────────────────────────────────────────────
// 1. Canonical section order
// ─────────────────────────────────────────────────────────────────────────────

/// Numbered headings in README, at any heading level: the API tour uses `###`,
/// and section 11 is a top-level `##` because it is not part of the tour.
List<String> _readmeSections(String source) =>
    RegExp(r'^#{2,3} (\d+b?)\.\s', multiLine: true)
        .allMatches(source)
        .map((m) => m.group(1)!)
        .toList();

/// Section titles in the single-file example, e.g. `title: '4b. Icons'`.
List<String> _exampleSections(String source) =>
    RegExp(r"title: '(\d+b?)\.\s", multiLine: true)
        .allMatches(source)
        .map((m) => m.group(1)!)
        .toList();

void _checkSectionOrder(String label, List<String> found) {
  if (_sameOrder(found, canonicalSections)) {
    print('  ✓ $label — ${found.length} sections, canonical order');
    return;
  }

  final missing = canonicalSections.where((s) => !found.contains(s)).toList();
  final extra = found.where((s) => !canonicalSections.contains(s)).toList();

  if (missing.isNotEmpty) {
    _errors.add(
      '$label is missing section${missing.length == 1 ? '' : 's'} '
      '${missing.map((s) => '"$s."').join(', ')}. The canonical order lives in '
      'tool/check_triad.dart; every artifact presents the API in it.',
    );
  }
  if (extra.isNotEmpty) {
    _errors.add(
      '$label has section${extra.length == 1 ? '' : 's'} '
      '${extra.map((s) => '"$s."').join(', ')} that the canonical order does '
      'not define. Add them to canonicalSections, or renumber.',
    );
  }
  if (missing.isEmpty && extra.isEmpty) {
    _errors.add(
      '$label has every section but in the wrong order:\n'
      '      found:     ${found.join(' → ')}\n'
      '      canonical: ${canonicalSections.join(' → ')}',
    );
  }
}

bool _sameOrder(List<String> a, List<String> b) =>
    a.length == b.length &&
    List.generate(a.length, (i) => a[i] == b[i]).every((e) => e);

// ─────────────────────────────────────────────────────────────────────────────
// 2. Demo navigation sections
// ─────────────────────────────────────────────────────────────────────────────

void _checkDemoSections(String destinations) {
  final found = RegExp(r"ShowcaseSection\(\s*title: '([^']+)'")
      .allMatches(destinations)
      .map((m) => m.group(1)!)
      .toList();

  final missing = canonicalDemoSections.where((s) => !found.contains(s));
  final extra = found.where((s) => !canonicalDemoSections.contains(s));

  if (missing.isNotEmpty) {
    _errors.add(
      'The demo is missing navigation section(s) ${missing.join(', ')}.',
    );
  }
  if (extra.isNotEmpty) {
    _errors.add(
      'The demo has undocumented navigation section(s) ${extra.join(', ')}. '
      'Add them to canonicalDemoSections if the grouping really changed.',
    );
  }
  if (missing.isEmpty && extra.isEmpty) {
    if (_sameOrder(found, canonicalDemoSections)) {
      print('  ✓ demo navigation — ${found.length} sections, documented order');
    } else {
      // Order here is a presentation choice, not a contract. Worth surfacing,
      // not worth failing a build over.
      _warnings.add(
        'Demo navigation order is ${found.join(' → ')}, documented as '
        '${canonicalDemoSections.join(' → ')}. Reorder the demo, or update '
        'canonicalDemoSections and CLAUDE.md to match the new intent.',
      );
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 3. Token scale coverage
// ─────────────────────────────────────────────────────────────────────────────

void _checkScaleCoverage(
  Map<String, String> libSources,
  String readme,
  String example,
  Map<String, String> demoSources,
) {
  final scales = _publishedScales(libSources);
  final demoText = demoSources.values.join('\n');
  final gaps = <String, List<String>>{};

  for (final scale in scales) {
    final missing = <String>[
      if (!readme.contains(scale)) 'README',
      if (!example.contains(scale)) 'example',
      if (!demoText.contains(scale) &&
          !demoCoverageExemptions.containsKey(scale))
        'demo',
    ];
    if (missing.isNotEmpty) gaps[scale] = missing;
  }

  if (gaps.isEmpty) {
    print(
        '  ✓ scale coverage — ${scales.length} scales in all three artifacts');
    return;
  }
  for (final entry in gaps.entries) {
    _errors.add(
      '${entry.key} is never named in: ${entry.value.join(', ')}. Every scale '
      'ships with a README line, an example section and a demo page.',
    );
  }
}

/// Every `abstract final class M3Xs` whose body publishes a `values` list.
///
/// The `values` list is the house marker of a real, enumerable token scale —
/// helper classes and namespaces do not have one.
Set<String> _publishedScales(Map<String, String> libSources) {
  final scales = <String>{};
  final declaration = RegExp(
    r'^abstract final class (M3E?\w+)',
    multiLine: true,
  );

  for (final source in libSources.values) {
    final matches = declaration.allMatches(source).toList();
    for (var i = 0; i < matches.length; i++) {
      final start = matches[i].end;
      final end = i + 1 < matches.length ? matches[i + 1].start : source.length;
      if (source.substring(start, end).contains('static const List<')) {
        scales.add(matches[i].group(1)!);
      }
    }
  }
  return scales;
}

// ─────────────────────────────────────────────────────────────────────────────
// 4. Dead API names in prose and UI strings
// ─────────────────────────────────────────────────────────────────────────────

void _checkDeadNames(
  Map<String, String> libSources,
  String readme,
  Map<String, String> demoSources,
) {
  final identifier = RegExp(r'\bM3E?[A-Z]\w*');
  final known = <String>{
    for (final source in libSources.values)
      ...identifier.allMatches(source).map((m) => m.group(0)!),
    // The demo declares its own M3-prefixed page widgets.
    for (final source in demoSources.values)
      ...RegExp(r'^class (M3E?\w+)', multiLine: true)
          .allMatches(source)
          .map((m) => m.group(1)!),
  };

  var dead = 0;

  void check(String where, Iterable<String> names) {
    for (final name in names.toSet()) {
      if (known.contains(name) || historicalNames.containsKey(name)) continue;
      dead++;
      _errors.add(
        '$where names "$name", which does not exist in lib/. Rename it, or '
        'record it in historicalNames with the reason it is mentioned.',
      );
    }
  }

  check('README.md', identifier.allMatches(readme).map((m) => m.group(0)!));

  // In the demo only string literals matter: everything else is code the
  // compiler already checks.
  final stringLiteral = RegExp(r"""(?:'([^'\n]*)'|"([^"\n]*)")""");
  for (final entry in demoSources.entries) {
    final literals = stringLiteral
        .allMatches(entry.value)
        .map((m) => m.group(1) ?? m.group(2) ?? '');
    for (final literal in literals) {
      check(entry.key, identifier.allMatches(literal).map((m) => m.group(0)!));
    }
  }

  if (dead == 0) {
    print('  ✓ no dead API names — ${known.length} live identifiers');
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Plumbing
// ─────────────────────────────────────────────────────────────────────────────

Map<String, String> _readAll(Directory dir) {
  final sources = <String, String>{};
  for (final entity in dir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      sources[entity.path] = entity.readAsStringSync();
    }
  }
  return sources;
}

void _report() {
  for (final warning in _warnings) {
    print('  ⚠ $warning');
  }
  if (_errors.isEmpty) {
    print(
      '\n✓ The triad holds: README ↔ example ↔ demo agree'
      '${_warnings.isEmpty ? '.' : ' (${_warnings.length} warning(s)).'}',
    );
    return;
  }
  print('\n✗ The triad has drifted:\n');
  for (final error in _errors) {
    print('  • $error\n');
  }
}
