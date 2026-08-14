part of '../../../tokens.dart';

/// Type-safe wrapper for a Material Design 3 contrast level.
///
/// Ranges from -1.0 (reduced) through 0.0 (standard) to 1.0 (high). Implements
/// [double] so it passes straight into Flutter's `ColorScheme.fromSeed`.
///
/// See [M3Contract] for the escape hatch when you need a level off the scale.
extension type const M3ContrastLevelValue._(double level) implements double {}

/// The Material Design 3 contrast levels.
///
/// Contrast is a user preference, not a design choice: platforms surface it as
/// an accessibility setting. Build the scheme at the level the user asked for
/// rather than hard-coding [standard].
///
/// Spec: https://m3.material.io/styles/color/advanced/adjust-existing-colors
abstract final class M3ContrastLevels {
  /// Reduced contrast (-1.0) — softer separation between roles.
  static const M3ContrastLevelValue reduced = M3ContrastLevelValue._(-1);

  /// Standard contrast (0.0) — the Material baseline.
  static const M3ContrastLevelValue standard = M3ContrastLevelValue._(0);

  /// Medium contrast (0.5).
  static const M3ContrastLevelValue medium = M3ContrastLevelValue._(0.5);

  /// High contrast (1.0) — maximum separation, for accessibility settings.
  static const M3ContrastLevelValue high = M3ContrastLevelValue._(1);

  /// The four contrast levels, in ascending order.
  static const List<M3ContrastLevelValue> values = <M3ContrastLevelValue>[
    reduced,
    standard,
    medium,
    high,
  ];

  /// The contrast level the platform reports for the current [context].
  ///
  /// Returns [high] when the user has enabled a high-contrast accessibility
  /// setting, [standard] otherwise.
  static M3ContrastLevelValue of(BuildContext context) =>
      MediaQuery.highContrastOf(context) ? high : standard;
}

/// The nine Material Design 3 dynamic scheme variants.
///
/// A variant decides how the seed color is spread across the six tonal
/// palettes — how much chroma survives, and whether the tertiary hue rotates
/// away from the seed. [tonalSpot] is the Material You default.
///
/// This is a selector: it names a situation, and resolves to Flutter's
/// [DynamicSchemeVariant] when a scheme is built by `M3ColorSchemes`.
///
/// Spec: https://m3.material.io/styles/color/system/how-the-system-works
enum M3SchemeVariant {
  /// Low-to-medium chroma pastels — the Material You default (Android 12+).
  tonalSpot(DynamicSchemeVariant.tonalSpot),

  /// Palettes match the seed color even when it is very bright.
  fidelity(DynamicSchemeVariant.fidelity),

  /// Grayscale — no chroma at all.
  monochrome(DynamicSchemeVariant.monochrome),

  /// Near-grayscale with a hint of chroma.
  neutral(DynamicSchemeVariant.neutral),

  /// High-chroma pastels; the primary palette runs at maximum chroma.
  vibrant(DynamicSchemeVariant.vibrant),

  /// Medium-chroma pastels with a rotated primary hue, for variety.
  ///
  /// The natural fit for M3 Expressive surfaces.
  expressive(DynamicSchemeVariant.expressive),

  /// Like [fidelity], but `primaryContainer` is the seed color itself.
  content(DynamicSchemeVariant.content),

  /// Playful — the seed hue does not appear in the theme.
  rainbow(DynamicSchemeVariant.rainbow),

  /// Playful — the seed hue does not appear in the theme.
  fruitSalad(DynamicSchemeVariant.fruitSalad);

  const M3SchemeVariant(this.dynamicSchemeVariant);

  /// The Flutter enum value this variant resolves to.
  final DynamicSchemeVariant dynamicSchemeVariant;
}
