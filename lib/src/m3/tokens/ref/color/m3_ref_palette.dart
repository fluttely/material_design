import 'package:flutter/material.dart';

/// Material Design 3 Reference Color Palette
/// 
/// Contains the base color palettes used to generate the M3 color system.
/// These are the foundation colors from which all semantic colors are derived.
/// 
/// Based on: https://m3.material.io/styles/color/the-color-system/tokens
abstract class M3RefPalette {
  /// Primary color palette (13 tones from 0-100)
  static const Map<int, Color> primary = {
    0: Color(0xFF000000),
    10: Color(0xFF21005D),
    20: Color(0xFF381E72),
    30: Color(0xFF4F378B),
    40: Color(0xFF6750A4),
    50: Color(0xFF7F5AF0),
    60: Color(0xFF9A82DB),
    70: Color(0xFFB69DF8),
    80: Color(0xFFD0BCFF),
    90: Color(0xFFEADDFF),
    95: Color(0xFFF6EDFF),
    99: Color(0xFFFFFBFE),
    100: Color(0xFFFFFFFF),
  };

  /// Secondary color palette (13 tones from 0-100)
  static const Map<int, Color> secondary = {
    0: Color(0xFF000000),
    10: Color(0xFF1D192B),
    20: Color(0xFF332D41),
    30: Color(0xFF4A4458),
    40: Color(0xFF625B71),
    50: Color(0xFF7A7289),
    60: Color(0xFF958DA5),
    70: Color(0xFFB0A7C0),
    80: Color(0xFFCCC2DC),
    90: Color(0xFFE8DEF8),
    95: Color(0xFFF6EDFF),
    99: Color(0xFFFFFBFE),
    100: Color(0xFFFFFFFF),
  };

  /// Tertiary color palette (13 tones from 0-100)
  static const Map<int, Color> tertiary = {
    0: Color(0xFF000000),
    10: Color(0xFF31111D),
    20: Color(0xFF492532),
    30: Color(0xFF633B48),
    40: Color(0xFF7D5260),
    50: Color(0xFF986977),
    60: Color(0xFFB58392),
    70: Color(0xFFD29DAC),
    80: Color(0xFFEFB8C8),
    90: Color(0xFFFFD8E4),
    95: Color(0xFFFFECF1),
    99: Color(0xFFFFFBFA),
    100: Color(0xFFFFFFFF),
  };

  /// Error color palette (13 tones from 0-100)
  static const Map<int, Color> error = {
    0: Color(0xFF000000),
    10: Color(0xFF410E0B),
    20: Color(0xFF601410),
    30: Color(0xFF8C1D18),
    40: Color(0xFFB3261E),
    50: Color(0xFFDC362E),
    60: Color(0xFFE46962),
    70: Color(0xFFEC928E),
    80: Color(0xFFF2B8B5),
    90: Color(0xFFF9DEDC),
    95: Color(0xFFFCEEEE),
    99: Color(0xFFFFFBF9),
    100: Color(0xFFFFFFFF),
  };

  /// Neutral color palette (13 tones from 0-100)
  static const Map<int, Color> neutral = {
    0: Color(0xFF000000),
    10: Color(0xFF1C1B1F),
    20: Color(0xFF313033),
    30: Color(0xFF484649),
    40: Color(0xFF605D62),
    50: Color(0xFF787579),
    60: Color(0xFF939094),
    70: Color(0xFFAEAAAE),
    80: Color(0xFFCAC4D0),
    90: Color(0xFFE6E0E9),
    95: Color(0xFFF4EFF4),
    99: Color(0xFFFFFBFE),
    100: Color(0xFFFFFFFF),
  };

  /// Neutral variant color palette (13 tones from 0-100)
  static const Map<int, Color> neutralVariant = {
    0: Color(0xFF000000),
    10: Color(0xFF1D1A22),
    20: Color(0xFF322F37),
    30: Color(0xFF49454F),
    40: Color(0xFF605D66),
    50: Color(0xFF787579),
    60: Color(0xFF938F99),
    70: Color(0xFFAEAAB4),
    80: Color(0xFFCAC4D0),
    90: Color(0xFFE7E0EC),
    95: Color(0xFFF5EFF7),
    99: Color(0xFFFFFBFE),
    100: Color(0xFFFFFFFF),
  };

  /// Get a specific tone from any palette
  static Color getColor(Map<int, Color> palette, int tone) {
    return palette[tone] ?? palette[50]!;
  }

  /// Generate intermediate tones between defined ones
  static Color interpolateTone(Map<int, Color> palette, double tone) {
    final lowerTone = (tone / 10).floor() * 10;
    final upperTone = lowerTone + 10;
    
    if (lowerTone == tone.toInt()) {
      return palette[tone.toInt()] ?? palette[50]!;
    }

    final lowerColor = palette[lowerTone];
    final upperColor = palette[upperTone];
    
    if (lowerColor == null || upperColor == null) {
      return palette[50]!;
    }

    final t = (tone - lowerTone) / 10;
    return Color.lerp(lowerColor, upperColor, t) ?? palette[50]!;
  }
}