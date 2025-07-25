part of '../design_tokens.dart';

/// Grid configuration used for layout metrics.

/// Defines the default layout grid for the application.
class LayoutGridTokens extends Equatable {
  const LayoutGridTokens({
    int? columns,
    double? gutter,
    double? margin,
  }) : columns = columns ?? MaterialDimensions.x12Int,
       gutter = gutter ?? MaterialDimensions.x16,
       margin = margin ?? MaterialDimensions.x16;
  final int columns;
  final double gutter;
  final double margin;

  @override
  List<Object?> get props => [
    columns,
    gutter,
    margin,
  ];

  @override
  String toString() =>
      '''
LayoutGridTokens(
  columns: $columns,
  gutter: $gutter,
  margin: $margin,
)''';
}
