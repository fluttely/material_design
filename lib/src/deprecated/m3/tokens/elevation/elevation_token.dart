part of '../../../../../material_design.dart';

/// Material Design 3 elevation constants in logical pixels (dp).
@Deprecated('Use M3ElevationDps.levelX instead')
abstract final class M3Elevations {
  // Private constructor to prevent instantiation.
  @deprecated
  const M3Elevations._();

  /// The base level, with no elevation (0 dp). Used for default surfaces.
  static const double level0 = 0;

  /// A subtle elevation (1 dp), typically for resting-state components like
  /// [Card].
  static const double level1 = 1;

  /// A more distinct elevation (3 dp), often used for menus and dialogs.
  static const double level2 = 3;

  /// A prominent elevation (6 dp), used for components like
  /// [FloatingActionButton].
  static const double level3 = 6;

  /// A higher elevation (8 dp) for components that need to stand out
  /// significantly.
  static const double level4 = 8;

  /// The highest standard elevation (12 dp), reserved for critical temporary
  /// surfaces.
  static const double level5 = 12;

  /// The list of [M3BoxShadow]s that represent this elevation level.
  List<M3BoxShadow> shadows(double elevation) =>
      M3Shadows.fromElevation(elevation);
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
@Deprecated('Use M3Elevation instead')
@immutable
abstract interface class IM3ElevationToken implements IM3Token<double> {
  @deprecated
  double get dp;

  /// Determines whether this elevation profile should cast a shadow.
  ///
  /// While most elevated surfaces cast shadows, some components like [AppBar]
  /// may use elevation to apply a surface tint without casting a shadow.
  @deprecated
  bool get hasShadow;
}

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
///   elevation: M3ElevationToken2.level1.value,
///   child: content,
/// )
///
/// // Use elevation for custom surfaces
/// Container(
///   decoration: BoxDecoration(
///     boxShadow: M3ElevationToken2.level2.shadows,
///     color: M3ElevationToken2.level2.surfaceColor(context),
///   ),
/// )
/// ```
///
/// Reference: https://m3.material.io/foundations/elevation/overview
/// {@endtemplate}
/// ATOM
@Deprecated('Use M3Elevation instead')
enum M3ElevationToken implements IM3ElevationToken {
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
  level0(M3Elevations.level0),

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
  ///   elevation: M3ElevationToken2.level1.value,
  ///   child: content,
  /// )
  /// ```
  level1(M3Elevations.level1),

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
  ///   elevation: M3ElevationToken2.level2.value,
  ///   title: Text('App Title'),
  /// )
  /// ```
  level2(M3Elevations.level2),

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
  ///   elevation: M3ElevationToken2.level3.value,
  ///   onPressed: () {},
  ///   child: Icon(Icons.add),
  /// )
  /// ```
  level3(M3Elevations.level3),

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
  ///   elevation: M3ElevationToken2.level4.value,
  ///   child: navigationContent,
  /// )
  /// ```
  level4(M3Elevations.level4),

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
  ///   elevation: M3ElevationToken2.level5.value,
  ///   title: Text('Confirm Action'),
  ///   content: Text('Are you sure?'),
  ///   actions: actions,
  /// )
  /// ```
  level5(M3Elevations.level5);

  const M3ElevationToken(this.value);

  /// The elevation value in logical pixels (dp).
  ///
  /// This value determines the perceived distance between surfaces and is the
  /// basis for calculating shadow intensity and surface tint color.
  @override
  final double value;

  @override
  double get dp => value;

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
// enum M3ComponentElevationToken implements IM3ElevationToken2 {
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
// enum M3StateElevationToken implements IM3ElevationToken2 {
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
