part of '../../../../material_design.dart';

/// Helper class for responsive navigation patterns.
///
/// Provides utilities for implementing Material Design 3 navigation patterns
/// that adapt to different window size classes.
class M3ResponsiveNavigation {
  /// Determines the appropriate navigation type for the current window size
  /// class.
  static M3NavigationType getNavigationType(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
        return M3NavigationType.bottom;
      case M3ScreenSize.medium:
      case M3ScreenSize.expanded:
        return M3NavigationType.rail;
      case M3ScreenSize.large:
      case M3ScreenSize.extraLarge:
        return M3NavigationType.drawer;
    }
  }

  /// Determines if a navigation rail should be extended.
  static bool shouldExtendRail(M3ScreenSize screenSize) {
    return screenSize.isAtLeast(M3ScreenSize.large);
  }

  /// Gets the recommended navigation rail width.
  static double getRailWidth({required bool extended}) {
    return extended ? 256.0 : 80.0;
  }
}

/// Navigation types for different window size classes.
enum M3NavigationType {
  /// Bottom navigation bar (compact screens).
  bottom,

  /// Navigation rail (medium/expanded screens).
  rail,

  /// Navigation drawer (large/extra large screens).
  drawer,
}
