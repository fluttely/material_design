// import 'package:flutter/material.dart';

// import '../../ref/color/m3_ref_opacity.dart';

// /// Material Design 3 Button Component Tokens
// ///
// /// Contains specific design tokens for button components.
// /// These tokens provide the exact specifications for button styling.
// ///
// /// Based on: https://m3.material.io/components/buttons/specs
// abstract class M3CompButton {
//   // Container heights
//   static const double heightSmall = 32.0;
//   static const double heightMedium = 40.0;
//   static const double heightLarge = 48.0;
//   static const double heightExtraLarge = 56.0;

//   // Icon sizes
//   static const double iconSizeSmall = 16.0;
//   static const double iconSizeMedium = 18.0;
//   static const double iconSizeLarge = 24.0;

//   // Container shapes (border radius)
//   static const BorderRadius shapeSmall = BorderRadius.all(Radius.circular(8.0));
//   static const BorderRadius shapeMedium =
//       BorderRadius.all(Radius.circular(12.0));
//   static const BorderRadius shapeLarge =
//       BorderRadius.all(Radius.circular(16.0));
//   static const BorderRadius shapeFull =
//       BorderRadius.all(Radius.circular(100.0));

//   // Spacing between icon and label
//   static const double iconLabelSpacing = 8.0;

//   // Minimum touch target size
//   static const double minimumTouchTarget = 48.0;

//   // Elevation levels
//   static const double elevationRested = 1.0;
//   static const double elevationHover = 3.0;
//   static const double elevationPressed = 1.0;
//   static const double elevationDisabled = 0.0;

//   // State layer opacities
//   static const double stateLayerOpacityHover = M3RefOpacity.hover;
//   static const double stateLayerOpacityPressed = M3RefOpacity.pressed;
//   static const double stateLayerOpacityFocus = M3RefOpacity.focus;

//   // Disabled opacity
//   static const double disabledOpacity = M3RefOpacity.disabled;

//   // Container padding
//   static const EdgeInsets paddingSmall =
//       EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
//   static const EdgeInsets paddingMedium =
//       EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
//   static const EdgeInsets paddingLarge =
//       EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0);

//   // Icon button specific
//   static const EdgeInsets iconButtonPadding = EdgeInsets.all(8.0);
//   static const double iconButtonSize = 40.0;
//   static const double iconButtonIconSize = 24.0;

//   // FAB specific
//   static const double fabSize = 56.0;
//   static const double fabSizeSmall = 40.0;
//   static const double fabSizeLarge = 96.0;
//   static const double fabIconSize = 24.0;
//   static const double fabElevation = 6.0;
//   static const double fabElevationHover = 8.0;
//   static const double fabElevationPressed = 6.0;
// }

// /// Elevated Button specific tokens
// abstract class M3CompElevatedButton extends M3CompButton {
//   static const double containerHeight = M3CompButton.heightMedium;
//   static const BorderRadius containerShape = M3CompButton.shapeMedium;
//   static const EdgeInsets containerPadding = M3CompButton.paddingMedium;
//   static const double containerElevation = M3CompButton.elevationRested;
//   static const double containerElevationHover = M3CompButton.elevationHover;
//   static const double containerElevationPressed = M3CompButton.elevationPressed;
//   static const double containerElevationDisabled =
//       M3CompButton.elevationDisabled;
// }

// /// Filled Button specific tokens
// abstract class M3CompFilledButton extends M3CompButton {
//   static const double containerHeight = M3CompButton.heightMedium;
//   static const BorderRadius containerShape = M3CompButton.shapeMedium;
//   static const EdgeInsets containerPadding = M3CompButton.paddingMedium;
//   static const double containerElevation = 0.0;
// }

// /// Outlined Button specific tokens
// abstract class M3CompOutlinedButton extends M3CompButton {
//   static const double containerHeight = M3CompButton.heightMedium;
//   static const BorderRadius containerShape = M3CompButton.shapeMedium;
//   static const EdgeInsets containerPadding = M3CompButton.paddingMedium;
//   static const double containerElevation = 0.0;
//   static const double outlineWidth = 1.0;
// }

// /// Text Button specific tokens
// abstract class M3CompTextButton extends M3CompButton {
//   static const double containerHeight = M3CompButton.heightMedium;
//   static const BorderRadius containerShape = M3CompButton.shapeMedium;
//   static const EdgeInsets containerPadding = M3CompButton.paddingMedium;
//   static const double containerElevation = 0.0;
// }
