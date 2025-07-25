// // lib/src/sys/theme/sys_theme.dart
// import 'package:flutter/material.dart';
// import 'package:material_design/material_design.dart';

// /// A comprehensive Material Design 3 theme builder that integrates all system tokens.
// ///
// /// This class provides a complete theming solution that combines all the M3
// /// design tokens (color, typography, shape, elevation, spacing, etc.) into
// /// a cohesive theme system that follows Flutter's ThemeData conventions.
// ///
// /// Reference: https://m3.material.io/foundations/design-tokens/overview
// @immutable
// class SysTheme {
//   /// The M3 color scheme for this theme.
//   final SysColorScheme colorScheme;

//   /// The text theme for this theme.
//   final TextTheme textTheme;

//   /// Whether this is a dark theme.
//   final bool isDark;

//   /// Custom seed color for dynamic theming.
//   final Color? seedColor;

//   /// Visual density for the theme.
//   final VisualDensity visualDensity;

//   /// Motion specifications for the theme.
//   final SysMotion motion;

//   const SysTheme({
//     required this.colorScheme,
//     required this.textTheme,
//     required this.isDark,
//     this.seedColor,
//     this.visualDensity = VisualDensity.standard,
//     this.motion = const SysMotion(),
//   });

//   /// Creates a light Material Design 3 theme.
//   factory SysTheme.light({
//     TonalPalette? primary,
//     TonalPalette? secondary,
//     TonalPalette? tertiary,
//     TonalPalette? error,
//     TonalPalette? neutral,
//     TonalPalette? neutralVariant,
//     Color? seedColor,
//     TextTheme? textTheme,
//     VisualDensity visualDensity = VisualDensity.standard,
//     SysMotion motion = const SysMotion(),
//   }) {
//     // Create sys color scheme
//     final colorScheme = SysColorScheme.light(
//       primary: primary,
//       secondary: secondary,
//       tertiary: tertiary,
//       error: error,
//       neutral: neutral,
//       neutralVariant: neutralVariant,
//     );

//     // Build text theme with proper colors
//     final finalTextTheme = textTheme ?? _buildTextTheme(colorScheme);

//     return SysTheme(
//       colorScheme: colorScheme,
//       textTheme: finalTextTheme,
//       isDark: false,
//       seedColor: seedColor,
//       visualDensity: visualDensity,
//       motion: motion,
//     );
//   }

//   /// Creates a dark Material Design 3 theme.
//   factory SysTheme.dark({
//     TonalPalette? primary,
//     TonalPalette? secondary,
//     TonalPalette? tertiary,
//     TonalPalette? error,
//     TonalPalette? neutral,
//     TonalPalette? neutralVariant,
//     Color? seedColor,
//     TextTheme? textTheme,
//     VisualDensity visualDensity = VisualDensity.standard,
//     SysMotion motion = const SysMotion(),
//   }) {
//     // Create sys color scheme
//     final colorScheme = SysColorScheme.dark(
//       primary: primary,
//       secondary: secondary,
//       tertiary: tertiary,
//       error: error,
//       neutral: neutral,
//       neutralVariant: neutralVariant,
//     );

//     // Build text theme with proper colors
//     final finalTextTheme = textTheme ?? _buildTextTheme(colorScheme);

//     return SysTheme(
//       colorScheme: colorScheme,
//       textTheme: finalTextTheme,
//       isDark: true,
//       seedColor: seedColor,
//       visualDensity: visualDensity,
//       motion: motion,
//     );
//   }

//   /// Creates a high contrast variant of the theme.
//   SysTheme toHighContrast() {
//     return SysTheme(
//       colorScheme: _createHighContrastSysColorScheme(colorScheme),
//       textTheme: _createHighContrastTextTheme(textTheme),
//       isDark: isDark,
//       seedColor: seedColor,
//       visualDensity: visualDensity,
//       motion: motion,
//     );
//   }

//   /// Converts this SysTheme to a Flutter ThemeData.
//   ThemeData toThemeData() {
//     return ThemeData(
//       useMaterial3: true,
//       textTheme: textTheme,
//       visualDensity: visualDensity,
//       colorScheme: colorScheme.toColorScheme(),

//       // App Bar Theme
//       appBarTheme: AppBarTheme(
//         backgroundColor: colorScheme.surface,
//         foregroundColor: colorScheme.onSurface,
//         elevation: SysElevation.level0.dp,
//         scrolledUnderElevation: SysElevation.level2.dp,
//         titleTextStyle: textTheme.titleLarge?.copyWith(
//           color: colorScheme.onSurface,
//         ),
//         systemOverlayStyle: null, // Let system decide
//       ),

//       // Card Theme
//       cardTheme: CardThemeData(
//         color: colorScheme.surfaceContainer,
//         elevation: SysElevation.level1.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.medium.value),
//         ),
//         shadowColor: colorScheme.shadow,
//         surfaceTintColor: colorScheme.surfaceTint,
//       ),

//       // Elevated Button Theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: colorScheme.primary,
//           foregroundColor: colorScheme.onPrimary,
//           elevation: SysElevation.level1.dp,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(SysRadius.full.value),
//           ),
//           textStyle: textTheme.labelLarge,
//           padding: EdgeInsets.symmetric(
//             horizontal: SysSpacing.large.value,
//             vertical: SysSpacing.small.value,
//           ),
//         ).copyWith(
//           animationDuration: motion.short2,
//         ),
//       ),

//       // Outlined Button Theme
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           foregroundColor: colorScheme.primary,
//           side: BorderSide(
//             color: colorScheme.outline,
//             width: 1.0,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(SysRadius.full.value),
//           ),
//           textStyle: textTheme.labelLarge,
//           padding: EdgeInsets.symmetric(
//             horizontal: SysSpacing.large.value,
//             vertical: SysSpacing.small.value,
//           ),
//         ).copyWith(
//           animationDuration: motion.short2,
//         ),
//       ),

//       // Text Button Theme
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: colorScheme.primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(SysRadius.full.value),
//           ),
//           textStyle: textTheme.labelLarge,
//           padding: EdgeInsets.symmetric(
//             horizontal: SysSpacing.medium.value,
//             vertical: SysSpacing.small.value,
//           ),
//         ).copyWith(
//           animationDuration: motion.short2,
//         ),
//       ),

//       // FAB Theme
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: colorScheme.primaryContainer,
//         foregroundColor: colorScheme.onPrimaryContainer,
//         elevation: SysElevation.level3.dp,
//         highlightElevation: SysElevation.level4.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.large.value),
//         ),
//       ),

//       // Input Decoration Theme
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: colorScheme.surfaceContainerHighest,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: colorScheme.outline,
//             width: 1.0,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: colorScheme.outline,
//             width: 1.0,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: colorScheme.primary,
//             width: 2.0,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: colorScheme.error,
//             width: 2.0,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: colorScheme.error,
//             width: 2.0,
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
//         backgroundColor: colorScheme.surfaceContainerHigh,
//         elevation: SysElevation.level3.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraLarge.value),
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
//         backgroundColor: colorScheme.surfaceContainerLow,
//         elevation: SysElevation.level1.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(SysRadius.extraLarge.value),
//           ),
//         ),
//         dragHandleColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
//         dragHandleSize: const Size(32, 4),
//       ),

//       // Snackbar Theme
//       snackBarTheme: SnackBarThemeData(
//         backgroundColor: colorScheme.inverseSurface,
//         contentTextStyle: textTheme.bodyMedium?.copyWith(
//           color: colorScheme.inverseOnSurface,
//         ),
//         elevation: SysElevation.level3.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//         ),
//         behavior: SnackBarBehavior.floating,
//         width: 344.0, // M3 spec
//       ),

//       // Chip Theme
//       chipTheme: ChipThemeData(
//         backgroundColor: Colors.transparent,
//         deleteIconColor: colorScheme.onSurfaceVariant,
//         disabledColor: colorScheme.onSurface.withValues(alpha: 0.12),
//         selectedColor: colorScheme.secondaryContainer,
//         secondarySelectedColor: colorScheme.secondaryContainer,
//         padding: EdgeInsets.symmetric(
//           horizontal: SysSpacing.small.value,
//           vertical: SysSpacing.extraSmall.value,
//         ),
//         labelStyle: textTheme.labelLarge?.copyWith(
//           color: colorScheme.onSurfaceVariant,
//         ),
//         secondaryLabelStyle: textTheme.labelLarge?.copyWith(
//           color: colorScheme.onSecondaryContainer,
//         ),
//         brightness: isDark ? Brightness.dark : Brightness.light,
//         elevation: SysElevation.level0.dp,
//         pressElevation: SysElevation.level1.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.small.value),
//           side: BorderSide(
//             color: colorScheme.outline,
//             width: 1.0,
//           ),
//         ),
//       ),

//       // Navigation Bar Theme
//       navigationBarTheme: NavigationBarThemeData(
//         backgroundColor: colorScheme.surfaceContainer,
//         indicatorColor: colorScheme.secondaryContainer,
//         surfaceTintColor: colorScheme.surfaceTint,
//         elevation: SysElevation.level2.dp,
//         height: 80.0,
//         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//       ),

//       // Navigation Rail Theme
//       navigationRailTheme: NavigationRailThemeData(
//         backgroundColor: colorScheme.surface,
//         selectedIconTheme: IconThemeData(
//           color: colorScheme.onSecondaryContainer,
//         ),
//         unselectedIconTheme: IconThemeData(
//           color: colorScheme.onSurfaceVariant,
//         ),
//         selectedLabelTextStyle: textTheme.labelMedium?.copyWith(
//           color: colorScheme.onSurface,
//         ),
//         unselectedLabelTextStyle: textTheme.labelMedium?.copyWith(
//           color: colorScheme.onSurfaceVariant,
//         ),
//       ),

//       // Additional theme properties
//       dividerColor: colorScheme.outlineVariant,
//       dividerTheme: DividerThemeData(
//         color: colorScheme.outlineVariant,
//         thickness: 1.0,
//         space: SysSpacing.small.value,
//       ),
//       scaffoldBackgroundColor: colorScheme.surface,
//       canvasColor: colorScheme.surface,
//       shadowColor: colorScheme.shadow,
//       highlightColor: colorScheme.primary.withValues(alpha: 0.12),
//       splashColor: colorScheme.primary.withValues(alpha: 0.12),
//       hoverColor: colorScheme.onSurface.withValues(alpha: 0.08),
//       focusColor: colorScheme.onSurface.withValues(alpha: 0.12),

//       // Page transition animations
//       pageTransitionsTheme: PageTransitionsTheme(
//         builders: {
//           TargetPlatform.android: _M3SharedAxisPageTransition(motion: motion),
//           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//           TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
//           TargetPlatform.windows: _M3FadeScalePageTransition(motion: motion),
//           TargetPlatform.linux: _M3FadeScalePageTransition(motion: motion),
//         },
//       ),

//       // Extensions for additional M3 properties
//       extensions: [
//         SysSurfaceColors(
//           surfaceDim: colorScheme.surfaceDim,
//           surfaceBright: colorScheme.surfaceBright,
//           surfaceContainerLowest: colorScheme.surfaceContainerLowest,
//           surfaceContainerLow: colorScheme.surfaceContainerLow,
//           surfaceContainer: colorScheme.surfaceContainer,
//           surfaceContainerHigh: colorScheme.surfaceContainerHigh,
//           surfaceContainerHighest: colorScheme.surfaceContainerHighest,
//         ),
//         motion,
//       ],
//     );
//   }

//   // --- Private Helpers ---

//   static TextTheme _buildTextTheme(SysColorScheme colorScheme) {
//     return TextTheme(
//       displayLarge: SysTypeScale.displayLarge.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       displayMedium: SysTypeScale.displayMedium.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       displaySmall: SysTypeScale.displaySmall.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       headlineLarge: SysTypeScale.headlineLarge.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       headlineMedium: SysTypeScale.headlineMedium.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       headlineSmall: SysTypeScale.headlineSmall.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       titleLarge: SysTypeScale.titleLarge.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       titleMedium: SysTypeScale.titleMedium.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       titleSmall: SysTypeScale.titleSmall.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       bodyLarge: SysTypeScale.bodyLarge.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       bodyMedium: SysTypeScale.bodyMedium.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       bodySmall: SysTypeScale.bodySmall.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       labelLarge: SysTypeScale.labelLarge.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       labelMedium: SysTypeScale.labelMedium.copyWith(
//         color: colorScheme.onSurface,
//       ),
//       labelSmall: SysTypeScale.labelSmall.copyWith(
//         color: colorScheme.onSurface,
//       ),
//     );
//   }

//   static SysColorScheme _createHighContrastSysColorScheme(SysColorScheme base) {
//     // For high contrast, we need to create new tonal palettes
//     // This is a simplified version - in production, you'd want more sophisticated contrast enhancement
//     final isDark = base.surface.computeLuminance() < 0.5;

//     if (isDark) {
//       return SysColorScheme.dark();
//     } else {
//       return SysColorScheme.light();
//     }
//   }

//   static TextTheme _createHighContrastTextTheme(TextTheme base) {
//     return base.apply(
//       bodyColor: null, // Let color scheme handle colors
//       displayColor: null,
//     );
//   }
// }

// // --- Custom Page Transitions ---

// class _M3SharedAxisPageTransition extends PageTransitionsBuilder {
//   final SysMotion motion;

//   const _M3SharedAxisPageTransition({required this.motion});

//   @override
//   Widget buildTransitions<T>(
//     PageRoute<T> route,
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     return FadeTransition(
//       opacity: animation.drive(
//         CurveTween(curve: motion.emphasizedDecelerate),
//       ),
//       child: child,
//     );
//   }
// }

// class _M3FadeScalePageTransition extends PageTransitionsBuilder {
//   final SysMotion motion;

//   const _M3FadeScalePageTransition({required this.motion});

//   @override
//   Widget buildTransitions<T>(
//     PageRoute<T> route,
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     return FadeTransition(
//       opacity: animation.drive(
//         CurveTween(curve: motion.emphasizedDecelerate),
//       ),
//       child: ScaleTransition(
//         scale: animation.drive(
//           Tween(begin: 0.92, end: 1.0).chain(
//             CurveTween(curve: motion.emphasizedDecelerate),
//           ),
//         ),
//         child: child,
//       ),
//     );
//   }
// }
