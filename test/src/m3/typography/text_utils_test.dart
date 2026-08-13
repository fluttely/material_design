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
