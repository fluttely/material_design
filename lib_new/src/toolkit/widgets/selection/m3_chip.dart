/// Material 3 Chip widget implementation.
///
/// Reference: https://m3.material.io/components/chips/overview
library;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../design/comp/comp.dart';
import '../../../design/sys/sys.dart';

/// A Material 3 assist chip widget.
/// 
/// Assist chips represent smart or automated actions that can span multiple apps,
/// such as opening a calendar event from the home screen.
class M3AssistChip extends StatelessWidget {
  const M3AssistChip({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.onDeleted,
    this.deleteIcon,
    this.tooltip,
    this.mouseCursor,
    this.materialTapTargetSize,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.backgroundColor,
    this.disabledColor,
    this.selectedColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.selectedShadowColor,
    this.showCheckmark,
    this.checkmarkColor,
    this.labelStyle,
    this.labelPadding,
    this.pressElevation,
    this.elevation = 0.0,
    this.constraints,
    this.shape,
    this.side,
    this.iconTheme,
    this.avatarBorder = const CircleBorder(),
    this.chipAnimationStyle,
  });

  /// The primary content of the chip.
  final Widget label;

  /// An icon to display prior to the chip's label.
  final Widget? icon;

  /// Called when the chip is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// Called when the delete icon is tapped.
  final VoidCallback? onDeleted;

  /// The icon displayed when [onDeleted] is set.
  final Widget? deleteIcon;

  /// Tooltip message to be used for the body area.
  final String? tooltip;

  /// The cursor for a mouse pointer when it enters or is hovering over the widget.
  final MouseCursor? mouseCursor;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// The content will be clipped according to this option.
  final Clip clipBehavior;

  /// An optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// Whether this widget will be selected as the initial focus when no other node is focused.
  final bool autofocus;

  /// Color to be used for the chip's background.
  final Color? backgroundColor;

  /// The color used for the chip's background when it is disabled.
  final Color? disabledColor;

  /// Color to be used for the chip's background when selected.
  final Color? selectedColor;

  /// Configures the surface tint color overlay.
  final Color? surfaceTintColor;

  /// Color to be used for the chip's shadow.
  final Color? shadowColor;

  /// Color to be used for the chip's shadow when selected.
  final Color? selectedShadowColor;

  /// Whether to display a checkmark when selected.
  final bool? showCheckmark;

  /// Color of the checkmark when selected.
  final Color? checkmarkColor;

  /// The style to be applied to the chip's label.
  final TextStyle? labelStyle;

  /// The padding between the contents of the label and the outside of the label.
  final EdgeInsetsGeometry? labelPadding;

  /// The elevation used when pressed.
  final double? pressElevation;

  /// The z-coordinate at which to place this chip.
  final double elevation;

  /// Additional constraints to apply to the chip.
  final BoxConstraints? constraints;

  /// The shape of the chip's border.
  final OutlinedBorder? shape;

  /// The color and weight of the chip's outline.
  final BorderSide? side;

  /// Theme for icons in the chip.
  final IconThemeData? iconTheme;

  /// The border to use for the avatar.
  final ShapeBorder avatarBorder;

  /// Used to configure the animation when the chip is pressed.
  final ChipAnimationStyle? chipAnimationStyle;

  @override
  Widget build(BuildContext context) {
    final spec = M3ChipSpecs.assist;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = backgroundColor ?? 
        _getContainerColor(spec.containerColor, colorScheme);
    final effectiveLabelStyle = labelStyle ?? 
        _buildLabelStyle(spec, colorScheme);
    final effectiveIconTheme = iconTheme ?? 
        _buildIconTheme(spec, colorScheme);
    final effectiveShape = shape ?? 
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          side: side ?? BorderSide(
            color: _getOutlineColor(spec.outlineColor!, colorScheme),
            width: spec.outlineWidth!,
          ),
        );

    return ActionChip(
      label: label,
      avatar: icon,
      onPressed: onPressed,
      tooltip: tooltip,
      mouseCursor: mouseCursor,
      materialTapTargetSize: materialTapTargetSize,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      backgroundColor: effectiveBackgroundColor,
      disabledColor: disabledColor,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      pressElevation: pressElevation,
      elevation: elevation,
      constraints: constraints,
      shape: effectiveShape,
      iconTheme: effectiveIconTheme,
      labelStyle: effectiveLabelStyle,
      labelPadding: labelPadding ?? EdgeInsets.symmetric(
        horizontal: spec.paddingHorizontal,
        vertical: spec.paddingVertical,
      ),
      side: BorderSide.none, // Border handled by shape
      avatarBorder: avatarBorder,
      chipAnimationStyle: chipAnimationStyle,
    );
  }

  Color _getContainerColor(M3ChipContainerColor containerColor, ColorScheme colorScheme) {
    switch (containerColor) {
      case M3ChipContainerColor.transparent:
        return Colors.transparent;
      case M3ChipContainerColor.surface:
        return colorScheme.surface;
      case M3ChipContainerColor.surfaceVariant:
        return colorScheme.surfaceVariant;
      case M3ChipContainerColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case M3ChipContainerColor.primaryContainer:
        return colorScheme.primaryContainer;
      case M3ChipContainerColor.tertiaryContainer:
        return colorScheme.tertiaryContainer;
    }
  }

  Color _getLabelColor(M3ChipLabelColor labelColor, ColorScheme colorScheme) {
    switch (labelColor) {
      case M3ChipLabelColor.onSurface:
        return colorScheme.onSurface;
      case M3ChipLabelColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3ChipLabelColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3ChipLabelColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3ChipLabelColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3ChipLabelColor.primary:
        return colorScheme.primary;
      case M3ChipLabelColor.secondary:
        return colorScheme.secondary;
      case M3ChipLabelColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  Color _getIconColor(M3ChipIconColor iconColor, ColorScheme colorScheme) {
    switch (iconColor) {
      case M3ChipIconColor.onSurface:
        return colorScheme.onSurface;
      case M3ChipIconColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3ChipIconColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3ChipIconColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3ChipIconColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3ChipIconColor.primary:
        return colorScheme.primary;
      case M3ChipIconColor.secondary:
        return colorScheme.secondary;
      case M3ChipIconColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  Color _getOutlineColor(M3ChipOutlineColor outlineColor, ColorScheme colorScheme) {
    switch (outlineColor) {
      case M3ChipOutlineColor.outline:
        return colorScheme.outline;
      case M3ChipOutlineColor.outlineVariant:
        return colorScheme.outlineVariant;
      case M3ChipOutlineColor.primary:
        return colorScheme.primary;
      case M3ChipOutlineColor.secondary:
        return colorScheme.secondary;
      case M3ChipOutlineColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  TextStyle _buildLabelStyle(M3ChipSpec spec, ColorScheme colorScheme) {
    return TextStyle(
      fontSize: spec.labelTextStyle.fontSize,
      fontWeight: spec.labelTextStyle.fontWeight,
      letterSpacing: spec.labelTextStyle.letterSpacing,
      height: spec.labelTextStyle.height,
      color: _getLabelColor(spec.labelColor, colorScheme),
    );
  }

  IconThemeData _buildIconTheme(M3ChipSpec spec, ColorScheme colorScheme) {
    return IconThemeData(
      color: _getIconColor(spec.iconColor, colorScheme),
      size: spec.iconSize,
    );
  }
}

/// A Material 3 filter chip widget.
/// 
/// Filter chips use tags or descriptive words to filter content.
class M3FilterChip extends StatefulWidget {
  const M3FilterChip({
    super.key,
    required this.label,
    required this.selected,
    this.avatar,
    this.onSelected,
    this.deleteIcon,
    this.onDeleted,
    this.tooltip,
    this.mouseCursor,
    this.materialTapTargetSize,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.backgroundColor,
    this.disabledColor,
    this.selectedColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.selectedShadowColor,
    this.showCheckmark = true,
    this.checkmarkColor,
    this.labelStyle,
    this.labelPadding,
    this.pressElevation,
    this.elevation = 0.0,
    this.constraints,
    this.shape,
    this.side,
    this.iconTheme,
    this.avatarBorder = const CircleBorder(),
    this.chipAnimationStyle,
  });

  /// The primary content of the chip.
  final Widget label;

  /// Whether this chip is selected.
  final bool selected;

  /// An optional widget to display prior to the chip's label.
  final Widget? avatar;

  /// Called when the chip should change between selected and de-selected states.
  final ValueChanged<bool>? onSelected;

  /// The icon displayed when [onDeleted] is set.
  final Widget? deleteIcon;

  /// Called when the delete icon is tapped.
  final VoidCallback? onDeleted;

  /// Tooltip message to be used for the body area.
  final String? tooltip;

  /// The cursor for a mouse pointer when it enters or is hovering over the widget.
  final MouseCursor? mouseCursor;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// The content will be clipped according to this option.
  final Clip clipBehavior;

  /// An optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// Whether this widget will be selected as the initial focus when no other node is focused.
  final bool autofocus;

  /// Color to be used for the chip's background.
  final Color? backgroundColor;

  /// The color used for the chip's background when it is disabled.
  final Color? disabledColor;

  /// Color to be used for the chip's background when selected.
  final Color? selectedColor;

  /// Configures the surface tint color overlay.
  final Color? surfaceTintColor;

  /// Color to be used for the chip's shadow.
  final Color? shadowColor;

  /// Color to be used for the chip's shadow when selected.
  final Color? selectedShadowColor;

  /// Whether to display a checkmark when selected.
  final bool showCheckmark;

  /// Color of the checkmark when selected.
  final Color? checkmarkColor;

  /// The style to be applied to the chip's label.
  final TextStyle? labelStyle;

  /// The padding between the contents of the label and the outside of the label.
  final EdgeInsetsGeometry? labelPadding;

  /// The elevation used when pressed.
  final double? pressElevation;

  /// The z-coordinate at which to place this chip.
  final double elevation;

  /// Additional constraints to apply to the chip.
  final BoxConstraints? constraints;

  /// The shape of the chip's border.
  final OutlinedBorder? shape;

  /// The color and weight of the chip's outline.
  final BorderSide? side;

  /// Theme for icons in the chip.
  final IconThemeData? iconTheme;

  /// The border to use for the avatar.
  final ShapeBorder avatarBorder;

  /// Used to configure the animation when the chip is pressed.
  final ChipAnimationStyle? chipAnimationStyle;

  @override
  State<M3FilterChip> createState() => _M3FilterChipState();
}

class _M3FilterChipState extends State<M3FilterChip> {
  @override
  Widget build(BuildContext context) {
    final spec = M3ChipSpecs.filter;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = widget.selected
        ? (widget.selectedColor ?? _getContainerColor(spec.selectedContainerColor!, colorScheme))
        : (widget.backgroundColor ?? _getContainerColor(spec.containerColor, colorScheme));
    
    final effectiveLabelStyle = widget.labelStyle ?? 
        _buildLabelStyle(spec, colorScheme, widget.selected);
    final effectiveIconTheme = widget.iconTheme ?? 
        _buildIconTheme(spec, colorScheme, widget.selected);
    final effectiveShape = widget.shape ?? 
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          side: widget.selected 
              ? BorderSide.none 
              : (widget.side ?? BorderSide(
                  color: _getOutlineColor(spec.outlineColor!, colorScheme),
                  width: spec.outlineWidth!,
                )),
        );

    return FilterChip(
      label: widget.label,
      avatar: widget.avatar,
      selected: widget.selected,
      onSelected: widget.onSelected,
      deleteIcon: widget.deleteIcon,
      onDeleted: widget.onDeleted,
      tooltip: widget.tooltip,
      mouseCursor: widget.mouseCursor,
      materialTapTargetSize: widget.materialTapTargetSize,
      clipBehavior: widget.clipBehavior,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      backgroundColor: effectiveBackgroundColor,
      disabledColor: widget.disabledColor,
      selectedColor: effectiveBackgroundColor,
      surfaceTintColor: widget.surfaceTintColor,
      shadowColor: widget.shadowColor,
      selectedShadowColor: widget.selectedShadowColor,
      showCheckmark: widget.showCheckmark,
      checkmarkColor: widget.checkmarkColor,
      pressElevation: widget.pressElevation,
      elevation: widget.elevation,
      constraints: widget.constraints,
      shape: effectiveShape,
      iconTheme: effectiveIconTheme,
      labelStyle: effectiveLabelStyle,
      labelPadding: widget.labelPadding ?? EdgeInsets.symmetric(
        horizontal: spec.paddingHorizontal,
        vertical: spec.paddingVertical,
      ),
      side: BorderSide.none, // Border handled by shape
      avatarBorder: widget.avatarBorder,
      chipAnimationStyle: widget.chipAnimationStyle,
    );
  }

  Color _getContainerColor(M3ChipContainerColor containerColor, ColorScheme colorScheme) {
    switch (containerColor) {
      case M3ChipContainerColor.transparent:
        return Colors.transparent;
      case M3ChipContainerColor.surface:
        return colorScheme.surface;
      case M3ChipContainerColor.surfaceVariant:
        return colorScheme.surfaceVariant;
      case M3ChipContainerColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case M3ChipContainerColor.primaryContainer:
        return colorScheme.primaryContainer;
      case M3ChipContainerColor.tertiaryContainer:
        return colorScheme.tertiaryContainer;
    }
  }

  Color _getLabelColor(M3ChipLabelColor labelColor, ColorScheme colorScheme) {
    switch (labelColor) {
      case M3ChipLabelColor.onSurface:
        return colorScheme.onSurface;
      case M3ChipLabelColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3ChipLabelColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3ChipLabelColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3ChipLabelColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3ChipLabelColor.primary:
        return colorScheme.primary;
      case M3ChipLabelColor.secondary:
        return colorScheme.secondary;
      case M3ChipLabelColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  Color _getIconColor(M3ChipIconColor iconColor, ColorScheme colorScheme) {
    switch (iconColor) {
      case M3ChipIconColor.onSurface:
        return colorScheme.onSurface;
      case M3ChipIconColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3ChipIconColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3ChipIconColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3ChipIconColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3ChipIconColor.primary:
        return colorScheme.primary;
      case M3ChipIconColor.secondary:
        return colorScheme.secondary;
      case M3ChipIconColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  Color _getOutlineColor(M3ChipOutlineColor outlineColor, ColorScheme colorScheme) {
    switch (outlineColor) {
      case M3ChipOutlineColor.outline:
        return colorScheme.outline;
      case M3ChipOutlineColor.outlineVariant:
        return colorScheme.outlineVariant;
      case M3ChipOutlineColor.primary:
        return colorScheme.primary;
      case M3ChipOutlineColor.secondary:
        return colorScheme.secondary;
      case M3ChipOutlineColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  TextStyle _buildLabelStyle(M3ChipSpec spec, ColorScheme colorScheme, bool selected) {
    final labelColor = selected 
        ? _getLabelColor(spec.selectedLabelColor!, colorScheme)
        : _getLabelColor(spec.labelColor, colorScheme);
    
    return TextStyle(
      fontSize: spec.labelTextStyle.fontSize,
      fontWeight: spec.labelTextStyle.fontWeight,
      letterSpacing: spec.labelTextStyle.letterSpacing,
      height: spec.labelTextStyle.height,
      color: labelColor,
    );
  }

  IconThemeData _buildIconTheme(M3ChipSpec spec, ColorScheme colorScheme, bool selected) {
    final iconColor = selected 
        ? _getIconColor(spec.selectedIconColor!, colorScheme)
        : _getIconColor(spec.iconColor, colorScheme);
    
    return IconThemeData(
      color: iconColor,
      size: spec.iconSize,
    );
  }
}

/// A Material 3 input chip widget.
/// 
/// Input chips represent a complex piece of information in compact form, such as an entity 
/// (person, place, or thing) or text. They enable user input and verify that input by converting 
/// text into chips.
class M3InputChip extends StatelessWidget {
  const M3InputChip({
    super.key,
    required this.label,
    this.avatar,
    this.selected = false,
    this.onPressed,
    this.onSelected,
    this.onDeleted,
    this.deleteIcon,
    this.tooltip,
    this.mouseCursor,
    this.materialTapTargetSize,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.backgroundColor,
    this.disabledColor,
    this.selectedColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.selectedShadowColor,
    this.showCheckmark = true,
    this.checkmarkColor,
    this.labelStyle,
    this.labelPadding,
    this.pressElevation,
    this.elevation = 0.0,
    this.constraints,
    this.shape,
    this.side,
    this.iconTheme,
    this.avatarBorder = const CircleBorder(),
    this.chipAnimationStyle,
  });

  /// The primary content of the chip.
  final Widget label;

  /// An optional widget to display prior to the chip's label.
  final Widget? avatar;

  /// Whether this chip is selected.
  final bool selected;

  /// Called when the chip is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// Called when the chip should change between selected and de-selected states.
  final ValueChanged<bool>? onSelected;

  /// Called when the delete icon is tapped.
  final VoidCallback? onDeleted;

  /// The icon displayed when [onDeleted] is set.
  final Widget? deleteIcon;

  /// Tooltip message to be used for the body area.
  final String? tooltip;

  /// The cursor for a mouse pointer when it enters or is hovering over the widget.
  final MouseCursor? mouseCursor;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// The content will be clipped according to this option.
  final Clip clipBehavior;

  /// An optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// Whether this widget will be selected as the initial focus when no other node is focused.
  final bool autofocus;

  /// Color to be used for the chip's background.
  final Color? backgroundColor;

  /// The color used for the chip's background when it is disabled.
  final Color? disabledColor;

  /// Color to be used for the chip's background when selected.
  final Color? selectedColor;

  /// Configures the surface tint color overlay.
  final Color? surfaceTintColor;

  /// Color to be used for the chip's shadow.
  final Color? shadowColor;

  /// Color to be used for the chip's shadow when selected.
  final Color? selectedShadowColor;

  /// Whether to display a checkmark when selected.
  final bool showCheckmark;

  /// Color of the checkmark when selected.
  final Color? checkmarkColor;

  /// The style to be applied to the chip's label.
  final TextStyle? labelStyle;

  /// The padding between the contents of the label and the outside of the label.
  final EdgeInsetsGeometry? labelPadding;

  /// The elevation used when pressed.
  final double? pressElevation;

  /// The z-coordinate at which to place this chip.
  final double elevation;

  /// Additional constraints to apply to the chip.
  final BoxConstraints? constraints;

  /// The shape of the chip's border.
  final OutlinedBorder? shape;

  /// The color and weight of the chip's outline.
  final BorderSide? side;

  /// Theme for icons in the chip.
  final IconThemeData? iconTheme;

  /// The border to use for the avatar.
  final ShapeBorder avatarBorder;

  /// Used to configure the animation when the chip is pressed.
  final ChipAnimationStyle? chipAnimationStyle;

  @override
  Widget build(BuildContext context) {
    final spec = M3ChipSpecs.input;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = backgroundColor ?? 
        _getContainerColor(spec.containerColor, colorScheme);
    final effectiveLabelStyle = labelStyle ?? 
        _buildLabelStyle(spec, colorScheme);
    final effectiveIconTheme = iconTheme ?? 
        _buildIconTheme(spec, colorScheme);
    final effectiveShape = shape ?? 
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          side: side ?? BorderSide(
            color: _getOutlineColor(spec.outlineColor!, colorScheme),
            width: spec.outlineWidth!,
          ),
        );

    return InputChip(
      label: label,
      avatar: avatar,
      selected: selected,
      onPressed: onPressed,
      onSelected: onSelected,
      onDeleted: onDeleted,
      deleteIcon: deleteIcon,
      tooltip: tooltip,
      mouseCursor: mouseCursor,
      materialTapTargetSize: materialTapTargetSize,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      backgroundColor: effectiveBackgroundColor,
      disabledColor: disabledColor,
      selectedColor: selectedColor,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      selectedShadowColor: selectedShadowColor,
      showCheckmark: showCheckmark,
      checkmarkColor: checkmarkColor,
      pressElevation: pressElevation,
      elevation: elevation,
      constraints: constraints,
      shape: effectiveShape,
      iconTheme: effectiveIconTheme,
      labelStyle: effectiveLabelStyle,
      labelPadding: labelPadding ?? EdgeInsets.symmetric(
        horizontal: spec.paddingHorizontal,
        vertical: spec.paddingVertical,
      ),
      side: BorderSide.none, // Border handled by shape
      avatarBorder: avatarBorder,
      chipAnimationStyle: chipAnimationStyle,
    );
  }

  Color _getContainerColor(M3ChipContainerColor containerColor, ColorScheme colorScheme) {
    switch (containerColor) {
      case M3ChipContainerColor.transparent:
        return Colors.transparent;
      case M3ChipContainerColor.surface:
        return colorScheme.surface;
      case M3ChipContainerColor.surfaceVariant:
        return colorScheme.surfaceVariant;
      case M3ChipContainerColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case M3ChipContainerColor.primaryContainer:
        return colorScheme.primaryContainer;
      case M3ChipContainerColor.tertiaryContainer:
        return colorScheme.tertiaryContainer;
    }
  }

  Color _getLabelColor(M3ChipLabelColor labelColor, ColorScheme colorScheme) {
    switch (labelColor) {
      case M3ChipLabelColor.onSurface:
        return colorScheme.onSurface;
      case M3ChipLabelColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3ChipLabelColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3ChipLabelColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3ChipLabelColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3ChipLabelColor.primary:
        return colorScheme.primary;
      case M3ChipLabelColor.secondary:
        return colorScheme.secondary;
      case M3ChipLabelColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  Color _getIconColor(M3ChipIconColor iconColor, ColorScheme colorScheme) {
    switch (iconColor) {
      case M3ChipIconColor.onSurface:
        return colorScheme.onSurface;
      case M3ChipIconColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3ChipIconColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3ChipIconColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3ChipIconColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3ChipIconColor.primary:
        return colorScheme.primary;
      case M3ChipIconColor.secondary:
        return colorScheme.secondary;
      case M3ChipIconColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  Color _getOutlineColor(M3ChipOutlineColor outlineColor, ColorScheme colorScheme) {
    switch (outlineColor) {
      case M3ChipOutlineColor.outline:
        return colorScheme.outline;
      case M3ChipOutlineColor.outlineVariant:
        return colorScheme.outlineVariant;
      case M3ChipOutlineColor.primary:
        return colorScheme.primary;
      case M3ChipOutlineColor.secondary:
        return colorScheme.secondary;
      case M3ChipOutlineColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  TextStyle _buildLabelStyle(M3ChipSpec spec, ColorScheme colorScheme) {
    return TextStyle(
      fontSize: spec.labelTextStyle.fontSize,
      fontWeight: spec.labelTextStyle.fontWeight,
      letterSpacing: spec.labelTextStyle.letterSpacing,
      height: spec.labelTextStyle.height,
      color: _getLabelColor(spec.labelColor, colorScheme),
    );
  }

  IconThemeData _buildIconTheme(M3ChipSpec spec, ColorScheme colorScheme) {
    return IconThemeData(
      color: _getIconColor(spec.iconColor, colorScheme),
      size: spec.iconSize,
    );
  }
}

/// A Material 3 suggestion chip widget.
/// 
/// Suggestion chips help narrow a user's intent by presenting dynamically generated suggestions, 
/// such as possible responses or search filters.
class M3SuggestionChip extends StatelessWidget {
  const M3SuggestionChip({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.tooltip,
    this.mouseCursor,
    this.materialTapTargetSize,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.backgroundColor,
    this.disabledColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.labelStyle,
    this.labelPadding,
    this.pressElevation,
    this.elevation = 0.0,
    this.constraints,
    this.shape,
    this.side,
    this.iconTheme,
    this.avatarBorder = const CircleBorder(),
    this.chipAnimationStyle,
  });

  /// The primary content of the chip.
  final Widget label;

  /// An icon to display prior to the chip's label.
  final Widget? icon;

  /// Called when the chip is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// Tooltip message to be used for the body area.
  final String? tooltip;

  /// The cursor for a mouse pointer when it enters or is hovering over the widget.
  final MouseCursor? mouseCursor;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// The content will be clipped according to this option.
  final Clip clipBehavior;

  /// An optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// Whether this widget will be selected as the initial focus when no other node is focused.
  final bool autofocus;

  /// Color to be used for the chip's background.
  final Color? backgroundColor;

  /// The color used for the chip's background when it is disabled.
  final Color? disabledColor;

  /// Configures the surface tint color overlay.
  final Color? surfaceTintColor;

  /// Color to be used for the chip's shadow.
  final Color? shadowColor;

  /// The style to be applied to the chip's label.
  final TextStyle? labelStyle;

  /// The padding between the contents of the label and the outside of the label.
  final EdgeInsetsGeometry? labelPadding;

  /// The elevation used when pressed.
  final double? pressElevation;

  /// The z-coordinate at which to place this chip.
  final double elevation;

  /// Additional constraints to apply to the chip.
  final BoxConstraints? constraints;

  /// The shape of the chip's border.
  final OutlinedBorder? shape;

  /// The color and weight of the chip's outline.
  final BorderSide? side;

  /// Theme for icons in the chip.
  final IconThemeData? iconTheme;

  /// The border to use for the avatar.
  final ShapeBorder avatarBorder;

  /// Used to configure the animation when the chip is pressed.
  final ChipAnimationStyle? chipAnimationStyle;

  @override
  Widget build(BuildContext context) {
    final spec = M3ChipSpecs.suggestion;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = backgroundColor ?? 
        _getContainerColor(spec.containerColor, colorScheme);
    final effectiveLabelStyle = labelStyle ?? 
        _buildLabelStyle(spec, colorScheme);
    final effectiveIconTheme = iconTheme ?? 
        _buildIconTheme(spec, colorScheme);
    final effectiveShape = shape ?? 
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
          side: side ?? BorderSide(
            color: _getOutlineColor(spec.outlineColor!, colorScheme),
            width: spec.outlineWidth!,
          ),
        );

    return ActionChip(
      label: label,
      avatar: icon,
      onPressed: onPressed,
      tooltip: tooltip,
      mouseCursor: mouseCursor,
      materialTapTargetSize: materialTapTargetSize,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      backgroundColor: effectiveBackgroundColor,
      disabledColor: disabledColor,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      pressElevation: pressElevation,
      elevation: elevation,
      constraints: constraints,
      shape: effectiveShape,
      iconTheme: effectiveIconTheme,
      labelStyle: effectiveLabelStyle,
      labelPadding: labelPadding ?? EdgeInsets.symmetric(
        horizontal: spec.paddingHorizontal,
        vertical: spec.paddingVertical,
      ),
      side: BorderSide.none, // Border handled by shape
      avatarBorder: avatarBorder,
      chipAnimationStyle: chipAnimationStyle,
    );
  }

  Color _getContainerColor(M3ChipContainerColor containerColor, ColorScheme colorScheme) {
    switch (containerColor) {
      case M3ChipContainerColor.transparent:
        return Colors.transparent;
      case M3ChipContainerColor.surface:
        return colorScheme.surface;
      case M3ChipContainerColor.surfaceVariant:
        return colorScheme.surfaceVariant;
      case M3ChipContainerColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case M3ChipContainerColor.primaryContainer:
        return colorScheme.primaryContainer;
      case M3ChipContainerColor.tertiaryContainer:
        return colorScheme.tertiaryContainer;
    }
  }

  Color _getLabelColor(M3ChipLabelColor labelColor, ColorScheme colorScheme) {
    switch (labelColor) {
      case M3ChipLabelColor.onSurface:
        return colorScheme.onSurface;
      case M3ChipLabelColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3ChipLabelColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3ChipLabelColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3ChipLabelColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3ChipLabelColor.primary:
        return colorScheme.primary;
      case M3ChipLabelColor.secondary:
        return colorScheme.secondary;
      case M3ChipLabelColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  Color _getIconColor(M3ChipIconColor iconColor, ColorScheme colorScheme) {
    switch (iconColor) {
      case M3ChipIconColor.onSurface:
        return colorScheme.onSurface;
      case M3ChipIconColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3ChipIconColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3ChipIconColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3ChipIconColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3ChipIconColor.primary:
        return colorScheme.primary;
      case M3ChipIconColor.secondary:
        return colorScheme.secondary;
      case M3ChipIconColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  Color _getOutlineColor(M3ChipOutlineColor outlineColor, ColorScheme colorScheme) {
    switch (outlineColor) {
      case M3ChipOutlineColor.outline:
        return colorScheme.outline;
      case M3ChipOutlineColor.outlineVariant:
        return colorScheme.outlineVariant;
      case M3ChipOutlineColor.primary:
        return colorScheme.primary;
      case M3ChipOutlineColor.secondary:
        return colorScheme.secondary;
      case M3ChipOutlineColor.tertiary:
        return colorScheme.tertiary;
    }
  }

  TextStyle _buildLabelStyle(M3ChipSpec spec, ColorScheme colorScheme) {
    return TextStyle(
      fontSize: spec.labelTextStyle.fontSize,
      fontWeight: spec.labelTextStyle.fontWeight,
      letterSpacing: spec.labelTextStyle.letterSpacing,
      height: spec.labelTextStyle.height,
      color: _getLabelColor(spec.labelColor, colorScheme),
    );
  }

  IconThemeData _buildIconTheme(M3ChipSpec spec, ColorScheme colorScheme) {
    return IconThemeData(
      color: _getIconColor(spec.iconColor, colorScheme),
      size: spec.iconSize,
    );
  }
}