part of '../../shape.dart';

/// Material Design 3 [RoundedRectangleBorder] shapes.
///
/// Strictly aligned with the 10-level M3 corner radius scale. Use with any
/// Flutter widget that accepts a [ShapeBorder].
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
class M3Shape extends RoundedRectangleBorder {
  /// Creates an M3 shape with optional border side and border radius.
  const M3Shape({
    M3BorderSide super.side = M3BorderSide.none,
    M3BorderRadius super.borderRadius = M3BorderRadius.none,
  });

  /// Sharp rectangular shape (0dp corners).
  static const M3Shape none = M3Shape();

  /// Extra-small rounded shape (4dp corners).
  static const M3Shape extraSmall =
      M3Shape(borderRadius: M3BorderRadius.extraSmall);

  /// Small rounded shape (8dp corners).
  static const M3Shape small = M3Shape(borderRadius: M3BorderRadius.small);

  /// Medium rounded shape (12dp corners).
  static const M3Shape medium = M3Shape(borderRadius: M3BorderRadius.medium);

  /// Large rounded shape (16dp corners).
  static const M3Shape large = M3Shape(borderRadius: M3BorderRadius.large);

  /// Large-increased rounded shape (20dp corners).
  static const M3Shape largeIncreased =
      M3Shape(borderRadius: M3BorderRadius.largeIncreased);

  /// Extra-large rounded shape (28dp corners).
  static const M3Shape extraLarge =
      M3Shape(borderRadius: M3BorderRadius.extraLarge);

  /// Extra-large-increased rounded shape (32dp corners).
  static const M3Shape extraLargeIncreased =
      M3Shape(borderRadius: M3BorderRadius.extraLargeIncreased);

  /// Extra-extra-large rounded shape (48dp corners).
  static const M3Shape extraExtraLarge =
      M3Shape(borderRadius: M3BorderRadius.extraExtraLarge);

  /// Fully-rounded pill shape (9999dp corners).
  static const M3Shape full = M3Shape(borderRadius: M3BorderRadius.full);
}
