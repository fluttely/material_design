part of '../../../../../material_design.dart';

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
/// For general-purpose, semantic usage, prefer using [M3BoxShadowToken].
/// Reference: https://m3.material.io/styles/elevation/shadows
abstract final class M3Shadows {
  // Private constructor to prevent instantiation.
  const M3Shadows._();

  /// {@template m3_shadow_level_0}
  /// Level 0 shadow: No shadow (empty list).
  ///
  /// Used for components at surface level with no elevation.
  /// This represents the base state where surfaces rest directly
  /// on the background without any visual depth indication.
  /// {@endtemplate}
  static const List<BoxShadow> level0 = [];

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
  static const List<BoxShadow> level1 = [
    BoxShadow(
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
  static const List<BoxShadow> level2 = [
    BoxShadow(
      color: _color,
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
    BoxShadow(
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
  static const List<BoxShadow> level3 = [
    BoxShadow(
      color: _color,
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
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
  static const List<BoxShadow> level4 = [
    BoxShadow(
      color: _color,
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
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
  /// - **Layer 2**: Maximum ambient shadow (offset: 4dp, blur: 12dp, spread: 3dp)
  /// {@endtemplate}
  static const List<BoxShadow> level5 = [
    BoxShadow(
      color: _color,
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: _color,
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 3,
    ),
  ];
}

/// {@template m3_shadow_token}
/// Internal shadow token system for Material Design 3 elevation.
///
/// This enum provides pre-defined, specification-compliant shadow
/// configurations
/// that correspond to Material Design 3's five standard elevation levels. Each
/// shadow configuration consists of carefully crafted BoxShadow layers that
/// create natural depth perception.
///
/// ## Shadow System Architecture
///
/// Material Design 3 shadows use a dual-layer approach:
/// 1. **Definition Layer**: Sharp, close shadow for edge definition
/// 2. **Ambient Layer**: Soft, spread shadow for realistic depth
///
/// ## Integration with Elevation
///
/// While shadows provide visual depth cues, Material Design 3 primarily
/// relies on **surface tint** for elevation indication. Shadows serve as
/// a complementary element that enhances the depth perception created
/// by tonal elevation.
///
/// ## Usage Pattern
///
/// ```dart
/// // Get shadows for elevation level
/// final shadows = M3BoxShadowToken.fromElevation(M3ElevationToken.level3);
///
/// // Apply to container
/// Container(
///   decoration: M3BoxDecoration(
///     color: surfaceColor,
///     boxShadow: shadows.value,
///   ),
/// );
/// ```
///
/// ## Performance Considerations
///
/// - Each shadow level is pre-calculated for optimal performance
/// - Shadow configurations are immutable and cached
/// - Dual-layer shadows provide maximum visual impact with minimal
///   rendering cost
///
/// **Internal Implementation**: This is a private token used by the elevation
/// system. External code should use [M3ElevationToken] and its extensions.
///
/// Reference: https://m3.material.io/styles/elevation/shadows
/// {@endtemplate}
enum M3BoxShadowToken implements IM3Token<List<BoxShadow>> {
  /// Level 0: No shadow.
  level0(M3Shadows.level0),

  /// Level 1 (1dp): A single, subtle shadow.
  level1(M3Shadows.level1),

  /// Level 2 (3dp): Two subtle shadows for added depth.
  level2(M3Shadows.level2),

  /// Level 3 (6dp): Two slightly more pronounced shadows.
  level3(M3Shadows.level3),

  /// Level 4 (8dp): Two distinct shadows for high elevation.
  level4(M3Shadows.level4),

  /// Level 5 (12dp): The strongest shadows for maximum elevation.
  level5(M3Shadows.level5);

  const M3BoxShadowToken(this.value);

  /// Returns a shadow token for a given M3ElevationToken.
  /// This method now delegates the logic to fromElevationValue.
  factory M3BoxShadowToken.fromElevation(IM3ElevationToken elevation) =>
      M3BoxShadowToken.fromElevationValue(elevation.value);

  /// Returns a shadow token for a given elevation value in dp.
  /// This method contains the core logic and is the single source of truth.
  factory M3BoxShadowToken.fromElevationValue(double value) => switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };

  /// The shadows for this elevation level.
  @override
  final List<BoxShadow> value;

  // /// The color used for M3 shadows is black with 15% opacity.
  // /// 0x26 = 38 in decimal = 15% of 255 = 38/255 ≈ 0.149 opacity
  // Color get shadowColor => M3Shadows.color;
}
