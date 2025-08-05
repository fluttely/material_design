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

/// Provides utility methods for working with type scale tokens.
extension M3TextStyleUtils on M3TextStyle {
  /// Gets the semantic category this token belongs to.
  M3TypeScaleCategory get category => switch (this) {
        M3TextStyle.displayLarge ||
        M3TextStyle.displayMedium ||
        M3TextStyle.displaySmall =>
          M3TypeScaleCategory.display,
        M3TextStyle.headlineLarge ||
        M3TextStyle.headlineMedium ||
        M3TextStyle.headlineSmall =>
          M3TypeScaleCategory.headline,
        M3TextStyle.titleLarge ||
        M3TextStyle.titleMedium ||
        M3TextStyle.titleSmall =>
          M3TypeScaleCategory.title,
        M3TextStyle.bodyLarge ||
        M3TextStyle.bodyMedium ||
        M3TextStyle.bodySmall =>
          M3TypeScaleCategory.body,
        M3TextStyle.labelLarge ||
        M3TextStyle.labelMedium ||
        M3TextStyle.labelSmall =>
          M3TypeScaleCategory.label,
        _ =>
          M3TypeScaleCategory.label, // TODO(fluttely): put default value here
      };

  /// Gets the font size in logical pixels.
  double get fontSize => this.fontSize!;

  /// Gets the line height in logical pixels.
  double get lineHeight => fontSize * (height ?? 1.0);

  /// Checks if this token has a larger font size than another.
  bool isLargerThan(M3TextStyle other) => fontSize > other.fontSize!;

  /// Checks if this token has a smaller font size than another.
  bool isSmallerThan(M3TextStyle other) => fontSize < other.fontSize!;

  /// Returns the difference in font size between this and another token.
  double fontSizeDifferenceFrom(M3TextStyle other) =>
      (fontSize - other.fontSize!).abs();

  /// Gets the next larger token in the same category, if available.
  M3TextStyle? get nextLarger {
    final categoryTokens = category.tokens;
    final currentIndex = categoryTokens.indexOf(this);
    return currentIndex > 0 ? categoryTokens[currentIndex - 1] : null;
  }

  /// Gets the next smaller token in the same category, if available.
  M3TextStyle? get nextSmaller {
    final categoryTokens = category.tokens;
    final currentIndex = categoryTokens.indexOf(this);
    return currentIndex < categoryTokens.length - 1
        ? categoryTokens[currentIndex + 1]
        : null;
  }

  /// Creates a text style with specified color.
  TextStyle withColor(Color color) => copyWith(color: color);

  /// Creates a text style with specified font weight.
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);

  /// Creates a text style with specified font family.
  TextStyle withFontFamily(String family, {List<String>? fallbacks}) =>
      copyWith(
        fontFamily: family,
        fontFamilyFallback: fallbacks ?? _M3TypeScaleFonts.systemFontStack,
      );

  /// Creates an adaptive text style that scales with user preferences.
  TextStyle adaptive(
    BuildContext context, {
    double? minFontSize,
    double? maxFontSize,
  }) =>
      M3TextStyle.adaptive(
        baseStyle: this,
        context: context,
        minFontSize: minFontSize,
        maxFontSize: maxFontSize,
      );

  /// Creates a text style optimized for accessibility.
  TextStyle get accessible => M3TextStyle.enhancedReadability(this);

  /// Creates a high contrast version of this text style.
  TextStyle get highContrast => M3TextStyle.highContrast(this);

  /// Creates a monospace variant for code display.
  TextStyle get monospace => M3TextStyle.monoVariant(this);

  /// Creates a responsive text style based on screen size.
  TextStyle responsive(BuildContext context) {
    if (category != M3TypeScaleCategory.display) return this;
    return M3TextStyle.responsiveDisplay(context);
  }

  /// Checks if this token is suitable for long-form reading.
  bool get isReadingOptimized => switch (this) {
        M3TextStyle.bodyLarge || M3TextStyle.bodyMedium => true,
        _ => false,
      };

  /// Checks if this token is suitable for UI labels.
  bool get isLabelOptimized => category == M3TypeScaleCategory.label;

  /// Checks if this token is suitable for headings.
  bool get isHeadingOptimized => switch (category) {
        M3TypeScaleCategory.display ||
        M3TypeScaleCategory.headline ||
        M3TypeScaleCategory.title =>
          true,
        _ => false,
      };

  /// Creates a Text widget with this style.
  Text text(
    String data, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      Text(
        data,
        style: color != null ? withColor(color) : this,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      );

  /// Creates a SelectableText widget with this style.
  SelectableText selectableText(
    String data, {
    Color? color,
    TextAlign? textAlign,
  }) =>
      SelectableText(
        data,
        style: color != null ? withColor(color) : this,
        textAlign: textAlign,
      );
}

/// Provides comparison utilities for type scale tokens.
extension M3TextStyleTokenComparison on M3TextStyle {
  /// Returns the token with the larger font size.
  M3TextStyle max(M3TextStyle other) =>
      fontSize! >= other.fontSize! ? this : other;

  /// Returns the token with the smaller font size.
  M3TextStyle min(M3TextStyle other) =>
      fontSize! <= other.fontSize! ? this : other;

  /// Calculates the scale factor between this and another token.
  double scaleFactorTo(M3TextStyle other) => other.fontSize! / fontSize!;

  /// Checks if two tokens have similar font sizes (within 2px).
  bool isSimilarSizeTo(M3TextStyle other) =>
      fontSizeDifferenceFrom(other) <= 2.0;

  /// Checks if this token can be used as a visual replacement for another.
  bool isVisuallyCompatibleWith(M3TextStyle other) =>
      category == other.category || isSimilarSizeTo(other);
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
