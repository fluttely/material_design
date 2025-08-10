/// Material Design 3 adaptive design system.
///
/// This file implements the Material Design 3 adaptive design specifications
/// including window size classes, canonical layouts, and responsive utilities.
///
/// The adaptive system provides:
/// - Window size classes (compact, medium, expanded, large, extra-large)
/// - Canonical layout patterns (list-detail, supporting pane, feed)
/// - Responsive grid system with adaptive margins and gutters
/// - Adaptive configuration for different screen sizes
/// - Utilities for responsive design calculations
///
/// Based on Material Design 3 specifications:
/// - Compact: 0-599dp width (Phone in portrait)
/// - Medium: 600-839dp width (Tablet in portrait, Foldable in portrait unfolded)
/// - Expanded: 840-1199dp width (Phone in landscape, Tablet in landscape,
///   Foldable in landscape unfolded, Desktop)
/// - Large: 1200-1599dp width (Desktop)
/// - Extra Large: 1600dp+ width (Desktop, Ultra-wide monitors)
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
library;

import 'package:flutter/foundation.dart';

/// Material Design 3 window size classes for adaptive layouts.
///
/// Window size classes provide a consistent way to design for different
/// screen sizes and orientations. Each class corresponds to a specific
/// breakpoint range in density-independent pixels (dp).
///
/// These breakpoints are based on the official Material Design 3 guidelines
/// and help create responsive layouts that work across all device types.
///
/// Example:
/// ```dart
/// final sizeClass = WindowSizeClass.fromWidth(MediaQuery.of(context).size.width);
/// switch (sizeClass) {
///   case WindowSizeClass.compact:
///     // Build phone layout
///     break;
///   case WindowSizeClass.medium:
///     // Build tablet layout
///     break;
///   case WindowSizeClass.expanded:
///     // Build small desktop layout
///     break;
///   case WindowSizeClass.large:
///     // Build desktop layout
///     break;
///   case WindowSizeClass.extraLarge:
///     // Build ultra-wide layout
///     break;
/// }
/// ```
enum WindowSizeClass {
  /// Compact window size class.
  ///
  /// Width: 0-599dp
  /// Typical devices: Phones in portrait orientation
  /// Columns: 4
  /// Margins: 16dp
  /// Recommended: Single pane layouts, bottom navigation
  compact(
    minWidth: 0,
    maxWidth: 599,
    columns: 4,
    margin: 16,
  ),

  /// Medium window size class.
  ///
  /// Width: 600-839dp
  /// Typical devices: Tablets in portrait, foldables, large phones in landscape
  /// Columns: 8-12
  /// Margins: 24dp
  /// Recommended: Two pane layouts, navigation rail
  medium(
    minWidth: 600,
    maxWidth: 839,
    columns: 12,
    margin: 24,
  ),

  /// Expanded window size class.
  ///
  /// Width: 840-1199dp
  /// Typical devices: Tablets in landscape, small desktops
  /// Columns: 12
  /// Margins: 24dp
  /// Recommended: Two pane layouts with supporting panel, navigation rail
  expanded(
    minWidth: 840,
    maxWidth: 1199,
    columns: 12,
    margin: 24,
  ),

  /// Large window size class.
  ///
  /// Width: 1200-1599dp
  /// Typical devices: Desktops
  /// Columns: 12
  /// Margins: 24dp minimum, can increase for better readability
  /// Recommended: Multi-pane layouts, permanent navigation drawer
  large(
    minWidth: 1200,
    maxWidth: 1599,
    columns: 12,
    margin: 24,
  ),

  /// Extra Large window size class.
  ///
  /// Width: 1600dp+
  /// Typical devices: Large desktops, ultra-wide monitors
  /// Columns: 12
  /// Margins: 24dp minimum, often larger for content centering
  /// Recommended: Multi-pane layouts with maximum content width constraints
  extraLarge(
    minWidth: 1600,
    maxWidth: double.infinity,
    columns: 12,
    margin: 24,
  );

  const WindowSizeClass({
    required this.minWidth,
    required this.maxWidth,
    required this.columns,
    required this.margin,
  });

  /// The minimum width for this size class in dp.
  final double minWidth;

  /// The maximum width for this size class in dp.
  final double maxWidth;

  /// The number of columns in the grid system for this size class.
  final int columns;

  /// The margin (outer spacing) for this size class in dp.
  final double margin;

  /// The gutter (spacing between columns) for this size class in dp.
  /// Material Design 3 typically uses consistent gutters across breakpoints.
  double get gutter {
    switch (this) {
      case WindowSizeClass.compact:
        return 16;
      case WindowSizeClass.medium:
      case WindowSizeClass.expanded:
      case WindowSizeClass.large:
      case WindowSizeClass.extraLarge:
        return 24;
    }
  }

  /// Determines the window size class from the given width.
  ///
  /// Returns the appropriate [WindowSizeClass] based on the provided width
  /// in density-independent pixels (dp).
  ///
  /// Example:
  /// ```dart
  /// final sizeClass = WindowSizeClass.fromWidth(1300.0);
  /// print(sizeClass); // WindowSizeClass.large
  /// ```
  static WindowSizeClass fromWidth(double width) {
    if (width < 600) return WindowSizeClass.compact;
    if (width < 840) return WindowSizeClass.medium;
    if (width < 1200) return WindowSizeClass.expanded;
    if (width < 1600) return WindowSizeClass.large;
    return WindowSizeClass.extraLarge;
  }

  /// Determines if the given width falls within this size class range.
  bool containsWidth(double width) {
    return width >= minWidth &&
        (maxWidth == double.infinity ? true : width <= maxWidth);
  }

  /// Returns true if this is the compact size class.
  bool get isCompact => this == WindowSizeClass.compact;

  /// Returns true if this is the medium size class.
  bool get isMedium => this == WindowSizeClass.medium;

  /// Returns true if this is the expanded size class.
  bool get isExpanded => this == WindowSizeClass.expanded;

  /// Returns true if this is the large size class.
  bool get isLarge => this == WindowSizeClass.large;

  /// Returns true if this is the extra large size class.
  bool get isExtraLarge => this == WindowSizeClass.extraLarge;

  /// Returns a human-readable description of the size class.
  String get description {
    switch (this) {
      case WindowSizeClass.compact:
        return 'Compact (0-599dp): Phones in portrait';
      case WindowSizeClass.medium:
        return 'Medium (600-839dp): Tablets, foldables';
      case WindowSizeClass.expanded:
        return 'Expanded (840-1199dp): Large tablets, small desktops';
      case WindowSizeClass.large:
        return 'Large (1200-1599dp): Desktops';
      case WindowSizeClass.extraLarge:
        return 'Extra Large (1600dp+): Large desktops, ultra-wide monitors';
    }
  }
}

/// Material Design 3 window height size classes.
///
/// Height classes are secondary to width classes but important for
/// certain scenarios like landscape phones or foldables.
enum WindowHeightSizeClass {
  /// Compact height: < 480dp
  /// Typical: Phones in landscape
  compact(minHeight: 0, maxHeight: 479),

  /// Medium height: 480-899dp
  /// Typical: Tablets, phones in portrait
  medium(minHeight: 480, maxHeight: 899),

  /// Expanded height: ≥ 900dp
  /// Typical: Desktops, tablets in portrait
  expanded(minHeight: 900, maxHeight: double.infinity);

  const WindowHeightSizeClass({
    required this.minHeight,
    required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  /// Determines the height size class from the given height.
  static WindowHeightSizeClass fromHeight(double height) {
    if (height < 480) return WindowHeightSizeClass.compact;
    if (height < 900) return WindowHeightSizeClass.medium;
    return WindowHeightSizeClass.expanded;
  }

  bool get isCompact => this == WindowHeightSizeClass.compact;
  bool get isMedium => this == WindowHeightSizeClass.medium;
  bool get isExpanded => this == WindowHeightSizeClass.expanded;
}

/// Material Design 3 canonical layout patterns.
///
/// Canonical layouts provide standard patterns for organizing content
/// across different window size classes. Each pattern is optimized for
/// specific use cases and screen configurations.
///
/// Reference: https://m3.material.io/foundations/adaptive-design/canonical-layouts
///
/// Example:
/// ```dart
/// final config = AdaptiveConfig.fromDimensions(width: 800, height: 600);
/// final layout = config.recommendedLayout;
/// switch (layout) {
///   case CanonicalLayout.singlePane:
///     // Build single pane layout
///     break;
///   case CanonicalLayout.listDetail:
///     // Build list-detail layout
///     break;
///   case CanonicalLayout.supportingPane:
///     // Build supporting pane layout
///     break;
///   case CanonicalLayout.feed:
///     // Build feed layout
///     break;
/// }
/// ```
enum CanonicalLayout {
  /// Single pane layout.
  ///
  /// Recommended for: Compact windows
  /// Description: Single primary content area
  /// Use cases: Phone interfaces, focused content
  singlePane,

  /// List-detail layout.
  ///
  /// Recommended for: Medium and larger windows
  /// Description: List on the left, detail on the right
  /// Use cases: Email clients, file managers, settings
  listDetail,

  /// Supporting pane layout.
  ///
  /// Recommended for: Expanded, Large, and Extra Large windows
  /// Description: Main content with supporting secondary content
  /// Use cases: Productivity apps, complex workflows, document editors
  supportingPane,

  /// Feed layout.
  ///
  /// Recommended for: All window sizes (adaptive grid)
  /// Description: Grid of cards or items that adapts column count
  /// Use cases: Photo galleries, news feeds, dashboards
  feed;

  /// Returns true if this layout is recommended for the given size class.
  bool isRecommendedFor(WindowSizeClass sizeClass) {
    switch (this) {
      case CanonicalLayout.singlePane:
        return sizeClass.isCompact;
      case CanonicalLayout.listDetail:
        return sizeClass.isMedium || sizeClass.isExpanded;
      case CanonicalLayout.supportingPane:
        return sizeClass.isExpanded ||
            sizeClass.isLarge ||
            sizeClass.isExtraLarge;
      case CanonicalLayout.feed:
        return true; // Adaptive for all sizes
    }
  }

  /// Returns the primary recommended layout for the given size class.
  static CanonicalLayout recommendedFor(WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case WindowSizeClass.compact:
        return CanonicalLayout.singlePane;
      case WindowSizeClass.medium:
        return CanonicalLayout.listDetail;
      case WindowSizeClass.expanded:
      case WindowSizeClass.large:
      case WindowSizeClass.extraLarge:
        return CanonicalLayout.supportingPane;
    }
  }

  /// Returns a human-readable description of the layout.
  String get description {
    switch (this) {
      case CanonicalLayout.singlePane:
        return 'Single pane: One primary content area';
      case CanonicalLayout.listDetail:
        return 'List-detail: List alongside detail view';
      case CanonicalLayout.supportingPane:
        return 'Supporting pane: Main content with secondary pane';
      case CanonicalLayout.feed:
        return 'Feed: Adaptive grid of items';
    }
  }
}

/// Navigation type recommendations based on window size class.
enum NavigationType {
  /// Bottom navigation bar (3-5 destinations).
  /// Recommended for: Compact
  bottomNavigation,

  /// Navigation rail (3-7 destinations).
  /// Recommended for: Medium, Expanded, Large, Extra Large
  navigationRail,

  /// Navigation drawer (modal or permanent).
  /// Modal for: Compact, Medium
  /// Permanent for: Large, Extra Large
  navigationDrawer,

  /// Combination of rail and drawer.
  /// For complex navigation hierarchies
  navigationRailWithDrawer,
}

/// A simple size representation for adaptive calculations.
@immutable
class AdaptiveSize {
  /// Creates an adaptive size with width and height.
  const AdaptiveSize(this.width, this.height);

  /// The width in logical pixels.
  final double width;

  /// The height in logical pixels.
  final double height;

  /// Returns the aspect ratio (width / height).
  double get aspectRatio => height == 0 ? 0 : width / height;

  /// Returns true if width > height.
  bool get isLandscape => width > height;

  /// Returns true if height > width.
  bool get isPortrait => height > width;

  /// Returns true if the size is approximately square.
  bool get isSquare => (width - height).abs() < 50.0;

  @override
  String toString() =>
      'AdaptiveSize(${width.toStringAsFixed(0)}×${height.toStringAsFixed(0)})';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdaptiveSize &&
          runtimeType == other.runtimeType &&
          width == other.width &&
          height == other.height;

  @override
  int get hashCode => Object.hash(width, height);
}

/// Adaptive configuration for Material Design 3 responsive layouts.
///
/// This class provides a comprehensive configuration for adaptive layouts,
/// including window size class detection, grid system properties, spacing
/// values, and layout recommendations.
///
/// The configuration is automatically determined based on screen size and
/// provides all necessary values for implementing responsive designs.
///
/// Example:
/// ```dart
/// final config = AdaptiveConfig.fromDimensions(
///   width: MediaQuery.of(context).size.width,
///   height: MediaQuery.of(context).size.height,
/// );
///
/// print('Size class: ${config.sizeClass}');
/// print('Columns: ${config.columns}');
/// print('Margin: ${config.margin}');
/// print('Gutter: ${config.gutter}');
/// print('Recommended layout: ${config.recommendedLayout}');
/// ```
@immutable
class AdaptiveConfig {
  /// Creates an adaptive configuration.
  const AdaptiveConfig({
    required this.sizeClass,
    required this.heightSizeClass,
    required this.size,
    required this.columns,
    required this.margin,
    required this.gutter,
    required this.recommendedLayout,
    required this.navigationType,
  });

  /// Creates an adaptive configuration from dimensions.
  ///
  /// Example:
  /// ```dart
  /// final config = AdaptiveConfig.fromDimensions(
  ///   width: 800.0,
  ///   height: 600.0,
  /// );
  /// ```
  factory AdaptiveConfig.fromDimensions({
    required double width,
    required double height,
  }) {
    final size = AdaptiveSize(width, height);
    final sizeClass = WindowSizeClass.fromWidth(width);
    final heightSizeClass = WindowHeightSizeClass.fromHeight(height);

    // Determine navigation type based on size class
    final NavigationType navType;
    if (sizeClass.isCompact) {
      navType = NavigationType.bottomNavigation;
    } else if (sizeClass.isMedium || sizeClass.isExpanded) {
      navType = NavigationType.navigationRail;
    } else {
      // Large and Extra Large can use permanent drawer or rail
      navType = NavigationType.navigationDrawer;
    }

    return AdaptiveConfig(
      sizeClass: sizeClass,
      heightSizeClass: heightSizeClass,
      size: size,
      columns: sizeClass.columns,
      margin: sizeClass.margin,
      gutter: sizeClass.gutter,
      recommendedLayout: CanonicalLayout.recommendedFor(sizeClass),
      navigationType: navType,
    );
  }

  /// Creates an adaptive configuration from an [AdaptiveSize].
  factory AdaptiveConfig.fromSize(AdaptiveSize size) {
    return AdaptiveConfig.fromDimensions(
      width: size.width,
      height: size.height,
    );
  }

  /// Preset configuration for compact windows (phones).
  factory AdaptiveConfig.compact({
    double width = 360.0,
    double height = 640.0,
  }) {
    return AdaptiveConfig.fromDimensions(width: width, height: height);
  }

  /// Preset configuration for medium windows (tablets).
  factory AdaptiveConfig.medium({
    double width = 768.0,
    double height = 1024.0,
  }) {
    return AdaptiveConfig.fromDimensions(width: width, height: height);
  }

  /// Preset configuration for expanded windows (small desktops).
  factory AdaptiveConfig.expanded({
    double width = 900.0,
    double height = 700.0,
  }) {
    return AdaptiveConfig.fromDimensions(width: width, height: height);
  }

  /// Preset configuration for large windows (desktops).
  factory AdaptiveConfig.large({
    double width = 1280.0,
    double height = 800.0,
  }) {
    return AdaptiveConfig.fromDimensions(width: width, height: height);
  }

  /// Preset configuration for extra-large windows (large desktops).
  factory AdaptiveConfig.extraLarge({
    double width = 1920.0,
    double height = 1080.0,
  }) {
    return AdaptiveConfig.fromDimensions(width: width, height: height);
  }

  /// The current window size class.
  final WindowSizeClass sizeClass;

  /// The current window height size class.
  final WindowHeightSizeClass heightSizeClass;

  /// The current screen size.
  final AdaptiveSize size;

  /// The number of columns for the grid system.
  final int columns;

  /// The margin (outer spacing) in logical pixels.
  final double margin;

  /// The gutter (inner spacing) in logical pixels.
  final double gutter;

  /// The recommended canonical layout for this configuration.
  final CanonicalLayout recommendedLayout;

  /// The recommended navigation type for this configuration.
  final NavigationType navigationType;

  /// The current screen width.
  double get width => size.width;

  /// The current screen height.
  double get height => size.height;

  /// Returns true if the current configuration is compact.
  bool get isCompact => sizeClass.isCompact;

  /// Returns true if the current configuration is medium.
  bool get isMedium => sizeClass.isMedium;

  /// Returns true if the current configuration is expanded.
  bool get isExpanded => sizeClass.isExpanded;

  /// Returns true if the current configuration is large.
  bool get isLarge => sizeClass.isLarge;

  /// Returns true if the current configuration is extra large.
  bool get isExtraLarge => sizeClass.isExtraLarge;

  /// Returns true if the screen is in landscape orientation.
  bool get isLandscape => size.isLandscape;

  /// Returns true if the screen is in portrait orientation.
  bool get isPortrait => size.isPortrait;

  /// Returns true if the screen is square (or nearly square).
  bool get isSquare => size.isSquare;

  /// Returns the aspect ratio of the current screen.
  double get aspectRatio => size.aspectRatio;

  /// Whether this configuration supports two-pane layouts.
  ///
  /// Two-pane layouts are not practical when width is medium but height
  /// is compact (e.g., phones in landscape).
  bool get supportsTwoPane {
    // Don't use two panes if height is compact (landscape phones)
    if (heightSizeClass.isCompact &&
        !sizeClass.isLarge &&
        !sizeClass.isExtraLarge) {
      return false;
    }
    // Otherwise, use two panes for medium and larger widths
    return !sizeClass.isCompact;
  }

  /// Whether this configuration supports three-pane layouts.
  bool get supportsThreePane {
    // Three panes only make sense on large and extra large screens
    return sizeClass.isLarge || sizeClass.isExtraLarge;
  }

  /// Calculates the column width based on available space.
  double get columnWidth {
    final availableWidth = width - (2 * margin);
    final guttersWidth = (columns - 1) * gutter;
    return (availableWidth - guttersWidth) / columns;
  }

  /// Returns the total content width (excluding margins).
  double get contentWidth => width - (2 * margin);

  /// Maximum content width for readability (typically around 1240dp).
  double get maxContentWidth {
    if (sizeClass.isExtraLarge) {
      return 1240; // Constrain content for readability
    }
    return contentWidth;
  }

  /// Creates a copy of this configuration with updated values.
  AdaptiveConfig copyWith({
    WindowSizeClass? sizeClass,
    WindowHeightSizeClass? heightSizeClass,
    AdaptiveSize? size,
    int? columns,
    double? margin,
    double? gutter,
    CanonicalLayout? recommendedLayout,
    NavigationType? navigationType,
  }) {
    return AdaptiveConfig(
      sizeClass: sizeClass ?? this.sizeClass,
      heightSizeClass: heightSizeClass ?? this.heightSizeClass,
      size: size ?? this.size,
      columns: columns ?? this.columns,
      margin: margin ?? this.margin,
      gutter: gutter ?? this.gutter,
      recommendedLayout: recommendedLayout ?? this.recommendedLayout,
      navigationType: navigationType ?? this.navigationType,
    );
  }

  /// Returns a debug string representation of the configuration.
  String toDebugString() {
    final buffer = StringBuffer()
      ..writeln('AdaptiveConfig:')
      ..writeln('  Size Class: ${sizeClass.name} (${sizeClass.description})')
      ..writeln('  Height Class: ${heightSizeClass.name}')
      ..writeln('  Dimensions: ${width.toInt()} × ${height.toInt()}')
      ..writeln('  Columns: $columns')
      ..writeln('  Margin: ${margin}dp')
      ..writeln('  Gutter: ${gutter}dp')
      ..writeln('  Column Width: ${columnWidth.toStringAsFixed(1)}dp')
      ..writeln('  Content Width: ${contentWidth.toStringAsFixed(1)}dp')
      ..writeln('  Max Content: ${maxContentWidth.toStringAsFixed(1)}dp')
      ..writeln('  Aspect Ratio: ${aspectRatio.toStringAsFixed(2)}')
      ..writeln('  Orientation: ${isLandscape ? 'Landscape' : 'Portrait'}')
      ..writeln('  Supports Two Pane: $supportsTwoPane')
      ..writeln('  Supports Three Pane: $supportsThreePane')
      ..writeln('  Recommended Layout: ${recommendedLayout.name}')
      ..writeln('  Navigation Type: ${navigationType.name}');

    return buffer.toString().trim();
  }

  @override
  String toString() =>
      'AdaptiveConfig(${sizeClass.name}, ${width.toInt()}×${height.toInt()})';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdaptiveConfig &&
          runtimeType == other.runtimeType &&
          sizeClass == other.sizeClass &&
          heightSizeClass == other.heightSizeClass &&
          size == other.size &&
          columns == other.columns &&
          margin == other.margin &&
          gutter == other.gutter &&
          recommendedLayout == other.recommendedLayout &&
          navigationType == other.navigationType;

  @override
  int get hashCode => Object.hash(
        sizeClass,
        heightSizeClass,
        size,
        columns,
        margin,
        gutter,
        recommendedLayout,
        navigationType,
      );
}

/// Utility class providing helper methods for adaptive design calculations.
class AdaptiveUtils {
  AdaptiveUtils._();

  /// Minimum touch target size (48x48dp) per Material Design guidelines.
  static const double minTouchTarget = 48;

  /// Calculates the number of columns that can fit in the given width.
  static int calculateColumns({
    required double availableWidth,
    required double columnWidth,
    required double gutter,
    required double margin,
    int maxColumns = 12,
  }) {
    final contentWidth = availableWidth - (2 * margin);

    for (var columns = maxColumns; columns >= 1; columns--) {
      final totalGutterWidth = (columns - 1) * gutter;
      final requiredWidth = (columns * columnWidth) + totalGutterWidth;

      if (requiredWidth <= contentWidth) {
        return columns;
      }
    }

    return 1;
  }

  /// Calculates the optimal column width for a given number of columns.
  static double calculateColumnWidth({
    required double availableWidth,
    required int columns,
    required double gutter,
    required double margin,
  }) {
    final contentWidth = availableWidth - (2 * margin);
    final totalGutterWidth = (columns - 1) * gutter;
    return (contentWidth - totalGutterWidth) / columns;
  }

  /// Returns the recommended number of columns for a feed layout.
  ///
  /// Based on Material Design 3 guidelines for responsive grids.
  static int getFeedColumns({
    required WindowSizeClass sizeClass,
    required String contentType,
  }) {
    switch (contentType.toLowerCase()) {
      case 'text':
      case 'article':
        // Text content needs narrower columns for readability
        switch (sizeClass) {
          case WindowSizeClass.compact:
            return 1;
          case WindowSizeClass.medium:
            return 1;
          case WindowSizeClass.expanded:
            return 2;
          case WindowSizeClass.large:
            return 2;
          case WindowSizeClass.extraLarge:
            return 3;
        }

      case 'card':
      case 'tile':
        // Cards can be wider
        switch (sizeClass) {
          case WindowSizeClass.compact:
            return 1;
          case WindowSizeClass.medium:
            return 2;
          case WindowSizeClass.expanded:
            return 3;
          case WindowSizeClass.large:
            return 4;
          case WindowSizeClass.extraLarge:
            return 5;
        }

      case 'image':
      case 'photo':
        // Images work well in grids
        switch (sizeClass) {
          case WindowSizeClass.compact:
            return 2;
          case WindowSizeClass.medium:
            return 3;
          case WindowSizeClass.expanded:
            return 4;
          case WindowSizeClass.large:
            return 5;
          case WindowSizeClass.extraLarge:
            return 6;
        }

      default:
        // Default grid columns
        switch (sizeClass) {
          case WindowSizeClass.compact:
            return 1;
          case WindowSizeClass.medium:
            return 2;
          case WindowSizeClass.expanded:
            return 3;
          case WindowSizeClass.large:
            return 4;
          case WindowSizeClass.extraLarge:
            return 4;
        }
    }
  }

  /// Determines if the given size class supports multi-pane layouts.
  static bool supportsMultiPane(WindowSizeClass sizeClass) {
    // Medium and larger screens support multi-pane layouts
    return !sizeClass.isCompact;
  }

  /// Calculates responsive padding value based on the window size class.
  static double getResponsivePadding(WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case WindowSizeClass.compact:
        return 16;
      case WindowSizeClass.medium:
        return 24;
      case WindowSizeClass.expanded:
        return 24;
      case WindowSizeClass.large:
        return 32;
      case WindowSizeClass.extraLarge:
        return 32;
    }
  }

  /// Calculates responsive spacing based on the window size class.
  static double getResponsiveSpacing(WindowSizeClass sizeClass) {
    return sizeClass.gutter;
  }

  /// Determines the optimal breakpoint transition for the given width.
  static WindowSizeClass? getBreakpointTransition(
    double currentWidth,
    double newWidth,
  ) {
    final currentClass = WindowSizeClass.fromWidth(currentWidth);
    final newClass = WindowSizeClass.fromWidth(newWidth);

    return currentClass != newClass ? newClass : null;
  }

  /// Returns the minimum recommended touch target size (48dp).
  static double getMinTouchTarget(WindowSizeClass sizeClass) {
    return minTouchTarget;
  }

  /// Determines if a layout should use navigation rail vs navigation bar.
  static bool shouldUseNavigationRail(WindowSizeClass sizeClass) {
    // Rail is appropriate for medium and larger screens
    return !sizeClass.isCompact;
  }

  /// Determines if a permanent navigation drawer should be used.
  static bool shouldUsePermanentDrawer(WindowSizeClass sizeClass) {
    // Permanent drawer for large and extra large screens
    return sizeClass.isLarge || sizeClass.isExtraLarge;
  }

  /// Calculates the optimal sidebar width for the given size class.
  static double getSidebarWidth(WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case WindowSizeClass.compact:
        return 0; // No sidebar in compact
      case WindowSizeClass.medium:
        return 256; // Standard width
      case WindowSizeClass.expanded:
        return 320; // Wider for more content
      case WindowSizeClass.large:
        return 360; // Comfortable width
      case WindowSizeClass.extraLarge:
        return 360; // Max practical width
    }
  }

  /// Returns the width for a navigation rail.
  static double getNavigationRailWidth({
    bool extended = false,
    WindowSizeClass? sizeClass,
  }) {
    if (extended) {
      // Extended rail width can vary by size class
      if (sizeClass != null && sizeClass.isExtraLarge) {
        return 360;
      }
      return 256;
    }
    return 80; // Standard collapsed width
  }

  /// Returns the width for a navigation drawer.
  static double getNavigationDrawerWidth(WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case WindowSizeClass.compact:
        return 280; // Standard mobile drawer
      case WindowSizeClass.medium:
        return 320; // Slightly wider for tablets
      case WindowSizeClass.expanded:
      case WindowSizeClass.large:
      case WindowSizeClass.extraLarge:
        return 360; // Maximum drawer width
    }
  }

  /// Calculates the width for a list pane in list-detail layout.
  static double getListPaneWidth({
    required double totalWidth,
    required WindowSizeClass sizeClass,
  }) {
    if (sizeClass.isCompact) {
      return totalWidth; // Full width for compact
    }

    // For medium: 40% of width (min 280, max 360)
    // For expanded+: 33% of width (min 320, max 400)
    final percentage = sizeClass.isMedium ? 0.4 : 0.33;
    final calculatedWidth = totalWidth * percentage;

    if (sizeClass.isMedium) {
      return calculatedWidth.clamp(280.0, 360.0);
    } else {
      return calculatedWidth.clamp(320.0, 400.0);
    }
  }

  /// Calculates the width for a supporting pane.
  static double getSupportingPaneWidth({
    required double totalWidth,
    required WindowSizeClass sizeClass,
  }) {
    if (sizeClass.isCompact || sizeClass.isMedium) {
      return 0; // No supporting pane for smaller screens
    }

    // For expanded: 30% of width
    // For large/extra-large: 25% of width
    final percentage = sizeClass.isExpanded ? 0.3 : 0.25;
    final calculatedWidth = totalWidth * percentage;

    // Clamp between reasonable min/max
    return calculatedWidth.clamp(280.0, 400.0);
  }

  /// Returns the maximum content width for readability.
  static double getMaxContentWidth(WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case WindowSizeClass.compact:
        return double.infinity; // Use full width
      case WindowSizeClass.medium:
        return 840; // Max for medium
      case WindowSizeClass.expanded:
        return 1200; // Max for expanded
      case WindowSizeClass.large:
        return 1400; // Max for large
      case WindowSizeClass.extraLarge:
        return 1600; // Max for extra large, often less for text
    }
  }

  /// Returns the maximum readable width for text content.
  static double getMaxReadableWidth(WindowSizeClass sizeClass) {
    // Text should not exceed certain widths for readability
    // Based on ~75 characters per line at normal font sizes
    switch (sizeClass) {
      case WindowSizeClass.compact:
      case WindowSizeClass.medium:
        return double.infinity; // Use available width
      case WindowSizeClass.expanded:
      case WindowSizeClass.large:
      case WindowSizeClass.extraLarge:
        return 720; // Optimal reading width
    }
  }

  /// Determines the number of panes to display.
  static int getPaneCount({
    required WindowSizeClass sizeClass,
    required WindowHeightSizeClass heightSizeClass,
    required CanonicalLayout layout,
  }) {
    // Single pane for compact
    if (sizeClass.isCompact) {
      return 1;
    }

    // Check if height is too compact for multi-pane
    if (heightSizeClass.isCompact &&
        !sizeClass.isLarge &&
        !sizeClass.isExtraLarge) {
      return 1;
    }

    // Determine based on layout type
    switch (layout) {
      case CanonicalLayout.singlePane:
        return 1;
      case CanonicalLayout.listDetail:
        return 2;
      case CanonicalLayout.supportingPane:
        // Supporting pane can be 2 or 3 panes depending on size
        if (sizeClass.isLarge || sizeClass.isExtraLarge) {
          return 3; // Main + detail + supporting
        }
        return 2; // Main + supporting
      case CanonicalLayout.feed:
        return 1; // Feed is single pane with multiple columns
    }
  }

  /// Returns spacing scale factor for the size class.
  static double getSpacingScale(WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case WindowSizeClass.compact:
        return 1;
      case WindowSizeClass.medium:
        return 1;
      case WindowSizeClass.expanded:
        return 1;
      case WindowSizeClass.large:
        return 1.125; // Slightly more spacious
      case WindowSizeClass.extraLarge:
        return 1.25; // Most spacious
    }
  }

  /// Determines if the layout should center content with max width.
  static bool shouldCenterContent(WindowSizeClass sizeClass) {
    // Center content on large and extra large screens
    return sizeClass.isLarge || sizeClass.isExtraLarge;
  }

  /// Returns the recommended elevation for surfaces.
  static double getSurfaceElevation({
    required WindowSizeClass sizeClass,
    required String surfaceType,
  }) {
    // Material Design 3 uses tonal color instead of shadows for most surfaces
    // But some components still use elevation
    switch (surfaceType.toLowerCase()) {
      case 'card':
        return sizeClass.isCompact
            ? 1.0
            : 0.0; // Less elevation on larger screens
      case 'navigation':
        return 3; // Consistent elevation for navigation
      case 'dialog':
        return 6; // Dialogs are always elevated
      case 'menu':
        return 8; // Menus have highest elevation
      default:
        return 0;
    }
  }

  /// Calculates adaptive corner radius.
  static double getCornerRadius({
    required WindowSizeClass sizeClass,
    required String componentType,
  }) {
    // Material Design 3 corner radius guidelines
    final baseRadius = switch (componentType.toLowerCase()) {
      'card' => 12.0,
      'dialog' => 28.0,
      'button' => 20.0,
      'chip' => 8.0,
      'navigation' => 16.0,
      'sheet' => 28.0,
      _ => 12.0,
    };

    // Slightly adjust for size class if needed
    if (sizeClass.isCompact) {
      return baseRadius;
    } else if (sizeClass.isExtraLarge) {
      // Can use slightly larger radii on very large screens
      return baseRadius * 1.1;
    }
    return baseRadius;
  }

  /// Returns the recommended FAB position.
  static FABPosition getFABPosition(WindowSizeClass sizeClass) {
    if (sizeClass.isCompact) {
      return FABPosition.bottomRight;
    } else if (sizeClass.isMedium) {
      return FABPosition.bottomRight;
    } else {
      // Can be more flexible on larger screens
      return FABPosition.bottomLeft; // Away from scrollbars
    }
  }

  /// Determines if a compact app bar should be used.
  static bool shouldUseCompactAppBar(WindowSizeClass sizeClass) {
    // Use compact (small) app bar on compact screens
    return sizeClass.isCompact;
  }

  /// Returns the app bar height based on size class and type.
  static double getAppBarHeight({
    required WindowSizeClass sizeClass,
    required AppBarType type,
  }) {
    switch (type) {
      case AppBarType.small:
        return 64;
      case AppBarType.medium:
        return 112;
      case AppBarType.large:
        return 152;
      case AppBarType.centerAligned:
        return 64;
    }
  }

  /// Calculates responsive icon size.
  static double getIconSize({
    required WindowSizeClass sizeClass,
    required IconSize size,
  }) {
    final baseSize = switch (size) {
      IconSize.small => 18.0,
      IconSize.medium => 24.0,
      IconSize.large => 32.0,
      IconSize.extraLarge => 48.0,
    };

    // Icons generally stay consistent across screen sizes
    // but can be slightly larger on very large screens
    if (sizeClass.isExtraLarge) {
      return baseSize * 1.1;
    }
    return baseSize;
  }

  /// Returns the recommended bottom sheet behavior.
  static BottomSheetBehavior getBottomSheetBehavior(WindowSizeClass sizeClass) {
    if (sizeClass.isCompact || sizeClass.isMedium) {
      return BottomSheetBehavior.modal; // Full screen modal
    } else {
      return BottomSheetBehavior.standard; // Partial overlay
    }
  }

  /// Calculates the maximum width for dialogs.
  static double getDialogMaxWidth(WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case WindowSizeClass.compact:
        return double.infinity; // Full width minus margins
      case WindowSizeClass.medium:
        return 560;
      case WindowSizeClass.expanded:
        return 560;
      case WindowSizeClass.large:
      case WindowSizeClass.extraLarge:
        return 600;
    }
  }

  /// Returns grid spacing for different content types.
  static double getGridSpacing({
    required WindowSizeClass sizeClass,
    required String contentType,
  }) {
    final baseSpacing = sizeClass.gutter;

    switch (contentType.toLowerCase()) {
      case 'card':
        return baseSpacing;
      case 'image':
        return baseSpacing / 2; // Tighter for images
      case 'list':
        return 0; // Lists typically have no spacing
      case 'chip':
        return baseSpacing / 2; // Chips need less space
      default:
        return baseSpacing;
    }
  }
}

/// FAB (Floating Action Button) position options.
enum FABPosition {
  bottomRight,
  bottomCenter,
  bottomLeft,
  topRight,
  topLeft,
}

/// App bar types based on Material Design 3.
enum AppBarType {
  small,
  medium,
  large,
  centerAligned,
}

/// Standard icon sizes.
enum IconSize {
  small,
  medium,
  large,
  extraLarge,
}

/// Bottom sheet behavior types.
enum BottomSheetBehavior {
  modal,
  standard,
  expanding,
}
