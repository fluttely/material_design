part of '../../../../../material_design.dart';

/// Custom BorderRadius that enforces Material Design 3 tokens.
class M3BorderRadius extends BorderRadius {
  /// Creates uniform border radius from a shape token.
  const M3BorderRadius.all(M3Radius super.radius) : super.all();

  /// Creates vertical border radius (top or bottom).
  const M3BorderRadius.vertical({
    M3Radius top = M3Radius.zero,
    M3Radius bottom = M3Radius.zero,
  }) : super.vertical(
          top: top,
          bottom: bottom,
        );

  /// Creates horizontal border radius (left or right).
  const M3BorderRadius.horizontal({
    M3Radius left = M3Radius.zero,
    M3Radius right = M3Radius.zero,
  }) : super.horizontal(
          left: left,
          right: right,
        );

  /// Creates border radius with different tokens for each corner.
  const M3BorderRadius.only({
    M3Radius topLeft = M3Radius.zero,
    M3Radius topRight = M3Radius.zero,
    M3Radius bottomLeft = M3Radius.zero,
    M3Radius bottomRight = M3Radius.zero,
  }) : super.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        );

  static const M3BorderRadius zero = M3BorderRadius.all(M3Radius.zero);
}
