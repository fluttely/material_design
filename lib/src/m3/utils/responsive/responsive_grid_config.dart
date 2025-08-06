part of '../../../../material_design.dart';

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
  factory M3ResponsiveGridConfig.forScreenSize(M3ScreenSize screenSize) {
    return M3ResponsiveGridConfig(
      columns: M3BreakpointToken.getRecommendedColumns(screenSize),
      gutter: M3BreakpointToken.getGutterWidth(screenSize),
      margin: M3BreakpointToken.getMargin(screenSize),
      maxWidth: M3BreakpointToken.getBodyWidth(screenSize),
    );
  }

  /// Number of columns in the grid.
  final int columns;

  /// Space between columns (gutter).
  final double gutter;

  /// Margin around the grid.
  final M3MarginToken margin;

  /// Maximum width of the grid (optional).
  final double? maxWidth;
}
