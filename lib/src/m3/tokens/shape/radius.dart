part of '../../../../../material_design.dart';

/// Material Design 3 [Radius] objects for consistent corner rounding.
///
/// Strictly aligned with the 7-level M3 shape scale.
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
class M3Radius extends Radius {
  const M3Radius(double value) : super.circular(value);

  /// No corner radius (0dp).
  static const M3Radius none = M3Radius(M3Corners.none);

  /// Extra-small circular radius (4dp).
  static const M3Radius extraSmall = M3Radius(M3Corners.extraSmall);

  /// Small circular radius (8dp).
  static const M3Radius small = M3Radius(M3Corners.small);

  /// Medium circular radius (12dp).
  static const M3Radius medium = M3Radius(M3Corners.medium);

  /// Large circular radius (16dp).
  static const M3Radius large = M3Radius(M3Corners.large);

  /// Extra-large circular radius (28dp).
  static const M3Radius extraLarge = M3Radius(M3Corners.extraLarge);

  /// Full circular radius for pill shapes (9999dp).
  static const M3Radius full = M3Radius(M3Corners.full);
}
