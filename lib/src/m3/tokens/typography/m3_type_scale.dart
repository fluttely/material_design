import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Defines the text styles for the Material Design 3 type scale.
///
/// The M3 type scale includes 15 standard styles, each with a specific
/// font size, weight, and letter spacing. These styles are designed to
/// create a clear and readable typographic hierarchy.
///
/// The default font family is not specified here, allowing it to be inherited
/// from the application's theme (which defaults to "Roboto" in Material).
///
/// Reference: https://m3.material.io/styles/typography/type-scale-tokens
@immutable
abstract class M3TypeScale {
  // --- Font Families ---

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
  // --- Display ---
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 64 / 57,
  );
  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 52 / 45,
  );
  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 44 / 36,
  );

  // --- Headline ---
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 40 / 32,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 36 / 28,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 32 / 24,
  );

  // --- Title ---
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 28 / 22,
  );
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 24 / 16,
  );
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 20 / 14,
  );

  // --- Body ---
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 24 / 16,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 20 / 14,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 16 / 12,
  );

  // --- Label ---
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 20 / 14,
  );
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 16 / 12,
  );
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 16 / 11,
  );

  // --- Utility Methods ---

  // TODO(Kevin): create a "adaptive" example
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
    double adaptiveFontSize = textScaler.scale(baseStyle.fontSize!);

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

    if (screenWidth < M3Breakpoint.medium) {
      return displaySmall;
    } else if (screenWidth < M3Breakpoint.large) {
      return displayMedium;
    } else {
      return displayLarge;
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
      fontFamilyFallback: fontFamilyFallback ?? systemFontStack,
    );
  }

  /// Creates a monospace variant for code display.
  static TextStyle monoVariant(TextStyle baseStyle) {
    return baseStyle.copyWith(
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: monoFontStack,
      letterSpacing: 0,
    );
  }
}
