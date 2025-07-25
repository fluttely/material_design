import 'package:flutter/material.dart';

/// Material Design 3 Reference Palette Tokens.
///
/// This class contains the official baseline color palette from Material Design 3
/// specification. These reference colors form the foundation of the Material 3
/// color system and are used to generate semantic color roles.
///
/// Each palette contains tonal variations from 0 (black) to 100 (white) in
/// increments of 10, following the Material Design 3 tonal palette system.
///
/// The baseline palette uses the following source colors:
/// - Primary: #6750A4 (Violet 70)
/// - Secondary: #625B71 (Neutral Variant 50)
/// - Tertiary: #7D5260 (Complementary Accent)
/// - Neutral: #67616F (Neutral 50)
/// - Neutral Variant: #68616B (Neutral Variant 50)
/// - Error: #BA1A1A (Red 60)
///
/// Reference: https://m3.material.io/styles/color/the-color-system/tokens
abstract class _M3RefPalette {
  // Primary Palette - Main brand colors
  /// Primary tone 0 - Pure black
  static const Color primary0 = Color(0xFF000000);
  
  /// Primary tone 10 - Very dark primary, used for high-emphasis text on light surfaces
  static const Color primary10 = Color(0xFF21005D);
  
  /// Primary tone 20 - Dark primary, used for primary container in dark theme
  static const Color primary20 = Color(0xFF371E73);
  
  /// Primary tone 30 - Dark primary, used for on-primary container in dark theme
  static const Color primary30 = Color(0xFF4F378B);
  
  /// Primary tone 40 - Primary color in light theme
  static const Color primary40 = Color(0xFF6750A4);
  
  /// Primary tone 50 - Mid-tone primary
  static const Color primary50 = Color(0xFF7F67BE);
  
  /// Primary tone 60 - Light primary
  static const Color primary60 = Color(0xFF9A82DB);
  
  /// Primary tone 70 - Light primary
  static const Color primary70 = Color(0xFFB69DF8);
  
  /// Primary tone 80 - Very light primary, used for on-primary container in light theme
  static const Color primary80 = Color(0xFFD0BCFF);
  
  /// Primary tone 90 - Primary container in light theme
  static const Color primary90 = Color(0xFFEADDFF);
  
  /// Primary tone 95 - Very light primary
  static const Color primary95 = Color(0xFFF6EDFF);
  
  /// Primary tone 99 - Nearly white primary
  static const Color primary99 = Color(0xFFFFFBFE);
  
  /// Primary tone 100 - Pure white
  static const Color primary100 = Color(0xFFFFFFFF);

  // Secondary Palette - Supporting accent colors
  /// Secondary tone 0 - Pure black
  static const Color secondary0 = Color(0xFF000000);
  
  /// Secondary tone 10 - Very dark secondary
  static const Color secondary10 = Color(0xFF1D192B);
  
  /// Secondary tone 20 - Dark secondary
  static const Color secondary20 = Color(0xFF332D41);
  
  /// Secondary tone 30 - Dark secondary
  static const Color secondary30 = Color(0xFF4A4458);
  
  /// Secondary tone 40 - Secondary color in light theme
  static const Color secondary40 = Color(0xFF625B71);
  
  /// Secondary tone 50 - Mid-tone secondary
  static const Color secondary50 = Color(0xFF7C7289);
  
  /// Secondary tone 60 - Light secondary
  static const Color secondary60 = Color(0xFF968CA3);
  
  /// Secondary tone 70 - Light secondary
  static const Color secondary70 = Color(0xFFB0A7C0);
  
  /// Secondary tone 80 - Very light secondary
  static const Color secondary80 = Color(0xFFCCC2DC);
  
  /// Secondary tone 90 - Secondary container in light theme
  static const Color secondary90 = Color(0xFFE8DEF8);
  
  /// Secondary tone 95 - Very light secondary
  static const Color secondary95 = Color(0xFFF6EDFF);
  
  /// Secondary tone 99 - Nearly white secondary
  static const Color secondary99 = Color(0xFFFFFBFE);
  
  /// Secondary tone 100 - Pure white
  static const Color secondary100 = Color(0xFFFFFFFF);

  // Tertiary Palette - Additional accent colors for balance
  /// Tertiary tone 0 - Pure black
  static const Color tertiary0 = Color(0xFF000000);
  
  /// Tertiary tone 10 - Very dark tertiary
  static const Color tertiary10 = Color(0xFF31111D);
  
  /// Tertiary tone 20 - Dark tertiary
  static const Color tertiary20 = Color(0xFF492532);
  
  /// Tertiary tone 30 - Dark tertiary
  static const Color tertiary30 = Color(0xFF633B48);
  
  /// Tertiary tone 40 - Tertiary color in light theme
  static const Color tertiary40 = Color(0xFF7D5260);
  
  /// Tertiary tone 50 - Mid-tone tertiary
  static const Color tertiary50 = Color(0xFF986977);
  
  /// Tertiary tone 60 - Light tertiary
  static const Color tertiary60 = Color(0xFFB58392);
  
  /// Tertiary tone 70 - Light tertiary
  static const Color tertiary70 = Color(0xFFD29DAC);
  
  /// Tertiary tone 80 - Very light tertiary
  static const Color tertiary80 = Color(0xFFEFB8C8);
  
  /// Tertiary tone 90 - Tertiary container in light theme
  static const Color tertiary90 = Color(0xFFFFD8E4);
  
  /// Tertiary tone 95 - Very light tertiary
  static const Color tertiary95 = Color(0xFFFFECF1);
  
  /// Tertiary tone 99 - Nearly white tertiary
  static const Color tertiary99 = Color(0xFFFFFBFA);
  
  /// Tertiary tone 100 - Pure white
  static const Color tertiary100 = Color(0xFFFFFFFF);

  // Neutral Palette - Surfaces and outlines
  /// Neutral tone 0 - Pure black, used for highest emphasis text
  static const Color neutral0 = Color(0xFF000000);
  
  /// Neutral tone 10 - Very dark neutral, used for surfaces in dark theme
  static const Color neutral10 = Color(0xFF1C1B1F);
  
  /// Neutral tone 20 - Dark neutral
  static const Color neutral20 = Color(0xFF313033);
  
  /// Neutral tone 30 - Dark neutral
  static const Color neutral30 = Color(0xFF484649);
  
  /// Neutral tone 40 - Mid-dark neutral
  static const Color neutral40 = Color(0xFF605D62);
  
  /// Neutral tone 50 - Mid-tone neutral, used for medium-emphasis text
  static const Color neutral50 = Color(0xFF787579);
  
  /// Neutral tone 60 - Light neutral
  static const Color neutral60 = Color(0xFF939094);
  
  /// Neutral tone 70 - Light neutral
  static const Color neutral70 = Color(0xFFAEAAAE);
  
  /// Neutral tone 80 - Very light neutral
  static const Color neutral80 = Color(0xFFCAC4D0);
  
  /// Neutral tone 90 - Light surface color
  static const Color neutral90 = Color(0xFFE6E0E9);
  
  /// Neutral tone 95 - Very light surface color
  static const Color neutral95 = Color(0xFFF4EFF4);
  
  /// Neutral tone 99 - Nearly white surface, used for background in light theme
  static const Color neutral99 = Color(0xFFFFFBFE);
  
  /// Neutral tone 100 - Pure white
  static const Color neutral100 = Color(0xFFFFFFFF);

  // Neutral Variant Palette - Lower emphasis surfaces
  /// Neutral variant tone 0 - Pure black
  static const Color neutralVariant0 = Color(0xFF000000);
  
  /// Neutral variant tone 10 - Very dark neutral variant
  static const Color neutralVariant10 = Color(0xFF1D1A22);
  
  /// Neutral variant tone 20 - Dark neutral variant
  static const Color neutralVariant20 = Color(0xFF322F37);
  
  /// Neutral variant tone 30 - Dark neutral variant, used for outline
  static const Color neutralVariant30 = Color(0xFF49454F);
  
  /// Neutral variant tone 40 - Mid-dark neutral variant
  static const Color neutralVariant40 = Color(0xFF605D66);
  
  /// Neutral variant tone 50 - Mid-tone neutral variant, used for outline
  static const Color neutralVariant50 = Color(0xFF79747E);
  
  /// Neutral variant tone 60 - Light neutral variant
  static const Color neutralVariant60 = Color(0xFF938F99);
  
  /// Neutral variant tone 70 - Light neutral variant
  static const Color neutralVariant70 = Color(0xFFAEAAB4);
  
  /// Neutral variant tone 80 - Very light neutral variant, used for surface variant
  static const Color neutralVariant80 = Color(0xFFCAC4D0);
  
  /// Neutral variant tone 90 - Light surface variant
  static const Color neutralVariant90 = Color(0xFFE7E0EC);
  
  /// Neutral variant tone 95 - Very light surface variant
  static const Color neutralVariant95 = Color(0xFFF5EFF7);
  
  /// Neutral variant tone 99 - Nearly white surface variant
  static const Color neutralVariant99 = Color(0xFFFFFBFE);
  
  /// Neutral variant tone 100 - Pure white
  static const Color neutralVariant100 = Color(0xFFFFFFFF);

  // Error Palette - Error states and warnings
  /// Error tone 0 - Pure black
  static const Color error0 = Color(0xFF000000);
  
  /// Error tone 10 - Very dark error, used for on-error container in dark theme
  static const Color error10 = Color(0xFF410E0B);
  
  /// Error tone 20 - Dark error, used for error container in dark theme
  static const Color error20 = Color(0xFF601410);
  
  /// Error tone 30 - Dark error
  static const Color error30 = Color(0xFF8C1D18);
  
  /// Error tone 40 - Error color in light theme
  static const Color error40 = Color(0xFFB3261E);
  
  /// Error tone 50 - Mid-tone error
  static const Color error50 = Color(0xFFDC362E);
  
  /// Error tone 60 - Light error
  static const Color error60 = Color(0xFFE46962);
  
  /// Error tone 70 - Light error
  static const Color error70 = Color(0xFFEC928E);
  
  /// Error tone 80 - Very light error, used for on-error container in light theme
  static const Color error80 = Color(0xFFF2B8B5);
  
  /// Error tone 90 - Error container in light theme
  static const Color error90 = Color(0xFFF9DEDC);
  
  /// Error tone 95 - Very light error
  static const Color error95 = Color(0xFFFCEEEE);
  
  /// Error tone 99 - Nearly white error
  static const Color error99 = Color(0xFFFFFBF9);
  
  /// Error tone 100 - Pure white
  static const Color error100 = Color(0xFFFFFFFF);
}