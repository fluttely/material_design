part of '../../../../material_design.dart';

/// {@template m3_shadow_color}
/// The standard shadow color for Material Design 3 elevation system.
///
/// This color (black with 15% opacity, #26000000) is specifically calibrated
/// to provide optimal shadow contrast across both light and dark themes while
/// maintaining accessibility standards.
///
/// The 15% opacity ensures shadows are visible but not overwhelming, creating
/// subtle depth cues that enhance the visual hierarchy without competing with
/// content for attention.
/// {@endtemplate}
const Color _color = Color(0x26000000);

/// A collection of pre-defined, specification-compliant raw shadow values
/// for the Material Design 3 system.
///
/// This class provides direct access to the `const List<BoxShadow>` values
/// for advanced use cases or when a compile-time constant is required.
///
/// For general-purpose, semantic usage, prefer using [M3ElevationShadows].
/// Reference: https://m3.material.io/styles/elevation/shadows
/// IT'S NOT AN ATOM
abstract final class M3ElevationShadows {
  // Private constructor to prevent instantiation.
  const M3ElevationShadows._();

  /// {@template m3_shadow_level_0}
  /// Level 0 shadow: No shadow (empty list).
  ///
  /// Used for components at surface level with no elevation.
  /// This represents the base state where surfaces rest directly
  /// on the background without any visual depth indication.
  /// {@endtemplate}
  static const List<M3BoxShadow> level0 = [];

  /// {@template m3_shadow_level_1}
  /// Level 1 shadow (1dp elevation): Single subtle shadow.
  ///
  /// Creates minimal depth perception with a single soft shadow.
  /// Ideal for components like Cards in their resting state,
  /// providing subtle separation from the background.
  ///
  /// **Shadow properties**:
  /// - Vertical offset: 1dp
  /// - Blur radius: 2dp
  /// - No spread or horizontal offset
  /// {@endtemplate}
  static const List<M3BoxShadow> level1 = [
    M3BoxShadow._(
      color: _color,
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  /// {@template m3_shadow_level_2}
  /// Level 2 shadow (3dp elevation): Dual-layer shadow system.
  ///
  /// Combines a sharp definition shadow with a soft ambient shadow,
  /// creating more pronounced depth. Used for components like
  /// elevated buttons and focused elements.
  ///
  /// **Shadow properties**:
  /// - **Layer 1**: Sharp shadow (offset: 1dp, blur: 3dp)
  /// - **Layer 2**: Soft shadow (offset: 2dp, blur: 6dp, spread: 2dp)
  /// {@endtemplate}
  static const List<M3BoxShadow> level2 = [
    M3BoxShadow._(
      color: _color,
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
    M3BoxShadow._(
      color: _color,
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 2,
    ),
  ];

  /// {@template m3_shadow_level_3}
  /// Level 3 shadow (6dp elevation): Enhanced dual-layer depth.
  ///
  /// Provides distinct elevation for prominent components like
  /// FloatingActionButtons and elevated dialogs. The dual shadow
  /// system creates natural depth perception.
  ///
  /// **Shadow properties**:
  /// - **Layer 1**: Definition shadow (offset: 2dp, blur: 4dp)
  /// - **Layer 2**: Ambient shadow (offset: 4dp, blur: 8dp, spread: 3dp)
  /// {@endtemplate}
  static const List<M3BoxShadow> level3 = [
    M3BoxShadow._(
      color: _color,
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    M3BoxShadow._(
      color: _color,
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 3,
    ),
  ];

  /// {@template m3_shadow_level_4}
  /// Level 4 shadow (8dp elevation): High-elevation shadow system.
  ///
  /// Creates substantial depth for components that need significant
  /// visual separation, such as modal surfaces and prominent overlays.
  /// The increased blur creates softer, more diffused shadows.
  ///
  /// **Shadow properties**:
  /// - **Layer 1**: Definition shadow (offset: 2dp, blur: 4dp)
  /// - **Layer 2**: Extended ambient shadow (offset: 4dp, blur: 10dp, spread:
  /// 3dp)
  /// {@endtemplate}
  static const List<M3BoxShadow> level4 = [
    M3BoxShadow._(
      color: _color,
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    M3BoxShadow._(
      color: _color,
      offset: Offset(0, 4),
      blurRadius: 10,
      spreadRadius: 3,
    ),
  ];

  /// {@template m3_shadow_level_5}
  /// Level 5 shadow (12dp elevation): Maximum depth shadow system.
  ///
  /// The strongest shadow configuration for components requiring
  /// maximum visual separation, such as modal dialogs and critical
  /// overlays. Creates the most dramatic depth effect in the system.
  ///
  /// **Shadow properties**:
  /// - **Layer 1**: Definition shadow (offset: 2dp, blur: 4dp)
  /// - **Layer 2**: Maximum ambient shadow (offset: 4dp, blur: 12dp,
  ///   spread: 3dp)
  /// {@endtemplate}
  static const List<M3BoxShadow> level5 = [
    M3BoxShadow._(
      color: _color,
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    M3BoxShadow._(
      color: _color,
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 3,
    ),
  ];

  /// Returns a shadow token for a given M3Elevation.
  /// This method now delegates the logic to fromElevationValue.
  static List<M3BoxShadow> fromElevationToken(M3Elevation elevation) =>
      fromElevation(elevation.dp);

  /// Returns a shadow token for a given elevation value in dp.
  /// This method contains the core logic and is the single source of truth.
  static List<M3BoxShadow> fromElevation(double value) => switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };
}
