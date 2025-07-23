import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Defines the contract for all Material 3 elevation tokens.
///
/// Any enum implementing this interface will provide elevation properties
/// like [value] and [hasShadow], along with utility methods to get
/// shadows and surface colors.
abstract class IM3ElevationToken {
  /// The elevation value in logical pixels (dp).
  double get value;

  /// Whether this elevation profile should cast a shadow.
  bool get hasShadow;

  /// Returns the list of [BoxShadow] for this elevation level.
  ///
  /// Returns `null` if [hasShadow] is `false`.
  List<BoxShadow>? get shadows;

  /// Calculates the surface color based on this elevation's [value] value
  /// and the application's [ColorScheme].
  Color surfaceColor(BuildContext context);
}

/// Defines the foundational elevation levels in the Material 3 design system.
enum M3ElevationToken implements IM3ElevationToken {
  level0(0),
  level1(1),
  level2(3),
  level3(6),
  level4(8),
  level5(12);

  @override
  final double value;

  @override
  get hasShadow => true;

  const M3ElevationToken(this.value);

  @override
  List<BoxShadow>? get shadows =>
      hasShadow ? M3Shadow.fromElevation(value) : null;

  @override
  Color surfaceColor(BuildContext context) =>
      M3TonalColor.fromElevation(context, value);
}

/// Defines the default, resting-state elevation for specific Material 3 components.
enum M3ComponentElevationToken implements IM3ElevationToken {
  card(1),
  button(0),
  elevatedButton(1),
  fab(6),
  appBar(3, hasShadow: false),
  bottomAppBar(3),
  drawer(1),
  bottomSheet(1),
  dialog(6),
  snackbar(6, hasShadow: false),
  tooltip(3, hasShadow: false),
  menu(3),
  navigationBar(3),
  navigationRail(0),
  searchBar(1),
  chip(0);

  @override
  final double value;

  @override
  final bool hasShadow;

  const M3ComponentElevationToken(this.value, {this.hasShadow = true});

  @override
  List<BoxShadow>? get shadows =>
      hasShadow ? M3Shadow.fromElevation(value) : null;

  @override
  Color surfaceColor(BuildContext context) =>
      M3TonalColor.fromElevation(context, value);
}

/// Defines elevation profiles for Material 3 components in interactive states.
enum M3StateElevationToken implements IM3ElevationToken {
  cardHover(3),
  cardPressed(1),
  buttonHover(2),
  buttonPressed(1),
  fabHover(8),
  fabPressed(8),
  filledIconButtonHover(3),
  filledIconButtonPressed(1),
  chipDragged(8),
  switchThumbRest(1),
  switchThumbHover(3),
  switchThumbPressed(6),
  navigationBarIndicatorHover(3),
  navigationBarIndicatorFocus(3),
  navigationRailIndicatorHover(3),
  navigationRailIndicatorFocus(3);

  @override
  final double value;

  @override
  get hasShadow => true;

  const M3StateElevationToken(this.value);

  @override
  List<BoxShadow>? get shadows =>
      hasShadow ? M3Shadow.fromElevation(value) : null;

  @override
  Color surfaceColor(BuildContext context) =>
      M3TonalColor.fromElevation(context, value);
}
