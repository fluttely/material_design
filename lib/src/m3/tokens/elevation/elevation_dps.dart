part of '../../../tokens.dart';

/// Type-safe wrapper for M3 elevation values in dp.
///
/// Implements [double] so it can be passed to any Flutter API that accepts an
/// elevation [double], while preventing arbitrary raw doubles from being used
/// in M3-typed APIs.
///
/// See [M3Contract] for the escape hatch when you must step outside the scale.
extension type const M3ElevationDpValue._(double dp) implements double {}

/// Material Design 3 elevation values in density-independent pixels (dp).
///
/// Reference: https://m3.material.io/styles/elevation/tokens
abstract final class M3ElevationDps {
  /// Elevation level 0 (0dp).
  static const M3ElevationDpValue level0 = M3ElevationDpValue._(0);

  /// Elevation level 1 (1dp).
  static const M3ElevationDpValue level1 = M3ElevationDpValue._(1);

  /// Elevation level 2 (3dp).
  static const M3ElevationDpValue level2 = M3ElevationDpValue._(3);

  /// Elevation level 3 (6dp).
  static const M3ElevationDpValue level3 = M3ElevationDpValue._(6);

  /// Elevation level 4 (8dp).
  static const M3ElevationDpValue level4 = M3ElevationDpValue._(8);

  /// Elevation level 5 (12dp).
  static const M3ElevationDpValue level5 = M3ElevationDpValue._(12);

  /// The six elevation levels, in ascending order.
  static const List<M3ElevationDpValue> values = <M3ElevationDpValue>[
    level0,
    level1,
    level2,
    level3,
    level4,
    level5,
  ];
}
