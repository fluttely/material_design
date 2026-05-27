part of '../../../../../material_design.dart';

/// Color manipulation and accessibility utilities for Material Design 3.
///
/// All contrast-related calculations follow the WCAG 2.1 relative luminance
/// formula. Tonal palette generation approximates M3's HCT-space tones using
/// luma-based lightness; for production-accurate palettes use the
/// `material_color_utilities` package.
@immutable
abstract interface class M3ColorUtils {
  // --- Color manipulation ---

  /// Blends [color1] and [color2] at the given [ratio]
  /// (0 = color1, 1 = color2).
  static Color blend(Color color1, Color color2, double ratio) =>
      Color.lerp(color1, color2, ratio) ?? color1;

  /// Increases the lightness of [color] by [amount] (0–1).
  static Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Decreases the lightness of [color] by [amount] (0–1).
  static Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Increases the saturation of [color] by [amount] (0–1).
  static Color saturate(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withSaturation((hsl.saturation + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Decreases the saturation of [color] by [amount] (0–1).
  static Color desaturate(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withSaturation((hsl.saturation - amount).clamp(0.0, 1.0))
        .toColor();
  }

  // --- State colors ---

  /// Overlays [baseColor] with a hover state layer.
  static Color hover(Color baseColor) => Color.alphaBlend(
        Colors.black.withValues(alpha: M3StateLayerOpacities.hover),
        baseColor,
      );

  /// Overlays [baseColor] with a pressed state layer.
  static Color pressed(Color baseColor) => Color.alphaBlend(
        Colors.black.withValues(alpha: M3StateLayerOpacities.pressed),
        baseColor,
      );

  /// Overlays [baseColor] with a focus state layer.
  static Color focused(Color baseColor) => Color.alphaBlend(
        Colors.black.withValues(alpha: M3StateLayerOpacities.focus),
        baseColor,
      );

  /// Returns [baseColor] at the disabled content opacity (38%).
  static Color disabled(Color baseColor) =>
      baseColor.withValues(alpha: M3Opacities.disabledContent);

  /// Overlays [baseColor] with a drag state layer.
  static Color dragged(Color baseColor) => Color.alphaBlend(
        Colors.black.withValues(alpha: M3StateLayerOpacities.dragged),
        baseColor,
      );

  // --- Accessibility ---

  /// The WCAG 2.1 contrast ratio between [color1] and [color2] (1–21).
  static double calculateContrast(Color color1, Color color2) {
    final l1 = color1.computeLuminance();
    final l2 = color2.computeLuminance();
    final lighter = math.max(l1, l2);
    final darker = math.min(l1, l2);
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Whether [foreground] meets WCAG AA normal-text contrast (4.5:1).
  static bool meetsWCAGAA(Color foreground, Color background) =>
      calculateContrast(foreground, background) >= 4.5;

  /// Whether [foreground] meets WCAG AAA contrast (7:1).
  static bool meetsWCAGAAA(Color foreground, Color background) =>
      calculateContrast(foreground, background) >= 7.0;

  /// Whether [foreground] meets WCAG AA large-text contrast (3:1).
  static bool meetsLargeTextAA(Color foreground, Color background) =>
      calculateContrast(foreground, background) >= 3.0;

  /// Adjusts [color] lightness until it meets [minContrast] against
  /// [background].
  ///
  /// Uses binary search over the HSL lightness axis. For HCT-accurate results
  /// use `material_color_utilities`.
  static Color adjustForAccessibility(
    Color color,
    Color background, {
    double minContrast = 4.5,
  }) {
    if (calculateContrast(color, background) >= minContrast) return color;

    final hsl = HSLColor.fromColor(color);
    final shouldLighten = background.computeLuminance() > 0.5;

    double lo = 0;
    double hi = 1;
    while (hi - lo > 0.005) {
      final mid = (lo + hi) / 2;
      final testColor = hsl.withLightness(mid).toColor();
      final passes = calculateContrast(testColor, background) >= minContrast;
      if (shouldLighten) {
        if (passes) {
          lo = mid;
        } else {
          hi = mid;
        }
      } else {
        if (passes) {
          hi = mid;
        } else {
          lo = mid;
        }
      }
    }
    return hsl.withLightness(shouldLighten ? lo : hi).toColor();
  }

  // --- Color generation ---

  /// Returns five colors harmonious with [base]: two analogous, one
  /// complementary, and two triadic.
  static List<Color> harmonious(Color base) {
    final hsl = HSLColor.fromColor(base);
    return [
      hsl.withHue((hsl.hue + 30) % 360).toColor(),
      hsl.withHue((hsl.hue - 30 + 360) % 360).toColor(),
      hsl.withHue((hsl.hue + 180) % 360).toColor(),
      hsl.withHue((hsl.hue + 120) % 360).toColor(),
      hsl.withHue((hsl.hue + 240) % 360).toColor(),
    ];
  }

  /// Generates an approximate tonal palette for [sourceColor].
  ///
  /// Keys match [M3TonalPalette] tones (0–100). Values approximate the
  /// HCT-space lightness using luma-based HSL. For production accuracy use
  /// `material_color_utilities`.
  static Map<int, Color> tonalPalette(Color sourceColor) {
    final hsl = HSLColor.fromColor(sourceColor);
    Color tone(int t) => hsl.withLightness(t / 100.0).toColor();
    return {
      for (final t in M3TonalPalette.all)
        t: t == 0
            ? Colors.black
            : t == 100
                ? Colors.white
                : tone(t),
    };
  }

  /// Whether [color] is perceived as light (luminance > 0.5).
  static bool isLight(Color color) => color.computeLuminance() > 0.5;

  /// Returns black or white — whichever contrasts better with [background].
  static Color onColor(Color background) =>
      isLight(background) ? Colors.black : Colors.white;
}
