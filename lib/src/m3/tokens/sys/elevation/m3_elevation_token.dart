/// M3ElevationToken
library;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

part '_m3_shadow_token.dart';
part '_m3_tonal_color.dart';

const double _kM3ElevationLevel0 = 0;
const double _kM3ElevationLevel1 = 1;
const double _kM3ElevationLevel2 = 3;
const double _kM3ElevationLevel3 = 6;
const double _kM3ElevationLevel4 = 8;
const double _kM3ElevationLevel5 = 12;

/// {@template im3_elevation_token}
/// Represents the contract for a Material 3 elevation token.
///
/// This interface establishes the essential properties required for any object
/// that defines an elevation level. It ensures that all tokens, whether standard,
/// component-specific, or custom, can be processed consistently to render
/// surface colors and shadows according to Material Design 3 principles.
/// {@endtemplate}
@immutable
abstract interface class IM3ElevationToken implements IM3Token<double> {
  /// The elevation value in logical pixels (dp).
  ///
  /// This value determines the perceived distance between surfaces and is the
  /// basis for calculating shadow intensity and surface tint color.
  @override
  double get value;

  /// Determines whether this elevation profile should cast a shadow.
  ///
  /// While most elevated surfaces cast shadows, some components like [AppBar]
  /// may use elevation to apply a surface tint without casting a shadow.
  bool get hasShadow;
}

/// {@template m3_elevation_token}
/// Defines the five standard elevation levels of the Material 3 design system.
///
/// These tokens represent a fixed collection of elevation steps used as a baseline
/// for positioning surfaces in the z-axis.
/// {@endtemplate}
enum M3ElevationToken implements IM3ElevationToken {
  /// The base level, with no elevation (0 dp). Used for default surfaces.
  level0(_kM3ElevationLevel0),

  /// A subtle elevation (1 dp), typically for resting-state components like [Card].
  level1(_kM3ElevationLevel1),

  /// A more distinct elevation (3 dp), often used for menus and dialogs.
  level2(_kM3ElevationLevel2),

  /// A prominent elevation (6 dp), used for components like [FloatingActionButton].
  level3(_kM3ElevationLevel3),

  /// A higher elevation (8 dp) for components that need to stand out significantly.
  level4(_kM3ElevationLevel4),

  /// The highest standard elevation (12 dp), reserved for critical temporary surfaces.
  level5(_kM3ElevationLevel5);

  const M3ElevationToken(this.value);

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

/// {@template m3_component_elevation_token}
/// Defines the default, resting-state elevation for key Material 3 components.
///
/// Each value maps directly to a specific component type, ensuring consistent
/// styling across an application.
/// {@endtemplate}
enum M3ComponentElevationToken implements IM3ElevationToken {
  /// Resting elevation for [Card] (1 dp).
  card(_kM3ElevationLevel1),

  /// Resting elevation for [TextButton] and [OutlinedButton] (0 dp).
  button(_kM3ElevationLevel0),

  /// Resting elevation for [ElevatedButton] (1 dp).
  elevatedButton(_kM3ElevationLevel1),

  /// Resting elevation for [FloatingActionButton] (6 dp).
  fab(_kM3ElevationLevel3),

  /// Resting elevation for [AppBar] (3 dp, no shadow).
  appBar(_kM3ElevationLevel2, hasShadow: false),

  /// Resting elevation for [BottomAppBar] (3 dp).
  bottomAppBar(_kM3ElevationLevel2),

  /// Resting elevation for [Drawer] (1 dp).
  drawer(_kM3ElevationLevel1),

  /// Resting elevation for [BottomSheet] (1 dp).
  bottomSheet(_kM3ElevationLevel1),

  /// Resting elevation for [Dialog] (6 dp).
  dialog(_kM3ElevationLevel3),

  /// Resting elevation for [SnackBar] (6 dp, no shadow).
  snackbar(_kM3ElevationLevel3, hasShadow: false),

  /// Resting elevation for [Tooltip] (3 dp, no shadow).
  tooltip(_kM3ElevationLevel2, hasShadow: false),

  /// Resting elevation for [Menu] and [DropdownMenu] (3 dp).
  menu(_kM3ElevationLevel2),

  /// Resting elevation for [NavigationBar] (3 dp).
  navigationBar(_kM3ElevationLevel2),

  /// Resting elevation for [NavigationRail] (0 dp).
  navigationRail(_kM3ElevationLevel0),

  /// Resting elevation for [SearchBar] (1 dp).
  searchBar(_kM3ElevationLevel1),

  /// Resting elevation for [Chip] (0 dp).
  chip(_kM3ElevationLevel0);

  const M3ComponentElevationToken(this.value, {this.hasShadow = true});

  @override
  final double value;

  @override
  final bool hasShadow;
}

/// {@template m3_state_elevation_token}
/// Defines elevation tokens for Material 3 components during interactive states.
///
/// These elevations provide visual feedback for user interactions like hover,
/// focus, press, and drag.
/// {@endtemplate}
enum M3StateElevationToken implements IM3ElevationToken {
  /// Elevation for a [Card] in a hovered state (3 dp).
  cardHover(_kM3ElevationLevel2),

  /// Elevation for a [Card] in a pressed state (1 dp).
  cardPressed(_kM3ElevationLevel1),

  /// Elevation for a button in a hovered state (2 dp).
  buttonHover(2), // TODO(fluttely): Verify this value against M3 specification

  /// Elevation for a button in a pressed state (1 dp).
  buttonPressed(_kM3ElevationLevel1),

  /// Elevation for a [FloatingActionButton] in a hovered state (8 dp).
  fabHover(_kM3ElevationLevel4),

  /// Elevation for a [FloatingActionButton] in a pressed state (8 dp).
  fabPressed(_kM3ElevationLevel4),

  /// Elevation for a filled [IconButton] in a hovered state (3 dp).
  filledIconButtonHover(_kM3ElevationLevel2),

  /// Elevation for a filled [IconButton] in a pressed state (1 dp).
  filledIconButtonPressed(_kM3ElevationLevel1),

  /// Elevation for a [Chip] in a dragged state (8 dp).
  chipDragged(_kM3ElevationLevel4),

  /// Elevation for a [Switch] thumb in its resting state (1 dp).
  switchThumbRest(_kM3ElevationLevel1),

  /// Elevation for a [Switch] thumb in a hovered state (3 dp).
  switchThumbHover(_kM3ElevationLevel2),

  /// Elevation for a [Switch] thumb in a pressed state (6 dp).
  switchThumbPressed(_kM3ElevationLevel3),

  /// Elevation for a [NavigationBar] indicator in a hovered state (3 dp).
  navigationBarIndicatorHover(_kM3ElevationLevel2),

  /// Elevation for a [NavigationBar] indicator in a focused state (3 dp).
  navigationBarIndicatorFocus(_kM3ElevationLevel2),

  /// Elevation for a [NavigationRail] indicator in a hovered state (3 dp).
  navigationRailIndicatorHover(_kM3ElevationLevel2),

  /// Elevation for a [NavigationRail] indicator in a focused state (3 dp).
  navigationRailIndicatorFocus(_kM3ElevationLevel2);

  const M3StateElevationToken(this.value);

  @override
  final double value;

  @override
  bool get hasShadow => true;
}

/// Provides visual calculation behaviors for any [IM3ElevationToken].
///
/// This extension attaches the core rendering logic to all elevation tokens,
/// decoupling the token's definition from its visual implementation.
extension IM3ElevationTokenVisuals on IM3ElevationToken {
  /// The list of [BoxShadow]s that represent this elevation level.
  List<BoxShadow> get shadows => hasShadow
      ? _M3ShadowToken.fromElevation(this).value
      : _M3ShadowToken.level0.value;

  /// Calculates the surface color using Flutter's default tint overlay.
  Color surfaceColor(BuildContext context) =>
      _M3TonalColor.fromElevation(context, this);

  /// Calculates surface color with a custom formula and tint color.
  ///
  /// This is a convenience method that delegates its logic to [_M3TonalColor.calculateSurfaceColor].
  Color calculateSurfaceColor({
    required Color surface,
    required Color surfaceTint,
  }) =>
      _M3TonalColor.calculateSurfaceColor(
        surface: surface,
        surfaceTint: surfaceTint,
        elevation: this,
      );

  /// Creates a high contrast surface color for accessibility.
  ///
  /// This is a convenience method that delegates its logic to [_M3TonalColor.highContrastSurface].
  Color highContrastSurface({
    required Color surface,
    required Color surfaceTint,
  }) =>
      _M3TonalColor.highContrastSurface(
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

  /// Returns the absolute difference in elevation between this and another token.
  double differenceFrom(IM3ElevationToken other) => (value - other.value).abs();
}
