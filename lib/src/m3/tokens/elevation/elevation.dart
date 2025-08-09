part of '../../../../material_design.dart';

/// {@template m3_elevation_token}
/// Defines the six standard elevation levels of the Material 3 design system.
///
/// These tokens represent a fixed collection of elevation steps used as a
/// baseline for positioning surfaces in the z-axis. Each elevation level
/// combines visual depth through shadows with surface tinting to create
/// a cohesive layering system that follows Material Design 3 principles.
///
/// ## Elevation System Overview
///
/// Material Design 3 uses elevation to:
/// - Create visual hierarchy between surfaces
/// - Indicate interaction states and focus
/// - Guide user attention to important content
/// - Provide depth and dimensionality to the interface
///
/// ## Usage Guidelines
///
/// Each elevation level has specific use cases:
/// - **Level 0**: Default surfaces, navigation rails
/// - **Level 1**: Cards, chips, text buttons at rest
/// - **Level 2**: Elevated buttons, menus, dialogs
/// - **Level 3**: FABs, tooltips, dropdown menus
/// - **Level 4**: Modal surfaces, navigation drawers
/// - **Level 5**: Modal dialogs, full-screen surfaces
///
/// ## Integration with Components
///
/// ```dart
/// // Apply elevation to a Card
/// Card(
///   elevation: M3Elevation.level1.dp,
///   child: content,
/// )
///
/// // Use elevation for custom surfaces
/// Container(
///   decoration: BoxDecoration(
///     boxShadow: M3Elevation.level2.shadows,
///     color: M3Elevation.level2.surfaceColor(context),
///   ),
/// )
/// ```
///
/// Reference: https://m3.material.io/foundations/elevation/overview
/// {@endtemplate}
/// ATOM
class M3Elevation {
  const M3Elevation._({
    required this.dp,
    required this.hasShadow,
    required List<M3BoxShadow> shadows,
  }) : _shadows = shadows;

  /// The elevation logical pixels (dp).
  ///
  /// This dp determines the perceived distance between surfaces and is the
  /// basis for calculating shadow intensity and surface tint color.
  final double dp;

  final bool hasShadow;
  final List<M3BoxShadow> _shadows;
  List<M3BoxShadow> get shadows => hasShadow ? _shadows : [];

  /// Calculates the surface color using Flutter's default tint overlay.
  Color surfaceColor(BuildContext context) =>
      M3SurfaceTint.fromElevationToken(context, this);

  /// Returns a shadow token for a given elevation value in dp.
  /// This method contains the core logic and is the single source of truth.
  static M3Elevation fromValue(double value) => switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };

  /// The base level, with no elevation (0 dp).
  ///
  /// Used for default surfaces that sit directly on the background.
  /// Common components: app backgrounds, navigation rails, and surface
  /// containers that don't need visual separation.
  ///
  /// **Visual characteristics:**
  /// - No shadow cast
  /// - No surface tint applied
  /// - Appears flush with the background
  ///
  /// **Typical use cases:**
  /// - App background surfaces
  /// - Navigation rail containers
  /// - Text button backgrounds
  /// - Switch track backgrounds
  ///
  /// Example:
  /// ```dart
  /// Container(
  ///   color: Theme.of(context).colorScheme.surface,
  ///   // No additional elevation styling needed
  /// )
  /// ```
  static const level0 = M3Elevation._(
    dp: 0,

    /// {@template m3_shadow_level_0}
    /// Level 0 shadow: No shadow (empty list).
    ///
    /// Used for components at surface level with no elevation.
    /// This represents the base state where surfaces rest directly
    /// on the background without any visual depth indication.
    /// {@endtemplate}
    shadows: [],
    hasShadow: true,
  );

  /// A subtle elevation (1 dp) for resting-state interactive components.
  ///
  /// Provides minimal visual separation while maintaining a close relationship
  /// to the background. Perfect for components that need slight emphasis
  /// without dominating the interface.
  ///
  /// **Visual characteristics:**
  /// - Very subtle shadow
  /// - Minimal surface tint overlay
  /// - Slight separation from background
  ///
  /// **Typical use cases:**
  /// - [Card] components at rest
  /// - [Chip] components
  /// - Elevated button backgrounds at rest
  /// - Bottom sheet surfaces
  /// - Search bar containers
  ///
  /// Example:
  /// ```dart
  /// Card(
  ///   elevation: M3Elevation.level1.dp,
  ///   child: content,
  /// )
  /// ```
  static const level1 = M3Elevation._(
    dp: M3ElevationDps.level1,
    shadows: M3ElevationShadows.level1,
    hasShadow: true,
  );

  /// A more distinct elevation (3 dp) for prominent interactive surfaces.
  ///
  /// Creates clear visual separation while maintaining accessibility and
  /// readability. Ideal for surfaces that need attention but aren't the
  /// primary focus.
  ///
  /// **Visual characteristics:**
  /// - Noticeable shadow with soft edges
  /// - Moderate surface tint overlay
  /// - Clear separation from background
  ///
  /// **Typical use cases:**
  /// - App bars and top app bars
  /// - Bottom app bars
  /// - Menu surfaces and dropdown menus
  /// - Date picker surfaces
  /// - Navigation drawer containers
  /// - Tooltip backgrounds
  ///
  /// Example:
  /// ```dart
  /// AppBar(
  ///   elevation: M3Elevation.level2.dp,
  ///   title: Text('App Title'),
  /// )
  /// ```
  static const level2 = M3Elevation._(
    dp: M3ElevationDps.level2,
    shadows: M3ElevationShadows.level2,
    hasShadow: true,
  );

  /// A prominent elevation (6 dp) for key interactive elements.
  ///
  /// Provides strong visual emphasis for components that require user
  /// attention or represent primary actions. Creates significant depth
  /// while maintaining harmony with the overall design.
  ///
  /// **Visual characteristics:**
  /// - Prominent shadow with good definition
  /// - Noticeable surface tint overlay
  /// - Strong separation from background
  ///
  /// **Typical use cases:**
  /// - [FloatingActionButton] at rest
  /// - Modal bottom sheets
  /// - Dialog surfaces
  /// - Snackbar containers
  /// - Time picker surfaces
  /// - Autocomplete menu surfaces
  ///
  /// Example:
  /// ```dart
  /// FloatingActionButton(
  ///   elevation: M3Elevation.level3.dp,
  ///   onPressed: () {},
  ///   child: Icon(Icons.add),
  /// )
  /// ```
  static const level3 = M3Elevation._(
    dp: M3ElevationDps.level3,
    shadows: M3ElevationShadows.level3,
    hasShadow: true,
  );

  /// A higher elevation (8 dp) for components requiring significant emphasis.
  ///
  /// Used sparingly for surfaces that need to command attention or float
  /// above other elevated content. Provides strong visual hierarchy
  /// without overwhelming the interface.
  ///
  /// **Visual characteristics:**
  /// - Strong, well-defined shadow
  /// - Significant surface tint overlay
  /// - Pronounced separation from background
  ///
  /// **Typical use cases:**
  /// - Navigation drawer surfaces
  /// - Modal surfaces during interaction
  /// - [FloatingActionButton] during hover/focus states
  /// - Drag handles during interaction
  /// - Critical alert surfaces
  ///
  /// Example:
  /// ```dart
  /// Drawer(
  ///   elevation: M3Elevation.level4.dp,
  ///   child: navigationContent,
  /// )
  /// ```
  static const level4 = M3Elevation._(
    dp: M3ElevationDps.level4,
    shadows: M3ElevationShadows.level4,
    hasShadow: true,
  );

  /// The highest standard elevation (12 dp) for critical modal surfaces.
  ///
  /// Reserved for surfaces that must appear above all other content.
  /// Used sparingly to maintain visual hierarchy and prevent elevation
  /// inflation throughout the interface.
  ///
  /// **Visual characteristics:**
  /// - Maximum shadow intensity
  /// - Strong surface tint overlay
  /// - Complete visual separation from background
  ///
  /// **Typical use cases:**
  /// - Modal dialogs and alert dialogs
  /// - Full-screen modal surfaces
  /// - Critical system overlays
  /// - Temporary surfaces requiring immediate attention
  /// - Confirmation dialogs
  ///
  /// Example:
  /// ```dart
  /// AlertDialog(
  ///   elevation: M3Elevation.level5.dp,
  ///   title: Text('Confirm Action'),
  ///   content: Text('Are you sure?'),
  ///   actions: actions,
  /// )
  /// ```
  static const level5 = M3Elevation._(
    dp: M3ElevationDps.level5,
    shadows: M3ElevationShadows.level5,
    hasShadow: true,
  );
}

/// Provides visual calculation behaviors for any [M3Elevation].
///
/// This extension attaches the core rendering logic to all elevation tokens,
/// decoupling the token's definition from its visual implementation.
extension M3ElevationVisuals on M3Elevation {
  /// Calculates the surface color using Flutter's default tint overlay.
  Color surfaceColor(BuildContext context) =>
      M3SurfaceTint.fromElevationToken(context, this);

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

/// Provides comparison utility methods for [M3Elevation].
extension M3ElevationComparison on M3Elevation {
  /// Checks if this elevation is higher than another token's elevation.
  bool isHigherThan(M3Elevation other) => dp > other.dp;

  /// Checks if this elevation is lower than another token's elevation.
  bool isLowerThan(M3Elevation other) => dp < other.dp;

  /// Returns the absolute difference in elevation between this and another
  /// token.
  double differenceFrom(M3Elevation other) => (dp - other.dp).abs();
}

// /// {@template m3_component_elevation_token}
// /// Defines the default, resting-state elevation for key Material 3 components.
// ///
// /// Each value maps directly to a specific component type, ensuring consistent
// /// styling across an application.
// /// {@endtemplate}
// enum M3ComponentElevationToken implements M3Elevation {
//   /// Resting elevation for [Card] (1 dp).
//   card(M3ElevationDps.level1),

//   /// Resting elevation for [TextButton] and [OutlinedButton] (0 dp).
//   button(M3ElevationDps.level0),

//   /// Resting elevation for [ElevatedButton] (1 dp).
//   elevatedButton(M3ElevationDps.level1),

//   /// Resting elevation for [FloatingActionButton] (6 dp).
//   fab(M3ElevationDps.level3),

//   /// Resting elevation for [AppBar] (3 dp, no shadow).
//   appBar(M3ElevationDps.level2, hasShadow: false),

//   /// Resting elevation for [BottomAppBar] (3 dp).
//   bottomAppBar(M3ElevationDps.level2),

//   /// Resting elevation for [Drawer] (1 dp).
//   drawer(M3ElevationDps.level1),

//   /// Resting elevation for [BottomSheet] (1 dp).
//   bottomSheet(M3ElevationDps.level1),

//   /// Resting elevation for [Dialog] (6 dp).
//   dialog(M3ElevationDps.level3),

//   /// Resting elevation for [SnackBar] (6 dp, no shadow).
//   snackbar(M3ElevationDps.level3, hasShadow: false),

//   /// Resting elevation for [Tooltip] (3 dp, no shadow).
//   tooltip(M3ElevationDps.level2, hasShadow: false),

//   /// Resting elevation for [Menu] and [DropdownMenu] (3 dp).
//   menu(M3ElevationDps.level2),

//   /// Resting elevation for [NavigationBar] (3 dp).
//   navigationBar(M3ElevationDps.level2),

//   /// Resting elevation for [NavigationRail] (0 dp).
//   navigationRail(M3ElevationDps.level0),

//   /// Resting elevation for [SearchBar] (1 dp).
//   searchBar(M3ElevationDps.level1),

//   /// Resting elevation for [Chip] (0 dp).
//   chip(M3ElevationDps.level0);

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
// enum M3StateElevationToken implements M3Elevation {
//   /// Elevation for a [Card] in a hovered state (3 dp).
//   cardHover(M3ElevationDps.level2),

//   /// Elevation for a [Card] in a pressed state (1 dp).
//   cardPressed(M3ElevationDps.level1),

//   /// Elevation for a button in a hovered state (2 dp).
//   buttonHover(2), // TODO(fluttely): Verify this value against M3 specification

//   /// Elevation for a button in a pressed state (1 dp).
//   buttonPressed(M3ElevationDps.level1),

//   /// Elevation for a [FloatingActionButton] in a hovered state (8 dp).
//   fabHover(M3ElevationDps.level4),

//   /// Elevation for a [FloatingActionButton] in a pressed state (8 dp).
//   fabPressed(M3ElevationDps.level4),

//   /// Elevation for a filled [IconButton] in a hovered state (3 dp).
//   filledIconButtonHover(M3ElevationDps.level2),

//   /// Elevation for a filled [IconButton] in a pressed state (1 dp).
//   filledIconButtonPressed(M3ElevationDps.level1),

//   /// Elevation for a [Chip] in a dragged state (8 dp).
//   chipDragged(M3ElevationDps.level4),

//   /// Elevation for a [Switch] thumb in its resting state (1 dp).
//   switchThumbRest(M3ElevationDps.level1),

//   /// Elevation for a [Switch] thumb in a hovered state (3 dp).
//   switchThumbHover(M3ElevationDps.level2),

//   /// Elevation for a [Switch] thumb in a pressed state (6 dp).
//   switchThumbPressed(M3ElevationDps.level3),

//   /// Elevation for a [NavigationBar] indicator in a hovered state (3 dp).
//   navigationBarIndicatorHover(M3ElevationDps.level2),

//   /// Elevation for a [NavigationBar] indicator in a focused state (3 dp).
//   navigationBarIndicatorFocus(M3ElevationDps.level2),

//   /// Elevation for a [NavigationRail] indicator in a hovered state (3 dp).
//   navigationRailIndicatorHover(M3ElevationDps.level2),

//   /// Elevation for a [NavigationRail] indicator in a focused state (3 dp).
//   navigationRailIndicatorFocus(M3ElevationDps.level2);

//   const M3StateElevationToken(this.value);

//   @override
//   final double value;

//   @override
//   bool get hasShadow => true;
// }
