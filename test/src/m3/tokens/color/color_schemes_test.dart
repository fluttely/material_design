import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

const _seed = Color(0xFF6750A4);

void main() {
  group('M3ContrastLevels', () {
    test('spec values', () {
      expect(M3ContrastLevels.reduced, -1.0);
      expect(M3ContrastLevels.standard, 0.0);
      expect(M3ContrastLevels.medium, 0.5);
      expect(M3ContrastLevels.high, 1.0);
    });

    test('values is ascending and complete', () {
      expect(M3ContrastLevels.values, [
        M3ContrastLevels.reduced,
        M3ContrastLevels.standard,
        M3ContrastLevels.medium,
        M3ContrastLevels.high,
      ]);
    });

    testWidgets('of() follows the platform high-contrast setting',
        (tester) async {
      late M3ContrastLevelValue standard;
      late M3ContrastLevelValue high;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(),
          child: Builder(
            builder: (context) {
              standard = M3ContrastLevels.of(context);
              return const SizedBox();
            },
          ),
        ),
      );
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(highContrast: true),
          child: Builder(
            builder: (context) {
              high = M3ContrastLevels.of(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(standard, M3ContrastLevels.standard);
      expect(high, M3ContrastLevels.high);
    });
  });

  group('M3SchemeVariant', () {
    test('covers every Flutter dynamic scheme variant', () {
      expect(
        M3SchemeVariant.values.length,
        DynamicSchemeVariant.values.length,
      );
      expect(
        M3SchemeVariant.values.map((v) => v.dynamicSchemeVariant).toSet(),
        DynamicSchemeVariant.values.toSet(),
      );
    });
  });

  group('M3ColorSchemes', () {
    test('fromSeed matches Flutter for the same inputs', () {
      expect(
        M3ColorSchemes.fromSeed(seedColor: _seed),
        ColorScheme.fromSeed(seedColor: _seed),
      );
    });

    test('variant changes the generated palette', () {
      final tonalSpot = M3ColorSchemes.fromSeed(seedColor: _seed);
      final monochrome = M3ColorSchemes.fromSeed(
        seedColor: _seed,
        variant: M3SchemeVariant.monochrome,
      );

      expect(tonalSpot.primary, isNot(monochrome.primary));
      // Monochrome has no chroma: primary is a pure grey.
      final hsl = HSLColor.fromColor(monochrome.primary);
      expect(hsl.saturation, closeTo(0, 0.01));
    });

    test('higher contrast separates content from its surface', () {
      double contrastOf(M3ContrastLevelValue level) {
        final scheme = M3ColorSchemes.fromSeed(
          seedColor: _seed,
          contrastLevel: level,
        );
        return M3ColorUtils.calculateContrast(
          scheme.onSurface,
          scheme.surface,
        );
      }

      expect(
        contrastOf(M3ContrastLevels.high),
        greaterThan(contrastOf(M3ContrastLevels.standard)),
      );
    });

    test('light and dark differ in brightness', () {
      expect(
          M3ColorSchemes.light(seedColor: _seed).brightness, Brightness.light);
      expect(M3ColorSchemes.dark(seedColor: _seed).brightness, Brightness.dark);
    });

    testWidgets('fromContext honours the ambient contrast setting',
        (tester) async {
      late ColorScheme scheme;
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(highContrast: true),
          child: Builder(
            builder: (context) {
              scheme = M3ColorSchemes.fromContext(context, seedColor: _seed);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(
        scheme,
        M3ColorSchemes.fromSeed(
          seedColor: _seed,
          contrastLevel: M3ContrastLevels.high,
        ),
      );
    });
  });

  group('M3ColorUtils.harmonize', () {
    test('moves the design hue toward the source', () {
      const red = Color(0xFFFF0000);
      const blue = Color(0xFF0000FF);
      final harmonized = M3ColorUtils.harmonize(red, blue);

      expect(harmonized, isNot(red));
      // The shift is bounded — it stays recognisably red, never becoming blue.
      expect(harmonized, isNot(blue));
      expect(harmonized.r, greaterThan(harmonized.b));
    });

    test('harmonizing with itself is a no-op', () {
      const color = Color(0xFF2E7D32);
      expect(M3ColorUtils.harmonize(color, color), color);
    });
  });

  group('M3ExtendedColor', () {
    test('derives the four roles at the spec tone stops', () {
      const source = Color(0xFF2E7D32);
      final palette = M3TonalPalette.fromColor(source);

      final light = M3ExtendedColor(
        name: 'success',
        source: source,
        brightness: Brightness.light,
      );
      expect(light.color, palette[M3Tones.t40]);
      expect(light.onColor, palette[M3Tones.t100]);
      expect(light.colorContainer, palette[M3Tones.t90]);
      expect(light.onColorContainer, palette[M3Tones.t10]);

      final dark = M3ExtendedColor(
        name: 'success',
        source: source,
        brightness: Brightness.dark,
      );
      expect(dark.color, palette[M3Tones.t80]);
      expect(dark.onColor, palette[M3Tones.t20]);
      expect(dark.colorContainer, palette[M3Tones.t30]);
      expect(dark.onColorContainer, palette[M3Tones.t90]);
    });

    test('harmonized shifts the source before deriving roles', () {
      const source = Color(0xFF2E7D32);
      final plain = M3ExtendedColor(
        name: 'success',
        source: source,
        brightness: Brightness.light,
      );
      final harmonized = M3ExtendedColor.harmonized(
        name: 'success',
        source: source,
        harmonizeWith: _seed,
        brightness: Brightness.light,
      );

      expect(harmonized.source, isNot(plain.source));
      expect(harmonized.color, isNot(plain.color));
    });

    testWidgets('M3ExtendedColors round-trips through the theme',
        (tester) async {
      final extension = M3ExtendedColors.of(
        const {'success': Color(0xFF2E7D32)},
        brightness: Brightness.light,
      );
      late M3ExtendedColors read;

      await tester.pumpWidget(
        MaterialApp(
          // `extension` is built at runtime, so the list cannot be const.
          // ignore: prefer_const_literals_to_create_immutables
          theme: ThemeData(extensions: <ThemeExtension<dynamic>>[extension]),
          home: Builder(
            builder: (context) {
              read = M3ExtendedColors.from(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(read['success'], extension['success']);
      expect(read['missing'], isNull);
    });

    testWidgets('from() degrades to empty when the extension is absent',
        (tester) async {
      late M3ExtendedColors read;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              read = M3ExtendedColors.from(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(read.colors, isEmpty);
    });
  });
}
