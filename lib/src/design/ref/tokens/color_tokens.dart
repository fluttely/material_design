/// Color tokens based on Material Design 3 reference specification.
///
/// Reference: https://m3.material.io/styles/color/roles
library;

import 'dart:ui';

/// Reference color tokens that define the base color values
/// used throughout the Material 3 design system.
abstract class M3ColorTokens {
  // Primary color tokens
  static const Color primary0 = Color(0xFF000000);
  static const Color primary10 = Color(0xFF21005D);
  static const Color primary20 = Color(0xFF381E72);
  static const Color primary25 = Color(0xFF432B7B);
  static const Color primary30 = Color(0xFF4F378B);
  static const Color primary35 = Color(0xFF5B4397);
  static const Color primary40 = Color(0xFF6750A4);
  static const Color primary50 = Color(0xFF7F70B8);
  static const Color primary60 = Color(0xFF9A8DCC);
  static const Color primary70 = Color(0xFFB5A9E1);
  static const Color primary80 = Color(0xFFD0C4F7);
  static const Color primary90 = Color(0xFFEADDFF);
  static const Color primary95 = Color(0xFFF4EEFF);
  static const Color primary99 = Color(0xFFFFFBFF);
  static const Color primary100 = Color(0xFFFFFFFF);

  // Secondary color tokens
  static const Color secondary0 = Color(0xFF000000);
  static const Color secondary10 = Color(0xFF1D192B);
  static const Color secondary20 = Color(0xFF332D41);
  static const Color secondary25 = Color(0xFF3E384D);
  static const Color secondary30 = Color(0xFF4A4458);
  static const Color secondary35 = Color(0xFF565064);
  static const Color secondary40 = Color(0xFF625B71);
  static const Color secondary50 = Color(0xFF7A7289);
  static const Color secondary60 = Color(0xFF958DA2);
  static const Color secondary70 = Color(0xFFB0A7BC);
  static const Color secondary80 = Color(0xFFCCC2D7);
  static const Color secondary90 = Color(0xFFE8DEF3);
  static const Color secondary95 = Color(0xFFF6EDFF);
  static const Color secondary99 = Color(0xFFFFFBFF);
  static const Color secondary100 = Color(0xFFFFFFFF);

  // Tertiary color tokens
  static const Color tertiary0 = Color(0xFF000000);
  static const Color tertiary10 = Color(0xFF31111D);
  static const Color tertiary20 = Color(0xFF492532);
  static const Color tertiary25 = Color(0xFF56303E);
  static const Color tertiary30 = Color(0xFF633B48);
  static const Color tertiary35 = Color(0xFF714654);
  static const Color tertiary40 = Color(0xFF7F5260);
  static const Color tertiary50 = Color(0xFF9C6A79);
  static const Color tertiary60 = Color(0xFFBA8393);
  static const Color tertiary70 = Color(0xFFD79CAE);
  static const Color tertiary80 = Color(0xFFF5B6C9);
  static const Color tertiary90 = Color(0xFFFFD8E5);
  static const Color tertiary95 = Color(0xFFFFECF2);
  static const Color tertiary99 = Color(0xFFFFFBFF);
  static const Color tertiary100 = Color(0xFFFFFFFF);

  // Error color tokens
  static const Color error0 = Color(0xFF000000);
  static const Color error10 = Color(0xFF410E0B);
  static const Color error20 = Color(0xFF601410);
  static const Color error25 = Color(0xFF6F1913);
  static const Color error30 = Color(0xFF8C1D18);
  static const Color error35 = Color(0xFF98221C);
  static const Color error40 = Color(0xFFB3261E);
  static const Color error50 = Color(0xFFDC362E);
  static const Color error60 = Color(0xFFE46962);
  static const Color error70 = Color(0xFFEC928E);
  static const Color error80 = Color(0xFFF2B8B5);
  static const Color error90 = Color(0xFFF9DEDC);
  static const Color error95 = Color(0xFFFCEEEE);
  static const Color error99 = Color(0xFFFFFBFF);
  static const Color error100 = Color(0xFFFFFFFF);

  // Neutral color tokens
  static const Color neutral0 = Color(0xFF000000);
  static const Color neutral10 = Color(0xFF1C1B1F);
  static const Color neutral20 = Color(0xFF313033);
  static const Color neutral25 = Color(0xFF3C3A3E);
  static const Color neutral30 = Color(0xFF48464A);
  static const Color neutral35 = Color(0xFF545256);
  static const Color neutral40 = Color(0xFF605D62);
  static const Color neutral50 = Color(0xFF797679);
  static const Color neutral60 = Color(0xFF938F94);
  static const Color neutral70 = Color(0xFFAEAAAF);
  static const Color neutral80 = Color(0xFFCAC5CA);
  static const Color neutral90 = Color(0xFFE7E0E5);
  static const Color neutral95 = Color(0xFFF5EFF2);
  static const Color neutral99 = Color(0xFFFFFBFF);
  static const Color neutral100 = Color(0xFFFFFFFF);

  // Neutral variant color tokens
  static const Color neutralVariant0 = Color(0xFF000000);
  static const Color neutralVariant10 = Color(0xFF1D1A22);
  static const Color neutralVariant20 = Color(0xFF322F37);
  static const Color neutralVariant25 = Color(0xFF3D3A42);
  static const Color neutralVariant30 = Color(0xFF49454E);
  static const Color neutralVariant35 = Color(0xFF55515A);
  static const Color neutralVariant40 = Color(0xFF615D66);
  static const Color neutralVariant50 = Color(0xFF7A757E);
  static const Color neutralVariant60 = Color(0xFF948F97);
  static const Color neutralVariant70 = Color(0xFFAFA9B1);
  static const Color neutralVariant80 = Color(0xFFCAC4CC);
  static const Color neutralVariant90 = Color(0xFFE7DFE7);
  static const Color neutralVariant95 = Color(0xFFF5EFF3);
  static const Color neutralVariant99 = Color(0xFFFFFBFF);
  static const Color neutralVariant100 = Color(0xFFFFFFFF);
}

/// Surface color tokens for different elevation levels.
abstract class M3SurfaceTokens {
  // Surface containers at different elevation levels
  static const Color surface = M3ColorTokens.neutral99;
  static const Color surfaceDim = Color(0xFFDED8E1);
  static const Color surfaceBright = Color(0xFFFEF7FF);
  static const Color surfaceContainerLowest = M3ColorTokens.neutral100;
  static const Color surfaceContainerLow = Color(0xFFF7F2FA);
  static const Color surfaceContainer = Color(0xFFF3EDF7);
  static const Color surfaceContainerHigh = Color(0xFFECE6F0);
  static const Color surfaceContainerHighest = Color(0xFFE6E0E9);
}

/// Outline color tokens for borders and dividers.
abstract class M3OutlineTokens {
  static const Color outline = M3ColorTokens.neutralVariant50;
  static const Color outlineVariant = M3ColorTokens.neutralVariant80;
}

/// Special color tokens for specific use cases.
abstract class M3SpecialTokens {
  static const Color shadow = M3ColorTokens.neutral0;
  static const Color scrim = M3ColorTokens.neutral0;
  static const Color inverseSurface = M3ColorTokens.neutral20;
  static const Color inverseOnSurface = M3ColorTokens.neutral95;
  static const Color inversePrimary = M3ColorTokens.primary80;
}