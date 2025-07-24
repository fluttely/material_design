import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Material Design 3 type scale font family constants.
class M3TypeScaleFonts {
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

/// Material Design 3 type scale tokens for consistent typography.
enum M3TypeScaleToken implements IM3Token<TextStyle> {
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
  const M3TypeScaleToken(this.value);

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
      return M3TypeScaleToken.displaySmall.value;
    } else if (screenWidth < M3BreakpointToken.large.value) {
      return M3TypeScaleToken.displayMedium.value;
    } else {
      return M3TypeScaleToken.displayLarge.value;
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
          fontFamilyFallback ?? M3TypeScaleFonts.systemFontStack,
    );
  }

  /// Creates a monospace variant for code display.
  static TextStyle monoVariant(TextStyle baseStyle) {
    return baseStyle.copyWith(
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: M3TypeScaleFonts.monoFontStack,
      letterSpacing: 0,
    );
  }
}
