import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3ColorUtils', () {
    group('Color Manipulation', () {
      test('blendColors blends two colors correctly', () {
        const color1 = Colors.red;
        const color2 = Colors.blue;
        final blended = M3ColorUtils.blendColors(color1, color2, 0.5);

        expect(blended, isA<Color>());
        expect(blended, isNot(equals(color1)));
        expect(blended, isNot(equals(color2)));
      });

      test('lighten makes color lighter', () {
        const darkColor = Color(0xFF333333);
        final lightenedColor = M3ColorUtils.lighten(darkColor, 0.3);

        expect(lightenedColor.computeLuminance(),
            greaterThan(darkColor.computeLuminance()));
      });

      test('darken makes color darker', () {
        const lightColor = Color(0xFFCCCCCC);
        final darkenedColor = M3ColorUtils.darken(lightColor, 0.3);

        expect(darkenedColor.computeLuminance(),
            lessThan(lightColor.computeLuminance()));
      });

      test('saturate increases saturation', () {
        const grayColor = Color(0xFF888888);
        final saturatedColor = M3ColorUtils.saturate(grayColor, 0.5);

        final originalHsl = HSLColor.fromColor(grayColor);
        final saturatedHsl = HSLColor.fromColor(saturatedColor);

        expect(saturatedHsl.saturation, greaterThan(originalHsl.saturation));
      });

      test('desaturate decreases saturation', () {
        const colorfulColor = Colors.red;
        final desaturatedColor = M3ColorUtils.desaturate(colorfulColor, 0.3);

        final originalHsl = HSLColor.fromColor(colorfulColor);
        final desaturatedHsl = HSLColor.fromColor(desaturatedColor);

        expect(desaturatedHsl.saturation, lessThan(originalHsl.saturation));
      });

      test('color manipulation methods clamp values correctly', () {
        const color = Colors.white;

        // Should not exceed 1.0 lightness
        final overlightened = M3ColorUtils.lighten(color, 2);
        expect(overlightened, equals(Colors.white));

        // Should not go below 0.0 lightness
        const darkColor = Colors.black;
        final overdarkened = M3ColorUtils.darken(darkColor, 2);
        expect(overdarkened, equals(Colors.black));
      });
    });

    group('State Colors', () {
      test('hover creates darker overlay', () {
        const baseColor = Colors.blue;
        final hoverColor = M3ColorUtils.hover(baseColor);

        expect(hoverColor, isA<Color>());
        expect(hoverColor.computeLuminance(),
            lessThan(baseColor.computeLuminance()));
      });

      test('pressed creates darker overlay than hover', () {
        const baseColor = Colors.blue;
        final hoverColor = M3ColorUtils.hover(baseColor);
        final pressedColor = M3ColorUtils.pressed(baseColor);

        expect(pressedColor.computeLuminance(),
            lessThan(hoverColor.computeLuminance()));
      });

      test('focused creates overlay with custom opacity', () {
        const baseColor = Colors.green;
        final focusedColor = M3ColorUtils.focused(baseColor, opacity: 0.2);

        expect(focusedColor, isA<Color>());
        expect(focusedColor, isNot(equals(baseColor)));
      });

      test('disabled reduces alpha', () {
        const baseColor = Colors.red;
        final disabledColor = M3ColorUtils.disabled(baseColor);

        expect((disabledColor.a * 255.0).round() & 0xff,
            lessThan((baseColor.a * 255.0).round() & 0xff));
      });

      test('dragged creates overlay with correct opacity', () {
        const baseColor = Colors.purple;
        final draggedColor = M3ColorUtils.dragged(baseColor);

        expect(draggedColor, isA<Color>());
        expect(draggedColor.computeLuminance(),
            lessThan(baseColor.computeLuminance()));
      });
    });

    group('Accessibility', () {
      test('calculateContrast returns correct ratio', () {
        const black = Colors.black;
        const white = Colors.white;

        final contrast = M3ColorUtils.calculateContrast(black, white);
        expect(contrast, equals(21.0));

        final sameColorContrast = M3ColorUtils.calculateContrast(black, black);
        expect(sameColorContrast, equals(1.0));
      });

      test('meetsWCAGAA checks 4.5:1 ratio correctly', () {
        const black = Colors.black;
        const white = Colors.white;
        const gray = Color(0xFF777777);

        expect(M3ColorUtils.meetsWCAGAA(black, white), isTrue);
        expect(M3ColorUtils.meetsWCAGAA(gray, gray), isFalse);
      });

      test('meetsWCAGAAA checks 7:1 ratio correctly', () {
        const black = Colors.black;
        const white = Colors.white;
        const lightGray = Color(0xFFAAAAAA);

        expect(M3ColorUtils.meetsWCAGAAA(black, white), isTrue);
        expect(M3ColorUtils.meetsWCAGAAA(lightGray, white), isFalse);
      });

      test('meetsLargeTextAA checks 3:1 ratio correctly', () {
        const black = Colors.black;
        const white = Colors.white;
        const mediumGray = Color(0xFF999999);

        expect(M3ColorUtils.meetsLargeTextAA(black, white), isTrue);
        expect(M3ColorUtils.meetsLargeTextAA(black, mediumGray), isTrue);
      });

      test('adjustForAccessibility improves contrast', () {
        const background = Colors.white;
        const poorContrast = Color(0xFFCCCCCC);

        final adjusted = M3ColorUtils.adjustForAccessibility(
          poorContrast,
          background,
        );

        final originalContrast = M3ColorUtils.calculateContrast(
          poorContrast,
          background,
        );
        final adjustedContrast = M3ColorUtils.calculateContrast(
          adjusted,
          background,
        );

        expect(adjustedContrast, greaterThan(originalContrast));
        expect(adjustedContrast, greaterThan(4.0));
      });

      test('adjustForAccessibility respects custom minimum contrast', () {
        const background = Colors.black;
        const color = Color(0xFF333333);

        final adjusted = M3ColorUtils.adjustForAccessibility(
          color,
          background,
          minContrast: 7,
        );

        final adjustedContrast = M3ColorUtils.calculateContrast(
          adjusted,
          background,
        );

        expect(adjustedContrast, greaterThan(6.0));
      });
    });

    group('Color Generation', () {
      test('generateHarmoniousColors returns 5 colors', () {
        const baseColor = Colors.blue;
        final harmonious = M3ColorUtils.generateHarmoniousColors(baseColor);

        expect(harmonious, hasLength(5));
        for (final color in harmonious) {
          expect(color, isA<Color>());
        }
      });

      test('createTonalPalette returns correct tonal values', () {
        const sourceColor = Colors.red;
        final palette = M3ColorUtils.createTonalPalette(sourceColor);

        expect(palette, hasLength(13));
        expect(palette[0], equals(Colors.black));
        expect(palette[100], equals(Colors.white));
        expect(palette.keys, contains(50));
        expect(palette.keys, contains(95));
      });

      test('isLight correctly identifies light colors', () {
        expect(M3ColorUtils.isLight(Colors.white), isTrue);
        expect(M3ColorUtils.isLight(Colors.black), isFalse);
        expect(M3ColorUtils.isLight(Colors.yellow), isTrue);
        expect(M3ColorUtils.isLight(Colors.blue), isFalse);
      });

      test('getTextColor returns appropriate contrast color', () {
        expect(M3ColorUtils.getTextColor(Colors.white), equals(Colors.black));
        expect(M3ColorUtils.getTextColor(Colors.black), equals(Colors.white));
        expect(M3ColorUtils.getTextColor(Colors.yellow), equals(Colors.black));
      });
    });

    group('Edge Cases', () {
      test('handles transparent colors', () {
        const transparent = Colors.transparent;
        final lightened = M3ColorUtils.lighten(transparent, 0.5);
        expect(lightened, isA<Color>());
      });

      test('handles extreme values', () {
        const color = Colors.red;

        // Test extreme lightening/darkening
        final extremeLight = M3ColorUtils.lighten(color, 10);
        final extremeDark = M3ColorUtils.darken(color, 10);

        expect(extremeLight, isA<Color>());
        expect(extremeDark, isA<Color>());
      });

      test('blendColors handles edge ratios', () {
        const color1 = Colors.red;
        const color2 = Colors.blue;

        final blend0 = M3ColorUtils.blendColors(color1, color2, 0);
        final blend1 = M3ColorUtils.blendColors(color1, color2, 1);

        expect(blend0, isA<Color>());
        expect(blend1, isA<Color>());
      });
    });
  });
}
