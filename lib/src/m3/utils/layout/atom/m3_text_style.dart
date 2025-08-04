part of '../../../../../../material_design.dart';

/// Custom TextStyle that enforces Material Design 3 typography system.
class M3TextStyle extends TextStyle {
  /// Creates a text style using Material Design 3 typography tokens.
  const M3TextStyle({
    super.inherit,
    super.color,
    super.backgroundColor,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamily,
    super.fontFamilyFallback,
    super.overflow,
    super.package,
  });

  // Predefined text styles based on Material Design 3 type scale

  /// Display Large: The largest display text (57/64, -0.25)
  static const M3TextStyle displayLarge = M3TextStyle(
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w400,
  );

  /// Display Medium: Medium display text (45/52, 0)
  static const M3TextStyle displayMedium = M3TextStyle(
    fontSize: 45,
    height: 52 / 45,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Display Small: Small display text (36/44, 0)
  static const M3TextStyle displaySmall = M3TextStyle(
    fontSize: 36,
    height: 44 / 36,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Headline Large: Large headline (32/40, 0)
  static const M3TextStyle headlineLarge = M3TextStyle(
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Headline Medium: Medium headline (28/36, 0)
  static const M3TextStyle headlineMedium = M3TextStyle(
    fontSize: 28,
    height: 36 / 28,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Headline Small: Small headline (24/32, 0)
  static const M3TextStyle headlineSmall = M3TextStyle(
    fontSize: 24,
    height: 32 / 24,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Title Large: Large title (22/28, 0)
  static const M3TextStyle titleLarge = M3TextStyle(
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Title Medium: Medium title (16/24, 0.15)
  static const M3TextStyle titleMedium = M3TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w500,
  );

  /// Title Small: Small title (14/20, 0.1)
  static const M3TextStyle titleSmall = M3TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  /// Body Large: Large body text (16/24, 0.5)
  static const M3TextStyle bodyLarge = M3TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
  );

  /// Body Medium: Medium body text (14/20, 0.25)
  static const M3TextStyle bodyMedium = M3TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
  );

  /// Body Small: Small body text (12/16, 0.4)
  static const M3TextStyle bodySmall = M3TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w400,
  );

  /// Label Large: Large label (14/20, 0.1)
  static const M3TextStyle labelLarge = M3TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  /// Label Medium: Medium label (12/16, 0.5)
  static const M3TextStyle labelMedium = M3TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  /// Label Small: Small label (11/16, 0.5)
  static const M3TextStyle labelSmall = M3TextStyle(
    fontSize: 11,
    height: 16 / 11,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

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
      return M3TextStyle.displaySmall;
    } else if (screenWidth < M3BreakpointToken.large.value) {
      return M3TextStyle.displayMedium;
    } else {
      return M3TextStyle.displayLarge;
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
