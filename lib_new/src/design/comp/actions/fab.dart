/// Floating Action Button specifications based on Material Design 3.
///
/// Reference: https://m3.material.io/components/floating-action-button/overview
library;

import '../../../design/sys/sys.dart';

/// Specifications for Material 3 Floating Action Buttons.
abstract class M3FabSpecs {
  /// Small FAB specifications.
  static const M3FabSpec small = M3FabSpec(
    containerSize: 40.0,
    iconSize: 24.0,
    containerShape: M3ShapeScale.medium,
    containerElevation: M3ElevationLevels.level3,
    containerColor: M3FabContainerColor.primaryContainer,
    iconColor: M3FabIconColor.onPrimaryContainer,
    stateLayerShape: M3ShapeScale.medium,
  );

  /// Regular FAB specifications.
  static const M3FabSpec regular = M3FabSpec(
    containerSize: 56.0,
    iconSize: 24.0,
    containerShape: M3ShapeScale.large,
    containerElevation: M3ElevationLevels.level3,
    containerColor: M3FabContainerColor.primaryContainer,
    iconColor: M3FabIconColor.onPrimaryContainer,
    stateLayerShape: M3ShapeScale.large,
  );

  /// Large FAB specifications.
  static const M3FabSpec large = M3FabSpec(
    containerSize: 96.0,
    iconSize: 36.0,
    containerShape: M3ShapeScale.extraLarge,
    containerElevation: M3ElevationLevels.level3,
    containerColor: M3FabContainerColor.primaryContainer,
    iconColor: M3FabIconColor.onPrimaryContainer,
    stateLayerShape: M3ShapeScale.extraLarge,
  );

  /// Extended FAB specifications.
  static const M3ExtendedFabSpec extended = M3ExtendedFabSpec(
    containerHeight: 56.0,
    minWidth: 80.0,
    iconSize: 24.0,
    containerShape: M3ShapeScale.large,
    containerElevation: M3ElevationLevels.level3,
    containerColor: M3FabContainerColor.primaryContainer,
    iconColor: M3FabIconColor.onPrimaryContainer,
    labelTextStyle: M3TypeScale.labelLarge,
    labelColor: M3FabLabelColor.onPrimaryContainer,
    spacingBetweenElements: M3SpacingScale.small,
    paddingHorizontal: M3SpacingScale.large,
    stateLayerShape: M3ShapeScale.large,
  );
}

/// Specification for a Material 3 Floating Action Button.
class M3FabSpec {
  const M3FabSpec({
    required this.containerSize,
    required this.iconSize,
    required this.containerShape,
    required this.containerElevation,
    required this.containerColor,
    required this.iconColor,
    required this.stateLayerShape,
  });

  /// Size of the FAB container (width and height).
  final double containerSize;

  /// Size of the icon.
  final double iconSize;

  /// Shape of the FAB container.
  final double containerShape;

  /// Elevation of the FAB container.
  final double containerElevation;

  /// Color of the FAB container.
  final M3FabContainerColor containerColor;

  /// Color of the FAB icon.
  final M3FabIconColor iconColor;

  /// Shape of the state layer.
  final double stateLayerShape;
}

/// Specification for a Material 3 Extended Floating Action Button.
class M3ExtendedFabSpec {
  const M3ExtendedFabSpec({
    required this.containerHeight,
    required this.minWidth,
    required this.iconSize,
    required this.containerShape,
    required this.containerElevation,
    required this.containerColor,
    required this.iconColor,
    required this.labelTextStyle,
    required this.labelColor,
    required this.spacingBetweenElements,
    required this.paddingHorizontal,
    required this.stateLayerShape,
  });

  /// Height of the extended FAB container.
  final double containerHeight;

  /// Minimum width of the extended FAB container.
  final double minWidth;

  /// Size of the icon.
  final double iconSize;

  /// Shape of the FAB container.
  final double containerShape;

  /// Elevation of the FAB container.
  final double containerElevation;

  /// Color of the FAB container.
  final M3FabContainerColor containerColor;

  /// Color of the FAB icon.
  final M3FabIconColor iconColor;

  /// Text style for the FAB label.
  final M3TypeScaleToken labelTextStyle;

  /// Color of the FAB label.
  final M3FabLabelColor labelColor;

  /// Spacing between icon and label.
  final double spacingBetweenElements;

  /// Horizontal padding inside the FAB.
  final double paddingHorizontal;

  /// Shape of the state layer.
  final double stateLayerShape;
}

/// Container color options for FABs.
enum M3FabContainerColor {
  primary,
  primaryContainer,
  secondary,
  secondaryContainer,
  tertiary,
  tertiaryContainer,
  surface,
  surfaceVariant,
}

/// Icon color options for FABs.
enum M3FabIconColor {
  onPrimary,
  onPrimaryContainer,
  onSecondary,
  onSecondaryContainer,
  onTertiary,
  onTertiaryContainer,
  onSurface,
  onSurfaceVariant,
  primary,
}

/// Label color options for extended FABs.
enum M3FabLabelColor {
  onPrimary,
  onPrimaryContainer,
  onSecondary,
  onSecondaryContainer,
  onTertiary,
  onTertiaryContainer,
  onSurface,
  onSurfaceVariant,
  primary,
}

/// State specifications for FABs.
abstract class M3FabStates {
  /// Enabled state specifications.
  static const M3FabStateSpec enabled = M3FabStateSpec(
    containerOpacity: 1.0,
    iconOpacity: 1.0,
    labelOpacity: 1.0,
  );

  /// Disabled state specifications.
  static const M3FabStateSpec disabled = M3FabStateSpec(
    containerOpacity: 0.12,
    iconOpacity: 0.38,
    labelOpacity: 0.38,
  );

  /// Hovered state specifications.
  static const M3FabStateSpec hovered = M3FabStateSpec(
    containerOpacity: 1.0,
    iconOpacity: 1.0,
    labelOpacity: 1.0,
    stateLayerOpacity: M3StateColors.hoveredOpacity,
    containerElevation: M3ElevationLevels.level4,
  );

  /// Focused state specifications.
  static const M3FabStateSpec focused = M3FabStateSpec(
    containerOpacity: 1.0,
    iconOpacity: 1.0,
    labelOpacity: 1.0,
    stateLayerOpacity: M3StateColors.focusedOpacity,
  );

  /// Pressed state specifications.
  static const M3FabStateSpec pressed = M3FabStateSpec(
    containerOpacity: 1.0,
    iconOpacity: 1.0,
    labelOpacity: 1.0,
    stateLayerOpacity: M3StateColors.pressedOpacity,
    containerElevation: M3ElevationLevels.level3,
  );
}

/// State specification for a FAB.
class M3FabStateSpec {
  const M3FabStateSpec({
    required this.containerOpacity,
    required this.iconOpacity,
    required this.labelOpacity,
    this.stateLayerOpacity = 0.0,
    this.containerElevation,
  });

  /// Opacity of the container in this state.
  final double containerOpacity;

  /// Opacity of the icon in this state.
  final double iconOpacity;

  /// Opacity of the label in this state.
  final double labelOpacity;

  /// Opacity of the state layer in this state.
  final double stateLayerOpacity;

  /// Container elevation in this state.
  final double? containerElevation;
}