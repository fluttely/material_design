part of '../../resolvers.dart';

/// A rectangular border with rounded corners.
///
/// Typically used with [ShapeDecoration] to draw a box with a rounded
/// rectangle.
///
/// This shape can interpolate to and from [CircleBorder].
///
/// See also:
///
///  * [BorderSide], which is used to describe each side of the box.
///  * [Border], which, when used with [BoxDecoration], can also
///    describe a rounded rectangle.
class DesignUnderlineInputBorder {
  /// Creates a rounded rectangle border.
  const DesignUnderlineInputBorder({
    this.borderSide = BorderSide.none,
    this.borderRadius = DesignBorderRadius.none,
  });

  /// The border underline's color and weight.
  ///
  /// If [borderSide] is [BorderSide.none], which is the default, an underline is not drawn.
  /// Otherwise the underline is centered over the shape's boundary.
  final BorderSide borderSide;

  /// The radii for each corner.
  final DesignBorderRadius borderRadius;

  /// Returns a copy of this DesignUnderlineInputBorder with the given fields
  /// replaced with the new values.
  DesignUnderlineInputBorder copyWith({
    BorderSide? borderSide,
    DesignBorderRadius? borderRadius,
  }) {
    return DesignUnderlineInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Converts an [DesignUnderlineInputBorder] into an [UnderlineInputBorder].
  ///
  /// Returns an [UnderlineInputBorder] with the same [borderSide] and
  /// [borderRadius] configuration.
  UnderlineInputBorder toUnderline(RadiusTokens radiiTokens) {
    return UnderlineInputBorder(
      borderSide: borderSide,
      borderRadius: borderRadius.toBorderRadius(radiiTokens),
    );
  }
}
