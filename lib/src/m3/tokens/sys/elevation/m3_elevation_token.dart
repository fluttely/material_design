part of '../../../../../material_design.dart';

abstract final class M3Elevations {
  // Private constructor to prevent instantiation.
  M3Elevations._();
  static const double level0 = 0;
  static const double level1 = 1;
  static const double level2 = 3;
  static const double level3 = 6;
  static const double level4 = 8;
  static const double level5 = 12;
}

/// {@template im3_elevation_token}
/// Represents the contract for a Material 3 elevation token.
///
/// This interface establishes the essential properties required for any
/// object
/// that defines an elevation level. It ensures that all tokens, whether
/// standard,
/// component-specific, or custom, can be processed consistently to render
/// surface colors and shadows according to Material Design 3 principles.
/// {@endtemplate}
@immutable
abstract interface class IM3ElevationToken implements IM3Token<double> {
  /// Determines whether this elevation profile should cast a shadow.
  ///
  /// While most elevated surfaces cast shadows, some components like [AppBar]
  /// may use elevation to apply a surface tint without casting a shadow.
  bool get hasShadow;
}

/// {@template m3_elevation_token}
/// Defines the five standard elevation levels of the Material 3 design system.
///
/// These tokens represent a fixed collection of elevation steps used as a
/// baseline
/// for positioning surfaces in the z-axis.
/// {@endtemplate}
enum M3ElevationToken implements IM3ElevationToken {
  /// The base level, with no elevation (0 dp). Used for default surfaces.
  level0(M3Elevations.level0),

  /// A subtle elevation (1 dp), typically for resting-state components like
  /// [Card].
  level1(M3Elevations.level1),

  /// A more distinct elevation (3 dp), often used for menus and dialogs.
  level2(M3Elevations.level2),

  /// A prominent elevation (6 dp), used for components like
  /// [FloatingActionButton].
  level3(M3Elevations.level3),

  /// A higher elevation (8 dp) for components that need to stand out
  /// significantly.
  level4(M3Elevations.level4),

  /// The highest standard elevation (12 dp), reserved for critical temporary
  /// surfaces.
  level5(M3Elevations.level5);

  const M3ElevationToken(this.value);

  /// The elevation value in logical pixels (dp).
  ///
  /// This value determines the perceived distance between surfaces and is the
  /// basis for calculating shadow intensity and surface tint color.
  @override
  final double value;

  @override
  bool get hasShadow => true;

  /// Returns a shadow token for a given elevation value in dp.
  /// This method contains the core logic and is the single source of truth.
  static M3ElevationToken fromValue(double value) => switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };
}

// /// {@template m3_component_elevation_token}
// /// Defines the default, resting-state elevation for key Material 3 components.
// ///
// /// Each value maps directly to a specific component type, ensuring consistent
// /// styling across an application.
// /// {@endtemplate}
// enum M3ComponentElevationToken implements IM3ElevationToken {
//   /// Resting elevation for [Card] (1 dp).
//   card(M3Elevations.level1),

//   /// Resting elevation for [TextButton] and [OutlinedButton] (0 dp).
//   button(M3Elevations.level0),

//   /// Resting elevation for [ElevatedButton] (1 dp).
//   elevatedButton(M3Elevations.level1),

//   /// Resting elevation for [FloatingActionButton] (6 dp).
//   fab(M3Elevations.level3),

//   /// Resting elevation for [AppBar] (3 dp, no shadow).
//   appBar(M3Elevations.level2, hasShadow: false),

//   /// Resting elevation for [BottomAppBar] (3 dp).
//   bottomAppBar(M3Elevations.level2),

//   /// Resting elevation for [Drawer] (1 dp).
//   drawer(M3Elevations.level1),

//   /// Resting elevation for [BottomSheet] (1 dp).
//   bottomSheet(M3Elevations.level1),

//   /// Resting elevation for [Dialog] (6 dp).
//   dialog(M3Elevations.level3),

//   /// Resting elevation for [SnackBar] (6 dp, no shadow).
//   snackbar(M3Elevations.level3, hasShadow: false),

//   /// Resting elevation for [Tooltip] (3 dp, no shadow).
//   tooltip(M3Elevations.level2, hasShadow: false),

//   /// Resting elevation for [Menu] and [DropdownMenu] (3 dp).
//   menu(M3Elevations.level2),

//   /// Resting elevation for [NavigationBar] (3 dp).
//   navigationBar(M3Elevations.level2),

//   /// Resting elevation for [NavigationRail] (0 dp).
//   navigationRail(M3Elevations.level0),

//   /// Resting elevation for [SearchBar] (1 dp).
//   searchBar(M3Elevations.level1),

//   /// Resting elevation for [Chip] (0 dp).
//   chip(M3Elevations.level0);

//   const M3ComponentElevationToken(this.value, {this.hasShadow = true});

//   @override
//   final double value;

//   @override
//   final bool hasShadow;
// }

// /// {@template m3_state_elevation_token}
// /// Defines elevation tokens for Material 3 components during interactive states.
// ///
// /// These elevations provide visual feedback for user interactions like hover,
// /// focus, press, and drag.
// /// {@endtemplate}
// enum M3StateElevationToken implements IM3ElevationToken {
//   /// Elevation for a [Card] in a hovered state (3 dp).
//   cardHover(M3Elevations.level2),

//   /// Elevation for a [Card] in a pressed state (1 dp).
//   cardPressed(M3Elevations.level1),

//   /// Elevation for a button in a hovered state (2 dp).
//   buttonHover(2), // TODO(fluttely): Verify this value against M3 specification

//   /// Elevation for a button in a pressed state (1 dp).
//   buttonPressed(M3Elevations.level1),

//   /// Elevation for a [FloatingActionButton] in a hovered state (8 dp).
//   fabHover(M3Elevations.level4),

//   /// Elevation for a [FloatingActionButton] in a pressed state (8 dp).
//   fabPressed(M3Elevations.level4),

//   /// Elevation for a filled [IconButton] in a hovered state (3 dp).
//   filledIconButtonHover(M3Elevations.level2),

//   /// Elevation for a filled [IconButton] in a pressed state (1 dp).
//   filledIconButtonPressed(M3Elevations.level1),

//   /// Elevation for a [Chip] in a dragged state (8 dp).
//   chipDragged(M3Elevations.level4),

//   /// Elevation for a [Switch] thumb in its resting state (1 dp).
//   switchThumbRest(M3Elevations.level1),

//   /// Elevation for a [Switch] thumb in a hovered state (3 dp).
//   switchThumbHover(M3Elevations.level2),

//   /// Elevation for a [Switch] thumb in a pressed state (6 dp).
//   switchThumbPressed(M3Elevations.level3),

//   /// Elevation for a [NavigationBar] indicator in a hovered state (3 dp).
//   navigationBarIndicatorHover(M3Elevations.level2),

//   /// Elevation for a [NavigationBar] indicator in a focused state (3 dp).
//   navigationBarIndicatorFocus(M3Elevations.level2),

//   /// Elevation for a [NavigationRail] indicator in a hovered state (3 dp).
//   navigationRailIndicatorHover(M3Elevations.level2),

//   /// Elevation for a [NavigationRail] indicator in a focused state (3 dp).
//   navigationRailIndicatorFocus(M3Elevations.level2);

//   const M3StateElevationToken(this.value);

//   @override
//   final double value;

//   @override
//   bool get hasShadow => true;
// }

/// Provides visual calculation behaviors for any [IM3ElevationToken].
///
/// This extension attaches the core rendering logic to all elevation tokens,
/// decoupling the token's definition from its visual implementation.
extension IM3ElevationTokenVisuals on IM3ElevationToken {
  /// The list of [BoxShadow]s that represent this elevation level.
  List<BoxShadow> get shadows => hasShadow
      ? M3BoxShadowToken.fromElevation(this).value
      : M3BoxShadowToken.level0.value;

  /// Calculates the surface color using Flutter's default tint overlay.
  Color surfaceColor(BuildContext context) =>
      M3SurfaceTint.fromElevation(context, this);

  /// Calculates surface color with a custom formula and tint color.
  ///
  /// This is a convenience method that delegates its logic to
  /// [M3SurfaceTint.calculateSurfaceColor].
  Color calculateSurfaceColor({
    required Color surface,
    required Color surfaceTint,
  }) =>
      M3SurfaceTint.calculateSurfaceColor(
        surface: surface,
        surfaceTint: surfaceTint,
        elevation: this,
      );

  /// Creates a high contrast surface color for accessibility.
  ///
  /// This is a convenience method that delegates its logic to
  /// [M3SurfaceTint.highContrastSurface].
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

/// Provides comparison utility methods for [IM3ElevationToken].
extension IM3ElevationTokenComparison on IM3ElevationToken {
  /// Checks if this elevation is higher than another token's elevation.
  bool isHigherThan(IM3ElevationToken other) => value > other.value;

  /// Checks if this elevation is lower than another token's elevation.
  bool isLowerThan(IM3ElevationToken other) => value < other.value;

  /// Returns the absolute difference in elevation between this and another
  /// token.
  double differenceFrom(IM3ElevationToken other) => (value - other.value).abs();
}
