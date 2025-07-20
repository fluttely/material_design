import 'package:flutter/foundation.dart';

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
  static const double none = 0;

  /// Extra small corner radius (4dp).
  static const double extraSmall = 4;

  /// Small corner radius (8dp).
  static const double small = 8;

  /// Medium corner radius (12dp).
  static const double medium = 12;

  /// Large corner radius (16dp).
  static const double large = 16;

  /// Large increased corner radius (20dp).
  static const double largeIncreased = 20;

  /// Extra large corner radius (28dp).
  static const double extraLarge = 28;

  /// Extra large increased corner radius (32dp).
  static const double extraLargeIncreased = 32;

  /// Extra extra large corner radius (48dp).
  static const double extraExtraLarge = 48;

  /// Full corner radius, used for creating pill shapes.
  ///
  /// In Flutter, this is often achieved by using `StadiumBorder` or a `CircleBorder`,
  /// but a large numerical value can be used in `BorderRadius` to ensure the
  /// corners are fully rounded for most container sizes.
  static const double full = 9999;
}
