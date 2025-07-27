part of '../../../../../material_design.dart';

// const double _kM3RadiusNoneValue = 0;
const double _kM3RadiusExtraSmallValue = 4;
const double _kM3RadiusSmallValue = 8;
const double _kM3RadiusMediumValue = 12;
const double _kM3RadiusLargeValue = 16;
const double _kM3RadiusLargeIncreasedValue = 20;
const double _kM3RadiusExtraLargeValue = 28;
const double _kM3RadiusExtraLargeIncreasedValue = 32;
const double _kM3RadiusExtraExtraLargeValue = 48;
const double _kM3RadiusFullValue = 9999;

const Radius _kM3RadiusNone = Radius.zero;
const _kM3RadiusExtraSmall = Radius.circular(_kM3RadiusExtraSmallValue);
const _kM3RadiusSmall = Radius.circular(_kM3RadiusSmallValue);
const _kM3RadiusMedium = Radius.circular(_kM3RadiusMediumValue);
const _kM3RadiusLarge = Radius.circular(_kM3RadiusLargeValue);
const _kM3RadiusLargeIncreased = Radius.circular(_kM3RadiusLargeIncreasedValue);
const _kM3RadiusExtraLarge = Radius.circular(_kM3RadiusExtraLargeValue);
const _kM3RadiusExtraLargeIncreased =
    Radius.circular(_kM3RadiusExtraLargeIncreasedValue);
const _kM3RadiusExtraExtraLarge =
    Radius.circular(_kM3RadiusExtraExtraLargeValue);
const _kM3RadiusFull = Radius.circular(_kM3RadiusFullValue);

const BorderRadius _kM3BorderRadiusNone = BorderRadius.zero;
const _kM3BorderRadiusExtraSmall = BorderRadius.all(_kM3RadiusExtraSmall);
const _kM3BorderRadiusSmall = BorderRadius.all(_kM3RadiusSmall);
const _kM3BorderRadiusMedium = BorderRadius.all(_kM3RadiusMedium);
const _kM3BorderRadiusLarge = BorderRadius.all(_kM3RadiusLarge);
const _kM3BorderRadiusLargeIncreased =
    BorderRadius.all(_kM3RadiusLargeIncreased);
const _kM3BorderRadiusExtraLarge = BorderRadius.all(_kM3RadiusExtraLarge);
const _kM3BorderRadiusExtraLargeIncreased =
    BorderRadius.all(_kM3RadiusExtraLargeIncreased);
const _kM3BorderRadiusExtraExtraLarge =
    BorderRadius.all(_kM3RadiusExtraExtraLarge);
const _kM3BorderRadiusFull = BorderRadius.all(_kM3RadiusFull);

const _kM3ShapeNone = RoundedRectangleBorder();
const _kM3ShapeExtraSmall =
    RoundedRectangleBorder(borderRadius: _kM3BorderRadiusExtraSmall);
const _kM3ShapeSmall =
    RoundedRectangleBorder(borderRadius: _kM3BorderRadiusSmall);
const _kM3ShapeMedium =
    RoundedRectangleBorder(borderRadius: _kM3BorderRadiusMedium);
const _kM3ShapeLarge =
    RoundedRectangleBorder(borderRadius: _kM3BorderRadiusLarge);
const _kM3ShapeLargeIncreased =
    RoundedRectangleBorder(borderRadius: _kM3BorderRadiusLargeIncreased);
const _kM3ShapeExtraLarge =
    RoundedRectangleBorder(borderRadius: _kM3BorderRadiusExtraLarge);
const _kM3ShapeExtraLargeIncreased =
    RoundedRectangleBorder(borderRadius: _kM3BorderRadiusExtraLargeIncreased);
const _kM3ShapeExtraExtraLarge =
    RoundedRectangleBorder(borderRadius: _kM3BorderRadiusExtraExtraLarge);
const _kM3ShapeFull =
    RoundedRectangleBorder(borderRadius: _kM3BorderRadiusFull);

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
enum _M3RadiusToken implements IM3Token<Radius> {
  /// No corner radius (0dp).
  none(_kM3RadiusNone),

  /// Extra small corner radius (4dp).
  extraSmall(_kM3RadiusExtraSmall),

  /// Small corner radius (8dp).
  small(_kM3RadiusSmall),

  /// Medium corner radius (12dp).
  medium(_kM3RadiusMedium),

  /// Large corner radius (16dp).
  large(_kM3RadiusLarge),

  /// Large increased corner radius (20dp).
  largeIncreased(_kM3RadiusLargeIncreased),

  /// Extra large corner radius (28dp).
  extraLarge(_kM3RadiusExtraLarge),

  /// Extra large increased corner radius (32dp).
  extraLargeIncreased(_kM3RadiusExtraLargeIncreased),

  /// Extra extra large corner radius (48dp).
  extraExtraLarge(_kM3RadiusExtraExtraLarge),

  /// Full corner radius, used for creating pill shapes.
  full(_kM3RadiusFull);

  const _M3RadiusToken(this.value);

  /// The final `Radius` object.
  @override
  final Radius value;
}

/// Defines the border radius values (`BorderRadius`) for shape tokens according to Material Design 3.
///
/// This enum uses [_M3RadiusToken] tokens to build `BorderRadius` objects, which
/// can be applied to components to affect their border rounding.
///
/// ### Usage:
/// `final myBorderRadius = M3BorderRadii.large.value;`
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
enum _M3BorderRadiusToken implements IM3Token<BorderRadius> {
  /// No border radius (0dp).
  none(_kM3BorderRadiusNone),

  /// Extra small border radius (4dp).
  extraSmall(_kM3BorderRadiusExtraSmall),

  /// Small border radius (8dp).
  small(_kM3BorderRadiusSmall),

  /// Medium border radius (12dp).
  medium(_kM3BorderRadiusMedium),

  /// Large border radius (16dp).
  large(_kM3BorderRadiusLarge),

  /// Large increased border radius (20dp).
  largeIncreased(_kM3BorderRadiusLargeIncreased),

  /// Extra large border radius (28dp).
  extraLarge(_kM3BorderRadiusExtraLarge),

  /// Extra large increased border radius (32dp).
  extraLargeIncreased(_kM3BorderRadiusExtraLargeIncreased),

  /// Extra extra large border radius (48dp).
  extraExtraLarge(_kM3BorderRadiusExtraExtraLarge),

  /// Full border radius, used for creating pill shapes.
  full(_kM3BorderRadiusFull);

  const _M3BorderRadiusToken(this.value);

  /// The final `BorderRadius` object.
  @override
  final BorderRadius value;

  /// Returns the corresponding [_M3RadiusToken] for this border radius.
  ///
  /// This getter provides access to the underlying radius token, allowing
  /// for consistent radius values across different shape abstractions.
  ///
  /// Example:
  /// ```dart
  /// final radius = M3BorderRadiusToken.medium.borderRadius.radius.value; // Returns M3RadiusToken.medium
  /// ```
  _M3RadiusToken get radius {
    return switch (this) {
      _M3BorderRadiusToken.none => _M3RadiusToken.none,
      _M3BorderRadiusToken.extraSmall => _M3RadiusToken.extraSmall,
      _M3BorderRadiusToken.small => _M3RadiusToken.small,
      _M3BorderRadiusToken.medium => _M3RadiusToken.medium,
      _M3BorderRadiusToken.large => _M3RadiusToken.large,
      _M3BorderRadiusToken.largeIncreased => _M3RadiusToken.largeIncreased,
      _M3BorderRadiusToken.extraLarge => _M3RadiusToken.extraLarge,
      _M3BorderRadiusToken.extraLargeIncreased =>
        _M3RadiusToken.extraLargeIncreased,
      _M3BorderRadiusToken.extraExtraLarge => _M3RadiusToken.extraExtraLarge,
      _M3BorderRadiusToken.full => _M3RadiusToken.full,
    };
  }
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
  none(_kM3ShapeNone),

  /// A shape with extra-small corner rounding (4dp).
  extraSmall(_kM3ShapeExtraSmall),

  /// A shape with small corner rounding (8dp).
  small(_kM3ShapeSmall),

  /// A shape with medium corner rounding (12dp).
  medium(_kM3ShapeMedium),

  /// A shape with large corner rounding (16dp).
  large(_kM3ShapeLarge),

  /// A shape with an increased large corner rounding (e.g., 20dp).
  largeIncreased(_kM3ShapeLargeIncreased),

  /// A shape with extra-large corner rounding (28dp).
  extraLarge(_kM3ShapeExtraLarge),

  /// A shape with an increased extra-large corner rounding (e.g., 32dp).
  extraLargeIncreased(_kM3ShapeExtraLargeIncreased),

  /// A shape with an extra-extra-large corner rounding (e.g., 48dp).
  extraExtraLarge(_kM3ShapeExtraExtraLarge),

  /// A fully rounded shape, creating a pill or circular form.
  ///
  /// This is equivalent to using a `StadiumBorder`.
  full(_kM3ShapeFull);

  const M3ShapeToken(this.value);

  /// The final `ShapeBorder` object.
  @override
  final RoundedRectangleBorder value;

  /// Returns the corresponding [_M3BorderRadiusToken] for this shape.
  ///
  /// This getter provides access to the underlying border radius token,
  /// allowing for consistent border radius values across different shape
  /// abstractions.
  ///
  /// Example:
  /// ```dart
  /// final borderRadius = M3ShapeToken.medium; // Returns M3BorderRadiusToken.medium
  /// ```
  _M3BorderRadiusToken get borderRadius {
    return switch (this) {
      M3ShapeToken.none => _M3BorderRadiusToken.none,
      M3ShapeToken.extraSmall => _M3BorderRadiusToken.extraSmall,
      M3ShapeToken.small => _M3BorderRadiusToken.small,
      M3ShapeToken.medium => _M3BorderRadiusToken.medium,
      M3ShapeToken.large => _M3BorderRadiusToken.large,
      M3ShapeToken.largeIncreased => _M3BorderRadiusToken.largeIncreased,
      M3ShapeToken.extraLarge => _M3BorderRadiusToken.extraLarge,
      M3ShapeToken.extraLargeIncreased =>
        _M3BorderRadiusToken.extraLargeIncreased,
      M3ShapeToken.extraExtraLarge => _M3BorderRadiusToken.extraExtraLarge,
      M3ShapeToken.full => _M3BorderRadiusToken.full,
    };
  }

  // /// Returns the corresponding [_M3RadiusToken] for this border radius.
  // ///
  // /// This getter provides access to the underlying radius token, allowing
  // /// for consistent radius values across different shape abstractions.
  // ///
  // /// Example:
  // /// ```dart
  // /// final radius = M3ShapeToken.medium.borderRadius.radius.value; // Returns M3RadiusToken.medium
  // /// ```
  // Radius get radius {
  //   return switch (this) {
  //     M3ShapeToken.none => _M3RadiusToken.none.value,
  //     M3ShapeToken.extraSmall => _M3RadiusToken.extraSmall.value,
  //     M3ShapeToken.small => _M3RadiusToken.small.value,
  //     M3ShapeToken.medium => _M3RadiusToken.medium.value,
  //     M3ShapeToken.large => _M3RadiusToken.large.value,
  //     M3ShapeToken.largeIncreased => _M3RadiusToken.largeIncreased.value,
  //     M3ShapeToken.extraLarge => _M3RadiusToken.extraLarge.value,
  //     M3ShapeToken.extraLargeIncreased =>
  //       _M3RadiusToken.extraLargeIncreased.value,
  //     M3ShapeToken.extraExtraLarge => _M3RadiusToken.extraExtraLarge.value,
  //     M3ShapeToken.full => _M3RadiusToken.full.value,
  //   };
  // }

  /// Returns the appropriate shape token for a given component size.
  ///
  /// This helper method suggests shape tokens based on common
  /// Material Design 3 patterns.
  static M3ShapeToken forComponentSize(ComponentSize size) {
    return switch (size) {
      ComponentSize.small => M3ShapeToken.small,
      ComponentSize.medium => M3ShapeToken.medium,
      ComponentSize.large => M3ShapeToken.large,
    };
  }

  /// Returns the shape token typically used for a component type.
  ///
  /// Based on Material Design 3 component specifications.
  static M3ShapeToken forComponent(M3Component component) {
    return switch (component) {
      M3Component.button => M3ShapeToken.small,
      M3Component.fab => M3ShapeToken.full,
      M3Component.chip => M3ShapeToken.extraSmall,
      M3Component.card => M3ShapeToken.medium,
      M3Component.dialog => M3ShapeToken.large,
      M3Component.sheet => M3ShapeToken.extraLarge,
      M3Component.textField => M3ShapeToken.small,
      M3Component.menu => M3ShapeToken.medium,
      _ => M3ShapeToken.medium,
    };
  }
}

/// Component size categories for shape selection.
enum ComponentSize { small, medium, large }

/// Material Design 3 component types.
enum M3Component {
  button,
  fab,
  chip,
  card,
  dialog,
  sheet,
  textField,
  menu,
  navigationBar,
  navigationRail,
  other,
}

/// Extension methods for shape-related functionality.
extension M3ShapeExtensions on Widget {
  /// Wraps this widget with a shaped container using the specified token.
  Widget withShape(M3ShapeToken shape, {Color? color}) {
    return Container(
      decoration: ShapeDecoration(
        shape: shape.value,
        color: color,
      ),
      child: this,
    );
  }

  /// Clips this widget with the specified shape token.
  Widget clipWithShape(M3ShapeToken shape) {
    return ClipRRect(
      borderRadius: shape.borderRadius.value,
      child: this,
    );
  }
}
