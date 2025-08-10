/// Material 3 Text Field widget implementation.
///
/// Reference: https://m3.material.io/components/text-fields/overview
library;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../design/comp/comp.dart';

/// A Material 3 text field widget.
/// 
/// Text fields let users enter text into a UI. They typically appear in forms
/// and dialogs.
class M3TextField extends StatelessWidget {
  const M3TextField({
    super.key,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.onTapOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.undoController,
    this.variant = M3TextFieldVariant.filled,
  });

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// The decoration to show around the text field.
  final InputDecoration? decoration;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard.
  final TextCapitalization textCapitalization;

  /// The style to use for the text being edited.
  final TextStyle? style;

  /// The strut style to use.
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// How the text should be aligned vertically.
  final TextAlignVertical? textAlignVertical;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// Whether the text field is read-only.
  final bool readOnly;

  /// Whether this text field should focus itself if nothing else is already focused.
  final bool autofocus;

  /// Whether to hide the text being edited.
  final bool obscureText;

  /// Whether to enable autocorrection.
  final bool autocorrect;

  /// The type of smart dashes to use.
  final SmartDashesType? smartDashesType;

  /// The type of smart quotes to use.
  final SmartQuotesType? smartQuotesType;

  /// Whether to show input suggestions as the user types.
  final bool enableSuggestions;

  /// The maximum number of lines for the text to span.
  final int? maxLines;

  /// The minimum number of lines to occupy when the content spans fewer lines.
  final int? minLines;

  /// Whether this widget's height will be sized to fill its parent.
  final bool expands;

  /// The maximum number of characters (Unicode scalar values) to allow in the text field.
  final int? maxLength;

  /// Determines how the maxLength limit should be enforced.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Called when the user initiates a change to the TextField's value.
  final ValueChanged<String>? onChanged;

  /// Called when the user submits editable content.
  final VoidCallback? onEditingComplete;

  /// Called when the user indicates that they are done editing the text in the field.
  final ValueChanged<String>? onSubmitted;

  /// This is used to receive a private command from the input method.
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// If false the text field is "disabled".
  final bool enabled;

  /// How thick the cursor will be.
  final double cursorWidth;

  /// How tall the cursor will be.
  final double? cursorHeight;

  /// How rounded the corners of the cursor should be.
  final Radius? cursorRadius;

  /// The color of the cursor.
  final Color? cursorColor;

  /// Controls how tall the selection highlight boxes are computed to be.
  final BoxHeightStyle selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are computed to be.
  final BoxWidthStyle selectionWidthStyle;

  /// The appearance of the keyboard.
  final Brightness? keyboardAppearance;

  /// Configures padding to edges surrounding a Scrollable when the Textfield scrolls into view.
  final EdgeInsets scrollPadding;

  /// Determines the way that drag start behavior is handled.
  final DragStartBehavior dragStartBehavior;

  /// Whether to enable user interface affordances for changing the selection.
  final bool enableInteractiveSelection;

  /// Optional delegate for building the text selection handles and toolbar.
  final TextSelectionControls? selectionControls;

  /// Called when the text field is tapped.
  final GestureTapCallback? onTap;

  /// Called for each tap that occurs outside of the text field.
  final TapRegionCallback? onTapOutside;

  /// The cursor for a mouse pointer when it enters or is hovering over the widget.
  final MouseCursor? mouseCursor;

  /// Callback that generates a custom InputDecorator.counter widget.
  final InputCounterWidgetBuilder? buildCounter;

  /// The ScrollController to use when vertically scrolling the input.
  final ScrollController? scrollController;

  /// The ScrollPhysics to use when vertically scrolling the input.
  final ScrollPhysics? scrollPhysics;

  /// A list of strings that helps the autofill service identify the type of this text input.
  final Iterable<String>? autofillHints;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// Restoration ID to save and restore the state of the text field.
  final String? restorationId;

  /// Whether iOS 14 Scribble features are enabled for this widget.
  final bool scribbleEnabled;

  /// Whether to allow the underlying IME to learn from user input.
  final bool enableIMEPersonalizedLearning;

  /// Builds the text selection toolbar when requested by the user.
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// Configuration for spell check service.
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// Configuration for magnifier.
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// Controls the undo state.
  final UndoHistoryController? undoController;

  /// The variant of the text field.
  final M3TextFieldVariant variant;

  @override
  Widget build(BuildContext context) {
    final spec = variant == M3TextFieldVariant.filled 
        ? M3TextFieldSpecs.filled 
        : M3TextFieldSpecs.outlined;
    
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveDecoration = decoration ?? _buildDefaultDecoration(spec, colorScheme);
    final effectiveStyle = style ?? _buildDefaultTextStyle(spec, theme);
    final effectiveCursorColor = cursorColor ?? _getCursorColor(spec.cursorColor, colorScheme);

    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: effectiveDecoration,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      style: effectiveStyle,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      readOnly: readOnly,
      autofocus: autofocus,
      obscureText: obscureText,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onAppPrivateCommand: onAppPrivateCommand,
      inputFormatters: inputFormatters,
      enabled: enabled,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorColor: effectiveCursorColor,
      selectionHeightStyle: selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle,
      keyboardAppearance: keyboardAppearance,
      scrollPadding: scrollPadding,
      dragStartBehavior: dragStartBehavior,
      enableInteractiveSelection: enableInteractiveSelection,
      selectionControls: selectionControls,
      onTap: onTap,
      onTapOutside: onTapOutside,
      mouseCursor: mouseCursor,
      buildCounter: buildCounter,
      scrollController: scrollController,
      scrollPhysics: scrollPhysics,
      autofillHints: autofillHints,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      scribbleEnabled: scribbleEnabled,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      contextMenuBuilder: contextMenuBuilder,
      spellCheckConfiguration: spellCheckConfiguration,
      magnifierConfiguration: magnifierConfiguration,
      undoController: undoController,
    );
  }

  InputDecoration _buildDefaultDecoration(M3TextFieldSpec spec, ColorScheme colorScheme) {
    if (variant == M3TextFieldVariant.filled) {
      return InputDecoration(
        filled: true,
        fillColor: _getContainerColor(spec.containerColor, colorScheme),
        contentPadding: EdgeInsets.symmetric(
          horizontal: spec.paddingHorizontal,
          vertical: spec.paddingVertical,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide(
            color: _getIndicatorColor(spec.focusIndicatorColor, colorScheme),
            width: spec.focusIndicatorHeight,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide(
            color: _getIndicatorColor(spec.errorIndicatorColor, colorScheme),
            width: spec.errorIndicatorHeight,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide(
            color: _getIndicatorColor(spec.errorIndicatorColor, colorScheme),
            width: spec.errorIndicatorHeight,
          ),
        ),
        labelStyle: TextStyle(
          fontSize: spec.labelTextStyle.fontSize,
          fontWeight: spec.labelTextStyle.fontWeight,
          color: _getLabelColor(spec.labelTextColor, colorScheme),
        ),
        hintStyle: TextStyle(
          fontSize: spec.inputTextStyle.fontSize,
          fontWeight: spec.inputTextStyle.fontWeight,
          color: _getTextColor(spec.inputTextColor, colorScheme).withValues(alpha: 0.6),
        ),
        helperStyle: TextStyle(
          fontSize: spec.supportingTextStyle.fontSize,
          fontWeight: spec.supportingTextStyle.fontWeight,
          color: _getSupportingTextColor(spec.supportingTextColor, colorScheme),
        ),
        errorStyle: TextStyle(
          fontSize: spec.supportingTextStyle.fontSize,
          fontWeight: spec.supportingTextStyle.fontWeight,
          color: colorScheme.error,
        ),
      );
    } else {
      // Outlined variant
      return InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: spec.paddingHorizontal,
          vertical: spec.paddingVertical,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide(
            color: _getOutlineColor(spec.outlineColor!, colorScheme),
            width: spec.outlineWidth!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide(
            color: _getOutlineColor(spec.outlineColor!, colorScheme),
            width: spec.outlineWidth!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide(
            color: _getIndicatorColor(spec.focusIndicatorColor, colorScheme),
            width: spec.focusIndicatorHeight,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide(
            color: _getIndicatorColor(spec.errorIndicatorColor, colorScheme),
            width: spec.errorIndicatorHeight,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          borderSide: BorderSide(
            color: _getIndicatorColor(spec.errorIndicatorColor, colorScheme),
            width: spec.errorIndicatorHeight,
          ),
        ),
        labelStyle: TextStyle(
          fontSize: spec.labelTextStyle.fontSize,
          fontWeight: spec.labelTextStyle.fontWeight,
          color: _getLabelColor(spec.labelTextColor, colorScheme),
        ),
        hintStyle: TextStyle(
          fontSize: spec.inputTextStyle.fontSize,
          fontWeight: spec.inputTextStyle.fontWeight,
          color: _getTextColor(spec.inputTextColor, colorScheme).withValues(alpha: 0.6),
        ),
        helperStyle: TextStyle(
          fontSize: spec.supportingTextStyle.fontSize,
          fontWeight: spec.supportingTextStyle.fontWeight,
          color: _getSupportingTextColor(spec.supportingTextColor, colorScheme),
        ),
        errorStyle: TextStyle(
          fontSize: spec.supportingTextStyle.fontSize,
          fontWeight: spec.supportingTextStyle.fontWeight,
          color: colorScheme.error,
        ),
      );
    }
  }

  TextStyle _buildDefaultTextStyle(M3TextFieldSpec spec, ThemeData theme) {
    return TextStyle(
      fontSize: spec.inputTextStyle.fontSize,
      fontWeight: spec.inputTextStyle.fontWeight,
      letterSpacing: spec.inputTextStyle.letterSpacing,
      height: spec.inputTextStyle.height,
      color: _getTextColor(spec.inputTextColor, theme.colorScheme),
    );
  }

  Color _getContainerColor(M3TextFieldContainerColor containerColor, ColorScheme colorScheme) {
    switch (containerColor) {
      case M3TextFieldContainerColor.transparent:
        return Colors.transparent;
      case M3TextFieldContainerColor.surface:
        return colorScheme.surface;
      case M3TextFieldContainerColor.surfaceContainer:
        return colorScheme.surfaceContainer;
      case M3TextFieldContainerColor.surfaceContainerHigh:
        return colorScheme.surfaceContainerHigh;
      case M3TextFieldContainerColor.surfaceContainerHighest:
        return colorScheme.surfaceContainerHighest;
      case M3TextFieldContainerColor.surfaceVariant:
        return colorScheme.surfaceContainerHighest; // Updated M3 mapping
    }
  }

  Color _getTextColor(M3TextFieldTextColor textColor, ColorScheme colorScheme) {
    switch (textColor) {
      case M3TextFieldTextColor.onSurface:
        return colorScheme.onSurface;
      case M3TextFieldTextColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3TextFieldTextColor.primary:
        return colorScheme.primary;
      case M3TextFieldTextColor.secondary:
        return colorScheme.secondary;
      case M3TextFieldTextColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  Color _getLabelColor(M3TextFieldLabelColor labelColor, ColorScheme colorScheme) {
    switch (labelColor) {
      case M3TextFieldLabelColor.onSurface:
        return colorScheme.onSurface;
      case M3TextFieldLabelColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3TextFieldLabelColor.primary:
        return colorScheme.primary;
      case M3TextFieldLabelColor.secondary:
        return colorScheme.secondary;
      case M3TextFieldLabelColor.tertiary:
        return colorScheme.tertiary;
      case M3TextFieldLabelColor.error:
        return colorScheme.error;
    }
  }

  Color _getSupportingTextColor(M3TextFieldSupportingTextColor supportingTextColor, ColorScheme colorScheme) {
    switch (supportingTextColor) {
      case M3TextFieldSupportingTextColor.onSurface:
        return colorScheme.onSurface;
      case M3TextFieldSupportingTextColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3TextFieldSupportingTextColor.error:
        return colorScheme.error;
    }
  }

  Color _getCursorColor(M3TextFieldCursorColor cursorColor, ColorScheme colorScheme) {
    switch (cursorColor) {
      case M3TextFieldCursorColor.primary:
        return colorScheme.primary;
      case M3TextFieldCursorColor.secondary:
        return colorScheme.secondary;
      case M3TextFieldCursorColor.tertiary:
        return colorScheme.tertiary;
      case M3TextFieldCursorColor.onSurface:
        return colorScheme.onSurface;
    }
  }

  Color _getIndicatorColor(M3TextFieldIndicatorColor indicatorColor, ColorScheme colorScheme) {
    switch (indicatorColor) {
      case M3TextFieldIndicatorColor.primary:
        return colorScheme.primary;
      case M3TextFieldIndicatorColor.secondary:
        return colorScheme.secondary;
      case M3TextFieldIndicatorColor.tertiary:
        return colorScheme.tertiary;
      case M3TextFieldIndicatorColor.error:
        return colorScheme.error;
    }
  }

  Color _getOutlineColor(M3TextFieldOutlineColor outlineColor, ColorScheme colorScheme) {
    switch (outlineColor) {
      case M3TextFieldOutlineColor.outline:
        return colorScheme.outline;
      case M3TextFieldOutlineColor.outlineVariant:
        return colorScheme.outlineVariant;
      case M3TextFieldOutlineColor.primary:
        return colorScheme.primary;
      case M3TextFieldOutlineColor.error:
        return colorScheme.error;
    }
  }
}

/// Variants of the M3 text field.
enum M3TextFieldVariant {
  /// Filled text field with background color.
  filled,

  /// Outlined text field with border.
  outlined,
}