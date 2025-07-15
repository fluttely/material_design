// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Defines the layout breakpoints for Material Design 3's window size classes.
///
/// These values represent the lower bound of each window size class. Layouts
/// should adapt based on these breakpoints to provide a responsive user
/// experience across different screen sizes.
///
/// See: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
abstract final class MaterialBreakpoint {
  /// The breakpoint for the 'Compact' window size class (0dp to 599dp).
  /// This is the default smallest size.
  static const double compact = 0;

  /// The breakpoint for the 'Medium' window size class (starts at 600dp).
  static const double medium = 600;

  /// The breakpoint for the 'Expanded' window size class (starts at 840dp).
  static const double expanded = 840;

  /// The breakpoint for the 'Large' window size class (starts at 1200dp).
  static const double large = 1200;

  /// The breakpoint for the 'Extra-large' window size class (starts at 1600dp).
  static const double extraLarge = 1600;
}
