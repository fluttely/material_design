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
/// Strictly aligned with the 7-level M3 shape scale:
/// none(0), extraSmall(4), small(8), medium(12), large(16),
/// extraLarge(28), full(9999).
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
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

  /// Extra-large corner radius (28dp) — hero sections, bottom sheets.
  static const M3CornerValue extraLarge = M3CornerValue._(28);

  /// Full corner radius (9999dp) — pill shapes, FABs.
  static const M3CornerValue full = M3CornerValue._(9999);

  /// The seven corner values of the M3 shape scale, in ascending order.
  static const List<M3CornerValue> values = <M3CornerValue>[
    none,
    extraSmall,
    small,
    medium,
    large,
    extraLarge,
    full,
  ];
}
