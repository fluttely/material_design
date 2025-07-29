part of '../../../../../material_design.dart';

/// Custom BorderRadius that enforces Material Design 3 tokens.
class M3BorderRadius extends BorderRadius {
  /// Creates uniform border radius from a shape token.
  M3BorderRadius.all(M3RadiusToken radius) : super.all(radius.value);

  /// Creates vertical border radius (top or bottom).
  M3BorderRadius.vertical({
    M3RadiusToken top = M3RadiusToken.none,
    M3RadiusToken bottom = M3RadiusToken.none,
  }) : super.vertical(
          top: top.value,
          bottom: bottom.value,
        );

  /// Creates horizontal border radius (left or right).
  M3BorderRadius.horizontal({
    M3RadiusToken left = M3RadiusToken.none,
    M3RadiusToken right = M3RadiusToken.none,
  }) : super.horizontal(
          left: left.value,
          right: right.value,
        );

  /// Creates border radius with different tokens for each corner.
  M3BorderRadius.only({
    M3RadiusToken topLeft = M3RadiusToken.none,
    M3RadiusToken topRight = M3RadiusToken.none,
    M3RadiusToken bottomLeft = M3RadiusToken.none,
    M3RadiusToken bottomRight = M3RadiusToken.none,
  }) : super.only(
          topLeft: topLeft.value,
          topRight: topRight.value,
          bottomLeft: bottomLeft.value,
          bottomRight: bottomRight.value,
        );
}
