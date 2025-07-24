// import 'package:flutter/material.dart';

// /// Material Design 3 Reference Color Palette
// ///
// /// Contains the base color palettes used to generate the M3 color system.
// /// These are the foundation colors from which all semantic colors are derived.
// ///
// /// Reference tokens represent the primitive values in your design system.
// /// They are raw atomic values that form the foundation from which all other
// /// tokens are derived. These palettes follow the Material You dynamic color
// /// system with 13 tones from 0 (darkest) to 100 (lightest).
// ///
// /// ## Usage
// ///
// /// ```dart
// /// // Get specific tone from a palette
// /// Color primaryColor = M3RefPalette.getColor(M3RefPalette.primary, 40);
// /// 
// /// // Interpolate between tones
// /// Color customTone = M3RefPalette.interpolateTone(M3RefPalette.primary, 35.5);
// /// ```
// ///
// /// ## Color Palette Structure
// ///
// /// Each palette contains 13 key tones:
// /// - **0**: Pure black/darkest
// /// - **10-90**: Graduated tones in 10-step increments
// /// - **95, 99**: Near-white tones for surface colors
// /// - **100**: Pure white/lightest
// ///
// /// Reference: https://m3.material.io/styles/color/the-color-system/tokens
// abstract interface class M3RefPalette {
//   /// Primary color palette (13 tones from 0-100)
//   ///
//   /// The primary palette is the main brand color and is used for key components
//   /// like primary buttons, active states, and prominent UI elements.
//   static const Map<int, Color> primary = {
//     0: Color(0xFF000000),
//     10: Color(0xFF21005D),
//     20: Color(0xFF381E72),
//     30: Color(0xFF4F378B),
//     40: Color(0xFF6750A4),
//     50: Color(0xFF7F5AF0),
//     60: Color(0xFF9A82DB),
//     70: Color(0xFFB69DF8),
//     80: Color(0xFFD0BCFF),
//     90: Color(0xFFEADDFF),
//     95: Color(0xFFF6EDFF),
//     99: Color(0xFFFFFBFE),
//     100: Color(0xFFFFFFFF),
//   };

//   /// Secondary color palette (13 tones from 0-100)
//   ///
//   /// Secondary colors provide accent and complementary coloring to support
//   /// and enhance the primary color, used for secondary buttons and UI elements.
//   static const Map<int, Color> secondary = {
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
//   };

//   /// Tertiary color palette (13 tones from 0-100)
//   ///
//   /// Tertiary colors are used to derive contrasting accents for UI elements
//   /// and to balance primary and secondary colors with additional visual interest.
//   static const Map<int, Color> tertiary = {
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
//   };

//   /// Error color palette (13 tones from 0-100)
//   ///
//   /// Error colors are used to indicate errors, warnings, and destructive
//   /// actions throughout the UI. They should be used sparingly and with intention.
//   static const Map<int, Color> error = {
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
//   };

//   /// Neutral color palette (13 tones from 0-100)
//   ///
//   /// Neutral colors are used for text, backgrounds, and subtle UI elements.
//   /// They provide the foundation for readable and accessible interfaces.
//   static const Map<int, Color> neutral = {
//     0: Color(0xFF000000),
//     10: Color(0xFF1C1B1F),
//     20: Color(0xFF313033),
//     30: Color(0xFF484649),
//     40: Color(0xFF605D62),
//     50: Color(0xFF787579),
//     60: Color(0xFF939094),
//     70: Color(0xFFAEAAAE),
//     80: Color(0xFFCAC4D0),
//     90: Color(0xFFE6E0E9),
//     95: Color(0xFFF4EFF4),
//     99: Color(0xFFFFFBFE),
//     100: Color(0xFFFFFFFF),
//   };

//   /// Neutral variant color palette (13 tones from 0-100)
//   ///
//   /// Neutral variant colors provide subtle variations of neutral tones,
//   /// used for surface variants, outlines, and secondary text elements.
//   static const Map<int, Color> neutralVariant = {
//     0: Color(0xFF000000),
//     10: Color(0xFF1D1A22),
//     20: Color(0xFF322F37),
//     30: Color(0xFF49454F),
//     40: Color(0xFF605D66),
//     50: Color(0xFF787579),
//     60: Color(0xFF938F99),
//     70: Color(0xFFAEAAB4),
//     80: Color(0xFFCAC4D0),
//     90: Color(0xFFE7E0EC),
//     95: Color(0xFFF5EFF7),
//     99: Color(0xFFFFFBFE),
//     100: Color(0xFFFFFFFF),
//   };

//   /// Get a specific tone from any palette
//   ///
//   /// Returns the color for the specified tone, falling back to tone 50 if not found.
//   /// 
//   /// Parameters:
//   /// - [palette]: The color palette to get the tone from
//   /// - [tone]: The tone value (0-100)
//   static Color getColor(Map<int, Color> palette, int tone) {
//     return palette[tone] ?? palette[50]!;
//   }

//   /// Generate intermediate tones between defined ones
//   ///
//   /// This method allows you to get colors at fractional tone values by
//   /// interpolating between the nearest defined tones.
//   ///
//   /// Parameters:
//   /// - [palette]: The color palette to interpolate from
//   /// - [tone]: The exact tone value (can be fractional, e.g., 35.5)
//   static Color interpolateTone(Map<int, Color> palette, double tone) {
//     final lowerTone = (tone / 10).floor() * 10;
//     final upperTone = lowerTone + 10;

//     if (lowerTone == tone.toInt()) {
//       return palette[tone.toInt()] ?? palette[50]!;
//     }

//     final lowerColor = palette[lowerTone];
//     final upperColor = palette[upperTone];

//     if (lowerColor == null || upperColor == null) {
//       return palette[50]!;
//     }

//     final t = (tone - lowerTone) / 10;
//     return Color.lerp(lowerColor, upperColor, t) ?? palette[50]!;
//   }
// }
