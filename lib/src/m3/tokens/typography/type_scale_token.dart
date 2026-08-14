part of '../../../tokens.dart';

/// Material Design 3 type scale — all 15 text styles as compile-time constants.
///
/// Use these directly wherever Flutter accepts a [TextStyle]:
/// ```dart
/// Text('Hello', style: M3TypeScale.bodyLarge)
/// ```
///
/// To build Flutter's [TextTheme] from this scale, use
/// [M3TextTheme.toTextTheme].
///
/// Reference: https://m3.material.io/styles/typography/type-scale-tokens
abstract final class M3TypeScale {
  // --- Display ---

  /// Display Large — 57sp, weight 400, tracking -0.25. Largest text on screen.
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w400,
  );

  /// Display Medium — 45sp, weight 400. Used for short, important text.
  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    height: 52 / 45,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Display Small — 36sp, weight 400.
  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    height: 44 / 36,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  // --- Headline ---

  /// Headline Large — 32sp, weight 400. Section headings.
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Headline Medium — 28sp, weight 400.
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    height: 36 / 28,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Headline Small — 24sp, weight 400.
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    height: 32 / 24,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  // --- Title ---

  /// Title Large — 22sp, weight 400. App bar titles.
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Title Medium — 16sp, weight 500, tracking 0.15. List item titles.
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w500,
  );

  /// Title Small — 14sp, weight 500, tracking 0.1.
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  // --- Body ---

  /// Body Large — 16sp, weight 400, tracking 0.5. Main reading text.
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
  );

  /// Body Medium — 14sp, weight 400, tracking 0.25. Default body text.
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
  );

  /// Body Small — 12sp, weight 400, tracking 0.4. Supporting text, captions.
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w400,
  );

  // --- Label ---

  /// Label Large — 14sp, weight 500, tracking 0.1. Button labels.
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  /// Label Medium — 12sp, weight 500, tracking 0.5. Badge labels, tabs.
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  /// Label Small — 11sp, weight 500, tracking 0.5. Overlines, annotations.
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    height: 16 / 11,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  /// The 15 styles, largest to smallest within each category.
  ///
  /// Index-aligned with [M3EmphasizedTypeScale.values].
  static const List<TextStyle> values = <TextStyle>[
    displayLarge,
    displayMedium,
    displaySmall,
    headlineLarge,
    headlineMedium,
    headlineSmall,
    titleLarge,
    titleMedium,
    titleSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    labelLarge,
    labelMedium,
    labelSmall,
  ];
}

/// Builds Flutter's [TextTheme] from the M3 type scale.
///
/// Usage:
/// ```dart
/// ThemeData(
///   textTheme: M3TextTheme.toTextTheme(),
/// )
/// ```
abstract final class M3TextTheme {
  /// Returns a [TextTheme] using [M3TypeScale] values.
  static TextTheme toTextTheme() => const TextTheme(
        displayLarge: M3TypeScale.displayLarge,
        displayMedium: M3TypeScale.displayMedium,
        displaySmall: M3TypeScale.displaySmall,
        headlineLarge: M3TypeScale.headlineLarge,
        headlineMedium: M3TypeScale.headlineMedium,
        headlineSmall: M3TypeScale.headlineSmall,
        titleLarge: M3TypeScale.titleLarge,
        titleMedium: M3TypeScale.titleMedium,
        titleSmall: M3TypeScale.titleSmall,
        bodyLarge: M3TypeScale.bodyLarge,
        bodyMedium: M3TypeScale.bodyMedium,
        bodySmall: M3TypeScale.bodySmall,
        labelLarge: M3TypeScale.labelLarge,
        labelMedium: M3TypeScale.labelMedium,
        labelSmall: M3TypeScale.labelSmall,
      );

  /// Applies the M3 type scale to an existing [ThemeData].
  ///
  /// The scale is *merged* onto [ThemeData.textTheme] rather than replacing
  /// it, so the brightness-aware colors that [ThemeData] resolved from its
  /// [Typography] survive. Replacing the theme outright would leave every
  /// [TextStyle.color] null, and the engine paints null as black — which
  /// renders as unreadable black text on a dark theme.
  static ThemeData applyToTheme(ThemeData theme) =>
      theme.copyWith(textTheme: theme.textTheme.merge(toTextTheme()));
}
