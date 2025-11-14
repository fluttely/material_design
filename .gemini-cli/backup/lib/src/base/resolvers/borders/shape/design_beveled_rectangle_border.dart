part of '../../resolvers.dart';

/// A rectangular border with beveled corners.
///
/// Typically used with [ShapeDecoration] to draw a box with a beveled
/// rectangle.
///
/// This shape can interpolate to and from [CircleBorder].
///
/// See also:
///
///  * [BorderSide], which is used to describe each side of the box.
///  * [Border], which, when used with [BoxDecoration], can also
///    describe a beveled rectangle.
class DesignBeveledRectangleBorder {
  /// Creates a beveled rectangle border.
  const DesignBeveledRectangleBorder({
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

  /// Returns a copy of this DesignBeveledRectangleBorder with the given fields
  /// replaced with the new values.
  DesignBeveledRectangleBorder copyWith({
    BorderSide? borderSide,
    DesignBorderRadius? borderRadius,
  }) {
    return DesignBeveledRectangleBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Converts an [DesignBeveledRectangleBorder] into a [BeveledRectangleBorder].
  ///
  /// Returns a [BeveledRectangleBorder] with the same [borderSide] and
  /// [borderRadius] configuration.
  BeveledRectangleBorder toBeveledRectangleBorder(RadiusTokens radiiTokens) {
    return BeveledRectangleBorder(
      side: borderSide,
      borderRadius: borderRadius.toBorderRadius(radiiTokens),
    );
  }
}
