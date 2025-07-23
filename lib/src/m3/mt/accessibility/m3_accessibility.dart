import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Comprehensive accessibility utilities for Material Design 3.
///
/// Provides tools and helpers to ensure your Material Design 3 implementation
/// meets accessibility standards and best practices.
@immutable
abstract class M3Accessibility {
  // --- Minimum Touch Target Sizes ---

  /// Minimum touch target size for mobile (48dp).
  static const double minTouchTargetMobile = 48.0;

  /// Minimum touch target size for desktop (32dp).
  static const double minTouchTargetDesktop = 32.0;

  /// Recommended comfortable touch target size (56dp).
  static const double recommendedTouchTarget = 56.0;

  // --- Text Contrast Requirements ---

  /// Minimum contrast ratio for normal text (WCAG AA).
  static const double minContrastNormal = 4.5;

  /// Minimum contrast ratio for large text (WCAG AA).
  static const double minContrastLarge = 3.0;

  /// Enhanced contrast ratio for better accessibility (WCAG AAA).
  static const double enhancedContrast = 7.0;

  // --- Touch Target Utilities ---

  /// Ensures a widget meets minimum touch target requirements.
  static Widget ensureMinTouchTarget({
    required Widget child,
    double? minSize,
    BuildContext? context,
  }) {
    final targetSize = minSize ?? _getMinTouchTarget(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: targetSize,
        minHeight: targetSize,
      ),
      child: child,
    );
  }

  /// Gets the appropriate minimum touch target for the platform.
  static double _getMinTouchTarget(BuildContext? context) {
    if (context == null) return minTouchTargetMobile;

    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.android:
        return minTouchTargetMobile;
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return minTouchTargetDesktop;
      default:
        return minTouchTargetMobile;
    }
  }

  // --- Focus Management ---

  /// Creates a visible focus indicator.
  static Widget focusIndicator({
    required Widget child,
    Color? focusColor,
    double borderWidth = 2.0,
    BorderRadius? borderRadius,
  }) {
    return Focus(
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;
          final color = focusColor ?? Theme.of(context).colorScheme.primary;

          return Container(
            decoration: hasFocus
                ? BoxDecoration(
                    border: Border.all(
                      color: color,
                      width: borderWidth,
                    ),
                    borderRadius: borderRadius,
                  )
                : null,
            child: child,
          );
        },
      ),
    );
  }

  /// Creates an accessible button with proper semantics.
  static Widget accessibleButton({
    required Widget child,
    required VoidCallback? onPressed,
    String? semanticLabel,
    String? tooltip,
    double? minSize,
    BorderRadius? borderRadius,
  }) {
    Widget button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          minSize ?? minTouchTargetMobile,
          minSize ?? minTouchTargetMobile,
        ),
        shape: M3ShapeToken.large.value,
      ),
      child: child,
    );

    if (tooltip != null) {
      button = Tooltip(
        message: tooltip,
        child: button,
      );
    }

    if (semanticLabel != null) {
      button = Semantics(
        label: semanticLabel,
        button: true,
        child: button,
      );
    }

    return button;
  }

  // --- High Contrast Support ---

  /// Checks if high contrast mode is enabled.
  static bool isHighContrastMode(BuildContext context) {
    return MediaQuery.of(context).highContrast;
  }

  /// Creates a high contrast color scheme.
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
    } else {
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
  }

  /// Creates high contrast text styles.
  static TextTheme highContrastTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: M3TypeScaleToken.highContrast(base.displayLarge!),
      displayMedium: M3TypeScaleToken.highContrast(base.displayMedium!),
      displaySmall: M3TypeScaleToken.highContrast(base.displaySmall!),
      headlineLarge: M3TypeScaleToken.highContrast(base.headlineLarge!),
      headlineMedium: M3TypeScaleToken.highContrast(base.headlineMedium!),
      headlineSmall: M3TypeScaleToken.highContrast(base.headlineSmall!),
      titleLarge: M3TypeScaleToken.highContrast(base.titleLarge!),
      titleMedium: M3TypeScaleToken.highContrast(base.titleMedium!),
      titleSmall: M3TypeScaleToken.highContrast(base.titleSmall!),
      bodyLarge: M3TypeScaleToken.highContrast(base.bodyLarge!),
      bodyMedium: M3TypeScaleToken.highContrast(base.bodyMedium!),
      bodySmall: M3TypeScaleToken.highContrast(base.bodySmall!),
      labelLarge: M3TypeScaleToken.highContrast(base.labelLarge!),
      labelMedium: M3TypeScaleToken.highContrast(base.labelMedium!),
      labelSmall: M3TypeScaleToken.highContrast(base.labelSmall!),
    );
  }

  // --- Reduced Motion Support ---

  /// Checks if reduced motion is preferred.
  static bool shouldReduceMotion(BuildContext context) {
    return MediaQuery.of(context).disableAnimations;
  }

  /// Creates an adaptive duration based on motion preferences.
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

  /// Creates an adaptive curve based on motion preferences.
  static Curve adaptiveCurve({
    required BuildContext context,
    required Curve normal,
  }) {
    if (shouldReduceMotion(context)) {
      return Curves.linear;
    }
    return normal;
  }

  // --- Screen Reader Support ---

  /// Creates accessible text with proper semantics.
  static Widget accessibleText({
    required String text,
    TextStyle? style,
    String? semanticLabel,
    bool isHeading = false,
    int? headingLevel,
  }) {
    Widget textWidget = Text(text, style: style);

    return Semantics(
      label: semanticLabel ?? text,
      header: isHeading,
      child: textWidget,
    );
  }

  /// Creates an accessible image with alt text.
  static Widget accessibleImage({
    required ImageProvider image,
    required String alt,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    return Semantics(
      label: alt,
      image: true,
      child: Image(
        image: image,
        width: width,
        height: height,
        fit: fit,
        semanticLabel: alt,
      ),
    );
  }

  /// Creates an accessible form field with proper labeling.
  static Widget accessibleTextField({
    required String label,
    String? hint,
    String? error,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    bool required = false,
    int? maxLines = 1,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          label: required ? '$label (required)' : label,
          child: TextField(
            maxLines: maxLines,
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              errorText: error,
              border: OutlineInputBorder(
                  borderRadius: M3BorderRadiusToken.extraSmall.value),
            ),
          ),
        ),
      ],
    );
  }

  /// Creates an accessible checkbox with proper labeling and touch targets.
  static Widget accessibleCheckbox({
    required bool value,
    required String label,
    required ValueChanged<bool?>? onChanged,
    String? semanticLabel,
    bool required = false,
    double? minSize,
  }) {
    final targetSize = minSize ?? minTouchTargetMobile;

    return ensureMinTouchTarget(
      minSize: targetSize,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Semantics(
            label: semanticLabel ?? (required ? '$label (required)' : label),
            checked: value,
            child: SizedBox(
              width: targetSize,
              height: targetSize,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ),
          SizedBox(width: M3SpacingToken.space8.value),
          Expanded(
            child: GestureDetector(
              onTap: onChanged != null ? () => onChanged(!value) : null,
              child: Semantics(
                label:
                    semanticLabel ?? (required ? '$label (required)' : label),
                excludeSemantics: true,
                child: Text(
                  label,
                  style: TextStyle(
                    color: onChanged != null ? null : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Color Accessibility ---

  /// Validates if two colors meet WCAG contrast requirements.
  static bool meetsContrastRequirement({
    required Color foreground,
    required Color background,
    bool isLargeText = false,
    bool useEnhanced = false,
  }) {
    final contrast = _calculateContrast(foreground, background);
    final required = useEnhanced
        ? enhancedContrast
        : (isLargeText ? minContrastLarge : minContrastNormal);

    return contrast >= required;
  }

  /// Adjusts a color to meet accessibility requirements.
  static Color makeAccessible({
    required Color color,
    required Color background,
    bool isLargeText = false,
    bool useEnhanced = false,
  }) {
    final required = useEnhanced
        ? enhancedContrast
        : (isLargeText ? minContrastLarge : minContrastNormal);

    return _adjustForAccessibility(
      color,
      background,
      minContrast: required,
    );
  }

  // --- Dyslexia-Friendly Features ---

  /// Creates dyslexia-friendly text styles.
  static TextStyle dyslexiaFriendlyText(TextStyle base) {
    return M3TypeScaleToken.enhancedReadability(base);
  }

  /// Creates a dyslexia-friendly theme.
  static ThemeData dyslexiaFriendlyTheme(ThemeData base) {
    return base.copyWith(
      textTheme: base.textTheme
          .apply(
            bodyColor: base.colorScheme.onSurface,
            displayColor: base.colorScheme.onSurface,
          )
          .copyWith(
            bodyLarge: dyslexiaFriendlyText(base.textTheme.bodyLarge!),
            bodyMedium: dyslexiaFriendlyText(base.textTheme.bodyMedium!),
            bodySmall: dyslexiaFriendlyText(base.textTheme.bodySmall!),
          ),
    );
  }

  // --- Private Helpers ---

  /// Calculates the contrast ratio between two colors.
  static double _calculateContrast(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();

    final lighter = luminance1 > luminance2 ? luminance1 : luminance2;
    final darker = luminance1 > luminance2 ? luminance2 : luminance1;

    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Adjusts a color to meet minimum contrast requirements.
  static Color _adjustForAccessibility(
    Color color,
    Color background, {
    required double minContrast,
  }) {
    final currentContrast = _calculateContrast(color, background);

    if (currentContrast >= minContrast) {
      return color; // Already meets requirements
    }

    final hsl = HSLColor.fromColor(color);
    final backgroundLuminance = background.computeLuminance();

    // Determine if we should make the color lighter or darker
    final shouldLighten = backgroundLuminance > 0.5;

    // Binary search for the optimal lightness
    double minL = 0.0;
    double maxL = 1.0;

    while (maxL - minL > 0.01) {
      final testL = (minL + maxL) / 2;
      final testColor = hsl.withLightness(testL).toColor();
      final testContrast = _calculateContrast(testColor, background);

      if (testContrast >= minContrast) {
        if (shouldLighten) {
          minL = testL;
        } else {
          maxL = testL;
        }
      } else {
        if (shouldLighten) {
          maxL = testL;
        } else {
          minL = testL;
        }
      }
    }

    final targetLightness = shouldLighten ? maxL : minL;
    return hsl.withLightness(targetLightness).toColor();
  }
}

/// Accessibility configuration for the app.
class M3AccessibilityConfig {
  /// Whether high contrast mode is enabled.
  final bool highContrast;

  /// Whether reduced motion is enabled.
  final bool reducedMotion;

  /// Whether large text is enabled.
  final bool largeText;

  /// Whether dyslexia-friendly features are enabled.
  final bool dyslexiaFriendly;

  /// Custom text scale factor.
  final double textScaleFactor;

  const M3AccessibilityConfig({
    this.highContrast = false,
    this.reducedMotion = false,
    this.largeText = false,
    this.dyslexiaFriendly = false,
    this.textScaleFactor = 1.0,
  });

  /// Creates accessibility config from system settings.
  factory M3AccessibilityConfig.fromContext(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return M3AccessibilityConfig(
      highContrast: mediaQuery.highContrast,
      reducedMotion: mediaQuery.disableAnimations,
      largeText: mediaQuery.textScaler.scale(16) > 20,
      textScaleFactor: mediaQuery.textScaler.scale(1.0),
    );
  }

  /// Applies accessibility settings to a theme.
  ThemeData applyToTheme(ThemeData base) {
    ThemeData theme = base;

    if (highContrast) {
      theme = theme.copyWith(
        colorScheme: M3Accessibility.highContrastColorScheme(
          base: theme.colorScheme,
          isDark: theme.brightness == Brightness.dark,
        ),
        textTheme: M3Accessibility.highContrastTextTheme(theme.textTheme),
      );
    }

    if (dyslexiaFriendly) {
      theme = M3Accessibility.dyslexiaFriendlyTheme(theme);
    }

    return theme;
  }
}
