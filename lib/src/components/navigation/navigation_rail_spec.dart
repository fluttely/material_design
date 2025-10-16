import 'package:flutter/material.dart';

/// Alignment options for Navigation Rail destinations
enum NavigationRailAlignment {
  top,
  center,
  bottom,
}

/// Specification for Material Design 3 Navigation Rail
@immutable
class NavigationRailSpec {
  const NavigationRailSpec({
    required this.width,
    required this.extendedWidth,
    required this.minDestinations,
    required this.maxDestinations,
    required this.iconSize,
    required this.activeIndicatorSize,
    required this.itemPadding,
    required this.alignment,
  });
  final double width;
  final double extendedWidth;
  final int minDestinations;
  final int maxDestinations;
  final double iconSize;
  final Size activeIndicatorSize;
  final EdgeInsets itemPadding;
  final NavigationRailAlignment alignment;

  static const NavigationRailSpec standardTop = NavigationRailSpec(
    width: 80,
    extendedWidth: 256,
    minDestinations: 3,
    maxDestinations: 7,
    iconSize: 24,
    activeIndicatorSize: Size(56, 32),
    itemPadding: EdgeInsets.symmetric(vertical: 8),
    alignment: NavigationRailAlignment.top,
  );

  static const NavigationRailSpec standardCenter = NavigationRailSpec(
    width: 80,
    extendedWidth: 256,
    minDestinations: 3,
    maxDestinations: 7,
    iconSize: 24,
    activeIndicatorSize: Size(56, 32),
    itemPadding: EdgeInsets.symmetric(vertical: 8),
    alignment: NavigationRailAlignment.center,
  );

  static const NavigationRailSpec standardBottom = NavigationRailSpec(
    width: 80,
    extendedWidth: 256,
    minDestinations: 3,
    maxDestinations: 7,
    iconSize: 24,
    activeIndicatorSize: Size(56, 32),
    itemPadding: EdgeInsets.symmetric(vertical: 8),
    alignment: NavigationRailAlignment.bottom,
  );
}
