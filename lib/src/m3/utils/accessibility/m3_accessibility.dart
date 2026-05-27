part of '../../../../../material_design.dart';

/// Accessibility constants and utilities for Material Design 3.
///
/// Provides WCAG contrast thresholds, touch target sizes, and helpers for
/// motion and high-contrast theming. Does not construct concrete widgets.
@immutable
abstract interface class M3Accessibility {
  // --- Touch target sizes ---

  /// Minimum touch target for mobile (48dp).
  static const double minTouchTargetMobile = 48;

  /// Minimum touch target for desktop (32dp).
  static const double minTouchTargetDesktop = 32;

  /// Recommended comfortable touch target (56dp).
  static const double recommendedTouchTarget = 56;

  // --- WCAG contrast thresholds ---

  /// WCAG AA minimum for normal text (4.5:1).
  static const double minContrastNormal = 4.5;

  /// WCAG AA minimum for large text (3:1).
  static const double minContrastLarge = 3;

  /// WCAG AAA enhanced contrast (7:1).
  static const double enhancedContrast = 7;

  // --- Platform touch target ---

  /// Returns the minimum touch target size for the current platform.
  static double minTouchTarget(BuildContext context) {
    final platform = Theme.of(context).platform;
    return switch (platform) {
      TargetPlatform.android ||
      TargetPlatform.iOS ||
      TargetPlatform.fuchsia =>
        minTouchTargetMobile,
      _ => minTouchTargetDesktop,
    };
  }

  // --- Contrast validation ---

  /// Whether [foreground] meets WCAG contrast requirements against
  /// [background].
  static bool meetsContrastRequirement({
    required Color foreground,
    required Color background,
    bool isLargeText = false,
    bool useEnhanced = false,
  }) {
    final ratio = M3ColorUtils.calculateContrast(foreground, background);
    final required = useEnhanced
        ? enhancedContrast
        : (isLargeText ? minContrastLarge : minContrastNormal);
    return ratio >= required;
  }

  /// Adjusts [color] until it meets the minimum contrast against [background].
  static Color makeAccessible({
    required Color color,
    required Color background,
    bool isLargeText = false,
    bool useEnhanced = false,
  }) {
    final required = useEnhanced
        ? enhancedContrast
        : (isLargeText ? minContrastLarge : minContrastNormal);
    return M3ColorUtils.adjustForAccessibility(
      color,
      background,
      minContrast: required,
    );
  }

  // --- System state queries ---

  /// Whether the system has high-contrast mode enabled.
  static bool isHighContrastMode(BuildContext context) =>
      MediaQuery.of(context).highContrast;

  /// Whether the user prefers reduced motion.
  static bool shouldReduceMotion(BuildContext context) =>
      MediaQuery.of(context).disableAnimations;

  // --- Motion helpers ---

  /// Returns a reduced duration when the user prefers reduced motion.
  static Duration adaptiveDuration({
    required BuildContext context,
    required Duration normal,
    double reductionFactor = 0.3,
  }) {
    if (shouldReduceMotion(context)) {
      return Duration(
        milliseconds: (normal.inMilliseconds * reductionFactor).round(),
      );
    }
    return normal;
  }

  /// Returns a linear curve when the user prefers reduced motion.
  static Curve adaptiveCurve({
    required BuildContext context,
    required Curve normal,
  }) {
    return shouldReduceMotion(context) ? Curves.linear : normal;
  }

  // --- High-contrast theme helpers ---

  /// Builds a high-contrast [ColorScheme] from [base].
  static ColorScheme highContrastColorScheme({
    required ColorScheme base,
    required bool isDark,
  }) {
    if (isDark) {
      return base.copyWith(
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Colors.white,
        onSecondary: Colors.black,
        surface: Colors.black,
        onSurface: Colors.white,
        error: const Color(0xFFFF6B6B),
        onError: Colors.black,
      );
    }
    return base.copyWith(
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.black,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      error: const Color(0xFFD32F2F),
      onError: Colors.white,
    );
  }

  /// Applies high-contrast font weights to [base] text theme.
  static TextTheme highContrastTextTheme(TextTheme base) {
    TextStyle boost(TextStyle s) => s.copyWith(
          fontWeight: FontWeight.values[math.min(
            FontWeight.values.indexOf(s.fontWeight ?? FontWeight.w400) + 1,
            FontWeight.values.length - 1,
          )],
        );
    return base.copyWith(
      displayLarge: boost(base.displayLarge!),
      displayMedium: boost(base.displayMedium!),
      displaySmall: boost(base.displaySmall!),
      headlineLarge: boost(base.headlineLarge!),
      headlineMedium: boost(base.headlineMedium!),
      headlineSmall: boost(base.headlineSmall!),
      titleLarge: boost(base.titleLarge!),
      titleMedium: boost(base.titleMedium!),
      titleSmall: boost(base.titleSmall!),
      bodyLarge: boost(base.bodyLarge!),
      bodyMedium: boost(base.bodyMedium!),
      bodySmall: boost(base.bodySmall!),
      labelLarge: boost(base.labelLarge!),
      labelMedium: boost(base.labelMedium!),
      labelSmall: boost(base.labelSmall!),
    );
  }
}

/// Centralized accessibility configuration for the application.
class M3AccessibilityConfig {
  /// Creates an accessibility configuration.
  const M3AccessibilityConfig({
    this.highContrast = false,
    this.reducedMotion = false,
    this.largeText = false,
    this.dyslexiaFriendly = false,
    this.textScaleFactor = 1.0,
  });

  /// Builds an accessibility configuration from the given [context].
  factory M3AccessibilityConfig.fromContext(BuildContext context) {
    final mq = MediaQuery.of(context);
    return M3AccessibilityConfig(
      highContrast: mq.highContrast,
      reducedMotion: mq.disableAnimations,
      largeText: mq.textScaler.scale(16) > 20,
      textScaleFactor: mq.textScaler.scale(1),
    );
  }

  /// Whether high-contrast mode is enabled.
  final bool highContrast;

  /// Whether animations should be reduced or disabled.
  final bool reducedMotion;

  /// Whether the user has configured large/accessible text sizing.
  final bool largeText;

  /// Whether the user prefers dyslexia-friendly typography adjustments.
  final bool dyslexiaFriendly;

  /// The text scale factor determined by system settings.
  final double textScaleFactor;

  /// Applies accessibility settings to [base] theme.
  ThemeData applyToTheme(ThemeData base) {
    var theme = base;
    if (highContrast) {
      theme = theme.copyWith(
        colorScheme: M3Accessibility.highContrastColorScheme(
          base: theme.colorScheme,
          isDark: theme.brightness == Brightness.dark,
        ),
        textTheme: M3Accessibility.highContrastTextTheme(theme.textTheme),
      );
    }
    return theme;
  }
}
