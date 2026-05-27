part of '../../../../material_design.dart';

/// Material Design 3 corner radius values in density-independent pixels (dp).
///
/// Strictly aligned with the 7-level M3 shape scale:
/// none(0), extraSmall(4), small(8), medium(12), large(16),
/// extraLarge(28), full(9999).
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
abstract final class M3Corners {
  /// No corner radius (0dp) — sharp rectangular corners.
  static const double none = 0;

  /// Extra-small corner radius (4dp).
  static const double extraSmall = 4;

  /// Small corner radius (8dp) — buttons, chips.
  static const double small = 8;

  /// Medium corner radius (12dp) — the most-used M3 radius.
  static const double medium = 12;

  /// Large corner radius (16dp) — cards, navigation panels.
  static const double large = 16;

  /// Extra-large corner radius (28dp) — hero sections, bottom sheets.
  static const double extraLarge = 28;

  /// Full corner radius (9999dp) — pill shapes, FABs.
  static const double full = 9999;
}
