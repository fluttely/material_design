import 'package:flutter/foundation.dart';

/// Provides a comprehensive set of pre-defined, Material 3-compliant
/// spacing tokens based on a 4dp grid.
///
/// This class turns the M3 guideline of using 4dp increments for padding
/// into a reusable set of named constants. Using these tokens ensures
/// consistent and rhythmic spacing throughout the UI.
///
/// Reference: https://m3.material.io/foundations/layout/understanding-layout/spacing
@immutable
abstract class M3Spacing {
  /// A value of 0, representing no spacing.
  static const double none = 0;

  /// A value representing infinite spacing.
  static const double infinity = double.infinity;

  // --- Base Spacing Scale (4dp increments) ---
  // Ideal for padding within components and small layout gaps.

  /// 4dp spacing token.
  static const double space4 = 4;

  /// 8dp spacing token.
  static const double space8 = 8;

  /// 12dp spacing token.
  static const double space12 = 12;

  /// 16dp spacing token.
  static const double space16 = 16;

  /// 20dp spacing token.
  static const double space20 = 20;

  /// 24dp spacing token.
  static const double space24 = 24;

  /// 28dp spacing token.
  static const double space28 = 28;

  /// 32dp spacing token.
  static const double space32 = 32;

  /// 36dp spacing token.
  static const double space36 = 36;

  /// 40dp spacing token.
  static const double space40 = 40;

  /// 48dp spacing token.
  static const double space48 = 48;

  /// 56dp spacing token.
  static const double space56 = 56;

  /// 64dp spacing token.
  static const double space64 = 64;

  // --- Extended Spacing Scale ---
  // For larger layout spacing needs.

  /// 72dp spacing token.
  static const double space72 = 72;

  /// 80dp spacing token.
  static const double space80 = 80;

  /// 96dp spacing token.
  static const double space96 = 96;

  /// 128dp spacing token.
  static const double space128 = 128;
}

/// Provides semantic margin tokens for screen and layout containers.
///
/// These tokens represent the space between the edge of a window or screen
/// and the content within it.
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/pane-layouts
@immutable
abstract class M3Margin {
  /// https://m3.material.io/foundations/layout/applying-layout/compact
  /// The default margin for compact screen layouts (16dp).
  static const double compactScreen = 16.0;

  /// https://m3.material.io/foundations/layout/applying-layout/medium
  /// The recommended margin for medium screen layouts (24dp).
  static const double mediumScreen = 24.0;

  /// https://m3.material.io/foundations/layout/applying-layout/expanded
  /// The recommended margin for expanded layouts (24dp).
  static const double expandedScreen = 24.0;

  /// https://m3.material.io/foundations/layout/applying-layout/large-extra-large
  /// The recommended margin for large screen layouts (24dp).
  static const double largeScreen = 24.0;

  /// https://m3.material.io/foundations/layout/applying-layout/large-extra-large
  /// The recommended margin for extra-large screen layouts (24dp).
  static const double extraLargeScreen = 24.0;
}

/// Provides tokens for spacers used between layout panes.
///
/// Spacers are used to separate distinct regions of content, such as in a
/// split-view layout.
///
/// Reference: https://m3.material.io/foundations/layout/understanding-layout/spacing
@immutable
abstract class M3Spacer {
  /// The standard width of a spacer between two content panes (24dp).
  static const double pane = 24.0;
}
