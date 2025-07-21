import 'package:flutter/material.dart';

/// Represents the elevation profile of a Material Design 3 component,
/// including its dp value and whether it casts a shadow.
@immutable
class M3ElevationProfile {
  /// The elevation value in logical pixels (dp).
  final double dp;

  /// Whether this elevation profile should cast a shadow.
  ///
  /// According to M3, some components like Snackbars or scrolled AppBars
  /// use tonal elevation (tint) but do not cast a shadow.
  final bool hasShadow;

  const M3ElevationProfile(this.dp, {this.hasShadow = true});

  /// Creates a copy of this profile but with the given fields replaced with
  /// the new values. This is the standard pattern for immutable objects.
  M3ElevationProfile copyWith({
    double? dp,
    bool? hasShadow,
  }) {
    return M3ElevationProfile(
      dp ?? this.dp,
      hasShadow: hasShadow ?? this.hasShadow,
    );
  }

  /// A convenience getter to create a copy of this profile with no shadow.
  M3ElevationProfile get withoutShadow => copyWith(hasShadow: false);
}

/// Defines elevation profiles used for Material surfaces following the M3 spec.
///
/// Each profile contains a `dp` value and a `hasShadow` flag to correctly
/// represent M3's elevation system, which uses both surface tint and shadows.
///
/// Reference: https://m3.material.io/styles/elevation/overview
@immutable
abstract class M3Elevation {
  // --- Generic Elevation Levels ---

  /// Level 0 (0dp): No elevation. Used for base surfaces.
  static const M3ElevationProfile level0 = M3ElevationProfile(0);

  /// Level 1 (1dp): Subtle lift. Used for components like Cards and Drawers.
  static const M3ElevationProfile level1 = M3ElevationProfile(1);

  /// Level 2 (3dp): A clear elevation. Used for components like Menus and Bottom App Bars.
  static const M3ElevationProfile level2 = M3ElevationProfile(3);

  /// Level 3 (6dp): High elevation for floating components like FABs and Dialogs.
  static const M3ElevationProfile level3 = M3ElevationProfile(6);

  /// Level 4 (8dp): Higher elevation, often for temporary or hovered states.
  static const M3ElevationProfile level4 = M3ElevationProfile(8);

  /// Level 5 (12dp): The highest elevation, for critical modal components.
  static const M3ElevationProfile level5 = M3ElevationProfile(12);
}

/// Defines the default, resting-state elevation profiles for specific Material 3 components.
///
/// These tokens map a foundational elevation level to a UI component according
/// to the official M3 specification.
///
/// Reference: https://m3.material.io/styles/elevation/overview
@immutable
abstract class M3ComponentElevation {
  /// Elevated Card: Uses tint and shadow.
  static const M3ElevationProfile card = M3Elevation.level1;

  /// Regular Button: Flat design with no elevation (M3 spec).
  static const M3ElevationProfile button = M3Elevation.level0;

  /// Elevated Button variant: Uses tint and shadow.
  static const M3ElevationProfile elevatedButton = M3Elevation.level1;

  /// FAB (Floating Action Button): Uses tint and a prominent shadow.
  static const M3ElevationProfile fab = M3Elevation.level3;

  /// Top App Bar (when content scrolls under it): Uses ONLY tint, NO shadow.
  static final M3ElevationProfile appBar =
      M3ElevationProfile(M3Elevation.level2.dp, hasShadow: false);

  /// Bottom App Bar: Uses tint and shadow.
  static const M3ElevationProfile bottomAppBar = M3Elevation.level2;

  /// Navigation Drawer (modal): Uses tint and shadow to stand out.
  static const M3ElevationProfile drawer = M3Elevation.level1;

  /// Bottom Sheet (modal): Uses tint and shadow.
  static const M3ElevationProfile bottomSheet = M3Elevation.level1;

  /// Dialog: Uses tint and a well-defined shadow.
  static const M3ElevationProfile dialog = M3Elevation.level3;

  /// Snackbar: Uses ONLY tint to be less intrusive, NO shadow.
  static final M3ElevationProfile snackbar =
      M3ElevationProfile(M3Elevation.level3.dp, hasShadow: false);

  /// Tooltip: Uses ONLY tint, NO shadow.
  static final M3ElevationProfile tooltip =
      M3ElevationProfile(M3Elevation.level2.dp, hasShadow: false);

  /// Menu and Dropdown: Use tint and shadow.
  static const M3ElevationProfile menu = M3Elevation.level2;

  /// Navigation Bar (bottom): Uses tint and shadow.
  static const M3ElevationProfile navigationBar = M3Elevation.level2;

  /// Navigation Rail (side): Container is at level 0, but indicators have elevation.
  static const M3ElevationProfile navigationRail = M3Elevation.level0;

  /// Search Bar (at rest): Uses tint and shadow.
  static const M3ElevationProfile searchBar = M3Elevation.level1;

  /// Chip (at rest): No elevation.
  static const M3ElevationProfile chip = M3Elevation.level0;
}

/// Defines the elevation profiles for Material 3 components in interactive states.
///
/// These tokens specify the elevation change when a user hovers, presses,
/// focuses, or drags a component.
///
/// Reference: https://m3.material.io/foundations/interaction/states/overview
@immutable
abstract class M3StateElevation {
  /// Card when hovered.
  static const M3ElevationProfile cardHover = M3Elevation.level2;

  /// Card when pressed.
  static const M3ElevationProfile cardPressed = M3Elevation.level1;

  /// Elevated Button when hovered.
  static const M3ElevationProfile buttonHover = M3Elevation.level2;

  /// Elevated Button when pressed.
  static const M3ElevationProfile buttonPressed = M3Elevation.level1;

  /// FAB when hovered.
  static const M3ElevationProfile fabHover = M3Elevation.level4;

  /// FAB when pressed.
  static const M3ElevationProfile fabPressed = M3Elevation.level4;

  /// Filled Icon Button when hovered.
  static const M3ElevationProfile filledIconButtonHover = M3Elevation.level2;

  /// Filled Icon Button when pressed.
  static const M3ElevationProfile filledIconButtonPressed = M3Elevation.level1;

  /// Chip when dragged.
  static const M3ElevationProfile chipDragged = M3Elevation.level4;

  /// Switch thumb at rest.
  static const M3ElevationProfile switchThumbRest = M3Elevation.level1;

  /// Switch thumb when hovered.
  static const M3ElevationProfile switchThumbHover = M3Elevation.level2;

  /// Switch thumb when pressed.
  static const M3ElevationProfile switchThumbPressed = M3Elevation.level3;

  /// Navigation Bar indicator when hovered.
  static const M3ElevationProfile navigationBarIndicatorHover =
      M3Elevation.level2;

  /// Navigation Bar indicator when focused.
  static const M3ElevationProfile navigationBarIndicatorFocus =
      M3Elevation.level2;

  /// Navigation Rail indicator when hovered.
  static const M3ElevationProfile navigationRailIndicatorHover =
      M3Elevation.level2;

  /// Navigation Rail indicator when focused.
  static const M3ElevationProfile navigationRailIndicatorFocus =
      M3Elevation.level2;
}
