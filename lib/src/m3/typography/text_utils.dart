part of '../../../material_design.dart';

/// Utility methods for working with M3 text styles.
///
/// Keeps manipulation logic separate from [M3TypeScale] token constants.
abstract final class M3TextUtils {
  /// Scales [baseStyle] respecting the system text scale factor.
  ///
  /// Clamps the result to [minFontSize] and [maxFontSize] when provided.
  static TextStyle adaptive({
    required TextStyle baseStyle,
    required BuildContext context,
    double? minFontSize,
    double? maxFontSize,
  }) {
    final textScaler = MediaQuery.of(context).textScaler;
    var size = textScaler.scale(baseStyle.fontSize!);

    if (minFontSize != null) size = math.max(size, minFontSize);
    if (maxFontSize != null) size = math.min(size, maxFontSize);

    final height = baseStyle.height != null
        ? baseStyle.height! * (baseStyle.fontSize! / size)
        : null;

    return baseStyle.copyWith(fontSize: size, height: height);
  }

  /// Returns the display style appropriate for the current screen width.
  static TextStyle responsiveDisplay(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < M3Breakpoints.medium) return M3TypeScale.displaySmall;
    if (width < M3Breakpoints.large) return M3TypeScale.displayMedium;
    return M3TypeScale.displayLarge;
  }

  /// Applies OpenDyslexic-friendly adjustments: wider spacing and taller lines.
  static TextStyle dyslexiaFriendly(TextStyle base) {
    return base.copyWith(
      letterSpacing: (base.letterSpacing ?? 0) + 0.12,
      height: math.max(base.height ?? 1.0, 1.6),
      fontWeight: FontWeight.values[math.min(
        FontWeight.values.indexOf(base.fontWeight ?? FontWeight.w400) + 1,
        FontWeight.values.length - 1,
      )],
    );
  }

  /// Applies a custom font family while keeping M3 system fonts as fallbacks.
  static TextStyle withFontFamily({
    required TextStyle base,
    required String fontFamily,
    List<String>? fallback,
  }) {
    return base.copyWith(
      fontFamily: fontFamily,
      fontFamilyFallback: fallback ?? _M3SystemFonts.sansSerif,
    );
  }

  /// Returns a monospace variant of [base] using the system monospace stack.
  static TextStyle mono(TextStyle base) {
    return base.copyWith(
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: _M3SystemFonts.mono,
      letterSpacing: 0,
    );
  }

  /// Boosts the font weight of [base] by one step for high-contrast
  /// readability.
  static TextStyle highContrast(TextStyle base) {
    return base.copyWith(
      fontWeight: FontWeight.values[math.min(
        FontWeight.values.indexOf(base.fontWeight ?? FontWeight.w400) + 1,
        FontWeight.values.length - 1,
      )],
    );
  }
}

abstract final class _M3SystemFonts {
  static const List<String> sansSerif = [
    'Roboto',
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  static const List<String> mono = [
    'Roboto Mono',
    'SFMono-Regular',
    'Monaco',
    'Consolas',
    'Liberation Mono',
    'Courier New',
    'monospace',
  ];
}
