// import 'package:flutter/material.dart';

// import '../../sys/color/old/color.dart';
// import '../../sys/elevation/elevation.dart';
// import '../../sys/state/state.dart';
// import '../../sys/typography/typescale.dart';

// /// Component tokens for Material Design 3 Floating Action Button (FAB).
// ///
// /// These tokens define the specific styling properties for different
// /// FAB variants in various states.
// ///
// /// Specification: https://m3.material.io/components/floating-action-button/specs
// abstract class MdCompFab {
//   // Primary FAB
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.container.color
//   static Color get primaryContainerColor => MdSysColor.primaryContainer;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.container.elevation
//   static const double primaryContainerElevation = MdSysElevation.level3;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.container.shadow-color
//   static Color get primaryContainerShadowColor => MdSysColor.shadow;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.container.surface-tint-layer.color
//   static Color get primaryContainerSurfaceTintLayerColor =>
//       MdSysColor.surfaceTint;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.icon.color
//   static Color get primaryIconColor => MdSysColor.onPrimaryContainer;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.icon.size
//   static const double primaryIconSize = 24.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.container.shape
//   static const BorderRadius primaryContainerShape = MdSysShape.large;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.container.width
//   static const double primaryContainerWidth = 56.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.container.height
//   static const double primaryContainerHeight = 56.0;

//   // Secondary FAB
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.secondary.container.color
//   static Color get secondaryContainerColor => MdSysColor.secondaryContainer;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.secondary.icon.color
//   static Color get secondaryIconColor => MdSysColor.onSecondaryContainer;

//   // Surface FAB
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.surface.container.color
//   static Color get surfaceContainerColor => MdSysColor.surface;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.surface.icon.color
//   static Color get surfaceIconColor => MdSysColor.primary;

//   // Tertiary FAB
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.tertiary.container.color
//   static Color get tertiaryContainerColor => MdSysColor.tertiaryContainer;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.tertiary.icon.color
//   static Color get tertiaryIconColor => MdSysColor.onTertiaryContainer;

//   // State layers
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.state-layer.opacity.hover
//   static const double stateLayerOpacityHover =
//       MdSysState.hoverStateLayerOpacity;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.state-layer.opacity.focus
//   static const double stateLayerOpacityFocus =
//       MdSysState.focusStateLayerOpacity;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.state-layer.opacity.pressed
//   static const double stateLayerOpacityPressed =
//       MdSysState.pressedStateLayerOpacity;

//   // Hover state elevation
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.hover.container.elevation
//   static const double primaryHoverContainerElevation = MdSysElevation.level4;

//   // Focus state elevation
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.focus.container.elevation
//   static const double primaryFocusContainerElevation = MdSysElevation.level3;

//   // Pressed state elevation
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.primary.pressed.container.elevation
//   static const double primaryPressedContainerElevation = MdSysElevation.level3;
// }

// /// Small FAB component tokens.
// abstract class MdCompFabSmall extends MdCompFab {
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.small.container.width
//   static const double containerWidth = 40.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.small.container.height
//   static const double containerHeight = 40.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.small.icon.size
//   static const double iconSize = 24.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.small.container.shape
//   static const BorderRadius containerShape = MdSysShape.medium;
// }

// /// Large FAB component tokens.
// abstract class MdCompFabLarge extends MdCompFab {
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.large.container.width
//   static const double containerWidth = 96.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.large.container.height
//   static const double containerHeight = 96.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.large.icon.size
//   static const double iconSize = 36.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.large.container.shape
//   static const BorderRadius containerShape = MdSysShape.extraLarge;
// }

// /// Extended FAB component tokens.
// abstract class MdCompFabExtended extends MdCompFab {
//   // TODO(M3): Pending
//   /// Token: md.comp.fab.extended.container.height
//   static const double containerHeight = 56.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.extended.container.shape
//   static const BorderRadius containerShape = MdSysShape.large;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.extended.label-text.type
//   static const TextStyle labelTextType = MdSysTypescale.labelLarge;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.extended.label-text.color
//   static Color get labelTextColor => MdSysColor.onPrimaryContainer;

//   // TODO(M3): Pending
//   /// Token: md.comp.fab.extended.icon.size
//   static const double iconSize = 24.0;
// }
