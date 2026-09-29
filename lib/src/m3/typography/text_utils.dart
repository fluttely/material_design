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
    return _resyncWeightAxis(
      base.copyWith(
        letterSpacing: (base.letterSpacing ?? 0) + 0.12,
        height: math.max(base.height ?? 1.0, 1.6),
        fontWeight: _bolder(base.fontWeight),
      ),
    );
  }

  /// Carries [style]'s [TextStyle.fontWeight] onto the `wght` axis of a
  /// variable font.
  ///
  /// Until Flutter 3.41, a [FontWeight] did not reach the `wght` axis of a
  /// variable font ([flutter/flutter#148026](https://github.com/flutter/flutter/issues/148026)).
  /// An app that bundles Roboto Flex on 3.27–3.38 therefore renders every
  /// role of the type scale at the font's default weight: `titleMedium`'s 500
  /// is lost, and [M3EmphasizedTypeScale] draws exactly what the baseline
  /// draws. This sets the axis explicitly, to the weight the style already
  /// carries:
  ///
  /// ```dart
  /// Text(
  ///   'Balance',
  ///   style: M3TextUtils.withWeightAxis(M3EmphasizedTypeScale.titleMedium),
  /// )
  /// ```
  ///
  /// It adds no number of its own — the value is the scale's weight — so the
  /// result is spec-true on every font. A static font has no `wght` axis and
  /// ignores the variation; on Flutter 3.41 and later the variation repeats
  /// what [FontWeight] already sets. Other variations are kept; an existing
  /// `wght` is replaced in place. A style without a weight is returned
  /// unchanged, because there is no weight to carry.
  ///
  /// Apply it **last**. An explicit `wght` overrides [FontWeight], so a
  /// `copyWith(fontWeight: …)` made afterwards is drawn at the old weight on a
  /// variable font — call this again after it. [highContrast] and
  /// [dyslexiaFriendly] re-sync the axis themselves. And
  /// [M3EmphasizedTypeScale.of] looks styles up by value, so map to the
  /// emphasized style *before* adding the axis, as above.
  ///
  /// Only the weight is carried. The type scale defines no grade, width or
  /// roundness, and [FontVariation.opticalSize] is documented as normally
  /// derived from the font size, so the other axes stay the caller's decision.
  ///
  /// Reference: https://m3.material.io/styles/typography/fonts
  static TextStyle withWeightAxis(TextStyle style) {
    final weight = style.fontWeight;
    if (weight == null) return style;

    final axis = FontVariation.weight(weight.value.toDouble());
    final variations = <FontVariation>[...?style.fontVariations];
    final index = variations.indexWhere((v) => v.axis == axis.axis);
    if (index == -1) {
      variations.add(axis);
    } else {
      variations[index] = axis;
    }

    return style.copyWith(fontVariations: variations);
  }

  /// Applies [withWeightAxis] to every style in [theme].
  ///
  /// The theme-level counterpart, for an app that bundles a variable font on
  /// a Flutter release before 3.41:
  ///
  /// ```dart
  /// final theme = M3TextTheme.applyToTheme(
  ///   ThemeData(fontFamily: 'RobotoFlex'),
  /// );
  /// return MaterialApp(
  ///   theme: theme.copyWith(
  ///     textTheme: M3TextUtils.textThemeWithWeightAxis(theme.textTheme),
  ///   ),
  /// );
  /// ```
  ///
  /// The caveat on [withWeightAxis] applies at a wider radius: any widget that
  /// derives a style with `copyWith(fontWeight: …)` from this theme keeps the
  /// theme's `wght` on a variable font.
  static TextTheme textThemeWithWeightAxis(TextTheme theme) {
    TextStyle? axis(TextStyle? style) =>
        style == null ? null : withWeightAxis(style);

    return theme.copyWith(
      displayLarge: axis(theme.displayLarge),
      displayMedium: axis(theme.displayMedium),
      displaySmall: axis(theme.displaySmall),
      headlineLarge: axis(theme.headlineLarge),
      headlineMedium: axis(theme.headlineMedium),
      headlineSmall: axis(theme.headlineSmall),
      titleLarge: axis(theme.titleLarge),
      titleMedium: axis(theme.titleMedium),
      titleSmall: axis(theme.titleSmall),
      bodyLarge: axis(theme.bodyLarge),
      bodyMedium: axis(theme.bodyMedium),
      bodySmall: axis(theme.bodySmall),
      labelLarge: axis(theme.labelLarge),
      labelMedium: axis(theme.labelMedium),
      labelSmall: axis(theme.labelSmall),
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
      _resyncWeightAxis(base.copyWith(fontWeight: _bolder(base.fontWeight)));

  /// Returns the next heavier named [FontWeight], saturating at
  /// [FontWeight.w900].
  ///
  /// Compares by value rather than looking the weight up in
  /// [FontWeight.values]: since Flutter 3.41 a weight such as
  /// `FontWeight(450)` is legal, is in no list, and would otherwise resolve to
  /// the thinnest weight rather than a heavier one.
  static FontWeight _bolder(FontWeight? weight) {
    final current = (weight ?? FontWeight.w400).value;
    return FontWeight.values.firstWhere(
      (candidate) => candidate.value > current,
      orElse: () => FontWeight.w900,
    );
  }

  /// Moves an existing `wght` axis to the style's new weight, so a transform
  /// that changes the weight is not undone by a stale variation. A style that
  /// never carried the axis is left without one.
  static TextStyle _resyncWeightAxis(TextStyle style) =>
      style.fontVariations?.any((v) => v.axis == 'wght') ?? false
          ? withWeightAxis(style)
          : style;
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
