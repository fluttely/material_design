part of '../../../color.dart';

/// Builds Material Design 3 [ColorScheme]s from a seed color, with the scheme
/// variant and contrast level expressed as M3 tokens instead of raw values.
///
/// ## Why this wraps Flutter rather than reimplementing it
///
/// Flutter's own `ColorScheme.fromSeed` already runs the full Material color
/// pipeline (`material_color_utilities` → the nine dynamic scheme variants →
/// 45 color roles), and it is kept in step with the spec by the SDK. Building
/// a second pipeline here would duplicate that work and drift from it.
///
/// What the package adds is the contract: [M3SchemeVariant] instead of a
/// loosely-related enum, [M3ContrastLevelValue] instead of a bare `double`
/// that silently accepts `2.7`, and a [fromContext] entry point that honours
/// the user's own contrast setting rather than assuming standard.
///
/// Spec: https://m3.material.io/styles/color/system/how-the-system-works
abstract final class M3ColorSchemes {
  /// Builds a scheme from [seedColor].
  ///
  /// ```dart
  /// final scheme = M3ColorSchemes.fromSeed(
  ///   seedColor: brandPurple,
  ///   variant: M3SchemeVariant.expressive,
  ///   contrastLevel: M3ContrastLevels.high,
  /// );
  /// ```
  static ColorScheme fromSeed({
    required Color seedColor,
    M3SchemeVariant variant = M3SchemeVariant.tonalSpot,
    Brightness brightness = Brightness.light,
    M3ContrastLevelValue contrastLevel = M3ContrastLevels.standard,
  }) {
    return ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
      dynamicSchemeVariant: variant.dynamicSchemeVariant,
      contrastLevel: contrastLevel,
    );
  }

  /// Builds a light scheme from [seedColor].
  static ColorScheme light({
    required Color seedColor,
    M3SchemeVariant variant = M3SchemeVariant.tonalSpot,
    M3ContrastLevelValue contrastLevel = M3ContrastLevels.standard,
  }) =>
      fromSeed(
        seedColor: seedColor,
        variant: variant,
        contrastLevel: contrastLevel,
      );

  /// Builds a dark scheme from [seedColor].
  static ColorScheme dark({
    required Color seedColor,
    M3SchemeVariant variant = M3SchemeVariant.tonalSpot,
    M3ContrastLevelValue contrastLevel = M3ContrastLevels.standard,
  }) =>
      fromSeed(
        seedColor: seedColor,
        variant: variant,
        brightness: Brightness.dark,
        contrastLevel: contrastLevel,
      );

  /// Builds a scheme that follows the platform's brightness **and** the user's
  /// contrast accessibility setting.
  ///
  /// Contrast is a user preference, and the most common accessibility bug in
  /// a seeded theme is hard-coding it to standard. This reads both from
  /// [context].
  static ColorScheme fromContext(
    BuildContext context, {
    required Color seedColor,
    M3SchemeVariant variant = M3SchemeVariant.tonalSpot,
    Brightness? brightness,
  }) {
    return fromSeed(
      seedColor: seedColor,
      variant: variant,
      brightness: brightness ?? MediaQuery.platformBrightnessOf(context),
      contrastLevel: M3ContrastLevels.of(context),
    );
  }
}
