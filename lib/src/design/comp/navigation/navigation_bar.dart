/// Navigation Bar specifications based on Material Design 3.
///
/// Reference: https://m3.material.io/components/navigation-bar/overview
library;

import 'dart:ui';
import 'package:flutter/widgets.dart';
import '../../../design/sys/sys.dart';

/// Specifications for Material 3 Navigation Bar.
abstract class M3NavigationBarSpecs {
  /// Standard navigation bar specifications.
  static const M3NavigationBarSpec standard = M3NavigationBarSpec(
    containerHeight: 80.0,
    containerElevation: M3ElevationLevels.level2,
    containerColor: M3NavigationBarContainerColor.surface,
    containerShape: M3ShapeScale.none,
    activeIndicatorHeight: 32.0,
    activeIndicatorWidth: 64.0,
    activeIndicatorShape: M3ShapeScale.large,
    activeIndicatorColor: M3NavigationBarIndicatorColor.secondaryContainer,
    iconSize: 24.0,
    activeIconColor: M3NavigationBarIconColor.onSecondaryContainer,
    inactiveIconColor: M3NavigationBarIconColor.onSurfaceVariant,
    labelTextStyle: M3TypeScale.labelMedium,
    activeLabelColor: M3NavigationBarLabelColor.onSurface,
    inactiveLabelColor: M3NavigationBarLabelColor.onSurfaceVariant,
    itemSpacing: M3SpacingScale.small,
    itemPadding: M3SpacingScale.medium,
    badgeSize: 6.0,
    badgeOffset: Offset(14.0, 2.0),
  );
}

/// Specification for a Material 3 Navigation Bar.
class M3NavigationBarSpec {
  const M3NavigationBarSpec({
    required this.containerHeight,
    required this.containerElevation,
    required this.containerColor,
    required this.containerShape,
    required this.activeIndicatorHeight,
    required this.activeIndicatorWidth,
    required this.activeIndicatorShape,
    required this.activeIndicatorColor,
    required this.iconSize,
    required this.activeIconColor,
    required this.inactiveIconColor,
    required this.labelTextStyle,
    required this.activeLabelColor,
    required this.inactiveLabelColor,
    required this.itemSpacing,
    required this.itemPadding,
    required this.badgeSize,
    required this.badgeOffset,
  });

  /// Height of the navigation bar container.
  final double containerHeight;

  /// Elevation of the navigation bar container.
  final double containerElevation;

  /// Color of the navigation bar container.
  final M3NavigationBarContainerColor containerColor;

  /// Shape of the navigation bar container.
  final double containerShape;

  /// Height of the active indicator.
  final double activeIndicatorHeight;

  /// Width of the active indicator.
  final double activeIndicatorWidth;

  /// Shape of the active indicator.
  final double activeIndicatorShape;

  /// Color of the active indicator.
  final M3NavigationBarIndicatorColor activeIndicatorColor;

  /// Size of navigation icons.
  final double iconSize;

  /// Color of active navigation icons.
  final M3NavigationBarIconColor activeIconColor;

  /// Color of inactive navigation icons.
  final M3NavigationBarIconColor inactiveIconColor;

  /// Text style for navigation labels.
  final M3TypeScaleToken labelTextStyle;

  /// Color of active navigation labels.
  final M3NavigationBarLabelColor activeLabelColor;

  /// Color of inactive navigation labels.
  final M3NavigationBarLabelColor inactiveLabelColor;

  /// Spacing between icon and label.
  final double itemSpacing;

  /// Padding around navigation items.
  final double itemPadding;

  /// Size of notification badges.
  final double badgeSize;

  /// Offset of notification badges from icon.
  final Offset badgeOffset;
}

/// Container color options for navigation bars.
enum M3NavigationBarContainerColor {
  surface,
  surfaceContainer,
  surfaceContainerHigh,
  surfaceContainerHighest,
}

/// Indicator color options for navigation bars.
enum M3NavigationBarIndicatorColor {
  secondaryContainer,
  primaryContainer,
  tertiaryContainer,
}

/// Icon color options for navigation bars.
enum M3NavigationBarIconColor {
  onSurface,
  onSurfaceVariant,
  onSecondaryContainer,
  onPrimaryContainer,
  onTertiaryContainer,
}

/// Label color options for navigation bars.
enum M3NavigationBarLabelColor {
  onSurface,
  onSurfaceVariant,
  primary,
  secondary,
  tertiary,
}

/// Navigation destination specification.
class M3NavigationDestination {
  const M3NavigationDestination({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.tooltip,
    this.enabled = true,
  });

  /// Icon widget for the destination.
  final Widget icon;

  /// Label text for the destination.
  final String label;

  /// Icon widget for when the destination is selected.
  final Widget? selectedIcon;

  /// Tooltip text for the destination.
  final String? tooltip;

  /// Whether the destination is enabled.
  final bool enabled;
}

/// State specifications for navigation bars.
abstract class M3NavigationBarStates {
  /// Enabled state specifications.
  static const M3NavigationBarStateSpec enabled = M3NavigationBarStateSpec(
    containerOpacity: 1.0,
    iconOpacity: 1.0,
    labelOpacity: 1.0,
    indicatorOpacity: 1.0,
  );

  /// Disabled state specifications.
  static const M3NavigationBarStateSpec disabled = M3NavigationBarStateSpec(
    containerOpacity: 1.0,
    iconOpacity: 0.38,
    labelOpacity: 0.38,
    indicatorOpacity: 0.38,
  );

  /// Hovered state specifications.
  static const M3NavigationBarStateSpec hovered = M3NavigationBarStateSpec(
    containerOpacity: 1.0,
    iconOpacity: 1.0,
    labelOpacity: 1.0,
    indicatorOpacity: 1.0,
    stateLayerOpacity: M3StateColors.hoveredOpacity,
  );

  /// Focused state specifications.
  static const M3NavigationBarStateSpec focused = M3NavigationBarStateSpec(
    containerOpacity: 1.0,
    iconOpacity: 1.0,
    labelOpacity: 1.0,
    indicatorOpacity: 1.0,
    stateLayerOpacity: M3StateColors.focusedOpacity,
  );

  /// Pressed state specifications.
  static const M3NavigationBarStateSpec pressed = M3NavigationBarStateSpec(
    containerOpacity: 1.0,
    iconOpacity: 1.0,
    labelOpacity: 1.0,
    indicatorOpacity: 1.0,
    stateLayerOpacity: M3StateColors.pressedOpacity,
  );
}

/// State specification for a navigation bar.
class M3NavigationBarStateSpec {
  const M3NavigationBarStateSpec({
    required this.containerOpacity,
    required this.iconOpacity,
    required this.labelOpacity,
    required this.indicatorOpacity,
    this.stateLayerOpacity = 0.0,
  });

  /// Opacity of the container in this state.
  final double containerOpacity;

  /// Opacity of icons in this state.
  final double iconOpacity;

  /// Opacity of labels in this state.
  final double labelOpacity;

  /// Opacity of the indicator in this state.
  final double indicatorOpacity;

  /// Opacity of the state layer in this state.
  final double stateLayerOpacity;
}