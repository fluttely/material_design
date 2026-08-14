part of '../../../tokens.dart';

/// The Material Design 3 **emphasized** type scale — the same 15 roles as
/// [M3TypeScale], one weight step heavier.
///
/// M3 Expressive added emphasis as a property of the type system rather than
/// something you improvise with `copyWith(fontWeight: ...)`. Each role keeps
/// its size and line height — so an emphasized style is a drop-in replacement
/// that never reflows a layout — and changes weight, plus tracking where the
/// heavier weight needs it.
///
/// Use it for the one element in a view that has to win: a hero headline, the
/// selected item in a list, the primary action's label.
///
/// ```dart
/// Text('Balance', style: M3TypeScale.titleMedium),
/// Text('R$ 12.480', style: M3EmphasizedTypeScale.headlineLarge),
/// ```
///
/// Two weight relationships, both from the spec: roles that are regular (400)
/// in the baseline scale become medium (500), and roles that are already
/// medium — the titles and labels — become bold (700).
///
/// Spec: https://m3.material.io/styles/typography/type-scale-tokens
@experimental
abstract final class M3EmphasizedTypeScale {
  // --- Display (400 → 500, tracking normalised to 0) ---

  /// Display Large Emphasized — 57sp, weight 500.
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  /// Display Medium Emphasized — 45sp, weight 500.
  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    height: 52 / 45,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  /// Display Small Emphasized — 36sp, weight 500.
  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    height: 44 / 36,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  // --- Headline (400 → 500) ---

  /// Headline Large Emphasized — 32sp, weight 500.
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  /// Headline Medium Emphasized — 28sp, weight 500.
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    height: 36 / 28,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  /// Headline Small Emphasized — 24sp, weight 500.
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    height: 32 / 24,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  // --- Title (Large 400 → 500; Medium and Small 500 → 700) ---

  /// Title Large Emphasized — 22sp, weight 500.
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  /// Title Medium Emphasized — 16sp, weight 700.
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w700,
  );

  /// Title Small Emphasized — 14sp, weight 700.
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w700,
  );

  // --- Body (400 → 500) ---

  /// Body Large Emphasized — 16sp, weight 500, tighter tracking.
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w500,
  );

  /// Body Medium Emphasized — 14sp, weight 500.
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w500,
  );

  /// Body Small Emphasized — 12sp, weight 500.
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w500,
  );

  // --- Label (500 → 700) ---

  /// Label Large Emphasized — 14sp, weight 700.
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w700,
  );

  /// Label Medium Emphasized — 12sp, weight 700.
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
  );

  /// Label Small Emphasized — 11sp, weight 700.
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    height: 16 / 11,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
  );

  /// The 15 emphasized styles, in the same order as [M3TypeScale.values].
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

  /// The emphasized counterpart of a baseline [M3TypeScale] style.
  ///
  /// Returns [style] unchanged when it is not one of the 15 baseline styles,
  /// so this is safe to call on an already-customised style.
  ///
  /// The lookup is by value, not by role. That matters for exactly one pair:
  /// the spec gives `titleSmall` and `labelLarge` identical metrics, so they
  /// are indistinguishable here — which is harmless, because their emphasized
  /// forms are identical too.
  ///
  /// ```dart
  /// final style = isSelected
  ///     ? M3EmphasizedTypeScale.of(M3TypeScale.bodyLarge)
  ///     : M3TypeScale.bodyLarge;
  /// ```
  static TextStyle of(TextStyle style) {
    final index = M3TypeScale.values.indexOf(style);
    return index == -1 ? style : values[index];
  }
}
