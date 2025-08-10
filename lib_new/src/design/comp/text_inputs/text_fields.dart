/// Text Field specifications based on Material Design 3.
///
/// Reference: https://m3.material.io/components/text-fields/overview
library;

import '../../sys/sys.dart';

/// Specifications for Material 3 Text Fields.
abstract class M3TextFieldSpecs {
  /// Filled text field specifications.
  static const M3TextFieldSpec filled = M3TextFieldSpec(
    containerHeight: 56.0,
    containerShape: M3ShapeScale.extraSmall,
    containerColor: M3TextFieldContainerColor.surfaceContainerHighest,
    inputTextStyle: M3TypeScale.bodyLarge,
    inputTextColor: M3TextFieldTextColor.onSurface,
    labelTextStyle: M3TypeScale.bodyLarge,
    labelTextColor: M3TextFieldLabelColor.onSurfaceVariant,
    supportingTextStyle: M3TypeScale.bodySmall,
    supportingTextColor: M3TextFieldSupportingTextColor.onSurfaceVariant,
    leadingIconSize: 24.0,
    trailingIconSize: 24.0,
    iconColor: M3TextFieldIconColor.onSurfaceVariant,
    paddingHorizontal: M3SpacingScale.large,
    paddingVertical: M3SpacingScale.small,
    cursorWidth: 2.0,
    cursorColor: M3TextFieldCursorColor.primary,
    focusIndicatorHeight: 2.0,
    focusIndicatorColor: M3TextFieldIndicatorColor.primary,
    errorIndicatorHeight: 2.0,
    errorIndicatorColor: M3TextFieldIndicatorColor.error,
  );

  /// Outlined text field specifications.
  static const M3TextFieldSpec outlined = M3TextFieldSpec(
    containerHeight: 56.0,
    containerShape: M3ShapeScale.extraSmall,
    containerColor: M3TextFieldContainerColor.transparent,
    inputTextStyle: M3TypeScale.bodyLarge,
    inputTextColor: M3TextFieldTextColor.onSurface,
    labelTextStyle: M3TypeScale.bodyLarge,
    labelTextColor: M3TextFieldLabelColor.onSurfaceVariant,
    supportingTextStyle: M3TypeScale.bodySmall,
    supportingTextColor: M3TextFieldSupportingTextColor.onSurfaceVariant,
    leadingIconSize: 24.0,
    trailingIconSize: 24.0,
    iconColor: M3TextFieldIconColor.onSurfaceVariant,
    paddingHorizontal: M3SpacingScale.large,
    paddingVertical: M3SpacingScale.small,
    cursorWidth: 2.0,
    cursorColor: M3TextFieldCursorColor.primary,
    outlineWidth: 1.0,
    outlineColor: M3TextFieldOutlineColor.outline,
    focusIndicatorHeight: 2.0,
    focusIndicatorColor: M3TextFieldIndicatorColor.primary,
    errorIndicatorHeight: 2.0,
    errorIndicatorColor: M3TextFieldIndicatorColor.error,
  );
}

/// Specification for a Material 3 Text Field.
class M3TextFieldSpec {
  const M3TextFieldSpec({
    required this.containerHeight,
    required this.containerShape,
    required this.containerColor,
    required this.inputTextStyle,
    required this.inputTextColor,
    required this.labelTextStyle,
    required this.labelTextColor,
    required this.supportingTextStyle,
    required this.supportingTextColor,
    required this.leadingIconSize,
    required this.trailingIconSize,
    required this.iconColor,
    required this.paddingHorizontal,
    required this.paddingVertical,
    required this.cursorWidth,
    required this.cursorColor,
    required this.focusIndicatorHeight,
    required this.focusIndicatorColor,
    required this.errorIndicatorHeight,
    required this.errorIndicatorColor,
    this.outlineWidth,
    this.outlineColor,
  });

  /// Height of the text field container.
  final double containerHeight;

  /// Shape of the text field container.
  final double containerShape;

  /// Color of the text field container.
  final M3TextFieldContainerColor containerColor;

  /// Text style for input text.
  final M3TypeScaleToken inputTextStyle;

  /// Color of input text.
  final M3TextFieldTextColor inputTextColor;

  /// Text style for label text.
  final M3TypeScaleToken labelTextStyle;

  /// Color of label text.
  final M3TextFieldLabelColor labelTextColor;

  /// Text style for supporting text.
  final M3TypeScaleToken supportingTextStyle;

  /// Color of supporting text.
  final M3TextFieldSupportingTextColor supportingTextColor;

  /// Size of leading icons.
  final double leadingIconSize;

  /// Size of trailing icons.
  final double trailingIconSize;

  /// Color of icons.
  final M3TextFieldIconColor iconColor;

  /// Horizontal padding inside the text field.
  final double paddingHorizontal;

  /// Vertical padding inside the text field.
  final double paddingVertical;

  /// Width of the text cursor.
  final double cursorWidth;

  /// Color of the text cursor.
  final M3TextFieldCursorColor cursorColor;

  /// Height of the focus indicator.
  final double focusIndicatorHeight;

  /// Color of the focus indicator.
  final M3TextFieldIndicatorColor focusIndicatorColor;

  /// Height of the error indicator.
  final double errorIndicatorHeight;

  /// Color of the error indicator.
  final M3TextFieldIndicatorColor errorIndicatorColor;

  /// Width of the outline (for outlined text fields).
  final double? outlineWidth;

  /// Color of the outline (for outlined text fields).
  final M3TextFieldOutlineColor? outlineColor;
}

/// Container color options for text fields.
enum M3TextFieldContainerColor {
  transparent,
  surface,
  surfaceContainer,
  surfaceContainerHigh,
  surfaceContainerHighest,
  surfaceVariant,
}

/// Text color options for text fields.
enum M3TextFieldTextColor {
  onSurface,
  onSurfaceVariant,
  primary,
  secondary,
  tertiary,
}

/// Label color options for text fields.
enum M3TextFieldLabelColor {
  onSurface,
  onSurfaceVariant,
  primary,
  secondary,
  tertiary,
  error,
}

/// Supporting text color options for text fields.
enum M3TextFieldSupportingTextColor {
  onSurface,
  onSurfaceVariant,
  error,
}

/// Icon color options for text fields.
enum M3TextFieldIconColor {
  onSurface,
  onSurfaceVariant,
  primary,
  secondary,
  tertiary,
  error,
}

/// Cursor color options for text fields.
enum M3TextFieldCursorColor {
  primary,
  secondary,
  tertiary,
  onSurface,
}

/// Outline color options for text fields.
enum M3TextFieldOutlineColor {
  outline,
  outlineVariant,
  primary,
  error,
}

/// Indicator color options for text fields.
enum M3TextFieldIndicatorColor {
  primary,
  secondary,
  tertiary,
  error,
}

/// State specifications for text fields.
abstract class M3TextFieldStates {
  /// Enabled state specifications.
  static const M3TextFieldStateSpec enabled = M3TextFieldStateSpec(
    containerOpacity: 1.0,
    inputTextOpacity: 1.0,
    labelTextOpacity: 1.0,
    supportingTextOpacity: 1.0,
    iconOpacity: 1.0,
    indicatorOpacity: 1.0,
  );

  /// Disabled state specifications.
  static const M3TextFieldStateSpec disabled = M3TextFieldStateSpec(
    containerOpacity: 0.04,
    inputTextOpacity: 0.38,
    labelTextOpacity: 0.38,
    supportingTextOpacity: 0.38,
    iconOpacity: 0.38,
    indicatorOpacity: 0.38,
  );

  /// Error state specifications.
  static const M3TextFieldStateSpec error = M3TextFieldStateSpec(
    containerOpacity: 1.0,
    inputTextOpacity: 1.0,
    labelTextOpacity: 1.0,
    supportingTextOpacity: 1.0,
    iconOpacity: 1.0,
    indicatorOpacity: 1.0,
  );

  /// Focused state specifications.
  static const M3TextFieldStateSpec focused = M3TextFieldStateSpec(
    containerOpacity: 1.0,
    inputTextOpacity: 1.0,
    labelTextOpacity: 1.0,
    supportingTextOpacity: 1.0,
    iconOpacity: 1.0,
    indicatorOpacity: 1.0,
  );

  /// Hovered state specifications.
  static const M3TextFieldStateSpec hovered = M3TextFieldStateSpec(
    containerOpacity: 1.0,
    inputTextOpacity: 1.0,
    labelTextOpacity: 1.0,
    supportingTextOpacity: 1.0,
    iconOpacity: 1.0,
    indicatorOpacity: 1.0,
    stateLayerOpacity: M3StateColors.hoveredOpacity,
  );
}

/// State specification for a text field.
class M3TextFieldStateSpec {
  const M3TextFieldStateSpec({
    required this.containerOpacity,
    required this.inputTextOpacity,
    required this.labelTextOpacity,
    required this.supportingTextOpacity,
    required this.iconOpacity,
    required this.indicatorOpacity,
    this.stateLayerOpacity = 0.0,
  });

  /// Opacity of the container in this state.
  final double containerOpacity;

  /// Opacity of input text in this state.
  final double inputTextOpacity;

  /// Opacity of label text in this state.
  final double labelTextOpacity;

  /// Opacity of supporting text in this state.
  final double supportingTextOpacity;

  /// Opacity of icons in this state.
  final double iconOpacity;

  /// Opacity of indicators in this state.
  final double indicatorOpacity;

  /// Opacity of the state layer in this state.
  final double stateLayerOpacity;
}