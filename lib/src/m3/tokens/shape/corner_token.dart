part of '../../../tokens.dart';

/// Type-safe wrapper for M3 corner radius values.
///
/// Implements [double] so it can be passed to any Flutter API that accepts a
/// [double], while preventing arbitrary raw doubles from being used in
/// M3-typed shape APIs.
///
/// See [M3Contract] for the escape hatch when you must step outside the scale.
extension type const M3CornerValue._(double dp) implements double {}

/// Material Design 3 corner radius values in density-independent pixels (dp).
///
/// Strictly aligned with the 10-level M3 corner radius scale:
/// none(0), extraSmall(4), small(8), medium(12), large(16),
/// largeIncreased(20), extraLarge(28), extraLargeIncreased(32),
/// extraExtraLarge(48), full(9999).
///
/// The scale had seven levels until the 2025 M3 Expressive update added the
/// three in between (`largeIncreased`, `extraLargeIncreased`,
/// `extraExtraLarge`). They are part of the baseline scale, not an Expressive
/// extra: Material Components for Android and Compose ship them as
/// `ShapeAppearance.Material3.Corner.*` and `Shapes.*` alongside the original
/// seven.
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
abstract final class M3Corners {
  /// No corner radius (0dp) — sharp rectangular corners.
  static const M3CornerValue none = M3CornerValue._(0);

  /// Extra-small corner radius (4dp).
  static const M3CornerValue extraSmall = M3CornerValue._(4);

  /// Small corner radius (8dp) — buttons, chips.
  static const M3CornerValue small = M3CornerValue._(8);

  /// Medium corner radius (12dp) — the most-used M3 radius.
  static const M3CornerValue medium = M3CornerValue._(12);

  /// Large corner radius (16dp) — cards, navigation panels.
  static const M3CornerValue large = M3CornerValue._(16);

  /// Large-increased corner radius (20dp) — one step rounder than [large].
  static const M3CornerValue largeIncreased = M3CornerValue._(20);

  /// Extra-large corner radius (28dp) — hero sections, bottom sheets.
  static const M3CornerValue extraLarge = M3CornerValue._(28);

  /// Extra-large-increased corner radius (32dp) — one step rounder than
  /// [extraLarge].
  static const M3CornerValue extraLargeIncreased = M3CornerValue._(32);

  /// Extra-extra-large corner radius (48dp) — the largest fixed radius;
  /// only [full] is rounder.
  static const M3CornerValue extraExtraLarge = M3CornerValue._(48);

  /// Full corner radius (9999dp) — pill shapes, FABs.
  static const M3CornerValue full = M3CornerValue._(9999);

  /// The ten corner values of the M3 corner radius scale, in ascending order.
  static const List<M3CornerValue> values = <M3CornerValue>[
    none,
    extraSmall,
    small,
    medium,
    large,
    largeIncreased,
    extraLarge,
    extraLargeIncreased,
    extraExtraLarge,
    full,
  ];
}
