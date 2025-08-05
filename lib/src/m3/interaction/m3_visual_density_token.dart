part of '../../../material_design.dart';

class M3VisualDensity extends VisualDensity {
  /// A const constructor for [VisualDensity].
  ///
  /// The [horizontal] and [vertical] arguments must be in the interval between
  /// [minimumDensity] and [maximumDensity], inclusive.
  const M3VisualDensity({super.horizontal = 0.0, super.vertical = 0.0});

  /// Standard visual density (0, 0) - Material Design baseline.
  ///
  /// The default density level that provides balanced spacing according to
  /// Material Design 3 specifications. This density serves as the reference
  /// point for all other density calculations and provides optimal balance
  /// between content density and usability.
  ///
  /// **Characteristics**:
  /// - Follows Material Design 3 spacing specifications exactly
  /// - Optimal for mixed-use interfaces (touch and mouse)
  /// - Provides good balance of content density and accessibility
  /// - Suitable for most general-purpose applications
  ///
  /// **Best for**: General applications, mixed input methods, balanced UX
  static const M3VisualDensity standard = M3VisualDensity();

  /// Comfortable visual density (-1, -1) - Enhanced touch accessibility.
  ///
  /// Provides increased spacing and larger touch targets for improved
  /// accessibility and touch interaction. This density prioritizes user
  /// comfort and accessibility compliance over content density.
  ///
  /// **Characteristics**:
  /// - Larger touch targets (better accessibility)
  /// - Increased spacing between interactive elements
  /// - Enhanced visual breathing room
  /// - Optimized for touch-first interfaces
  /// - Improved usability for users with motor difficulties
  ///
  /// **Best for**: Touch devices, accessibility-focused apps, senior users
  static const M3VisualDensity comfortable =
      M3VisualDensity(horizontal: -1, vertical: -1);

  /// Compact visual density (-2, -2) - Information-dense interfaces.
  ///
  /// Reduces spacing to maximize content density while maintaining minimum
  /// accessibility standards. This density enables more information display
  /// in limited screen space, ideal for data-heavy applications.
  ///
  /// **Characteristics**:
  /// - Reduced spacing between components
  /// - Higher information density
  /// - Optimized for mouse/keyboard interaction
  /// - Maintains minimum touch target sizes
  /// - Efficient use of screen real estate
  ///
  /// **Best for**: Desktop apps, data tables, professional tools, dashboards
  static const M3VisualDensity compact =
      M3VisualDensity(horizontal: -2, vertical: -2);

  /// Adaptive platform density - Automatically adjusts per platform.
  ///
  /// Automatically selects appropriate density based on platform conventions
  /// and user preferences. This token delegates to Flutter's built-in adaptive
  /// density system, which considers platform norms and user settings.
  ///
  /// **Platform Behavior**:
  /// - **Mobile (iOS/Android)**: Tends toward comfortable for touch optimization
  /// - **Desktop (Windows/macOS/Linux)**: Tends toward compact for efficiency
  /// - **Web**: Adapts based on user agent and screen characteristics
  ///
  /// **Characteristics**:
  /// - Platform-aware density selection
  /// - Respects user system preferences
  /// - Automatically updates with system changes
  /// - Provides native platform feel
  ///
  /// **Best for**: Cross-platform apps, platform-native experiences
  static M3VisualDensity get adaptivePlatformDensity =>
      defaultDensityForPlatform(defaultTargetPlatform);

  /// Returns a [VisualDensity] that is adaptive based on the given [platform].
  ///
  /// For desktop platforms, this returns [compact], and for other platforms, it
  /// returns a default-constructed [VisualDensity].
  ///
  /// See also:
  ///
  /// * [adaptivePlatformDensity] which returns a [VisualDensity] that is
  ///   adaptive based on [defaultTargetPlatform].
  static M3VisualDensity defaultDensityForPlatform(TargetPlatform platform) {
    return switch (platform) {
      TargetPlatform.android ||
      TargetPlatform.iOS ||
      TargetPlatform.fuchsia =>
        standard,
      TargetPlatform.linux ||
      TargetPlatform.macOS ||
      TargetPlatform.windows =>
        compact,
    };
  }

  /// Gets the recommended density token for the current platform.
  static M3VisualDensity forPlatform(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return comfortable; // More spacing for touch interfaces
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return standard; // Standard density for desktop
    }
  }

  /// Gets the recommended density token based on screen size category.
  static M3VisualDensity forScreenSize(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
        return compact; // Maximize content on small screens
      case M3ScreenSize.medium:
        return standard; // Balanced approach
      case M3ScreenSize.expanded:
      case M3ScreenSize.large:
      case M3ScreenSize.extraLarge:
        return comfortable; // More spacing on large screens
    }
  }
}

/// Provides utility methods for working with any [IM3VisualDensityToken].
extension M3VisualDensityUtils on M3VisualDensity {
  /// Checks if this density is more compact than another.
  bool isMoreCompactThan(M3VisualDensity other) {
    final thisCompactness = horizontal + vertical;
    final otherCompactness = other.horizontal + other.vertical;
    return thisCompactness < otherCompactness;
  }

  /// Checks if this density is more comfortable (less compact) than another.
  bool isMoreComfortableThan(M3VisualDensity other) {
    final thisCompactness = horizontal + vertical;
    final otherCompactness = other.horizontal + other.vertical;
    return thisCompactness > otherCompactness;
  }

  /// Creates a new [VisualDensity] by adjusting this density's values.
  VisualDensity adjustBy({double horizontal = 0.0, double vertical = 0.0}) {
    return VisualDensity(
      horizontal: horizontal + horizontal,
      vertical: vertical + vertical,
    );
  }

  /// Linearly interpolates between this density and another one.
  VisualDensity lerpTo(M3VisualDensity other, double t) {
    return VisualDensity.lerp(this, other, t);
  }

  /// Whether this density is generally considered suitable for touch
  /// interfaces.
  bool get isTouchFriendly => horizontal >= -1.0 && vertical >= -1.0;

  /// Whether this density is generally considered optimized for desktop use.
  bool get isDesktopOptimized => horizontal <= 0.0 && vertical <= 0.0;
}

/// Provides context-aware visual density utilities on [BuildContext].
extension IM3VisualDensityContext on BuildContext {
  /// Gets the current [VisualDensity] from the active [Theme].
  VisualDensity get visualDensity => Theme.of(this).visualDensity;

  /// Gets the recommended [M3VisualDensity] for the current platform
  /// context.
  M3VisualDensity get recommendedDensity {
    final platform = Theme.of(this).platform;
    return M3VisualDensity.forPlatform(platform);
  }

  /// Whether the current theme's density is considered compact.
  bool get prefersCompactDensity {
    final density = Theme.of(this).visualDensity;
    return density.horizontal < 0 || density.vertical < 0;
  }

  /// Whether the current theme is using the adaptive platform density.
  bool get usesAdaptiveDensity {
    final density = Theme.of(this).visualDensity;
    return density == VisualDensity.adaptivePlatformDensity;
  }

  /// Creates a new [ThemeData] instance by applying the specified
  /// [densityToken] to the current theme.
  ThemeData withVisualDensity(M3VisualDensity densityToken) {
    return Theme.of(this).copyWith(visualDensity: densityToken);
  }
}
