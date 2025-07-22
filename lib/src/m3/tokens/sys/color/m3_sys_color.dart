// import 'package:flutter/material.dart';
// import '../../ref/color/m3_ref_palette.dart';

// /// Material Design 3 System Color Tokens
// /// 
// /// Contains semantic color roles derived from reference palettes.
// /// These colors are used directly by components and layouts.
// /// 
// /// Based on: https://m3.material.io/styles/color/the-color-system/color-roles
// @immutable
// class M3SysColor {
//   const M3SysColor._();

//   // Primary colors
//   static Color get primary => M3RefPalette.getColor(M3RefPalette.primary, 40);
//   static Color get onPrimary => M3RefPalette.getColor(M3RefPalette.primary, 100);
//   static Color get primaryContainer => M3RefPalette.getColor(M3RefPalette.primary, 90);
//   static Color get onPrimaryContainer => M3RefPalette.getColor(M3RefPalette.primary, 10);

//   // Secondary colors
//   static Color get secondary => M3RefPalette.getColor(M3RefPalette.secondary, 40);
//   static Color get onSecondary => M3RefPalette.getColor(M3RefPalette.secondary, 100);
//   static Color get secondaryContainer => M3RefPalette.getColor(M3RefPalette.secondary, 90);
//   static Color get onSecondaryContainer => M3RefPalette.getColor(M3RefPalette.secondary, 10);

//   // Tertiary colors
//   static Color get tertiary => M3RefPalette.getColor(M3RefPalette.tertiary, 40);
//   static Color get onTertiary => M3RefPalette.getColor(M3RefPalette.tertiary, 100);
//   static Color get tertiaryContainer => M3RefPalette.getColor(M3RefPalette.tertiary, 90);
//   static Color get onTertiaryContainer => M3RefPalette.getColor(M3RefPalette.tertiary, 10);

//   // Error colors
//   static Color get error => M3RefPalette.getColor(M3RefPalette.error, 40);
//   static Color get onError => M3RefPalette.getColor(M3RefPalette.error, 100);
//   static Color get errorContainer => M3RefPalette.getColor(M3RefPalette.error, 90);
//   static Color get onErrorContainer => M3RefPalette.getColor(M3RefPalette.error, 10);

//   // Surface colors
//   static Color get surface => M3RefPalette.getColor(M3RefPalette.neutral, 99);
//   static Color get onSurface => M3RefPalette.getColor(M3RefPalette.neutral, 10);
//   static Color get surfaceVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 90);
//   static Color get onSurfaceVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 30);

//   // Surface container colors
//   static Color get surfaceDim => M3RefPalette.getColor(M3RefPalette.neutral, 87);
//   static Color get surfaceBright => M3RefPalette.getColor(M3RefPalette.neutral, 98);
//   static Color get surfaceContainerLowest => M3RefPalette.getColor(M3RefPalette.neutral, 100);
//   static Color get surfaceContainerLow => M3RefPalette.getColor(M3RefPalette.neutral, 96);
//   static Color get surfaceContainer => M3RefPalette.getColor(M3RefPalette.neutral, 94);
//   static Color get surfaceContainerHigh => M3RefPalette.getColor(M3RefPalette.neutral, 92);
//   static Color get surfaceContainerHighest => M3RefPalette.getColor(M3RefPalette.neutral, 90);

//   // Outline colors
//   static Color get outline => M3RefPalette.getColor(M3RefPalette.neutralVariant, 50);
//   static Color get outlineVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 80);

//   // Inverse colors
//   static Color get inverseSurface => M3RefPalette.getColor(M3RefPalette.neutral, 20);
//   static Color get onInverseSurface => M3RefPalette.getColor(M3RefPalette.neutral, 95);
//   static Color get inversePrimary => M3RefPalette.getColor(M3RefPalette.primary, 80);

//   // Surface tint
//   static Color get surfaceTint => primary;

//   // Scrim
//   static Color get scrim => M3RefPalette.getColor(M3RefPalette.neutral, 0);

//   // Shadow
//   static Color get shadow => M3RefPalette.getColor(M3RefPalette.neutral, 0);

//   /// Convert to Flutter ColorScheme for light theme
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

// /// Material Design 3 Dark System Color Tokens
// @immutable 
// class M3SysColorDark {
//   const M3SysColorDark._();

//   // Primary colors
//   static Color get primary => M3RefPalette.getColor(M3RefPalette.primary, 80);
//   static Color get onPrimary => M3RefPalette.getColor(M3RefPalette.primary, 20);
//   static Color get primaryContainer => M3RefPalette.getColor(M3RefPalette.primary, 30);
//   static Color get onPrimaryContainer => M3RefPalette.getColor(M3RefPalette.primary, 90);

//   // Secondary colors
//   static Color get secondary => M3RefPalette.getColor(M3RefPalette.secondary, 80);
//   static Color get onSecondary => M3RefPalette.getColor(M3RefPalette.secondary, 20);
//   static Color get secondaryContainer => M3RefPalette.getColor(M3RefPalette.secondary, 30);
//   static Color get onSecondaryContainer => M3RefPalette.getColor(M3RefPalette.secondary, 90);

//   // Tertiary colors
//   static Color get tertiary => M3RefPalette.getColor(M3RefPalette.tertiary, 80);
//   static Color get onTertiary => M3RefPalette.getColor(M3RefPalette.tertiary, 20);
//   static Color get tertiaryContainer => M3RefPalette.getColor(M3RefPalette.tertiary, 30);
//   static Color get onTertiaryContainer => M3RefPalette.getColor(M3RefPalette.tertiary, 90);

//   // Error colors
//   static Color get error => M3RefPalette.getColor(M3RefPalette.error, 80);
//   static Color get onError => M3RefPalette.getColor(M3RefPalette.error, 20);
//   static Color get errorContainer => M3RefPalette.getColor(M3RefPalette.error, 30);
//   static Color get onErrorContainer => M3RefPalette.getColor(M3RefPalette.error, 90);

//   // Surface colors
//   static Color get surface => M3RefPalette.getColor(M3RefPalette.neutral, 10);
//   static Color get onSurface => M3RefPalette.getColor(M3RefPalette.neutral, 90);
//   static Color get surfaceVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 30);
//   static Color get onSurfaceVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 80);

//   // Surface container colors
//   static Color get surfaceDim => M3RefPalette.getColor(M3RefPalette.neutral, 6);
//   static Color get surfaceBright => M3RefPalette.getColor(M3RefPalette.neutral, 24);
//   static Color get surfaceContainerLowest => M3RefPalette.getColor(M3RefPalette.neutral, 4);
//   static Color get surfaceContainerLow => M3RefPalette.getColor(M3RefPalette.neutral, 10);
//   static Color get surfaceContainer => M3RefPalette.getColor(M3RefPalette.neutral, 12);
//   static Color get surfaceContainerHigh => M3RefPalette.getColor(M3RefPalette.neutral, 17);
//   static Color get surfaceContainerHighest => M3RefPalette.getColor(M3RefPalette.neutral, 22);

//   // Outline colors
//   static Color get outline => M3RefPalette.getColor(M3RefPalette.neutralVariant, 60);
//   static Color get outlineVariant => M3RefPalette.getColor(M3RefPalette.neutralVariant, 30);

//   // Inverse colors
//   static Color get inverseSurface => M3RefPalette.getColor(M3RefPalette.neutral, 90);
//   static Color get onInverseSurface => M3RefPalette.getColor(M3RefPalette.neutral, 20);
//   static Color get inversePrimary => M3RefPalette.getColor(M3RefPalette.primary, 40);

//   // Surface tint
//   static Color get surfaceTint => primary;

//   // Scrim
//   static Color get scrim => M3RefPalette.getColor(M3RefPalette.neutral, 0);

//   // Shadow
//   static Color get shadow => M3RefPalette.getColor(M3RefPalette.neutral, 0);

//   /// Convert to Flutter ColorScheme for dark theme
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