// import 'package:flutter/material.dart';

// /// Reference color palettes for Material Design 3.
// ///
// /// These are the base color palettes from which all other colors are derived.
// /// Each palette contains tonal values from 0 (darkest) to 100 (lightest).
// ///
// /// Specification: https://m3.material.io/styles/color/the-color-system/key-colors-tones
// abstract class MdRefPalette {
//   // Primary palette tokens
//   static const Color primary0 = Color(0xFF000000);
//   static const Color primary10 = Color(0xFF21005D);
//   static const Color primary20 = Color(0xFF371E73);
//   static const Color primary30 = Color(0xFF4F378B);
//   static const Color primary40 = Color(0xFF6750A4);
//   static const Color primary50 = Color(0xFF7F67BE);
//   static const Color primary60 = Color(0xFF9A82DB);
//   static const Color primary70 = Color(0xFFB69DF8);
//   static const Color primary80 = Color(0xFFD0BCFF);
//   static const Color primary90 = Color(0xFFEADDFF);
//   static const Color primary95 = Color(0xFFF7EFFF);
//   static const Color primary99 = Color(0xFFFFFBFE);
//   static const Color primary100 = Color(0xFFFFFFFF);

//   // Secondary palette tokens
//   static const Color secondary0 = Color(0xFF000000);
//   static const Color secondary10 = Color(0xFF1D192B);
//   static const Color secondary20 = Color(0xFF332D41);
//   static const Color secondary30 = Color(0xFF4A4458);
//   static const Color secondary40 = Color(0xFF625B71);
//   static const Color secondary50 = Color(0xFF7A7289);
//   static const Color secondary60 = Color(0xFF958DA5);
//   static const Color secondary70 = Color(0xFFB0A7C0);
//   static const Color secondary80 = Color(0xFFCCC2DC);
//   static const Color secondary90 = Color(0xFFE8DEF8);
//   static const Color secondary95 = Color(0xFFF6EDFF);
//   static const Color secondary99 = Color(0xFFFFFBFE);
//   static const Color secondary100 = Color(0xFFFFFFFF);

//   // Tertiary palette tokens
//   static const Color tertiary0 = Color(0xFF000000);
//   static const Color tertiary10 = Color(0xFF31111D);
//   static const Color tertiary20 = Color(0xFF492532);
//   static const Color tertiary30 = Color(0xFF633B48);
//   static const Color tertiary40 = Color(0xFF7D5260);
//   static const Color tertiary50 = Color(0xFF986977);
//   static const Color tertiary60 = Color(0xFFB58392);
//   static const Color tertiary70 = Color(0xFFD29DAC);
//   static const Color tertiary80 = Color(0xFFEFB8C8);
//   static const Color tertiary90 = Color(0xFFFFD8E4);
//   static const Color tertiary95 = Color(0xFFFFECF1);
//   static const Color tertiary99 = Color(0xFFFFFBFA);
//   static const Color tertiary100 = Color(0xFFFFFFFF);

//   // Error palette tokens
//   static const Color error0 = Color(0xFF000000);
//   static const Color error10 = Color(0xFF410E0B);
//   static const Color error20 = Color(0xFF601410);
//   static const Color error30 = Color(0xFF8C1D18);
//   static const Color error40 = Color(0xFFB3261E);
//   static const Color error50 = Color(0xFFDC362E);
//   static const Color error60 = Color(0xFFE46962);
//   static const Color error70 = Color(0xFFEC928E);
//   static const Color error80 = Color(0xFFF2B8B5);
//   static const Color error90 = Color(0xFFF9DEDC);
//   static const Color error95 = Color(0xFFFCEEEE);
//   static const Color error99 = Color(0xFFFFFBF9);
//   static const Color error100 = Color(0xFFFFFFFF);

//   // Neutral palette tokens
//   static const Color neutral0 = Color(0xFF000000);
//   static const Color neutral4 = Color(0xFF0F0D13);
//   static const Color neutral6 = Color(0xFF141218);
//   static const Color neutral10 = Color(0xFF1D1B20);
//   static const Color neutral12 = Color(0xFF1F1D22);
//   static const Color neutral17 = Color(0xFF262529);
//   static const Color neutral20 = Color(0xFF322F35);
//   static const Color neutral22 = Color(0xFF36343B);
//   static const Color neutral24 = Color(0xFF3A383D);
//   static const Color neutral30 = Color(0xFF48464C);
//   static const Color neutral40 = Color(0xFF605D64);
//   static const Color neutral50 = Color(0xFF787579);
//   static const Color neutral60 = Color(0xFF939094);
//   static const Color neutral70 = Color(0xFFAEAAAF);
//   static const Color neutral80 = Color(0xFFCAC4D0);
//   static const Color neutral87 = Color(0xFFDDD8E0);
//   static const Color neutral90 = Color(0xFFE6E0E9);
//   static const Color neutral92 = Color(0xFFECE6F0);
//   static const Color neutral94 = Color(0xFFF1EAEE);
//   static const Color neutral95 = Color(0xFFF3EDF7);
//   static const Color neutral96 = Color(0xFFF5EFF9);
//   static const Color neutral98 = Color(0xFFFBF8FD);
//   static const Color neutral99 = Color(0xFFFFFBFE);
//   static const Color neutral100 = Color(0xFFFFFFFF);

//   // Neutral variant palette tokens
//   static const Color neutralVariant0 = Color(0xFF000000);
//   static const Color neutralVariant10 = Color(0xFF1D1A22);
//   static const Color neutralVariant20 = Color(0xFF322F37);
//   static const Color neutralVariant30 = Color(0xFF49454F);
//   static const Color neutralVariant40 = Color(0xFF605D66);
//   static const Color neutralVariant50 = Color(0xFF787579);
//   static const Color neutralVariant60 = Color(0xFF939094);
//   static const Color neutralVariant70 = Color(0xFFAEAAB4);
//   static const Color neutralVariant80 = Color(0xFFCAC4D0);
//   static const Color neutralVariant90 = Color(0xFFE7E0EC);
//   static const Color neutralVariant95 = Color(0xFFF5EFFA);
//   static const Color neutralVariant99 = Color(0xFFFFFBFE);
//   static const Color neutralVariant100 = Color(0xFFFFFFFF);

//   /// Get a color from a specific palette at a given tone level.
//   ///
//   /// [palette] should be one of the static color values above.
//   /// [tone] should be a value from 0 to 100.
//   static Color getColor(String palette, int tone) {
//     switch (palette) {
//       case 'primary':
//         return _getPrimaryColor(tone);
//       case 'secondary':
//         return _getSecondaryColor(tone);
//       case 'tertiary':
//         return _getTertiaryColor(tone);
//       case 'error':
//         return _getErrorColor(tone);
//       case 'neutral':
//         return _getNeutralColor(tone);
//       case 'neutralVariant':
//         return _getNeutralVariantColor(tone);
//       default:
//         throw ArgumentError('Unknown palette: $palette');
//     }
//   }

//   static Color _getPrimaryColor(int tone) {
//     switch (tone) {
//       case 0:
//         return primary0;
//       case 10:
//         return primary10;
//       case 20:
//         return primary20;
//       case 30:
//         return primary30;
//       case 40:
//         return primary40;
//       case 50:
//         return primary50;
//       case 60:
//         return primary60;
//       case 70:
//         return primary70;
//       case 80:
//         return primary80;
//       case 90:
//         return primary90;
//       case 95:
//         return primary95;
//       case 99:
//         return primary99;
//       case 100:
//         return primary100;
//       default:
//         throw ArgumentError('Invalid tone: $tone');
//     }
//   }

//   static Color _getSecondaryColor(int tone) {
//     switch (tone) {
//       case 0:
//         return secondary0;
//       case 10:
//         return secondary10;
//       case 20:
//         return secondary20;
//       case 30:
//         return secondary30;
//       case 40:
//         return secondary40;
//       case 50:
//         return secondary50;
//       case 60:
//         return secondary60;
//       case 70:
//         return secondary70;
//       case 80:
//         return secondary80;
//       case 90:
//         return secondary90;
//       case 95:
//         return secondary95;
//       case 99:
//         return secondary99;
//       case 100:
//         return secondary100;
//       default:
//         throw ArgumentError('Invalid tone: $tone');
//     }
//   }

//   static Color _getTertiaryColor(int tone) {
//     switch (tone) {
//       case 0:
//         return tertiary0;
//       case 10:
//         return tertiary10;
//       case 20:
//         return tertiary20;
//       case 30:
//         return tertiary30;
//       case 40:
//         return tertiary40;
//       case 50:
//         return tertiary50;
//       case 60:
//         return tertiary60;
//       case 70:
//         return tertiary70;
//       case 80:
//         return tertiary80;
//       case 90:
//         return tertiary90;
//       case 95:
//         return tertiary95;
//       case 99:
//         return tertiary99;
//       case 100:
//         return tertiary100;
//       default:
//         throw ArgumentError('Invalid tone: $tone');
//     }
//   }

//   static Color _getErrorColor(int tone) {
//     switch (tone) {
//       case 0:
//         return error0;
//       case 10:
//         return error10;
//       case 20:
//         return error20;
//       case 30:
//         return error30;
//       case 40:
//         return error40;
//       case 50:
//         return error50;
//       case 60:
//         return error60;
//       case 70:
//         return error70;
//       case 80:
//         return error80;
//       case 90:
//         return error90;
//       case 95:
//         return error95;
//       case 99:
//         return error99;
//       case 100:
//         return error100;
//       default:
//         throw ArgumentError('Invalid tone: $tone');
//     }
//   }

//   static Color _getNeutralColor(int tone) {
//     switch (tone) {
//       case 0:
//         return neutral0;
//       case 4:
//         return neutral4;
//       case 6:
//         return neutral6;
//       case 10:
//         return neutral10;
//       case 12:
//         return neutral12;
//       case 17:
//         return neutral17;
//       case 20:
//         return neutral20;
//       case 22:
//         return neutral22;
//       case 24:
//         return neutral24;
//       case 30:
//         return neutral30;
//       case 40:
//         return neutral40;
//       case 50:
//         return neutral50;
//       case 60:
//         return neutral60;
//       case 70:
//         return neutral70;
//       case 80:
//         return neutral80;
//       case 87:
//         return neutral87;
//       case 90:
//         return neutral90;
//       case 92:
//         return neutral92;
//       case 94:
//         return neutral94;
//       case 95:
//         return neutral95;
//       case 96:
//         return neutral96;
//       case 98:
//         return neutral98;
//       case 99:
//         return neutral99;
//       case 100:
//         return neutral100;
//       default:
//         throw ArgumentError('Invalid tone: $tone');
//     }
//   }

//   static Color _getNeutralVariantColor(int tone) {
//     switch (tone) {
//       case 0:
//         return neutralVariant0;
//       case 10:
//         return neutralVariant10;
//       case 20:
//         return neutralVariant20;
//       case 30:
//         return neutralVariant30;
//       case 40:
//         return neutralVariant40;
//       case 50:
//         return neutralVariant50;
//       case 60:
//         return neutralVariant60;
//       case 70:
//         return neutralVariant70;
//       case 80:
//         return neutralVariant80;
//       case 90:
//         return neutralVariant90;
//       case 95:
//         return neutralVariant95;
//       case 99:
//         return neutralVariant99;
//       case 100:
//         return neutralVariant100;
//       default:
//         throw ArgumentError('Invalid tone: $tone');
//     }
//   }
// }
