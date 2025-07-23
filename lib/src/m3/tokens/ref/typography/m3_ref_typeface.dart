// /// Material Design 3 Reference Typeface
// /// 
// /// Contains the base typeface configuration used throughout the M3 design system.
// /// Defines font families, weights, and other typographic foundations.
// /// 
// /// Based on: https://m3.material.io/styles/typography/type-scale-tokens
// abstract class M3RefTypeface {
//   /// Primary font family - Default for most text
//   static const String brand = 'Roboto';
  
//   /// Plain font family - For body text and reading
//   static const String plain = 'Roboto';
  
//   /// Default font families list with fallbacks
//   static const List<String> fontFamilies = [
//     brand,
//     'system-ui',
//     '-apple-system',
//     'BlinkMacSystemFont',
//     'Segoe UI',
//     'Helvetica Neue',
//     'Arial',
//     'sans-serif',
//   ];

//   /// Available font weights
//   static const int weightThin = 100;
//   static const int weightExtraLight = 200;
//   static const int weightLight = 300;
//   static const int weightRegular = 400;
//   static const int weightMedium = 500;
//   static const int weightSemiBold = 600;
//   static const int weightBold = 700;
//   static const int weightExtraBold = 800;
//   static const int weightBlack = 900;

//   /// Standard weights used in M3 type scale
//   static const int displayWeight = weightRegular;
//   static const int headlineWeight = weightRegular;
//   static const int titleWeight = weightRegular;
//   static const int bodyWeight = weightRegular;
//   static const int labelWeight = weightMedium;

//   /// Letter spacing values (in em units)
//   static const double letterSpacingTight = -0.025;
//   static const double letterSpacingNormal = 0.0;
//   static const double letterSpacingWide = 0.025;
//   static const double letterSpacingExtraWide = 0.05;

//   /// Line height multipliers
//   static const double lineHeightTight = 1.2;
//   static const double lineHeightNormal = 1.4;
//   static const double lineHeightLoose = 1.6;

//   /// Font feature settings for improved readability
//   static const List<String> fontFeatures = [
//     'kern', // Kerning
//     'liga', // Standard ligatures
//     'clig', // Contextual ligatures
//     'calt', // Contextual alternates
//   ];

//   /// Font variation settings for variable fonts
//   static const Map<String, double> fontVariations = {
//     'wght': 400.0, // Weight
//     'opsz': 14.0,  // Optical size
//   };
// }