/// M3TextStyleToken
library;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// {@template m3_type_scale_fonts}
/// Material Design 3 type scale font family constants.
///
/// These font families are optimized for Material Design 3 typography system,
/// providing excellent readability and visual hierarchy across different
/// platforms and screen sizes.
/// {@endtemplate}
class _M3TypeScaleFonts {
  /// Primary Material Design font family.
  static const String roboto = 'Roboto';

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

const TextStyle _kM3TypeScaleDisplayLarge = TextStyle(
  fontSize: 57,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.25,
  height: 64 / 57,
);
const TextStyle _kM3TypeScaleDisplayMedium = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
  height: 52 / 45,
);
const TextStyle _kM3TypeScaleDisplaySmall = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
  height: 44 / 36,
);
const TextStyle _kM3TypeScaleHeadlineLarge = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
  height: 40 / 32,
);
const TextStyle _kM3TypeScaleHeadlineMedium = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
  height: 36 / 28,
);
const TextStyle _kM3TypeScaleHeadlineSmall = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
  height: 32 / 24,
);
const TextStyle _kM3TypeScaleTitleLarge = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
  height: 28 / 22,
);
const TextStyle _kM3TypeScaleTitleMedium = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
  height: 24 / 16,
);
const TextStyle _kM3TypeScaleTitleSmall = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.1,
  height: 20 / 14,
);
const TextStyle _kM3TypeScaleBodyLarge = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.5,
  height: 24 / 16,
);
const TextStyle _kM3TypeScaleBodyMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
  height: 20 / 14,
);
const TextStyle _kM3TypeScaleBodySmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.4,
  height: 16 / 12,
);
const TextStyle _kM3TypeScaleLabelLarge = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.1,
  height: 20 / 14,
);
const TextStyle _kM3TypeScaleLabelMedium = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.5,
  height: 16 / 12,
);
const TextStyle _kM3TypeScaleLabelSmall = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.5,
  height: 16 / 11,
);

/// {@template m3_type_scale_token}
/// Material Design 3 type scale tokens for consistent typography.
///
/// This enum defines the complete typography scale for Material Design 3,
/// providing semantic text styles that create clear visual hierarchy and
/// excellent readability across all interface elements.
///
/// The type scale consists of five categories:
/// - **Display**: Large, impactful text for hero content
/// - **Headline**: Prominent headings and titles
/// - **Title**: Medium-emphasis headings and subtitles
/// - **Body**: Primary content text in various sizes
/// - **Label**: Supporting text for UI components
/// {@endtemplate}
enum M3TextStyleToken implements IM3Token<TextStyle> {
  /// Display Large text style (57sp).
  displayLarge(_kM3TypeScaleDisplayLarge),

  /// Display Medium text style (45sp).
  displayMedium(_kM3TypeScaleDisplayMedium),

  /// Display Small text style (36sp).
  displaySmall(_kM3TypeScaleDisplaySmall),

  /// Headline Large text style (32sp).
  headlineLarge(_kM3TypeScaleHeadlineLarge),

  /// Headline Medium text style (28sp).
  headlineMedium(_kM3TypeScaleHeadlineMedium),

  /// Headline Small text style (24sp).
  headlineSmall(_kM3TypeScaleHeadlineSmall),

  /// Title Large text style (22sp).
  titleLarge(_kM3TypeScaleTitleLarge),

  /// Title Medium text style (16sp).
  titleMedium(_kM3TypeScaleTitleMedium),

  /// Title Small text style (14sp).
  titleSmall(_kM3TypeScaleTitleSmall),

  /// Body Large text style (16sp).
  bodyLarge(_kM3TypeScaleBodyLarge),

  /// Body Medium text style (14sp).
  bodyMedium(_kM3TypeScaleBodyMedium),

  /// Body Small text style (12sp).
  bodySmall(_kM3TypeScaleBodySmall),

  /// Label Large text style (14sp).
  labelLarge(_kM3TypeScaleLabelLarge),

  /// Label Medium text style (12sp).
  labelMedium(_kM3TypeScaleLabelMedium),

  /// Label Small text style (11sp).
  labelSmall(_kM3TypeScaleLabelSmall);

  /// Creates a type scale token with the specified value.
  const M3TextStyleToken(this.value);

  /// The text style value.
  @override
  final TextStyle value;

  // --- Utility Methods ---

  /// Creates an adaptive text style that scales with user preferences.
  static TextStyle adaptive({
    required TextStyle baseStyle,
    required BuildContext context,
    double? minFontSize,
    double? maxFontSize,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final textScaler = mediaQuery.textScaler;

    // Calculate adaptive font size
    var adaptiveFontSize = textScaler.scale(baseStyle.fontSize!);

    // Apply constraints
    if (minFontSize != null) {
      adaptiveFontSize = math.max(adaptiveFontSize, minFontSize);
    }
    if (maxFontSize != null) {
      adaptiveFontSize = math.min(adaptiveFontSize, maxFontSize);
    }

    // Adjust line height for scaled text
    double? adaptiveHeight;
    if (baseStyle.height != null) {
      adaptiveHeight =
          baseStyle.height! * (baseStyle.fontSize! / adaptiveFontSize);
    }

    return baseStyle.copyWith(
      fontSize: adaptiveFontSize,
      height: adaptiveHeight,
    );
  }

  /// Creates a responsive display style based on screen size.
  static TextStyle responsiveDisplay(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < M3BreakpointToken.medium.value) {
      return M3TextStyleToken.displaySmall.value;
    } else if (screenWidth < M3BreakpointToken.large.value) {
      return M3TextStyleToken.displayMedium.value;
    } else {
      return M3TextStyleToken.displayLarge.value;
    }
  }

  /// Creates a text style with enhanced readability for accessibility.
  static TextStyle enhancedReadability(TextStyle baseStyle) {
    return baseStyle.copyWith(
      letterSpacing: (baseStyle.letterSpacing ?? 0) + 0.12,
      height: math.max(baseStyle.height ?? 1.0, 1.6),
      fontWeight: FontWeight.values[math.min(
        FontWeight.values.indexOf(baseStyle.fontWeight ?? FontWeight.w400) + 1,
        FontWeight.values.length - 1,
      )],
    );
  }

  /// Creates a high contrast version of a text style.
  static TextStyle highContrast(TextStyle baseStyle) {
    return baseStyle.copyWith(
      fontWeight: FontWeight.values[math.min(
        FontWeight.values.indexOf(baseStyle.fontWeight ?? FontWeight.w400) + 1,
        FontWeight.values.length - 1,
      )],
    );
  }

  /// Creates a text style with custom font family and fallbacks.
  static TextStyle withFontFamily({
    required TextStyle baseStyle,
    required String fontFamily,
    List<String>? fontFamilyFallback,
  }) {
    return baseStyle.copyWith(
      fontFamily: fontFamily,
      fontFamilyFallback:
          fontFamilyFallback ?? _M3TypeScaleFonts.systemFontStack,
    );
  }

  /// Creates a monospace variant for code display.
  static TextStyle monoVariant(TextStyle baseStyle) {
    return baseStyle.copyWith(
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: _M3TypeScaleFonts.monoFontStack,
      letterSpacing: 0,
    );
  }
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
  List<M3TextStyleToken> get tokens => switch (this) {
        display => [
            M3TextStyleToken.displayLarge,
            M3TextStyleToken.displayMedium,
            M3TextStyleToken.displaySmall,
          ],
        headline => [
            M3TextStyleToken.headlineLarge,
            M3TextStyleToken.headlineMedium,
            M3TextStyleToken.headlineSmall,
          ],
        title => [
            M3TextStyleToken.titleLarge,
            M3TextStyleToken.titleMedium,
            M3TextStyleToken.titleSmall,
          ],
        body => [
            M3TextStyleToken.bodyLarge,
            M3TextStyleToken.bodyMedium,
            M3TextStyleToken.bodySmall,
          ],
        label => [
            M3TextStyleToken.labelLarge,
            M3TextStyleToken.labelMedium,
            M3TextStyleToken.labelSmall,
          ],
      };

  /// Gets the largest token in this category.
  M3TextStyleToken get largest => tokens.first;

  /// Gets the smallest token in this category.
  M3TextStyleToken get smallest => tokens.last;
}

/// Provides utility methods for working with type scale tokens.
extension M3TextStyleTokenUtils on M3TextStyleToken {
  /// Gets the semantic category this token belongs to.
  M3TypeScaleCategory get category => switch (this) {
        M3TextStyleToken.displayLarge ||
        M3TextStyleToken.displayMedium ||
        M3TextStyleToken.displaySmall =>
          M3TypeScaleCategory.display,
        M3TextStyleToken.headlineLarge ||
        M3TextStyleToken.headlineMedium ||
        M3TextStyleToken.headlineSmall =>
          M3TypeScaleCategory.headline,
        M3TextStyleToken.titleLarge ||
        M3TextStyleToken.titleMedium ||
        M3TextStyleToken.titleSmall =>
          M3TypeScaleCategory.title,
        M3TextStyleToken.bodyLarge ||
        M3TextStyleToken.bodyMedium ||
        M3TextStyleToken.bodySmall =>
          M3TypeScaleCategory.body,
        M3TextStyleToken.labelLarge ||
        M3TextStyleToken.labelMedium ||
        M3TextStyleToken.labelSmall =>
          M3TypeScaleCategory.label,
      };

  /// Gets the font size in logical pixels.
  double get fontSize => value.fontSize!;

  /// Gets the line height in logical pixels.
  double get lineHeight => fontSize * (value.height ?? 1.0);

  /// Checks if this token has a larger font size than another.
  bool isLargerThan(M3TextStyleToken other) => fontSize > other.fontSize;

  /// Checks if this token has a smaller font size than another.
  bool isSmallerThan(M3TextStyleToken other) => fontSize < other.fontSize;

  /// Returns the difference in font size between this and another token.
  double fontSizeDifferenceFrom(M3TextStyleToken other) =>
      (fontSize - other.fontSize).abs();

  /// Gets the next larger token in the same category, if available.
  M3TextStyleToken? get nextLarger {
    final categoryTokens = category.tokens;
    final currentIndex = categoryTokens.indexOf(this);
    return currentIndex > 0 ? categoryTokens[currentIndex - 1] : null;
  }

  /// Gets the next smaller token in the same category, if available.
  M3TextStyleToken? get nextSmaller {
    final categoryTokens = category.tokens;
    final currentIndex = categoryTokens.indexOf(this);
    return currentIndex < categoryTokens.length - 1
        ? categoryTokens[currentIndex + 1]
        : null;
  }

  /// Creates a text style with specified color.
  TextStyle withColor(Color color) => value.copyWith(color: color);

  /// Creates a text style with specified font weight.
  TextStyle withWeight(FontWeight weight) => value.copyWith(fontWeight: weight);

  /// Creates a text style with specified font family.
  TextStyle withFontFamily(String family, {List<String>? fallbacks}) =>
      value.copyWith(
        fontFamily: family,
        fontFamilyFallback: fallbacks ?? _M3TypeScaleFonts.systemFontStack,
      );

  /// Creates an adaptive text style that scales with user preferences.
  TextStyle adaptive(
    BuildContext context, {
    double? minFontSize,
    double? maxFontSize,
  }) =>
      M3TextStyleToken.adaptive(
        baseStyle: value,
        context: context,
        minFontSize: minFontSize,
        maxFontSize: maxFontSize,
      );

  /// Creates a text style optimized for accessibility.
  TextStyle get accessible => M3TextStyleToken.enhancedReadability(value);

  /// Creates a high contrast version of this text style.
  TextStyle get highContrast => M3TextStyleToken.highContrast(value);

  /// Creates a monospace variant for code display.
  TextStyle get monospace => M3TextStyleToken.monoVariant(value);

  /// Creates a responsive text style based on screen size.
  TextStyle responsive(BuildContext context) {
    if (category != M3TypeScaleCategory.display) return value;
    return M3TextStyleToken.responsiveDisplay(context);
  }

  /// Checks if this token is suitable for long-form reading.
  bool get isReadingOptimized => switch (this) {
        M3TextStyleToken.bodyLarge || M3TextStyleToken.bodyMedium => true,
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
        style: color != null ? withColor(color) : value,
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
        style: color != null ? withColor(color) : value,
        textAlign: textAlign,
      );
}

/// Provides comparison utilities for type scale tokens.
extension M3TextStyleTokenComparison on M3TextStyleToken {
  /// Returns the token with the larger font size.
  M3TextStyleToken max(M3TextStyleToken other) =>
      fontSize >= other.fontSize ? this : other;

  /// Returns the token with the smaller font size.
  M3TextStyleToken min(M3TextStyleToken other) =>
      fontSize <= other.fontSize ? this : other;

  /// Calculates the scale factor between this and another token.
  double scaleFactorTo(M3TextStyleToken other) => other.fontSize / fontSize;

  /// Checks if two tokens have similar font sizes (within 2px).
  bool isSimilarSizeTo(M3TextStyleToken other) =>
      fontSizeDifferenceFrom(other) <= 2.0;

  /// Checks if this token can be used as a visual replacement for another.
  bool isVisuallyCompatibleWith(M3TextStyleToken other) =>
      category == other.category || isSimilarSizeTo(other);
}

/// Provides context-aware typography utilities.
extension M3TypeScaleContext on BuildContext {
  /// Gets the appropriate type scale token based on screen size and usage.
  M3TextStyleToken getResponsiveToken({
    required M3TextStyleToken mobile,
    required M3TextStyleToken tablet,
    required M3TextStyleToken desktop,
  }) {
    final screenWidth = MediaQuery.of(this).size.width;
    if (screenWidth < M3BreakpointToken.medium.value) {
      return mobile;
    } else if (screenWidth < M3BreakpointToken.large.value) {
      return tablet;
    } else {
      return desktop;
    }
  }

  /// Checks if the user has enabled large text accessibility settings.
  bool get hasLargeTextPreference =>
      MediaQuery.of(this).textScaler.scale(16) > 20.0;

  /// Gets the recommended body text token based on accessibility preferences.
  M3TextStyleToken get accessibleBodyToken => hasLargeTextPreference
      ? M3TextStyleToken.bodyLarge
      : M3TextStyleToken.bodyMedium;

  /// Gets the theme's text theme converted to type scale tokens.
  Map<M3TextStyleToken, TextStyle> get typeScaleTheme => {
        M3TextStyleToken.displayLarge: Theme.of(this).textTheme.displayLarge!,
        M3TextStyleToken.displayMedium: Theme.of(this).textTheme.displayMedium!,
        M3TextStyleToken.displaySmall: Theme.of(this).textTheme.displaySmall!,
        M3TextStyleToken.headlineLarge: Theme.of(this).textTheme.headlineLarge!,
        M3TextStyleToken.headlineMedium:
            Theme.of(this).textTheme.headlineMedium!,
        M3TextStyleToken.headlineSmall: Theme.of(this).textTheme.headlineSmall!,
        M3TextStyleToken.titleLarge: Theme.of(this).textTheme.titleLarge!,
        M3TextStyleToken.titleMedium: Theme.of(this).textTheme.titleMedium!,
        M3TextStyleToken.titleSmall: Theme.of(this).textTheme.titleSmall!,
        M3TextStyleToken.bodyLarge: Theme.of(this).textTheme.bodyLarge!,
        M3TextStyleToken.bodyMedium: Theme.of(this).textTheme.bodyMedium!,
        M3TextStyleToken.bodySmall: Theme.of(this).textTheme.bodySmall!,
        M3TextStyleToken.labelLarge: Theme.of(this).textTheme.labelLarge!,
        M3TextStyleToken.labelMedium: Theme.of(this).textTheme.labelMedium!,
        M3TextStyleToken.labelSmall: Theme.of(this).textTheme.labelSmall!,
      };
}
