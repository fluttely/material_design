part of '../../../../material_design.dart';

/// Material Design 3 ShapeDecoration with design token enforcement.
///
/// Accepts only [M3Shape] and [M3BoxShadow] arguments, preventing arbitrary
/// shape values that break the design system's visual consistency.
class M3ShapeDecoration extends ShapeDecoration {
  /// Creates a shape decoration using Material Design 3 shape and shadow
  /// tokens.
  const M3ShapeDecoration({
    required M3Shape shape,
    List<M3BoxShadow>? shadows,
    super.color,
    super.image,
    super.gradient,
  }) : super(
          shape: shape,
          shadows: shadows,
        );
}

/// Extension methods for [M3ShapeDecoration].
extension M3ShapeDecorationExtensions on M3ShapeDecoration {
  /// Returns a copy with a different [M3Shape].
  ShapeDecoration withM3Shape(M3Shape shape) {
    return ShapeDecoration(
      shape: shape,
      color: color,
      gradient: gradient,
      image: image,
      shadows: shadows,
    );
  }

  /// Returns a copy with additional shadows appended.
  ShapeDecoration addM3Shadows(List<BoxShadow> newShadows) {
    final existingShadows = shadows ?? [];
    return ShapeDecoration(
      shape: shape,
      color: color,
      gradient: gradient,
      image: image,
      shadows: [...existingShadows, ...newShadows],
    );
  }
}
