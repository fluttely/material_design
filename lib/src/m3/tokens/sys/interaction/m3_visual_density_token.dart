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
/// Material Design 3 visual density tokens for adaptive component spacing.
///
/// Visual density controls the spatial compactness of UI components by adjusting
/// spacing around interactive elements. This system enables interfaces to adapt
/// to different usage contexts, input methods, and user preferences while
/// maintaining usability and accessibility standards.
///
/// ## What Visual Density Affects
///
/// **Affected Elements**:
/// - Spacing around buttons, chips, and interactive components
/// - List item height and internal padding
/// - Form field spacing and touch target areas
/// - Navigation element spacing
/// - Component margins and separation
///
/// **Unaffected Elements**:
/// - Text sizes and typography scale
/// - Icon sizes and visual elements
/// - Component border radii
/// - Internal content padding (spec-defined)
/// - Color schemes and visual styling
///
/// ## Density Levels and Use Cases
///
/// - **Comfortable (-1, -1)**: Touch-optimized interfaces, accessibility focus
/// - **Standard (0, 0)**: Balanced approach, Material Design baseline  
/// - **Compact (-2, -2)**: Information-dense interfaces, desktop optimization
/// - **Adaptive Platform**: Automatically adjusts based on platform conventions
///
/// ## Implementation Notes
///
/// Visual density values are applied as multipliers to component spacing.
/// Negative values create tighter spacing (more compact), while positive
/// values create looser spacing (more comfortable). The system ensures
/// minimum touch target sizes are maintained for accessibility.
///
/// Reference: https://m3.material.io/foundations/interaction/touch-targets
/// {@endtemplate}
enum M3VisualDensityToken implements IM3VisualDensityToken {
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
  standard(
    0,
    0,
    description: 'Standard density with Material Design baseline spacing',
  ),

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
  comfortable(
    -1,
    -1,
    description: 'Comfortable density with enhanced touch targets',
  ),

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
  compact(
    -2,
    -2,
    description: 'Compact density for information-dense interfaces',
  ),

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
  adaptivePlatform(
    0, // Placeholder - actual values determined by Flutter at runtime
    0, // Placeholder - actual values determined by Flutter at runtime
    isAdaptive: true,
    description: 'Platform-adaptive density that respects system conventions',
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

// /// {@template m3_component_visual_density_token}
// /// Defines component-specific visual density adjustments.
// ///
// /// These tokens provide overrides for specific components that may require a
// /// different density from the global theme setting for optimal layout.
// /// {@endtemplate}
// enum _M3ComponentVisualDensityToken implements IM3VisualDensityToken {
//   /// Dense list items for information-heavy lists.
//   listItemDense(-1, -2, description: 'Dense spacing for list items'),

//   /// Comfortable button spacing for better touch targets.
//   buttonComfortable(-0.5, -0.5, description: 'Comfortable button spacing'),

//   /// Compact form field spacing for dense forms.
//   formFieldCompact(-1.5, -1.5, description: 'Compact form field spacing'),

//   /// Dense chip spacing for tag-like interfaces.
//   chipDense(-1, -1, description: 'Dense chip spacing'),

//   /// Comfortable navigation item spacing.
//   navigationComfortable(-0.5, -1,
//       description: 'Comfortable navigation spacing');

//   /// Creates a component-specific visual density token.
//   const _M3ComponentVisualDensityToken(
//     this.horizontal,
//     this.vertical, {
//     required this.description,
//   });

//   @override
//   final double horizontal;

//   @override
//   final double vertical;

//   @override
//   final String description;

//   @override
//   bool get isAdaptive => false;

//   @override
//   VisualDensity get value =>
//       VisualDensity(horizontal: horizontal, vertical: vertical);
// }

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
