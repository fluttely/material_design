import 'package:flutter/material.dart';

/// Specification for Material Design 3 Navigation Bar
@immutable
class NavigationBarSpec {
  const NavigationBarSpec({
    required this.height,
    required this.minDestinations,
    required this.maxDestinations,
    required this.activeIndicatorSize,
    required this.iconSize,
    required this.labelSpacing,
    required this.itemPadding,
  });
  final double height;
  final int minDestinations;
  final int maxDestinations;
  final Size activeIndicatorSize;
  final double iconSize;
  final double labelSpacing;
  final EdgeInsets itemPadding;

  static const NavigationBarSpec standard = NavigationBarSpec(
    height: 80,
    minDestinations: 3,
    maxDestinations: 5,
    activeIndicatorSize: Size(64, 32),
    iconSize: 24,
    labelSpacing: 8,
    itemPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  );
}
