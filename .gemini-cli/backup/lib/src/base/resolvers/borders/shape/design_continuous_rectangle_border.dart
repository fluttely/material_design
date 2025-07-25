part of '../../resolvers.dart';

/// A rectangular border with continuous corners.
///
/// Typically used with [ShapeDecoration] to draw a box with a continuous
/// rectangle.
///
/// This shape can interpolate to and from [CircleBorder].
///
/// See also:
///
///  * [BorderSide], which is used to describe each side of the box.
///  * [Border], which, when used with [BoxDecoration], can also
///    describe a continuous rectangle.
class DesignContinuousRectangleBorder {
  /// Creates a continuous rectangle border.
  const DesignContinuousRectangleBorder({
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

  /// Returns a copy of this DesignContinuousRectangleBorder with the given fields
  /// replaced with the new values.
  DesignContinuousRectangleBorder copyWith({
    BorderSide? borderSide,
    DesignBorderRadius? borderRadius,
  }) {
    return DesignContinuousRectangleBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Converts an [DesignContinuousRectangleBorder] into a [ContinuousRectangleBorder].
  ///
  /// Returns a [ContinuousRectangleBorder] with the same [borderSide] and
  /// [borderRadius] configuration.
  ContinuousRectangleBorder toContinuousRectangleBorder(
    RadiusTokens radiiTokens,
  ) {
    return ContinuousRectangleBorder(
      side: borderSide,
      borderRadius: borderRadius.toBorderRadius(radiiTokens),
    );
  }
}
