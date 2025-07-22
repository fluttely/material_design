import 'package:flutter/material.dart';

/// Provides pre-defined, Material 3-compliant shape tokens.
///
/// These tokens use the `M3Radius` values to define `ShapeBorder`
/// constants, making it easy to apply consistent corner rounding to Flutter
/// widgets like [Card], [InkWell], and `Container` decorations.
///
/// Using these shape tokens helps maintain a consistent visual language
/// across the application.
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
@immutable
abstract class M3Shape {
  /// A shape with no corner rounding (0dp).
  static final RoundedRectangleBorder none =
      RoundedRectangleBorder(borderRadius: M3BorderRadius.none);

  /// A shape with extra-small corner rounding (4dp).
  static final RoundedRectangleBorder extraSmall =
      RoundedRectangleBorder(borderRadius: M3BorderRadius.extraSmall);

  /// A shape with small corner rounding (8dp).
  static final RoundedRectangleBorder small =
      RoundedRectangleBorder(borderRadius: M3BorderRadius.small);

  /// A shape with medium corner rounding (12dp).
  static final RoundedRectangleBorder medium =
      RoundedRectangleBorder(borderRadius: M3BorderRadius.medium);

  /// A shape with large corner rounding (16dp).
  static final RoundedRectangleBorder large =
      RoundedRectangleBorder(borderRadius: M3BorderRadius.large);

  /// A shape with an increased large corner rounding (e.g., 20dp).
  static final RoundedRectangleBorder largeIncreased =
      RoundedRectangleBorder(borderRadius: M3BorderRadius.largeIncreased);

  /// A shape with extra-large corner rounding (28dp).
  static final RoundedRectangleBorder extraLarge =
      RoundedRectangleBorder(borderRadius: M3BorderRadius.extraLarge);

  /// A shape with an increased extra-large corner rounding (e.g., 32dp).
  static final RoundedRectangleBorder extraLargeIncreased =
      RoundedRectangleBorder(borderRadius: M3BorderRadius.extraLargeIncreased);

  /// A shape with an extra-extra-large corner rounding (e.g., 48dp).
  static final RoundedRectangleBorder extraExtraLarge =
      RoundedRectangleBorder(borderRadius: M3BorderRadius.extraExtraLarge);

  /// A fully rounded shape, creating a pill or circular form.
  ///
  /// This is equivalent to using a `StadiumBorder`.
  static const ShapeBorder full = StadiumBorder();
}

/// Defines the border radius values for shape tokens according to Material Design 3.
///
/// Shape is a token category in Material 3 that replaces the small, medium,
/// and large component shape categories from Material 2. These tokens can be
/// applied to components to affect their border rounding.
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
@immutable
abstract class M3BorderRadius {
  /// No border radius (0dp).
  static const BorderRadius none = BorderRadius.all(M3Radius.none);

  /// Extra small border radius (4dp).
  static const BorderRadius extraSmall = BorderRadius.all(M3Radius.extraSmall);

  /// Small border radius (8dp).
  static const BorderRadius small = BorderRadius.all(M3Radius.small);

  /// Medium border radius (12dp).
  static const BorderRadius medium = BorderRadius.all(M3Radius.medium);

  /// Large border radius (16dp).
  static const BorderRadius large = BorderRadius.all(M3Radius.large);

  /// Large increased border radius (20dp).
  static const BorderRadius largeIncreased =
      BorderRadius.all(M3Radius.largeIncreased);

  /// Extra large border radius (28dp).
  static const BorderRadius extraLarge = BorderRadius.all(M3Radius.extraLarge);

  /// Extra large increased border radius (32dp).
  static const BorderRadius extraLargeIncreased =
      BorderRadius.all(M3Radius.extraLargeIncreased);

  /// Extra extra large border radius (48dp).
  static const BorderRadius extraExtraLarge =
      BorderRadius.all(M3Radius.extraExtraLarge);

  /// Full border radius, used for creating pill shapes.
  ///
  /// In Flutter, this is often achieved by using `StadiumBorder` or a `CircleBorder`,
  /// but a large numerical value can be used in `BorderRadius` to ensure the
  /// corners are fully rounded for most container sizes.
  static const BorderRadius full = BorderRadius.all(M3Radius.full);
}

/// Defines the corner radius values for shape tokens according to Material Design 3.
///
/// Shape is a token category in Material 3 that replaces the small, medium,
/// and large component shape categories from Material 2. These tokens can be
/// applied to components to affect their corner rounding.
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
@immutable
abstract class M3Radius {
  /// No corner radius (0dp).
  static const Radius none = Radius.circular(0);

  /// Extra small corner radius (4dp).
  static const Radius extraSmall = Radius.circular(4);

  /// Small corner radius (8dp).
  static const Radius small = Radius.circular(8);

  /// Medium corner radius (12dp).
  static const Radius medium = Radius.circular(12);

  /// Large corner radius (16dp).
  static const Radius large = Radius.circular(16);

  /// Large increased corner radius (20dp).
  static const Radius largeIncreased = Radius.circular(20);

  /// Extra large corner radius (28dp).
  static const Radius extraLarge = Radius.circular(28);

  /// Extra large increased corner radius (32dp).
  static const Radius extraLargeIncreased = Radius.circular(32);

  /// Extra extra large corner radius (48dp).
  static const Radius extraExtraLarge = Radius.circular(48);

  /// Full corner radius, used for creating pill shapes.
  ///
  /// In Flutter, this is often achieved by using `StadiumBorder` or a `CircleBorder`,
  /// but a large numerical value can be used in `BorderRadius` to ensure the
  /// corners are fully rounded for most container sizes.
  static const Radius full = Radius.circular(9999);
}
