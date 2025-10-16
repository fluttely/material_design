/// Material Design 3 card specifications with design tokens.
///
/// This file implements the Material Design 3 card specifications using
/// the design token hierarchy system for maintainable and scalable
/// card styling.
///
/// Token Hierarchy:
/// - Reference tokens: Raw values (dimensions, colors, etc.)
/// - System tokens: Semantic card tokens
/// - Component tokens: Specific card variant tokens
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/components/cards/overview
library;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

// ============================================================================
// REFERENCE TOKENS - Raw card values
// ============================================================================

/// Reference tokens for card dimensions.
class CardDimensionReferenceTokens {
  CardDimensionReferenceTokens._();

  static const cornerRadius12 = ReferenceToken<double>(
    12,
    'card.dimension.cornerRadius12',
    description: 'Standard card corner radius - 12dp',
  );

  static const paddingContent16 = ReferenceToken<double>(
    16,
    'card.dimension.paddingContent16',
    description: 'Standard card content padding - 16dp',
  );

  static const paddingContent24 = ReferenceToken<double>(
    24,
    'card.dimension.paddingContent24',
    description: 'Large card content padding - 24dp',
  );

  static const paddingCompact12 = ReferenceToken<double>(
    12,
    'card.dimension.paddingCompact12',
    description: 'Compact card content padding - 12dp',
  );

  static const minHeight80 = ReferenceToken<double>(
    80,
    'card.dimension.minHeight80',
    description: 'Minimum card height for adequate touch target',
  );

  static const outlineBorderWidth1 = ReferenceToken<double>(
    1,
    'card.dimension.outlineBorderWidth1',
    description: 'Outlined card border width - 1dp',
  );
}

/// Reference tokens for card elevation values.
class CardElevationReferenceTokens {
  CardElevationReferenceTokens._();

  static const elevated1 = ReferenceToken<double>(
    1,
    'card.elevation.elevated1',
    description: 'Elevated card resting elevation - 1dp',
  );

  static const elevatedHover3 = ReferenceToken<double>(
    3,
    'card.elevation.elevatedHover3',
    description: 'Elevated card hover elevation - 3dp',
  );

  static const elevatedDragged8 = ReferenceToken<double>(
    8,
    'card.elevation.elevatedDragged8',
    description: 'Elevated card dragged elevation - 8dp',
  );

  static const filled0 = ReferenceToken<double>(
    0,
    'card.elevation.filled0',
    description: 'Filled card elevation - 0dp',
  );

  static const outlined0 = ReferenceToken<double>(
    0,
    'card.elevation.outlined0',
    description: 'Outlined card elevation - 0dp',
  );
}

// ============================================================================
// SYSTEM TOKENS - Semantic card tokens
// ============================================================================

/// System tokens for card dimensions.
class CardDimensionSystemTokens {
  CardDimensionSystemTokens._();

  static final cornerRadius = SystemToken<double>.fromReference(
    CardDimensionReferenceTokens.cornerRadius12,
    systemName: 'card.dimension.cornerRadius',
    description: 'Card corner radius',
  );

  static final paddingContent = SystemToken<double>.fromReference(
    CardDimensionReferenceTokens.paddingContent16,
    systemName: 'card.dimension.paddingContent',
    description: 'Standard card content padding',
  );

  static final paddingContentLarge = SystemToken<double>.fromReference(
    CardDimensionReferenceTokens.paddingContent24,
    systemName: 'card.dimension.paddingContentLarge',
    description: 'Large card content padding',
  );

  static final paddingContentCompact = SystemToken<double>.fromReference(
    CardDimensionReferenceTokens.paddingCompact12,
    systemName: 'card.dimension.paddingContentCompact',
    description: 'Compact card content padding',
  );

  static final minHeight = SystemToken<double>.fromReference(
    CardDimensionReferenceTokens.minHeight80,
    systemName: 'card.dimension.minHeight',
    description: 'Minimum card height',
  );

  static final outlineBorderWidth = SystemToken<double>.fromReference(
    CardDimensionReferenceTokens.outlineBorderWidth1,
    systemName: 'card.dimension.outlineBorderWidth',
    description: 'Outlined card border width',
  );
}

/// System tokens for card elevation.
class CardElevationSystemTokens {
  CardElevationSystemTokens._();

  static final elevatedResting = SystemToken<double>.fromReference(
    CardElevationReferenceTokens.elevated1,
    systemName: 'card.elevation.elevatedResting',
    description: 'Elevated card resting elevation',
  );

  static final elevatedHover = SystemToken<double>.fromReference(
    CardElevationReferenceTokens.elevatedHover3,
    systemName: 'card.elevation.elevatedHover',
    description: 'Elevated card hover elevation',
  );

  static final elevatedDragged = SystemToken<double>.fromReference(
    CardElevationReferenceTokens.elevatedDragged8,
    systemName: 'card.elevation.elevatedDragged',
    description: 'Elevated card dragged elevation',
  );

  static final filledElevation = SystemToken<double>.fromReference(
    CardElevationReferenceTokens.filled0,
    systemName: 'card.elevation.filledElevation',
    description: 'Filled card elevation',
  );

  static final outlinedElevation = SystemToken<double>.fromReference(
    CardElevationReferenceTokens.outlined0,
    systemName: 'card.elevation.outlinedElevation',
    description: 'Outlined card elevation',
  );
}

// ============================================================================
// CARD VARIANT ENUM
// ============================================================================

/// Material Design 3 card variants.
enum CardVariant {
  /// Elevated card with shadow and elevation
  elevated(
    elevation: 1,
    hoverElevation: 3,
    draggedElevation: 8,
    hasBorder: false,
    hasBackground: false,
  ),

  /// Filled card with background color and no elevation
  filled(
    elevation: 0,
    hoverElevation: 0,
    draggedElevation: 0,
    hasBorder: false,
    hasBackground: true,
  ),

  /// Outlined card with border and no elevation
  outlined(
    elevation: 0,
    hoverElevation: 0,
    draggedElevation: 0,
    hasBorder: true,
    hasBackground: false,
  );

  const CardVariant({
    required this.elevation,
    required this.hoverElevation,
    required this.draggedElevation,
    required this.hasBorder,
    required this.hasBackground,
  });

  /// The resting elevation of the card.
  final double elevation;

  /// The elevation when the card is hovered.
  final double hoverElevation;

  /// The elevation when the card is being dragged.
  final double draggedElevation;

  /// Whether this card variant has a border.
  final bool hasBorder;

  /// Whether this card variant has a background color.
  final bool hasBackground;
}

// ============================================================================
// CARD LAYOUT ENUM
// ============================================================================

/// Material Design 3 card layout types.
enum CardLayout {
  /// Standard card with content padding
  standard,

  /// Compact card with reduced padding
  compact,

  /// Large card with increased padding
  large,

  /// Media card with image and content sections
  media,

  /// Action card with prominent action buttons
  action,
}

// ============================================================================
// STATE LAYER SPECIFICATIONS
// ============================================================================

/// State layer opacities for card interactions.
class CardStateLayer {
  CardStateLayer._();

  static const double hover = 0.08;
  static const double focus = 0.12;
  static const double pressed = 0.12;
  static const double dragged = 0.16;
  static const double disabled = 0.12;
}

// ============================================================================
// CARD SPECIFICATIONS
// ============================================================================

/// Base specification for all Material Design 3 cards.
///
/// This class defines the common properties that all card variants share,
/// following the Material Design 3 card specifications.
@immutable
abstract class CardSpec {
  /// Creates a card specification.
  const CardSpec({
    required this.variant,
    required this.layout,
    required this.cornerRadius,
    required this.padding,
    required this.minHeight,
    required this.elevation,
    required this.hoverElevation,
    required this.draggedElevation,
    required this.shape,
    required this.animationDuration,
    required this.animationCurve,
    required this.stateLayerOpacity,
  });

  /// The variant of this card.
  final CardVariant variant;

  /// The layout type of this card.
  final CardLayout layout;

  /// The corner radius of the card.
  final double cornerRadius;

  /// The padding around the card content.
  final EdgeInsets padding;

  /// The minimum height of the card.
  final double minHeight;

  /// The resting elevation of the card.
  final double elevation;

  /// The elevation when the card is hovered.
  final double hoverElevation;

  /// The elevation when the card is being dragged.
  final double draggedElevation;

  /// The shape of the card.
  final ShapeBorder shape;

  /// The animation duration for state changes.
  final Duration animationDuration;

  /// The animation curve for state changes.
  final Curve animationCurve;

  /// The state layer opacity map.
  final Map<WidgetState, double> stateLayerOpacity;
}

/// Material Design 3 elevated card specification.
///
/// Elevated cards use elevation to separate content from the background.
/// They are the default card type and work well in most contexts.
///
/// Example:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(ElevatedCardSpec.cornerRadius),
///     boxShadow: [/* elevation shadows */],
///   ),
///   padding: ElevatedCardSpec.padding,
///   constraints: BoxConstraints(minHeight: ElevatedCardSpec.minHeight),
///   child: content,
/// )
/// ```
class ElevatedCardSpec extends CardSpec {
  /// Creates an elevated card specification.
  const ElevatedCardSpec({
    super.layout = CardLayout.standard,
  }) : super(
          variant: CardVariant.elevated,
          cornerRadius: 12,
          padding: layout == CardLayout.compact
              ? const EdgeInsets.all(12)
              : layout == CardLayout.large
                  ? const EdgeInsets.all(24)
                  : const EdgeInsets.all(16),
          minHeight: 80,
          elevation: 1,
          hoverElevation: 3,
          draggedElevation: 8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: CardStateLayer.hover,
            WidgetState.focused: CardStateLayer.focus,
            WidgetState.pressed: CardStateLayer.pressed,
            WidgetState.dragged: CardStateLayer.dragged,
            WidgetState.disabled: CardStateLayer.disabled,
          },
        );
}

/// Material Design 3 filled card specification.
///
/// Filled cards use a fill color to separate content from the background.
/// They provide less emphasis than elevated cards and work well for
/// supplementary content.
///
/// Example:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(FilledCardSpec.cornerRadius),
///     color: colorScheme.surfaceVariant,
///   ),
///   padding: FilledCardSpec.padding,
///   constraints: BoxConstraints(minHeight: FilledCardSpec.minHeight),
///   child: content,
/// )
/// ```
class FilledCardSpec extends CardSpec {
  /// Creates a filled card specification.
  const FilledCardSpec({
    super.layout = CardLayout.standard,
  }) : super(
          variant: CardVariant.filled,
          cornerRadius: 12,
          padding: layout == CardLayout.compact
              ? const EdgeInsets.all(12)
              : layout == CardLayout.large
                  ? const EdgeInsets.all(24)
                  : const EdgeInsets.all(16),
          minHeight: 80,
          elevation: 0,
          hoverElevation: 0,
          draggedElevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: CardStateLayer.hover,
            WidgetState.focused: CardStateLayer.focus,
            WidgetState.pressed: CardStateLayer.pressed,
            WidgetState.dragged: CardStateLayer.dragged,
            WidgetState.disabled: CardStateLayer.disabled,
          },
        );
}

/// Material Design 3 outlined card specification.
///
/// Outlined cards use a border to separate content from the background.
/// They provide minimal emphasis and work well for secondary content.
///
/// Example:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(OutlinedCardSpec.cornerRadius),
///     border: Border.all(
///       color: colorScheme.outline,
///       width: OutlinedCardSpec.borderWidth,
///     ),
///   ),
///   padding: OutlinedCardSpec.padding,
///   constraints: BoxConstraints(minHeight: OutlinedCardSpec.minHeight),
///   child: content,
/// )
/// ```
class OutlinedCardSpec extends CardSpec {
  /// Creates an outlined card specification.
  const OutlinedCardSpec({
    super.layout = CardLayout.standard,
  }) : super(
          variant: CardVariant.outlined,
          cornerRadius: 12,
          padding: layout == CardLayout.compact
              ? const EdgeInsets.all(12)
              : layout == CardLayout.large
                  ? const EdgeInsets.all(24)
                  : const EdgeInsets.all(16),
          minHeight: 80,
          elevation: 0,
          hoverElevation: 0,
          draggedElevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(), // Border will use outline color
          ),
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          stateLayerOpacity: const {
            WidgetState.hovered: CardStateLayer.hover,
            WidgetState.focused: CardStateLayer.focus,
            WidgetState.pressed: CardStateLayer.pressed,
            WidgetState.dragged: CardStateLayer.dragged,
            WidgetState.disabled: CardStateLayer.disabled,
          },
        );

  /// The border width of the outlined card.
  static const double borderWidth = 1;
}

// ============================================================================
// COMPONENT TOKENS - Card variant specific tokens
// ============================================================================

/// Component tokens for elevated cards.
class ElevatedCardComponentTokens {
  ElevatedCardComponentTokens._();

  static final cornerRadius = ComponentToken<double>.fromSystem(
    CardDimensionSystemTokens.cornerRadius,
    component: 'elevated-card',
    tokenName: 'cornerRadius',
    description: 'Elevated card corner radius',
  );

  static final padding = ComponentToken<double>.fromSystem(
    CardDimensionSystemTokens.paddingContent,
    component: 'elevated-card',
    tokenName: 'padding',
    description: 'Elevated card content padding',
  );

  static final elevation = ComponentToken<double>.fromSystem(
    CardElevationSystemTokens.elevatedResting,
    component: 'elevated-card',
    tokenName: 'elevation',
    description: 'Elevated card resting elevation',
  );

  static final hoverElevation = ComponentToken<double>.fromSystem(
    CardElevationSystemTokens.elevatedHover,
    component: 'elevated-card',
    tokenName: 'hoverElevation',
    description: 'Elevated card hover elevation',
  );

  static final draggedElevation = ComponentToken<double>.fromSystem(
    CardElevationSystemTokens.elevatedDragged,
    component: 'elevated-card',
    tokenName: 'draggedElevation',
    description: 'Elevated card dragged elevation',
  );
}

/// Component tokens for filled cards.
class FilledCardComponentTokens {
  FilledCardComponentTokens._();

  static final cornerRadius = ComponentToken<double>.fromSystem(
    CardDimensionSystemTokens.cornerRadius,
    component: 'filled-card',
    tokenName: 'cornerRadius',
    description: 'Filled card corner radius',
  );

  static final padding = ComponentToken<double>.fromSystem(
    CardDimensionSystemTokens.paddingContent,
    component: 'filled-card',
    tokenName: 'padding',
    description: 'Filled card content padding',
  );

  static final elevation = ComponentToken<double>.fromSystem(
    CardElevationSystemTokens.filledElevation,
    component: 'filled-card',
    tokenName: 'elevation',
    description: 'Filled card elevation',
  );
}

/// Component tokens for outlined cards.
class OutlinedCardComponentTokens {
  OutlinedCardComponentTokens._();

  static final cornerRadius = ComponentToken<double>.fromSystem(
    CardDimensionSystemTokens.cornerRadius,
    component: 'outlined-card',
    tokenName: 'cornerRadius',
    description: 'Outlined card corner radius',
  );

  static final padding = ComponentToken<double>.fromSystem(
    CardDimensionSystemTokens.paddingContent,
    component: 'outlined-card',
    tokenName: 'padding',
    description: 'Outlined card content padding',
  );

  static final elevation = ComponentToken<double>.fromSystem(
    CardElevationSystemTokens.outlinedElevation,
    component: 'outlined-card',
    tokenName: 'elevation',
    description: 'Outlined card elevation',
  );

  static final borderWidth = ComponentToken<double>.fromSystem(
    CardDimensionSystemTokens.outlineBorderWidth,
    component: 'outlined-card',
    tokenName: 'borderWidth',
    description: 'Outlined card border width',
  );
}

// ============================================================================
// CARD LAYOUT HELPERS
// ============================================================================

/// Helper functions for different card layouts.
class CardLayoutHelper {
  CardLayoutHelper._();

  /// Get padding for a specific layout.
  static EdgeInsets getPadding(CardLayout layout) {
    switch (layout) {
      case CardLayout.compact:
        return const EdgeInsets.all(12);
      case CardLayout.standard:
        return const EdgeInsets.all(16);
      case CardLayout.large:
        return const EdgeInsets.all(24);
      case CardLayout.media:
        return EdgeInsets.zero; // Media cards have custom padding
      case CardLayout.action:
        return const EdgeInsets.fromLTRB(
            16, 16, 16, 8); // Less bottom padding for actions
    }
  }

  /// Get content padding for media cards.
  static EdgeInsets getMediaContentPadding() {
    return const EdgeInsets.all(16);
  }

  /// Get action area padding for action cards.
  static EdgeInsets getActionAreaPadding() {
    return const EdgeInsets.fromLTRB(8, 0, 8, 8);
  }

  /// Get header padding for cards with headers.
  static EdgeInsets getHeaderPadding() {
    return const EdgeInsets.fromLTRB(16, 16, 16, 8);
  }

  /// Get supporting text padding.
  static EdgeInsets getSupportingTextPadding() {
    return const EdgeInsets.fromLTRB(16, 0, 16, 16);
  }

  /// Calculate minimum height based on layout and content.
  static double calculateMinHeight(CardLayout layout,
      {bool hasActions = false}) {
    const baseHeight = 80.0;

    switch (layout) {
      case CardLayout.compact:
        return baseHeight - 16.0; // 64dp
      case CardLayout.standard:
        return baseHeight; // 80dp
      case CardLayout.large:
        return baseHeight + 24.0; // 104dp
      case CardLayout.media:
        return 200; // Media cards need more height
      case CardLayout.action:
        return hasActions
            ? baseHeight + 52.0
            : baseHeight; // +52dp for action bar
    }
  }
}

// ============================================================================
// CARD BACKGROUND HELPERS
// ============================================================================

/// Helper functions for card background colors.
class CardBackgroundHelper {
  CardBackgroundHelper._();

  /// Get background color for card variant.
  static Color? getBackgroundColor(
      CardVariant variant, ColorScheme colorScheme) {
    switch (variant) {
      case CardVariant.elevated:
        return colorScheme.surface;
      case CardVariant.filled:
        return colorScheme.surfaceContainerHighest;
      case CardVariant.outlined:
        return null; // Transparent background
    }
  }

  /// Get text color for card variant.
  static Color getTextColor(CardVariant variant, ColorScheme colorScheme) {
    switch (variant) {
      case CardVariant.elevated:
        return colorScheme.onSurface;
      case CardVariant.filled:
        return colorScheme.onSurfaceVariant;
      case CardVariant.outlined:
        return colorScheme.onSurface;
    }
  }

  /// Get border color for outlined cards.
  static Color getBorderColor(ColorScheme colorScheme) {
    return colorScheme.outline;
  }

  /// Get state overlay color.
  static Color getStateOverlayColor(
      CardVariant variant, ColorScheme colorScheme) {
    switch (variant) {
      case CardVariant.elevated:
        return colorScheme.onSurface;
      case CardVariant.filled:
        return colorScheme.onSurfaceVariant;
      case CardVariant.outlined:
        return colorScheme.onSurface;
    }
  }
}

// ============================================================================
// UTILITIES
// ============================================================================

/// Utility functions for card specifications.
class CardSpecUtils {
  CardSpecUtils._();

  /// Get card spec by variant and layout.
  static CardSpec getSpec({
    CardVariant variant = CardVariant.elevated,
    CardLayout layout = CardLayout.standard,
  }) {
    switch (variant) {
      case CardVariant.elevated:
        return ElevatedCardSpec(layout: layout);
      case CardVariant.filled:
        return FilledCardSpec(layout: layout);
      case CardVariant.outlined:
        return OutlinedCardSpec(layout: layout);
    }
  }

  /// Get elevation based on state.
  static double getElevation(WidgetState state, CardSpec spec) {
    if (state == WidgetState.dragged) return spec.draggedElevation;
    if (state == WidgetState.hovered) return spec.hoverElevation;
    return spec.elevation;
  }

  /// Get state layer color with appropriate opacity.
  static Color getStateLayerColor(
      Color baseColor, WidgetState state, CardSpec spec) {
    final opacity = spec.stateLayerOpacity[state] ?? 0.0;
    return baseColor.withOpacity(opacity);
  }

  /// Check if card should show border.
  static bool shouldShowBorder(CardVariant variant) {
    return variant == CardVariant.outlined;
  }

  /// Check if card should show background color.
  static bool shouldShowBackground(CardVariant variant) {
    return variant == CardVariant.filled;
  }

  /// Check if card should show elevation shadow.
  static bool shouldShowElevation(CardVariant variant) {
    return variant == CardVariant.elevated;
  }

  /// Create box decoration for card.
  static BoxDecoration createDecoration({
    required CardSpec spec,
    required ColorScheme colorScheme,
    WidgetState state = WidgetState.disabled,
    List<BoxShadow>? shadows,
  }) {
    final backgroundColor =
        CardBackgroundHelper.getBackgroundColor(spec.variant, colorScheme);
    final borderColor = CardBackgroundHelper.getBorderColor(colorScheme);

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(spec.cornerRadius),
      border: shouldShowBorder(spec.variant)
          ? Border.all(color: borderColor)
          : null,
      boxShadow: shouldShowElevation(spec.variant) ? shadows : null,
    );
  }
}
