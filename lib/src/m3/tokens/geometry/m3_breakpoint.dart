import 'package:flutter/material.dart';
// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Defines the canonical Material Design 3 breakpoints, known as "window size classes".
///
/// These values are not arbitrary; they are based on extensive research by Google
/// on the most common screen sizes across the device ecosystem. They function
/// as lower bounds that categorize the available UI space, allowing layouts
/// to adapt consistently and ergonomically.
///
/// The goal is to ensure the application provides the best possible user experience,
/// whether on a small phone or an ultra-wide monitor.
///
/// See the official documentation: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
@immutable
abstract class M3Breakpoint {
  /// **Compact** (0dp to 599dp): The smallest breakpoint, representing the design baseline.
  ///
  /// **Typical Device**: Phones in portrait mode 📱.
  /// **Common Use Case**: Interfaces focused on a single column, using a bottom navigation bar or a drawer.
  static const double compact = 0;

  /// **Medium** (600dp to 839dp): The first adaptation point for larger screens.
  ///
  /// **Typical Device**: Phones in landscape mode and small tablets (like iPad Minis) ↔️.
  /// **Common Use Case**: Allows for introducing secondary panes, such as side-by-side list/detail views,
  /// or using navigation rails instead of bottom navigation bars.
  static const double medium = 600;

  /// **Expanded** (840dp to 1199dp): The breakpoint for screens that offer more horizontal space.
  ///
  /// **Typical Device**: Larger tablets in landscape mode (like iPad Pros) and foldable notebooks 💻.
  /// **Common Use Case**: Ideal for more complex layouts with multiple panes, or for displaying
  /// content that benefits from more space, such as dashboards and editing tools.
  static const double expanded = 840;

  /// **Large** (1200dp to 1599dp): Optimized for the desktop experience.
  ///
  /// **Typical Device**: Standard notebook and desktop screens 🖥️.
  /// **Common Use Case**: Layouts that can display fixed panels (like a persistently visible navigation drawer)
  /// without compromising the main content area. The space allows for information-rich interfaces.
  static const double large = 1200;

  /// **Extra-large** (1600dp and up): For the largest available screen sizes.
  ///
  /// **Typical Device**: Large and ultra-wide monitors 🖥️✨.
  /// **Common Use Case**: Allows for fully expansive layouts with multiple content columns,
  /// visible auxiliary tools, and maximum use of horizontal space.
  static const double extraLarge = 1600;

  // --- Utility Methods ---

  /// Gets the current window size class based on screen width.
  static WindowSizeClass getWindowSizeClass(double width) {
    if (width < medium) {
      return WindowSizeClass.compact;
    } else if (width < expanded) {
      return WindowSizeClass.medium;
    } else if (width < large) {
      return WindowSizeClass.expanded;
    } else if (width < extraLarge) {
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
        return expanded;
      case WindowSizeClass.expanded:
        return large;
      case WindowSizeClass.large:
        return extraLarge;
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
