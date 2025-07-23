// import 'package:flutter/material.dart';
// import '../../ref/color/m3_ref_palette.dart';

// /// Material Design 3 System Color Tokens (Light Theme)
// /// 
// /// System tokens define semantic color roles that map reference palette
// /// tokens to specific component uses and interaction states. These colors
// /// provide meaningful context and are used directly by components and layouts.
// ///
// /// System color tokens bridge the gap between raw color values and their
// /// application in the interface, ensuring consistent color application
// /// across all components while supporting both light and dark themes.
// ///
// /// ## Usage
// ///
// /// ```dart
// /// // Use semantic color roles
// /// Container(
// ///   color: M3SysColor.primaryContainer,
// ///   child: Text('Hello', style: TextStyle(color: M3SysColor.onPrimaryContainer)),
// /// )
// /// ```
// ///
// /// ## Color Role Categories
// ///
// /// - **Primary**: Main brand colors for key components
// /// - **Secondary**: Supporting colors for less prominent components  
// /// - **Tertiary**: Contrasting accent colors for balance
// /// - **Error**: Colors for error states and destructive actions
// /// - **Surface**: Background colors for containers and surfaces
// /// - **Outline**: Border and divider colors
// /// - **Inverse**: Colors for high-contrast elements
// ///
// /// Reference: https://m3.material.io/styles/color/the-color-system/color-roles
// @immutable
// class M3SysColor {
//   const M3SysColor._();

//   // === PRIMARY COLORS ===
//   /// Primary color used for key components like prominent buttons and active states
//   static Color get primary => M3RefPalette.getColor(M3RefPalette.primary, 40);
  
//   /// Color used for text and icons on primary color backgrounds
//   static Color get onPrimary => M3RefPalette.getColor(M3RefPalette.primary, 100);
  
//   /// Primary container color for less prominent UI elements
//   static Color get primaryContainer => M3RefPalette.getColor(M3RefPalette.primary, 90);
  
//   /// Color used for text and icons on primary container backgrounds
//   static Color get onPrimaryContainer => M3RefPalette.getColor(M3RefPalette.primary, 10);

//   // === SECONDARY COLORS ===
//   /// Secondary color used for less prominent components
//   static Color get secondary => M3RefPalette.getColor(M3RefPalette.secondary, 40);
  
//   /// Color used for text and icons on secondary color backgrounds
//   static Color get onSecondary => M3RefPalette.getColor(M3RefPalette.secondary, 100);
  
//   /// Secondary container color for supporting UI elements
//   static Color get secondaryContainer => M3RefPalette.getColor(M3RefPalette.secondary, 90);
  
//   /// Color used for text and icons on secondary container backgrounds
//   static Color get onSecondaryContainer => M3RefPalette.getColor(M3RefPalette.secondary, 10);

//   // === TERTIARY COLORS ===
//   /// Tertiary color used for contrasting accents that balance primary and secondary
//   static Color get tertiary => M3RefPalette.getColor(M3RefPalette.tertiary, 40);
  
//   /// Color used for text and icons on tertiary color backgrounds
//   static Color get onTertiary => M3RefPalette.getColor(M3RefPalette.tertiary, 100);
  
//   /// Tertiary container color for accent UI elements
//   static Color get tertiaryContainer => M3RefPalette.getColor(M3RefPalette.tertiary, 90);
  
//   /// Color used for text and icons on tertiary container backgrounds
//   static Color get onTertiaryContainer => M3RefPalette.getColor(M3RefPalette.tertiary, 10);

//   // === ERROR COLORS ===
//   /// Error color used for error states and destructive actions
//   static Color get error => M3RefPalette.getColor(M3RefPalette.error, 40);
  
//   /// Color used for text and icons on error color backgrounds
//   static Color get onError => M3RefPalette.getColor(M3RefPalette.error, 100);
  
//   /// Error container color for error-related UI elements
//   static Color get errorContainer => M3RefPalette.getColor(M3RefPalette.error, 90);
  
//   /// Color used for text and icons on error container backgrounds
//   static Color get onErrorContainer => M3RefPalette.getColor(M3RefPalette.error, 10);

//   // === SURFACE COLORS ===
//   /// Default surface color for backgrounds and containers
//   static Color get surface => M3RefPalette.getColor(M3RefPalette.neutral, 99);
  
//   /// Color used for text and icons on surface backgrounds
//   static Color get onSurface => M3RefPalette.getColor(M3RefPalette.neutral, 10);
  
//   /// Variant surface color for subtle differentiation
//   static Color get surfaceVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 90);
  
//   /// Color used for text and icons on surface variant backgrounds
//   static Color get onSurfaceVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 30);

//   // === SURFACE CONTAINER COLORS ===
//   /// Dim surface color for receded backgrounds
//   static Color get surfaceDim => M3RefPalette.getColor(M3RefPalette.neutral, 87);
  
//   /// Bright surface color for elevated backgrounds  
//   static Color get surfaceBright => M3RefPalette.getColor(M3RefPalette.neutral, 98);
  
//   /// Lowest elevation surface container
//   static Color get surfaceContainerLowest => M3RefPalette.getColor(M3RefPalette.neutral, 100);
  
//   /// Low elevation surface container
//   static Color get surfaceContainerLow => M3RefPalette.getColor(M3RefPalette.neutral, 96);
  
//   /// Default surface container for elevated content
//   static Color get surfaceContainer => M3RefPalette.getColor(M3RefPalette.neutral, 94);
  
//   /// High elevation surface container
//   static Color get surfaceContainerHigh => M3RefPalette.getColor(M3RefPalette.neutral, 92);
  
//   /// Highest elevation surface container
//   static Color get surfaceContainerHighest => M3RefPalette.getColor(M3RefPalette.neutral, 90);

//   // === OUTLINE COLORS ===
//   /// Primary outline color for borders and dividers
//   static Color get outline => M3RefPalette.getColor(M3RefPalette.neutralVariant, 50);
  
//   /// Variant outline color for subtle borders
//   static Color get outlineVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 80);

//   // === INVERSE COLORS ===
//   /// Inverse surface color for high contrast elements
//   static Color get inverseSurface => M3RefPalette.getColor(M3RefPalette.neutral, 20);
  
//   /// Color used for text and icons on inverse surface backgrounds
//   static Color get onInverseSurface => M3RefPalette.getColor(M3RefPalette.neutral, 95);
  
//   /// Inverse primary color for high contrast primary elements
//   static Color get inversePrimary => M3RefPalette.getColor(M3RefPalette.primary, 80);

//   // === SPECIAL COLORS ===
//   /// Surface tint color used to tint elevated surfaces
//   static Color get surfaceTint => primary;

//   /// Scrim color used for modal overlays and backgrounds
//   static Color get scrim => M3RefPalette.getColor(M3RefPalette.neutral, 0);

//   /// Shadow color used for elevation shadows
//   static Color get shadow => M3RefPalette.getColor(M3RefPalette.neutral, 0);

//   /// Convert system colors to Flutter ColorScheme for light theme
//   ///
//   /// This utility method creates a Material Design 3 compliant ColorScheme
//   /// that can be used with Flutter's ThemeData for consistent theming.
//   static ColorScheme toColorScheme() {
//     return ColorScheme.light(
//       primary: primary,
//       onPrimary: onPrimary,
//       primaryContainer: primaryContainer,
//       onPrimaryContainer: onPrimaryContainer,
//       secondary: secondary,
//       onSecondary: onSecondary,
//       secondaryContainer: secondaryContainer,
//       onSecondaryContainer: onSecondaryContainer,
//       tertiary: tertiary,
//       onTertiary: onTertiary,
//       tertiaryContainer: tertiaryContainer,
//       onTertiaryContainer: onTertiaryContainer,
//       error: error,
//       onError: onError,
//       errorContainer: errorContainer,
//       onErrorContainer: onErrorContainer,
//       surface: surface,
//       onSurface: onSurface,
//       surfaceContainerHighest: surfaceVariant,
//       onSurfaceVariant: onSurfaceVariant,
//       outline: outline,
//       outlineVariant: outlineVariant,
//       shadow: shadow,
//       scrim: scrim,
//       inverseSurface: inverseSurface,
//       onInverseSurface: onInverseSurface,
//       inversePrimary: inversePrimary,
//       surfaceTint: surfaceTint,
//     );
//   }
// }

// /// Material Design 3 System Color Tokens (Dark Theme)
// ///
// /// Dark theme color tokens that provide appropriate color mappings
// /// for dark interfaces, ensuring accessibility and visual hierarchy
// /// are maintained in low-light environments.
// ///
// /// The dark theme uses different tone mappings from the same reference
// /// palettes to provide optimal contrast and readability in dark modes.
// ///
// /// ## Usage
// ///
// /// ```dart
// /// // Use dark theme colors
// /// Container(
// ///   color: M3SysColorDark.primaryContainer,
// ///   child: Text('Hello', style: TextStyle(color: M3SysColorDark.onPrimaryContainer)),
// /// )
// /// ```
// ///
// /// Reference: https://m3.material.io/styles/color/the-color-system/color-roles
// @immutable 
// class M3SysColorDark {
//   const M3SysColorDark._();

//   // === PRIMARY COLORS ===
//   static Color get primary => M3RefPalette.getColor(M3RefPalette.primary, 80);
//   static Color get onPrimary => M3RefPalette.getColor(M3RefPalette.primary, 20);
//   static Color get primaryContainer => M3RefPalette.getColor(M3RefPalette.primary, 30);
//   static Color get onPrimaryContainer => M3RefPalette.getColor(M3RefPalette.primary, 90);

//   // === SECONDARY COLORS ===
//   static Color get secondary => M3RefPalette.getColor(M3RefPalette.secondary, 80);
//   static Color get onSecondary => M3RefPalette.getColor(M3RefPalette.secondary, 20);
//   static Color get secondaryContainer => M3RefPalette.getColor(M3RefPalette.secondary, 30);
//   static Color get onSecondaryContainer => M3RefPalette.getColor(M3RefPalette.secondary, 90);

//   // === TERTIARY COLORS ===
//   static Color get tertiary => M3RefPalette.getColor(M3RefPalette.tertiary, 80);
//   static Color get onTertiary => M3RefPalette.getColor(M3RefPalette.tertiary, 20);
//   static Color get tertiaryContainer => M3RefPalette.getColor(M3RefPalette.tertiary, 30);
//   static Color get onTertiaryContainer => M3RefPalette.getColor(M3RefPalette.tertiary, 90);

//   // === ERROR COLORS ===
//   static Color get error => M3RefPalette.getColor(M3RefPalette.error, 80);
//   static Color get onError => M3RefPalette.getColor(M3RefPalette.error, 20);
//   static Color get errorContainer => M3RefPalette.getColor(M3RefPalette.error, 30);
//   static Color get onErrorContainer => M3RefPalette.getColor(M3RefPalette.error, 90);

//   // === SURFACE COLORS ===
//   static Color get surface => M3RefPalette.getColor(M3RefPalette.neutral, 10);
//   static Color get onSurface => M3RefPalette.getColor(M3RefPalette.neutral, 90);
//   static Color get surfaceVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 30);
//   static Color get onSurfaceVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 80);

//   // === SURFACE CONTAINER COLORS ===
//   static Color get surfaceDim => M3RefPalette.getColor(M3RefPalette.neutral, 6);
//   static Color get surfaceBright => M3RefPalette.getColor(M3RefPalette.neutral, 24);
//   static Color get surfaceContainerLowest => M3RefPalette.getColor(M3RefPalette.neutral, 4);
//   static Color get surfaceContainerLow => M3RefPalette.getColor(M3RefPalette.neutral, 10);
//   static Color get surfaceContainer => M3RefPalette.getColor(M3RefPalette.neutral, 12);
//   static Color get surfaceContainerHigh => M3RefPalette.getColor(M3RefPalette.neutral, 17);
//   static Color get surfaceContainerHighest => M3RefPalette.getColor(M3RefPalette.neutral, 22);

//   // === OUTLINE COLORS ===
//   static Color get outline => M3RefPalette.getColor(M3RefPalette.neutralVariant, 60);
//   static Color get outlineVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 30);

//   // === INVERSE COLORS ===
//   static Color get inverseSurface => M3RefPalette.getColor(M3RefPalette.neutral, 90);
//   static Color get onInverseSurface => M3RefPalette.getColor(M3RefPalette.neutral, 20);
//   static Color get inversePrimary => M3RefPalette.getColor(M3RefPalette.primary, 40);

//   // === SPECIAL COLORS ===
//   static Color get surfaceTint => primary;
//   static Color get scrim => M3RefPalette.getColor(M3RefPalette.neutral, 0);
//   static Color get shadow => M3RefPalette.getColor(M3RefPalette.neutral, 0);

//   /// Convert system colors to Flutter ColorScheme for dark theme
//   static ColorScheme toColorScheme() {
//     return ColorScheme.dark(
//       primary: primary,
//       onPrimary: onPrimary,
//       primaryContainer: primaryContainer,
//       onPrimaryContainer: onPrimaryContainer,
//       secondary: secondary,
//       onSecondary: onSecondary,
//       secondaryContainer: secondaryContainer,
//       onSecondaryContainer: onSecondaryContainer,
//       tertiary: tertiary,
//       onTertiary: onTertiary,
//       tertiaryContainer: tertiaryContainer,
//       onTertiaryContainer: onTertiaryContainer,
//       error: error,
//       onError: onError,
//       errorContainer: errorContainer,
//       onErrorContainer: onErrorContainer,
//       surface: surface,
//       onSurface: onSurface,
//       surfaceContainerHighest: surfaceVariant,
//       onSurfaceVariant: onSurfaceVariant,
//       outline: outline,
//       outlineVariant: outlineVariant,
//       shadow: shadow,
//       scrim: scrim,
//       inverseSurface: inverseSurface,
//       onInverseSurface: onInverseSurface,
//       inversePrimary: inversePrimary,
//       surfaceTint: surfaceTint,
//     );
//   }
// }