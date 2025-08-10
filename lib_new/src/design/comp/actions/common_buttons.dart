/// Common button specifications based on Material Design 3.
///
/// Reference: https://m3.material.io/components/buttons/overview
library;

import '../../../design/sys/sys.dart';

/// Specifications for Material 3 buttons.
abstract class M3ButtonSpecs {
  /// Elevated button specifications.
  static const M3ButtonSpec elevatedButton = M3ButtonSpec(
    containerHeight: 40.0,
    containerShape: M3ShapeScale.large,
    containerElevation: M3ElevationLevels.level1,
    containerColor: M3ButtonContainerColor.surface,
    labelTextStyle: M3TypeScale.labelLarge,
    iconSize: 18.0,
    spacingBetweenElements: M3SpacingScale.small,
    minWidth: 48.0,
    paddingHorizontal: M3SpacingScale.extraLarge,
    paddingVertical: M3SpacingScale.medium,
    stateLayerHeight: 40.0,
    stateLayerShape: M3ShapeScale.large,
  );

  /// Filled button specifications.
  static const M3ButtonSpec filledButton = M3ButtonSpec(
    containerHeight: 40.0,
    containerShape: M3ShapeScale.large,
    containerElevation: M3ElevationLevels.level0,
    containerColor: M3ButtonContainerColor.primary,
    labelTextStyle: M3TypeScale.labelLarge,
    iconSize: 18.0,
    spacingBetweenElements: M3SpacingScale.small,
    minWidth: 48.0,
    paddingHorizontal: M3SpacingScale.extraLarge,
    paddingVertical: M3SpacingScale.medium,
    stateLayerHeight: 40.0,
    stateLayerShape: M3ShapeScale.large,
  );

  /// Filled tonal button specifications.
  static const M3ButtonSpec filledTonalButton = M3ButtonSpec(
    containerHeight: 40.0,
    containerShape: M3ShapeScale.large,
    containerElevation: M3ElevationLevels.level0,
    containerColor: M3ButtonContainerColor.secondaryContainer,
    labelTextStyle: M3TypeScale.labelLarge,
    iconSize: 18.0,
    spacingBetweenElements: M3SpacingScale.small,
    minWidth: 48.0,
    paddingHorizontal: M3SpacingScale.extraLarge,
    paddingVertical: M3SpacingScale.medium,
    stateLayerHeight: 40.0,
    stateLayerShape: M3ShapeScale.large,
  );

  /// Outlined button specifications.
  static const M3ButtonSpec outlinedButton = M3ButtonSpec(
    containerHeight: 40.0,
    containerShape: M3ShapeScale.large,
    containerElevation: M3ElevationLevels.level0,
    containerColor: M3ButtonContainerColor.transparent,
    labelTextStyle: M3TypeScale.labelLarge,
    iconSize: 18.0,
    spacingBetweenElements: M3SpacingScale.small,
    minWidth: 48.0,
    paddingHorizontal: M3SpacingScale.extraLarge,
    paddingVertical: M3SpacingScale.medium,
    stateLayerHeight: 40.0,
    stateLayerShape: M3ShapeScale.large,
    outlineWidth: 1.0,
    outlineColor: M3ButtonOutlineColor.outline,
  );

  /// Text button specifications.
  static const M3ButtonSpec textButton = M3ButtonSpec(
    containerHeight: 40.0,
    containerShape: M3ShapeScale.large,
    containerElevation: M3ElevationLevels.level0,
    containerColor: M3ButtonContainerColor.transparent,
    labelTextStyle: M3TypeScale.labelLarge,
    iconSize: 18.0,
    spacingBetweenElements: M3SpacingScale.small,
    minWidth: 48.0,
    paddingHorizontal: M3SpacingScale.medium,
    paddingVertical: M3SpacingScale.medium,
    stateLayerHeight: 40.0,
    stateLayerShape: M3ShapeScale.large,
  );
}

/// Specification for a Material 3 button.
class M3ButtonSpec {
  const M3ButtonSpec({
    required this.containerHeight,
    required this.containerShape,
    required this.containerElevation,
    required this.containerColor,
    required this.labelTextStyle,
    required this.iconSize,
    required this.spacingBetweenElements,
    required this.minWidth,
    required this.paddingHorizontal,
    required this.paddingVertical,
    required this.stateLayerHeight,
    required this.stateLayerShape,
    this.outlineWidth,
    this.outlineColor,
  });

  /// Height of the button container.
  final double containerHeight;

  /// Shape of the button container.
  final double containerShape;

  /// Elevation of the button container.
  final double containerElevation;

  /// Color of the button container.
  final M3ButtonContainerColor containerColor;

  /// Text style for the button label.
  final M3TypeScaleToken labelTextStyle;

  /// Size of icons in the button.
  final double iconSize;

  /// Spacing between elements in the button.
  final double spacingBetweenElements;

  /// Minimum width of the button.
  final double minWidth;

  /// Horizontal padding inside the button.
  final double paddingHorizontal;

  /// Vertical padding inside the button.
  final double paddingVertical;

  /// Height of the state layer.
  final double stateLayerHeight;

  /// Shape of the state layer.
  final double stateLayerShape;

  /// Width of the button outline (for outlined buttons).
  final double? outlineWidth;

  /// Color of the button outline (for outlined buttons).
  final M3ButtonOutlineColor? outlineColor;
}

/// Container color options for buttons.
enum M3ButtonContainerColor {
  primary,
  secondary,
  tertiary,
  surface,
  secondaryContainer,
  tertiaryContainer,
  transparent,
}

/// Outline color options for buttons.
enum M3ButtonOutlineColor {
  outline,
  primary,
  secondary,
  tertiary,
}

/// State specifications for buttons.
abstract class M3ButtonStates {
  /// Enabled state specifications.
  static const M3ButtonStateSpec enabled = M3ButtonStateSpec(
    containerOpacity: 1.0,
    labelOpacity: 1.0,
    iconOpacity: 1.0,
    outlineOpacity: 1.0,
  );

  /// Disabled state specifications.
  static const M3ButtonStateSpec disabled = M3ButtonStateSpec(
    containerOpacity: 0.12,
    labelOpacity: 0.38,
    iconOpacity: 0.38,
    outlineOpacity: 0.12,
  );

  /// Hovered state specifications.
  static const M3ButtonStateSpec hovered = M3ButtonStateSpec(
    containerOpacity: 1.0,
    labelOpacity: 1.0,
    iconOpacity: 1.0,
    outlineOpacity: 1.0,
    stateLayerOpacity: M3StateColors.hoveredOpacity,
  );

  /// Focused state specifications.
  static const M3ButtonStateSpec focused = M3ButtonStateSpec(
    containerOpacity: 1.0,
    labelOpacity: 1.0,
    iconOpacity: 1.0,
    outlineOpacity: 1.0,
    stateLayerOpacity: M3StateColors.focusedOpacity,
  );

  /// Pressed state specifications.
  static const M3ButtonStateSpec pressed = M3ButtonStateSpec(
    containerOpacity: 1.0,
    labelOpacity: 1.0,
    iconOpacity: 1.0,
    outlineOpacity: 1.0,
    stateLayerOpacity: M3StateColors.pressedOpacity,
  );
}

/// State specification for a button.
class M3ButtonStateSpec {
  const M3ButtonStateSpec({
    required this.containerOpacity,
    required this.labelOpacity,
    required this.iconOpacity,
    required this.outlineOpacity,
    this.stateLayerOpacity = 0.0,
  });

  /// Opacity of the container in this state.
  final double containerOpacity;

  /// Opacity of the label in this state.
  final double labelOpacity;

  /// Opacity of icons in this state.
  final double iconOpacity;

  /// Opacity of the outline in this state.
  final double outlineOpacity;

  /// Opacity of the state layer in this state.
  final double stateLayerOpacity;
}