import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design/src/tokens/geometry/radius.dart';

/// Provides pre-defined, Material 3-compliant shape tokens.
///
/// These tokens use the `MaterialRadius` values to define `ShapeBorder`
/// constants, making it easy to apply consistent corner rounding to Flutter
/// widgets like [Card], [InkWell], and `Container` decorations.
///
/// Using these shape tokens helps maintain a consistent visual language
/// across the application.
///
/// Reference: https://m3.material.io/styles/shape/tokens
abstract final class MaterialShape {
  /// A shape with no corner rounding (0dp).
  static final ShapeBorder none = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(MaterialRadius.none),
  );

  /// A shape with extra-small corner rounding (4dp).
  static final ShapeBorder extraSmall = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(MaterialRadius.extraSmall),
  );

  /// A shape with small corner rounding (8dp).
  static final ShapeBorder small = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(MaterialRadius.small),
  );

  /// A shape with medium corner rounding (12dp).
  static final ShapeBorder medium = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(MaterialRadius.medium),
  );

  /// A shape with large corner rounding (16dp).
  static final ShapeBorder large = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(MaterialRadius.large),
  );

  /// A shape with extra-large corner rounding (28dp).
  static final ShapeBorder extraLarge = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(MaterialRadius.extraLarge),
  );

  /// A fully rounded shape, creating a pill or circular form.
  ///
  /// This is equivalent to using a `StadiumBorder`.
  static const ShapeBorder full = StadiumBorder();
}
