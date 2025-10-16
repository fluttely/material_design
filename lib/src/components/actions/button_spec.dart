/// Material Design 3 button specifications with design tokens.
///
/// This file implements the Material Design 3 button specifications using
/// the design token hierarchy system for maintainable and scalable
/// button styling.
///
/// Token Hierarchy:
/// - Reference tokens: Raw values (dimensions, colors, etc.)
/// - System tokens: Semantic button tokens
/// - Component tokens: Specific button variant tokens
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/components/buttons/overview
library;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

// ============================================================================
// REFERENCE TOKENS - Raw button values
// ============================================================================

/// Reference tokens for button dimensions.
class ButtonDimensionReferenceTokens {
  ButtonDimensionReferenceTokens._();

  static const height40 = ReferenceToken<double>(
    40,
    'button.dimension.height40',
    description: 'Standard button height - 40dp',
  );

  static const minWidth64 = ReferenceToken<double>(
    64,
    'button.dimension.minWidth64',
    description: 'Minimum button width - 64dp',
  );

  static const paddingHorizontal24 = ReferenceToken<double>(
    24,
    'button.dimension.paddingHorizontal24',
    description: 'Standard horizontal padding - 24dp',
  );

  static const paddingHorizontal16 = ReferenceToken<double>(
    16,
    'button.dimension.paddingHorizontal16',
    description: 'Horizontal padding with icon - 16dp',
  );

  static const paddingVertical10 = ReferenceToken<double>(
    10,
    'button.dimension.paddingVertical10',
    description: 'Standard vertical padding - 10dp',
  );

  static const iconSize18 = ReferenceToken<double>(
    18,
    'button.dimension.iconSize18',
    description: 'Button icon size - 18dp',
  );

  static const iconSpacing8 = ReferenceToken<double>(
    8,
    'button.dimension.iconSpacing8',
    description: 'Spacing between icon and text - 8dp',
  );
}

/// Reference tokens for button corner radius.
class ButtonRadiusReferenceTokens {
  ButtonRadiusReferenceTokens._();

  static const radius20 = ReferenceToken<double>(
    20,
    'button.radius.radius20',
    description: 'Full corner radius for buttons - 20dp',
  );
}

// ============================================================================
// SYSTEM TOKENS - Semantic button tokens
// ============================================================================

/// System tokens for button dimensions.
class ButtonDimensionSystemTokens {
  ButtonDimensionSystemTokens._();

  static final height = SystemToken<double>.fromReference(
    ButtonDimensionReferenceTokens.height40,
    systemName: 'button.dimension.height',
    description: 'Standard button height',
  );

  static final minWidth = SystemToken<double>.fromReference(
    ButtonDimensionReferenceTokens.minWidth64,
    systemName: 'button.dimension.minWidth',
    description: 'Minimum button width',
  );

  static final paddingHorizontal = SystemToken<double>.fromReference(
    ButtonDimensionReferenceTokens.paddingHorizontal24,
    systemName: 'button.dimension.paddingHorizontal',
    description: 'Standard horizontal padding',
  );

  static final paddingHorizontalWithIcon = SystemToken<double>.fromReference(
    ButtonDimensionReferenceTokens.paddingHorizontal16,
    systemName: 'button.dimension.paddingHorizontalWithIcon',
    description: 'Horizontal padding when button has icon',
  );

  static final paddingVertical = SystemToken<double>.fromReference(
    ButtonDimensionReferenceTokens.paddingVertical10,
    systemName: 'button.dimension.paddingVertical',
    description: 'Standard vertical padding',
  );

  static final iconSize = SystemToken<double>.fromReference(
    ButtonDimensionReferenceTokens.iconSize18,
    systemName: 'button.dimension.iconSize',
    description: 'Standard button icon size',
  );

  static final iconSpacing = SystemToken<double>.fromReference(
    ButtonDimensionReferenceTokens.iconSpacing8,
    systemName: 'button.dimension.iconSpacing',
    description: 'Spacing between icon and text',
  );
}

/// System tokens for button shape.
class ButtonShapeSystemTokens {
  ButtonShapeSystemTokens._();

  static final cornerRadius = SystemToken<double>.fromReference(
    ButtonRadiusReferenceTokens.radius20,
    systemName: 'button.shape.cornerRadius',
    description: 'Button corner radius',
  );
}

// ============================================================================
// STATE LAYER SPECIFICATIONS
// ============================================================================

/// State layer opacities for button interactions.
class ButtonStateLayer {
  ButtonStateLayer._();

  static const double hover = 0.08;
  static const double focus = 0.12;
  static const double pressed = 0.12;
  static const double dragged = 0.16;
  static const double disabled = 0.12;
}

// ============================================================================
// BUTTON SPECIFICATIONS
// ============================================================================

/// Base specification for all Material Design 3 buttons.
///
/// This class defines the common properties that all button variants share,
/// following the Material Design 3 button specifications.
@immutable
abstract class ButtonSpec {
  /// Creates a button specification.
  const ButtonSpec({
    required this.height,
    required this.minWidth,
    required this.padding,
    required this.paddingWithIcon,
    required this.shape,
    required this.iconSize,
    required this.iconSpacing,
    required this.textStyle,
    required this.animationDuration,
    required this.animationCurve,
    required this.stateLayerOpacity,
  });

  /// The height of the button.
  final double height;

  /// The minimum width of the button.
  final double minWidth;

  /// The padding around the button content.
  final EdgeInsets padding;

  /// The padding when the button contains an icon.
  final EdgeInsets paddingWithIcon;

  /// The shape of the button.
  final ShapeBorder shape;

  /// The size of icons in the button.
  final double iconSize;

  /// The spacing between icon and text.
  final double iconSpacing;

  /// The text style for button labels.
  final TextStyle textStyle;

  /// The animation duration for state changes.
  final Duration animationDuration;

  /// The animation curve for state changes.
  final Curve animationCurve;

  /// The state layer opacity map.
  final Map<WidgetState, double> stateLayerOpacity;
}

/// Material Design 3 elevated button specification.
///
/// Elevated buttons are essentially filled buttons with a shadow. Use elevated
/// buttons to add dimension to otherwise mostly flat layouts, such as long
/// busy lists of content, or in wide spaces. Avoid using elevated buttons on
/// already-elevated content such as dialogs or cards.
///
/// Example:
/// ```dart
/// Container(
///   height: ElevatedButtonSpec.height,
///   constraints: BoxConstraints(minWidth: ElevatedButtonSpec.minWidth),
///   padding: ElevatedButtonSpec.padding,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(20),
///     boxShadow: [/* elevation shadow */],
///   ),
///   child: Text('Elevated Button'),
/// )
/// ```
class ElevatedButtonSpec extends ButtonSpec {
  /// Creates an elevated button specification.
  const ElevatedButtonSpec()
      : super(
          height: 40,
          minWidth: 64,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          paddingWithIcon:
              const EdgeInsets.only(left: 16, right: 24, top: 10, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          iconSize: 18,
          iconSpacing: 8,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.43, // 20/14
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: ButtonStateLayer.hover,
            WidgetState.focused: ButtonStateLayer.focus,
            WidgetState.pressed: ButtonStateLayer.pressed,
            WidgetState.dragged: ButtonStateLayer.dragged,
            WidgetState.disabled: ButtonStateLayer.disabled,
          },
        );

  /// The elevation of the button.
  static const double elevation = 1;

  /// The elevation when the button is hovered.
  static const double hoveredElevation = 3;

  /// The elevation when the button is focused.
  static const double focusedElevation = 1;

  /// The elevation when the button is pressed.
  static const double pressedElevation = 1;

  /// The elevation when the button is disabled.
  static const double disabledElevation = 0;
}

/// Material Design 3 filled button specification.
///
/// Filled buttons have the most visual impact after the floating action button,
/// and should be used for important, final actions that complete a flow,
/// like Save, Join now, or Confirm.
///
/// Example:
/// ```dart
/// Container(
///   height: FilledButtonSpec.height,
///   constraints: BoxConstraints(minWidth: FilledButtonSpec.minWidth),
///   padding: FilledButtonSpec.padding,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(20),
///     color: colorScheme.primary,
///   ),
///   child: Text('Filled Button'),
/// )
/// ```
class FilledButtonSpec extends ButtonSpec {
  /// Creates a filled button specification.
  const FilledButtonSpec()
      : super(
          height: 40,
          minWidth: 64,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          paddingWithIcon:
              const EdgeInsets.only(left: 16, right: 24, top: 10, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          iconSize: 18,
          iconSpacing: 8,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.43, // 20/14
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: ButtonStateLayer.hover,
            WidgetState.focused: ButtonStateLayer.focus,
            WidgetState.pressed: ButtonStateLayer.pressed,
            WidgetState.dragged: ButtonStateLayer.dragged,
            WidgetState.disabled: ButtonStateLayer.disabled,
          },
        );
}

/// Material Design 3 filled tonal button specification.
///
/// A filled tonal button is an alternative middle ground between filled and
/// outlined buttons. They're useful in contexts where a lower-priority button
/// requires slightly more emphasis than an outline would give, such as "Next"
/// in an onboarding flow. Tonal buttons use the secondary color mapping.
///
/// Example:
/// ```dart
/// Container(
///   height: FilledTonalButtonSpec.height,
///   constraints: BoxConstraints(minWidth: FilledTonalButtonSpec.minWidth),
///   padding: FilledTonalButtonSpec.padding,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(20),
///     color: colorScheme.secondaryContainer,
///   ),
///   child: Text('Filled Tonal Button'),
/// )
/// ```
class FilledTonalButtonSpec extends ButtonSpec {
  /// Creates a filled tonal button specification.
  const FilledTonalButtonSpec()
      : super(
          height: 40,
          minWidth: 64,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          paddingWithIcon:
              const EdgeInsets.only(left: 16, right: 24, top: 10, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          iconSize: 18,
          iconSpacing: 8,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.43, // 20/14
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: ButtonStateLayer.hover,
            WidgetState.focused: ButtonStateLayer.focus,
            WidgetState.pressed: ButtonStateLayer.pressed,
            WidgetState.dragged: ButtonStateLayer.dragged,
            WidgetState.disabled: ButtonStateLayer.disabled,
          },
        );
}

/// Material Design 3 outlined button specification.
///
/// Outlined buttons are medium-emphasis buttons. They contain actions that are
/// important but aren't the primary action in an app. Outlined buttons are also
/// a lower emphasis alternative to filled buttons, or a higher emphasis
/// alternative to text buttons.
///
/// Example:
/// ```dart
/// Container(
///   height: OutlinedButtonSpec.height,
///   constraints: BoxConstraints(minWidth: OutlinedButtonSpec.minWidth),
///   padding: OutlinedButtonSpec.padding,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(20),
///     border: Border.all(color: colorScheme.outline),
///   ),
///   child: Text('Outlined Button'),
/// )
/// ```
class OutlinedButtonSpec extends ButtonSpec {
  /// Creates an outlined button specification.
  const OutlinedButtonSpec()
      : super(
          height: 40,
          minWidth: 64,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          paddingWithIcon:
              const EdgeInsets.only(left: 16, right: 24, top: 10, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(), // Border will use outline color
          ),
          iconSize: 18,
          iconSpacing: 8,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.43, // 20/14
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: ButtonStateLayer.hover,
            WidgetState.focused: ButtonStateLayer.focus,
            WidgetState.pressed: ButtonStateLayer.pressed,
            WidgetState.dragged: ButtonStateLayer.dragged,
            WidgetState.disabled: ButtonStateLayer.disabled,
          },
        );

  /// The border width of the outlined button.
  static const double borderWidth = 1;
}

/// Material Design 3 text button specification.
///
/// Text buttons are typically used for less-pronounced actions, including those
/// located: in dialogs, in cards. In cards, text buttons help maintain an
/// emphasis hierarchy.
///
/// Example:
/// ```dart
/// Container(
///   height: TextButtonSpec.height,
///   constraints: BoxConstraints(minWidth: TextButtonSpec.minWidth),
///   padding: TextButtonSpec.padding,
///   child: Text('Text Button'),
/// )
/// ```
class TextButtonSpec extends ButtonSpec {
  /// Creates a text button specification.
  const TextButtonSpec()
      : super(
          height: 40,
          minWidth: 64,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          paddingWithIcon:
              const EdgeInsets.only(left: 12, right: 16, top: 10, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          iconSize: 18,
          iconSpacing: 8,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.43, // 20/14
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: ButtonStateLayer.hover,
            WidgetState.focused: ButtonStateLayer.focus,
            WidgetState.pressed: ButtonStateLayer.pressed,
            WidgetState.dragged: ButtonStateLayer.dragged,
            WidgetState.disabled: ButtonStateLayer.disabled,
          },
        );
}

// ============================================================================
// COMPONENT TOKENS - Button variant specific tokens
// ============================================================================

/// Component tokens for elevated buttons.
class ElevatedButtonComponentTokens {
  ElevatedButtonComponentTokens._();

  static final height = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.height,
    component: 'elevated-button',
    tokenName: 'height',
    description: 'Elevated button height',
  );

  static final minWidth = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.minWidth,
    component: 'elevated-button',
    tokenName: 'minWidth',
    description: 'Elevated button minimum width',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    ButtonShapeSystemTokens.cornerRadius,
    component: 'elevated-button',
    tokenName: 'cornerRadius',
    description: 'Elevated button corner radius',
  );
}

/// Component tokens for filled buttons.
class FilledButtonComponentTokens {
  FilledButtonComponentTokens._();

  static final height = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.height,
    component: 'filled-button',
    tokenName: 'height',
    description: 'Filled button height',
  );

  static final minWidth = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.minWidth,
    component: 'filled-button',
    tokenName: 'minWidth',
    description: 'Filled button minimum width',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    ButtonShapeSystemTokens.cornerRadius,
    component: 'filled-button',
    tokenName: 'cornerRadius',
    description: 'Filled button corner radius',
  );
}

/// Component tokens for filled tonal buttons.
class FilledTonalButtonComponentTokens {
  FilledTonalButtonComponentTokens._();

  static final height = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.height,
    component: 'filled-tonal-button',
    tokenName: 'height',
    description: 'Filled tonal button height',
  );

  static final minWidth = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.minWidth,
    component: 'filled-tonal-button',
    tokenName: 'minWidth',
    description: 'Filled tonal button minimum width',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    ButtonShapeSystemTokens.cornerRadius,
    component: 'filled-tonal-button',
    tokenName: 'cornerRadius',
    description: 'Filled tonal button corner radius',
  );
}

/// Component tokens for outlined buttons.
class OutlinedButtonComponentTokens {
  OutlinedButtonComponentTokens._();

  static final height = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.height,
    component: 'outlined-button',
    tokenName: 'height',
    description: 'Outlined button height',
  );

  static final minWidth = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.minWidth,
    component: 'outlined-button',
    tokenName: 'minWidth',
    description: 'Outlined button minimum width',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    ButtonShapeSystemTokens.cornerRadius,
    component: 'outlined-button',
    tokenName: 'cornerRadius',
    description: 'Outlined button corner radius',
  );
}

/// Component tokens for text buttons.
class TextButtonComponentTokens {
  TextButtonComponentTokens._();

  static final height = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.height,
    component: 'text-button',
    tokenName: 'height',
    description: 'Text button height',
  );

  static final minWidth = ComponentToken<double>.fromSystem(
    ButtonDimensionSystemTokens.minWidth,
    component: 'text-button',
    tokenName: 'minWidth',
    description: 'Text button minimum width',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    ButtonShapeSystemTokens.cornerRadius,
    component: 'text-button',
    tokenName: 'cornerRadius',
    description: 'Text button corner radius',
  );
}

// ============================================================================
// UTILITIES
// ============================================================================

/// Utility functions for button specifications.
class ButtonSpecUtils {
  ButtonSpecUtils._();

  /// Calculate button width based on text content.
  static double calculateWidth(
      String text, ButtonSpec spec, TextStyle textStyle) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return (textPainter.width + spec.padding.horizontal)
        .clamp(spec.minWidth, double.infinity);
  }

  /// Calculate button width with icon.
  static double calculateWidthWithIcon(
      String text, ButtonSpec spec, TextStyle textStyle) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final iconAndSpacingWidth = spec.iconSize + spec.iconSpacing;
    final totalWidth = textPainter.width +
        iconAndSpacingWidth +
        spec.paddingWithIcon.horizontal;

    return totalWidth.clamp(spec.minWidth, double.infinity);
  }

  /// Get padding based on whether the button has an icon.
  static EdgeInsets getPadding(ButtonSpec spec, {required bool hasIcon}) {
    return hasIcon ? spec.paddingWithIcon : spec.padding;
  }

  /// Get state layer color with appropriate opacity.
  static Color getStateLayerColor(
      Color baseColor, WidgetState state, ButtonSpec spec) {
    final opacity = spec.stateLayerOpacity[state] ?? 0.0;
    return baseColor.withOpacity(opacity);
  }
}
