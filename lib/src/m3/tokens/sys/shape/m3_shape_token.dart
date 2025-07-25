import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

const Radius _none = Radius.zero;
const _extraSmall = Radius.circular(4);
const _small = Radius.circular(8);
const _medium = Radius.circular(12);
const _large = Radius.circular(16);
const _largeIncreased = Radius.circular(20);
const _extraLarge = Radius.circular(28);
const _extraLargeIncreased = Radius.circular(32);
const _extraExtraLarge = Radius.circular(48);
const _full = Radius.circular(9999);

/// Defines the corner radius values (`Radius`) for shape tokens according to Material Design 3.
///
/// Shape is a token category in Material 3 that replaces the small, medium,
/// and large component shape categories from Material 2. These tokens can be
/// applied to components to affect their corner rounding.
///
/// This is the most granular level of shape tokens.
///
/// ### Usage:
/// `final myRadius = M3Radius.medium.value; // Returns a Radius.circular(12)`
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
enum M3RadiusToken implements IM3Token<Radius> {
  /// No corner radius (0dp).
  none(_none),

  /// Extra small corner radius (4dp).
  extraSmall(_extraSmall),

  /// Small corner radius (8dp).
  small(_small),

  /// Medium corner radius (12dp).
  medium(_medium),

  /// Large corner radius (16dp).
  large(_large),

  /// Large increased corner radius (20dp).
  largeIncreased(_largeIncreased),

  /// Extra large corner radius (28dp).
  extraLarge(_extraLarge),

  /// Extra large increased corner radius (32dp).
  extraLargeIncreased(_extraLargeIncreased),

  /// Extra extra large corner radius (48dp).
  extraExtraLarge(_extraExtraLarge),

  /// Full corner radius, used for creating pill shapes.
  full(_full);

  const M3RadiusToken(this.value);

  /// The final `Radius` object.
  @override
  final Radius value;
}

/// Defines the border radius values (`BorderRadius`) for shape tokens according to Material Design 3.
///
/// This enum uses [M3RadiusToken] tokens to build `BorderRadius` objects, which
/// can be applied to components to affect their border rounding.
///
/// ### Usage:
/// `final myBorderRadius = M3BorderRadii.large.value;`
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
enum M3BorderRadiusToken implements IM3Token<BorderRadius> {
  /// No border radius (0dp).
  none(BorderRadius.zero),

  /// Extra small border radius (4dp).
  extraSmall(BorderRadius.all(_extraSmall)),

  /// Small border radius (8dp).
  small(BorderRadius.all(_small)),

  /// Medium border radius (12dp).
  medium(BorderRadius.all(_medium)),

  /// Large border radius (16dp).
  large(BorderRadius.all(_large)),

  /// Large increased border radius (20dp).
  largeIncreased(BorderRadius.all(_largeIncreased)),

  /// Extra large border radius (28dp).
  extraLarge(BorderRadius.all(_extraLarge)),

  /// Extra large increased border radius (32dp).
  extraLargeIncreased(BorderRadius.all(_extraLargeIncreased)),

  /// Extra extra large border radius (48dp).
  extraExtraLarge(BorderRadius.all(_extraExtraLarge)),

  /// Full border radius, used for creating pill shapes.
  full(BorderRadius.all(_full));

  const M3BorderRadiusToken(this.value);

  /// The final `BorderRadius` object.
  @override
  final BorderRadius value;
}

/// Provides pre-defined, Material 3-compliant shape tokens (`ShapeBorder`).
///
/// These tokens make it easy to apply consistent corner rounding to Flutter
/// widgets like [Card], [InkWell], and `Container` decorations. Using these
/// shape tokens helps maintain a consistent visual language across the application.
///
/// This is the highest-level token, ready to be used in widget properties.
///
/// ### Usage:
/// ```dart
/// Container(
///   decoration: ShapeDecoration(
///     shape: M3Shapes.medium.value, // Returns a RoundedRectangleBorder
///   ),
/// )
/// ```
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
enum M3ShapeToken implements IM3Token<RoundedRectangleBorder> {
  /// A shape with no corner rounding (0dp).
  none(RoundedRectangleBorder()),

  /// A shape with extra-small corner rounding (4dp).
  extraSmall(
      RoundedRectangleBorder(borderRadius: BorderRadius.all(_extraSmall))),

  /// A shape with small corner rounding (8dp).
  small(RoundedRectangleBorder(borderRadius: BorderRadius.all(_small))),

  /// A shape with medium corner rounding (12dp).
  medium(RoundedRectangleBorder(borderRadius: BorderRadius.all(_medium))),

  /// A shape with large corner rounding (16dp).
  large(RoundedRectangleBorder(borderRadius: BorderRadius.all(_large))),

  /// A shape with an increased large corner rounding (e.g., 20dp).
  largeIncreased(
      RoundedRectangleBorder(borderRadius: BorderRadius.all(_largeIncreased))),

  /// A shape with extra-large corner rounding (28dp).
  extraLarge(
      RoundedRectangleBorder(borderRadius: BorderRadius.all(_extraLarge))),

  /// A shape with an increased extra-large corner rounding (e.g., 32dp).
  extraLargeIncreased(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(_extraLargeIncreased))),

  /// A shape with an extra-extra-large corner rounding (e.g., 48dp).
  extraExtraLarge(
      RoundedRectangleBorder(borderRadius: BorderRadius.all(_extraExtraLarge))),

  /// A fully rounded shape, creating a pill or circular form.
  ///
  /// This is equivalent to using a `StadiumBorder`.
  full(RoundedRectangleBorder(borderRadius: BorderRadius.all(_full)));

  const M3ShapeToken(this.value);

  /// The final `ShapeBorder` object.
  @override
  final RoundedRectangleBorder value;
}
