import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

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
  @override
  final double value;

  // --- Utility Methods ---

  /// Gets the current window size class based on screen width.
  static M3WindowSizeClass getWindowSizeClass(double width) {
    if (width < M3BreakpointToken.medium.value) {
      return M3WindowSizeClass.compact;
    } else if (width < M3BreakpointToken.expanded.value) {
      return M3WindowSizeClass.medium;
    } else if (width < M3BreakpointToken.large.value) {
      return M3WindowSizeClass.expanded;
    } else if (width < M3BreakpointToken.extraLarge.value) {
      return M3WindowSizeClass.large;
    } else {
      return M3WindowSizeClass.extraLarge;
    }
  }

  /// Gets the window size class from a BuildContext.
  static M3WindowSizeClass getWindowSizeClassFromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return getWindowSizeClass(width);
  }

  /// Checks if the current screen is compact.
  static bool isCompact(BuildContext context) {
    return getWindowSizeClassFromContext(context) == M3WindowSizeClass.compact;
  }

  /// Checks if the current screen is medium.
  static bool isMedium(BuildContext context) {
    return getWindowSizeClassFromContext(context) == M3WindowSizeClass.medium;
  }

  /// Checks if the current screen is expanded.
  static bool isExpanded(BuildContext context) {
    return getWindowSizeClassFromContext(context) == M3WindowSizeClass.expanded;
  }

  /// Checks if the current screen is large.
  static bool isLarge(BuildContext context) {
    return getWindowSizeClassFromContext(context) == M3WindowSizeClass.large;
  }

  /// Checks if the current screen is extra large.
  static bool isExtraLarge(BuildContext context) {
    return getWindowSizeClassFromContext(context) ==
        M3WindowSizeClass.extraLarge;
  }

  /// Gets the maximum content width for the current breakpoint.
  static double getMaxContentWidth(M3WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case M3WindowSizeClass.compact:
        return double.infinity; // Use full width
      case M3WindowSizeClass.medium:
        return M3BreakpointToken.expanded.value;
      case M3WindowSizeClass.expanded:
        return M3BreakpointToken.large.value;
      case M3WindowSizeClass.large:
        return M3BreakpointToken.extraLarge.value;
      case M3WindowSizeClass.extraLarge:
        return 1920; // Reasonable max for readability
    }
  }

  /// Gets the recommended number of columns for the current breakpoint.
  static int getRecommendedColumns(M3WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case M3WindowSizeClass.compact:
        return 4;
      case M3WindowSizeClass.medium:
        return 8;
      case M3WindowSizeClass.expanded:
      case M3WindowSizeClass.large:
      case M3WindowSizeClass.extraLarge:
        return 12;
    }
  }

  /// Gets the recommended gutter width for the current breakpoint.
  static double getGutterWidth(M3WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case M3WindowSizeClass.compact:
        return 16;
      case M3WindowSizeClass.medium:
      case M3WindowSizeClass.expanded:
      case M3WindowSizeClass.large:
      case M3WindowSizeClass.extraLarge:
        return 24;
    }
  }

  /// Gets the recommended margin for the current breakpoint.
  static double getMargin(M3WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case M3WindowSizeClass.compact:
        return 16;
      case M3WindowSizeClass.medium:
      case M3WindowSizeClass.expanded:
        return 24;
      case M3WindowSizeClass.large:
      case M3WindowSizeClass.extraLarge:
        return 24;
    }
  }

  /// Gets the recommended body width for the current breakpoint.
  static double? getBodyWidth(M3WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case M3WindowSizeClass.compact:
      case M3WindowSizeClass.medium:
        return null; // Full width
      case M3WindowSizeClass.expanded:
        return 840;
      case M3WindowSizeClass.large:
        return 1040;
      case M3WindowSizeClass.extraLarge:
        return 1040;
    }
  }

  /// Gets the recommended pane width for the current breakpoint.
  static double getPaneWidth(M3WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case M3WindowSizeClass.compact:
        return double.infinity; // Full width
      case M3WindowSizeClass.medium:
        return 360;
      case M3WindowSizeClass.expanded:
      case M3WindowSizeClass.large:
      case M3WindowSizeClass.extraLarge:
        return 360;
    }
  }
}

/// Window size classes for responsive design.
///
/// These classes represent the canonical Material Design 3 window size
/// classifications used for building adaptive layouts.
enum M3WindowSizeClass {
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

/// Extension on M3WindowSizeClass to add convenience methods.
extension M3WindowSizeClassExtension on M3WindowSizeClass {
  /// Returns true if this size class is at least as large as the given size class.
  bool isAtLeast(M3WindowSizeClass other) {
    return index >= other.index;
  }

  /// Returns true if this size class is at most as large as the given size class.
  bool isAtMost(M3WindowSizeClass other) {
    return index <= other.index;
  }

  /// Returns true if this is a mobile size class (compact or medium).
  bool get isMobile =>
      this == M3WindowSizeClass.compact || this == M3WindowSizeClass.medium;

  /// Returns true if this is a tablet size class (expanded).
  bool get isTablet => this == M3WindowSizeClass.expanded;

  /// Returns true if this is a desktop size class (large or extraLarge).
  bool get isDesktop =>
      this == M3WindowSizeClass.large || this == M3WindowSizeClass.extraLarge;

  /// Returns the display name for this size class.
  String get displayName {
    switch (this) {
      case M3WindowSizeClass.compact:
        return 'Compact';
      case M3WindowSizeClass.medium:
        return 'Medium';
      case M3WindowSizeClass.expanded:
        return 'Expanded';
      case M3WindowSizeClass.large:
        return 'Large';
      case M3WindowSizeClass.extraLarge:
        return 'Extra Large';
    }
  }

  /// Returns the typical device description for this size class.
  String get deviceDescription {
    switch (this) {
      case M3WindowSizeClass.compact:
        return 'Phone (Portrait)';
      case M3WindowSizeClass.medium:
        return 'Phone (Landscape) / Small Tablet';
      case M3WindowSizeClass.expanded:
        return 'Large Tablet / Foldable';
      case M3WindowSizeClass.large:
        return 'Desktop / Laptop';
      case M3WindowSizeClass.extraLarge:
        return 'Large Monitor / Ultra-wide Display';
    }
  }
}

/// A responsive builder widget that rebuilds when the window size class changes.
///
/// This widget provides an easy way to build adaptive layouts that respond
/// to changes in window size class.
///
/// Example:
/// ```dart
/// M3ResponsiveBuilder(
///   builder: (context, sizeClass) {
///     if (sizeClass.isDesktop) {
///       return DesktopLayout();
///     } else if (sizeClass.isTablet) {
///       return TabletLayout();
///     } else {
///       return MobileLayout();
///     }
///   },
/// )
/// ```
class M3ResponsiveBuilder extends StatelessWidget {
  /// Creates a responsive builder widget.
  const M3ResponsiveBuilder({
    required this.builder,
    super.key,
  });

  /// The builder function that receives the current window size class.
  final Widget Function(BuildContext context, M3WindowSizeClass sizeClass)
      builder;

  @override
  Widget build(BuildContext context) {
    final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
    return builder(context, sizeClass);
  }
}

/// A widget that provides responsive values based on the current window size class.
///
/// This widget allows you to specify different values for different breakpoints
/// and automatically selects the appropriate value based on the current screen size.
///
/// Example:
/// ```dart
/// M3ResponsiveValue<double>(
///   compact: 16.0,
///   medium: 24.0,
///   expanded: 32.0,
///   large: 40.0,
///   extraLarge: 48.0,
///   builder: (context, value) {
///     return Padding(
///       padding: EdgeInsets.all(value),
///       child: Text('Responsive padding'),
///     );
///   },
/// )
/// ```
class M3ResponsiveValue<T> extends StatelessWidget {
  /// Creates a responsive value widget.
  const M3ResponsiveValue({
    required this.builder,
    super.key,
    this.compact,
    this.medium,
    this.expanded,
    this.large,
    this.extraLarge,
  });

  /// Value for compact window size class.
  final T? compact;

  /// Value for medium window size class.
  final T? medium;

  /// Value for expanded window size class.
  final T? expanded;

  /// Value for large window size class.
  final T? large;

  /// Value for extra large window size class.
  final T? extraLarge;

  /// Builder function that receives the selected value.
  final Widget Function(BuildContext context, T value) builder;

  /// Gets the value for the current window size class.
  T _getValue(M3WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case M3WindowSizeClass.compact:
        return compact ?? medium ?? expanded ?? large ?? extraLarge!;
      case M3WindowSizeClass.medium:
        return medium ?? expanded ?? large ?? extraLarge ?? compact!;
      case M3WindowSizeClass.expanded:
        return expanded ?? large ?? extraLarge ?? medium ?? compact!;
      case M3WindowSizeClass.large:
        return large ?? extraLarge ?? expanded ?? medium ?? compact!;
      case M3WindowSizeClass.extraLarge:
        return extraLarge ?? large ?? expanded ?? medium ?? compact!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
    final value = _getValue(sizeClass);
    return builder(context, value);
  }
}

/// A widget that conditionally displays content based on window size class.
///
/// This widget provides an easy way to show/hide content based on the current
/// window size class.
///
/// Example:
/// ```dart
/// M3ResponsiveVisibility(
///   visibleOn: [M3WindowSizeClass.large, M3WindowSizeClass.extraLarge],
///   child: Sidebar(),
/// )
/// ```
class M3ResponsiveVisibility extends StatelessWidget {
  /// Creates a responsive visibility widget.
  const M3ResponsiveVisibility({
    required this.visibleOn,
    required this.child,
    super.key,
    this.replacement = const SizedBox.shrink(),
  });

  /// List of window size classes where the child should be visible.
  final List<M3WindowSizeClass> visibleOn;

  /// The widget to display when visible.
  final Widget child;

  /// The widget to display when not visible (defaults to empty space).
  final Widget replacement;

  @override
  Widget build(BuildContext context) {
    final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
    return visibleOn.contains(sizeClass) ? child : replacement;
  }
}

/// Layout configuration for responsive grid layouts.
///
/// This class provides Material Design 3 compliant grid layout configurations
/// based on the current window size class.
class M3ResponsiveGridConfig {
  /// Creates a grid configuration.
  const M3ResponsiveGridConfig({
    required this.columns,
    required this.gutter,
    required this.margin,
    this.maxWidth,
  });

  /// Gets the appropriate grid configuration for the given window size class.
  factory M3ResponsiveGridConfig.forSizeClass(M3WindowSizeClass sizeClass) {
    return M3ResponsiveGridConfig(
      columns: M3BreakpointToken.getRecommendedColumns(sizeClass),
      gutter: M3BreakpointToken.getGutterWidth(sizeClass),
      margin: M3BreakpointToken.getMargin(sizeClass),
      maxWidth: M3BreakpointToken.getBodyWidth(sizeClass),
    );
  }

  /// Number of columns in the grid.
  final int columns;

  /// Space between columns (gutter).
  final double gutter;

  /// Margin around the grid.
  final double margin;

  /// Maximum width of the grid (optional).
  final double? maxWidth;
}

/// A responsive grid widget that follows Material Design 3 guidelines.
///
/// This widget creates a responsive grid layout that automatically adjusts
/// based on the current window size class.
class M3ResponsiveGrid extends StatelessWidget {
  /// Creates a responsive grid widget.
  const M3ResponsiveGrid({
    required this.children,
    super.key,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.childAspectRatio = 1.0,
  });

  /// The widgets to display in the grid.
  final List<Widget> children;

  /// Spacing between items along the cross axis.
  final double? crossAxisSpacing;

  /// Spacing between items along the main axis.
  final double? mainAxisSpacing;

  /// The aspect ratio of each child.
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return M3ResponsiveBuilder(
      builder: (context, sizeClass) {
        final config = M3ResponsiveGridConfig.forSizeClass(sizeClass);

        return Container(
          constraints: config.maxWidth != null
              ? BoxConstraints(maxWidth: config.maxWidth!)
              : null,
          padding: EdgeInsets.symmetric(horizontal: config.margin),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: config.columns,
            crossAxisSpacing: crossAxisSpacing ?? config.gutter,
            mainAxisSpacing: mainAxisSpacing ?? config.gutter,
            childAspectRatio: childAspectRatio,
            children: children,
          ),
        );
      },
    );
  }
}

/// Helper class for responsive navigation patterns.
///
/// Provides utilities for implementing Material Design 3 navigation patterns
/// that adapt to different window size classes.
class M3ResponsiveNavigation {
  /// Determines the appropriate navigation type for the current window size class.
  static M3NavigationType getNavigationType(M3WindowSizeClass sizeClass) {
    switch (sizeClass) {
      case M3WindowSizeClass.compact:
        return M3NavigationType.bottom;
      case M3WindowSizeClass.medium:
      case M3WindowSizeClass.expanded:
        return M3NavigationType.rail;
      case M3WindowSizeClass.large:
      case M3WindowSizeClass.extraLarge:
        return M3NavigationType.drawer;
    }
  }

  /// Determines if a navigation rail should be extended.
  static bool shouldExtendRail(M3WindowSizeClass sizeClass) {
    return sizeClass.isAtLeast(M3WindowSizeClass.large);
  }

  /// Gets the recommended navigation rail width.
  static double getRailWidth(bool extended) {
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

/// A responsive scaffold that automatically adjusts navigation based on window size.
///
/// This widget provides a complete scaffold solution that adapts its navigation
/// pattern based on the current window size class.
class M3ResponsiveScaffold extends StatelessWidget {
  /// Creates a responsive scaffold.
  const M3ResponsiveScaffold({
    required this.body,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  /// The main content of the scaffold.
  final Widget body;

  /// Navigation destinations.
  final List<NavigationDestination> destinations;

  /// Currently selected navigation index.
  final int selectedIndex;

  /// Callback when a destination is selected.
  final ValueChanged<int> onDestinationSelected;

  /// Optional app bar.
  final PreferredSizeWidget? appBar;

  /// Optional floating action button.
  final Widget? floatingActionButton;

  /// Optional floating action button location.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return M3ResponsiveBuilder(
      builder: (context, sizeClass) {
        final navigationType =
            M3ResponsiveNavigation.getNavigationType(sizeClass);

        switch (navigationType) {
          case M3NavigationType.bottom:
            return Scaffold(
              appBar: appBar,
              body: body,
              bottomNavigationBar: NavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                destinations: destinations,
              ),
              floatingActionButton: floatingActionButton,
              floatingActionButtonLocation: floatingActionButtonLocation,
            );

          case M3NavigationType.rail:
            return Scaffold(
              appBar: appBar,
              body: Row(
                children: [
                  NavigationRail(
                    selectedIndex: selectedIndex,
                    onDestinationSelected: onDestinationSelected,
                    extended:
                        M3ResponsiveNavigation.shouldExtendRail(sizeClass),
                    destinations: destinations.map((dest) {
                      return NavigationRailDestination(
                        icon: dest.icon,
                        selectedIcon: dest.selectedIcon,
                        label: Text(dest.label),
                      );
                    }).toList(),
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(child: body),
                ],
              ),
              floatingActionButton: floatingActionButton,
              floatingActionButtonLocation: floatingActionButtonLocation,
            );

          case M3NavigationType.drawer:
            return Scaffold(
              appBar: appBar,
              body: Row(
                children: [
                  NavigationDrawer(
                    selectedIndex: selectedIndex,
                    onDestinationSelected: onDestinationSelected,
                    children: [
                      const SizedBox(height: 12),
                      ...destinations.map((dest) {
                        return NavigationDrawerDestination(
                          icon: dest.icon,
                          selectedIcon: dest.selectedIcon,
                          label: Text(dest.label),
                        );
                      }),
                    ],
                  ),
                  Expanded(child: body),
                ],
              ),
              floatingActionButton: floatingActionButton,
              floatingActionButtonLocation: floatingActionButtonLocation,
            );
        }
      },
    );
  }
}
