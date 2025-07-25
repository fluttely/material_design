// import 'package:flutter/material.dart';

// import '../../ref/palette/old/palette.dart';

// /// System color tokens for Material Design 3.
// ///
// /// These semantic color roles are derived from reference palettes and
// /// provide meaning and context to UI elements.
// ///
// /// Specification: https://m3.material.io/styles/color/the-color-system/color-roles
// abstract class MdSysColor {
//   // Primary color tokens
//   /// Token: md.sys.color.primary
//   static Color get primary => MdRefPalette.getColor('primary', 40);

//   /// Token: md.sys.color.on-primary
//   static Color get onPrimary => MdRefPalette.getColor('primary', 100);

//   /// Token: md.sys.color.primary-container
//   static Color get primaryContainer => MdRefPalette.getColor('primary', 90);

//   /// Token: md.sys.color.on-primary-container
//   static Color get onPrimaryContainer => MdRefPalette.getColor('primary', 10);

//   // Secondary color tokens
//   /// Token: md.sys.color.secondary
//   static Color get secondary => MdRefPalette.getColor('secondary', 40);

//   /// Token: md.sys.color.on-secondary
//   static Color get onSecondary => MdRefPalette.getColor('secondary', 100);

//   /// Token: md.sys.color.secondary-container
//   static Color get secondaryContainer => MdRefPalette.getColor('secondary', 90);

//   /// Token: md.sys.color.on-secondary-container
//   static Color get onSecondaryContainer =>
//       MdRefPalette.getColor('secondary', 10);

//   // Tertiary color tokens
//   /// Token: md.sys.color.tertiary
//   static Color get tertiary => MdRefPalette.getColor('tertiary', 40);

//   /// Token: md.sys.color.on-tertiary
//   static Color get onTertiary => MdRefPalette.getColor('tertiary', 100);

//   /// Token: md.sys.color.tertiary-container
//   static Color get tertiaryContainer => MdRefPalette.getColor('tertiary', 90);

//   /// Token: md.sys.color.on-tertiary-container
//   static Color get onTertiaryContainer => MdRefPalette.getColor('tertiary', 10);

//   // Error color tokens
//   /// Token: md.sys.color.error
//   static Color get error => MdRefPalette.getColor('error', 40);

//   /// Token: md.sys.color.on-error
//   static Color get onError => MdRefPalette.getColor('error', 100);

//   /// Token: md.sys.color.error-container
//   static Color get errorContainer => MdRefPalette.getColor('error', 90);

//   /// Token: md.sys.color.on-error-container
//   static Color get onErrorContainer => MdRefPalette.getColor('error', 10);

//   // Surface color tokens
//   /// Token: md.sys.color.surface
//   static Color get surface => MdRefPalette.getColor('neutral', 99);

//   /// Token: md.sys.color.on-surface
//   static Color get onSurface => MdRefPalette.getColor('neutral', 10);

//   /// Token: md.sys.color.surface-variant
//   static Color get surfaceVariant =>
//       MdRefPalette.getColor('neutralVariant', 90);

//   /// Token: md.sys.color.on-surface-variant
//   static Color get onSurfaceVariant =>
//       MdRefPalette.getColor('neutralVariant', 30);

//   // Surface container color tokens
//   /// Token: md.sys.color.surface-dim
//   static Color get surfaceDim => MdRefPalette.getColor('neutral', 87);

//   /// Token: md.sys.color.surface-bright
//   static Color get surfaceBright => MdRefPalette.getColor('neutral', 98);

//   /// Token: md.sys.color.surface-container-lowest
//   static Color get surfaceContainerLowest =>
//       MdRefPalette.getColor('neutral', 100);

//   /// Token: md.sys.color.surface-container-low
//   static Color get surfaceContainerLow => MdRefPalette.getColor('neutral', 96);

//   /// Token: md.sys.color.surface-container
//   static Color get surfaceContainer => MdRefPalette.getColor('neutral', 94);

//   /// Token: md.sys.color.surface-container-high
//   static Color get surfaceContainerHigh => MdRefPalette.getColor('neutral', 92);

//   /// Token: md.sys.color.surface-container-highest
//   static Color get surfaceContainerHighest =>
//       MdRefPalette.getColor('neutral', 90);

//   // Outline color tokens
//   /// Token: md.sys.color.outline
//   static Color get outline => MdRefPalette.getColor('neutralVariant', 50);

//   /// Token: md.sys.color.outline-variant
//   static Color get outlineVariant =>
//       MdRefPalette.getColor('neutralVariant', 80);

//   // Inverse color tokens
//   /// Token: md.sys.color.inverse-surface
//   static Color get inverseSurface => MdRefPalette.getColor('neutral', 20);

//   /// Token: md.sys.color.inverse-on-surface
//   static Color get inverseOnSurface => MdRefPalette.getColor('neutral', 95);

//   /// Token: md.sys.color.inverse-primary
//   static Color get inversePrimary => MdRefPalette.getColor('primary', 80);

//   // Special tokens
//   /// Token: md.sys.color.surface-tint
//   static Color get surfaceTint => primary;

//   /// Token: md.sys.color.scrim
//   static Color get scrim => MdRefPalette.getColor('neutral', 0);

//   /// Token: md.sys.color.shadow
//   static Color get shadow => MdRefPalette.getColor('neutral', 0);

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
//       onInverseSurface: inverseOnSurface,
//       inversePrimary: inversePrimary,
//       surfaceTint: surfaceTint,
//     );
//   }
// }

// /// System color tokens for Material Design 3 dark theme.
// abstract class MdSysColorDark {
//   // Primary color tokens
//   /// Token: md.sys.color.primary (dark)
//   static Color get primary => MdRefPalette.getColor('primary', 80);

//   /// Token: md.sys.color.on-primary (dark)
//   static Color get onPrimary => MdRefPalette.getColor('primary', 20);

//   /// Token: md.sys.color.primary-container (dark)
//   static Color get primaryContainer => MdRefPalette.getColor('primary', 30);

//   /// Token: md.sys.color.on-primary-container (dark)
//   static Color get onPrimaryContainer => MdRefPalette.getColor('primary', 90);

//   // Secondary color tokens
//   /// Token: md.sys.color.secondary (dark)
//   static Color get secondary => MdRefPalette.getColor('secondary', 80);

//   /// Token: md.sys.color.on-secondary (dark)
//   static Color get onSecondary => MdRefPalette.getColor('secondary', 20);

//   /// Token: md.sys.color.secondary-container (dark)
//   static Color get secondaryContainer => MdRefPalette.getColor('secondary', 30);

//   /// Token: md.sys.color.on-secondary-container (dark)
//   static Color get onSecondaryContainer =>
//       MdRefPalette.getColor('secondary', 90);

//   // Tertiary color tokens
//   /// Token: md.sys.color.tertiary (dark)
//   static Color get tertiary => MdRefPalette.getColor('tertiary', 80);

//   /// Token: md.sys.color.on-tertiary (dark)
//   static Color get onTertiary => MdRefPalette.getColor('tertiary', 20);

//   /// Token: md.sys.color.tertiary-container (dark)
//   static Color get tertiaryContainer => MdRefPalette.getColor('tertiary', 30);

//   /// Token: md.sys.color.on-tertiary-container (dark)
//   static Color get onTertiaryContainer => MdRefPalette.getColor('tertiary', 90);

//   // Error color tokens
//   /// Token: md.sys.color.error (dark)
//   static Color get error => MdRefPalette.getColor('error', 80);

//   /// Token: md.sys.color.on-error (dark)
//   static Color get onError => MdRefPalette.getColor('error', 20);

//   /// Token: md.sys.color.error-container (dark)
//   static Color get errorContainer => MdRefPalette.getColor('error', 30);

//   /// Token: md.sys.color.on-error-container (dark)
//   static Color get onErrorContainer => MdRefPalette.getColor('error', 90);

//   // Surface color tokens
//   /// Token: md.sys.color.surface (dark)
//   static Color get surface => MdRefPalette.getColor('neutral', 10);

//   /// Token: md.sys.color.on-surface (dark)
//   static Color get onSurface => MdRefPalette.getColor('neutral', 90);

//   /// Token: md.sys.color.surface-variant (dark)
//   static Color get surfaceVariant =>
//       MdRefPalette.getColor('neutralVariant', 30);

//   /// Token: md.sys.color.on-surface-variant (dark)
//   static Color get onSurfaceVariant =>
//       MdRefPalette.getColor('neutralVariant', 80);

//   // Surface container color tokens
//   /// Token: md.sys.color.surface-dim (dark)
//   static Color get surfaceDim => MdRefPalette.getColor('neutral', 6);

//   /// Token: md.sys.color.surface-bright (dark)
//   static Color get surfaceBright => MdRefPalette.getColor('neutral', 24);

//   /// Token: md.sys.color.surface-container-lowest (dark)
//   static Color get surfaceContainerLowest =>
//       MdRefPalette.getColor('neutral', 4);

//   /// Token: md.sys.color.surface-container-low (dark)
//   static Color get surfaceContainerLow => MdRefPalette.getColor('neutral', 10);

//   /// Token: md.sys.color.surface-container (dark)
//   static Color get surfaceContainer => MdRefPalette.getColor('neutral', 12);

//   /// Token: md.sys.color.surface-container-high (dark)
//   static Color get surfaceContainerHigh => MdRefPalette.getColor('neutral', 17);

//   /// Token: md.sys.color.surface-container-highest (dark)
//   static Color get surfaceContainerHighest =>
//       MdRefPalette.getColor('neutral', 22);

//   // Outline color tokens
//   /// Token: md.sys.color.outline (dark)
//   static Color get outline => MdRefPalette.getColor('neutralVariant', 60);

//   /// Token: md.sys.color.outline-variant (dark)
//   static Color get outlineVariant =>
//       MdRefPalette.getColor('neutralVariant', 30);

//   // Inverse color tokens
//   /// Token: md.sys.color.inverse-surface (dark)
//   static Color get inverseSurface => MdRefPalette.getColor('neutral', 90);

//   /// Token: md.sys.color.inverse-on-surface (dark)
//   static Color get inverseOnSurface => MdRefPalette.getColor('neutral', 20);

//   /// Token: md.sys.color.inverse-primary (dark)
//   static Color get inversePrimary => MdRefPalette.getColor('primary', 40);

//   // Special tokens
//   /// Token: md.sys.color.surface-tint (dark)
//   static Color get surfaceTint => primary;

//   /// Token: md.sys.color.scrim (dark)
//   static Color get scrim => MdRefPalette.getColor('neutral', 0);

//   /// Token: md.sys.color.shadow (dark)
//   static Color get shadow => MdRefPalette.getColor('neutral', 0);

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
//       onInverseSurface: inverseOnSurface,
//       inversePrimary: inversePrimary,
//       surfaceTint: surfaceTint,
//     );
//   }
// }
