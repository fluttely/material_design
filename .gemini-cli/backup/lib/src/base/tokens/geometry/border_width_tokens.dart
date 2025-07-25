part of '../design_tokens.dart';

/// Stroke widths used when drawing borders.

/// Collection of standard border stroke widths.
class BorderWidthTokens extends Equatable {
  const BorderWidthTokens({
    double? hairline,
    double? thin,
    double? regular,
    double? thick,
  }) : hairline = hairline ?? ExtendedValues.x05,
       thin = thin ?? ExtendedValues.x1,
       regular = regular ?? ExtendedValues.x2,
       thick = thick ?? MaterialDimensions.x4;
  final double hairline;
  final double thin;
  final double regular;
  final double thick;

  double get none => MaterialDimensions.zero;

  @override
  List<Object?> get props => [
    none,
    hairline,
    thin,
    regular,
    thick,
  ];

  @override
  String toString() {
    return '''
BorderWidthTokens(
  none: $none,
  hairline: $hairline,
  thin: $thin,
  regular: $regular,
  thick: $thick,
)
''';
  }
}
