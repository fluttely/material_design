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
abstract final class MaterialBreakpoint {
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
}
