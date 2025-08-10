/// Material 3 Elevated Button widget implementation.
///
/// Reference: https://m3.material.io/components/buttons/overview
library;

import 'package:flutter/material.dart';
import '../../../design/comp/comp.dart';

/// A Material 3 elevated button widget.
/// 
/// Elevated buttons are essentially filled tonal buttons with a shadow. 
/// They're used for important actions that benefit from being distinguished 
/// from other content with an elevation.
class M3ElevatedButton extends StatelessWidget {
  const M3ElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.style,
  });

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The widget to display inside the button.
  final Widget child;

  /// True if this widget will be selected as the initial focus.
  final bool autofocus;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Customizes this button's appearance.
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final spec = M3ButtonSpecs.elevatedButton;
    
    final defaultStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
          }
          return Theme.of(context).colorScheme.surface;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
          }
          return Theme.of(context).colorScheme.primary;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).colorScheme.primary.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return Theme.of(context).colorScheme.primary.withOpacity(0.08);
          }
          if (states.contains(MaterialState.focused)) {
            return Theme.of(context).colorScheme.primary.withOpacity(0.12);
          }
          return null;
        },
      ),
      elevation: MaterialStateProperty.resolveWith<double?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return 0;
          }
          if (states.contains(MaterialState.pressed)) {
            return spec.containerElevation;
          }
          if (states.contains(MaterialState.hovered)) {
            return spec.containerElevation + 1;
          }
          return spec.containerElevation;
        },
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          horizontal: spec.paddingHorizontal,
          vertical: spec.paddingVertical,
        ),
      ),
      minimumSize: MaterialStateProperty.all<Size>(
        Size(spec.minWidth, spec.containerHeight),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spec.containerShape),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          fontSize: spec.labelTextStyle.fontSize,
          fontWeight: spec.labelTextStyle.fontWeight,
          letterSpacing: spec.labelTextStyle.letterSpacing,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      style: style ?? defaultStyle,
      child: child,
    );
  }
}

/// A Material 3 elevated button with an icon.
class M3ElevatedButton_Icon extends StatelessWidget {
  const M3ElevatedButton_Icon({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.onLongPress,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.style,
  });

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The icon to display in the button.
  final Widget icon;

  /// The label to display in the button.
  final Widget label;

  /// True if this widget will be selected as the initial focus.
  final bool autofocus;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Customizes this button's appearance.
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final spec = M3ButtonSpecs.elevatedButton;
    
    return M3ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: spec.iconSize,
            child: icon,
          ),
          SizedBox(width: spec.spacingBetweenElements),
          label,
        ],
      ),
    );
  }
}