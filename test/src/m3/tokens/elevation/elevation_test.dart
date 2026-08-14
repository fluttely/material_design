import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3Elevation', () {
    test('has the six M3 levels with their spec dp values', () {
      expect(M3Elevation.values, hasLength(6));
      expect(
        M3Elevation.values.map((e) => e.dp),
        orderedEquals(<double>[0, 1, 3, 6, 8, 12]),
      );
    });

    test('shadow count grows with elevation', () {
      expect(M3Elevation.level0.shadows, isEmpty);
      expect(M3Elevation.level1.shadows, hasLength(1));
      for (final level in M3Elevation.values.skip(2)) {
        expect(level.shadows, hasLength(2), reason: '$level');
      }
    });

    test('fromValue snaps a raw dp to the nearest level at or below it', () {
      expect(M3Elevation.fromValue(0), M3Elevation.level0);
      expect(M3Elevation.fromValue(0.5), M3Elevation.level0);
      expect(M3Elevation.fromValue(1), M3Elevation.level1);
      expect(M3Elevation.fromValue(2.9), M3Elevation.level1);
      expect(M3Elevation.fromValue(3), M3Elevation.level2);
      expect(M3Elevation.fromValue(6), M3Elevation.level3);
      expect(M3Elevation.fromValue(8), M3Elevation.level4);
      expect(M3Elevation.fromValue(12), M3Elevation.level5);
      expect(M3Elevation.fromValue(99), M3Elevation.level5);
    });

    test('every level round-trips through fromValue', () {
      for (final level in M3Elevation.values) {
        expect(M3Elevation.fromValue(level.dp), level);
      }
    });

    test('comparison helpers order by dp', () {
      expect(M3Elevation.level3.isHigherThan(M3Elevation.level1), isTrue);
      expect(M3Elevation.level1.isLowerThan(M3Elevation.level3), isTrue);
      expect(M3Elevation.level3.differenceFrom(M3Elevation.level1), 5);
    });
  });

  group('surface tinting', () {
    testWidgets('higher elevation produces a more tinted surface',
        (tester) async {
      late List<Color> surfaces;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: Builder(
            builder: (context) {
              surfaces = M3Elevation.values
                  .map((e) => e.surfaceColor(context))
                  .toList();
              return const SizedBox();
            },
          ),
        ),
      );

      // level0 is the untinted surface; every level above must differ from it.
      for (final surface in surfaces.skip(1)) {
        expect(surface, isNot(surfaces.first));
      }
    });

    test('calculateSurfaceColor leaves level0 untouched', () {
      const surface = Color(0xFFFFFBFE);
      expect(
        M3Elevation.level0.calculateSurfaceColor(
          surface: surface,
          surfaceTint: const Color(0xFF6750A4),
        ),
        surface,
      );
    });
  });
}
