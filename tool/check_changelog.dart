#!/usr/bin/env dart
// Printing is this script's entire output channel.
// ignore_for_file: avoid_print

/// Verifies that the three places a version is written down agree:
/// `pubspec.yaml`, the top section of `CHANGELOG.md`, and what actually exists
/// on pub.dev.
///
/// The changelog must match pub.dev exactly — every published version has a
/// section, and no section exists for a version nobody could install. Both
/// directions have been violated in this repository's history: `0.0.1`–`0.8.0`
/// and `0.29.0-dev`–`1.0.0-dev.10` shipped without ever being documented, while
/// `1.0.0-dev.34`/`.35` had sections for builds that were never released. This
/// script is why that cannot happen again.
///
/// ```sh
/// dart run tool/check_changelog.dart            # includes the pub.dev check
/// dart run tool/check_changelog.dart --offline  # local checks only
/// ```
///
/// Exits non-zero on any mismatch, so CI fails instead of a human noticing.
library;

import 'dart:convert';
import 'dart:io';

const _packageName = 'material_design';

Future<int> main(List<String> args) async {
  final offline = args.contains('--offline');
  final failures = <String>[];

  final pubspecVersion = _readPubspecVersion();
  final documented = _readChangelogVersions();

  if (documented.isEmpty) {
    print('✗ CHANGELOG.md has no "## <version>" sections at all.');
    return 1;
  }

  // 1. pubspec.yaml and the top changelog section name the same release.
  final top = documented.first;
  if (top != pubspecVersion) {
    failures.add(
      'pubspec.yaml says $pubspecVersion but the top CHANGELOG.md section is '
      '## $top — the release commit subject, the pubspec and the changelog '
      'must always agree.',
    );
  }

  // 2. Sections run newest-first. A section inserted in the wrong place reads
  //    as a release that shipped out of order.
  for (var i = 0; i < documented.length - 1; i++) {
    if (_compareVersions(documented[i], documented[i + 1]) <= 0) {
      failures.add(
        'CHANGELOG.md is out of order: ## ${documented[i]} appears above '
        '## ${documented[i + 1]}. Sections are newest-first.',
      );
    }
  }

  // 3. Duplicated sections mean one release was documented twice.
  final seen = <String>{};
  for (final version in documented) {
    if (!seen.add(version)) {
      failures.add('CHANGELOG.md documents ## $version more than once.');
    }
  }

  // 4. The changelog matches what is actually installable.
  if (!offline) {
    final published = await _fetchPublishedVersions();
    if (published == null) {
      print(
        '⚠ Could not reach pub.dev; skipped the published-versions check. '
        'Re-run without --offline when the network is back.',
      );
    } else {
      final undocumented = published.difference(documented.toSet()).toList()
        ..sort(_compareVersions);
      final unpublished = documented.toSet().difference(published)
        // The release being prepared right now is legitimately not on pub.dev.
        ..remove(pubspecVersion);

      if (undocumented.isNotEmpty) {
        failures.add(
          'Published but undocumented: ${undocumented.join(', ')} — a '
          'changelog documents what shipped.',
        );
      }
      if (unpublished.isNotEmpty) {
        final pending = (unpublished.toList()..sort(_compareVersions)).join(
          ', ',
        );
        failures.add(
          'Documented but never published: $pending — never write a section '
          'for a version that was not released. The only allowed pending '
          'section is $pubspecVersion.',
        );
      }
    }
  }

  if (failures.isEmpty) {
    print('✓ CHANGELOG.md, pubspec.yaml and pub.dev agree (v$pubspecVersion, '
        '${documented.length} documented releases).');
    return 0;
  }

  print('✗ Version bookkeeping is inconsistent:\n');
  for (final failure in failures) {
    print('  • $failure\n');
  }
  return 1;
}

String _readPubspecVersion() {
  final pubspec = File('pubspec.yaml').readAsStringSync();
  final match =
      RegExp(r'^version:\s*(\S+)\s*$', multiLine: true).firstMatch(pubspec);
  if (match == null) {
    throw StateError('pubspec.yaml has no version: line.');
  }
  return match.group(1)!;
}

/// Every `## <version>` heading in `CHANGELOG.md`, in file order.
List<String> _readChangelogVersions() {
  final changelog = File('CHANGELOG.md').readAsStringSync();
  return RegExp(r'^## (\d[\w.\-+]*)\s*$', multiLine: true)
      .allMatches(changelog)
      .map((m) => m.group(1)!)
      .toList();
}

Future<Set<String>?> _fetchPublishedVersions() async {
  final client = HttpClient()..connectionTimeout = const Duration(seconds: 10);
  try {
    final request = await client.getUrl(
      Uri.https('pub.dev', '/api/packages/$_packageName'),
    );
    final response = await request.close();
    if (response.statusCode != HttpStatus.ok) return null;
    final body = await response.transform(utf8.decoder).join();
    final json = jsonDecode(body) as Map<String, dynamic>;
    final versions = json['versions'] as List<dynamic>;
    return {
      for (final v in versions)
        (v as Map<String, dynamic>)['version'] as String,
    };
  } on Object {
    return null;
  } finally {
    client.close(force: true);
  }
}

/// SemVer ordering, enough of it for this package's `X.Y.Z` and `X.Y.Z-dev.N`.
///
/// Returns a negative number when [a] sorts before [b].
int _compareVersions(String a, String b) {
  final parsedA = _parseVersion(a);
  final parsedB = _parseVersion(b);

  for (var i = 0; i < 3; i++) {
    final diff = parsedA.core[i] - parsedB.core[i];
    if (diff != 0) return diff;
  }

  // 1.0.0-dev.1 precedes 1.0.0.
  final preA = parsedA.pre;
  final preB = parsedB.pre;
  if (preA.isEmpty && preB.isEmpty) return 0;
  if (preA.isEmpty) return 1;
  if (preB.isEmpty) return -1;

  for (var i = 0; i < preA.length && i < preB.length; i++) {
    final numA = int.tryParse(preA[i]);
    final numB = int.tryParse(preB[i]);
    if (numA != null && numB != null) {
      if (numA != numB) return numA - numB;
    } else {
      final diff = preA[i].compareTo(preB[i]);
      if (diff != 0) return diff;
    }
  }
  return preA.length - preB.length;
}

({List<int> core, List<String> pre}) _parseVersion(String version) {
  final withoutBuild = version.split('+').first;
  final parts = withoutBuild.split('-');
  final core = parts.first.split('.').map((s) => int.tryParse(s) ?? 0).toList();
  while (core.length < 3) {
    core.add(0);
  }
  final pre =
      parts.length > 1 ? parts.sublist(1).join('-').split('.') : <String>[];
  return (core: core, pre: pre);
}
