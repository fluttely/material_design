part of '../../../../material_design.dart';

/// The six standard elevation levels of the Material Design 3 system.
///
/// Each level combines shadow depth with surface tinting. Use the extension
/// methods `surfaceColor(context)` and `calculateSurfaceColor(...)` from
/// [M3ElevationVisuals] to compute tinted surface colors.
///
/// Reference: https://m3.material.io/foundations/elevation/overview
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

  /// No elevation (0dp) — default surfaces, navigation rails.
  static const level0 = M3Elevation._(
    dp: 0,
    shadows: [],
  );

  /// Subtle elevation (1dp) — cards at rest, chips, bottom sheets.
  static const level1 = M3Elevation._(
    dp: M3ElevationDps.level1,
    shadows: M3ElevationShadows.level1,
  );

  /// Distinct elevation (3dp) — menus, app bars, navigation drawers.
  static const level2 = M3Elevation._(
    dp: M3ElevationDps.level2,
    shadows: M3ElevationShadows.level2,
  );

  /// Prominent elevation (6dp) — FABs, snackbars, dialogs.
  static const level3 = M3Elevation._(
    dp: M3ElevationDps.level3,
    shadows: M3ElevationShadows.level3,
  );

  /// High elevation (8dp) — navigation drawers, modal surfaces.
  static const level4 = M3Elevation._(
    dp: M3ElevationDps.level4,
    shadows: M3ElevationShadows.level4,
  );

  /// Maximum elevation (12dp) — modal dialogs, critical overlays.
  static const level5 = M3Elevation._(
    dp: M3ElevationDps.level5,
    shadows: M3ElevationShadows.level5,
  );
}

/// Color and tinting utilities for [M3Elevation].
extension M3ElevationVisuals on M3Elevation {
  /// Returns the surface color tinted for this elevation using the current theme.
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
