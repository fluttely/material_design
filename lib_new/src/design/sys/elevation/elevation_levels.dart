/// Elevation levels based on Material Design 3 specification.
///
/// Reference: https://m3.material.io/styles/elevation/overview
library;

/// Material 3 elevation system provides depth and hierarchy through shadows.
/// 
/// Elevation in Material 3 is expressed through surface tones and shadow,
/// creating a sense of layering and depth.
abstract class M3ElevationLevels {
  /// Level 0 - No elevation.
  /// Used for elements at the same level as the background.
  static const double level0 = 0.0;

  /// Level 1 - Minimal elevation.
  /// Used for cards and contained elements.
  static const double level1 = 1.0;

  /// Level 2 - Low elevation.
  /// Used for app bars and elevated elements.
  static const double level2 = 3.0;

  /// Level 3 - Medium-low elevation.
  /// Used for floating action buttons and prominent elements.
  static const double level3 = 6.0;

  /// Level 4 - Medium elevation.
  /// Used for navigation drawers and side sheets.
  static const double level4 = 8.0;

  /// Level 5 - High elevation.
  /// Used for modal dialogs and important overlays.
  static const double level5 = 12.0;
}

/// Surface tones for different elevation levels in Material 3.
/// 
/// These values represent the opacity of the surface tint color
/// applied at each elevation level.
abstract class M3SurfaceTones {
  /// Surface tint opacity at level 0.
  static const double level0 = 0.0;

  /// Surface tint opacity at level 1.
  static const double level1 = 0.05;

  /// Surface tint opacity at level 2.
  static const double level2 = 0.08;

  /// Surface tint opacity at level 3.
  static const double level3 = 0.11;

  /// Surface tint opacity at level 4.
  static const double level4 = 0.12;

  /// Surface tint opacity at level 5.
  static const double level5 = 0.14;
}

/// Predefined elevation tokens for common use cases.
abstract class M3ElevationTokens {
  /// Elevation for surfaces at rest.
  static const double surface = M3ElevationLevels.level0;

  /// Elevation for raised surfaces like cards.
  static const double raised = M3ElevationLevels.level1;

  /// Elevation for app bars.
  static const double appBar = M3ElevationLevels.level2;

  /// Elevation for floating action buttons.
  static const double fab = M3ElevationLevels.level3;

  /// Elevation for navigation components.
  static const double navigation = M3ElevationLevels.level4;

  /// Elevation for modal components.
  static const double modal = M3ElevationLevels.level5;
}

/// Utility class for working with Material 3 elevation.
abstract class M3ElevationUtils {
  /// Gets the surface tint opacity for a given elevation level.
  static double getSurfaceTintOpacity(double elevation) {
    if (elevation <= M3ElevationLevels.level0) return M3SurfaceTones.level0;
    if (elevation <= M3ElevationLevels.level1) return M3SurfaceTones.level1;
    if (elevation <= M3ElevationLevels.level2) return M3SurfaceTones.level2;
    if (elevation <= M3ElevationLevels.level3) return M3SurfaceTones.level3;
    if (elevation <= M3ElevationLevels.level4) return M3SurfaceTones.level4;
    return M3SurfaceTones.level5;
  }

  /// Determines if an elevation level should have a visible shadow.
  static bool hasVisibleShadow(double elevation) {
    return elevation > M3ElevationLevels.level0;
  }

  /// Gets the next higher elevation level.
  static double getNextLevel(double currentElevation) {
    if (currentElevation < M3ElevationLevels.level1) {
      return M3ElevationLevels.level1;
    } else if (currentElevation < M3ElevationLevels.level2) {
      return M3ElevationLevels.level2;
    } else if (currentElevation < M3ElevationLevels.level3) {
      return M3ElevationLevels.level3;
    } else if (currentElevation < M3ElevationLevels.level4) {
      return M3ElevationLevels.level4;
    } else {
      return M3ElevationLevels.level5;
    }
  }

  /// Gets the next lower elevation level.
  static double getPreviousLevel(double currentElevation) {
    if (currentElevation > M3ElevationLevels.level4) {
      return M3ElevationLevels.level4;
    } else if (currentElevation > M3ElevationLevels.level3) {
      return M3ElevationLevels.level3;
    } else if (currentElevation > M3ElevationLevels.level2) {
      return M3ElevationLevels.level2;
    } else if (currentElevation > M3ElevationLevels.level1) {
      return M3ElevationLevels.level1;
    } else {
      return M3ElevationLevels.level0;
    }
  }
}