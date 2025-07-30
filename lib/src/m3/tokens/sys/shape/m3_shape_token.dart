part of '../../../../../material_design.dart';

const double _kM3RadiusNoneValue = 0;
const double _kM3RadiusExtraSmallValue = 4;
const double _kM3RadiusSmallValue = 8;
const double _kM3RadiusMediumValue = 12;
const double _kM3RadiusLargeValue = 16;
const double _kM3RadiusLargeIncreasedValue = 20;
const double _kM3RadiusExtraLargeValue = 28;
const double _kM3RadiusExtraLargeIncreasedValue = 32;
const double _kM3RadiusExtraExtraLargeValue = 48;
const double _kM3RadiusFullValue = 9999;

abstract final class M3Radii {
  const M3Radii._();

  static const Radius none = Radius.zero;
  static const extraSmall = Radius.circular(_kM3RadiusExtraSmallValue);
  static const small = Radius.circular(_kM3RadiusSmallValue);
  static const medium = Radius.circular(_kM3RadiusMediumValue);
  static const large = Radius.circular(_kM3RadiusLargeValue);
  static const largeIncreased = Radius.circular(_kM3RadiusLargeIncreasedValue);
  static const extraLarge = Radius.circular(_kM3RadiusExtraLargeValue);
  static const extraLargeIncreased =
      Radius.circular(_kM3RadiusExtraLargeIncreasedValue);
  static const extraExtraLarge =
      Radius.circular(_kM3RadiusExtraExtraLargeValue);
  static const full = Radius.circular(_kM3RadiusFullValue);
}

abstract final class M3BorderRadii {
  const M3BorderRadii._();

  static const BorderRadius radiusNone = BorderRadius.zero;
  static const extraSmall = BorderRadius.all(M3Radii.extraSmall);
  static const small = BorderRadius.all(M3Radii.small);
  static const medium = BorderRadius.all(M3Radii.medium);
  static const large = BorderRadius.all(M3Radii.large);
  static const largeIncreased = BorderRadius.all(M3Radii.largeIncreased);
  static const extraLarge = BorderRadius.all(M3Radii.extraLarge);
  static const extraLargeIncreased =
      BorderRadius.all(M3Radii.extraLargeIncreased);
  static const extraExtraLarge = BorderRadius.all(M3Radii.extraExtraLarge);
  static const full = BorderRadius.all(M3Radii.full);
}

abstract final class M3Shapes {
  const M3Shapes._();

  static const none = RoundedRectangleBorder();
  static const extraSmall =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.extraSmall);
  static const small =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.small);
  static const medium =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.medium);
  static const large =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.large);
  static const largeIncreased =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.largeIncreased);
  static const extraLarge =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.extraLarge);
  static const extraLargeIncreased =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.extraLargeIncreased);
  static const extraExtraLarge =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.extraExtraLarge);
  static const full = RoundedRectangleBorder(borderRadius: M3BorderRadii.full);
}

/// Defines the corner radius values (`Radius`) for shape tokens according to
/// Material Design 3.
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
  none(M3Radii.none),

  /// Extra small corner radius (4dp).
  extraSmall(M3Radii.extraSmall),

  /// Small corner radius (8dp).
  small(M3Radii.small),

  /// Medium corner radius (12dp).
  medium(M3Radii.medium),

  /// Large corner radius (16dp).
  large(M3Radii.large),

  /// Large increased corner radius (20dp).
  largeIncreased(M3Radii.largeIncreased),

  /// Extra large corner radius (28dp).
  extraLarge(M3Radii.extraLarge),

  /// Extra large increased corner radius (32dp).
  extraLargeIncreased(M3Radii.extraLargeIncreased),

  /// Extra extra large corner radius (48dp).
  extraExtraLarge(M3Radii.extraExtraLarge),

  /// Full corner radius, used for creating pill shapes.
  full(M3Radii.full);

  const M3RadiusToken(this.value);

  /// The final `Radius` object.
  @override
  final Radius value;

  /// The raw radius value in dp.
  double get dp => value.x;
}

/// Defines the border radius values (`BorderRadius`) for shape tokens
/// according to Material Design 3.
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
  none(M3BorderRadii.radiusNone),

  /// Extra small border radius (4dp).
  extraSmall(M3BorderRadii.extraSmall),

  /// Small border radius (8dp).
  small(M3BorderRadii.small),

  /// Medium border radius (12dp).
  medium(M3BorderRadii.medium),

  /// Large border radius (16dp).
  large(M3BorderRadii.large),

  /// Large increased border radius (20dp).
  largeIncreased(M3BorderRadii.largeIncreased),

  /// Extra large border radius (28dp).
  extraLarge(M3BorderRadii.extraLarge),

  /// Extra large increased border radius (32dp).
  extraLargeIncreased(M3BorderRadii.extraLargeIncreased),

  /// Extra extra large border radius (48dp).
  extraExtraLarge(M3BorderRadii.extraExtraLarge),

  /// Full border radius, used for creating pill shapes.
  full(M3BorderRadii.full);

  const M3BorderRadiusToken(this.value);

  /// The final `BorderRadius` object.
  @override
  final BorderRadius value;

  /// Returns the corresponding [M3RadiusToken] for this border radius.
  ///
  /// This getter provides access to the underlying radius token, allowing
  /// for consistent radius values across different shape abstractions.
  ///
  /// Example:
  /// ```dart
  /// final radius = M3BorderRadiusToken.medium.borderRadius.radius.value; // Returns M3RadiusToken.medium
  /// ```
  M3RadiusToken get radius {
    return switch (this) {
      M3BorderRadiusToken.none => M3RadiusToken.none,
      M3BorderRadiusToken.extraSmall => M3RadiusToken.extraSmall,
      M3BorderRadiusToken.small => M3RadiusToken.small,
      M3BorderRadiusToken.medium => M3RadiusToken.medium,
      M3BorderRadiusToken.large => M3RadiusToken.large,
      M3BorderRadiusToken.largeIncreased => M3RadiusToken.largeIncreased,
      M3BorderRadiusToken.extraLarge => M3RadiusToken.extraLarge,
      M3BorderRadiusToken.extraLargeIncreased =>
        M3RadiusToken.extraLargeIncreased,
      M3BorderRadiusToken.extraExtraLarge => M3RadiusToken.extraExtraLarge,
      M3BorderRadiusToken.full => M3RadiusToken.full,
    };
  }
}

/// Provides pre-defined, Material 3-compliant shape tokens (`ShapeBorder`).
///
/// These tokens make it easy to apply consistent corner rounding to Flutter
/// widgets like [Card], [InkWell], and `Container` decorations. Using these
/// shape tokens helps maintain a consistent visual language across the
/// application.
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
  none(M3Shapes.none),

  /// A shape with extra-small corner rounding (4dp).
  extraSmall(M3Shapes.extraSmall),

  /// A shape with small corner rounding (8dp).
  small(M3Shapes.small),

  /// A shape with medium corner rounding (12dp).
  medium(M3Shapes.medium),

  /// A shape with large corner rounding (16dp).
  large(M3Shapes.large),

  /// A shape with an increased large corner rounding (e.g., 20dp).
  largeIncreased(M3Shapes.largeIncreased),

  /// A shape with extra-large corner rounding (28dp).
  extraLarge(M3Shapes.extraLarge),

  /// A shape with an increased extra-large corner rounding (e.g., 32dp).
  extraLargeIncreased(M3Shapes.extraLargeIncreased),

  /// A shape with an extra-extra-large corner rounding (e.g., 48dp).
  extraExtraLarge(M3Shapes.extraExtraLarge),

  /// A fully rounded shape, creating a pill or circular form.
  ///
  /// This is equivalent to using a `StadiumBorder`.
  full(M3Shapes.full);

  const M3ShapeToken(this.value);

  /// The final `ShapeBorder` object.
  @override
  final RoundedRectangleBorder value;

  /// Returns the corresponding [M3BorderRadiusToken] for this shape.
  ///
  /// This getter provides access to the underlying border radius token,
  /// allowing for consistent border radius values across different shape
  /// abstractions.
  ///
  /// Example:
  /// ```dart
  /// final borderRadius = M3ShapeToken.medium; // Returns M3BorderRadiusToken.medium
  /// ```
  M3BorderRadiusToken get borderRadius {
    return switch (this) {
      M3ShapeToken.none => M3BorderRadiusToken.none,
      M3ShapeToken.extraSmall => M3BorderRadiusToken.extraSmall,
      M3ShapeToken.small => M3BorderRadiusToken.small,
      M3ShapeToken.medium => M3BorderRadiusToken.medium,
      M3ShapeToken.large => M3BorderRadiusToken.large,
      M3ShapeToken.largeIncreased => M3BorderRadiusToken.largeIncreased,
      M3ShapeToken.extraLarge => M3BorderRadiusToken.extraLarge,
      M3ShapeToken.extraLargeIncreased =>
        M3BorderRadiusToken.extraLargeIncreased,
      M3ShapeToken.extraExtraLarge => M3BorderRadiusToken.extraExtraLarge,
      M3ShapeToken.full => M3BorderRadiusToken.full,
    };
  }

  // /// Returns the appropriate shape token for a given component size.
  // ///
  // /// This helper method suggests shape tokens based on common
  // /// Material Design 3 patterns.
  // static M3ShapeToken forComponentSize(ComponentSize size) {
  //   return switch (size) {
  //     ComponentSize.small => M3ShapeToken.small,
  //     ComponentSize.medium => M3ShapeToken.medium,
  //     ComponentSize.large => M3ShapeToken.large,
  //   };
  // }

  // /// Returns the shape token typically used for a component type.
  // ///
  // /// Based on Material Design 3 component specifications.
  // static M3ShapeToken forComponent(M3Component component) {
  //   return switch (component) {
  //     M3Component.button => M3ShapeToken.small,
  //     M3Component.fab => M3ShapeToken.full,
  //     M3Component.chip => M3ShapeToken.extraSmall,
  //     M3Component.card => M3ShapeToken.medium,
  //     M3Component.dialog => M3ShapeToken.large,
  //     M3Component.sheet => M3ShapeToken.extraLarge,
  //     M3Component.textField => M3ShapeToken.small,
  //     M3Component.menu => M3ShapeToken.medium,
  //     _ => M3ShapeToken.medium,
  //   };
  // }
}

// /// Component size categories for shape selection.
// enum ComponentSize {
//   /// Small component size.
//   small,

//   /// Medium component size.
//   medium,

//   /// Large component size.
//   large
// }

// /// Material Design 3 component types.
// enum M3Component {
//   /// Button component.
//   button,

//   /// Floating action button component.
//   fab,

//   /// Chip component.
//   chip,

//   /// Card component.
//   card,

//   /// Dialog component.
//   dialog,

//   /// Sheet component.
//   sheet,

//   /// Text field component.
//   textField,

//   /// Menu component.
//   menu,

//   /// Navigation bar component.
//   navigationBar,

//   /// Navigation rail component.
//   navigationRail,

//   /// Other component type.
//   other,
// }

// /// Extension methods for shape-related functionality.
// extension M3ShapeExtensions on Widget {
//   /// Wraps this widget with a shaped container using the specified token.
//   Widget withShape(M3ShapeToken shape, {Color? color}) {
//     return Container(
//       decoration: ShapeDecoration(
//         shape: shape.value,
//         color: color,
//       ),
//       child: this,
//     );
//   }

//   /// Clips this widget with the specified shape token.
//   Widget clipWithShape(M3ShapeToken shape) {
//     return ClipRRect(
//       borderRadius: shape.borderRadius.value,
//       child: this,
//     );
//   }
// }
