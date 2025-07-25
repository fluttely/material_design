// import 'package:flutter/material.dart';
// // Assuming IM3Token is defined elsewhere, e.g.:
// // abstract interface class IM3Token<T> { T get value; }
// import 'package:material_design/material_design.dart';

// /// {@template im3_sys_color_token}
// /// Represents the contract for a Material 3 system color token.
// ///
// /// This interface establishes the essential properties required for any object
// /// that defines a semantic color role. It ensures that all tokens, whether for
// /// light or dark themes, can be processed consistently.
// /// {@endtemplate}
// @immutable
// abstract interface class IM3ColorSchemeToken implements IM3Token<Color> {
//   /// The concrete [Color] value for this token.
//   @override
//   Color get value;

//   /// The [Brightness] mode this color is designed for (e.g., [Brightness.light]).
//   Brightness get brightness;

//   /// Whether this color role is intended for use as a container background.
//   bool get isContainer;

//   /// Whether this color role is for content (text/icons) placed on top of
//   /// a corresponding container color.
//   bool get isOnColor;
// }

// /// {@template m3_sys_color_token}
// /// Defines the semantic color roles for the Material 3 **light** theme.
// ///
// /// System color tokens bridge the gap between raw reference palette values and
// /// their applied meaning in the UI. Each token represents a specific, named role
// /// in the color system (e.g., `primary`, `onSurface`).
// /// {@endtemplate}
// enum M3LightColorSchemeToken implements IM3ColorSchemeToken {
//   // === PRIMARY ===
//   /// The primary brand color, used for key components like prominent buttons.
//   primary(M3RefPalette.primary, 40),

//   /// A color for text and icons displayed on top of the primary color.
//   onPrimary(M3RefPalette.primary, 100, isOnColor: true),

//   /// A less-emphasized container color for primary-branded elements.
//   primaryContainer(M3RefPalette.primary, 90, isContainer: true),

//   /// A color for text and icons on top of the primary container color.
//   onPrimaryContainer(M3RefPalette.primary, 10, isOnColor: true),

//   // === SECONDARY ===
//   /// The secondary brand color, used for less prominent components.
//   secondary(M3RefPalette.secondary, 40),

//   /// A color for text and icons on top of the secondary color.
//   onSecondary(M3RefPalette.secondary, 100, isOnColor: true),

//   /// A less-emphasized container color for secondary-branded elements.
//   secondaryContainer(M3RefPalette.secondary, 90, isContainer: true),

//   /// A color for text and icons on top of the secondary container color.
//   onSecondaryContainer(M3RefPalette.secondary, 10, isOnColor: true),

//   // === TERTIARY ===
//   /// The tertiary brand color, used for contrasting accents.
//   tertiary(M3RefPalette.tertiary, 40),

//   /// A color for text and icons on top of the tertiary color.
//   onTertiary(M3RefPalette.tertiary, 100, isOnColor: true),

//   /// A less-emphasized container color for tertiary-branded elements.
//   tertiaryContainer(M3RefPalette.tertiary, 90, isContainer: true),

//   /// A color for text and icons on top of the tertiary container color.
//   onTertiaryContainer(M3RefPalette.tertiary, 10, isOnColor: true),

//   // === ERROR ===
//   /// The error color, used for indicating errors and destructive actions.
//   error(M3RefPalette.error, 40),

//   /// A color for text and icons on top of the error color.
//   onError(M3RefPalette.error, 100, isOnColor: true),

//   /// A container color for error-related UI elements.
//   errorContainer(M3RefPalette.error, 90, isContainer: true),

//   /// A color for text and icons on top of the error container color.
//   onErrorContainer(M3RefPalette.error, 10, isOnColor: true),

//   // === SURFACE & BACKGROUND ===
//   /// The default color for backgrounds and component surfaces.
//   surface(M3RefPalette.neutral, 99),

//   /// A color for text and icons on top of the surface color.
//   onSurface(M3RefPalette.neutral, 10, isOnColor: true),

//   /// A variant of the surface color for subtle differentiation.
//   surfaceVariant(M3RefPalette.neutralVariant, 90),

//   /// A color for text and icons on top of the surface variant color.
//   onSurfaceVariant(M3RefPalette.neutralVariant, 30, isOnColor: true),

//   /// A dimmed surface color for backgrounds that recede.
//   surfaceDim(M3RefPalette.neutral, 87, isContainer: true),

//   /// A bright surface color for elevated or highlighted backgrounds.
//   surfaceBright(M3RefPalette.neutral, 98, isContainer: true),

//   /// The surface color with the lowest emphasis.
//   surfaceContainerLowest(M3RefPalette.neutral, 100, isContainer: true),

//   /// A surface color with low emphasis.
//   surfaceContainerLow(M3RefPalette.neutral, 96, isContainer: true),

//   /// The default surface container color.
//   surfaceContainer(M3RefPalette.neutral, 94, isContainer: true),

//   /// A surface color with high emphasis.
//   surfaceContainerHigh(M3RefPalette.neutral, 92, isContainer: true),

//   /// The surface color with the highest emphasis.
//   surfaceContainerHighest(M3RefPalette.neutral, 90, isContainer: true),

//   // === OUTLINE ===
//   /// The primary color for borders and dividers.
//   outline(M3RefPalette.neutralVariant, 50),

//   /// A subtle color for decorative dividers or outlines.
//   outlineVariant(M3RefPalette.neutralVariant, 80),

//   // === INVERSE ===
//   /// A surface color for high-contrast, inverted elements.
//   inverseSurface(M3RefPalette.neutral, 20, isContainer: true),

//   /// A color for text and icons on top of the inverse surface color.
//   onInverseSurface(M3RefPalette.neutral, 95, isOnColor: true),

//   /// An inverted primary color for high-contrast primary elements.
//   inversePrimary(M3RefPalette.primary, 80),

//   // === SPECIAL ===
//   /// A color used to tint elevated surfaces, derived from the primary color.
//   surfaceTint(M3RefPalette.primary, 40),

//   /// A color for scrims, used to obscure content behind modal elements.
//   scrim(M3RefPalette.neutral, 0),

//   /// The color used for elevation shadows.
//   shadow(M3RefPalette.neutral, 0);

//   /// Creates a light theme system color token.
//   const M3LightColorSchemeToken(
//     this._palette,
//     this._tone, {
//     this.isContainer = false,
//     this.isOnColor = false,
//   });

//   final Map<int, Color> _palette;
//   final int _tone;

//   @override
//   final bool isContainer;
//   @override
//   final bool isOnColor;
//   @override
//   Brightness get brightness => Brightness.light;
//   @override
//   Color get value => M3RefPalette.getColor(_palette, _tone);

//   /// Converts the light theme system colors to a Flutter [ColorScheme].
//   ///
//   /// This utility method creates a Material Design 3 compliant [ColorScheme]
//   /// that can be used directly with Flutter's [ThemeData].
//   static ColorScheme toColorScheme() {
//     return ColorScheme.light(
//       primary: primary.value,
//       onPrimary: onPrimary.value,
//       primaryContainer: primaryContainer.value,
//       onPrimaryContainer: onPrimaryContainer.value,
//       secondary: secondary.value,
//       onSecondary: onSecondary.value,
//       secondaryContainer: secondaryContainer.value,
//       onSecondaryContainer: onSecondaryContainer.value,
//       tertiary: tertiary.value,
//       onTertiary: onTertiary.value,
//       tertiaryContainer: tertiaryContainer.value,
//       onTertiaryContainer: onTertiaryContainer.value,
//       error: error.value,
//       onError: onError.value,
//       errorContainer: errorContainer.value,
//       onErrorContainer: onErrorContainer.value,
//       surface: surface.value,
//       onSurface: onSurface.value,
//       surfaceContainerHighest: surfaceContainerHighest.value,
//       onSurfaceVariant: onSurfaceVariant.value,
//       outline: outline.value,
//       outlineVariant: outlineVariant.value,
//       shadow: shadow.value,
//       scrim: scrim.value,
//       inverseSurface: inverseSurface.value,
//       onInverseSurface: onInverseSurface.value,
//       inversePrimary: inversePrimary.value,
//       surfaceTint: surfaceTint.value,
//     );
//   }
// }

// /// {@template m3_sys_color_dark_token}
// /// Defines the semantic color roles for the Material 3 **dark** theme.
// ///
// /// Dark theme color tokens provide appropriate color mappings for dark
// /// interfaces, ensuring accessibility and visual hierarchy are maintained in
// /// low-light environments.
// /// {@endtemplate}
// enum M3DarkColorSchemeToken implements IM3ColorSchemeToken {
//   // === PRIMARY ===
//   primary(M3RefPalette.primary, 80),
//   onPrimary(M3RefPalette.primary, 20, isOnColor: true),
//   primaryContainer(M3RefPalette.primary, 30, isContainer: true),
//   onPrimaryContainer(M3RefPalette.primary, 90, isOnColor: true),

//   // === SECONDARY ===
//   secondary(M3RefPalette.secondary, 80),
//   onSecondary(M3RefPalette.secondary, 20, isOnColor: true),
//   secondaryContainer(M3RefPalette.secondary, 30, isContainer: true),
//   onSecondaryContainer(M3RefPalette.secondary, 90, isOnColor: true),

//   // === TERTIARY ===
//   tertiary(M3RefPalette.tertiary, 80),
//   onTertiary(M3RefPalette.tertiary, 20, isOnColor: true),
//   tertiaryContainer(M3RefPalette.tertiary, 30, isContainer: true),
//   onTertiaryContainer(M3RefPalette.tertiary, 90, isOnColor: true),

//   // === ERROR ===
//   error(M3RefPalette.error, 80),
//   onError(M3RefPalette.error, 20, isOnColor: true),
//   errorContainer(M3RefPalette.error, 30, isContainer: true),
//   onErrorContainer(M3RefPalette.error, 90, isOnColor: true),

//   // === SURFACE & BACKGROUND ===
//   surface(M3RefPalette.neutral, 10),
//   onSurface(M3RefPalette.neutral, 90, isOnColor: true),
//   surfaceVariant(M3RefPalette.neutralVariant, 30),
//   onSurfaceVariant(M3RefPalette.neutralVariant, 80, isOnColor: true),
//   surfaceDim(M3RefPalette.neutral, 6, isContainer: true),
//   surfaceBright(M3RefPalette.neutral, 24, isContainer: true),
//   surfaceContainerLowest(M3RefPalette.neutral, 4, isContainer: true),
//   surfaceContainerLow(M3RefPalette.neutral, 10, isContainer: true),
//   surfaceContainer(M3RefPalette.neutral, 12, isContainer: true),
//   surfaceContainerHigh(M3RefPalette.neutral, 17, isContainer: true),
//   surfaceContainerHighest(M3RefPalette.neutral, 22, isContainer: true),

//   // === OUTLINE ===
//   outline(M3RefPalette.neutralVariant, 60),
//   outlineVariant(M3RefPalette.neutralVariant, 30),

//   // === INVERSE ===
//   inverseSurface(M3RefPalette.neutral, 90, isContainer: true),
//   onInverseSurface(M3RefPalette.neutral, 20, isOnColor: true),
//   inversePrimary(M3RefPalette.primary, 40),

//   // === SPECIAL ===
//   surfaceTint(M3RefPalette.primary, 80),
//   scrim(M3RefPalette.neutral, 0),
//   shadow(M3RefPalette.neutral, 0);

//   /// Creates a dark theme system color token.
//   const M3DarkColorSchemeToken(
//     this._palette,
//     this._tone, {
//     this.isContainer = false,
//     this.isOnColor = false,
//   });

//   final Map<int, Color> _palette;
//   final int _tone;

//   @override
//   final bool isContainer;
//   @override
//   final bool isOnColor;
//   @override
//   Brightness get brightness => Brightness.dark;
//   @override
//   Color get value => M3RefPalette.getColor(_palette, _tone);

//   /// Converts the dark theme system colors to a Flutter [ColorScheme].
//   static ColorScheme toColorScheme() {
//     return ColorScheme.dark(
//       primary: primary.value,
//       onPrimary: onPrimary.value,
//       primaryContainer: primaryContainer.value,
//       onPrimaryContainer: onPrimaryContainer.value,
//       secondary: secondary.value,
//       onSecondary: onSecondary.value,
//       secondaryContainer: secondaryContainer.value,
//       onSecondaryContainer: onSecondaryContainer.value,
//       tertiary: tertiary.value,
//       onTertiary: onTertiary.value,
//       tertiaryContainer: tertiaryContainer.value,
//       onTertiaryContainer: onTertiaryContainer.value,
//       error: error.value,
//       onError: onError.value,
//       errorContainer: errorContainer.value,
//       onErrorContainer: onErrorContainer.value,
//       surface: surface.value,
//       onSurface: onSurface.value,
//       surfaceContainerHighest: surfaceContainerHighest.value,
//       onSurfaceVariant: onSurfaceVariant.value,
//       outline: outline.value,
//       outlineVariant: outlineVariant.value,
//       shadow: shadow.value,
//       scrim: scrim.value,
//       inverseSurface: inverseSurface.value,
//       onInverseSurface: onInverseSurface.value,
//       inversePrimary: inversePrimary.value,
//       surfaceTint: surfaceTint.value,
//     );
//   }
// }

// /// Provides utility methods for working with any [IM3ColorSchemeToken].
// extension IM3ColorSchemeTokenUtils on IM3ColorSchemeToken {
//   /// Returns the corresponding "on" color for this color token.
//   ///
//   /// For example, if this token is `primary`, this getter returns `onPrimary`.
//   /// If this token is already an "on" color (e.g., `onSurface`), it returns itself.
//   /// Returns `null` if no corresponding "on" color is defined.
//   IM3ColorSchemeToken? get onColor {
//     if (brightness == Brightness.light) {
//       return switch (this) {
//         M3LightColorSchemeToken.primary => M3LightColorSchemeToken.onPrimary,
//         M3LightColorSchemeToken.primaryContainer =>
//           M3LightColorSchemeToken.onPrimaryContainer,
//         M3LightColorSchemeToken.secondary =>
//           M3LightColorSchemeToken.onSecondary,
//         M3LightColorSchemeToken.secondaryContainer =>
//           M3LightColorSchemeToken.onSecondaryContainer,
//         M3LightColorSchemeToken.tertiary => M3LightColorSchemeToken.onTertiary,
//         M3LightColorSchemeToken.tertiaryContainer =>
//           M3LightColorSchemeToken.onTertiaryContainer,
//         M3LightColorSchemeToken.error => M3LightColorSchemeToken.onError,
//         M3LightColorSchemeToken.errorContainer =>
//           M3LightColorSchemeToken.onErrorContainer,
//         M3LightColorSchemeToken.surface => M3LightColorSchemeToken.onSurface,
//         M3LightColorSchemeToken.surfaceVariant =>
//           M3LightColorSchemeToken.onSurfaceVariant,
//         M3LightColorSchemeToken.inverseSurface =>
//           M3LightColorSchemeToken.onInverseSurface,
//         _ => isOnColor ? this : null,
//       };
//     } else {
//       return switch (this) {
//         M3DarkColorSchemeToken.primary => M3DarkColorSchemeToken.onPrimary,
//         M3DarkColorSchemeToken.primaryContainer =>
//           M3DarkColorSchemeToken.onPrimaryContainer,
//         M3DarkColorSchemeToken.secondary => M3DarkColorSchemeToken.onSecondary,
//         M3DarkColorSchemeToken.secondaryContainer =>
//           M3DarkColorSchemeToken.onSecondaryContainer,
//         M3DarkColorSchemeToken.tertiary => M3DarkColorSchemeToken.onTertiary,
//         M3DarkColorSchemeToken.tertiaryContainer =>
//           M3DarkColorSchemeToken.onTertiaryContainer,
//         M3DarkColorSchemeToken.error => M3DarkColorSchemeToken.onError,
//         M3DarkColorSchemeToken.errorContainer =>
//           M3DarkColorSchemeToken.onErrorContainer,
//         M3DarkColorSchemeToken.surface => M3DarkColorSchemeToken.onSurface,
//         M3DarkColorSchemeToken.surfaceVariant =>
//           M3DarkColorSchemeToken.onSurfaceVariant,
//         M3DarkColorSchemeToken.inverseSurface =>
//           M3DarkColorSchemeToken.onInverseSurface,
//         _ => isOnColor ? this : null,
//       };
//     }
//   }

//   /// Creates a record containing this color and its corresponding "on" color.
//   ///
//   /// Returns a `(background, foreground)` pair. Returns `null` if this color
//   /// does not have a corresponding "on" color.
//   ({Color background, Color foreground})? get colorPair {
//     final onColorToken = onColor;
//     if (onColorToken == null) return null;

//     return (
//       background: value,
//       foreground: onColorToken.value,
//     );
//   }

//   /// Checks if this color has sufficient contrast with another color.
//   ///
//   /// This uses a simplified contrast calculation. For production applications,
//   /// it is recommended to use a more robust WCAG contrast ratio calculation.
//   /// A ratio of 4.5:1 is used as the threshold for normal text.
//   bool hasContrastWith(Color other) {
//     final thisLuminance = value.computeLuminance();
//     final otherLuminance = other.computeLuminance();
//     final contrast = (thisLuminance + 0.05) / (otherLuminance + 0.05);
//     return contrast >= 4.5 || (1 / contrast) >= 4.5;
//   }
// }

// /// Provides theme-aware color selection utilities on [BuildContext].
// extension IM3ColorSchemeTokenContext on BuildContext {
//   /// Gets the appropriate system color token based on the current theme's brightness.
//   ///
//   /// Pass the light and dark theme tokens, and this will return the correct
//   /// one for the active theme.
//   IM3ColorSchemeToken getSystemColor(
//       M3LightColorSchemeToken light, M3DarkColorSchemeToken dark) {
//     return Theme.of(this).brightness == Brightness.light ? light : dark;
//   }

//   /// Gets a system color value that adapts to the current theme.
//   ///
//   /// This is a convenience method that returns the [Color] value of the
//   /// appropriate theme-specific token.
//   Color getAdaptiveSystemColor(
//       M3LightColorSchemeToken light, M3DarkColorSchemeToken dark) {
//     return getSystemColor(light, dark).value;
//   }
// }
