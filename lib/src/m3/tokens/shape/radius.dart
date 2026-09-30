part of '../../../shape.dart';

/// Material Design 3 [Radius] objects for consistent corner rounding.
///
/// Strictly aligned with the 10-level M3 corner radius scale.
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
class M3Radius extends Radius {
  /// Creates a circular M3 radius from an M3 corner token.
  ///
  /// Only values from [M3Corners] are accepted; see [M3Contract.corner] for
  /// the deliberate escape hatch.
  // ignore: use_super_parameters
  const M3Radius(M3CornerValue value) : super.circular(value);

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

  /// Large-increased circular radius (20dp).
  static const M3Radius largeIncreased = M3Radius(M3Corners.largeIncreased);

  /// Extra-large circular radius (28dp).
  static const M3Radius extraLarge = M3Radius(M3Corners.extraLarge);

  /// Extra-large-increased circular radius (32dp).
  static const M3Radius extraLargeIncreased =
      M3Radius(M3Corners.extraLargeIncreased);

  /// Extra-extra-large circular radius (48dp).
  static const M3Radius extraExtraLarge = M3Radius(M3Corners.extraExtraLarge);

  /// Full circular radius for pill shapes (9999dp).
  static const M3Radius full = M3Radius(M3Corners.full);
}
