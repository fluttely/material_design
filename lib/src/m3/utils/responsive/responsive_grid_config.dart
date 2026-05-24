part of '../../../../material_design.dart';

/// Layout configuration for responsive grid layouts.
///
/// Provides Material Design 3 compliant grid layout configurations
/// based on the current window size class.
class M3ResponsiveGridConfig {
  const M3ResponsiveGridConfig({
    required this.columns,
    required this.gutter,
    required this.margin,
    this.maxWidth,
  });

  factory M3ResponsiveGridConfig.forScreenSize(M3ScreenSize screenSize) {
    return M3ResponsiveGridConfig(
      columns: M3Breakpoints.getRecommendedColumns(screenSize),
      gutter: M3Breakpoints.getGutterWidth(screenSize),
      margin: M3Breakpoints.getMargin(screenSize),
      maxWidth: M3Breakpoints.getBodyWidth(screenSize),
    );
  }

  final int columns;
  final double gutter;
  final double margin;
  final double? maxWidth;
}
