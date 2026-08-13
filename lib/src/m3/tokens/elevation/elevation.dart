part of '../../../tokens.dart';

/// The six standard elevation levels of the Material Design 3 system.
///
/// Each level pairs a dp value with the shadow stack specified for it. Like
/// `M3Motion`, this is a **composite** token — you read [dp] and [shadows]
/// together rather than unwrapping it to a single number — which is why it is
/// an `enum` rather than one of the removed scalar token enums.
///
/// The `M3ElevationVisuals` extension in the color module adds
/// `surfaceColor(context)` and `calculateSurfaceColor(...)` on top of these.
///
/// Reference: https://m3.material.io/foundations/elevation/overview
enum M3Elevation {
  /// No elevation (0dp) — default surfaces, navigation rails.
  level0(dp: M3ElevationDps.level0, shadows: M3ElevationShadows.level0),

  /// Subtle elevation (1dp) — cards at rest, chips, bottom sheets.
  level1(dp: M3ElevationDps.level1, shadows: M3ElevationShadows.level1),

  /// Distinct elevation (3dp) — menus, app bars, navigation drawers.
  level2(dp: M3ElevationDps.level2, shadows: M3ElevationShadows.level2),

  /// Prominent elevation (6dp) — FABs, snackbars, dialogs.
  level3(dp: M3ElevationDps.level3, shadows: M3ElevationShadows.level3),

  /// High elevation (8dp) — navigation drawers, modal surfaces.
  level4(dp: M3ElevationDps.level4, shadows: M3ElevationShadows.level4),

  /// Maximum elevation (12dp) — modal dialogs, critical overlays.
  level5(dp: M3ElevationDps.level5, shadows: M3ElevationShadows.level5);

  const M3Elevation({required this.dp, required this.shadows});

  /// The elevation in density-independent pixels (dp).
  final M3ElevationDpValue dp;

  /// The shadows specified for this elevation level.
  final List<M3BoxShadow> shadows;

  /// Returns the closest M3 elevation level for a raw dp [value].
  ///
  /// Useful when interoperating with Flutter APIs that hand back a plain
  /// elevation double.
  static M3Elevation fromValue(double value) => switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };
}

/// Comparison utilities for [M3Elevation].
extension M3ElevationComparison on M3Elevation {
  /// Whether this elevation is higher than [other].
  bool isHigherThan(M3Elevation other) => dp > other.dp;

  /// Whether this elevation is lower than [other].
  bool isLowerThan(M3Elevation other) => dp < other.dp;

  /// Absolute difference in dp between this elevation and [other].
  double differenceFrom(M3Elevation other) => (dp - other.dp).abs();
}
