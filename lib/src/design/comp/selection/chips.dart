/// Chip specifications based on Material Design 3.
///
/// Reference: https://m3.material.io/components/chips/overview
library;

import '../../../design/sys/sys.dart';

/// Specifications for Material 3 Chips.
abstract class M3ChipSpecs {
  /// Assist chip specifications.
  static const M3ChipSpec assist = M3ChipSpec(
    containerHeight: 32.0,
    containerShape: M3ShapeScale.small,
    containerElevation: M3ElevationLevels.level0,
    containerColor: M3ChipContainerColor.transparent,
    labelTextStyle: M3TypeScale.labelMedium,
    labelColor: M3ChipLabelColor.onSurface,
    iconSize: 18.0,
    iconColor: M3ChipIconColor.primary,
    paddingHorizontal: M3SpacingScale.large,
    paddingVertical: M3SpacingScale.extraSmall,
    spacingBetweenElements: M3SpacingScale.small,
    outlineWidth: 1.0,
    outlineColor: M3ChipOutlineColor.outline,
  );

  /// Filter chip specifications.
  static const M3ChipSpec filter = M3ChipSpec(
    containerHeight: 32.0,
    containerShape: M3ShapeScale.small,
    containerElevation: M3ElevationLevels.level0,
    containerColor: M3ChipContainerColor.transparent,
    labelTextStyle: M3TypeScale.labelMedium,
    labelColor: M3ChipLabelColor.onSurfaceVariant,
    iconSize: 18.0,
    iconColor: M3ChipIconColor.onSurfaceVariant,
    paddingHorizontal: M3SpacingScale.large,
    paddingVertical: M3SpacingScale.extraSmall,
    spacingBetweenElements: M3SpacingScale.small,
    outlineWidth: 1.0,
    outlineColor: M3ChipOutlineColor.outline,
    selectedContainerColor: M3ChipContainerColor.secondaryContainer,
    selectedLabelColor: M3ChipLabelColor.onSecondaryContainer,
    selectedIconColor: M3ChipIconColor.onSecondaryContainer,
  );

  /// Input chip specifications.
  static const M3ChipSpec input = M3ChipSpec(
    containerHeight: 32.0,
    containerShape: M3ShapeScale.small,
    containerElevation: M3ElevationLevels.level0,
    containerColor: M3ChipContainerColor.transparent,
    labelTextStyle: M3TypeScale.labelMedium,
    labelColor: M3ChipLabelColor.onSurfaceVariant,
    iconSize: 18.0,
    iconColor: M3ChipIconColor.onSurfaceVariant,
    paddingHorizontal: M3SpacingScale.large,
    paddingVertical: M3SpacingScale.extraSmall,
    spacingBetweenElements: M3SpacingScale.small,
    outlineWidth: 1.0,
    outlineColor: M3ChipOutlineColor.outline,
  );

  /// Suggestion chip specifications.
  static const M3ChipSpec suggestion = M3ChipSpec(
    containerHeight: 32.0,
    containerShape: M3ShapeScale.small,
    containerElevation: M3ElevationLevels.level0,
    containerColor: M3ChipContainerColor.transparent,
    labelTextStyle: M3TypeScale.labelMedium,
    labelColor: M3ChipLabelColor.onSurfaceVariant,
    iconSize: 18.0,
    iconColor: M3ChipIconColor.onSurfaceVariant,
    paddingHorizontal: M3SpacingScale.large,
    paddingVertical: M3SpacingScale.extraSmall,
    spacingBetweenElements: M3SpacingScale.small,
    outlineWidth: 1.0,
    outlineColor: M3ChipOutlineColor.outline,
  );
}

/// Specification for a Material 3 chip.
class M3ChipSpec {
  const M3ChipSpec({
    required this.containerHeight,
    required this.containerShape,
    required this.containerElevation,
    required this.containerColor,
    required this.labelTextStyle,
    required this.labelColor,
    required this.iconSize,
    required this.iconColor,
    required this.paddingHorizontal,
    required this.paddingVertical,
    required this.spacingBetweenElements,
    this.outlineWidth,
    this.outlineColor,
    this.selectedContainerColor,
    this.selectedLabelColor,
    this.selectedIconColor,
  });

  /// Height of the chip container.
  final double containerHeight;

  /// Shape of the chip container.
  final double containerShape;

  /// Elevation of the chip container.
  final double containerElevation;

  /// Color of the chip container.
  final M3ChipContainerColor containerColor;

  /// Text style for the chip label.
  final M3TypeScaleToken labelTextStyle;

  /// Color of the chip label.
  final M3ChipLabelColor labelColor;

  /// Size of icons in the chip.
  final double iconSize;

  /// Color of icons in the chip.
  final M3ChipIconColor iconColor;

  /// Horizontal padding inside the chip.
  final double paddingHorizontal;

  /// Vertical padding inside the chip.
  final double paddingVertical;

  /// Spacing between elements in the chip.
  final double spacingBetweenElements;

  /// Width of the chip outline.
  final double? outlineWidth;

  /// Color of the chip outline.
  final M3ChipOutlineColor? outlineColor;

  /// Container color when the chip is selected.
  final M3ChipContainerColor? selectedContainerColor;

  /// Label color when the chip is selected.
  final M3ChipLabelColor? selectedLabelColor;

  /// Icon color when the chip is selected.
  final M3ChipIconColor? selectedIconColor;
}

/// Container color options for chips.
enum M3ChipContainerColor {
  transparent,
  surface,
  surfaceVariant,
  secondaryContainer,
  primaryContainer,
  tertiaryContainer,
}

/// Label color options for chips.
enum M3ChipLabelColor {
  onSurface,
  onSurfaceVariant,
  onSecondaryContainer,
  onPrimaryContainer,
  onTertiaryContainer,
  primary,
  secondary,
  tertiary,
}

/// Icon color options for chips.
enum M3ChipIconColor {
  onSurface,
  onSurfaceVariant,
  onSecondaryContainer,
  onPrimaryContainer,
  onTertiaryContainer,
  primary,
  secondary,
  tertiary,
}

/// Outline color options for chips.
enum M3ChipOutlineColor {
  outline,
  outlineVariant,
  primary,
  secondary,
  tertiary,
}

/// State specifications for chips.
abstract class M3ChipStates {
  /// Enabled state specifications.
  static const M3ChipStateSpec enabled = M3ChipStateSpec(
    containerOpacity: 1.0,
    labelOpacity: 1.0,
    iconOpacity: 1.0,
    outlineOpacity: 1.0,
  );

  /// Disabled state specifications.
  static const M3ChipStateSpec disabled = M3ChipStateSpec(
    containerOpacity: 0.12,
    labelOpacity: 0.38,
    iconOpacity: 0.38,
    outlineOpacity: 0.12,
  );

  /// Selected state specifications.
  static const M3ChipStateSpec selected = M3ChipStateSpec(
    containerOpacity: 1.0,
    labelOpacity: 1.0,
    iconOpacity: 1.0,
    outlineOpacity: 0.0,
  );

  /// Hovered state specifications.
  static const M3ChipStateSpec hovered = M3ChipStateSpec(
    containerOpacity: 1.0,
    labelOpacity: 1.0,
    iconOpacity: 1.0,
    outlineOpacity: 1.0,
    stateLayerOpacity: M3StateColors.hoveredOpacity,
  );

  /// Focused state specifications.
  static const M3ChipStateSpec focused = M3ChipStateSpec(
    containerOpacity: 1.0,
    labelOpacity: 1.0,
    iconOpacity: 1.0,
    outlineOpacity: 1.0,
    stateLayerOpacity: M3StateColors.focusedOpacity,
  );

  /// Pressed state specifications.
  static const M3ChipStateSpec pressed = M3ChipStateSpec(
    containerOpacity: 1.0,
    labelOpacity: 1.0,
    iconOpacity: 1.0,
    outlineOpacity: 1.0,
    stateLayerOpacity: M3StateColors.pressedOpacity,
  );
}

/// State specification for a chip.
class M3ChipStateSpec {
  const M3ChipStateSpec({
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