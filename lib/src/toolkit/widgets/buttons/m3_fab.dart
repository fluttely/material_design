/// Material 3 Floating Action Button widget implementation.
///
/// Reference: https://m3.material.io/components/floating-action-button/overview
library;

import 'package:flutter/material.dart';
import '../../../design/comp/comp.dart';

/// A Material 3 floating action button widget.
/// 
/// FABs help people take primary actions. They're used to represent the 
/// most important action on a screen.
class M3FloatingActionButton extends StatelessWidget {
  const M3FloatingActionButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.mini = false,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
  });

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The widget to display inside the FAB.
  final Widget child;

  /// Text that describes the action that will occur when the FAB is pressed.
  final String? tooltip;

  /// The default foreground color for icons and text within the button.
  final Color? foregroundColor;

  /// The button's background color.
  final Color? backgroundColor;

  /// The color to use for filling the button when the button has input focus.
  final Color? focusColor;

  /// The color to use for filling the button when the button has a pointer hovering over it.
  final Color? hoverColor;

  /// The splash color for the button's InkWell.
  final Color? splashColor;

  /// The tag to apply to the button's Hero widget.
  final Object? heroTag;

  /// The z-coordinate at which to place this button relative to its parent.
  final double? elevation;

  /// The z-coordinate at which to place this button when it has the input focus.
  final double? focusElevation;

  /// The z-coordinate at which to place this button when a pointer is hovering over it.
  final double? hoverElevation;

  /// The z-coordinate at which to place this button while it is being pressed.
  final double? highlightElevation;

  /// The z-coordinate at which to place this button when onPressed is null.
  final double? disabledElevation;

  /// Controls the size of this button.
  final bool mini;

  /// The shape of the button's Material.
  final ShapeBorder? shape;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// True if this widget will be selected as the initial focus.
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final spec = mini ? M3FabSpecs.small : M3FabSpecs.regular;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = backgroundColor ?? 
        _getContainerColor(spec.containerColor, colorScheme);
    
    final effectiveForegroundColor = foregroundColor ?? 
        _getIconColor(spec.iconColor, colorScheme);

    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      foregroundColor: effectiveForegroundColor,
      backgroundColor: effectiveBackgroundColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      heroTag: heroTag,
      elevation: elevation ?? spec.containerElevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      mini: mini,
      shape: shape ?? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spec.containerShape),
      ),
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      child: SizedBox.square(
        dimension: spec.iconSize,
        child: child,
      ),
    );
  }

  Color _getContainerColor(M3FabContainerColor containerColor, ColorScheme colorScheme) {
    switch (containerColor) {
      case M3FabContainerColor.primary:
        return colorScheme.primary;
      case M3FabContainerColor.primaryContainer:
        return colorScheme.primaryContainer;
      case M3FabContainerColor.secondary:
        return colorScheme.secondary;
      case M3FabContainerColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case M3FabContainerColor.tertiary:
        return colorScheme.tertiary;
      case M3FabContainerColor.tertiaryContainer:
        return colorScheme.tertiaryContainer;
      case M3FabContainerColor.surface:
        return colorScheme.surface;
      case M3FabContainerColor.surfaceVariant:
        return colorScheme.surfaceContainerHighest; // Updated M3 mapping
    }
  }

  Color _getIconColor(M3FabIconColor iconColor, ColorScheme colorScheme) {
    switch (iconColor) {
      case M3FabIconColor.onPrimary:
        return colorScheme.onPrimary;
      case M3FabIconColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3FabIconColor.onSecondary:
        return colorScheme.onSecondary;
      case M3FabIconColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3FabIconColor.onTertiary:
        return colorScheme.onTertiary;
      case M3FabIconColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3FabIconColor.onSurface:
        return colorScheme.onSurface;
      case M3FabIconColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3FabIconColor.primary:
        return colorScheme.primary;
    }
  }
}

/// A Material 3 extended floating action button widget.
class M3ExtendedFloatingActionButton extends StatelessWidget {
  const M3ExtendedFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
  });

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The label to display in the button.
  final Widget label;

  /// The icon to display in the button.
  final Widget? icon;

  /// Text that describes the action that will occur when the FAB is pressed.
  final String? tooltip;

  /// The default foreground color for icons and text within the button.
  final Color? foregroundColor;

  /// The button's background color.
  final Color? backgroundColor;

  /// The color to use for filling the button when the button has input focus.
  final Color? focusColor;

  /// The color to use for filling the button when the button has a pointer hovering over it.
  final Color? hoverColor;

  /// The splash color for the button's InkWell.
  final Color? splashColor;

  /// The tag to apply to the button's Hero widget.
  final Object? heroTag;

  /// The z-coordinate at which to place this button relative to its parent.
  final double? elevation;

  /// The z-coordinate at which to place this button when it has the input focus.
  final double? focusElevation;

  /// The z-coordinate at which to place this button when a pointer is hovering over it.
  final double? hoverElevation;

  /// The z-coordinate at which to place this button while it is being pressed.
  final double? highlightElevation;

  /// The z-coordinate at which to place this button when onPressed is null.
  final double? disabledElevation;

  /// The shape of the button's Material.
  final ShapeBorder? shape;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// True if this widget will be selected as the initial focus.
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final spec = M3FabSpecs.extended;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = backgroundColor ?? 
        _getContainerColor(spec.containerColor, colorScheme);
    
    final effectiveForegroundColor = foregroundColor ?? 
        _getIconColor(spec.iconColor, colorScheme);

    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: label,
      icon: icon != null ? SizedBox.square(
        dimension: spec.iconSize,
        child: icon,
      ) : null,
      tooltip: tooltip,
      foregroundColor: effectiveForegroundColor,
      backgroundColor: effectiveBackgroundColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      heroTag: heroTag,
      elevation: elevation ?? spec.containerElevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      shape: shape ?? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spec.containerShape),
      ),
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
    );
  }

  Color _getContainerColor(M3FabContainerColor containerColor, ColorScheme colorScheme) {
    switch (containerColor) {
      case M3FabContainerColor.primary:
        return colorScheme.primary;
      case M3FabContainerColor.primaryContainer:
        return colorScheme.primaryContainer;
      case M3FabContainerColor.secondary:
        return colorScheme.secondary;
      case M3FabContainerColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case M3FabContainerColor.tertiary:
        return colorScheme.tertiary;
      case M3FabContainerColor.tertiaryContainer:
        return colorScheme.tertiaryContainer;
      case M3FabContainerColor.surface:
        return colorScheme.surface;
      case M3FabContainerColor.surfaceVariant:
        return colorScheme.surfaceContainerHighest;
    }
  }

  Color _getIconColor(M3FabIconColor iconColor, ColorScheme colorScheme) {
    switch (iconColor) {
      case M3FabIconColor.onPrimary:
        return colorScheme.onPrimary;
      case M3FabIconColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3FabIconColor.onSecondary:
        return colorScheme.onSecondary;
      case M3FabIconColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3FabIconColor.onTertiary:
        return colorScheme.onTertiary;
      case M3FabIconColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3FabIconColor.onSurface:
        return colorScheme.onSurface;
      case M3FabIconColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3FabIconColor.primary:
        return colorScheme.primary;
    }
  }
}

/// A Material 3 large floating action button widget.
class M3LargeFloatingActionButton extends StatelessWidget {
  const M3LargeFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
  });

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The widget to display inside the FAB.
  final Widget child;

  /// Text that describes the action that will occur when the FAB is pressed.
  final String? tooltip;

  /// The default foreground color for icons and text within the button.
  final Color? foregroundColor;

  /// The button's background color.
  final Color? backgroundColor;

  /// The color to use for filling the button when the button has input focus.
  final Color? focusColor;

  /// The color to use for filling the button when the button has a pointer hovering over it.
  final Color? hoverColor;

  /// The splash color for the button's InkWell.
  final Color? splashColor;

  /// The tag to apply to the button's Hero widget.
  final Object? heroTag;

  /// The z-coordinate at which to place this button relative to its parent.
  final double? elevation;

  /// The z-coordinate at which to place this button when it has the input focus.
  final double? focusElevation;

  /// The z-coordinate at which to place this button when a pointer is hovering over it.
  final double? hoverElevation;

  /// The z-coordinate at which to place this button while it is being pressed.
  final double? highlightElevation;

  /// The z-coordinate at which to place this button when onPressed is null.
  final double? disabledElevation;

  /// The shape of the button's Material.
  final ShapeBorder? shape;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// True if this widget will be selected as the initial focus.
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final spec = M3FabSpecs.large;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = backgroundColor ?? 
        _getContainerColor(spec.containerColor, colorScheme);
    
    final effectiveForegroundColor = foregroundColor ?? 
        _getIconColor(spec.iconColor, colorScheme);

    return SizedBox.square(
      dimension: spec.containerSize,
      child: FloatingActionButton(
        onPressed: onPressed,
        tooltip: tooltip,
        foregroundColor: effectiveForegroundColor,
        backgroundColor: effectiveBackgroundColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        splashColor: splashColor,
        heroTag: heroTag,
        elevation: elevation ?? spec.containerElevation,
        focusElevation: focusElevation,
        hoverElevation: hoverElevation,
        highlightElevation: highlightElevation,
        disabledElevation: disabledElevation,
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
        ),
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        autofocus: autofocus,
        child: SizedBox.square(
          dimension: spec.iconSize,
          child: child,
        ),
      ),
    );
  }

  Color _getContainerColor(M3FabContainerColor containerColor, ColorScheme colorScheme) {
    switch (containerColor) {
      case M3FabContainerColor.primary:
        return colorScheme.primary;
      case M3FabContainerColor.primaryContainer:
        return colorScheme.primaryContainer;
      case M3FabContainerColor.secondary:
        return colorScheme.secondary;
      case M3FabContainerColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case M3FabContainerColor.tertiary:
        return colorScheme.tertiary;
      case M3FabContainerColor.tertiaryContainer:
        return colorScheme.tertiaryContainer;
      case M3FabContainerColor.surface:
        return colorScheme.surface;
      case M3FabContainerColor.surfaceVariant:
        return colorScheme.surfaceContainerHighest;
    }
  }

  Color _getIconColor(M3FabIconColor iconColor, ColorScheme colorScheme) {
    switch (iconColor) {
      case M3FabIconColor.onPrimary:
        return colorScheme.onPrimary;
      case M3FabIconColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case M3FabIconColor.onSecondary:
        return colorScheme.onSecondary;
      case M3FabIconColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case M3FabIconColor.onTertiary:
        return colorScheme.onTertiary;
      case M3FabIconColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case M3FabIconColor.onSurface:
        return colorScheme.onSurface;
      case M3FabIconColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case M3FabIconColor.primary:
        return colorScheme.primary;
    }
  }
}