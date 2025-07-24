// import 'package:flutter/material.dart';

// import '../../ref/color/m3_ref_opacity.dart';
// import '../../sys/spacing/m3_spacing.dart';

// /// Material Design 3 Button Component Tokens
// ///
// /// Component tokens are the most specific level of design tokens, providing
// /// exact specifications for individual UI components. These button tokens
// /// define the precise dimensions, colors, shapes, and behavior for all
// /// button variants in Material Design 3.
// ///
// /// ## Token Categories
// ///
// /// This implementation provides comprehensive token coverage for:
// /// - **Common properties**: Heights, shapes, padding, icons
// /// - **Elevation values**: For different button states
// /// - **State layer opacities**: For interactive feedback
// /// - **Accessibility**: Touch targets and spacing
// ///
// /// ## Button Variants Covered
// ///
// /// - **Elevated Button**: Standard button with elevation
// /// - **Filled Button**: High-emphasis button with filled background
// /// - **Outlined Button**: Medium-emphasis button with outline
// /// - **Text Button**: Low-emphasis button with text only
// /// - **Icon Button**: Circular button containing only an icon
// /// - **FAB (Floating Action Button)**: Prominent action button
// ///
// /// ## Usage
// ///
// /// ```dart
// /// // Use component tokens for consistent button styling
// /// Container(
// ///   height: M3CompButton.heightMedium,
// ///   decoration: ShapeDecoration(
// ///     shape: RoundedRectangleBorder(
// ///       borderRadius: M3CompButton.shapeMedium,
// ///     ),
// ///   ),
// ///   padding: M3CompButton.paddingMedium,
// /// )
// /// ```
// ///
// /// Reference: https://m3.material.io/components/buttons/specs
// abstract interface class M3CompButton {
//   // === CONTAINER HEIGHTS ===
//   /// Small button height (32dp) - Compact layouts
//   static const double heightSmall = 32.0;
  
//   /// Medium button height (40dp) - Default size
//   static const double heightMedium = 40.0;
  
//   /// Large button height (48dp) - Prominent actions
//   static const double heightLarge = 48.0;
  
//   /// Extra large button height (56dp) - Hero actions
//   static const double heightExtraLarge = 56.0;

//   // === ICON SIZES ===
//   /// Small icon size (16dp) - For compact buttons
//   static const double iconSizeSmall = 16.0;
  
//   /// Medium icon size (18dp) - Default icon size
//   static const double iconSizeMedium = 18.0;
  
//   /// Large icon size (24dp) - For prominent buttons
//   static const double iconSizeLarge = 24.0;

//   // === CONTAINER SHAPES ===
//   /// Small border radius (8dp) - Subtle rounding
//   static const BorderRadius shapeSmall = BorderRadius.all(Radius.circular(8.0));
  
//   /// Medium border radius (12dp) - Default rounding
//   static const BorderRadius shapeMedium = BorderRadius.all(Radius.circular(12.0));
  
//   /// Large border radius (16dp) - Prominent rounding
//   static const BorderRadius shapeLarge = BorderRadius.all(Radius.circular(16.0));
  
//   /// Full border radius (100dp) - Pill shape
//   static const BorderRadius shapeFull = BorderRadius.all(Radius.circular(100.0));

//   // === SPACING ===
//   /// Spacing between icon and label (8dp)
//   static double get iconLabelSpacing => M3SpacingToken.space8.value;

//   /// Minimum touch target size (48dp) - Accessibility requirement
//   static const double minimumTouchTarget = 48.0;

//   // === ELEVATION LEVELS ===
//   /// Elevation at rest state (1dp)
//   static const double elevationRested = 1.0;
  
//   /// Elevation on hover state (3dp) 
//   static const double elevationHover = 3.0;
  
//   /// Elevation when pressed (1dp)
//   static const double elevationPressed = 1.0;
  
//   /// Elevation when disabled (0dp)
//   static const double elevationDisabled = 0.0;

//   // === STATE LAYER OPACITIES ===
//   /// Hover state layer opacity
//   static const double stateLayerOpacityHover = M3RefOpacity.hover;
  
//   /// Pressed state layer opacity
//   static const double stateLayerOpacityPressed = M3RefOpacity.pressed;
  
//   /// Focus state layer opacity
//   static const double stateLayerOpacityFocus = M3RefOpacity.focus;

//   // === DISABLED OPACITY ===
//   /// Opacity for disabled state elements
//   static const double disabledOpacity = M3RefOpacity.disabled;

//   // === CONTAINER PADDING ===
//   /// Small button padding (12dp horizontal, 6dp vertical)
//   static const EdgeInsets paddingSmall = EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
  
//   /// Medium button padding (16dp horizontal, 8dp vertical) 
//   static const EdgeInsets paddingMedium = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  
//   /// Large button padding (24dp horizontal, 12dp vertical)
//   static const EdgeInsets paddingLarge = EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0);

//   // === ICON BUTTON SPECIFIC ===
//   /// Icon button padding (8dp all sides)
//   static EdgeInsets get iconButtonPadding => EdgeInsets.all(M3SpacingToken.space8.value);
  
//   /// Icon button container size (40dp)
//   static const double iconButtonSize = 40.0;
  
//   /// Icon button icon size (24dp)
//   static const double iconButtonIconSize = 24.0;

//   // === FAB SPECIFIC ===
//   /// Standard FAB size (56dp)
//   static const double fabSize = 56.0;
  
//   /// Small FAB size (40dp)
//   static const double fabSizeSmall = 40.0;
  
//   /// Large FAB size (96dp)
//   static const double fabSizeLarge = 96.0;
  
//   /// FAB icon size (24dp)
//   static const double fabIconSize = 24.0;
  
//   /// FAB elevation at rest (6dp)
//   static const double fabElevation = 6.0;
  
//   /// FAB elevation on hover (8dp)
//   static const double fabElevationHover = 8.0;
  
//   /// FAB elevation when pressed (6dp)
//   static const double fabElevationPressed = 6.0;
// }

// /// Elevated Button Component Tokens
// ///
// /// Elevated buttons are essentially filled tonal buttons with a shadow.
// /// They have the highest emphasis among button types and should be used
// /// for important, final actions.
// ///
// /// ## Visual Characteristics
// /// - Container filled with surface color
// /// - Elevation shadow for depth
// /// - Rounded corners for friendly appearance
// ///
// /// Reference: https://m3.material.io/components/buttons/specs#elevated-button
// abstract interface class M3CompElevatedButton extends M3CompButton {
//   /// Container height for elevated buttons
//   static const double containerHeight = M3CompButton.heightMedium;
  
//   /// Container shape for elevated buttons  
//   static const BorderRadius containerShape = M3CompButton.shapeMedium;
  
//   /// Container padding for elevated buttons
//   static const EdgeInsets containerPadding = M3CompButton.paddingMedium;
  
//   /// Container elevation at rest
//   static const double containerElevation = M3CompButton.elevationRested;
  
//   /// Container elevation on hover
//   static const double containerElevationHover = M3CompButton.elevationHover;
  
//   /// Container elevation when pressed
//   static const double containerElevationPressed = M3CompButton.elevationPressed;
  
//   /// Container elevation when disabled
//   static const double containerElevationDisabled = M3CompButton.elevationDisabled;
// }

// /// Filled Button Component Tokens  
// ///
// /// Filled buttons have the most visual impact after FABs and should be used
// /// for important, final actions that complete a flow, like "Save", "Join now",
// /// or "Confirm".
// ///
// /// ## Visual Characteristics
// /// - Container filled with primary color
// /// - No elevation shadow
// /// - High contrast with background
// ///
// /// Reference: https://m3.material.io/components/buttons/specs#filled-button
// abstract interface class M3CompFilledButton extends M3CompButton {
//   /// Container height for filled buttons
//   static const double containerHeight = M3CompButton.heightMedium;
  
//   /// Container shape for filled buttons
//   static const BorderRadius containerShape = M3CompButton.shapeMedium;
  
//   /// Container padding for filled buttons
//   static const EdgeInsets containerPadding = M3CompButton.paddingMedium;
  
//   /// Container elevation (always flat)
//   static const double containerElevation = 0.0;
// }

// /// Outlined Button Component Tokens
// ///
// /// Outlined buttons are medium-emphasis buttons. They contain actions that are
// /// important but aren't the primary action in an app. They pair well with
// /// filled buttons to indicate an alternative, secondary action.
// ///
// /// ## Visual Characteristics  
// /// - Transparent container with outline border
// /// - No fill color or elevation
// /// - Clear visual hierarchy
// ///
// /// Reference: https://m3.material.io/components/buttons/specs#outlined-button
// abstract interface class M3CompOutlinedButton extends M3CompButton {
//   /// Container height for outlined buttons
//   static const double containerHeight = M3CompButton.heightMedium;
  
//   /// Container shape for outlined buttons
//   static const BorderRadius containerShape = M3CompButton.shapeMedium;
  
//   /// Container padding for outlined buttons
//   static const EdgeInsets containerPadding = M3CompButton.paddingMedium;
  
//   /// Container elevation (always flat)
//   static const double containerElevation = 0.0;
  
//   /// Outline border width (1dp)
//   static const double outlineWidth = 1.0;
// }

// /// Text Button Component Tokens
// ///
// /// Text buttons are typically used for less-pronounced actions, including those 
// /// located in dialogs and cards. In cards, text buttons help maintain an emphasis
// /// hierarchy.
// ///
// /// ## Visual Characteristics
// /// - No container, outline, or elevation
// /// - Lowest emphasis of all button types
// /// - Minimal visual weight
// ///
// /// Reference: https://m3.material.io/components/buttons/specs#text-button
// abstract interface class M3CompTextButton extends M3CompButton {
//   /// Container height for text buttons
//   static const double containerHeight = M3CompButton.heightMedium;
  
//   /// Container shape for text buttons (for state layers)
//   static const BorderRadius containerShape = M3CompButton.shapeMedium;
  
//   /// Container padding for text buttons
//   static const EdgeInsets containerPadding = M3CompButton.paddingMedium;
  
//   /// Container elevation (always flat)
//   static const double containerElevation = 0.0;
// }