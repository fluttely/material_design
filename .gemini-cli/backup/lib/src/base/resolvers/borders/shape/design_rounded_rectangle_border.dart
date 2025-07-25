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
class DesignRoundedRectangleBorder {
  /// Creates a rounded rectangle border.
  const DesignRoundedRectangleBorder({
    this.borderSide = BorderSide.none,
    this.borderRadius = DesignBorderRadius.none,
  });

  /// The border outline's color and weight.
  ///
  /// If [borderSide] is [BorderSide.none], which is the default, an outline is not drawn.
  /// Otherwise the outline is centered over the shape's boundary.
  final BorderSide borderSide;

  /// The radii for each corner.
  final DesignBorderRadius borderRadius;

  /// Returns a copy of this DesignRoundedRectangleBorder with the given fields
  /// replaced with the new values.
  DesignRoundedRectangleBorder copyWith({
    BorderSide? borderSide,
    DesignBorderRadius? borderRadius,
  }) {
    return DesignRoundedRectangleBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Converts an [DesignRoundedRectangleBorder] into a [RoundedRectangleBorder].
  ///
  /// Returns a [RoundedRectangleBorder] with the same [borderSide] and
  /// [borderRadius] configuration.
  RoundedRectangleBorder toRoundedRectangleBorder(RadiusTokens radiiTokens) {
    return RoundedRectangleBorder(
      side: borderSide,
      borderRadius: borderRadius.toBorderRadius(radiiTokens),
    );
  }
}
