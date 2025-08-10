/// Material Design 3 accessibility system.
///
/// This file implements the Material Design 3 accessibility specifications
/// including touch targets, contrast ratios, focus indicators, and
/// integration with Flutter's Semantics system.
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/foundations/accessibility/overview
///
/// Follows WCAG 2.1 Level AA guidelines:
/// https://www.w3.org/WAI/WCAG21/quickref/
library;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Touch target specifications based on Material Design 3 guidelines.
///
/// Material Design 3 requires minimum touch target sizes to ensure
/// usability across all users, including those with motor impairments.
///
/// Reference: https://m3.material.io/foundations/accessibility/accessibility-in-material-3
@immutable
class TouchTargetSpec {
  const TouchTargetSpec._();

  /// Minimum touch target size (48x48dp) per Material Design guidelines.
  /// This ensures a physical size of about 9mm regardless of screen density.
  static const Size minimum = Size(48, 48);

  /// Standard touch target size for most interactive elements.
  static const Size standard = Size(48, 48);

  /// Large touch target size for improved accessibility (56x56dp).
  /// Recommended for primary actions or when targeting users with
  /// motor impairments.
  static const Size large = Size(56, 56);

  /// Extra large touch target size for maximum accessibility (64x64dp).
  /// Used for critical actions or accessibility-focused interfaces.
  static const Size extraLarge = Size(64, 64);

  /// Minimum spacing between touch targets (8dp).
  /// Prevents accidental activation of adjacent targets.
  static const double minSpacing = 8;

  /// Recommended spacing between touch targets (12dp).
  static const double recommendedSpacing = 12;

  /// Comfortable spacing between touch targets (16dp).
  static const double comfortableSpacing = 16;

  /// Validates if a size meets minimum touch target requirements.
  static bool isValidSize(Size size) {
    return size.width >= minimum.width && size.height >= minimum.height;
  }

  /// Calculates the padding needed to meet minimum touch target size.
  static EdgeInsets calculatePadding({
    required Size actualSize,
    Size targetSize = minimum,
  }) {
    if (actualSize.width >= targetSize.width &&
        actualSize.height >= targetSize.height) {
      return EdgeInsets.zero;
    }

    final horizontalPadding =
        math.max(0, targetSize.width - actualSize.width) / 2;
    final verticalPadding =
        math.max(0, targetSize.height - actualSize.height) / 2;

    return EdgeInsets.symmetric(
      horizontal: horizontalPadding,
      vertical: verticalPadding,
    );
  }

  /// Returns the appropriate touch target size for a given context.
  static Size getSize({
    required TargetPlatform platform,
    bool isCompact = false,
    bool isPrimary = false,
  }) {
    if (isPrimary) {
      return large;
    }
    if (isCompact) {
      // Even in compact mode, maintain minimum size
      return minimum;
    }
    return standard;
  }
}

/// WCAG contrast ratio levels.
///
/// Defines the minimum contrast ratios required for different
/// levels of WCAG compliance.
///
/// Reference: https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html
enum ContrastRatio {
  /// WCAG AA for normal text (4.5:1).
  aa(value: 4.5, description: 'WCAG AA - Normal text'),

  /// WCAG AA for large text (3:1).
  /// Large text is 18pt+ regular or 14pt+ bold.
  aaLarge(value: 3, description: 'WCAG AA - Large text'),

  /// WCAG AAA for normal text (7:1).
  aaa(value: 7, description: 'WCAG AAA - Normal text'),

  /// WCAG AAA for large text (4.5:1).
  aaaLarge(value: 4.5, description: 'WCAG AAA - Large text'),

  /// Non-text contrast (3:1).
  /// For UI components and graphical objects.
  nonText(value: 3, description: 'Non-text elements');

  const ContrastRatio({
    required this.value,
    required this.description,
  });

  /// The minimum contrast ratio value.
  final double value;

  /// Human-readable description of the contrast level.
  final String description;

  /// Checks if this ratio is sufficient for the given text size.
  bool isSufficientForText({
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    final isLargeText = fontSize >= 18 ||
        (fontSize >= 14 && fontWeight.index >= FontWeight.bold.index);

    switch (this) {
      case ContrastRatio.aa:
        return !isLargeText;
      case ContrastRatio.aaLarge:
        return isLargeText;
      case ContrastRatio.aaa:
        return !isLargeText;
      case ContrastRatio.aaaLarge:
        return isLargeText;
      case ContrastRatio.nonText:
        return false; // Not for text
    }
  }
}

/// Utilities for calculating and validating contrast ratios.
class ContrastUtils {
  ContrastUtils._();

  /// Calculates the contrast ratio between two colors.
  ///
  /// Uses the WCAG formula for calculating contrast.
  /// Returns a value between 1 (no contrast) and 21 (maximum contrast).
  static double calculateContrastRatio(Color foreground, Color background) {
    final l1 = _relativeLuminance(foreground);
    final l2 = _relativeLuminance(background);

    // Ensure L1 is the lighter color
    final lighter = math.max(l1, l2);
    final darker = math.min(l1, l2);

    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Calculates the relative luminance of a color.
  ///
  /// Based on WCAG formula: https://www.w3.org/WAI/GL/wiki/Relative_luminance
  static double _relativeLuminance(Color color) {
    final r = _linearizeColorComponent(color.red / 255.0);
    final g = _linearizeColorComponent(color.green / 255.0);
    final b = _linearizeColorComponent(color.blue / 255.0);

    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  /// Linearizes a color component for luminance calculation.
  static double _linearizeColorComponent(double component) {
    if (component <= 0.03928) {
      return component / 12.92;
    }
    return math.pow((component + 0.055) / 1.055, 2.4).toDouble();
  }

  /// Validates if two colors meet the specified contrast ratio.
  static bool meetsContrastRatio({
    required Color foreground,
    required Color background,
    required ContrastRatio minimumRatio,
  }) {
    final ratio = calculateContrastRatio(foreground, background);
    return ratio >= minimumRatio.value;
  }

  /// Finds a color that meets the specified contrast ratio with the background.
  ///
  /// Adjusts the foreground color's lightness to meet the contrast requirement.
  static Color ensureContrast({
    required Color foreground,
    required Color background,
    required ContrastRatio minimumRatio,
  }) {
    final currentRatio = calculateContrastRatio(foreground, background);

    if (currentRatio >= minimumRatio.value) {
      return foreground;
    }

    // Determine if we should lighten or darken the foreground
    final backgroundLuminance = _relativeLuminance(background);
    final shouldLighten = backgroundLuminance < 0.5;

    final hsl = HSLColor.fromColor(foreground);

    // Binary search for the right lightness
    var minL = shouldLighten ? hsl.lightness : 0.0;
    var maxL = shouldLighten ? 1.0 : hsl.lightness;

    while (maxL - minL > 0.01) {
      final midL = (minL + maxL) / 2;
      final testColor = hsl.withLightness(midL).toColor();
      final testRatio = calculateContrastRatio(testColor, background);

      if (testRatio >= minimumRatio.value) {
        if (shouldLighten) {
          maxL = midL;
        } else {
          minL = midL;
        }
      } else {
        if (shouldLighten) {
          minL = midL;
        } else {
          maxL = midL;
        }
      }
    }

    return hsl.withLightness((minL + maxL) / 2).toColor();
  }

  /// Returns a readable text color (black or white) for the given background.
  static Color getReadableTextColor(Color background) {
    final blackContrast = calculateContrastRatio(Colors.black, background);
    final whiteContrast = calculateContrastRatio(Colors.white, background);

    return whiteContrast > blackContrast ? Colors.white : Colors.black;
  }
}

/// Focus indicator specifications for Material Design 3.
///
/// Defines how focus states should be visually indicated for
/// keyboard navigation and accessibility.
@immutable
class FocusIndicatorSpec {
  const FocusIndicatorSpec({
    required this.width,
    required this.color,
    required this.style,
    required this.offset,
    required this.shape,
  });

  /// Default focus indicator for Material Design 3.
  static const FocusIndicatorSpec standard = FocusIndicatorSpec(
    width: 2,
    color: null, // Uses theme primary color
    style: FocusIndicatorStyle.solid,
    offset: 2,
    shape: FocusIndicatorShape.auto,
  );

  /// High contrast focus indicator for improved visibility.
  static const FocusIndicatorSpec highContrast = FocusIndicatorSpec(
    width: 3,
    color: null, // Uses theme primary color
    style: FocusIndicatorStyle.solid,
    offset: 2,
    shape: FocusIndicatorShape.auto,
  );

  /// Subtle focus indicator for dense UIs.
  static const FocusIndicatorSpec subtle = FocusIndicatorSpec(
    width: 1,
    color: null, // Uses theme primary color with opacity
    style: FocusIndicatorStyle.solid,
    offset: 0,
    shape: FocusIndicatorShape.auto,
  );

  /// Width of the focus indicator stroke.
  final double width;

  /// Color of the focus indicator.
  /// If null, uses the theme's primary color.
  final Color? color;

  /// Style of the focus indicator.
  final FocusIndicatorStyle style;

  /// Offset from the focused element.
  final double offset;

  /// Shape of the focus indicator.
  final FocusIndicatorShape shape;

  /// Creates a copy with the given fields replaced.
  FocusIndicatorSpec copyWith({
    double? width,
    Color? color,
    FocusIndicatorStyle? style,
    double? offset,
    FocusIndicatorShape? shape,
  }) {
    return FocusIndicatorSpec(
      width: width ?? this.width,
      color: color ?? this.color,
      style: style ?? this.style,
      offset: offset ?? this.offset,
      shape: shape ?? this.shape,
    );
  }

  /// Builds a decoration for the focus indicator.
  Decoration buildDecoration({
    required BuildContext context,
    BorderRadius? borderRadius,
  }) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;

    Border? border;
    switch (style) {
      case FocusIndicatorStyle.solid:
        border = Border.all(
          color: effectiveColor,
          width: width,
        );
      case FocusIndicatorStyle.dashed:
        // Dashed border would require custom painter
        border = Border.all(
          color: effectiveColor,
          width: width,
        );
      case FocusIndicatorStyle.dotted:
        // Dotted border would require custom painter
        border = Border.all(
          color: effectiveColor,
          width: width,
        );
    }

    return BoxDecoration(
      border: border,
      borderRadius: borderRadius,
    );
  }
}

/// Style options for focus indicators.
enum FocusIndicatorStyle {
  /// Solid line focus indicator.
  solid,

  /// Dashed line focus indicator.
  dashed,

  /// Dotted line focus indicator.
  dotted,
}

/// Shape options for focus indicators.
enum FocusIndicatorShape {
  /// Automatically matches the shape of the focused element.
  auto,

  /// Rectangular focus indicator.
  rectangle,

  /// Rounded rectangle focus indicator.
  roundedRectangle,

  /// Circular focus indicator.
  circle,
}

/// Comprehensive accessibility configuration for Material Design 3.
///
/// Provides a centralized configuration for all accessibility features
/// including touch targets, contrast ratios, focus indicators, and
/// semantic properties.
@immutable
class AccessibilityConfig {
  const AccessibilityConfig({
    this.touchTargetSize = TouchTargetSpec.standard,
    this.touchTargetSpacing = TouchTargetSpec.minSpacing,
    this.minimumContrastRatio = ContrastRatio.aa,
    this.focusIndicator = FocusIndicatorSpec.standard,
    this.reduceMotion = false,
    this.highContrast = false,
    this.boldText = false,
    this.largeText = false,
    this.screenReaderMode = false,
  });

  /// Creates an accessibility configuration from platform settings.
  factory AccessibilityConfig.fromPlatform(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return AccessibilityConfig(
      reduceMotion: mediaQuery.disableAnimations,
      highContrast: mediaQuery.highContrast,
      boldText: mediaQuery.boldText,
      // Platform doesn't directly provide large text, infer from textScaleFactor
      largeText: mediaQuery.textScaleFactor > 1.3,
      screenReaderMode: mediaQuery.accessibleNavigation,
    );
  }

  /// Default accessibility configuration.
  static const AccessibilityConfig standard = AccessibilityConfig();

  /// High contrast accessibility configuration.
  static const AccessibilityConfig highContrastMode = AccessibilityConfig(
    minimumContrastRatio: ContrastRatio.aaa,
    focusIndicator: FocusIndicatorSpec.highContrast,
    highContrast: true,
  );

  /// Configuration for users with motor impairments.
  static const AccessibilityConfig motorAccessibility = AccessibilityConfig(
    touchTargetSize: TouchTargetSpec.large,
    touchTargetSpacing: TouchTargetSpec.comfortableSpacing,
  );

  /// Configuration for users with visual impairments.
  static const AccessibilityConfig visualAccessibility = AccessibilityConfig(
    minimumContrastRatio: ContrastRatio.aaa,
    focusIndicator: FocusIndicatorSpec.highContrast,
    boldText: true,
    largeText: true,
  );

  /// Minimum touch target size.
  final Size touchTargetSize;

  /// Minimum spacing between touch targets.
  final double touchTargetSpacing;

  /// Minimum contrast ratio for text and UI elements.
  final ContrastRatio minimumContrastRatio;

  /// Focus indicator specification.
  final FocusIndicatorSpec focusIndicator;

  /// Whether to reduce or disable animations.
  final bool reduceMotion;

  /// Whether high contrast mode is enabled.
  final bool highContrast;

  /// Whether to use bold text throughout.
  final bool boldText;

  /// Whether to use large text throughout.
  final bool largeText;

  /// Whether screen reader mode is active.
  final bool screenReaderMode;

  /// Creates a copy with the given fields replaced.
  AccessibilityConfig copyWith({
    Size? touchTargetSize,
    double? touchTargetSpacing,
    ContrastRatio? minimumContrastRatio,
    FocusIndicatorSpec? focusIndicator,
    bool? reduceMotion,
    bool? highContrast,
    bool? boldText,
    bool? largeText,
    bool? screenReaderMode,
  }) {
    return AccessibilityConfig(
      touchTargetSize: touchTargetSize ?? this.touchTargetSize,
      touchTargetSpacing: touchTargetSpacing ?? this.touchTargetSpacing,
      minimumContrastRatio: minimumContrastRatio ?? this.minimumContrastRatio,
      focusIndicator: focusIndicator ?? this.focusIndicator,
      reduceMotion: reduceMotion ?? this.reduceMotion,
      highContrast: highContrast ?? this.highContrast,
      boldText: boldText ?? this.boldText,
      largeText: largeText ?? this.largeText,
      screenReaderMode: screenReaderMode ?? this.screenReaderMode,
    );
  }

  /// Applies accessibility transformations to a TextStyle.
  TextStyle applyToTextStyle(TextStyle style) {
    var result = style;

    if (boldText &&
        style.fontWeight != null &&
        style.fontWeight!.index < FontWeight.bold.index) {
      result = result.copyWith(fontWeight: FontWeight.bold);
    }

    if (largeText) {
      result = result.copyWith(
        fontSize: (style.fontSize ?? 14) * 1.3,
      );
    }

    return result;
  }

  /// Gets the appropriate animation duration considering reduceMotion.
  Duration getAnimationDuration(Duration standard) {
    if (reduceMotion) {
      return Duration.zero;
    }
    return standard;
  }

  /// Gets the appropriate animation curve considering reduceMotion.
  Curve getAnimationCurve(Curve standard) {
    if (reduceMotion) {
      return Curves.linear;
    }
    return standard;
  }
}

/// Widget that provides accessibility configuration to its descendants.
class AccessibilityProvider extends InheritedWidget {
  const AccessibilityProvider({
    required this.config,
    required super.child,
    super.key,
  });

  final AccessibilityConfig config;

  static AccessibilityConfig of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<AccessibilityProvider>();
    return provider?.config ?? AccessibilityConfig.fromPlatform(context);
  }

  static AccessibilityConfig? maybeOf(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<AccessibilityProvider>();
    return provider?.config;
  }

  @override
  bool updateShouldNotify(AccessibilityProvider oldWidget) {
    return config != oldWidget.config;
  }
}

/// Utilities for validating accessibility compliance.
class AccessibilityValidator {
  AccessibilityValidator._();

  /// Validates if a widget meets accessibility requirements.
  static AccessibilityValidationResult validate({
    required Size size,
    required Color? foregroundColor,
    required Color? backgroundColor,
    required String? semanticLabel,
    required TextStyle? textStyle,
    AccessibilityConfig config = AccessibilityConfig.standard,
  }) {
    final issues = <AccessibilityIssue>[];

    // Validate touch target size
    if (!TouchTargetSpec.isValidSize(size)) {
      issues.add(
        AccessibilityIssue(
          severity: IssueSeverity.error,
          type: IssueType.touchTarget,
          message: 'Touch target size ${size.width}x${size.height} is below '
              'minimum ${TouchTargetSpec.minimum.width}x${TouchTargetSpec.minimum.height}',
        ),
      );
    }

    // Validate contrast ratio
    if (foregroundColor != null && backgroundColor != null) {
      final ratio = ContrastUtils.calculateContrastRatio(
        foregroundColor,
        backgroundColor,
      );

      if (ratio < config.minimumContrastRatio.value) {
        issues.add(
          AccessibilityIssue(
            severity: IssueSeverity.error,
            type: IssueType.contrast,
            message: 'Contrast ratio ${ratio.toStringAsFixed(2)} is below '
                'minimum ${config.minimumContrastRatio.value}',
          ),
        );
      }
    }

    // Validate semantic label
    if (semanticLabel == null || semanticLabel.isEmpty) {
      issues.add(
        const AccessibilityIssue(
          severity: IssueSeverity.warning,
          type: IssueType.semantics,
          message: 'Missing semantic label for screen readers',
        ),
      );
    }

    // Validate text size
    if (textStyle != null) {
      final fontSize = textStyle.fontSize ?? 14;
      if (fontSize < 11) {
        issues.add(
          AccessibilityIssue(
            severity: IssueSeverity.warning,
            type: IssueType.textSize,
            message: 'Font size ${fontSize}dp may be too small for readability',
          ),
        );
      }
    }

    return AccessibilityValidationResult(
      isValid: issues.where((i) => i.severity == IssueSeverity.error).isEmpty,
      issues: issues,
    );
  }

  /// Validates a color scheme for accessibility.
  static Map<String, AccessibilityValidationResult> validateColorScheme({
    required ColorScheme colorScheme,
    AccessibilityConfig config = AccessibilityConfig.standard,
  }) {
    final results = <String, AccessibilityValidationResult>{};

    // Validate primary color combinations
    results['primary'] = validate(
      size: TouchTargetSpec.minimum,
      foregroundColor: colorScheme.onPrimary,
      backgroundColor: colorScheme.primary,
      semanticLabel: 'Primary',
      textStyle: null,
      config: config,
    );

    // Validate secondary color combinations
    results['secondary'] = validate(
      size: TouchTargetSpec.minimum,
      foregroundColor: colorScheme.onSecondary,
      backgroundColor: colorScheme.secondary,
      semanticLabel: 'Secondary',
      textStyle: null,
      config: config,
    );

    // Validate surface color combinations
    results['surface'] = validate(
      size: TouchTargetSpec.minimum,
      foregroundColor: colorScheme.onSurface,
      backgroundColor: colorScheme.surface,
      semanticLabel: 'Surface',
      textStyle: null,
      config: config,
    );

    // Validate error color combinations
    results['error'] = validate(
      size: TouchTargetSpec.minimum,
      foregroundColor: colorScheme.onError,
      backgroundColor: colorScheme.error,
      semanticLabel: 'Error',
      textStyle: null,
      config: config,
    );

    return results;
  }
}

/// Result of an accessibility validation.
@immutable
class AccessibilityValidationResult {
  const AccessibilityValidationResult({
    required this.isValid,
    required this.issues,
  });

  /// Whether the validation passed without errors.
  final bool isValid;

  /// List of accessibility issues found.
  final List<AccessibilityIssue> issues;

  /// Gets issues of a specific severity.
  List<AccessibilityIssue> getIssuesBySeverity(IssueSeverity severity) {
    return issues.where((issue) => issue.severity == severity).toList();
  }

  /// Gets issues of a specific type.
  List<AccessibilityIssue> getIssuesByType(IssueType type) {
    return issues.where((issue) => issue.type == type).toList();
  }

  @override
  String toString() {
    final buffer = StringBuffer('AccessibilityValidationResult(');
    buffer.write('valid: $isValid');
    if (issues.isNotEmpty) {
      buffer.write(', issues: ${issues.length}');
      for (final issue in issues) {
        buffer.write('\n  - $issue');
      }
    }
    buffer.write(')');
    return buffer.toString();
  }
}

/// Represents an accessibility issue found during validation.
@immutable
class AccessibilityIssue {
  const AccessibilityIssue({
    required this.severity,
    required this.type,
    required this.message,
  });

  /// Severity of the issue.
  final IssueSeverity severity;

  /// Type of accessibility issue.
  final IssueType type;

  /// Human-readable description of the issue.
  final String message;

  @override
  String toString() => '${severity.name} [${type.name}]: $message';
}

/// Severity levels for accessibility issues.
enum IssueSeverity {
  /// Critical issue that must be fixed.
  error,

  /// Issue that should be fixed but isn't critical.
  warning,

  /// Suggestion for improvement.
  info,
}

/// Types of accessibility issues.
enum IssueType {
  /// Touch target size issue.
  touchTarget,

  /// Color contrast issue.
  contrast,

  /// Missing or inadequate semantic information.
  semantics,

  /// Text size issue.
  textSize,

  /// Focus indicator issue.
  focusIndicator,

  /// Animation issue.
  animation,
}

/// Helper widget that ensures minimum touch target size.
class AccessibleTouchTarget extends StatelessWidget {
  const AccessibleTouchTarget({
    required this.child,
    super.key,
    this.minSize = TouchTargetSpec.minimum,
    this.onTap,
    this.semanticLabel,
  });

  final Widget child;
  final Size minSize;
  final VoidCallback? onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: onTap != null,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: minSize.width,
            minHeight: minSize.height,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}

/// Helper widget that provides semantic information for screen readers.
class AccessibleSemantics extends StatelessWidget {
  const AccessibleSemantics({
    required this.child,
    super.key,
    this.label,
    this.hint,
    this.value,
    this.isButton = false,
    this.isEnabled = true,
    this.isChecked,
    this.isSelected,
    this.isTextField = false,
    this.isReadOnly = false,
    this.isHeading = false,
    this.headingLevel,
  });

  final Widget child;
  final String? label;
  final String? hint;
  final String? value;
  final bool isButton;
  final bool isEnabled;
  final bool? isChecked;
  final bool? isSelected;
  final bool isTextField;
  final bool isReadOnly;
  final bool isHeading;
  final int? headingLevel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      hint: hint,
      value: value,
      button: isButton,
      enabled: isEnabled,
      checked: isChecked,
      selected: isSelected,
      textField: isTextField,
      readOnly: isReadOnly,
      header: isHeading,
      child: child,
    );
  }
}

/// Extension methods for accessibility on BuildContext.
extension AccessibilityContext on BuildContext {
  /// Gets the current accessibility configuration.
  AccessibilityConfig get accessibility {
    return AccessibilityProvider.of(this);
  }

  /// Checks if high contrast mode is enabled.
  bool get isHighContrast {
    return MediaQuery.of(this).highContrast;
  }

  /// Checks if animations should be reduced.
  bool get shouldReduceMotion {
    return MediaQuery.of(this).disableAnimations;
  }

  /// Checks if bold text is preferred.
  bool get prefersBoldText {
    return MediaQuery.of(this).boldText;
  }

  /// Checks if a screen reader is active.
  bool get isScreenReaderActive {
    return MediaQuery.of(this).accessibleNavigation;
  }

  /// Gets the current text scale factor.
  double get textScaleFactor {
    return MediaQuery.of(this).textScaleFactor;
  }
}

/// Material Design 3 accessibility announcements for screen readers.
///
/// Provides utilities for making announcements to screen readers
/// in a way that follows Material Design patterns.
class AccessibilityAnnouncer {
  AccessibilityAnnouncer._();

  /// Makes a polite announcement to screen readers.
  /// The announcement will be made when the screen reader is idle.
  static void announcePolite(
    BuildContext context,
    String message, {
    TextDirection? textDirection,
  }) {
    SemanticsService.announce(
      message,
      textDirection ?? Directionality.of(context),
    );
  }

  /// Makes an assertive announcement to screen readers.
  /// The announcement interrupts the current speech.
  /// Note: Flutter's SemanticsService doesn't support assertiveness parameter yet,
  /// so this falls back to a regular announcement.
  static void announceAssertive(
    BuildContext context,
    String message, {
    TextDirection? textDirection,
  }) {
    // Flutter's SemanticsService.announce doesn't have assertiveness parameter
    // This is a limitation of the current Flutter framework
    // For now, we use the same announcement method
    SemanticsService.announce(
      message,
      textDirection ?? Directionality.of(context),
    );
  }

  /// Announces a state change for a component.
  static void announceStateChange(
    BuildContext context,
    String component,
    String oldState,
    String newState,
  ) {
    final message = '$component changed from $oldState to $newState';
    announcePolite(context, message);
  }

  /// Announces an error message.
  static void announceError(
    BuildContext context,
    String error,
  ) {
    // Use assertive-like behavior by prefixing with "Error"
    SemanticsService.announce(
      'Error: $error',
      Directionality.of(context),
    );
  }

  /// Announces a success message.
  static void announceSuccess(
    BuildContext context,
    String message,
  ) {
    announcePolite(context, 'Success: $message');
  }

  /// Announces loading state.
  static void announceLoading(
    BuildContext context, {
    String? customMessage,
  }) {
    announcePolite(context, customMessage ?? 'Loading, please wait');
  }

  /// Announces completion of loading.
  static void announceLoadingComplete(
    BuildContext context, {
    String? customMessage,
  }) {
    announcePolite(context, customMessage ?? 'Loading complete');
  }
}

/// Keyboard navigation specifications for Material Design 3.
///
/// Defines how keyboard navigation should work for accessibility.
@immutable
class KeyboardNavigationSpec {
  const KeyboardNavigationSpec({
    required this.tabIndex,
    required this.canRequestFocus,
    required this.skipTraversal,
    required this.descendantsAreFocusable,
    required this.shortcuts,
  });

  /// Standard keyboard navigation configuration.
  static const KeyboardNavigationSpec standard = KeyboardNavigationSpec(
    tabIndex: 0,
    canRequestFocus: true,
    skipTraversal: false,
    descendantsAreFocusable: true,
    shortcuts: {},
  );

  /// Configuration for non-interactive elements.
  static const KeyboardNavigationSpec nonInteractive = KeyboardNavigationSpec(
    tabIndex: -1,
    canRequestFocus: false,
    skipTraversal: true,
    descendantsAreFocusable: false,
    shortcuts: {},
  );

  /// Tab index for focus order.
  /// 0 = natural order, -1 = not focusable, >0 = custom order
  final int tabIndex;

  /// Whether this element can request focus.
  final bool canRequestFocus;

  /// Whether to skip this element during traversal.
  final bool skipTraversal;

  /// Whether descendants can be focused.
  final bool descendantsAreFocusable;

  /// Keyboard shortcuts for this element.
  final Map<LogicalKeySet, VoidCallback> shortcuts;

  /// Creates a copy with the given fields replaced.
  KeyboardNavigationSpec copyWith({
    int? tabIndex,
    bool? canRequestFocus,
    bool? skipTraversal,
    bool? descendantsAreFocusable,
    Map<LogicalKeySet, VoidCallback>? shortcuts,
  }) {
    return KeyboardNavigationSpec(
      tabIndex: tabIndex ?? this.tabIndex,
      canRequestFocus: canRequestFocus ?? this.canRequestFocus,
      skipTraversal: skipTraversal ?? this.skipTraversal,
      descendantsAreFocusable:
          descendantsAreFocusable ?? this.descendantsAreFocusable,
      shortcuts: shortcuts ?? this.shortcuts,
    );
  }
}

/// ARIA (Accessible Rich Internet Applications) roles for web.
///
/// While Flutter doesn't directly use ARIA, these roles help
/// maintain consistency with web accessibility standards.
enum AriaRole {
  /// Button element.
  button('button'),

  /// Checkbox element.
  checkbox('checkbox'),

  /// Radio button element.
  radio('radio'),

  /// Text field element.
  textbox('textbox'),

  /// Link element.
  link('link'),

  /// Navigation element.
  navigation('navigation'),

  /// Main content area.
  main('main'),

  /// Header element.
  header('header'),

  /// Footer element.
  footer('footer'),

  /// Search element.
  search('search'),

  /// Tab element.
  tab('tab'),

  /// Tab panel element.
  tabpanel('tabpanel'),

  /// Menu element.
  menu('menu'),

  /// Menu item element.
  menuitem('menuitem'),

  /// Dialog element.
  dialog('dialog'),

  /// Alert element.
  alert('alert'),

  /// Progress bar element.
  progressbar('progressbar'),

  /// Slider element.
  slider('slider'),

  /// Switch element.
  switchRole('switch'),

  /// List element.
  list('list'),

  /// List item element.
  listitem('listitem'),

  /// Grid element.
  grid('grid'),

  /// Grid cell element.
  gridcell('gridcell'),

  /// Image element.
  img('img'),

  /// Article element.
  article('article'),

  /// Region element.
  region('region'),

  /// Complementary content.
  complementary('complementary'),

  /// Form element.
  form('form'),

  /// Status element.
  status('status');

  const AriaRole(this.value);

  /// The ARIA role value.
  final String value;
}

/// Live region specifications for dynamic content.
///
/// Defines how screen readers should handle dynamic content updates.
enum LiveRegionMode {
  /// Updates are not announced.
  off,

  /// Updates are announced when screen reader is idle.
  polite,

  /// Updates interrupt current speech.
  assertive,
}

/// Widget that creates a live region for dynamic content.
class AccessibleLiveRegion extends StatefulWidget {
  const AccessibleLiveRegion({
    required this.child,
    super.key,
    this.mode = LiveRegionMode.polite,
    this.atomic = false,
  });

  final Widget child;
  final LiveRegionMode mode;
  final bool atomic;

  @override
  State<AccessibleLiveRegion> createState() => _AccessibleLiveRegionState();
}

class _AccessibleLiveRegionState extends State<AccessibleLiveRegion> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: widget.mode != LiveRegionMode.off,
      child: widget.child,
    );
  }
}

/// Provides keyboard shortcuts for accessibility.
class AccessibleShortcuts extends StatelessWidget {
  const AccessibleShortcuts({
    required this.child,
    required this.shortcuts,
    super.key,
    this.debugLabel,
  });

  final Widget child;
  final Map<LogicalKeySet, VoidCallback> shortcuts;
  final String? debugLabel;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: shortcuts.map(
        (key, value) => MapEntry(
          key,
          VoidCallbackIntent(value),
        ),
      ),
      debugLabel: debugLabel,
      child: Actions(
        actions: {
          VoidCallbackIntent: VoidCallbackAction(),
        },
        child: child,
      ),
    );
  }
}

/// Intent for void callback actions.
class VoidCallbackIntent extends Intent {
  const VoidCallbackIntent(this.callback);

  final VoidCallback callback;
}

/// Action for void callback intents.
class VoidCallbackAction extends Action<VoidCallbackIntent> {
  @override
  Object? invoke(VoidCallbackIntent intent) {
    intent.callback();
    return null;
  }
}

/// Provides focus traversal order for a group of widgets.
class AccessibleFocusTraversalGroup extends StatelessWidget {
  const AccessibleFocusTraversalGroup({
    required this.child,
    super.key,
    this.policy,
    this.descendantsAreFocusable = true,
    this.descendantsAreTraversable = true,
  });

  final Widget child;
  final FocusTraversalPolicy? policy;
  final bool descendantsAreFocusable;
  final bool descendantsAreTraversable;

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: policy ?? ReadingOrderTraversalPolicy(),
      descendantsAreFocusable: descendantsAreFocusable,
      descendantsAreTraversable: descendantsAreTraversable,
      child: child,
    );
  }
}

/// Screen reader utilities for Material Design 3.
class ScreenReaderUtils {
  ScreenReaderUtils._();

  /// Creates a semantic label for a button.
  static String buttonLabel({
    required String text,
    bool isEnabled = true,
    bool isSelected = false,
  }) {
    final buffer = StringBuffer(text);

    if (!isEnabled) {
      buffer.write(', disabled');
    }
    if (isSelected) {
      buffer.write(', selected');
    }

    buffer.write(', button');
    return buffer.toString();
  }

  /// Creates a semantic label for a checkbox.
  static String checkboxLabel({
    required String label,
    required bool isChecked,
    bool isEnabled = true,
    bool isIndeterminate = false,
  }) {
    final buffer = StringBuffer(label);

    if (isIndeterminate) {
      buffer.write(', partially checked');
    } else if (isChecked) {
      buffer.write(', checked');
    } else {
      buffer.write(', not checked');
    }

    if (!isEnabled) {
      buffer.write(', disabled');
    }

    buffer.write(', checkbox');
    return buffer.toString();
  }

  /// Creates a semantic label for a radio button.
  static String radioLabel({
    required String label,
    required bool isSelected,
    bool isEnabled = true,
  }) {
    final buffer = StringBuffer(label);

    if (isSelected) {
      buffer.write(', selected');
    } else {
      buffer.write(', not selected');
    }

    if (!isEnabled) {
      buffer.write(', disabled');
    }

    buffer.write(', radio button');
    return buffer.toString();
  }

  /// Creates a semantic label for a slider.
  static String sliderLabel({
    required String label,
    required double value,
    required double min,
    required double max,
    bool isEnabled = true,
  }) {
    final percentage = ((value - min) / (max - min) * 100).round();
    final buffer = StringBuffer(label);

    buffer.write(', $percentage percent');

    if (!isEnabled) {
      buffer.write(', disabled');
    }

    buffer.write(', slider');
    return buffer.toString();
  }

  /// Creates a semantic label for a switch.
  static String switchLabel({
    required String label,
    required bool isOn,
    bool isEnabled = true,
  }) {
    final buffer = StringBuffer(label);

    buffer.write(', switch, ${isOn ? "on" : "off"}');

    if (!isEnabled) {
      buffer.write(', disabled');
    }

    return buffer.toString();
  }

  /// Creates a semantic label for a text field.
  static String textFieldLabel({
    required String label,
    String? value,
    String? error,
    bool isEnabled = true,
    bool isReadOnly = false,
    bool isPassword = false,
  }) {
    final buffer = StringBuffer(label);

    if (isPassword) {
      buffer.write(', password field');
    } else {
      buffer.write(', text field');
    }

    if (value != null && value.isNotEmpty) {
      if (!isPassword) {
        buffer.write(', $value');
      } else {
        buffer.write(', ${value.length} characters');
      }
    } else {
      buffer.write(', empty');
    }

    if (error != null) {
      buffer.write(', error: $error');
    }

    if (isReadOnly) {
      buffer.write(', read only');
    }

    if (!isEnabled) {
      buffer.write(', disabled');
    }

    return buffer.toString();
  }

  /// Creates a semantic label for a progress indicator.
  static String progressLabel({
    String? label,
    double? value,
    bool isIndeterminate = false,
  }) {
    final buffer = StringBuffer();

    if (label != null) {
      buffer.write(label);
      buffer.write(', ');
    }

    if (isIndeterminate) {
      buffer.write('loading');
    } else if (value != null) {
      final percentage = (value * 100).round();
      buffer.write('$percentage percent complete');
    }

    return buffer.toString();
  }

  /// Creates a semantic hint for common actions.
  static String actionHint(String action) {
    switch (action.toLowerCase()) {
      case 'tap':
        return 'Double tap to activate';
      case 'long press':
        return 'Double tap and hold to activate';
      case 'swipe':
        return 'Swipe to navigate';
      case 'scroll':
        return 'Use two fingers to scroll';
      case 'expand':
        return 'Double tap to expand';
      case 'collapse':
        return 'Double tap to collapse';
      case 'dismiss':
        return 'Swipe to dismiss';
      default:
        return 'Double tap to $action';
    }
  }
}

/// Text scaling utilities for accessibility.
class TextScalingUtils {
  TextScalingUtils._();

  /// Material Design 3 text scale factors.
  static const double scaleSmall = 0.85;
  static const double scaleDefault = 1;
  static const double scaleLarge = 1.15;
  static const double scaleExtraLarge = 1.3;
  static const double scaleHuge = 1.5;

  /// Gets the appropriate text scale factor based on user preference.
  static double getTextScaleFactor(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.textScaleFactor.clamp(scaleSmall, scaleHuge);
  }

  /// Scales a font size based on the current text scale factor.
  static double scaleFont(
    double fontSize,
    BuildContext context, {
    double? minSize,
    double? maxSize,
  }) {
    final scaleFactor = getTextScaleFactor(context);
    final scaled = fontSize * scaleFactor;

    if (minSize != null && scaled < minSize) {
      return minSize;
    }
    if (maxSize != null && scaled > maxSize) {
      return maxSize;
    }

    return scaled;
  }

  /// Determines if text scaling is significantly different from default.
  static bool isTextScalingSignificant(BuildContext context) {
    final scaleFactor = getTextScaleFactor(context);
    return (scaleFactor - scaleDefault).abs() > 0.2;
  }
}

/// Motion and animation accessibility utilities.
class MotionAccessibility {
  MotionAccessibility._();

  /// Gets an accessible duration based on user preferences.
  static Duration getAccessibleDuration(
    Duration standard, {
    required bool reduceMotion,
    double speedFactor = 1.0,
  }) {
    if (reduceMotion) {
      return Duration.zero;
    }
    return Duration(
      milliseconds: (standard.inMilliseconds * speedFactor).round(),
    );
  }

  /// Gets an accessible curve based on user preferences.
  static Curve getAccessibleCurve(
    Curve standard, {
    required bool reduceMotion,
  }) {
    if (reduceMotion) {
      return Curves.linear;
    }
    return standard;
  }

  /// Creates an accessible animation controller.
  static AnimationController createAccessibleAnimationController({
    required TickerProvider vsync,
    required Duration duration,
    required bool reduceMotion,
    double? value,
    double lowerBound = 0.0,
    double upperBound = 1.0,
    AnimationBehavior animationBehavior = AnimationBehavior.normal,
  }) {
    return AnimationController(
      duration: getAccessibleDuration(duration, reduceMotion: reduceMotion),
      vsync: vsync,
      value: value,
      lowerBound: lowerBound,
      upperBound: upperBound,
      animationBehavior: animationBehavior,
    );
  }
}

/// Color accessibility utilities beyond contrast.
class ColorAccessibility {
  ColorAccessibility._();

  /// Simulates color blindness types.
  static Color simulateColorBlindness(
    Color color,
    ColorBlindnessType type,
  ) {
    switch (type) {
      case ColorBlindnessType.protanopia:
        return _simulateProtanopia(color);
      case ColorBlindnessType.deuteranopia:
        return _simulateDeuteranopia(color);
      case ColorBlindnessType.tritanopia:
        return _simulateTritanopia(color);
      case ColorBlindnessType.monochromacy:
        return _simulateMonochromacy(color);
    }
  }

  static Color _simulateProtanopia(Color color) {
    // Simplified simulation - real implementation would use proper matrices
    final r = color.red * 0.567 + color.green * 0.433;
    final g = color.red * 0.558 + color.green * 0.442;
    final b = color.blue;

    return Color.fromARGB(
      color.alpha,
      r.round().clamp(0, 255),
      g.round().clamp(0, 255),
      b.clamp(0, 255),
    );
  }

  static Color _simulateDeuteranopia(Color color) {
    // Simplified simulation
    final r = color.red * 0.625 + color.green * 0.375;
    final g = color.red * 0.7 + color.green * 0.3;
    final b = color.blue;

    return Color.fromARGB(
      color.alpha,
      r.round().clamp(0, 255),
      g.round().clamp(0, 255),
      b.clamp(0, 255),
    );
  }

  static Color _simulateTritanopia(Color color) {
    // Simplified simulation
    final r = color.red;
    final g = color.green;
    final b = color.green * 0.475 + color.blue * 0.525;

    return Color.fromARGB(
      color.alpha,
      r.clamp(0, 255),
      g.clamp(0, 255),
      b.round().clamp(0, 255),
    );
  }

  static Color _simulateMonochromacy(Color color) {
    // Convert to grayscale
    final gray =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue).round();

    return Color.fromARGB(
      color.alpha,
      gray,
      gray,
      gray,
    );
  }

  /// Checks if two colors are distinguishable for color blind users.
  static bool areColorsDistinguishable(
    Color color1,
    Color color2,
    ColorBlindnessType type,
  ) {
    final simulated1 = simulateColorBlindness(color1, type);
    final simulated2 = simulateColorBlindness(color2, type);

    // Calculate color difference
    final rDiff = (simulated1.red - simulated2.red).abs();
    final gDiff = (simulated1.green - simulated2.green).abs();
    final bDiff = (simulated1.blue - simulated2.blue).abs();

    // Threshold for distinguishability
    const threshold = 50;

    return rDiff + gDiff + bDiff > threshold;
  }
}

/// Types of color blindness for simulation.
enum ColorBlindnessType {
  /// Red-blind (affects ~2% of males).
  protanopia,

  /// Green-blind (affects ~6% of males).
  deuteranopia,

  /// Blue-blind (very rare).
  tritanopia,

  /// Complete color blindness (extremely rare).
  monochromacy,
}

/// High contrast theme utilities for Material Design 3.
class HighContrastTheme {
  HighContrastTheme._();

  /// Creates a high contrast color scheme from a regular scheme.
  static ColorScheme createHighContrastScheme(ColorScheme base) {
    return base.copyWith(
      primary: _increaseContrast(base.primary, base.surface),
      onPrimary: _ensureHighContrast(base.onPrimary, base.primary),
      secondary: _increaseContrast(base.secondary, base.surface),
      onSecondary: _ensureHighContrast(base.onSecondary, base.secondary),
      error: _increaseContrast(base.error, base.surface),
      onError: _ensureHighContrast(base.onError, base.error),
      surface: base.surface,
      onSurface: _ensureHighContrast(base.onSurface, base.surface),
    );
  }

  static Color _increaseContrast(Color foreground, Color background) {
    return ContrastUtils.ensureContrast(
      foreground: foreground,
      background: background,
      minimumRatio: ContrastRatio.aaa,
    );
  }

  static Color _ensureHighContrast(Color foreground, Color background) {
    return ContrastUtils.ensureContrast(
      foreground: foreground,
      background: background,
      minimumRatio: ContrastRatio.aaa,
    );
  }
}
