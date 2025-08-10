/// Color extensions for Material Design 3.
library;

import 'dart:ui';
import '../utils/color_utils.dart';

/// Extension methods for Color class to work with Material 3.
extension M3ColorExtension on Color {
  /// Converts this color to a hex string.
  String toHex({bool includeAlpha = false}) {
    return M3ColorUtils.colorToHex(this, includeAlpha: includeAlpha);
  }

  /// Gets the luminance of this color.
  double get luminance => M3ColorUtils.getLuminance(this);

  /// Determines if this color is light.
  bool get isLight => M3ColorUtils.isLight(this);

  /// Determines if this color is dark.
  bool get isDark => M3ColorUtils.isDark(this);

  /// Gets the contrast ratio between this color and another color.
  double contrastRatio(Color other) {
    return M3ColorUtils.getContrastRatio(this, other);
  }

  /// Checks if this color has sufficient contrast with another color.
  bool hasSufficientContrast(Color other, {double ratio = 4.5}) {
    return M3ColorUtils.hasSufficientContrast(this, other, ratio: ratio);
  }

  /// Creates a color with the specified opacity using the new withValues method.
  Color withM3Opacity(double opacity) {
    return M3ColorUtils.withOpacity(this, opacity);
  }

  /// Blends this color with another color.
  Color blend(Color other, double ratio) {
    return M3ColorUtils.blend(this, other, ratio);
  }

  /// Creates a darker version of this color.
  Color darken([double amount = 0.1]) {
    return M3ColorUtils.darken(this, amount);
  }

  /// Creates a lighter version of this color.
  Color lighten([double amount = 0.1]) {
    return M3ColorUtils.lighten(this, amount);
  }

  /// Creates a more saturated version of this color.
  Color saturate([double amount = 0.1]) {
    return M3ColorUtils.saturate(this, amount);
  }

  /// Creates a less saturated version of this color.
  Color desaturate([double amount = 0.1]) {
    return M3ColorUtils.desaturate(this, amount);
  }

  /// Adjusts the hue of this color.
  Color adjustHue(double degrees) {
    return M3ColorUtils.adjustHue(this, degrees);
  }

  /// Gets the complementary color (opposite on the color wheel).
  Color get complement => M3ColorUtils.complement(this);

  /// Creates a grayscale version of this color.
  Color get grayscale => M3ColorUtils.grayscale(this);

  /// Inverts this color.
  Color get inverted => M3ColorUtils.invert(this);

  /// Generates a palette of colors based on this color.
  List<Color> generatePalette({int count = 5}) {
    return M3ColorUtils.generatePalette(this, count: count);
  }

  /// Checks if this color is valid.
  bool get isValid => M3ColorUtils.isValidColor(this);

  /// Returns the best contrasting color (black or white) for text on this background.
  Color get bestContrastColor {
    return isLight ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
  }

  /// Returns a Material 3 state layer color with appropriate opacity.
  Color asStateLayer({double opacity = 0.12}) {
    return withValues(alpha: opacity);
  }

  /// Returns this color as a surface tint with appropriate opacity for elevation.
  Color asSurfaceTint(double elevation) {
    double opacity;
    if (elevation <= 0) {
      opacity = 0.0;
    } else if (elevation <= 1) {
      opacity = 0.05;
    } else if (elevation <= 3) {
      opacity = 0.08;
    } else if (elevation <= 6) {
      opacity = 0.11;
    } else if (elevation <= 8) {
      opacity = 0.12;
    } else {
      opacity = 0.14;
    }
    return withValues(alpha: opacity);
  }

  /// Returns a harmonized version of this color with another color.
  Color harmonize(Color source) {
    // Simplified harmonization - in a real implementation, this would use
    // more sophisticated color science algorithms
    return blend(source, 0.15);
  }

  /// Returns this color adapted for different contrast levels.
  Color adaptForContrast({required double contrast}) {
    if (contrast >= 1.0) {
      // High contrast - increase saturation and contrast
      return saturate(0.2).darken(isLight ? 0.1 : -0.1);
    } else if (contrast <= -1.0) {
      // Low contrast - decrease saturation and contrast
      return desaturate(0.2);
    }
    return this; // Standard contrast
  }
}