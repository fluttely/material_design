/// Material Design 3 Floating Action Button (FAB) specifications with design tokens.
///
/// This file implements the Material Design 3 FAB specifications using
/// the design token hierarchy system for maintainable and scalable
/// FAB styling.
///
/// Token Hierarchy:
/// - Reference tokens: Raw values (dimensions, colors, etc.)
/// - System tokens: Semantic FAB tokens
/// - Component tokens: Specific FAB variant tokens
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/components/floating-action-button/overview
library;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

// ============================================================================
// REFERENCE TOKENS - Raw FAB values
// ============================================================================

/// Reference tokens for FAB dimensions.
class FABDimensionReferenceTokens {
  FABDimensionReferenceTokens._();

  static const small40 = ReferenceToken<double>(
    40,
    'fab.dimension.small40',
    description: 'Small FAB size - 40dp',
  );

  static const regular56 = ReferenceToken<double>(
    56,
    'fab.dimension.regular56',
    description: 'Regular FAB size - 56dp',
  );

  static const large96 = ReferenceToken<double>(
    96,
    'fab.dimension.large96',
    description: 'Large FAB size - 96dp',
  );

  static const iconSmall24 = ReferenceToken<double>(
    24,
    'fab.dimension.iconSmall24',
    description: 'Small and regular FAB icon size - 24dp',
  );

  static const iconLarge36 = ReferenceToken<double>(
    36,
    'fab.dimension.iconLarge36',
    description: 'Large FAB icon size - 36dp',
  );

  static const extendedHeight56 = ReferenceToken<double>(
    56,
    'fab.dimension.extendedHeight56',
    description: 'Extended FAB height - 56dp',
  );

  static const extendedPadding16 = ReferenceToken<double>(
    16,
    'fab.dimension.extendedPadding16',
    description: 'Extended FAB horizontal padding - 16dp',
  );

  static const extendedIconSpacing12 = ReferenceToken<double>(
    12,
    'fab.dimension.extendedIconSpacing12',
    description: 'Extended FAB icon to text spacing - 12dp',
  );

  static const extendedMinWidth80 = ReferenceToken<double>(
    80,
    'fab.dimension.extendedMinWidth80',
    description: 'Extended FAB minimum width - 80dp',
  );
}

/// Reference tokens for FAB corner radius.
class FABRadiusReferenceTokens {
  FABRadiusReferenceTokens._();

  static const small12 = ReferenceToken<double>(
    12,
    'fab.radius.small12',
    description: 'Small FAB corner radius - 12dp',
  );

  static const regular16 = ReferenceToken<double>(
    16,
    'fab.radius.regular16',
    description: 'Regular FAB corner radius - 16dp',
  );

  static const large28 = ReferenceToken<double>(
    28,
    'fab.radius.large28',
    description: 'Large FAB corner radius - 28dp',
  );

  static const extended16 = ReferenceToken<double>(
    16,
    'fab.radius.extended16',
    description: 'Extended FAB corner radius - 16dp',
  );
}

// ============================================================================
// SYSTEM TOKENS - Semantic FAB tokens
// ============================================================================

/// System tokens for FAB dimensions.
class FABDimensionSystemTokens {
  FABDimensionSystemTokens._();

  static final smallSize = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.small40,
    systemName: 'fab.dimension.smallSize',
    description: 'Small FAB size',
  );

  static final regularSize = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.regular56,
    systemName: 'fab.dimension.regularSize',
    description: 'Regular FAB size',
  );

  static final largeSize = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.large96,
    systemName: 'fab.dimension.largeSize',
    description: 'Large FAB size',
  );

  static final smallIconSize = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.iconSmall24,
    systemName: 'fab.dimension.smallIconSize',
    description: 'Small FAB icon size',
  );

  static final regularIconSize = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.iconSmall24,
    systemName: 'fab.dimension.regularIconSize',
    description: 'Regular FAB icon size',
  );

  static final largeIconSize = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.iconLarge36,
    systemName: 'fab.dimension.largeIconSize',
    description: 'Large FAB icon size',
  );

  static final extendedHeight = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.extendedHeight56,
    systemName: 'fab.dimension.extendedHeight',
    description: 'Extended FAB height',
  );

  static final extendedPadding = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.extendedPadding16,
    systemName: 'fab.dimension.extendedPadding',
    description: 'Extended FAB padding',
  );

  static final extendedIconSpacing = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.extendedIconSpacing12,
    systemName: 'fab.dimension.extendedIconSpacing',
    description: 'Extended FAB icon spacing',
  );

  static final extendedMinWidth = SystemToken<double>.fromReference(
    FABDimensionReferenceTokens.extendedMinWidth80,
    systemName: 'fab.dimension.extendedMinWidth',
    description: 'Extended FAB minimum width',
  );
}

/// System tokens for FAB shape.
class FABShapeSystemTokens {
  FABShapeSystemTokens._();

  static final smallCornerRadius = SystemToken<double>.fromReference(
    FABRadiusReferenceTokens.small12,
    systemName: 'fab.shape.smallCornerRadius',
    description: 'Small FAB corner radius',
  );

  static final regularCornerRadius = SystemToken<double>.fromReference(
    FABRadiusReferenceTokens.regular16,
    systemName: 'fab.shape.regularCornerRadius',
    description: 'Regular FAB corner radius',
  );

  static final largeCornerRadius = SystemToken<double>.fromReference(
    FABRadiusReferenceTokens.large28,
    systemName: 'fab.shape.largeCornerRadius',
    description: 'Large FAB corner radius',
  );

  static final extendedCornerRadius = SystemToken<double>.fromReference(
    FABRadiusReferenceTokens.extended16,
    systemName: 'fab.shape.extendedCornerRadius',
    description: 'Extended FAB corner radius',
  );
}

// ============================================================================
// FAB SIZE ENUM
// ============================================================================

/// Material Design 3 FAB size variants.
enum FABSize {
  /// Small FAB - 40x40dp with 24dp icon
  small(
    size: 40,
    iconSize: 24,
    cornerRadius: 12,
  ),

  /// Regular FAB - 56x56dp with 24dp icon
  regular(
    size: 56,
    iconSize: 24,
    cornerRadius: 16,
  ),

  /// Large FAB - 96x96dp with 36dp icon
  large(
    size: 96,
    iconSize: 36,
    cornerRadius: 28,
  );

  const FABSize({
    required this.size,
    required this.iconSize,
    required this.cornerRadius,
  });

  /// The size (width and height) of the FAB.
  final double size;

  /// The size of the icon inside the FAB.
  final double iconSize;

  /// The corner radius of the FAB.
  final double cornerRadius;
}

// ============================================================================
// STATE LAYER SPECIFICATIONS
// ============================================================================

/// State layer opacities for FAB interactions.
class FABStateLayer {
  FABStateLayer._();

  static const double hover = 0.08;
  static const double focus = 0.12;
  static const double pressed = 0.12;
  static const double dragged = 0.16;
  static const double disabled = 0.12;
}

// ============================================================================
// FAB SPECIFICATIONS
// ============================================================================

/// Base specification for all Material Design 3 FABs.
///
/// This class defines the common properties that all FAB variants share,
/// following the Material Design 3 FAB specifications.
@immutable
abstract class FABSpec {
  /// Creates a FAB specification.
  const FABSpec({
    required this.size,
    required this.iconSize,
    required this.shape,
    required this.elevation,
    required this.hoveredElevation,
    required this.focusedElevation,
    required this.pressedElevation,
    required this.disabledElevation,
    required this.animationDuration,
    required this.animationCurve,
    required this.stateLayerOpacity,
  });

  /// The size (width and height) of the FAB.
  final double size;

  /// The size of icons in the FAB.
  final double iconSize;

  /// The shape of the FAB.
  final ShapeBorder shape;

  /// The elevation of the FAB.
  final double elevation;

  /// The elevation when the FAB is hovered.
  final double hoveredElevation;

  /// The elevation when the FAB is focused.
  final double focusedElevation;

  /// The elevation when the FAB is pressed.
  final double pressedElevation;

  /// The elevation when the FAB is disabled.
  final double disabledElevation;

  /// The animation duration for state changes.
  final Duration animationDuration;

  /// The animation curve for state changes.
  final Curve animationCurve;

  /// The state layer opacity map.
  final Map<WidgetState, double> stateLayerOpacity;
}

/// Material Design 3 small FAB specification.
///
/// Small FABs are used when there is a need for a less prominent floating
/// action button. Small FABs have a smaller touch target than regular FABs.
///
/// Example:
/// ```dart
/// Container(
///   width: SmallFABSpec.size,
///   height: SmallFABSpec.size,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(12),
///     boxShadow: [/* elevation shadow */],
///   ),
///   child: Icon(Icons.add, size: SmallFABSpec.iconSize),
/// )
/// ```
class SmallFABSpec extends FABSpec {
  /// Creates a small FAB specification.
  const SmallFABSpec()
      : super(
          size: 40,
          iconSize: 24,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          elevation: 6,
          hoveredElevation: 8,
          focusedElevation: 6,
          pressedElevation: 6,
          disabledElevation: 0,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: FABStateLayer.hover,
            WidgetState.focused: FABStateLayer.focus,
            WidgetState.pressed: FABStateLayer.pressed,
            WidgetState.dragged: FABStateLayer.dragged,
            WidgetState.disabled: FABStateLayer.disabled,
          },
        );
}

/// Material Design 3 regular FAB specification.
///
/// Regular FABs are the standard size for floating action buttons. They are
/// used for the primary action in an app.
///
/// Example:
/// ```dart
/// Container(
///   width: RegularFABSpec.size,
///   height: RegularFABSpec.size,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(16),
///     boxShadow: [/* elevation shadow */],
///   ),
///   child: Icon(Icons.add, size: RegularFABSpec.iconSize),
/// )
/// ```
class RegularFABSpec extends FABSpec {
  /// Creates a regular FAB specification.
  const RegularFABSpec()
      : super(
          size: 56,
          iconSize: 24,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          elevation: 6,
          hoveredElevation: 8,
          focusedElevation: 6,
          pressedElevation: 6,
          disabledElevation: 0,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: FABStateLayer.hover,
            WidgetState.focused: FABStateLayer.focus,
            WidgetState.pressed: FABStateLayer.pressed,
            WidgetState.dragged: FABStateLayer.dragged,
            WidgetState.disabled: FABStateLayer.disabled,
          },
        );
}

/// Material Design 3 large FAB specification.
///
/// Large FABs are used when the layout calls for a more prominent floating
/// action button. Large FABs have a larger touch target than regular FABs.
///
/// Example:
/// ```dart
/// Container(
///   width: LargeFABSpec.size,
///   height: LargeFABSpec.size,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(28),
///     boxShadow: [/* elevation shadow */],
///   ),
///   child: Icon(Icons.add, size: LargeFABSpec.iconSize),
/// )
/// ```
class LargeFABSpec extends FABSpec {
  /// Creates a large FAB specification.
  const LargeFABSpec()
      : super(
          size: 96,
          iconSize: 36,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
          ),
          elevation: 6,
          hoveredElevation: 8,
          focusedElevation: 6,
          pressedElevation: 6,
          disabledElevation: 0,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: FABStateLayer.hover,
            WidgetState.focused: FABStateLayer.focus,
            WidgetState.pressed: FABStateLayer.pressed,
            WidgetState.dragged: FABStateLayer.dragged,
            WidgetState.disabled: FABStateLayer.disabled,
          },
        );
}

/// Material Design 3 extended FAB specification.
///
/// Extended FABs help people take primary actions. They're wider than FABs to
/// accommodate a text label and larger target area.
///
/// Example:
/// ```dart
/// Container(
///   height: ExtendedFABSpec.height,
///   constraints: BoxConstraints(minWidth: ExtendedFABSpec.minWidth),
///   padding: ExtendedFABSpec.padding,
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(16),
///     boxShadow: [/* elevation shadow */],
///   ),
///   child: Row(
///     mainAxisSize: MainAxisSize.min,
///     children: [
///       Icon(Icons.add, size: ExtendedFABSpec.iconSize),
///       SizedBox(width: ExtendedFABSpec.iconSpacing),
///       Text('Extended'),
///     ],
///   ),
/// )
/// ```
class ExtendedFABSpec extends FABSpec {
  /// Creates an extended FAB specification.
  const ExtendedFABSpec()
      : super(
          size: 56, // Height only, width is variable
          iconSize: 24,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          elevation: 6,
          hoveredElevation: 8,
          focusedElevation: 6,
          pressedElevation: 6,
          disabledElevation: 0,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: FABStateLayer.hover,
            WidgetState.focused: FABStateLayer.focus,
            WidgetState.pressed: FABStateLayer.pressed,
            WidgetState.dragged: FABStateLayer.dragged,
            WidgetState.disabled: FABStateLayer.disabled,
          },
        );

  /// The height of the extended FAB.
  static const double height = 56;

  /// The minimum width of the extended FAB.
  static const double minWidth = 80;

  /// The horizontal padding of the extended FAB.
  static const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 16);

  /// The spacing between icon and text.
  static const double iconSpacing = 12;

  /// The text style for extended FAB labels.
  static const TextStyle textStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43, // 20/14
  );
}

// ============================================================================
// COMPONENT TOKENS - FAB variant specific tokens
// ============================================================================

/// Component tokens for small FABs.
class SmallFABComponentTokens {
  SmallFABComponentTokens._();

  static final size = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.smallSize,
    component: 'small-fab',
    tokenName: 'size',
    description: 'Small FAB size',
  );

  static final iconSize = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.smallIconSize,
    component: 'small-fab',
    tokenName: 'iconSize',
    description: 'Small FAB icon size',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    FABShapeSystemTokens.smallCornerRadius,
    component: 'small-fab',
    tokenName: 'cornerRadius',
    description: 'Small FAB corner radius',
  );
}

/// Component tokens for regular FABs.
class RegularFABComponentTokens {
  RegularFABComponentTokens._();

  static final size = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.regularSize,
    component: 'regular-fab',
    tokenName: 'size',
    description: 'Regular FAB size',
  );

  static final iconSize = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.regularIconSize,
    component: 'regular-fab',
    tokenName: 'iconSize',
    description: 'Regular FAB icon size',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    FABShapeSystemTokens.regularCornerRadius,
    component: 'regular-fab',
    tokenName: 'cornerRadius',
    description: 'Regular FAB corner radius',
  );
}

/// Component tokens for large FABs.
class LargeFABComponentTokens {
  LargeFABComponentTokens._();

  static final size = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.largeSize,
    component: 'large-fab',
    tokenName: 'size',
    description: 'Large FAB size',
  );

  static final iconSize = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.largeIconSize,
    component: 'large-fab',
    tokenName: 'iconSize',
    description: 'Large FAB icon size',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    FABShapeSystemTokens.largeCornerRadius,
    component: 'large-fab',
    tokenName: 'cornerRadius',
    description: 'Large FAB corner radius',
  );
}

/// Component tokens for extended FABs.
class ExtendedFABComponentTokens {
  ExtendedFABComponentTokens._();

  static final height = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.extendedHeight,
    component: 'extended-fab',
    tokenName: 'height',
    description: 'Extended FAB height',
  );

  static final minWidth = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.extendedMinWidth,
    component: 'extended-fab',
    tokenName: 'minWidth',
    description: 'Extended FAB minimum width',
  );

  static final padding = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.extendedPadding,
    component: 'extended-fab',
    tokenName: 'padding',
    description: 'Extended FAB padding',
  );

  static final iconSpacing = ComponentToken<double>.fromSystem(
    FABDimensionSystemTokens.extendedIconSpacing,
    component: 'extended-fab',
    tokenName: 'iconSpacing',
    description: 'Extended FAB icon spacing',
  );

  static final cornerRadius = ComponentToken<double>.fromSystem(
    FABShapeSystemTokens.extendedCornerRadius,
    component: 'extended-fab',
    tokenName: 'cornerRadius',
    description: 'Extended FAB corner radius',
  );
}

// ============================================================================
// UTILITIES
// ============================================================================

/// Utility functions for FAB specifications.
class FABSpecUtils {
  FABSpecUtils._();

  /// Get FAB spec by size enum.
  static FABSpec getSpecBySize(FABSize size) {
    switch (size) {
      case FABSize.small:
        return const SmallFABSpec();
      case FABSize.regular:
        return const RegularFABSpec();
      case FABSize.large:
        return const LargeFABSpec();
    }
  }

  /// Calculate extended FAB width based on text content.
  static double calculateExtendedWidth(String text) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: ExtendedFABSpec.textStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final iconAndSpacingWidth =
        const ExtendedFABSpec().iconSize + ExtendedFABSpec.iconSpacing;
    final totalWidth = textPainter.width +
        iconAndSpacingWidth +
        ExtendedFABSpec.padding.horizontal;

    return totalWidth.clamp(ExtendedFABSpec.minWidth, double.infinity);
  }

  /// Calculate extended FAB width without icon.
  static double calculateExtendedWidthNoIcon(String text) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: ExtendedFABSpec.textStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final totalWidth = textPainter.width + ExtendedFABSpec.padding.horizontal;

    return totalWidth.clamp(ExtendedFABSpec.minWidth, double.infinity);
  }

  /// Get state layer color with appropriate opacity.
  static Color getStateLayerColor(
      Color baseColor, WidgetState state, FABSpec spec) {
    final opacity = spec.stateLayerOpacity[state] ?? 0.0;
    return baseColor.withOpacity(opacity);
  }

  /// Get elevation based on state.
  static double getElevation(WidgetState state, FABSpec spec) {
    if (state == WidgetState.disabled) return spec.disabledElevation;
    if (state == WidgetState.pressed) return spec.pressedElevation;
    if (state == WidgetState.hovered) return spec.hoveredElevation;
    if (state == WidgetState.focused) return spec.focusedElevation;
    return spec.elevation;
  }
}
