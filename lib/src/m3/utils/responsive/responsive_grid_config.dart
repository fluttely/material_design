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
      columns: screenSize.columns,
      gutter: screenSize.gutterWidth,
      margin: screenSize.pageMargin,
      maxWidth: screenSize.bodyWidth,
    );
  }

  final int columns;
  final double gutter;
  final double margin;
  final double? maxWidth;
}
