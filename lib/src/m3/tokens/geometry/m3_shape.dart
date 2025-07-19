import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Provides pre-defined, Material 3-compliant shape tokens.
///
/// These tokens use the `M3Radius` values to define `ShapeBorder`
/// constants, making it easy to apply consistent corner rounding to Flutter
/// widgets like [Card], [InkWell], and `Container` decorations.
///
/// Using these shape tokens helps maintain a consistent visual language
/// across the application.
///
/// Reference: https://m3.material.io/styles/shape/tokens
@immutable
abstract final class M3Shape {
  /// A shape with no corner rounding (0dp).
  static final ShapeBorder none = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(M3Radius.none),
  );

  /// A shape with extra-small corner rounding (4dp).
  static final ShapeBorder extraSmall = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(M3Radius.extraSmall),
  );

  /// A shape with small corner rounding (8dp).
  static final ShapeBorder small = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(M3Radius.small),
  );

  /// A shape with medium corner rounding (12dp).
  static final ShapeBorder medium = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(M3Radius.medium),
  );

  /// A shape with large corner rounding (16dp).
  static final ShapeBorder large = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(M3Radius.large),
  );

  /// A shape with extra-large corner rounding (28dp).
  static final ShapeBorder extraLarge = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(M3Radius.extraLarge),
  );

  /// A fully rounded shape, creating a pill or circular form.
  ///
  /// This is equivalent to using a `StadiumBorder`.
  static const ShapeBorder full = StadiumBorder();
}
