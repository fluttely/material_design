import 'package:flutter/material.dart';

import 'tonal_palette.dart';

// TODO(Kevin): Verified
/// Material Design 3 reference palettes.
///
/// These are the base palettes from which all color schemes are derived.
/// Reference: https://m3.material.io/styles/color/the-color-system/key-colors-tones
abstract class RefPalette {
  /// Primary tonal palette - Main brand color
  static const primary = TonalPalette({
    0: Color(0xFF000000),
    10: Color(0xFF21005D),
    20: Color(0xFF381E72),
    30: Color(0xFF4F378B),
    40: Color(0xFF6750A4),
    50: Color(0xFF7F67BE),
    60: Color(0xFF9A82DB),
    70: Color(0xFFB69DF8),
    80: Color(0xFFD0BCFF),
    90: Color(0xFFEADDFF),
    95: Color(0xFFF6EDFF),
    99: Color(0xFFFFFBFE),
    100: Color(0xFFFFFFFF),
  });

  /// Secondary tonal palette - Supporting brand color
  static const secondary = TonalPalette({
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
  });

  /// Tertiary tonal palette - Accent color for special moments
  static const tertiary = TonalPalette({
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
  });

  /// Error tonal palette - Semantic color for errors
  static const error = TonalPalette({
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
  });

  /// Neutral tonal palette - Used for surfaces and backgrounds
  /// Contains additional tones for fine-grained surface control
  static const neutral = TonalPalette({
    0: Color(0xFF000000),
    4: Color(0xFF0F0D13),
    6: Color(0xFF141218),
    10: Color(0xFF1D1B20),
    12: Color(0xFF211F26),
    17: Color(0xFF2B2930),
    20: Color(0xFF322F35),
    22: Color(0xFF36343B),
    24: Color(0xFF3B383E),
    30: Color(0xFF48464C),
    40: Color(0xFF605D64),
    50: Color(0xFF79767D),
    60: Color(0xFF938F96),
    70: Color(0xFFAEAAB1),
    80: Color(0xFFCAC5CD),
    87: Color(0xFFDED8E1),
    90: Color(0xFFE6E1E9),
    92: Color(0xFFECE6F0),
    94: Color(0xFFF2ECF5),
    95: Color(0xFFF4EFF4),
    96: Color(0xFFF7F2FA),
    98: Color(0xFFFDF7FF),
    99: Color(0xFFFFFBFE),
    100: Color(0xFFFFFFFF),
  });

  /// Neutral variant tonal palette - Alternative neutral for subtle variations
  static const neutralVariant = TonalPalette({
    0: Color(0xFF000000),
    10: Color(0xFF1D1A22),
    20: Color(0xFF322F37),
    30: Color(0xFF49454F),
    40: Color(0xFF605D66),
    50: Color(0xFF79747E),
    60: Color(0xFF938F99),
    70: Color(0xFFAEA9B4),
    80: Color(0xFFCAC4D0),
    90: Color(0xFFE7E0EC),
    95: Color(0xFFF5EFFA),
    99: Color(0xFFFFFBFE),
    100: Color(0xFFFFFFFF),
  });
}
