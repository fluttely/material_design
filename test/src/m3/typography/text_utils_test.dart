import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3TypeScale', () {
    test('every style carries a size and a proportional line height', () {
      const styles = <TextStyle>[
        M3TypeScale.displayLarge,
        M3TypeScale.displayMedium,
        M3TypeScale.displaySmall,
        M3TypeScale.headlineLarge,
        M3TypeScale.headlineMedium,
        M3TypeScale.headlineSmall,
        M3TypeScale.titleLarge,
        M3TypeScale.titleMedium,
        M3TypeScale.titleSmall,
        M3TypeScale.bodyLarge,
        M3TypeScale.bodyMedium,
        M3TypeScale.bodySmall,
        M3TypeScale.labelLarge,
        M3TypeScale.labelMedium,
        M3TypeScale.labelSmall,
      ];

      expect(styles, hasLength(15));
      for (final style in styles) {
        expect(style.fontSize, isNotNull);
        expect(style.fontWeight, isNotNull);
        expect(style.height, greaterThan(1.0));
      }
    });

    test('bodyLarge matches the M3 spec exactly', () {
      expect(M3TypeScale.bodyLarge.fontSize, 16);
      expect(M3TypeScale.bodyLarge.height, closeTo(24 / 16, 1e-9));
      expect(M3TypeScale.bodyLarge.fontWeight, FontWeight.w400);
    });
  });

  group('M3TextTheme.applyToTheme', () {
    ThemeData themeFor(Brightness brightness) => M3TextTheme.applyToTheme(
          ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF6750A4),
              brightness: brightness,
            ),
          ),
        );

    test('keeps the theme colors and applies the scale metrics', () {
      final light = themeFor(Brightness.light).textTheme;
      final dark = themeFor(Brightness.dark).textTheme;

      // A null color paints as black, so a dark theme would be unreadable.
      expect(light.bodyMedium?.color, isNotNull);
      expect(dark.bodyMedium?.color, isNotNull);
      expect(dark.bodyMedium?.color, isNot(light.bodyMedium?.color));

      expect(dark.bodyMedium?.fontSize, M3TypeScale.bodyMedium.fontSize);
      expect(
        dark.bodyMedium?.letterSpacing,
        M3TypeScale.bodyMedium.letterSpacing,
      );
      expect(dark.displayLarge?.fontSize, M3TypeScale.displayLarge.fontSize);
    });

    testWidgets('dark theme renders body text light, not black',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: themeFor(Brightness.dark),
          home: const Scaffold(body: Text('Spacing uses a 4dp base unit.')),
        ),
      );

      final rendered = tester.widget<RichText>(find.byType(RichText));
      final color = rendered.text.style?.color;

      expect(color, isNotNull);
      expect(color, isNot(const Color(0xFF000000)));
      // Light-on-dark: the resolved color must be bright.
      expect(color!.computeLuminance(), greaterThan(0.5));
    });
  });

  group('M3TextUtils.clampedScaler', () {
    testWidgets('caps the user scale factor without touching the style',
        (tester) async {
      late TextScaler scaler;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(3)),
          child: Builder(
            builder: (context) {
              scaler = M3TextUtils.clampedScaler(context, maxScaleFactor: 1.5);
              return const SizedBox();
            },
          ),
        ),
      );

      // 16sp at a clamped 1.5x is 24sp — and the style's own `height`
      // multiplier still applies on top, so the line grows with the text.
      expect(scaler.scale(16), 24);
    });

    testWidgets('leaves scaling below the cap untouched', (tester) async {
      late TextScaler scaler;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(1.2)),
          child: Builder(
            builder: (context) {
              scaler = M3TextUtils.clampedScaler(context, maxScaleFactor: 2);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(scaler.scale(10), closeTo(12, 1e-9));
    });
  });

  group('M3TextUtils transforms', () {
    test('dyslexiaFriendly opens spacing and line height', () {
      const base = M3TypeScale.bodyLarge;
      final adjusted = M3TextUtils.dyslexiaFriendly(base);

      expect(adjusted.letterSpacing, greaterThan(base.letterSpacing ?? 0));
      expect(adjusted.height, greaterThanOrEqualTo(1.6));
      expect(adjusted.fontSize, base.fontSize);
    });

    test('highContrast bumps weight by one step and saturates at w900', () {
      expect(
        M3TextUtils.highContrast(
          const TextStyle(fontWeight: FontWeight.w400),
        ).fontWeight,
        FontWeight.w500,
      );
      expect(
        M3TextUtils.highContrast(
          const TextStyle(fontWeight: FontWeight.w900),
        ).fontWeight,
        FontWeight.w900,
      );
    });

    test('highContrast steps up from a weight between the named ones', () {
      // FontWeight(450) is legal since Flutter 3.41, and lerp produces it
      // there (a named weight before). Looking it up in FontWeight.values
      // missed, and the miss resolved to w100 — thinner, not bolder.
      final between = FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5);
      final bolder = M3TextUtils.highContrast(TextStyle(fontWeight: between));

      expect(bolder.fontWeight!.value, greaterThan(between!.value));
      expect(FontWeight.values, contains(bolder.fontWeight));
    });

    group('withWeightAxis', () {
      double? wght(TextStyle style) => style.fontVariations
          ?.where((v) => v.axis == 'wght')
          .map((v) => v.value)
          .singleOrNull;

      test('carries every scale weight onto the axis, and nothing else', () {
        for (final style in [
          ...M3TypeScale.values,
          ...M3EmphasizedTypeScale.values,
        ]) {
          final axis = M3TextUtils.withWeightAxis(style);
          expect(wght(axis), style.fontWeight!.value);
          expect(axis.fontSize, style.fontSize);
          expect(axis.height, style.height);
          expect(axis.letterSpacing, style.letterSpacing);
          expect(axis.fontWeight, style.fontWeight);
        }
      });

      test('keeps other axes and replaces an existing wght in place', () {
        final axis = M3TextUtils.withWeightAxis(
          M3TypeScale.titleMedium.copyWith(
            fontVariations: const [
              FontVariation('GRAD', -25),
              FontVariation('wght', 300),
              FontVariation('wdth', 90),
            ],
          ),
        );

        expect(
          axis.fontVariations!.map((v) => v.axis),
          ['GRAD', 'wght', 'wdth'],
        );
        expect(wght(axis), 500);
      });

      test('is idempotent', () {
        final once = M3TextUtils.withWeightAxis(M3TypeScale.bodyLarge);
        expect(M3TextUtils.withWeightAxis(once), once);
      });

      test('leaves a style without a weight alone', () {
        const style = TextStyle(fontSize: 14);
        expect(M3TextUtils.withWeightAxis(style), same(style));
      });

      test('highContrast and dyslexiaFriendly move the axis with the weight',
          () {
        final axis = M3TextUtils.withWeightAxis(M3TypeScale.bodyMedium);

        // A stale 400 would override the new FontWeight on a variable font.
        expect(wght(M3TextUtils.highContrast(axis)), 500);
        expect(wght(M3TextUtils.dyslexiaFriendly(axis)), 500);
        // A style that never had the axis does not grow one.
        expect(
          M3TextUtils.highContrast(M3TypeScale.bodyMedium).fontVariations,
          isNull,
        );
      });

      test('textThemeWithWeightAxis covers all fifteen roles', () {
        final theme = M3TextUtils.textThemeWithWeightAxis(
          M3TextTheme.toTextTheme(),
        );
        final styles = [
          theme.displayLarge,
          theme.displayMedium,
          theme.displaySmall,
          theme.headlineLarge,
          theme.headlineMedium,
          theme.headlineSmall,
          theme.titleLarge,
          theme.titleMedium,
          theme.titleSmall,
          theme.bodyLarge,
          theme.bodyMedium,
          theme.bodySmall,
          theme.labelLarge,
          theme.labelMedium,
          theme.labelSmall,
        ];

        for (final (i, style) in styles.indexed) {
          expect(wght(style!), M3TypeScale.values[i].fontWeight!.value);
        }
      });

      test('an emphasis transition animates the axis', () {
        // Same axes in the same order, so TextStyle.lerp interpolates the
        // weight continuously instead of snapping at t = 0.5.
        final from = M3TextUtils.withWeightAxis(M3TypeScale.titleMedium);
        final to = M3TextUtils.withWeightAxis(
          M3EmphasizedTypeScale.titleMedium,
        );
        expect(wght(TextStyle.lerp(from, to, 0.25)!), closeTo(550, 1e-9));
      });
    });

    test('mono swaps the family and zeroes tracking', () {
      final mono = M3TextUtils.mono(M3TypeScale.bodyMedium);
      expect(mono.fontFamily, 'Roboto Mono');
      expect(mono.letterSpacing, 0);
      expect(mono.fontFamilyFallback, contains('monospace'));
    });

    test('withFontFamily keeps a system fallback stack', () {
      final styled = M3TextUtils.withFontFamily(
        base: M3TypeScale.bodyLarge,
        fontFamily: 'Inter',
      );
      expect(styled.fontFamily, 'Inter');
      expect(styled.fontFamilyFallback, isNotEmpty);
    });

    testWidgets('responsiveDisplay grows with the window', (tester) async {
      late TextStyle style;

      Future<void> pumpAt(double width) async {
        await tester.pumpWidget(
          MediaQuery(
            data: MediaQueryData(size: Size(width, 800)),
            child: Builder(
              builder: (context) {
                style = M3TextUtils.responsiveDisplay(context);
                return const SizedBox();
              },
            ),
          ),
        );
      }

      await pumpAt(400);
      expect(style.fontSize, M3TypeScale.displaySmall.fontSize);

      await pumpAt(900);
      expect(style.fontSize, M3TypeScale.displayMedium.fontSize);

      await pumpAt(1400);
      expect(style.fontSize, M3TypeScale.displayLarge.fontSize);
    });
  });
}
