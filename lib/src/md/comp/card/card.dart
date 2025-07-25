// import 'package:flutter/material.dart';

// import '../../sys/color/old/color.dart';
// import '../../sys/elevation/elevation.dart';
// import '../../sys/state/state.dart';

// /// Component tokens for Material Design 3 cards.
// ///
// /// These tokens define the specific styling properties for different
// /// card variants in various states.
// ///
// /// Specification: https://m3.material.io/components/cards/specs
// abstract class MdCompCard {
//   // Elevated card
//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-card.container.color
//   static Color get elevatedContainerColor => MdSysColor.surface;

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-card.container.elevation
//   static const double elevatedContainerElevation = MdSysElevation.level1;

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-card.container.shadow-color
//   static Color get elevatedContainerShadowColor => MdSysColor.shadow;

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-card.container.surface-tint-layer.color
//   static Color get elevatedContainerSurfaceTintLayerColor =>
//       MdSysColor.surfaceTint;

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-card.container.shape
//   static const BorderRadius elevatedContainerShape = MdSysShape.medium;

//   // Filled card
//   // TODO(M3): Pending
//   /// Token: md.comp.filled-card.container.color
//   static Color get filledContainerColor => MdSysColor.surfaceContainerHighest;

//   // TODO(M3): Pending
//   /// Token: md.comp.filled-card.container.elevation
//   static const double filledContainerElevation = MdSysElevation.level0;

//   // TODO(M3): Pending
//   /// Token: md.comp.filled-card.container.shape
//   static const BorderRadius filledContainerShape = MdSysShape.medium;

//   // Outlined card
//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-card.container.color
//   static Color get outlinedContainerColor => MdSysColor.surface;

//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-card.container.elevation
//   static const double outlinedContainerElevation = MdSysElevation.level0;

//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-card.outline.color
//   static Color get outlinedOutlineColor => MdSysColor.outlineVariant;

//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-card.outline.width
//   static const double outlinedOutlineWidth = 1.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-card.container.shape
//   static const BorderRadius outlinedContainerShape = MdSysShape.medium;

//   // State layers
//   // TODO(M3): Pending
//   /// Token: md.comp.card.state-layer.opacity.hover
//   static const double stateLayerOpacityHover =
//       MdSysState.hoverStateLayerOpacity;

//   // TODO(M3): Pending
//   /// Token: md.comp.card.state-layer.opacity.focus
//   static const double stateLayerOpacityFocus =
//       MdSysState.focusStateLayerOpacity;

//   // TODO(M3): Pending
//   /// Token: md.comp.card.state-layer.opacity.pressed
//   static const double stateLayerOpacityPressed =
//       MdSysState.pressedStateLayerOpacity;

//   // TODO(M3): Pending
//   /// Token: md.comp.card.state-layer.opacity.dragged
//   static const double stateLayerOpacityDragged =
//       MdSysState.draggedStateLayerOpacity;

//   // Hover state elevation (for elevated cards)
//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-card.hover.container.elevation
//   static const double elevatedHoverContainerElevation = MdSysElevation.level2;

//   // Focus state elevation (for elevated cards)
//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-card.focus.container.elevation
//   static const double elevatedFocusContainerElevation = MdSysElevation.level1;

//   // Pressed state elevation (for elevated cards)
//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-card.pressed.container.elevation
//   static const double elevatedPressedContainerElevation = MdSysElevation.level1;

//   // Dragged state elevation (for elevated cards)
//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-card.dragged.container.elevation
//   static const double elevatedDraggedContainerElevation = MdSysElevation.level3;

//   // Disabled state (for outlined cards)
//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-card.disabled.outline.color
//   static Color get outlinedDisabledOutlineColor =>
//       MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContainerOpacity,
//       );
// }
