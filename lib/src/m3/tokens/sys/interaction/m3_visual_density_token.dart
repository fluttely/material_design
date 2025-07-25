/// M3VisualDensityToken
library;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// {@template im3_visual_density_token}
/// Represents the contract for a Material 3 visual density token.
///
/// This interface establishes the essential properties required for any object
/// that defines visual density settings. It ensures that all tokens can be
/// processed consistently to apply appropriate density adjustments according
/// to Material Design 3 principles.
/// {@endtemplate}
@immutable
abstract interface class IM3VisualDensityToken
    implements IM3Token<VisualDensity> {
  /// The visual density value for this token.
  @override
  VisualDensity get value;

  /// The horizontal density adjustment.
  double get horizontal;

  /// The vertical density adjustment.
  double get vertical;

  /// Whether this density is considered adaptive to the platform.
  bool get isAdaptive;

  /// A description of the density level.
  String get description;
}

/// {@template m3_visual_density_token}
/// Defines the visual density tokens for Material 3 design system.
///
/// Visual density controls the vertical and horizontal "compactness" of UI
/// components. It affects spacing around elements like buttons, list items,
/// and form controls, but does not affect text sizes, icon sizes, or padding.
/// {@endtemplate}
enum M3VisualDensityToken implements IM3VisualDensityToken {
  /// The default visual density profile.
  ///
  /// This represents a visual density that corresponds to density values of
  /// zero in both axes, matching the Material Design specification defaults.
  standard(
    0,
    0,
    description: 'Standard density with default spacing',
  ),

  /// A comfortable visual density profile.
  ///
  /// Individual components will interpret this density by making themselves
  /// less dense than [standard], providing more breathing room and touch
  /// targets that are easier to interact with.
  ///
  /// Corresponds to density values of -1 in both axes.
  comfortable(
    -1,
    -1,
    description: 'Comfortable density with increased spacing',
  ),

  /// A compact visual density profile.
  ///
  /// Individual components will interpret this density by making themselves
  /// more dense than [standard] and [comfortable], providing more content
  /// in the same screen space at the cost of touch target size.
  ///
  /// Corresponds to density values of -2 in both axes.
  compact(
    -2,
    -2,
    description: 'Compact density with reduced spacing',
  ),

  /// An adaptive visual density that adjusts based on platform.
  ///
  /// This density adapts to the platform conventions:
  /// - On touch platforms (mobile), uses more spacing for better touch targets
  /// - On desktop platforms, uses more compact spacing to fit more content
  adaptivePlatform(
    0,
    0,
    isAdaptive: true,
    description: 'Platform-adaptive density',
  );

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
    if (isAdaptive) {
      return adaptivePlatformDensity.value;
    }
    return VisualDensity(horizontal: horizontal, vertical: vertical);
  }

  static M3VisualDensityToken get adaptivePlatformDensity => adaptivePlatform;

  /// Gets the appropriate density based on platform and user preferences.
  static VisualDensity adaptive() => VisualDensity.adaptivePlatformDensity;

  /// Gets the recommended density for the current platform.
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

  /// Gets the recommended density based on screen size category.
  static M3VisualDensityToken forScreenSize(ScreenSize screenSize) {
    switch (screenSize) {
      case ScreenSize.small:
        return compact; // Maximize content on small screens
      case ScreenSize.medium:
        return standard; // Balanced approach
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return comfortable; // More spacing on large screens
    }
  }
}

/// {@template m3_component_visual_density_token}
/// Defines component-specific visual density adjustments.
///
/// Some components may need different density adjustments than the global
/// theme density. These tokens provide component-specific overrides.
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

/// Screen size categories for density selection.
enum ScreenSize {
  /// Small screens (phones in portrait, small tablets).
  small,

  /// Medium screens (phones in landscape, medium tablets).
  medium,

  /// Large screens (large tablets, small desktops).
  large,

  /// Extra large screens (large desktops, TVs).
  extraLarge,
}

/// Provides utility methods for working with visual density tokens.
extension IM3VisualDensityTokenUtils on IM3VisualDensityToken {
  /// Checks if this density is more compact than another density.
  bool isMoreCompactThan(IM3VisualDensityToken other) {
    final thisCompactness = horizontal + vertical;
    final otherCompactness = other.horizontal + other.vertical;
    return thisCompactness < otherCompactness;
  }

  /// Checks if this density is more comfortable than another density.
  bool isMoreComfortableThan(IM3VisualDensityToken other) {
    final thisCompactness = horizontal + vertical;
    final otherCompactness = other.horizontal + other.vertical;
    return thisCompactness > otherCompactness;
  }

  /// Creates a new density by adjusting this density by the given amounts.
  VisualDensity adjustBy({double horizontal = 0.0, double vertical = 0.0}) {
    return VisualDensity(
      horizontal: this.horizontal + horizontal,
      vertical: this.vertical + vertical,
    );
  }

  /// Interpolates between this density and another density.
  VisualDensity lerpTo(IM3VisualDensityToken other, double t) {
    return VisualDensity(
      horizontal: (horizontal * (1.0 - t)) + (other.horizontal * t),
      vertical: (vertical * (1.0 - t)) + (other.vertical * t),
    );
  }

  /// Checks if this density is suitable for touch interfaces.
  bool get isTouchFriendly => horizontal >= -1.0 && vertical >= -1.0;

  /// Checks if this density is suitable for desktop interfaces.
  bool get isDesktopOptimized => horizontal <= 0.0 && vertical <= 0.0;
}

/// Provides context-aware visual density utilities.
extension IM3VisualDensityContext on BuildContext {
  /// Gets the current visual density from the theme.
  VisualDensity get visualDensity => Theme.of(this).visualDensity;

  /// Gets the recommended density token for the current context.
  M3VisualDensityToken get recommendedDensity {
    final platform = Theme.of(this).platform;
    return M3VisualDensityToken.forPlatform(platform);
  }

  /// Checks if the current context prefers compact density.
  bool get prefersCompactDensity {
    final density = Theme.of(this).visualDensity;
    return density.horizontal < 0 || density.vertical < 0;
  }

  /// Checks if the current context is using adaptive density.
  bool get usesAdaptiveDensity {
    final density = Theme.of(this).visualDensity;
    return density == VisualDensity.adaptivePlatformDensity;
  }

  /// Creates a theme with the specified visual density token.
  ThemeData withVisualDensity(IM3VisualDensityToken densityToken) {
    return Theme.of(this).copyWith(visualDensity: densityToken.value);
  }
}
