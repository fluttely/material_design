import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  // The canonical Material Design 3 baseline seed.
  const seed = Color(0xFF6750A4);

  group('M3Tones', () {
    test('has the 13 M3 tone stops in ascending order', () {
      expect(M3Tones.values, hasLength(13));
      expect(
        M3Tones.values,
        orderedEquals(
            <int>[0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 95, 99, 100]),
      );
    });
  });

  group('M3TonalPalette', () {
    test('tone 0 is black and tone 100 is white', () {
      final palette = M3TonalPalette.fromSeed(seed);
      expect(palette[M3Tones.t0], const Color(0xFF000000));
      expect(palette[M3Tones.t100], const Color(0xFFFFFFFF));
    });

    test('lightness increases monotonically with tone', () {
      final palette = M3TonalPalette.fromSeed(seed);
      var previous = -1.0;
      for (final tone in M3Tones.values) {
        final luminance = palette[tone].computeLuminance();
        expect(
          luminance,
          greaterThan(previous),
          reason: 'tone $tone should be lighter than the tone below it',
        );
        previous = luminance;
      }
    });

    test('tone 40 reproduces the Material baseline primary', () {
      // The M3 baseline scheme is generated from this seed, and its light
      // `primary` is tone 40 of the primary palette.
      final palette = M3TonalPalette.fromSeed(seed);
      expect(palette[M3Tones.t40], const Color(0xFF6750A4));
    });

    test('fromColor preserves the source hue', () {
      final palette = M3TonalPalette.fromColor(seed);
      final atSeedTone = HSLColor.fromColor(palette[M3Tones.t40]);
      final original = HSLColor.fromColor(seed);
      expect((atSeedTone.hue - original.hue).abs(), lessThan(15));
    });

    test('tones returns one color per stop', () {
      expect(M3TonalPalette.fromSeed(seed).tones, hasLength(13));
    });

    test('of() builds a palette from raw hue and chroma', () {
      final palette = M3TonalPalette.of(hue: 270, chroma: 48);
      expect(palette[M3Tones.t0], const Color(0xFF000000));
      expect(palette[M3Tones.t50], isA<Color>());
    });

    test('equal inputs produce equal palettes', () {
      expect(M3TonalPalette.fromSeed(seed), M3TonalPalette.fromSeed(seed));
    });
  });

  group('M3CorePalette', () {
    test('exposes the six palettes M3 derives from a seed', () {
      final core = M3CorePalette.fromSeed(seed);
      expect(core.values, hasLength(6));
      for (final palette in core.values) {
        expect(palette[M3Tones.t0], const Color(0xFF000000));
        expect(palette[M3Tones.t100], const Color(0xFFFFFFFF));
      }
    });

    test('neutral is less saturated than primary', () {
      final core = M3CorePalette.fromSeed(seed);
      final neutral = HSLColor.fromColor(core.neutral[M3Tones.t40]);
      final primary = HSLColor.fromColor(core.primary[M3Tones.t40]);
      expect(neutral.saturation, lessThan(primary.saturation));
    });

    test('error palette is red regardless of seed', () {
      final fromPurple = M3CorePalette.fromSeed(seed).error[M3Tones.t40];
      final fromGreen =
          M3CorePalette.fromSeed(const Color(0xFF00FF00)).error[M3Tones.t40];
      expect(fromPurple, fromGreen);
    });
  });
}
