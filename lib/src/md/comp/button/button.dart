// import 'package:flutter/material.dart';

// import '../../sys/color/old/color.dart';
// import '../../sys/elevation/elevation.dart';
// import '../../sys/state/state.dart';
// import '../../sys/typography/typescale.dart';

// /// Component tokens for Material Design 3 buttons.
// ///
// /// These tokens define the specific styling properties for different
// /// button variants in various states.
// ///
// /// Specification: https://m3.material.io/components/buttons/specs
// abstract class MdCompButton {
//   // Common button properties
//   // TODO(M3): Pending
//   /// Token: md.comp.button.label-text.type
//   static const TextStyle labelTextType = MdSysTypescale.labelLarge;

//   // TODO(M3): Pending
//   /// Token: md.comp.button.with-icon.icon.size
//   static const double iconSize = 18.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.button.container.height
//   static const double containerHeight = 40.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.button.container.shape
//   static const BorderRadius containerShape = MdSysShape.full;

//   // TODO(M3): Pending
//   /// Token: md.comp.button.state-layer.opacity.hover
//   static const double stateLayerOpacityHover =
//       MdSysState.hoverStateLayerOpacity;

//   // TODO(M3): Pending
//   /// Token: md.comp.button.state-layer.opacity.focus
//   static const double stateLayerOpacityFocus =
//       MdSysState.focusStateLayerOpacity;

//   // TODO(M3): Pending
//   /// Token: md.comp.button.state-layer.opacity.pressed
//   static const double stateLayerOpacityPressed =
//       MdSysState.pressedStateLayerOpacity;
// }

// /// Elevated button component tokens.
// abstract class MdCompElevatedButton extends MdCompButton {
//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-button.container.color
//   static Color get containerColor => MdSysColor.surface;

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-button.container.elevation
//   static const double containerElevation = MdSysElevation.level1;

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-button.label-text.color
//   static Color get labelTextColor => MdSysColor.primary;

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-button.with-icon.icon.color
//   static Color get iconColor => MdSysColor.primary;

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-button.container.shadow-color
//   static Color get containerShadowColor => MdSysColor.shadow;

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-button.container.surface-tint-layer.color
//   static Color get containerSurfaceTintLayerColor => MdSysColor.surfaceTint;

//   // Disabled state
//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-button.disabled.container.color
//   static Color get disabledContainerColor => MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContainerOpacity,
//       );

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-button.disabled.label-text.color
//   static Color get disabledLabelTextColor => MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContentOpacity,
//       );

//   // TODO(M3): Pending
//   /// Token: md.comp.elevated-button.disabled.container.elevation
//   static const double disabledContainerElevation = MdSysElevation.level0;
// }

// /// Filled button component tokens.
// abstract class MdCompFilledButton extends MdCompButton {
//   // TODO(M3): Pending
//   /// Token: md.comp.filled-button.container.color
//   static Color get containerColor => MdSysColor.primary;

//   // TODO(M3): Pending
//   /// Token: md.comp.filled-button.label-text.color
//   static Color get labelTextColor => MdSysColor.onPrimary;

//   // TODO(M3): Pending
//   /// Token: md.comp.filled-button.with-icon.icon.color
//   static Color get iconColor => MdSysColor.onPrimary;

//   // Disabled state
//   // TODO(M3): Pending
//   /// Token: md.comp.filled-button.disabled.container.color
//   static Color get disabledContainerColor => MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContainerOpacity,
//       );

//   // TODO(M3): Pending
//   /// Token: md.comp.filled-button.disabled.label-text.color
//   static Color get disabledLabelTextColor => MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContentOpacity,
//       );
// }

// /// Filled tonal button component tokens.
// abstract class MdCompFilledTonalButton extends MdCompButton {
//   // TODO(M3): Pending
//   /// Token: md.comp.filled-tonal-button.container.color
//   static Color get containerColor => MdSysColor.secondaryContainer;

//   // TODO(M3): Pending
//   /// Token: md.comp.filled-tonal-button.label-text.color
//   static Color get labelTextColor => MdSysColor.onSecondaryContainer;

//   // TODO(M3): Pending
//   /// Token: md.comp.filled-tonal-button.with-icon.icon.color
//   static Color get iconColor => MdSysColor.onSecondaryContainer;

//   // Disabled state
//   // TODO(M3): Pending
//   /// Token: md.comp.filled-tonal-button.disabled.container.color
//   static Color get disabledContainerColor => MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContainerOpacity,
//       );

//   // TODO(M3): Pending
//   /// Token: md.comp.filled-tonal-button.disabled.label-text.color
//   static Color get disabledLabelTextColor => MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContentOpacity,
//       );
// }

// /// Outlined button component tokens.
// abstract class MdCompOutlinedButton extends MdCompButton {
//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-button.outline.color
//   static Color get outlineColor => MdSysColor.outline;

//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-button.outline.width
//   static const double outlineWidth = 1.0;

//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-button.label-text.color
//   static Color get labelTextColor => MdSysColor.primary;

//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-button.with-icon.icon.color
//   static Color get iconColor => MdSysColor.primary;

//   // Disabled state
//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-button.disabled.outline.color
//   static Color get disabledOutlineColor => MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContainerOpacity,
//       );

//   // TODO(M3): Pending
//   /// Token: md.comp.outlined-button.disabled.label-text.color
//   static Color get disabledLabelTextColor => MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContentOpacity,
//       );
// }

// /// Text button component tokens.
// abstract class MdCompTextButton extends MdCompButton {
//   // TODO(M3): Pending
//   /// Token: md.comp.text-button.label-text.color
//   static Color get labelTextColor => MdSysColor.primary;

//   // TODO(M3): Pending
//   /// Token: md.comp.text-button.with-icon.icon.color
//   static Color get iconColor => MdSysColor.primary;

//   // Disabled state
//   // TODO(M3): Pending
//   /// Token: md.comp.text-button.disabled.label-text.color
//   static Color get disabledLabelTextColor => MdSysColor.onSurface.withValues(
//         alpha: MdSysState.disabledContentOpacity,
//       );
// }
