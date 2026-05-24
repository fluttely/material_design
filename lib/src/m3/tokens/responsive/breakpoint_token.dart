part of '../../../../material_design.dart';

/// Material Design 3 breakpoint values for responsive window size classes.
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
abstract final class M3Breakpoints {
  /// Compact breakpoint (0dp to 599dp).
  ///
  /// **Typical devices**: Phones in portrait mode.
  static const double compact = 0;

  /// Medium breakpoint (600dp to 839dp).
  ///
  /// **Typical devices**: Phones in landscape, small tablets.
  static const double medium = 600;

  /// Expanded breakpoint (840dp to 1199dp).
  ///
  /// **Typical devices**: Large tablets in landscape, foldables.
  static const double expanded = 840;

  /// Large breakpoint (1200dp to 1599dp).
  ///
  /// **Typical devices**: Desktop monitors, laptops.
  static const double large = 1200;

  /// Extra large breakpoint (1600dp and above).
  ///
  /// **Typical devices**: Large monitors, ultra-wide displays.
  static const double extraLarge = 1600;

  // --- Utility Methods ---

  /// Gets the current window size class based on screen width.
  static M3ScreenSize getScreenSize(double width) {
    if (width < M3Breakpoints.medium) {
      return M3ScreenSize.compact;
    } else if (width < M3Breakpoints.expanded) {
      return M3ScreenSize.medium;
    } else if (width < M3Breakpoints.large) {
      return M3ScreenSize.expanded;
    } else if (width < M3Breakpoints.extraLarge) {
      return M3ScreenSize.large;
    } else {
      return M3ScreenSize.extraLarge;
    }
  }

  /// Gets the window size class from a [BuildContext].
  static M3ScreenSize getScreenSizeFromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return getScreenSize(width);
  }

  static bool isCompact(BuildContext context) =>
      getScreenSizeFromContext(context) == M3ScreenSize.compact;

  static bool isMedium(BuildContext context) =>
      getScreenSizeFromContext(context) == M3ScreenSize.medium;

  static bool isExpanded(BuildContext context) =>
      getScreenSizeFromContext(context) == M3ScreenSize.expanded;

  static bool isLarge(BuildContext context) =>
      getScreenSizeFromContext(context) == M3ScreenSize.large;

  static bool isExtraLarge(BuildContext context) =>
      getScreenSizeFromContext(context) == M3ScreenSize.extraLarge;

  /// Gets the maximum content width for the given [screenSize].
  static double getMaxContentWidth(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
        return double.infinity;
      case M3ScreenSize.medium:
        return M3Breakpoints.expanded;
      case M3ScreenSize.expanded:
        return M3Breakpoints.large;
      case M3ScreenSize.large:
        return M3Breakpoints.extraLarge;
      case M3ScreenSize.extraLarge:
        return 1920;
    }
  }

  /// Gets the recommended number of columns for the given [screenSize].
  static int getRecommendedColumns(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
        return 4;
      case M3ScreenSize.medium:
        return 8;
      case M3ScreenSize.expanded:
      case M3ScreenSize.large:
      case M3ScreenSize.extraLarge:
        return 12;
    }
  }

  /// Gets the recommended gutter width for the given [screenSize].
  static double getGutterWidth(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
        return 16;
      case M3ScreenSize.medium:
      case M3ScreenSize.expanded:
      case M3ScreenSize.large:
      case M3ScreenSize.extraLarge:
        return 24;
    }
  }

  /// Gets the recommended margin for the given [screenSize].
  static double getMargin(M3ScreenSize screenSize) {
    return switch (screenSize) {
      M3ScreenSize.compact => M3Margins.compactScreen,
      M3ScreenSize.medium => M3Margins.mediumScreen,
      M3ScreenSize.expanded => M3Margins.expandedScreen,
      M3ScreenSize.large => M3Margins.largeScreen,
      M3ScreenSize.extraLarge => M3Margins.extraLargeScreen,
    };
  }

  /// Gets the recommended body width for the given [screenSize].
  static double? getBodyWidth(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
      case M3ScreenSize.medium:
        return null;
      case M3ScreenSize.expanded:
        return 840;
      case M3ScreenSize.large:
      case M3ScreenSize.extraLarge:
        return 1040;
    }
  }

  /// Gets the recommended pane width for the given [screenSize].
  static double getPaneWidth(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
        return double.infinity;
      case M3ScreenSize.medium:
      case M3ScreenSize.expanded:
      case M3ScreenSize.large:
      case M3ScreenSize.extraLarge:
        return 360;
    }
  }
}

/// Window size classes for responsive design.
///
/// These classes represent the canonical Material Design 3 window size
/// classifications used for building adaptive layouts.
enum M3ScreenSize {
  /// 0dp to 599dp - Phones in portrait
  compact,

  /// 600dp to 839dp - Phones in landscape, small tablets
  medium,

  /// 840dp to 1199dp - Large tablets, foldables
  expanded,

  /// 1200dp to 1599dp - Desktop screens
  large,

  /// 1600dp and up - Large monitors
  extraLarge;

  bool isAtLeast(M3ScreenSize other) => index >= other.index;

  bool isAtMost(M3ScreenSize other) => index <= other.index;

  bool get isMobile =>
      this == M3ScreenSize.compact || this == M3ScreenSize.medium;

  bool get isTablet => this == M3ScreenSize.expanded;

  bool get isDesktop =>
      this == M3ScreenSize.large || this == M3ScreenSize.extraLarge;

  String get displayName {
    switch (this) {
      case M3ScreenSize.compact:
        return 'Compact';
      case M3ScreenSize.medium:
        return 'Medium';
      case M3ScreenSize.expanded:
        return 'Expanded';
      case M3ScreenSize.large:
        return 'Large';
      case M3ScreenSize.extraLarge:
        return 'Extra Large';
    }
  }

  String get deviceDescription {
    switch (this) {
      case M3ScreenSize.compact:
        return 'Phone (Portrait)';
      case M3ScreenSize.medium:
        return 'Phone (Landscape) / Small Tablet';
      case M3ScreenSize.expanded:
        return 'Large Tablet / Foldable';
      case M3ScreenSize.large:
        return 'Desktop / Laptop';
      case M3ScreenSize.extraLarge:
        return 'Large Monitor / Ultra-wide Display';
    }
  }
}
