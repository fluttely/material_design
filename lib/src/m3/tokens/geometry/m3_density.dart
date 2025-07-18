// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Defines the density levels for UI components, affecting their size and spacing.
///
/// Density can be adjusted to suit different input methods or information density
/// requirements. For example, a 'compact' density might be used for apps
/// controlled by a mouse and keyboard, while 'comfortable' is better suited for
/// touch input.
///
/// See: https://m3.material.io/foundations/layout/applying-layout/density
enum M3Density {
  /// Default density for touch-based interfaces.
  comfortable,

  /// A more compact density for mouse and keyboard-centric interfaces.
  /// This typically involves reducing the size and spacing of components.
  compact,
}
