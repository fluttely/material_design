/// Color utilities for Material Design 3.
library;

import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/painting.dart';

/// Utility functions for working with colors in Material 3.
abstract class M3ColorUtils {
  /// Converts a hex string to a Color.
  static Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Converts a Color to a hex string.
  static String colorToHex(Color color, {bool includeAlpha = false}) {
    final alpha = color.alpha.toRadixString(16).padLeft(2, '0');
    final red = color.red.toRadixString(16).padLeft(2, '0');
    final green = color.green.toRadixString(16).padLeft(2, '0');
    final blue = color.blue.toRadixString(16).padLeft(2, '0');
    
    if (includeAlpha) {
      return '#$alpha$red$green$blue';
    } else {
      return '#$red$green$blue';
    }
  }

  /// Gets the luminance of a color.
  static double getLuminance(Color color) {
    return color.computeLuminance();
  }

  /// Determines if a color is light or dark.
  static bool isLight(Color color) {
    return getLuminance(color) > 0.5;
  }

  /// Determines if a color is dark.
  static bool isDark(Color color) {
    return !isLight(color);
  }

  /// Gets the contrast ratio between two colors.
  static double getContrastRatio(Color color1, Color color2) {
    final luminance1 = getLuminance(color1);
    final luminance2 = getLuminance(color2);
    final lighter = math.max(luminance1, luminance2);
    final darker = math.min(luminance1, luminance2);
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Checks if two colors have sufficient contrast for accessibility.
  static bool hasSufficientContrast(
    Color foreground,
    Color background, {
    double ratio = 4.5,
  }) {
    return getContrastRatio(foreground, background) >= ratio;
  }

  /// Creates a color with the specified opacity.
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }

  /// Blends two colors together.
  static Color blend(Color color1, Color color2, double ratio) {
    final r = (color1.red * (1 - ratio) + color2.red * ratio).round();
    final g = (color1.green * (1 - ratio) + color2.green * ratio).round();
    final b = (color1.blue * (1 - ratio) + color2.blue * ratio).round();
    final a = (color1.alpha * (1 - ratio) + color2.alpha * ratio).round();
    return Color.fromARGB(a, r, g, b);
  }

  /// Creates a darker version of a color.
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0.0 && amount <= 1.0, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Creates a lighter version of a color.
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0.0 && amount <= 1.0, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// Creates a more saturated version of a color.
  static Color saturate(Color color, [double amount = 0.1]) {
    assert(amount >= 0.0 && amount <= 1.0, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final hslSaturated = hsl.withSaturation((hsl.saturation + amount).clamp(0.0, 1.0));
    return hslSaturated.toColor();
  }

  /// Creates a less saturated version of a color.
  static Color desaturate(Color color, [double amount = 0.1]) {
    assert(amount >= 0.0 && amount <= 1.0, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final hslDesaturated = hsl.withSaturation((hsl.saturation - amount).clamp(0.0, 1.0));
    return hslDesaturated.toColor();
  }

  /// Adjusts the hue of a color.
  static Color adjustHue(Color color, double degrees) {
    final hsl = HSLColor.fromColor(color);
    final hslAdjusted = hsl.withHue((hsl.hue + degrees) % 360);
    return hslAdjusted.toColor();
  }

  /// Gets the complementary color (opposite on the color wheel).
  static Color complement(Color color) {
    return adjustHue(color, 180);
  }

  /// Creates a grayscale version of a color.
  static Color grayscale(Color color) {
    final luminance = getLuminance(color);
    final grayValue = (luminance * 255).round();
    return Color.fromARGB(color.alpha, grayValue, grayValue, grayValue);
  }

  /// Inverts a color.
  static Color invert(Color color) {
    return Color.fromARGB(
      color.alpha,
      255 - color.red,
      255 - color.green,
      255 - color.blue,
    );
  }

  /// Gets the average color of a list of colors.
  static Color average(List<Color> colors) {
    if (colors.isEmpty) return const Color(0x00000000);
    
    var totalRed = 0;
    var totalGreen = 0;
    var totalBlue = 0;
    var totalAlpha = 0;
    
    for (final color in colors) {
      totalRed += color.red;
      totalGreen += color.green;
      totalBlue += color.blue;
      totalAlpha += color.alpha;
    }
    
    final count = colors.length;
    return Color.fromARGB(
      totalAlpha ~/ count,
      totalRed ~/ count,
      totalGreen ~/ count,
      totalBlue ~/ count,
    );
  }

  /// Generates a palette of colors based on a base color.
  static List<Color> generatePalette(Color baseColor, {int count = 5}) {
    final palette = <Color>[];
    final hsl = HSLColor.fromColor(baseColor);
    
    for (var i = 0; i < count; i++) {
      final lightness = (i / (count - 1)).clamp(0.1, 0.9);
      final color = hsl.withLightness(lightness).toColor();
      palette.add(color);
    }
    
    return palette;
  }

  /// Checks if a color is valid (not null and has valid ARGB values).
  static bool isValidColor(Color? color) {
    if (color == null) return false;
    return color.alpha >= 0 && color.alpha <= 255 &&
           color.red >= 0 && color.red <= 255 &&
           color.green >= 0 && color.green <= 255 &&
           color.blue >= 0 && color.blue <= 255;
  }
}