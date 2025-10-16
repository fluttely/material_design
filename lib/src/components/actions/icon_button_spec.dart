/// Material Design 3 icon button specifications with design tokens.
///
/// This file implements the Material Design 3 icon button specifications using
/// the design token hierarchy system for maintainable and scalable
/// icon button styling.
///
/// Token Hierarchy:
/// - Reference tokens: Raw values (dimensions, colors, etc.)
/// - System tokens: Semantic icon button tokens
/// - Component tokens: Specific icon button variant tokens
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/components/icon-buttons/overview
library;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

// ============================================================================
// REFERENCE TOKENS - Raw icon button values
// ============================================================================

/// Reference tokens for icon button dimensions.
class IconButtonDimensionReferenceTokens {
  IconButtonDimensionReferenceTokens._();

  static const size40 = ReferenceToken<double>(
    40,
    'icon-button.dimension.size40',
    description: 'Small icon button size - 40dp',
  );

  static const size48 = ReferenceToken<double>(
    48,
    'icon-button.dimension.size48',
    description: 'Standard icon button size - 48dp',
  );

  static const size56 = ReferenceToken<double>(
    56,
    'icon-button.dimension.size56',
    description: 'Large icon button size - 56dp',
  );

  static const iconSize20 = ReferenceToken<double>(
    20,
    'icon-button.dimension.iconSize20',
    description: 'Small icon button icon size - 20dp',
  );

  static const iconSize24 = ReferenceToken<double>(
    24,
    'icon-button.dimension.iconSize24',
    description: 'Standard icon button icon size - 24dp',
  );

  static const iconSize28 = ReferenceToken<double>(
    28,
    'icon-button.dimension.iconSize28',
    description: 'Large icon button icon size - 28dp',
  );
}

/// Reference tokens for icon button corner radius.
class IconButtonRadiusReferenceTokens {
  IconButtonRadiusReferenceTokens._();

  static const radius8 = ReferenceToken<double>(
    8,
    'icon-button.radius.radius8',
    description: 'Small icon button corner radius - 8dp',
  );

  static const radius12 = ReferenceToken<double>(
    12,
    'icon-button.radius.radius12',
    description: 'Standard icon button corner radius - 12dp',
  );

  static const radius16 = ReferenceToken<double>(
    16,
    'icon-button.radius.radius16',
    description: 'Large icon button corner radius - 16dp',
  );

  static const radiusFull = ReferenceToken<double>(
    9999,
    'icon-button.radius.radiusFull',
    description: 'Full corner radius - circular',
  );
}

// ============================================================================
// SYSTEM TOKENS - Semantic icon button tokens
// ============================================================================

/// System tokens for icon button dimensions.
class IconButtonDimensionSystemTokens {
  IconButtonDimensionSystemTokens._();

  static final smallSize = SystemToken<double>.fromReference(
    IconButtonDimensionReferenceTokens.size40,
    systemName: 'icon-button.dimension.smallSize',
    description: 'Small icon button size',
  );

  static final standardSize = SystemToken<double>.fromReference(
    IconButtonDimensionReferenceTokens.size48,
    systemName: 'icon-button.dimension.standardSize',
    description: 'Standard icon button size',
  );

  static final largeSize = SystemToken<double>.fromReference(
    IconButtonDimensionReferenceTokens.size56,
    systemName: 'icon-button.dimension.largeSize',
    description: 'Large icon button size',
  );

  static final smallIconSize = SystemToken<double>.fromReference(
    IconButtonDimensionReferenceTokens.iconSize20,
    systemName: 'icon-button.dimension.smallIconSize',
    description: 'Small icon button icon size',
  );

  static final standardIconSize = SystemToken<double>.fromReference(
    IconButtonDimensionReferenceTokens.iconSize24,
    systemName: 'icon-button.dimension.standardIconSize',
    description: 'Standard icon button icon size',
  );

  static final largeIconSize = SystemToken<double>.fromReference(
    IconButtonDimensionReferenceTokens.iconSize28,
    systemName: 'icon-button.dimension.largeIconSize',
    description: 'Large icon button icon size',
  );
}

/// System tokens for icon button shape.
class IconButtonShapeSystemTokens {
  IconButtonShapeSystemTokens._();

  static final smallCornerRadius = SystemToken<double>.fromReference(
    IconButtonRadiusReferenceTokens.radius8,
    systemName: 'icon-button.shape.smallCornerRadius',
    description: 'Small icon button corner radius',
  );

  static final standardCornerRadius = SystemToken<double>.fromReference(
    IconButtonRadiusReferenceTokens.radius12,
    systemName: 'icon-button.shape.standardCornerRadius',
    description: 'Standard icon button corner radius',
  );

  static final largeCornerRadius = SystemToken<double>.fromReference(
    IconButtonRadiusReferenceTokens.radius16,
    systemName: 'icon-button.shape.largeCornerRadius',
    description: 'Large icon button corner radius',
  );

  static final circularCornerRadius = SystemToken<double>.fromReference(
    IconButtonRadiusReferenceTokens.radiusFull,
    systemName: 'icon-button.shape.circularCornerRadius',
    description: 'Circular icon button corner radius',
  );
}

// ============================================================================
// ICON BUTTON SIZE ENUM
// ============================================================================

/// Material Design 3 icon button size variants.
enum IconButtonSize {
  /// Small icon button - 40x40dp with 20dp icon
  small(
    size: 40,
    iconSize: 20,
    cornerRadius: 8,
  ),

  /// Standard icon button - 48x48dp with 24dp icon
  standard(
    size: 48,
    iconSize: 24,
    cornerRadius: 12,
  ),

  /// Large icon button - 56x56dp with 28dp icon
  large(
    size: 56,
    iconSize: 28,
    cornerRadius: 16,
  );

  const IconButtonSize({
    required this.size,
    required this.iconSize,
    required this.cornerRadius,
  });

  /// The size (width and height) of the icon button.
  final double size;

  /// The size of the icon inside the button.
  final double iconSize;

  /// The corner radius of the icon button.
  final double cornerRadius;
}

/// Material Design 3 icon button style variants.
enum IconButtonStyle {
  /// Standard icon button with no fill
  standard,

  /// Filled icon button with background fill
  filled,

  /// Filled tonal icon button with tonal background
  filledTonal,

  /// Outlined icon button with border
  outlined,
}

// ============================================================================
// STATE LAYER SPECIFICATIONS
// ============================================================================

/// State layer opacities for icon button interactions.
class IconButtonStateLayer {
  IconButtonStateLayer._();

  static const double hover = 0.08;
  static const double focus = 0.12;
  static const double pressed = 0.12;
  static const double dragged = 0.16;
  static const double disabled = 0.12;
}

// ============================================================================
// ICON BUTTON SPECIFICATIONS
// ============================================================================

/// Base specification for all Material Design 3 icon buttons.
///
/// This class defines the common properties that all icon button variants share,
/// following the Material Design 3 icon button specifications.
@immutable
abstract class IconButtonSpec {
  /// Creates an icon button specification.
  const IconButtonSpec({
    required this.size,
    required this.iconSize,
    required this.shape,
    required this.animationDuration,
    required this.animationCurve,
    required this.stateLayerOpacity,
    this.toggleable = false,
  });

  /// The size (width and height) of the icon button.
  final double size;

  /// The size of icons in the button.
  final double iconSize;

  /// The shape of the icon button.
  final ShapeBorder shape;

  /// The animation duration for state changes.
  final Duration animationDuration;

  /// The animation curve for state changes.
  final Curve animationCurve;

  /// The state layer opacity map.
  final Map<WidgetState, double> stateLayerOpacity;

  /// Whether this icon button can be toggled.
  final bool toggleable;
}

/// Material Design 3 standard icon button specification.
///
/// Standard icon buttons are the most basic icon buttons. They have no
/// background fill or border, and are typically used for low emphasis actions.
///
/// Example:
/// ```dart
/// Container(
///   width: StandardIconButtonSpec.size,
///   height: StandardIconButtonSpec.size,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(12),
///   ),
///   child: Icon(Icons.favorite, size: StandardIconButtonSpec.iconSize),
/// )
/// ```
class StandardIconButtonSpec extends IconButtonSpec {
  /// Creates a standard icon button specification.
  const StandardIconButtonSpec({
    super.toggleable = false,
  }) : super(
          size: 48,
          iconSize: 24,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: IconButtonStateLayer.hover,
            WidgetState.focused: IconButtonStateLayer.focus,
            WidgetState.pressed: IconButtonStateLayer.pressed,
            WidgetState.dragged: IconButtonStateLayer.dragged,
            WidgetState.disabled: IconButtonStateLayer.disabled,
          },
        );
}

/// Material Design 3 filled icon button specification.
///
/// Filled icon buttons have the highest emphasis of all icon buttons. They're
/// distinguished by their use of elevation and fill color. Use filled icon
/// buttons for high-emphasis actions.
///
/// Example:
/// ```dart
/// Container(
///   width: FilledIconButtonSpec.size,
///   height: FilledIconButtonSpec.size,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(12),
///     color: colorScheme.primary,
///   ),
///   child: Icon(Icons.favorite, size: FilledIconButtonSpec.iconSize),
/// )
/// ```
class FilledIconButtonSpec extends IconButtonSpec {
  /// Creates a filled icon button specification.
  const FilledIconButtonSpec({
    super.toggleable = false,
  }) : super(
          size: 48,
          iconSize: 24,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: IconButtonStateLayer.hover,
            WidgetState.focused: IconButtonStateLayer.focus,
            WidgetState.pressed: IconButtonStateLayer.pressed,
            WidgetState.dragged: IconButtonStateLayer.dragged,
            WidgetState.disabled: IconButtonStateLayer.disabled,
          },
        );
}

/// Material Design 3 filled tonal icon button specification.
///
/// Filled tonal icon buttons are a middle ground between filled and outlined
/// icon buttons. They're useful for actions that require more emphasis than
/// outlined icon buttons but less than filled icon buttons.
///
/// Example:
/// ```dart
/// Container(
///   width: FilledTonalIconButtonSpec.size,
///   height: FilledTonalIconButtonSpec.size,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(12),
///     color: colorScheme.secondaryContainer,
///   ),
///   child: Icon(Icons.favorite, size: FilledTonalIconButtonSpec.iconSize),
/// )
/// ```
class FilledTonalIconButtonSpec extends IconButtonSpec {
  /// Creates a filled tonal icon button specification.
  const FilledTonalIconButtonSpec({
    super.toggleable = false,
  }) : super(
          size: 48,
          iconSize: 24,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: IconButtonStateLayer.hover,
            WidgetState.focused: IconButtonStateLayer.focus,
            WidgetState.pressed: IconButtonStateLayer.pressed,
            WidgetState.dragged: IconButtonStateLayer.dragged,
            WidgetState.disabled: IconButtonStateLayer.disabled,
          },
        );
}

/// Material Design 3 outlined icon button specification.
///
/// Outlined icon buttons are medium-emphasis icon buttons. They contain actions
/// that are important but aren't the primary action in an app.
///
/// Example:
/// ```dart
/// Container(
///   width: OutlinedIconButtonSpec.size,
///   height: OutlinedIconButtonSpec.size,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(12),
///     border: Border.all(color: colorScheme.outline),
///   ),
///   child: Icon(Icons.favorite, size: OutlinedIconButtonSpec.iconSize),
/// )
/// ```
class OutlinedIconButtonSpec extends IconButtonSpec {
  /// Creates an outlined icon button specification.
  const OutlinedIconButtonSpec({
    super.toggleable = false,
  }) : super(
          size: 48,
          iconSize: 24,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(), // Border will use outline color
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: IconButtonStateLayer.hover,
            WidgetState.focused: IconButtonStateLayer.focus,
            WidgetState.pressed: IconButtonStateLayer.pressed,
            WidgetState.dragged: IconButtonStateLayer.dragged,
            WidgetState.disabled: IconButtonStateLayer.disabled,
          },
        );

  /// The border width of the outlined icon button.
  static const double borderWidth = 1;
}

// ============================================================================
// SIZED ICON BUTTON SPECIFICATIONS
// ============================================================================

/// Material Design 3 small icon button specification.
///
/// Small icon buttons are used when space is limited or for lower emphasis actions.
///
/// Example:
/// ```dart
/// Container(
///   width: SmallIconButtonSpec.size,
///   height: SmallIconButtonSpec.size,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(8),
///   ),
///   child: Icon(Icons.favorite, size: SmallIconButtonSpec.iconSize),
/// )
/// ```
class SmallIconButtonSpec extends IconButtonSpec {
  /// Creates a small icon button specification.
  const SmallIconButtonSpec({
    IconButtonStyle style = IconButtonStyle.standard,
    super.toggleable = false,
  })  : _style = style,
        super(
          size: 40,
          iconSize: 20,
          shape: style == IconButtonStyle.outlined
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  side: BorderSide(),
                )
              : const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: IconButtonStateLayer.hover,
            WidgetState.focused: IconButtonStateLayer.focus,
            WidgetState.pressed: IconButtonStateLayer.pressed,
            WidgetState.dragged: IconButtonStateLayer.dragged,
            WidgetState.disabled: IconButtonStateLayer.disabled,
          },
        );

  final IconButtonStyle _style;

  /// The style of this icon button.
  IconButtonStyle get style => _style;
}

/// Material Design 3 large icon button specification.
///
/// Large icon buttons are used for high emphasis actions or when more prominent
/// touch targets are needed.
///
/// Example:
/// ```dart
/// Container(
///   width: LargeIconButtonSpec.size,
///   height: LargeIconButtonSpec.size,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(16),
///   ),
///   child: Icon(Icons.favorite, size: LargeIconButtonSpec.iconSize),
/// )
/// ```
class LargeIconButtonSpec extends IconButtonSpec {
  /// Creates a large icon button specification.
  const LargeIconButtonSpec({
    IconButtonStyle style = IconButtonStyle.standard,
    super.toggleable = false,
  })  : _style = style,
        super(
          size: 56,
          iconSize: 28,
          shape: style == IconButtonStyle.outlined
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  side: BorderSide(),
                )
              : const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: IconButtonStateLayer.hover,
            WidgetState.focused: IconButtonStateLayer.focus,
            WidgetState.pressed: IconButtonStateLayer.pressed,
            WidgetState.dragged: IconButtonStateLayer.dragged,
            WidgetState.disabled: IconButtonStateLayer.disabled,
          },
        );

  final IconButtonStyle _style;

  /// The style of this icon button.
  IconButtonStyle get style => _style;
}

// ============================================================================
// COMPONENT TOKENS - Icon button variant specific tokens
// ============================================================================

/// Component tokens for standard icon buttons.
class StandardIconButtonComponentTokens {
  StandardIconButtonComponentTokens._();

  static final size = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.standardSize,
    component: 'standard-icon-button',
    tokenName: 'size',
    description: 'Standard icon button size',
  );

  static final iconSize = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.standardIconSize,
    component: 'standard-icon-button',
    tokenName: 'iconSize',
    description: 'Standard icon button icon size',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    IconButtonShapeSystemTokens.standardCornerRadius,
    component: 'standard-icon-button',
    tokenName: 'cornerRadius',
    description: 'Standard icon button corner radius',
  );
}

/// Component tokens for filled icon buttons.
class FilledIconButtonComponentTokens {
  FilledIconButtonComponentTokens._();

  static final size = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.standardSize,
    component: 'filled-icon-button',
    tokenName: 'size',
    description: 'Filled icon button size',
  );

  static final iconSize = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.standardIconSize,
    component: 'filled-icon-button',
    tokenName: 'iconSize',
    description: 'Filled icon button icon size',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    IconButtonShapeSystemTokens.standardCornerRadius,
    component: 'filled-icon-button',
    tokenName: 'cornerRadius',
    description: 'Filled icon button corner radius',
  );
}

/// Component tokens for filled tonal icon buttons.
class FilledTonalIconButtonComponentTokens {
  FilledTonalIconButtonComponentTokens._();

  static final size = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.standardSize,
    component: 'filled-tonal-icon-button',
    tokenName: 'size',
    description: 'Filled tonal icon button size',
  );

  static final iconSize = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.standardIconSize,
    component: 'filled-tonal-icon-button',
    tokenName: 'iconSize',
    description: 'Filled tonal icon button icon size',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    IconButtonShapeSystemTokens.standardCornerRadius,
    component: 'filled-tonal-icon-button',
    tokenName: 'cornerRadius',
    description: 'Filled tonal icon button corner radius',
  );
}

/// Component tokens for outlined icon buttons.
class OutlinedIconButtonComponentTokens {
  OutlinedIconButtonComponentTokens._();

  static final size = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.standardSize,
    component: 'outlined-icon-button',
    tokenName: 'size',
    description: 'Outlined icon button size',
  );

  static final iconSize = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.standardIconSize,
    component: 'outlined-icon-button',
    tokenName: 'iconSize',
    description: 'Outlined icon button icon size',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    IconButtonShapeSystemTokens.standardCornerRadius,
    component: 'outlined-icon-button',
    tokenName: 'cornerRadius',
    description: 'Outlined icon button corner radius',
  );
}

/// Component tokens for small icon buttons.
class SmallIconButtonComponentTokens {
  SmallIconButtonComponentTokens._();

  static final size = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.smallSize,
    component: 'small-icon-button',
    tokenName: 'size',
    description: 'Small icon button size',
  );

  static final iconSize = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.smallIconSize,
    component: 'small-icon-button',
    tokenName: 'iconSize',
    description: 'Small icon button icon size',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    IconButtonShapeSystemTokens.smallCornerRadius,
    component: 'small-icon-button',
    tokenName: 'cornerRadius',
    description: 'Small icon button corner radius',
  );
}

/// Component tokens for large icon buttons.
class LargeIconButtonComponentTokens {
  LargeIconButtonComponentTokens._();

  static final size = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.largeSize,
    component: 'large-icon-button',
    tokenName: 'size',
    description: 'Large icon button size',
  );

  static final iconSize = ComponentToken<double>.fromSystem(
    IconButtonDimensionSystemTokens.largeIconSize,
    component: 'large-icon-button',
    tokenName: 'iconSize',
    description: 'Large icon button icon size',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    IconButtonShapeSystemTokens.largeCornerRadius,
    component: 'large-icon-button',
    tokenName: 'cornerRadius',
    description: 'Large icon button corner radius',
  );
}

// ============================================================================
// UTILITIES
// ============================================================================

/// Utility functions for icon button specifications.
class IconButtonSpecUtils {
  IconButtonSpecUtils._();

  /// Get icon button spec by size and style.
  static IconButtonSpec getSpec({
    IconButtonSize size = IconButtonSize.standard,
    IconButtonStyle style = IconButtonStyle.standard,
    bool toggleable = false,
  }) {
    switch (size) {
      case IconButtonSize.small:
        return SmallIconButtonSpec(style: style, toggleable: toggleable);
      case IconButtonSize.standard:
        switch (style) {
          case IconButtonStyle.standard:
            return StandardIconButtonSpec(toggleable: toggleable);
          case IconButtonStyle.filled:
            return FilledIconButtonSpec(toggleable: toggleable);
          case IconButtonStyle.filledTonal:
            return FilledTonalIconButtonSpec(toggleable: toggleable);
          case IconButtonStyle.outlined:
            return OutlinedIconButtonSpec(toggleable: toggleable);
        }
      case IconButtonSize.large:
        return LargeIconButtonSpec(style: style, toggleable: toggleable);
    }
  }

  /// Get state layer color with appropriate opacity.
  static Color getStateLayerColor(
      Color baseColor, WidgetState state, IconButtonSpec spec) {
    final opacity = spec.stateLayerOpacity[state] ?? 0.0;
    return baseColor.withOpacity(opacity);
  }

  /// Check if icon button should show selected state.
  static bool isSelected(Set<WidgetState> states) {
    return states.contains(WidgetState.selected);
  }

  /// Check if icon button is toggleable.
  static bool isToggleable(IconButtonSpec spec) {
    return spec.toggleable;
  }
}
