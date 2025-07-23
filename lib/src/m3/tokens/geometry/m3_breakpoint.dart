import 'package:flutter/material.dart';
// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Material Design 3 breakpoint tokens for responsive window size classes.
///
/// This enum defines the canonical Material Design 3 breakpoints, known as
/// "window size classes". These values are based on extensive research by Google
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
/// final sizeClass = M3BreakpointToken.getWindowSizeClass(screenWidth);
/// final isCompact = M3BreakpointToken.isCompact(context);
/// ```
///
/// ## Breakpoint Guidelines
/// 
/// - **Compact (0-599dp)**: Phones in portrait - single column layouts
/// - **Medium (600-839dp)**: Phones in landscape, small tablets - dual pane capable
/// - **Expanded (840-1199dp)**: Large tablets, foldables - complex multi-pane layouts
/// - **Large (1200-1599dp)**: Desktop screens - rich information architecture
/// - **Extra Large (1600dp+)**: Large monitors - expansive multi-column layouts
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum M3BreakpointToken {
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
  compact(0),

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
  medium(600),

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
  expanded(840),

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
  large(1200),

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
  extraLarge(1600);

  /// Creates a breakpoint token with the specified value.
  const M3BreakpointToken(this.value);

  /// The breakpoint value in density-independent pixels (dp).
  final double value;

  // --- Utility Methods ---

  /// Gets the current window size class based on screen width.
  static WindowSizeClass getWindowSizeClass(double width) {
    if (width < M3BreakpointToken.medium.value) {
      return WindowSizeClass.compact;
    } else if (width < M3BreakpointToken.expanded.value) {
      return WindowSizeClass.medium;
    } else if (width < M3BreakpointToken.large.value) {
      return WindowSizeClass.expanded;
    } else if (width < M3BreakpointToken.extraLarge.value) {
      return WindowSizeClass.large;
    } else {
      return WindowSizeClass.extraLarge;
    }
  }

  /// Gets the window size class from a BuildContext.
  static WindowSizeClass getWindowSizeClassFromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return getWindowSizeClass(width);
  }

  /// Checks if the current screen is compact.
  static bool isCompact(BuildContext context) {
    return getWindowSizeClassFromContext(context) == WindowSizeClass.compact;
  }

  /// Checks if the current screen is medium.
  static bool isMedium(BuildContext context) {
    return getWindowSizeClassFromContext(context) == WindowSizeClass.medium;
  }

  /// Checks if the current screen is expanded.
  static bool isExpanded(BuildContext context) {
    return getWindowSizeClassFromContext(context) == WindowSizeClass.expanded;
  }

  /// Checks if the current screen is large.
  static bool isLarge(BuildContext context) {
    return getWindowSizeClassFromContext(context) == WindowSizeClass.large;
  }

  /// Checks if the current screen is extra large.
  static bool isExtraLarge(BuildContext context) {
    return getWindowSizeClassFromContext(context) == WindowSizeClass.extraLarge;
  }

  /// Gets the maximum content width for the current breakpoint.
  static double getMaxContentWidth(WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case WindowSizeClass.compact:
        return double.infinity; // Use full width
      case WindowSizeClass.medium:
        return M3BreakpointToken.expanded.value;
      case WindowSizeClass.expanded:
        return M3BreakpointToken.large.value;
      case WindowSizeClass.large:
        return M3BreakpointToken.extraLarge.value;
      case WindowSizeClass.extraLarge:
        return 1920; // Reasonable max for readability
    }
  }
}

/// Window size classes for responsive design.
enum WindowSizeClass {
  /// 0dp to 599dp - Phones in portrait
  compact,

  /// 600dp to 839dp - Phones in landscape, small tablets
  medium,

  /// 840dp to 1199dp - Large tablets, foldables
  expanded,

  /// 1200dp to 1599dp - Desktop screens
  large,

  /// 1600dp and up - Large monitors
  extraLarge,
}
