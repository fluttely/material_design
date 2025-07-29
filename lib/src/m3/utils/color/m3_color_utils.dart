part of '../../../../../material_design.dart';

/// Utility functions for working with Material Design 3 colors.
///
/// Provides color manipulation, accessibility checking, and state color
/// calculations according to Material Design 3 specifications.
@immutable
abstract interface class M3ColorUtils {
  // --- Color Manipulation ---

  /// Blends two colors together with a given ratio.
  static Color blendColors(Color color1, Color color2, double ratio) {
    return Color.lerp(color1, color2, ratio) ?? color1;
  }

  /// Lightens a color by the specified amount.
  static Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Darkens a color by the specified amount.
  static Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Increases the saturation of a color.
  static Color saturate(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withSaturation((hsl.saturation + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Decreases the saturation of a color.
  static Color desaturate(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withSaturation((hsl.saturation - amount).clamp(0.0, 1.0))
        .toColor();
  }

  // --- State Colors ---

  /// Creates a hover state overlay color.
  static Color hover(Color baseColor, {double opacity = 0.08}) {
    return Color.alphaBlend(
      Colors.black.withValues(alpha: opacity),
      baseColor,
    );
  }

  /// Creates a pressed state overlay color.
  static Color pressed(Color baseColor, {double opacity = 0.12}) {
    return Color.alphaBlend(
      Colors.black.withValues(alpha: opacity),
      baseColor,
    );
  }

  /// Creates a focused state overlay color.
  static Color focused(Color baseColor, {double opacity = 0.12}) {
    return Color.alphaBlend(
      Colors.black.withValues(alpha: opacity),
      baseColor,
    );
  }

  /// Creates a disabled state color.
  static Color disabled(Color baseColor, {double opacity = 0.38}) {
    return baseColor.withValues(alpha: opacity);
  }

  /// Creates a dragged state overlay color.
  static Color dragged(Color baseColor, {double opacity = 0.16}) {
    return Color.alphaBlend(
      Colors.black.withValues(alpha: opacity),
      baseColor,
    );
  }

  // --- Accessibility ---

  /// Calculates the contrast ratio between two colors.
  ///
  /// Returns a value between 1 and 21, where higher values indicate
  /// better contrast for accessibility.
  static double calculateContrast(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();

    final lighter = math.max(luminance1, luminance2);
    final darker = math.min(luminance1, luminance2);

    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Checks if two colors meet WCAG AA accessibility standards (4.5:1 ratio).
  static bool meetsWCAGAA(Color foreground, Color background) {
    return calculateContrast(foreground, background) >= 4.5;
  }

  /// Checks if two colors meet WCAG AAA accessibility standards (7:1 ratio).
  static bool meetsWCAGAAA(Color foreground, Color background) {
    return calculateContrast(foreground, background) >= 7.0;
  }

  /// Checks if two colors meet WCAG AA standards for large text (3:1 ratio).
  static bool meetsLargeTextAA(Color foreground, Color background) {
    return calculateContrast(foreground, background) >= 3.0;
  }

  /// Adjusts a color to meet minimum contrast requirements against a
  /// background.
  static Color adjustForAccessibility(
    Color color,
    Color background, {
    double minContrast = 4.5,
  }) {
    final currentContrast = calculateContrast(color, background);

    if (currentContrast >= minContrast) {
      return color; // Already meets requirements
    }

    final hsl = HSLColor.fromColor(color);
    final backgroundLuminance = background.computeLuminance();

    // Determine if we should make the color lighter or darker
    final shouldLighten = backgroundLuminance > 0.5;

    // Binary search for the optimal lightness
    double minL = 0;
    double maxL = 1;

    while (maxL - minL > 0.01) {
      final testL = (minL + maxL) / 2;
      final testColor = hsl.withLightness(testL).toColor();
      final testContrast = calculateContrast(testColor, background);

      if (testContrast >= minContrast) {
        if (shouldLighten) {
          minL = testL;
        } else {
          maxL = testL;
        }
      } else {
        if (shouldLighten) {
          maxL = testL;
        } else {
          minL = testL;
        }
      }
    }

    final targetLightness = shouldLighten ? maxL : minL;
    return hsl.withLightness(targetLightness).toColor();
  }

  // --- Color Generation ---

  /// Generates harmonious colors based on a base color.
  static List<Color> generateHarmoniousColors(Color base) {
    final baseHsl = HSLColor.fromColor(base);

    return [
      // Analogous colors
      baseHsl.withHue((baseHsl.hue + 30) % 360).toColor(),
      baseHsl.withHue((baseHsl.hue - 30) % 360).toColor(),

      // Complementary color
      baseHsl.withHue((baseHsl.hue + 180) % 360).toColor(),

      // Triadic colors
      baseHsl.withHue((baseHsl.hue + 120) % 360).toColor(),
      baseHsl.withHue((baseHsl.hue + 240) % 360).toColor(),
    ];
  }

  /// Creates a tonal palette from a source color.
  static Map<int, Color> createTonalPalette(Color sourceColor) {
    final hsl = HSLColor.fromColor(sourceColor);

    return {
      0: Colors.black,
      10: hsl.withLightness(0.1).toColor(),
      20: hsl.withLightness(0.2).toColor(),
      30: hsl.withLightness(0.3).toColor(),
      40: hsl.withLightness(0.4).toColor(),
      50: hsl.withLightness(0.5).toColor(),
      60: hsl.withLightness(0.6).toColor(),
      70: hsl.withLightness(0.7).toColor(),
      80: hsl.withLightness(0.8).toColor(),
      90: hsl.withLightness(0.9).toColor(),
      95: hsl.withLightness(0.95).toColor(),
      99: hsl.withLightness(0.99).toColor(),
      100: Colors.white,
    };
  }

  /// Determines if a color is considered "light" or "dark".
  static bool isLight(Color color) {
    return color.computeLuminance() > 0.5;
  }

  /// Gets the appropriate text color (black or white) for a given background.
  static Color getTextColor(Color backgroundColor) {
    return isLight(backgroundColor) ? Colors.black : Colors.white;
  }
}
