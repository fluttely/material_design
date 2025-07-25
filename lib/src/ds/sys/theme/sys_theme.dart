// // lib/src/sys/theme/sys_theme.dart
// import 'package:flutter/material.dart';
// import 'package:material_design/material_design.dart';
// import 'package:material_design/src/ds/ds.dart';
// import 'package:material_design/src/md/md.dart';

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
//   final SysColorScheme sysColorScheme;

//   /// The Flutter color scheme (for compatibility).
//   final ColorScheme colorScheme;

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
//     required this.sysColorScheme,
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
//     final sysColorScheme = SysColorScheme.light(
//       primary: primary,
//       secondary: secondary,
//       tertiary: tertiary,
//       error: error,
//       neutral: neutral,
//       neutralVariant: neutralVariant,
//     );

//     // Convert to Flutter color scheme
//     final colorScheme = sysColorScheme.toColorScheme();

//     // Build text theme with proper colors
//     final finalTextTheme = textTheme ?? _buildTextTheme(sysColorScheme);

//     return SysTheme(
//       sysColorScheme: sysColorScheme,
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
//     final sysColorScheme = SysColorScheme.dark(
//       primary: primary,
//       secondary: secondary,
//       tertiary: tertiary,
//       error: error,
//       neutral: neutral,
//       neutralVariant: neutralVariant,
//     );

//     // Convert to Flutter color scheme
//     final colorScheme = sysColorScheme.toColorScheme();

//     // Build text theme with proper colors
//     final finalTextTheme = textTheme ?? _buildTextTheme(sysColorScheme);

//     return SysTheme(
//       sysColorScheme: sysColorScheme,
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
//       sysColorScheme: _createHighContrastSysColorScheme(sysColorScheme),
//       colorScheme: _createHighContrastColorScheme(colorScheme),
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
//       colorScheme: colorScheme,
//       textTheme: textTheme,
//       visualDensity: visualDensity,

//       // App Bar Theme
//       appBarTheme: AppBarTheme(
//         backgroundColor: sysColorScheme.surface,
//         foregroundColor: sysColorScheme.onSurface,
//         elevation: M3ElevationToken.level0.dp,
//         scrolledUnderElevation: M3ElevationToken.level2.dp,
//         titleTextStyle: textTheme.titleLarge?.copyWith(
//           color: sysColorScheme.onSurface,
//         ),
//         systemOverlayStyle: null, // Let system decide
//       ),

//       // Card Theme
//       cardTheme: CardThemeData(
//         color: sysColorScheme.surfaceContainer,
//         elevation: M3ElevationToken.level1.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.medium.value),
//         ),
//         shadowColor: colorScheme.shadow,
//         surfaceTintColor: colorScheme.surfaceTint,
//       ),

//       // Elevated Button Theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: sysColorScheme.primary,
//           foregroundColor: sysColorScheme.onPrimary,
//           elevation: M3ElevationToken.level1.dp,
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
//           foregroundColor: sysColorScheme.primary,
//           side: BorderSide(
//             color: sysColorScheme.outline,
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
//           foregroundColor: sysColorScheme.primary,
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
//         backgroundColor: sysColorScheme.primaryContainer,
//         foregroundColor: sysColorScheme.onPrimaryContainer,
//         elevation: M3ElevationToken.level3.dp,
//         highlightElevation: M3ElevationToken.level4.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.large.value),
//         ),
//       ),

//       // Input Decoration Theme
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: sysColorScheme.surfaceContainerHighest,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: sysColorScheme.outline,
//             width: 1.0,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: sysColorScheme.outline,
//             width: 1.0,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: sysColorScheme.primary,
//             width: 2.0,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: sysColorScheme.error,
//             width: 2.0,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//           borderSide: BorderSide(
//             color: sysColorScheme.error,
//             width: 2.0,
//           ),
//         ),
//         labelStyle: textTheme.bodyLarge?.copyWith(
//           color: sysColorScheme.onSurfaceVariant,
//         ),
//         hintStyle: textTheme.bodyLarge?.copyWith(
//           color: sysColorScheme.onSurfaceVariant,
//         ),
//       ),

//       // Dialog Theme
//       dialogTheme: DialogThemeData(
//         backgroundColor: sysColorScheme.surfaceContainerHigh,
//         elevation: M3ElevationToken.level3.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraLarge.value),
//         ),
//         titleTextStyle: textTheme.headlineSmall?.copyWith(
//           color: sysColorScheme.onSurface,
//         ),
//         contentTextStyle: textTheme.bodyMedium?.copyWith(
//           color: sysColorScheme.onSurfaceVariant,
//         ),
//       ),

//       // Bottom Sheet Theme
//       bottomSheetTheme: BottomSheetThemeData(
//         backgroundColor: sysColorScheme.surfaceContainerLow,
//         elevation: M3ElevationToken.level1.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(SysRadius.extraLarge.value),
//           ),
//         ),
//         dragHandleColor: sysColorScheme.onSurfaceVariant.withValues(alpha: 0.4),
//         dragHandleSize: const Size(32, 4),
//       ),

//       // Snackbar Theme
//       snackBarTheme: SnackBarThemeData(
//         backgroundColor: sysColorScheme.inverseSurface,
//         contentTextStyle: textTheme.bodyMedium?.copyWith(
//           color: sysColorScheme.inverseOnSurface,
//         ),
//         elevation: M3ElevationToken.level3.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.extraSmall.value),
//         ),
//         behavior: SnackBarBehavior.floating,
//         width: 344.0, // M3 spec
//       ),

//       // Chip Theme
//       chipTheme: ChipThemeData(
//         backgroundColor: Colors.transparent,
//         deleteIconColor: sysColorScheme.onSurfaceVariant,
//         disabledColor: sysColorScheme.onSurface.withValues(alpha: 0.12),
//         selectedColor: sysColorScheme.secondaryContainer,
//         secondarySelectedColor: sysColorScheme.secondaryContainer,
//         padding: EdgeInsets.symmetric(
//           horizontal: SysSpacing.small.value,
//           vertical: SysSpacing.extraSmall.value,
//         ),
//         labelStyle: textTheme.labelLarge?.copyWith(
//           color: sysColorScheme.onSurfaceVariant,
//         ),
//         secondaryLabelStyle: textTheme.labelLarge?.copyWith(
//           color: sysColorScheme.onSecondaryContainer,
//         ),
//         brightness: isDark ? Brightness.dark : Brightness.light,
//         elevation: M3ElevationToken.level0.dp,
//         pressElevation: M3ElevationToken.level1.dp,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(SysRadius.small.value),
//           side: BorderSide(
//             color: sysColorScheme.outline,
//             width: 1.0,
//           ),
//         ),
//       ),

//       // Navigation Bar Theme
//       navigationBarTheme: NavigationBarThemeData(
//         backgroundColor: sysColorScheme.surfaceContainer,
//         indicatorColor: sysColorScheme.secondaryContainer,
//         surfaceTintColor: sysColorScheme.surfaceTint,
//         elevation: M3ElevationToken.level2.dp,
//         height: 80.0,
//         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//       ),

//       // Navigation Rail Theme
//       navigationRailTheme: NavigationRailThemeData(
//         backgroundColor: sysColorScheme.surface,
//         selectedIconTheme: IconThemeData(
//           color: sysColorScheme.onSecondaryContainer,
//         ),
//         unselectedIconTheme: IconThemeData(
//           color: sysColorScheme.onSurfaceVariant,
//         ),
//         selectedLabelTextStyle: textTheme.labelMedium?.copyWith(
//           color: sysColorScheme.onSurface,
//         ),
//         unselectedLabelTextStyle: textTheme.labelMedium?.copyWith(
//           color: sysColorScheme.onSurfaceVariant,
//         ),
//       ),

//       // Additional theme properties
//       dividerColor: sysColorScheme.outlineVariant,
//       dividerTheme: DividerThemeData(
//         color: sysColorScheme.outlineVariant,
//         thickness: 1.0,
//         space: SysSpacing.small.value,
//       ),
//       scaffoldBackgroundColor: sysColorScheme.surface,
//       canvasColor: sysColorScheme.surface,
//       shadowColor: sysColorScheme.shadow,
//       highlightColor: sysColorScheme.primary.withValues(alpha: 0.12),
//       splashColor: sysColorScheme.primary.withValues(alpha: 0.12),
//       hoverColor: sysColorScheme.onSurface.withValues(alpha: 0.08),
//       focusColor: sysColorScheme.onSurface.withValues(alpha: 0.12),

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
//           surfaceDim: sysColorScheme.surfaceDim,
//           surfaceBright: sysColorScheme.surfaceBright,
//           surfaceContainerLowest: sysColorScheme.surfaceContainerLowest,
//           surfaceContainerLow: sysColorScheme.surfaceContainerLow,
//           surfaceContainer: sysColorScheme.surfaceContainer,
//           surfaceContainerHigh: sysColorScheme.surfaceContainerHigh,
//           surfaceContainerHighest: sysColorScheme.surfaceContainerHighest,
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

//   static ColorScheme _createHighContrastColorScheme(ColorScheme base) {
//     return base.copyWith(
//       primary: base.brightness == Brightness.light
//           ? const Color(0xFF000000)
//           : const Color(0xFFFFFFFF),
//       onPrimary: base.brightness == Brightness.light
//           ? const Color(0xFFFFFFFF)
//           : const Color(0xFF000000),
//       outline: base.brightness == Brightness.light
//           ? const Color(0xFF000000)
//           : const Color(0xFFFFFFFF),
//     );
//   }

//   static TextTheme _createHighContrastTextTheme(TextTheme base) {
//     return base.apply(
//       bodyColor: null, // Let color scheme handle colors
//       displayColor: null,
//     );
//   }
// }

// // --- Custom Page Transitions ---
// @immutable
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

// @immutable
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
