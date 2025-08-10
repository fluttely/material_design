/// Material Design 3 spacing implementation for Flutter.
///
/// This follows Flutter's patterns and integrates with the theme system.
/// Reference: https://m3.material.io/foundations/layout/applying-layout
library;

import 'package:flutter/material.dart';

/// Material Design 3 spacing constants following Flutter's pattern.
///
/// Similar to how Flutter defines [Colors] and [Icons], this provides
/// spacing constants based on the 4dp grid system.
class MaterialSpacing {
  // Private constructor prevents instantiation
  MaterialSpacing._();

  /// Base unit for Material Design 3 grid system
  static const double unit = 4;

  // Standard spacing values (multiples of 4dp)
  static const double space0 = 0;
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space28 = 28;
  static const double space32 = 32;
  static const double space36 = 36;
  static const double space40 = 40;
  static const double space48 = 48;
  static const double space56 = 56;
  static const double space64 = 64;
  static const double space72 = 72;
  static const double space80 = 80;
}

/// Window size classes for adaptive layouts.
///
/// Following Material Design 3 adaptive design principles.
/// Similar to Flutter's [Breakpoint] in material_adaptive_breakpoints.
enum WindowSizeClass {
  /// Width: 0-599dp (phones in portrait)
  compact(maxWidth: 599),

  /// Width: 600-839dp (tablets, foldables)
  medium(minWidth: 600, maxWidth: 839),

  /// Width: 840dp+ (tablets in landscape, desktops)
  expanded(minWidth: 840);

  final double? minWidth;
  final double? maxWidth;

  const WindowSizeClass({this.minWidth, this.maxWidth});

  /// Get the window size class for a given width
  static WindowSizeClass fromWidth(double width) {
    if (width < 600) return WindowSizeClass.compact;
    if (width < 840) return WindowSizeClass.medium;
    return WindowSizeClass.expanded;
  }
}

/// Theme extension for Material Design 3 spacing.
///
/// This follows Flutter's [ThemeExtension] pattern to integrate
/// with the theme system properly.
@immutable
class SpacingTheme extends ThemeExtension<SpacingTheme> {
  const SpacingTheme({
    this.iconTextGap = MaterialSpacing.space8,
    this.componentPadding = MaterialSpacing.space16,
    this.listItemGap = MaterialSpacing.space8,
    this.cardGap = MaterialSpacing.space16,
    this.sectionGap = MaterialSpacing.space24,
    this.pageMargins = const EdgeInsets.all(MaterialSpacing.space16),
  });

  /// Creates a spacing theme for compact screens
  factory SpacingTheme.compact() {
    return const SpacingTheme();
  }

  /// Creates a spacing theme for medium screens
  factory SpacingTheme.medium() {
    return const SpacingTheme(
      pageMargins: EdgeInsets.all(MaterialSpacing.space24),
    );
  }

  /// Creates a spacing theme for expanded screens
  factory SpacingTheme.expanded() {
    return const SpacingTheme(
      pageMargins: EdgeInsets.symmetric(
        horizontal: MaterialSpacing.space24,
        vertical: MaterialSpacing.space24,
      ),
    );
  }

  /// Creates adaptive spacing based on screen width
  factory SpacingTheme.adaptive(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final sizeClass = WindowSizeClass.fromWidth(width);

    switch (sizeClass) {
      case WindowSizeClass.compact:
        return SpacingTheme.compact();
      case WindowSizeClass.medium:
        return SpacingTheme.medium();
      case WindowSizeClass.expanded:
        return SpacingTheme.expanded();
    }
  }

  /// Spacing between icon and text
  final double iconTextGap;

  /// Internal padding for components
  final double componentPadding;

  /// Spacing between list items
  final double listItemGap;

  /// Spacing between cards
  final double cardGap;

  /// Section spacing
  final double sectionGap;

  /// Page margins based on window size
  final EdgeInsets pageMargins;

  @override
  SpacingTheme copyWith({
    double? iconTextGap,
    double? componentPadding,
    double? listItemGap,
    double? cardGap,
    double? sectionGap,
    EdgeInsets? pageMargins,
  }) {
    return SpacingTheme(
      iconTextGap: iconTextGap ?? this.iconTextGap,
      componentPadding: componentPadding ?? this.componentPadding,
      listItemGap: listItemGap ?? this.listItemGap,
      cardGap: cardGap ?? this.cardGap,
      sectionGap: sectionGap ?? this.sectionGap,
      pageMargins: pageMargins ?? this.pageMargins,
    );
  }

  @override
  SpacingTheme lerp(ThemeExtension<SpacingTheme>? other, double t) {
    if (other is! SpacingTheme) {
      return this;
    }
    return SpacingTheme(
      iconTextGap: lerpDouble(iconTextGap, other.iconTextGap, t)!,
      componentPadding:
          lerpDouble(componentPadding, other.componentPadding, t)!,
      listItemGap: lerpDouble(listItemGap, other.listItemGap, t)!,
      cardGap: lerpDouble(cardGap, other.cardGap, t)!,
      sectionGap: lerpDouble(sectionGap, other.sectionGap, t)!,
      pageMargins: EdgeInsets.lerp(pageMargins, other.pageMargins, t)!,
    );
  }

  /// Helper to get SpacingTheme from context
  static SpacingTheme of(BuildContext context) {
    return Theme.of(context).extension<SpacingTheme>() ?? const SpacingTheme();
  }
}

/// Material Design 3 layout configuration.
///
/// Similar to Flutter's [MaterialTapTargetSize] and other layout configs.
@immutable
class MaterialLayoutConfig {
  const MaterialLayoutConfig({
    required this.columns,
    required this.gutter,
    required this.sizeClass,
    this.minTouchTarget = 48.0,
  });

  /// Compact layout configuration
  factory MaterialLayoutConfig.compact() {
    return const MaterialLayoutConfig(
      columns: 4,
      gutter: MaterialSpacing.space16,
      sizeClass: WindowSizeClass.compact,
    );
  }

  /// Medium layout configuration
  factory MaterialLayoutConfig.medium() {
    return const MaterialLayoutConfig(
      columns: 8,
      gutter: MaterialSpacing.space24,
      sizeClass: WindowSizeClass.medium,
    );
  }

  /// Expanded layout configuration
  factory MaterialLayoutConfig.expanded() {
    return const MaterialLayoutConfig(
      columns: 12,
      gutter: MaterialSpacing.space24,
      sizeClass: WindowSizeClass.expanded,
    );
  }

  /// Creates adaptive layout based on screen width
  factory MaterialLayoutConfig.adaptive(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final sizeClass = WindowSizeClass.fromWidth(width);

    switch (sizeClass) {
      case WindowSizeClass.compact:
        return MaterialLayoutConfig.compact();
      case WindowSizeClass.medium:
        return MaterialLayoutConfig.medium();
      case WindowSizeClass.expanded:
        return MaterialLayoutConfig.expanded();
    }
  }

  /// Number of columns for the grid
  final int columns;

  /// Gutter width between columns
  final double gutter;

  /// Minimum touch target size
  final double minTouchTarget;

  /// Window size class
  final WindowSizeClass sizeClass;
}

/// Extension methods for BuildContext to easily access spacing.
///
/// Similar to how Flutter provides Theme.of(context).
extension SpacingBuildContext on BuildContext {
  /// Gets the spacing theme from the current context
  SpacingTheme get spacing => SpacingTheme.of(this);

  /// Gets the adaptive layout configuration
  MaterialLayoutConfig get layoutConfig => MaterialLayoutConfig.adaptive(this);

  /// Gets the current window size class
  WindowSizeClass get windowSizeClass {
    final width = MediaQuery.of(this).size.width;
    return WindowSizeClass.fromWidth(width);
  }
}

/// Utility class for spacing calculations.
///
/// Similar to Flutter's [TextPainter] and other utility classes.
class SpacingUtils {
  SpacingUtils._();

  /// Rounds a value to the nearest grid unit
  static double snapToGrid(double value, {double unit = MaterialSpacing.unit}) {
    return (value / unit).round() * unit;
  }

  /// Checks if a value aligns with the grid
  static bool isGridAligned(double value,
      {double unit = MaterialSpacing.unit}) {
    return value % unit == 0;
  }

  /// Calculates column width based on layout configuration
  static double columnWidth({
    required double screenWidth,
    required MaterialLayoutConfig config,
    EdgeInsets margins = EdgeInsets.zero,
  }) {
    final totalGutters = (config.columns - 1) * config.gutter;
    final totalMargins = margins.horizontal;
    final availableWidth = screenWidth - totalGutters - totalMargins;
    return availableWidth / config.columns;
  }
}

// Example usage following Flutter patterns:

/// Example of how to use the spacing system in an app
class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Spacing Example',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // Add the spacing extension to the theme
        extensions: <ThemeExtension<dynamic>>[
          SpacingTheme.adaptive(context),
        ],
      ),
      home: const ExampleScreen(),
    );
  }
}

/// Example screen using the spacing system
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access spacing using extension method
    final spacing = context.spacing;
    final layout = context.layoutConfig;

    return Scaffold(
      body: Padding(
        padding: spacing.pageMargins,
        child: Column(
          children: [
            Text(
              'Window Size: ${context.windowSizeClass.name}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: spacing.sectionGap),
            Text('Columns: ${layout.columns}'),
            SizedBox(height: spacing.componentPadding),
            Card(
              child: Padding(
                padding: EdgeInsets.all(spacing.componentPadding),
                child: const Text('Material Design 3 Spacing'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper for responsive layouts
/// Responsive layout builder similar to Flutter's [LayoutBuilder]
class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    required this.builder,
    super.key,
  });
  final Widget Function(BuildContext, WindowSizeClass) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sizeClass = WindowSizeClass.fromWidth(constraints.maxWidth);
        return builder(context, sizeClass);
      },
    );
  }
}

// Additional helper for EdgeInsets following Flutter patterns
/// Material Design 3 EdgeInsets helpers
class MaterialEdgeInsets {
  MaterialEdgeInsets._();

  // Predefined EdgeInsets following Material Design 3
  static const EdgeInsets allSmall = EdgeInsets.all(MaterialSpacing.space8);
  static const EdgeInsets allMedium = EdgeInsets.all(MaterialSpacing.space16);
  static const EdgeInsets allLarge = EdgeInsets.all(MaterialSpacing.space24);

  static const EdgeInsets horizontalSmall =
      EdgeInsets.symmetric(horizontal: MaterialSpacing.space8);
  static const EdgeInsets horizontalMedium =
      EdgeInsets.symmetric(horizontal: MaterialSpacing.space16);
  static const EdgeInsets horizontalLarge =
      EdgeInsets.symmetric(horizontal: MaterialSpacing.space24);

  static const EdgeInsets verticalSmall =
      EdgeInsets.symmetric(vertical: MaterialSpacing.space8);
  static const EdgeInsets verticalMedium =
      EdgeInsets.symmetric(vertical: MaterialSpacing.space16);
  static const EdgeInsets verticalLarge =
      EdgeInsets.symmetric(vertical: MaterialSpacing.space24);
}
