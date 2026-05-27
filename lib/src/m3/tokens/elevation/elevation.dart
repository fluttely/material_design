part of '../../../../material_design.dart';

/// The six standard elevation levels of the Material Design 3 system.
///
/// Each level combines shadow depth with surface tinting. Use the extension
/// methods `surfaceColor(context)` and `calculateSurfaceColor(...)` from
/// [M3ElevationVisuals] to compute tinted surface colors.
///
/// Reference: https://m3.material.io/foundations/elevation/overview
// ignore: use_enums
class M3Elevation {
  const M3Elevation._({
    required this.dp,
    required List<M3BoxShadow> shadows,
  }) : _shadows = shadows;

  /// The elevation in density-independent pixels (dp).
  final double dp;

  final List<M3BoxShadow> _shadows;

  /// The shadows for this elevation level.
  List<M3BoxShadow> get shadows => _shadows;

  /// Returns the closest M3Elevation for a given dp value.
  static M3Elevation fromValue(double value) => switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };

  /// The dp value for [level0] elevation.
  static const double level0Dp = 0;
  /// The shadows for [level0] elevation.
  static const List<M3BoxShadow> level0Shadows = <M3BoxShadow>[];

  /// No elevation (0dp) — default surfaces, navigation rails.
  static const M3Elevation level0 = M3Elevation._(
    dp: level0Dp,
    shadows: level0Shadows,
  );

  /// The dp value for [level1] elevation.
  static const double level1Dp = M3ElevationDps.level1;
  /// The shadows for [level1] elevation.
  static const List<M3BoxShadow> level1Shadows = M3ElevationShadows.level1;

  /// Subtle elevation (1dp) — cards at rest, chips, bottom sheets.
  static const M3Elevation level1 = M3Elevation._(
    dp: level1Dp,
    shadows: level1Shadows,
  );

  /// The dp value for [level2] elevation.
  static const double level2Dp = M3ElevationDps.level2;
  /// The shadows for [level2] elevation.
  static const List<M3BoxShadow> level2Shadows = M3ElevationShadows.level2;

  /// Distinct elevation (3dp) — menus, app bars, navigation drawers.
  static const M3Elevation level2 = M3Elevation._(
    dp: level2Dp,
    shadows: level2Shadows,
  );

  /// The dp value for [level3] elevation.
  static const double level3Dp = M3ElevationDps.level3;
  /// The shadows for [level3] elevation.
  static const List<M3BoxShadow> level3Shadows = M3ElevationShadows.level3;

  /// Prominent elevation (6dp) — FABs, snackbars, dialogs.
  static const M3Elevation level3 = M3Elevation._(
    dp: level3Dp,
    shadows: level3Shadows,
  );

  /// The dp value for [level4] elevation.
  static const double level4Dp = M3ElevationDps.level4;
  /// The shadows for [level4] elevation.
  static const List<M3BoxShadow> level4Shadows = M3ElevationShadows.level4;

  /// High elevation (8dp) — navigation drawers, modal surfaces.
  static const M3Elevation level4 = M3Elevation._(
    dp: level4Dp,
    shadows: level4Shadows,
  );

  /// The dp value for [level5] elevation.
  static const double level5Dp = M3ElevationDps.level5;
  /// The shadows for [level5] elevation.
  static const List<M3BoxShadow> level5Shadows = M3ElevationShadows.level5;

  /// Maximum elevation (12dp) — modal dialogs, critical overlays.
  static const M3Elevation level5 = M3Elevation._(
    dp: level5Dp,
    shadows: level5Shadows,
  );
}

/// Color and tinting utilities for [M3Elevation].
extension M3ElevationVisuals on M3Elevation {
  /// Returns the surface color tinted for this elevation using the current
  /// theme.
  Color surfaceColor(BuildContext context) =>
      M3SurfaceTint.fromElevationToken(context, this);

  /// Returns the surface color tinted for this elevation using explicit colors.
  Color calculateSurfaceColor({
    required Color surface,
    required Color surfaceTint,
  }) =>
      M3SurfaceTint.calculateSurfaceColor(
        surface: surface,
        surfaceTint: surfaceTint,
        elevation: this,
      );

  /// Returns a high-contrast surface color for accessibility.
  Color highContrastSurface({
    required Color surface,
    required Color surfaceTint,
  }) =>
      M3SurfaceTint.highContrastSurface(
        surface: surface,
        surfaceTint: surfaceTint,
        elevation: this,
      );
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
