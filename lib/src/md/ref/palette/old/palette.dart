// /// Material Design 3 Color System
// ///
// /// Complete implementation following the official M3 specification.
// /// Includes both static color palettes and dynamic color roles.
// ///
// /// References:
// /// - Color System: https://m3.material.io/styles/color/the-color-system
// /// - Color Roles: https://m3.material.io/styles/color/roles
// /// - Dynamic Color: https://m3.material.io/styles/color/dynamic-color
// library material_design_3_colors;

// // Part 2: Color Scheme Roles
// part 'src/color_scheme_roles.dart';
// // Part 3: Surface Tones
// part 'src/surface_tones.dart';
// // Part 4: Theme Extensions
// part 'src/theme_extensions.dart';
// // import 'package:flutter/material.dart';

// // Part 1: Tonal Palettes
// part 'src/tonal_palette.dart';

// /// Base class for Material Design 3 tonal palettes.
// ///
// /// Each tonal palette contains 13 tones ranging from black (0) to white (100).
// /// Additional tones are available for neutral palettes to support subtle variations.
// @immutable
// class TonalPalette {
//   final Map<int, Color> tones;

//   const TonalPalette(this.tones);

//   /// Gets a color at the specified tone.
//   /// Returns null if tone doesn't exist.
//   Color? operator [](int tone) => tones[tone];

//   /// Gets a color at the specified tone with a fallback.
//   Color get(int tone, {Color? fallback}) =>
//       tones[tone] ?? fallback ?? tones[40]!;

//   /// Interpolates between tones for smooth color transitions.
//   /// Useful for animations and dynamic theming.
//   Color interpolate(double tone) {
//     if (tones.containsKey(tone.toInt())) {
//       return tones[tone.toInt()]!;
//     }

//     final sortedTones = tones.keys.toList()..sort();

//     // Find surrounding tones
//     int? lowerTone, upperTone;
//     for (final t in sortedTones) {
//       if (t <= tone) lowerTone = t;
//       if (t >= tone && upperTone == null) upperTone = t;
//     }

//     if (lowerTone == null || upperTone == null || lowerTone == upperTone) {
//       return tones[40]!; // Default fallback
//     }

//     final lowerColor = tones[lowerTone]!;
//     final upperColor = tones[upperTone]!;
//     final t = (tone - lowerTone) / (upperTone - lowerTone);

//     return Color.lerp(lowerColor, upperColor, t)!;
//   }
// }

// /// Material Design 3 reference palettes.
// ///
// /// These are the base palettes from which all color schemes are derived.
// /// Use [Md3ColorScheme] for semantic color roles in your app.
// abstract class Md3RefPalette {
//   // Standard tones used across most palettes
//   static const _standardTones = [
//     0,
//     10,
//     20,
//     30,
//     40,
//     50,
//     60,
//     70,
//     80,
//     90,
//     95,
//     99,
//     100
//   ];

//   // Extended tones for neutral palette (includes additional surface tones)
//   static const _neutralTones = [
//     0,
//     4,
//     6,
//     10,
//     12,
//     17,
//     20,
//     22,
//     24,
//     30,
//     40,
//     50,
//     60,
//     70,
//     80,
//     87,
//     90,
//     92,
//     94,
//     95,
//     96,
//     98,
//     99,
//     100
//   ];

//   /// Primary tonal palette - Main brand color
//   static const primary = TonalPalette({
//     0: Color(0xFF000000),
//     10: Color(0xFF21005D),
//     20: Color(0xFF381E72),
//     30: Color(0xFF4F378B),
//     40: Color(0xFF6750A4),
//     50: Color(0xFF7F67BE),
//     60: Color(0xFF9A82DB),
//     70: Color(0xFFB69DF8),
//     80: Color(0xFFD0BCFF),
//     90: Color(0xFFEADDFF),
//     95: Color(0xFFF6EDFF),
//     99: Color(0xFFFFFBFE),
//     100: Color(0xFFFFFFFF),
//   });

//   /// Secondary tonal palette - Supporting brand color
//   static const secondary = TonalPalette({
//     0: Color(0xFF000000),
//     10: Color(0xFF1D192B),
//     20: Color(0xFF332D41),
//     30: Color(0xFF4A4458),
//     40: Color(0xFF625B71),
//     50: Color(0xFF7A7289),
//     60: Color(0xFF958DA5),
//     70: Color(0xFFB0A7C0),
//     80: Color(0xFFCCC2DC),
//     90: Color(0xFFE8DEF8),
//     95: Color(0xFFF6EDFF),
//     99: Color(0xFFFFFBFE),
//     100: Color(0xFFFFFFFF),
//   });

//   /// Tertiary tonal palette - Accent color for special moments
//   static const tertiary = TonalPalette({
//     0: Color(0xFF000000),
//     10: Color(0xFF31111D),
//     20: Color(0xFF492532),
//     30: Color(0xFF633B48),
//     40: Color(0xFF7D5260),
//     50: Color(0xFF986977),
//     60: Color(0xFFB58392),
//     70: Color(0xFFD29DAC),
//     80: Color(0xFFEFB8C8),
//     90: Color(0xFFFFD8E4),
//     95: Color(0xFFFFECF1),
//     99: Color(0xFFFFFBFA),
//     100: Color(0xFFFFFFFF),
//   });

//   /// Error tonal palette - Semantic color for errors
//   static const error = TonalPalette({
//     0: Color(0xFF000000),
//     10: Color(0xFF410E0B),
//     20: Color(0xFF601410),
//     30: Color(0xFF8C1D18),
//     40: Color(0xFFB3261E),
//     50: Color(0xFFDC362E),
//     60: Color(0xFFE46962),
//     70: Color(0xFFEC928E),
//     80: Color(0xFFF2B8B5),
//     90: Color(0xFFF9DEDC),
//     95: Color(0xFFFCEEEE),
//     99: Color(0xFFFFFBF9),
//     100: Color(0xFFFFFFFF),
//   });

//   /// Neutral tonal palette - Used for surfaces and backgrounds
//   /// Contains additional tones for fine-grained surface control
//   static const neutral = TonalPalette({
//     0: Color(0xFF000000),
//     4: Color(0xFF0F0D13),
//     6: Color(0xFF141218),
//     10: Color(0xFF1D1B20),
//     12: Color(0xFF211F26),
//     17: Color(0xFF2B2930),
//     20: Color(0xFF322F35),
//     22: Color(0xFF36343B),
//     24: Color(0xFF3B383E),
//     30: Color(0xFF48464C),
//     40: Color(0xFF605D64),
//     50: Color(0xFF79767D),
//     60: Color(0xFF938F96),
//     70: Color(0xFFAEAAB1),
//     80: Color(0xFFCAC5CD),
//     87: Color(0xFFDED8E1),
//     90: Color(0xFFE6E1E9),
//     92: Color(0xFFECE6F0),
//     94: Color(0xFFF2ECF5),
//     95: Color(0xFFF4EFF4),
//     96: Color(0xFFF7F2FA),
//     98: Color(0xFFFDF7FF),
//     99: Color(0xFFFFFBFE),
//     100: Color(0xFFFFFFFF),
//   });

//   /// Neutral variant tonal palette - Alternative neutral for subtle variations
//   static const neutralVariant = TonalPalette({
//     0: Color(0xFF000000),
//     10: Color(0xFF1D1A22),
//     20: Color(0xFF322F37),
//     30: Color(0xFF49454F),
//     40: Color(0xFF605D66),
//     50: Color(0xFF79747E),
//     60: Color(0xFF938F99),
//     70: Color(0xFFAEA9B4),
//     80: Color(0xFFCAC4D0),
//     90: Color(0xFFE7E0EC),
//     95: Color(0xFFF5EFFA),
//     99: Color(0xFFFFFBFE),
//     100: Color(0xFFFFFFFF),
//   });
// }

// /// Material Design 3 Color Scheme with semantic color roles.
// ///
// /// This class provides all the color roles defined in the M3 specification,
// /// properly mapped to their tonal values for both light and dark themes.
// ///
// /// See: https://m3.material.io/styles/color/roles
// @immutable
// class Md3ColorScheme {
//   // Surface colors
//   final Color surface;
//   final Color surfaceDim;
//   final Color surfaceBright;
//   final Color surfaceContainerLowest;
//   final Color surfaceContainerLow;
//   final Color surfaceContainer;
//   final Color surfaceContainerHigh;
//   final Color surfaceContainerHighest;
//   final Color surfaceVariant;
//   final Color onSurface;
//   final Color onSurfaceVariant;

//   // Primary colors
//   final Color primary;
//   final Color primaryContainer;
//   final Color onPrimary;
//   final Color onPrimaryContainer;
//   final Color inversePrimary;

//   // Secondary colors
//   final Color secondary;
//   final Color secondaryContainer;
//   final Color onSecondary;
//   final Color onSecondaryContainer;

//   // Tertiary colors
//   final Color tertiary;
//   final Color tertiaryContainer;
//   final Color onTertiary;
//   final Color onTertiaryContainer;

//   // Error colors
//   final Color error;
//   final Color errorContainer;
//   final Color onError;
//   final Color onErrorContainer;

//   // Neutral colors
//   final Color outline;
//   final Color outlineVariant;
//   final Color inverseSurface;
//   final Color inverseOnSurface;
//   final Color scrim;
//   final Color shadow;

//   const Md3ColorScheme({
//     required this.surface,
//     required this.surfaceDim,
//     required this.surfaceBright,
//     required this.surfaceContainerLowest,
//     required this.surfaceContainerLow,
//     required this.surfaceContainer,
//     required this.surfaceContainerHigh,
//     required this.surfaceContainerHighest,
//     required this.surfaceVariant,
//     required this.onSurface,
//     required this.onSurfaceVariant,
//     required this.primary,
//     required this.primaryContainer,
//     required this.onPrimary,
//     required this.onPrimaryContainer,
//     required this.inversePrimary,
//     required this.secondary,
//     required this.secondaryContainer,
//     required this.onSecondary,
//     required this.onSecondaryContainer,
//     required this.tertiary,
//     required this.tertiaryContainer,
//     required this.onTertiary,
//     required this.onTertiaryContainer,
//     required this.error,
//     required this.errorContainer,
//     required this.onError,
//     required this.onErrorContainer,
//     required this.outline,
//     required this.outlineVariant,
//     required this.inverseSurface,
//     required this.inverseOnSurface,
//     required this.scrim,
//     required this.shadow,
//   });

//   /// Creates a light color scheme from tonal palettes
//   factory Md3ColorScheme.light({
//     TonalPalette? primary,
//     TonalPalette? secondary,
//     TonalPalette? tertiary,
//     TonalPalette? error,
//     TonalPalette? neutral,
//     TonalPalette? neutralVariant,
//   }) {
//     primary ??= Md3RefPalette.primary;
//     secondary ??= Md3RefPalette.secondary;
//     tertiary ??= Md3RefPalette.tertiary;
//     error ??= Md3RefPalette.error;
//     neutral ??= Md3RefPalette.neutral;
//     neutralVariant ??= Md3RefPalette.neutralVariant;

//     return Md3ColorScheme(
//       // Surface colors - Light theme
//       surface: neutral[98]!,
//       surfaceDim: neutral[87]!,
//       surfaceBright: neutral[98]!,
//       surfaceContainerLowest: neutral[100]!,
//       surfaceContainerLow: neutral[96]!,
//       surfaceContainer: neutral[94]!,
//       surfaceContainerHigh: neutral[92]!,
//       surfaceContainerHighest: neutral[90]!,
//       surfaceVariant: neutralVariant[90]!,
//       onSurface: neutral[10]!,
//       onSurfaceVariant: neutralVariant[30]!,

//       // Primary colors - Light theme
//       primary: primary[40]!,
//       primaryContainer: primary[90]!,
//       onPrimary: primary[100]!,
//       onPrimaryContainer: primary[10]!,
//       inversePrimary: primary[80]!,

//       // Secondary colors - Light theme
//       secondary: secondary[40]!,
//       secondaryContainer: secondary[90]!,
//       onSecondary: secondary[100]!,
//       onSecondaryContainer: secondary[10]!,

//       // Tertiary colors - Light theme
//       tertiary: tertiary[40]!,
//       tertiaryContainer: tertiary[90]!,
//       onTertiary: tertiary[100]!,
//       onTertiaryContainer: tertiary[10]!,

//       // Error colors - Light theme
//       error: error[40]!,
//       errorContainer: error[90]!,
//       onError: error[100]!,
//       onErrorContainer: error[10]!,

//       // Neutral colors - Light theme
//       outline: neutralVariant[50]!,
//       outlineVariant: neutralVariant[80]!,
//       inverseSurface: neutral[20]!,
//       inverseOnSurface: neutral[95]!,
//       scrim: neutral[0]!,
//       shadow: neutral[0]!,
//     );
//   }

//   /// Creates a dark color scheme from tonal palettes
//   factory Md3ColorScheme.dark({
//     TonalPalette? primary,
//     TonalPalette? secondary,
//     TonalPalette? tertiary,
//     TonalPalette? error,
//     TonalPalette? neutral,
//     TonalPalette? neutralVariant,
//   }) {
//     primary ??= Md3RefPalette.primary;
//     secondary ??= Md3RefPalette.secondary;
//     tertiary ??= Md3RefPalette.tertiary;
//     error ??= Md3RefPalette.error;
//     neutral ??= Md3RefPalette.neutral;
//     neutralVariant ??= Md3RefPalette.neutralVariant;

//     return Md3ColorScheme(
//       // Surface colors - Dark theme
//       surface: neutral[6]!,
//       surfaceDim: neutral[6]!,
//       surfaceBright: neutral[24]!,
//       surfaceContainerLowest: neutral[4]!,
//       surfaceContainerLow: neutral[10]!,
//       surfaceContainer: neutral[12]!,
//       surfaceContainerHigh: neutral[17]!,
//       surfaceContainerHighest: neutral[22]!,
//       surfaceVariant: neutralVariant[30]!,
//       onSurface: neutral[90]!,
//       onSurfaceVariant: neutralVariant[80]!,

//       // Primary colors - Dark theme
//       primary: primary[80]!,
//       primaryContainer: primary[30]!,
//       onPrimary: primary[20]!,
//       onPrimaryContainer: primary[90]!,
//       inversePrimary: primary[40]!,

//       // Secondary colors - Dark theme
//       secondary: secondary[80]!,
//       secondaryContainer: secondary[30]!,
//       onSecondary: secondary[20]!,
//       onSecondaryContainer: secondary[90]!,

//       // Tertiary colors - Dark theme
//       tertiary: tertiary[80]!,
//       tertiaryContainer: tertiary[30]!,
//       onTertiary: tertiary[20]!,
//       onTertiaryContainer: tertiary[90]!,

//       // Error colors - Dark theme
//       error: error[80]!,
//       errorContainer: error[30]!,
//       onError: error[20]!,
//       onErrorContainer: error[90]!,

//       // Neutral colors - Dark theme
//       outline: neutralVariant[60]!,
//       outlineVariant: neutralVariant[30]!,
//       inverseSurface: neutral[90]!,
//       inverseOnSurface: neutral[20]!,
//       scrim: neutral[0]!,
//       shadow: neutral[0]!,
//     );
//   }

//   /// Converts to Flutter's standard ColorScheme
//   ColorScheme toColorScheme() {
//     return ColorScheme(
//       brightness: _isLight ? Brightness.light : Brightness.dark,
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
//       outline: outline,
//       outlineVariant: outlineVariant, // Deprecated but required
//       surface: surface,
//       onSurface: onSurface,
//       surfaceContainerHighest: surfaceVariant,
//       onSurfaceVariant: onSurfaceVariant,
//       inverseSurface: inverseSurface,
//       onInverseSurface: inverseOnSurface,
//       inversePrimary: inversePrimary,
//       shadow: shadow,
//       scrim: scrim,
//     );
//   }

//   /// Helper to determine if this is a light scheme
//   bool get _isLight => surface.computeLuminance() > 0.5;
// }

// /// Extension to easily apply M3 color schemes to ThemeData
// extension Md3ThemeExtension on ThemeData {
//   /// Creates a ThemeData with Material Design 3 color scheme
//   static ThemeData fromMd3ColorScheme(
//     Md3ColorScheme scheme, {
//     bool useMaterial3 = true,
//     TextTheme? textTheme,
//     String? fontFamily,
//   }) {
//     final colorScheme = scheme.toColorScheme();

//     return ThemeData(
//       useMaterial3: useMaterial3,
//       colorScheme: colorScheme,
//       textTheme: textTheme,
//       fontFamily: fontFamily,

//       // Additional M3-specific surface colors via extensions
//       extensions: [
//         Md3SurfaceColors(
//           surfaceDim: scheme.surfaceDim,
//           surfaceBright: scheme.surfaceBright,
//           surfaceContainerLowest: scheme.surfaceContainerLowest,
//           surfaceContainerLow: scheme.surfaceContainerLow,
//           surfaceContainer: scheme.surfaceContainer,
//           surfaceContainerHigh: scheme.surfaceContainerHigh,
//           surfaceContainerHighest: scheme.surfaceContainerHighest,
//         ),
//       ],
//     );
//   }
// }

// /// Theme extension for additional M3 surface colors
// @immutable
// class Md3SurfaceColors extends ThemeExtension<Md3SurfaceColors> {
//   final Color surfaceDim;
//   final Color surfaceBright;
//   final Color surfaceContainerLowest;
//   final Color surfaceContainerLow;
//   final Color surfaceContainer;
//   final Color surfaceContainerHigh;
//   final Color surfaceContainerHighest;

//   const Md3SurfaceColors({
//     required this.surfaceDim,
//     required this.surfaceBright,
//     required this.surfaceContainerLowest,
//     required this.surfaceContainerLow,
//     required this.surfaceContainer,
//     required this.surfaceContainerHigh,
//     required this.surfaceContainerHighest,
//   });

//   @override
//   Md3SurfaceColors copyWith({
//     Color? surfaceDim,
//     Color? surfaceBright,
//     Color? surfaceContainerLowest,
//     Color? surfaceContainerLow,
//     Color? surfaceContainer,
//     Color? surfaceContainerHigh,
//     Color? surfaceContainerHighest,
//   }) {
//     return Md3SurfaceColors(
//       surfaceDim: surfaceDim ?? this.surfaceDim,
//       surfaceBright: surfaceBright ?? this.surfaceBright,
//       surfaceContainerLowest:
//           surfaceContainerLowest ?? this.surfaceContainerLowest,
//       surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
//       surfaceContainer: surfaceContainer ?? this.surfaceContainer,
//       surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
//       surfaceContainerHighest:
//           surfaceContainerHighest ?? this.surfaceContainerHighest,
//     );
//   }

//   @override
//   Md3SurfaceColors lerp(ThemeExtension<Md3SurfaceColors>? other, double t) {
//     if (other is! Md3SurfaceColors) return this;

//     return Md3SurfaceColors(
//       surfaceDim: Color.lerp(surfaceDim, other.surfaceDim, t)!,
//       surfaceBright: Color.lerp(surfaceBright, other.surfaceBright, t)!,
//       surfaceContainerLowest:
//           Color.lerp(surfaceContainerLowest, other.surfaceContainerLowest, t)!,
//       surfaceContainerLow:
//           Color.lerp(surfaceContainerLow, other.surfaceContainerLow, t)!,
//       surfaceContainer:
//           Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
//       surfaceContainerHigh:
//           Color.lerp(surfaceContainerHigh, other.surfaceContainerHigh, t)!,
//       surfaceContainerHighest: Color.lerp(
//           surfaceContainerHighest, other.surfaceContainerHighest, t)!,
//     );
//   }
// }

// /// Example usage:
// /// 
// /// ```dart
// /// // 1. Using default M3 colors
// /// final lightTheme = Md3ThemeExtension.fromMd3ColorScheme(
// ///   Md3ColorScheme.light(),
// /// );
// /// 
// /// final darkTheme = Md3ThemeExtension.fromMd3ColorScheme(
// ///   Md3ColorScheme.dark(),
// /// );
// /// 
// /// // 2. Custom brand colors
// /// final customPrimary = TonalPalette({
// ///   0: Color(0xFF000000),
// ///   10: Color(0xFF0C2D00),
// ///   // ... your brand colors
// /// });
// /// 
// /// final customTheme = Md3ThemeExtension.fromMd3ColorScheme(
// ///   Md3ColorScheme.light(primary: customPrimary),
// /// );
// /// 
// /// // 3. Accessing surface colors in widgets
// /// class MyWidget extends StatelessWidget {
// ///   @override
// ///   Widget build(BuildContext context) {
// ///     final surfaceColors = Theme.of(context).extension<Md3SurfaceColors>()!;
// ///     
// ///     return Container(
// ///       color: surfaceColors.surfaceContainerHigh,
// ///       child: Text(
// ///         'Hello M3',
// ///         style: TextStyle(
// ///           color: Theme.of(context).colorScheme.onSurface,
// ///         ),
// ///       ),
// ///     );
// ///   }
// /// }
// /// ```