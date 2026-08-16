import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

/// The Material Symbols variable axes, added in 1.7.0.
///
/// Until then the package typed icon *size* only, so weight, grade, fill and
/// optical size were the one corner of the icon style where a raw double was
/// the only option.
void main() {
  group('M3IconWeights', () {
    test('spec values — the wght axis in 100 steps', () {
      expect(M3IconWeights.thin, 100);
      expect(M3IconWeights.extraLight, 200);
      expect(M3IconWeights.light, 300);
      expect(M3IconWeights.regular, 400);
      expect(M3IconWeights.medium, 500);
      expect(M3IconWeights.semiBold, 600);
      expect(M3IconWeights.bold, 700);
    });

    test('values is complete and ascending', () {
      expect(M3IconWeights.values, hasLength(7));
      for (var i = 1; i < M3IconWeights.values.length; i++) {
        expect(
          M3IconWeights.values[i],
          greaterThan(M3IconWeights.values[i - 1]),
        );
      }
    });

    test('regular matches the weight Flutter assumes when none is given', () {
      // Flutter's Icon leaves `weight` null, which the Material Symbols font
      // resolves to 400. A token that disagreed would silently restyle every
      // icon the moment a theme adopted it.
      expect(M3IconWeights.regular, 400);
    });
  });

  group('M3IconGrades', () {
    test('spec values', () {
      expect(M3IconGrades.onDark, -25);
      expect(M3IconGrades.normal, 0);
      expect(M3IconGrades.emphasis, 200);
    });

    test('values is complete and ascending', () {
      expect(M3IconGrades.values, [
        M3IconGrades.onDark,
        M3IconGrades.normal,
        M3IconGrades.emphasis,
      ]);
    });

    test('the dark-surface grade is the only negative one', () {
      expect(M3IconGrades.onDark, lessThan(0));
      expect(M3IconGrades.normal, isNonNegative);
      expect(M3IconGrades.emphasis, isPositive);
    });
  });

  group('M3IconFills', () {
    test('the axis runs 0 → 1', () {
      expect(M3IconFills.unfilled, 0);
      expect(M3IconFills.filled, 1);
      expect(M3IconFills.values, [M3IconFills.unfilled, M3IconFills.filled]);
    });
  });

  group('M3IconOpticalSizes', () {
    test('mirrors M3IconSizes one for one', () {
      expect(M3IconOpticalSizes.values, hasLength(M3IconSizes.values.length));
      for (var i = 0; i < M3IconSizes.values.length; i++) {
        expect(M3IconOpticalSizes.values[i], M3IconSizes.values[i]);
      }
    });

    test('forIconSize returns the size itself for every on-scale token', () {
      for (final size in M3IconSizes.values) {
        expect(M3IconOpticalSizes.forIconSize(size), size);
      }
    });

    test('forIconSize clamps an off-scale size into the 20–48 axis', () {
      expect(
        M3IconOpticalSizes.forIconSize(M3Contract.iconSize(14)),
        M3IconOpticalSizes.dense,
      );
      expect(
        M3IconOpticalSizes.forIconSize(M3Contract.iconSize(96)),
        M3IconOpticalSizes.extraLarge,
      );
      expect(M3IconOpticalSizes.forIconSize(M3Contract.iconSize(30)), 30);
    });
  });

  group('M3IconStyle', () {
    test('is an IconThemeData, so it drops into any Flutter icon slot', () {
      expect(M3IconStyle.standard, isA<IconThemeData>());
    });

    test('defaults are the M3 defaults', () {
      const style = M3IconStyle.standard;
      expect(style.size, M3IconSizes.standard);
      expect(style.weight, M3IconWeights.regular);
      expect(style.grade, M3IconGrades.normal);
      expect(style.fill, M3IconFills.unfilled);
    });

    test('optical size tracks the rendered size unless overridden', () {
      const medium = M3IconStyle(size: M3IconSizes.medium);
      expect(medium.opticalSize, M3IconOpticalSizes.medium);

      const pinned = M3IconStyle(
        size: M3IconSizes.extraLarge,
        opticalSize: M3IconOpticalSizes.standard,
      );
      expect(pinned.opticalSize, M3IconOpticalSizes.standard);
    });

    test('presets', () {
      expect(M3IconStyle.dense.size, M3IconSizes.dense);
      expect(M3IconStyle.selected.fill, M3IconFills.filled);
      expect(M3IconStyle.onDarkSurface.grade, M3IconGrades.onDark);
      expect(M3IconStyle.disabled.opacity, M3Opacities.disabledContent);
    });

    testWidgets('carries no color, so IconTheme.merge keeps the inherited one',
        (tester) async {
      // Regression: an IconThemeData with a null color drops Icon to its black
      // fallback. A bare `IconTheme(data: M3IconStyle(...))` therefore blacks
      // out every icon under it — in dark mode most visibly. `merge` is the
      // form that restyles the axes and leaves the color role alone.
      expect(M3IconStyle.standard.color, isNull);

      await tester.pumpWidget(
        MaterialApp(
          home: IconTheme(
            data: const IconThemeData(color: Color(0xFF00FF00)),
            child: IconTheme.merge(
              data: const M3IconStyle(weight: M3IconWeights.bold),
              child: const Icon(Icons.star),
            ),
          ),
        ),
      );

      final style = tester
          .renderObject<RenderParagraph>(find.byType(RichText))
          .text
          .style;
      expect(style?.color, const Color(0xFF00FF00));
      expect(
        style?.fontVariations,
        contains(const FontVariation('wght', 700)),
      );
    });

    testWidgets('reaches the Icon through IconTheme', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: IconTheme(
            data: M3IconStyle(
              size: M3IconSizes.large,
              weight: M3IconWeights.bold,
              fill: M3IconFills.filled,
            ),
            child: Icon(Icons.star),
          ),
        ),
      );

      final icon = tester.renderObject<RenderParagraph>(
        find.byType(RichText),
      );
      expect(icon.text.style?.fontSize, M3IconSizes.large);
      expect(
        icon.text.style?.fontVariations,
        containsAll(<FontVariation>[
          const FontVariation('FILL', 1),
          const FontVariation('wght', 700),
          const FontVariation('opsz', 40),
        ]),
      );
    });
  });
}
