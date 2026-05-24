part of '../../../../material_design.dart';

/// Material Design 3 [BorderRadius] with strict M3 shape-scale alignment.
///
/// All constructors accept only [M3Radius] values. The static constants mirror
/// the 7-level M3 shape scale.
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
class M3BorderRadius extends BorderRadius {
  /// Uniform border radius — same radius on all four corners.
  const M3BorderRadius.all(M3Radius super.radius) : super.all();

  /// Vertical border radius (top / bottom).
  const M3BorderRadius.vertical({
    M3Radius top = M3Radius.none,
    M3Radius bottom = M3Radius.none,
  }) : super.vertical(top: top, bottom: bottom);

  /// Horizontal border radius (left / right).
  const M3BorderRadius.horizontal({
    M3Radius left = M3Radius.none,
    M3Radius right = M3Radius.none,
  }) : super.horizontal(left: left, right: right);

  /// Per-corner border radius.
  const M3BorderRadius.only({
    M3Radius topLeft = M3Radius.none,
    M3Radius topRight = M3Radius.none,
    M3Radius bottomLeft = M3Radius.none,
    M3Radius bottomRight = M3Radius.none,
  }) : super.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        );

  /// No border radius (0dp) — sharp rectangular corners.
  static const M3BorderRadius none = M3BorderRadius.all(M3Radius.none);

  /// Extra-small uniform border radius (4dp).
  static const M3BorderRadius extraSmall =
      M3BorderRadius.all(M3Radius.extraSmall);

  /// Small uniform border radius (8dp).
  static const M3BorderRadius small = M3BorderRadius.all(M3Radius.small);

  /// Medium uniform border radius (12dp).
  static const M3BorderRadius medium = M3BorderRadius.all(M3Radius.medium);

  /// Large uniform border radius (16dp).
  static const M3BorderRadius large = M3BorderRadius.all(M3Radius.large);

  /// Extra-large uniform border radius (28dp).
  static const M3BorderRadius extraLarge =
      M3BorderRadius.all(M3Radius.extraLarge);

  /// Full uniform border radius for pill shapes (9999dp).
  static const M3BorderRadius full = M3BorderRadius.all(M3Radius.full);
}
