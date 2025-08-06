part of '../../../../material_design.dart';

abstract final class M3Breakpoints {
  /// Compact breakpoint (0dp to 599dp).
  ///
  /// The smallest breakpoint representing the design baseline for constrained
  /// interfaces. This breakpoint optimizes for single-column layouts and
  /// touch-first interaction patterns.
  ///
  /// **Typical devices**: Phones in portrait mode 📱
  ///
  /// **Design characteristics**:
  /// - Single-column content layout
  /// - Bottom navigation or navigation drawer
  /// - Touch-optimized component sizing
  /// - Minimal whitespace for content density
  /// - Stacked interface elements
  ///
  /// **Common use cases**:
  /// - Mobile-first responsive designs
  /// - Single-focus task interfaces
  /// - Touch-optimized interactions
  /// - Content-dense layouts
  static const double compact = 0;

  /// Medium breakpoint (600dp to 839dp).
  ///
  /// The first adaptation point for larger screens, enabling enhanced layouts
  /// with secondary content areas and improved navigation patterns.
  ///
  /// **Typical devices**: Phones in landscape, small tablets (iPad Mini) ↔️
  ///
  /// **Design characteristics**:
  /// - Dual-pane layouts possible
  /// - Navigation rails over bottom navigation
  /// - Side-by-side content arrangements
  /// - Enhanced component spacing
  /// - Improved information density
  ///
  /// **Common use cases**:
  /// - Master-detail interfaces
  /// - Side-by-side list/detail views
  /// - Enhanced navigation patterns
  /// - Improved content browsing
  static const double medium = 600;

  /// Expanded breakpoint (840dp to 1199dp).
  ///
  /// Designed for screens with substantial horizontal space, enabling complex
  /// multi-pane layouts and advanced interface patterns.
  ///
  /// **Typical devices**: Large tablets in landscape (iPad Pro), foldables 💻
  ///
  /// **Design characteristics**:
  /// - Multi-pane layout capabilities
  /// - Complex navigation structures
  /// - Rich content presentation
  /// - Advanced interaction patterns
  /// - Substantial whitespace utilization
  ///
  /// **Common use cases**:
  /// - Dashboard interfaces
  /// - Content editing tools
  /// - Multi-column layouts
  /// - Complex data visualization
  static const double expanded = 840;

  /// Large breakpoint (1200dp to 1599dp).
  ///
  /// Optimized for desktop experiences with persistent UI elements and
  /// information-rich interfaces that maximize available screen space.
  ///
  /// **Typical devices**: Desktop monitors, laptops 🖥️
  ///
  /// **Design characteristics**:
  /// - Persistent navigation panels
  /// - Fixed sidebar layouts
  /// - Rich information architecture
  /// - Desktop interaction patterns
  /// - Multiple simultaneous content areas
  ///
  /// **Common use cases**:
  /// - Desktop applications
  /// - Professional tools and dashboards
  /// - Content management systems
  /// - Multi-tasking interfaces
  static const double large = 1200;

  /// Extra large breakpoint (1600dp and above).
  ///
  /// For the largest screens, enabling fully expansive layouts with maximum
  /// horizontal space utilization and advanced multi-column arrangements.
  ///
  /// **Typical devices**: Large monitors, ultra-wide displays 🖥️✨
  ///
  /// **Design characteristics**:
  /// - Expansive multi-column layouts
  /// - Maximum information density
  /// - Advanced spatial organization
  /// - Ultra-wide optimizations
  /// - Specialized large-screen patterns
  ///
  /// **Common use cases**:
  /// - Professional workspaces
  /// - Multi-monitor setups
  /// - Data-intensive applications
  /// - Creative and design tools
  static const double extraLarge = 1600;
}

/// Material Design 3 breakpoint tokens for responsive window size classes.
///
/// This enum defines the canonical Material Design 3 breakpoints, known as
/// "window size classes". These values are based on extensive research by
/// Google
/// on the most common screen sizes across the device ecosystem. They function
/// as lower bounds that categorize available UI space, enabling layouts to
/// adapt consistently and ergonomically across different devices.
///
/// The breakpoint system ensures applications provide optimal user experience
/// from small phones to ultra-wide monitors, with each breakpoint representing
/// a significant shift in available space and interaction patterns.
///
/// ## Usage
///
/// ```dart
/// // Get medium breakpoint value
/// double breakpoint = M3BreakpointToken.medium.value; // 600.0
///
/// // Use in responsive layouts
/// Widget buildResponsiveLayout(BuildContext context) {
///   final width = MediaQuery.of(context).size.width;
///
///   if (width >= M3BreakpointToken.large.value) {
///     return DesktopLayout();
///   } else if (width >= M3BreakpointToken.medium.value) {
///     return TabletLayout();
///   } else {
///     return MobileLayout();
///   }
/// }
///
/// // Use utility methods
/// final screenSize = M3BreakpointToken.getScreenSize(screenWidth);
/// final isCompact = M3BreakpointToken.isCompact(context);
/// ```
///
/// ## Breakpoint Guidelines
///
/// - **Compact (0-599dp)**: Phones in portrait - single column layouts
/// - **Medium (600-839dp)**: Phones in landscape, small tablets - dual pane
///   capable
/// - **Expanded (840-1199dp)**: Large tablets, foldables - complex multi-pane
///   layouts
/// - **Large (1200-1599dp)**: Desktop screens - rich information architecture
/// - **Extra Large (1600dp+)**: Large monitors - expansive multi-column layouts
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum M3BreakpointToken implements IM3Token<double> {
  /// Compact breakpoint (0dp to 599dp).
  ///
  /// The smallest breakpoint representing the design baseline for constrained
  /// interfaces. This breakpoint optimizes for single-column layouts and
  /// touch-first interaction patterns.
  ///
  /// **Typical devices**: Phones in portrait mode 📱
  ///
  /// **Design characteristics**:
  /// - Single-column content layout
  /// - Bottom navigation or navigation drawer
  /// - Touch-optimized component sizing
  /// - Minimal whitespace for content density
  /// - Stacked interface elements
  ///
  /// **Common use cases**:
  /// - Mobile-first responsive designs
  /// - Single-focus task interfaces
  /// - Touch-optimized interactions
  /// - Content-dense layouts
  compact(M3Breakpoints.compact),

  /// Medium breakpoint (600dp to 839dp).
  ///
  /// The first adaptation point for larger screens, enabling enhanced layouts
  /// with secondary content areas and improved navigation patterns.
  ///
  /// **Typical devices**: Phones in landscape, small tablets (iPad Mini) ↔️
  ///
  /// **Design characteristics**:
  /// - Dual-pane layouts possible
  /// - Navigation rails over bottom navigation
  /// - Side-by-side content arrangements
  /// - Enhanced component spacing
  /// - Improved information density
  ///
  /// **Common use cases**:
  /// - Master-detail interfaces
  /// - Side-by-side list/detail views
  /// - Enhanced navigation patterns
  /// - Improved content browsing
  medium(M3Breakpoints.medium),

  /// Expanded breakpoint (840dp to 1199dp).
  ///
  /// Designed for screens with substantial horizontal space, enabling complex
  /// multi-pane layouts and advanced interface patterns.
  ///
  /// **Typical devices**: Large tablets in landscape (iPad Pro), foldables 💻
  ///
  /// **Design characteristics**:
  /// - Multi-pane layout capabilities
  /// - Complex navigation structures
  /// - Rich content presentation
  /// - Advanced interaction patterns
  /// - Substantial whitespace utilization
  ///
  /// **Common use cases**:
  /// - Dashboard interfaces
  /// - Content editing tools
  /// - Multi-column layouts
  /// - Complex data visualization
  expanded(M3Breakpoints.expanded),

  /// Large breakpoint (1200dp to 1599dp).
  ///
  /// Optimized for desktop experiences with persistent UI elements and
  /// information-rich interfaces that maximize available screen space.
  ///
  /// **Typical devices**: Desktop monitors, laptops 🖥️
  ///
  /// **Design characteristics**:
  /// - Persistent navigation panels
  /// - Fixed sidebar layouts
  /// - Rich information architecture
  /// - Desktop interaction patterns
  /// - Multiple simultaneous content areas
  ///
  /// **Common use cases**:
  /// - Desktop applications
  /// - Professional tools and dashboards
  /// - Content management systems
  /// - Multi-tasking interfaces
  large(M3Breakpoints.large),

  /// Extra large breakpoint (1600dp and above).
  ///
  /// For the largest screens, enabling fully expansive layouts with maximum
  /// horizontal space utilization and advanced multi-column arrangements.
  ///
  /// **Typical devices**: Large monitors, ultra-wide displays 🖥️✨
  ///
  /// **Design characteristics**:
  /// - Expansive multi-column layouts
  /// - Maximum information density
  /// - Advanced spatial organization
  /// - Ultra-wide optimizations
  /// - Specialized large-screen patterns
  ///
  /// **Common use cases**:
  /// - Professional workspaces
  /// - Multi-monitor setups
  /// - Data-intensive applications
  /// - Creative and design tools
  extraLarge(M3Breakpoints.extraLarge);

  /// Creates a breakpoint token with the specified value.
  const M3BreakpointToken(this.value);

  /// The breakpoint value in density-independent pixels (dp).
  @override
  final double value;

  // --- Utility Methods ---

  /// Gets the current window size class based on screen width.
  static M3ScreenSize getScreenSize(double width) {
    if (width < M3BreakpointToken.medium.value) {
      return M3ScreenSize.compact;
    } else if (width < M3BreakpointToken.expanded.value) {
      return M3ScreenSize.medium;
    } else if (width < M3BreakpointToken.large.value) {
      return M3ScreenSize.expanded;
    } else if (width < M3BreakpointToken.extraLarge.value) {
      return M3ScreenSize.large;
    } else {
      return M3ScreenSize.extraLarge;
    }
  }

  /// Gets the window size class from a BuildContext.
  static M3ScreenSize getScreenSizeFromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return getScreenSize(width);
  }

  /// Checks if the current screen is compact.
  static bool isCompact(BuildContext context) {
    return getScreenSizeFromContext(context) == M3ScreenSize.compact;
  }

  /// Checks if the current screen is medium.
  static bool isMedium(BuildContext context) {
    return getScreenSizeFromContext(context) == M3ScreenSize.medium;
  }

  /// Checks if the current screen is expanded.
  static bool isExpanded(BuildContext context) {
    return getScreenSizeFromContext(context) == M3ScreenSize.expanded;
  }

  /// Checks if the current screen is large.
  static bool isLarge(BuildContext context) {
    return getScreenSizeFromContext(context) == M3ScreenSize.large;
  }

  /// Checks if the current screen is extra large.
  static bool isExtraLarge(BuildContext context) {
    return getScreenSizeFromContext(context) == M3ScreenSize.extraLarge;
  }

  /// Gets the maximum content width for the current breakpoint.
  static double getMaxContentWidth(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
        return double.infinity; // Use full width
      case M3ScreenSize.medium:
        return M3BreakpointToken.expanded.value;
      case M3ScreenSize.expanded:
        return M3BreakpointToken.large.value;
      case M3ScreenSize.large:
        return M3BreakpointToken.extraLarge.value;
      case M3ScreenSize.extraLarge:
        return 1920; // Reasonable max for readability
    }
  }

  /// Gets the recommended number of columns for the current breakpoint.
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

  /// Gets the recommended gutter width for the current breakpoint.
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

  /// Gets the recommended margin for the current breakpoint.
  static M3MarginToken getMargin(M3ScreenSize screenSize) {
    return switch (screenSize) {
      M3ScreenSize.compact => M3MarginToken.compactScreen,
      M3ScreenSize.medium => M3MarginToken.mediumScreen,
      M3ScreenSize.expanded => M3MarginToken.expandedScreen,
      M3ScreenSize.large => M3MarginToken.largeScreen,
      M3ScreenSize.extraLarge => M3MarginToken.extraLargeScreen,
    };
  }

  /// Gets the recommended body width for the current breakpoint.
  static double? getBodyWidth(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
      case M3ScreenSize.medium:
        return null; // Full width
      case M3ScreenSize.expanded:
        return 840;
      case M3ScreenSize.large:
      case M3ScreenSize.extraLarge:
        return 1040;
    }
  }

  /// Gets the recommended pane width for the current breakpoint.
  static double getPaneWidth(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
        return double.infinity; // Full width
      case M3ScreenSize.medium:
        return 360;
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

  /// Returns true if this size class is at least as large as the given size
  /// class.
  bool isAtLeast(M3ScreenSize other) {
    return index >= other.index;
  }

  /// Returns true if this size class is at most as large as the given size
  /// class.
  bool isAtMost(M3ScreenSize other) {
    return index <= other.index;
  }

  /// Returns true if this is a mobile size class (compact or medium).
  bool get isMobile =>
      this == M3ScreenSize.compact || this == M3ScreenSize.medium;

  /// Returns true if this is a tablet size class (expanded).
  bool get isTablet => this == M3ScreenSize.expanded;

  /// Returns true if this is a desktop size class (large or extraLarge).
  bool get isDesktop =>
      this == M3ScreenSize.large || this == M3ScreenSize.extraLarge;

  /// Returns the display name for this size class.
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

  /// Returns the typical device description for this size class.
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
