part of '../../../adaptive.dart';

/// Layout configuration for responsive grid layouts.
///
/// Provides Material Design 3 compliant grid layout configurations
/// based on the current window size class.
class M3ResponsiveGridConfig {
  /// Creates a responsive grid configuration.
  const M3ResponsiveGridConfig({
    required this.columns,
    required this.gutter,
    required this.margin,
    this.maxWidth,
  });

  /// Builds a responsive grid configuration based on [screenSize].
  factory M3ResponsiveGridConfig.forScreenSize(M3ScreenSize screenSize) {
    return M3ResponsiveGridConfig(
      columns: screenSize.columns,
      gutter: screenSize.gutterWidth,
      margin: screenSize.pageMargin,
      maxWidth: screenSize.bodyWidth,
    );
  }

  /// The number of columns in the grid.
  final int columns;

  /// The spacing between grid columns.
  final M3SpacingValue gutter;

  /// The horizontal page margin.
  final M3SpacingValue margin;

  /// Optional maximum content width.
  final M3BreakpointValue? maxWidth;
}
