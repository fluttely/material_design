import 'package:flutter/material.dart';
// Assuming IM3Token and ScreenSize are defined elsewhere in your project.
import 'package:material_design/material_design.dart';

/// {@template im3_visual_density_token}
/// Represents the contract for a Material 3 visual density token.
///
/// This interface establishes the essential properties for any object that
/// defines visual density settings. It ensures that all tokens can be
/// processed consistently to apply appropriate density adjustments according
/// to Material Design 3 principles.
/// {@endtemplate}
@immutable
abstract interface class IM3VisualDensityToken
    implements IM3Token<VisualDensity> {
  /// The concrete [VisualDensity] value for this token.
  @override
  VisualDensity get value;

  /// The horizontal density adjustment. A negative value indicates a more
  /// compact (tighter) spacing.
  double get horizontal;

  /// The vertical density adjustment. A negative value indicates a more
  /// compact (tighter) spacing.
  double get vertical;

  /// Whether this density is considered adaptive to the platform.
  bool get isAdaptive;

  /// A human-readable description of the density level.
  String get description;
}

/// {@template m3_visual_density_token}
/// Defines the global visual density tokens for the Material 3 design system.
///
/// Visual density controls the vertical and horizontal "compactness" of UI
/// components. It affects spacing around elements like buttons, list items,
/// and form controls, but does not affect text sizes, icon sizes, or internal
/// padding defined by specs.
/// {@endtemplate}
enum M3VisualDensityToken implements IM3VisualDensityToken {
  /// The default visual density profile (0, 0).
  ///
  /// This represents a visual density that corresponds to density values of
  /// zero in both axes, matching the Material Design specification defaults.
  standard(
    0,
    0,
    description: 'Standard density with default spacing',
  ),

  /// A comfortable visual density profile (-1, -1).
  ///
  /// Components will interpret this density by making themselves less dense
  /// than [standard], providing more breathing room and larger touch targets.
  comfortable(
    -1,
    -1,
    description: 'Comfortable density with increased spacing',
  ),

  /// A compact visual density profile (-2, -2).
  ///
  /// Components will interpret this density by making themselves more dense
  /// than [standard], fitting more content on the screen.
  compact(
    -2,
    -2,
    description: 'Compact density with reduced spacing',
  ),

  /// An adaptive visual density that adjusts based on the current platform.
  ///
  /// This density resolves to [VisualDensity.adaptivePlatformDensity], which
  /// typically uses a more compact spacing on desktop and standard on mobile.
  adaptivePlatform(
    0,
    0, // Placeholder values, as the actual density is determined by Flutter.
    isAdaptive: true,
    description: 'Platform-adaptive density',
  );

  /// Creates a global visual density token.
  const M3VisualDensityToken(
    this.horizontal,
    this.vertical, {
    required this.description,
    this.isAdaptive = false,
  });

  @override
  final double horizontal;

  @override
  final double vertical;

  @override
  final bool isAdaptive;

  @override
  final String description;

  @override
  VisualDensity get value {
    // FIX: The recursion is resolved here.
    // For the adaptive case, we return Flutter's built-in adaptive density
    // directly, preventing the infinite loop that caused the StackOverflowError.
    if (isAdaptive) {
      return VisualDensity.adaptivePlatformDensity;
    }
    // For all other cases, construct the density from the token's properties.
    return VisualDensity(horizontal: horizontal, vertical: vertical);
  }

  /// A convenient alias for the [adaptivePlatform] enum case.
  static M3VisualDensityToken get adaptivePlatformDensity => adaptivePlatform;

  /// Gets the recommended density token for the current platform.
  static M3VisualDensityToken forPlatform(TargetPlatform platform) {
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
  static M3VisualDensityToken forScreenSize(M3ScreenSize screenSize) {
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

/// {@template m3_component_visual_density_token}
/// Defines component-specific visual density adjustments.
///
/// These tokens provide overrides for specific components that may require a
/// different density from the global theme setting for optimal layout.
/// {@endtemplate}
enum M3ComponentVisualDensityToken implements IM3VisualDensityToken {
  /// Dense list items for information-heavy lists.
  listItemDense(-1, -2, description: 'Dense spacing for list items'),

  /// Comfortable button spacing for better touch targets.
  buttonComfortable(-0.5, -0.5, description: 'Comfortable button spacing'),

  /// Compact form field spacing for dense forms.
  formFieldCompact(-1.5, -1.5, description: 'Compact form field spacing'),

  /// Dense chip spacing for tag-like interfaces.
  chipDense(-1, -1, description: 'Dense chip spacing'),

  /// Comfortable navigation item spacing.
  navigationComfortable(-0.5, -1,
      description: 'Comfortable navigation spacing');

  /// Creates a component-specific visual density token.
  const M3ComponentVisualDensityToken(
    this.horizontal,
    this.vertical, {
    required this.description,
  });

  @override
  final double horizontal;

  @override
  final double vertical;

  @override
  final String description;

  @override
  bool get isAdaptive => false;

  @override
  VisualDensity get value =>
      VisualDensity(horizontal: horizontal, vertical: vertical);
}

/// Provides utility methods for working with any [IM3VisualDensityToken].
extension IM3VisualDensityTokenUtils on IM3VisualDensityToken {
  /// Checks if this density is more compact than another.
  bool isMoreCompactThan(IM3VisualDensityToken other) {
    final thisCompactness = horizontal + vertical;
    final otherCompactness = other.horizontal + other.vertical;
    return thisCompactness < otherCompactness;
  }

  /// Checks if this density is more comfortable (less compact) than another.
  bool isMoreComfortableThan(IM3VisualDensityToken other) {
    final thisCompactness = horizontal + vertical;
    final otherCompactness = other.horizontal + other.vertical;
    return thisCompactness > otherCompactness;
  }

  /// Creates a new [VisualDensity] by adjusting this density's values.
  VisualDensity adjustBy({double horizontal = 0.0, double vertical = 0.0}) {
    return VisualDensity(
      horizontal: this.horizontal + horizontal,
      vertical: this.vertical + vertical,
    );
  }

  /// Linearly interpolates between this density and another one.
  VisualDensity lerpTo(IM3VisualDensityToken other, double t) {
    return VisualDensity.lerp(value, other.value, t);
  }

  /// Whether this density is generally considered suitable for touch interfaces.
  bool get isTouchFriendly => horizontal >= -1.0 && vertical >= -1.0;

  /// Whether this density is generally considered optimized for desktop use.
  bool get isDesktopOptimized => horizontal <= 0.0 && vertical <= 0.0;
}

/// Provides context-aware visual density utilities on [BuildContext].
extension IM3VisualDensityContext on BuildContext {
  /// Gets the current [VisualDensity] from the active [Theme].
  VisualDensity get visualDensity => Theme.of(this).visualDensity;

  /// Gets the recommended [M3VisualDensityToken] for the current platform context.
  M3VisualDensityToken get recommendedDensity {
    final platform = Theme.of(this).platform;
    return M3VisualDensityToken.forPlatform(platform);
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
  ThemeData withVisualDensity(IM3VisualDensityToken densityToken) {
    return Theme.of(this).copyWith(visualDensity: densityToken.value);
  }
}