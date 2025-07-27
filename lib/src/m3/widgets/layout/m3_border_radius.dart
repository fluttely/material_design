part of '../../../../../material_design.dart';

/// Custom BorderRadius that enforces Material Design 3 tokens.
class M3BorderRadius extends BorderRadius {
  /// Creates uniform border radius from a shape token.
  M3BorderRadius.all(M3ShapeToken shape)
      : super.all(shape.borderRadius.radius.value);

  /// Creates border radius with different tokens for each corner.
  M3BorderRadius.only({
    M3ShapeToken topLeft = M3ShapeToken.none,
    M3ShapeToken topRight = M3ShapeToken.none,
    M3ShapeToken bottomLeft = M3ShapeToken.none,
    M3ShapeToken bottomRight = M3ShapeToken.none,
  }) : super.only(
          topLeft: topLeft.borderRadius.radius.value,
          topRight: topRight.borderRadius.radius.value,
          bottomLeft: bottomLeft.borderRadius.radius.value,
          bottomRight: bottomRight.borderRadius.radius.value,
        );

  /// Creates vertical border radius (top or bottom).
  M3BorderRadius.vertical({
    M3ShapeToken top = M3ShapeToken.none,
    M3ShapeToken bottom = M3ShapeToken.none,
  }) : super.vertical(
          top: top.borderRadius.radius.value,
          bottom: bottom.borderRadius.radius.value,
        );

  /// Creates horizontal border radius (left or right).
  M3BorderRadius.horizontal({
    M3ShapeToken left = M3ShapeToken.none,
    M3ShapeToken right = M3ShapeToken.none,
  }) : super.horizontal(
          left: left.borderRadius.radius.value,
          right: right.borderRadius.radius.value,
        );
}
