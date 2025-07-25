// import 'package:flutter/material.dart';
// import 'package:material_design/material_design.dart';

// /// A comprehensive Material Design 3 theme builder that integrates all tokens.
// ///
// /// This class provides a complete theming solution that combines all the M3
// /// design tokens (color, typography, shape, elevation, spacing, etc.) into
// /// a cohesive theme system that follows Flutter's ThemeData conventions.
// @immutable
// class M3Theme {
//   /// The color scheme for this theme.
//   final ColorScheme colorScheme;

//   /// The text theme for this theme.
//   final TextTheme textTheme;

//   /// Whether this is a dark theme.
//   final bool isDark;

//   /// Custom seed color for dynamic theming.
//   final Color? seedColor;

//   /// Visual density for the theme.
//   final VisualDensity visualDensity;

//   const M3Theme({
//     required this.colorScheme,
//     required this.textTheme,
//     required this.isDark,
//     this.seedColor,
//     this.visualDensity = VisualDensity.standard,
//   });

//   /// Creates a light Material Design 3 theme.
//   factory M3Theme.light({
//     Color? seedColor,
//     TextTheme? textTheme,
//     VisualDensity visualDensity = VisualDensity.standard,
//   }) {
//     final colorScheme = seedColor != null
//         ? ColorScheme.fromSeed(
//             seedColor: seedColor,
//             brightness: Brightness.light,
//           )
//         : _defaultLightColorScheme;

//     return M3Theme(
//       colorScheme: colorScheme,
//       textTheme: textTheme ?? _buildTextTheme(colorScheme),
//       isDark: false,
//       seedColor: seedColor,
//       visualDensity: visualDensity,
//     );
//   }

//   /// Creates a dark Material Design 3 theme.
//   factory M3Theme.dark({
//     Color? seedColor,
//     TextTheme? textTheme,
//     VisualDensity visualDensity = VisualDensity.standard,
//   }) {
//     final colorScheme = seedColor != null
//         ? ColorScheme.fromSeed(
//             seedColor: seedColor,
//             brightness: Brightness.dark,
//           )
//         : _defaultDarkColorScheme;

//     return M3Theme(
//       colorScheme: colorScheme,
//       textTheme: textTheme ?? _buildTextTheme(colorScheme),
//       isDark: true,
//       seedColor: seedColor,
//       visualDensity: visualDensity,
//     );
//   }

//   /// Creates a high contrast variant of the theme.
//   M3Theme toHighContrast() {
//     return M3Theme(
//       colorScheme: _createHighContrastColorScheme(colorScheme),
//       textTheme: _createHighContrastTextTheme(textTheme),
//       isDark: isDark,
//       seedColor: seedColor,
//       visualDensity: visualDensity,
//     );
//   }

//   /// Converts this M3Theme to a Flutter ThemeData.
//   ThemeData toThemeData() {
//     return ThemeData(
//       useMaterial3: true,
//       colorScheme: colorScheme,
//       textTheme: textTheme,
//       visualDensity: visualDensity,

//       // App Bar Theme
//       appBarTheme: AppBarTheme(
//         backgroundColor: colorScheme.surface,
//         foregroundColor: colorScheme.onSurface,
//         elevation: M3ComponentElevationToken.appBar.dp,
//         titleTextStyle: textTheme.titleLarge?.copyWith(
//           color: colorScheme.onSurface,
//         ),
//       ),

//       // Card Theme
//       cardTheme: CardThemeData(
//         color: M3TonalColor.calculateSurfaceColor(
//           surface: colorScheme.surface,
//           surfaceTint: colorScheme.surfaceTint,
//           elevation: M3ComponentElevationToken.card.dp,
//         ),
//         elevation: M3ComponentElevationToken.card.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: M3BorderRadiusToken.medium.value,
//         ),
//         shadowColor: colorScheme.shadow,
//         surfaceTintColor: colorScheme.surfaceTint,
//       ),

//       // Elevated Button Theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: colorScheme.primary,
//           foregroundColor: colorScheme.onPrimary,
//           elevation: M3ComponentElevationToken.elevatedButton.dp,
//           shape: RoundedRectangleBorder(
//             borderRadius: M3BorderRadiusToken.large.value,
//           ),
//           textStyle: textTheme.labelLarge,
//           padding: EdgeInsets.symmetric(
//             horizontal: M3SpacingToken.space24.value,
//             vertical: M3SpacingToken.space12.value,
//           ),
//         ),
//       ),

//       // Outlined Button Theme
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           foregroundColor: colorScheme.primary,
//           side: BorderSide(
//             color: colorScheme.outline,
//             width: M3BorderToken.thin.value,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: M3BorderRadiusToken.large.value,
//           ),
//           textStyle: textTheme.labelLarge,
//           padding: EdgeInsets.symmetric(
//             horizontal: M3SpacingToken.space24.value,
//             vertical: M3SpacingToken.space12.value,
//           ),
//         ),
//       ),

//       // Text Button Theme
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: colorScheme.primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: M3BorderRadiusToken.large.value,
//           ),
//           textStyle: textTheme.labelLarge,
//           padding: EdgeInsets.symmetric(
//             horizontal: M3SpacingToken.space12.value,
//             vertical: M3SpacingToken.space12.value,
//           ),
//         ),
//       ),

//       // FAB Theme
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: colorScheme.primaryContainer,
//         foregroundColor: colorScheme.onPrimaryContainer,
//         elevation: M3ComponentElevationToken.fab.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: M3BorderRadiusToken.large.value,
//         ),
//       ),

//       // Input Decoration Theme
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: colorScheme.surfaceContainerHighest,
//         border: OutlineInputBorder(
//           borderRadius: M3BorderRadiusToken.extraSmall.value,
//           borderSide: BorderSide(
//             color: colorScheme.outline,
//             width: M3BorderToken.thin.value,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: M3BorderRadiusToken.extraSmall.value,
//           borderSide: BorderSide(
//             color: colorScheme.outline,
//             width: M3BorderToken.thin.value,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: M3BorderRadiusToken.extraSmall.value,
//           borderSide: BorderSide(
//             color: colorScheme.primary,
//             width: M3BorderToken.thick.value,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: M3BorderRadiusToken.extraSmall.value,
//           borderSide: BorderSide(
//             color: colorScheme.error,
//             width: M3BorderToken.thick.value,
//           ),
//         ),
//         labelStyle: textTheme.bodyLarge?.copyWith(
//           color: colorScheme.onSurfaceVariant,
//         ),
//         hintStyle: textTheme.bodyLarge?.copyWith(
//           color: colorScheme.onSurfaceVariant,
//         ),
//       ),

//       // Dialog Theme
//       dialogTheme: DialogThemeData(
//         backgroundColor: colorScheme.surface,
//         elevation: M3ComponentElevationToken.dialog.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: M3BorderRadiusToken.extraLarge.value,
//         ),
//         titleTextStyle: textTheme.headlineSmall?.copyWith(
//           color: colorScheme.onSurface,
//         ),
//         contentTextStyle: textTheme.bodyMedium?.copyWith(
//           color: colorScheme.onSurfaceVariant,
//         ),
//       ),

//       // Bottom Sheet Theme
//       bottomSheetTheme: BottomSheetThemeData(
//         backgroundColor: colorScheme.surface,
//         elevation: M3ComponentElevationToken.bottomSheet.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: M3RadiusToken.large.value,
//           ),
//         ),
//       ),

//       // Snackbar Theme
//       snackBarTheme: SnackBarThemeData(
//         backgroundColor: colorScheme.inverseSurface,
//         contentTextStyle: textTheme.bodyMedium?.copyWith(
//           color: colorScheme.onInverseSurface,
//         ),
//         elevation: M3ComponentElevationToken.snackbar.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: M3BorderRadiusToken.extraSmall.value,
//         ),
//       ),

//       // Chip Theme
//       chipTheme: ChipThemeData(
//         backgroundColor: colorScheme.surface,
//         deleteIconColor: colorScheme.onSurfaceVariant,
//         disabledColor: colorScheme.onSurface.withValues(alpha: 0.12),
//         selectedColor: colorScheme.secondaryContainer,
//         secondarySelectedColor: colorScheme.secondaryContainer,
//         padding: EdgeInsets.symmetric(
//           horizontal: M3SpacingToken.space8.value,
//           vertical: M3SpacingToken.space4.value,
//         ),
//         labelStyle: textTheme.labelLarge?.copyWith(
//           color: colorScheme.onSurfaceVariant,
//         ),
//         secondaryLabelStyle: textTheme.labelLarge?.copyWith(
//           color: colorScheme.onSecondaryContainer,
//         ),
//         brightness: isDark ? Brightness.dark : Brightness.light,
//         elevation: M3ElevationToken.level0.dp,
//         pressElevation: M3ElevationToken.level1.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: M3BorderRadiusToken.small.value,
//         ),
//       ),

//       // Additional theme properties
//       dividerColor: colorScheme.outlineVariant,
//       scaffoldBackgroundColor: colorScheme.surface,
//       canvasColor: colorScheme.surface,
//       shadowColor: colorScheme.shadow,

//       // Page transition animations
//       pageTransitionsTheme: const PageTransitionsTheme(
//         builders: {
//           TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
//           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//           TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
//           TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
//           TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
//         },
//       ),
//     );
//   }

//   // --- Private Helpers ---

//   static ColorScheme get _defaultLightColorScheme {
//     return const ColorScheme.light(
//       primary: Color(0xFF6750A4),
//       onPrimary: Color(0xFFFFFFFF),
//       primaryContainer: Color(0xFFEADDFF),
//       onPrimaryContainer: Color(0xFF21005D),
//       secondary: Color(0xFF625B71),
//       onSecondary: Color(0xFFFFFFFF),
//       secondaryContainer: Color(0xFFE8DEF8),
//       onSecondaryContainer: Color(0xFF1D192B),
//       tertiary: Color(0xFF7D5260),
//       onTertiary: Color(0xFFFFFFFF),
//       tertiaryContainer: Color(0xFFFFD8E4),
//       onTertiaryContainer: Color(0xFF31111D),
//       error: Color(0xFFBA1A1A),
//       onError: Color(0xFFFFFFFF),
//       errorContainer: Color(0xFFFFDAD6),
//       onErrorContainer: Color(0xFF410002),
//       surface: Color(0xFFFFFBFE),
//       onSurface: Color(0xFF1C1B1F),
//       surfaceContainerHighest: Color(0xFFE7E0EC),
//       onSurfaceVariant: Color(0xFF49454F),
//       outline: Color(0xFF79747E),
//       outlineVariant: Color(0xFFCAC4D0),
//       shadow: Color(0xFF000000),
//       scrim: Color(0xFF000000),
//       inverseSurface: Color(0xFF313033),
//       onInverseSurface: Color(0xFFF4EFF4),
//       inversePrimary: Color(0xFFD0BCFF),
//       surfaceTint: Color(0xFF6750A4),
//     );
//   }

//   static ColorScheme get _defaultDarkColorScheme {
//     return const ColorScheme.dark(
//       primary: Color(0xFFD0BCFF),
//       onPrimary: Color(0xFF381E72),
//       primaryContainer: Color(0xFF4F378B),
//       onPrimaryContainer: Color(0xFFEADDFF),
//       secondary: Color(0xFFCCC2DC),
//       onSecondary: Color(0xFF332D41),
//       secondaryContainer: Color(0xFF4A4458),
//       onSecondaryContainer: Color(0xFFE8DEF8),
//       tertiary: Color(0xFFEFB8C8),
//       onTertiary: Color(0xFF492532),
//       tertiaryContainer: Color(0xFF633B48),
//       onTertiaryContainer: Color(0xFFFFD8E4),
//       error: Color(0xFFFFB4AB),
//       onError: Color(0xFF690005),
//       errorContainer: Color(0xFF93000A),
//       onErrorContainer: Color(0xFFFFDAD6),
//       surface: Color(0xFF1C1B1F),
//       onSurface: Color(0xFFE6E1E5),
//       surfaceContainerHighest: Color(0xFF49454F),
//       onSurfaceVariant: Color(0xFFCAC4D0),
//       outline: Color(0xFF938F99),
//       outlineVariant: Color(0xFF49454F),
//       shadow: Color(0xFF000000),
//       scrim: Color(0xFF000000),
//       inverseSurface: Color(0xFFE6E1E5),
//       onInverseSurface: Color(0xFF313033),
//       inversePrimary: Color(0xFF6750A4),
//       surfaceTint: Color(0xFFD0BCFF),
//     );
//   }

//   static TextTheme _buildTextTheme(ColorScheme colorScheme) {
//     return TextTheme(
//       displayLarge: M3TypeScaleToken.displayLarge.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       displayMedium: M3TypeScaleToken.displayMedium.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       displaySmall: M3TypeScaleToken.displaySmall.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       headlineLarge: M3TypeScaleToken.headlineLarge.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       headlineMedium: M3TypeScaleToken.headlineMedium.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       headlineSmall: M3TypeScaleToken.headlineSmall.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       titleLarge: M3TypeScaleToken.titleLarge.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       titleMedium: M3TypeScaleToken.titleMedium.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       titleSmall: M3TypeScaleToken.titleSmall.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       bodyLarge: M3TypeScaleToken.bodyLarge.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       bodyMedium: M3TypeScaleToken.bodyMedium.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       bodySmall: M3TypeScaleToken.bodySmall.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       labelLarge: M3TypeScaleToken.labelLarge.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       labelMedium: M3TypeScaleToken.labelMedium.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       labelSmall: M3TypeScaleToken.labelSmall.value.copyWith(
//         color: colorScheme.onSurface,
//       ),
//     );
//   }

//   static ColorScheme _createHighContrastColorScheme(ColorScheme base) {
//     // Enhance contrast for accessibility
//     return base.copyWith(
//       primary: base.brightness == Brightness.light
//           ? const Color(0xFF000000)
//           : const Color(0xFFFFFFFF),
//       onPrimary: base.brightness == Brightness.light
//           ? const Color(0xFFFFFFFF)
//           : const Color(0xFF000000),
//     );
//   }

//   static TextTheme _createHighContrastTextTheme(TextTheme base) {
//     return base.apply(
//       bodyColor: null, // Let color scheme handle colors
//       displayColor: null,
//     );
//   }
// }
