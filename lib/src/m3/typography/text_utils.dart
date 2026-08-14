part of '../../typography.dart';

/// Utility methods for working with M3 text styles.
///
/// Keeps manipulation logic separate from [M3TypeScale] token constants.
abstract final class M3TextUtils {
  /// Returns the ambient [TextScaler] clamped to a scale-factor range.
  ///
  /// Pass the result to a [Text] widget's `textScaler` when a layout genuinely
  /// cannot absorb unbounded user text scaling:
  ///
  /// ```dart
  /// Text(
  ///   label,
  ///   style: M3TypeScale.labelLarge,
  ///   textScaler: M3TextUtils.clampedScaler(context, maxScaleFactor: 1.5),
  /// )
  /// ```
  ///
  /// To clamp a whole subtree instead, prefer Flutter's
  /// [MediaQuery.withClampedTextScaling].
  ///
  /// Clamping fights the user's accessibility setting, so reach for it only
  /// after the layout itself has been made to flex.
  static TextScaler clampedScaler(
    BuildContext context, {
    double minScaleFactor = 0.0,
    double maxScaleFactor = double.infinity,
  }) {
    return MediaQuery.textScalerOf(context).clamp(
      minScaleFactor: minScaleFactor,
      maxScaleFactor: maxScaleFactor,
    );
  }

  /// Returns the display style appropriate for the current screen width.
  static TextStyle responsiveDisplay(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < M3Breakpoints.medium) return M3TypeScale.displaySmall;
    if (width < M3Breakpoints.large) return M3TypeScale.displayMedium;
    return M3TypeScale.displayLarge;
  }

  /// Widens letter spacing and opens up line height to aid readability for
  /// dyslexic readers.
  ///
  /// This adjusts metrics only — it does not swap in a dyslexia-specific
  /// typeface. To do that, combine it with [withFontFamily] and a font you
  /// bundle yourself.
  static TextStyle dyslexiaFriendly(TextStyle base) {
    return base.copyWith(
      letterSpacing: (base.letterSpacing ?? 0) + 0.12,
      height: math.max(base.height ?? 1.0, 1.6),
      fontWeight: _bolder(base.fontWeight),
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
  static TextStyle highContrast(TextStyle base) =>
      base.copyWith(fontWeight: _bolder(base.fontWeight));

  /// Returns the next heavier [FontWeight], saturating at [FontWeight.w900].
  static FontWeight _bolder(FontWeight? weight) {
    final index = FontWeight.values.indexOf(weight ?? FontWeight.w400);
    return FontWeight.values[math.min(index + 1, FontWeight.values.length - 1)];
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
