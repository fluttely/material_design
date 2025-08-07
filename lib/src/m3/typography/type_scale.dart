part of '../../../material_design.dart';

/// {@template m3_type_scale_fonts}
/// Material Design 3 type scale font family constants.
///
/// These font families are optimized for Material Design 3 typography system,
/// providing excellent readability and visual hierarchy across different
/// platforms and screen sizes.
/// {@endtemplate}
abstract interface class _M3TypeScaleFonts {
  /// Primary Material Design font family.
  // static const String roboto = 'Roboto';

  /// System font stack with fallbacks.
  static const List<String> systemFontStack = [
    'Roboto',
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  /// Monospace font stack for code display.
  static const List<String> monoFontStack = [
    'Roboto Mono',
    'SFMono-Regular',
    'Monaco',
    'Consolas',
    'Liberation Mono',
    'Courier New',
    'monospace',
  ];
}

/// {@template m3_type_scale_category}
/// Defines the semantic categories of the Material 3 type scale.
/// {@endtemplate}
enum M3TypeScaleCategory {
  /// Display text - large, impactful text for hero content.
  display,

  /// Headline text - prominent headings and titles.
  headline,

  /// Title text - medium-emphasis headings and subtitles.
  title,

  /// Body text - primary content text in various sizes.
  body,

  /// Label text - supporting text for UI components.
  label;

  /// Gets all tokens that belong to this category.
  List<M3TextStyle> get tokens => switch (this) {
    display => [
      M3TextStyle.displayLarge,
      M3TextStyle.displayMedium,
      M3TextStyle.displaySmall,
    ],
    headline => [
      M3TextStyle.headlineLarge,
      M3TextStyle.headlineMedium,
      M3TextStyle.headlineSmall,
    ],
    title => [
      M3TextStyle.titleLarge,
      M3TextStyle.titleMedium,
      M3TextStyle.titleSmall,
    ],
    body => [
      M3TextStyle.bodyLarge,
      M3TextStyle.bodyMedium,
      M3TextStyle.bodySmall,
    ],
    label => [
      M3TextStyle.labelLarge,
      M3TextStyle.labelMedium,
      M3TextStyle.labelSmall,
    ],
  };

  /// Gets the largest token in this category.
  M3TextStyle get largest => tokens.first;

  /// Gets the smallest token in this category.
  M3TextStyle get smallest => tokens.last;
}

// /// Provides context-aware typography utilities.
// extension M3TypeScaleContext on BuildContext {
//   /// Gets the appropriate type scale token based on screen size and usage.
//   M3TextStyleToken getResponsiveToken({
//     required M3TextStyleToken mobile,
//     required M3TextStyleToken tablet,
//     required M3TextStyleToken desktop,
//   }) {
//     final screenWidth = MediaQuery.of(this).size.width;
//     if (screenWidth < M3BreakpointToken.medium.value) {
//       return mobile;
//     } else if (screenWidth < M3BreakpointToken.large.value) {
//       return tablet;
//     } else {
//       return desktop;
//     }
//   }

//   /// Checks if the user has enabled large text accessibility settings.
//   bool get hasLargeTextPreference =>
//       MediaQuery.of(this).textScaler.scale(16) > 20.0;

//   /// Gets the recommended body text token based on accessibility preferences.
//   M3TextStyleToken get accessibleBodyToken => hasLargeTextPreference
//       ? M3TextStyleToken.bodyLarge
//       : M3TextStyleToken.bodyMedium;

//   /// Gets the theme's text theme converted to type scale tokens.
//   Map<M3TextStyleToken, TextStyle> get typeScaleTheme => {
//         M3TextStyleToken.displayLarge:
//             Theme.of(this).textTheme.displayLarge,
//         M3TextStyleToken.displayMedium:
//             Theme.of(this).textTheme.displayMedium,
//         M3TextStyleToken.displaySmall: Theme.of(this).textTheme.displaySmall,
//         M3TextStyleToken.headlineLarge:
//             Theme.of(this).textTheme.headlineLarge,
//         M3TextStyleToken.headlineMedium:
//             Theme.of(this).textTheme.headlineMedium,
//         M3TextStyleToken.headlineSmall:
//             Theme.of(this).textTheme.headlineSmall,
//         M3TextStyleToken.titleLarge: Theme.of(this).textTheme.titleLarge,
//         M3TextStyleToken.titleMedium: Theme.of(this).textTheme.titleMedium,
//         M3TextStyleToken.titleSmall: Theme.of(this).textTheme.titleSmall,
//         M3TextStyleToken.bodyLarge: Theme.of(this).textTheme.bodyLarge,
//         M3TextStyleToken.bodyMedium: Theme.of(this).textTheme.bodyMedium,
//         M3TextStyleToken.bodySmall: Theme.of(this).textTheme.bodySmall,
//         M3TextStyleToken.labelLarge: Theme.of(this).textTheme.labelLarge,
//         M3TextStyleToken.labelMedium: Theme.of(this).textTheme.labelMedium,
//         M3TextStyleToken.labelSmall: Theme.of(this).textTheme.labelSmall,
//       };
// }
