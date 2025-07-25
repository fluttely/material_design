// import 'package:flutter/material.dart';

// import '../color/sys_color_scheme.dart';
// import '../color/sys_surface_colors.dart';

// // TODO(Kevin): Verified, but needs to add all other themes data
// /// Extension to easily apply M3 color schemes to ThemeData
// extension M3SysColorTheme on ThemeData {
//   /// Creates a ThemeData with Material Design 3 color scheme
//   static ThemeData fromSysColorScheme(
//     SysColorScheme scheme, {
//     TextTheme? textTheme,
//     String? fontFamily,
//   }) {
//     final colorScheme = scheme.toColorScheme();
//     final surfaceColors = SysSurfaceColors(
//       surfaceDim: scheme.surfaceDim,
//       surfaceBright: scheme.surfaceBright,
//       surfaceContainerLowest: scheme.surfaceContainerLowest,
//       surfaceContainerLow: scheme.surfaceContainerLow,
//       surfaceContainer: scheme.surfaceContainer,
//       surfaceContainerHigh: scheme.surfaceContainerHigh,
//       surfaceContainerHighest: scheme.surfaceContainerHighest,
//     );

//     return ThemeData(
//       useMaterial3: true,
//       colorScheme: colorScheme,
//       textTheme: textTheme,
//       fontFamily: fontFamily,

//       // Additional M3-specific surface colors via extensions
//       extensions: [
//         surfaceColors,
//       ],
//     );
//   }
// }
