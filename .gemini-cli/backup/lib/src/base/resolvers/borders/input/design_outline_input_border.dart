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
class DesignOutlineInputBorder {
  /// Creates a rounded rectangle border.
  const DesignOutlineInputBorder({
    this.borderSide = BorderSide.none,
    this.borderRadius = DesignBorderRadius.none,
    this.gapPadding = 4.0,
  });

  /// The border outline's color and weight.
  ///
  /// If [borderSide] is [BorderSide.none], which is the default, an outline is not drawn.
  /// Otherwise the outline is centered over the shape's boundary.
  final BorderSide borderSide;

  /// The radii for each corner.
  final DesignBorderRadius borderRadius;

  /// Additional padding inserted at the gap of a floating label.
  final double gapPadding;

  /// Returns a copy of this DesignOutlineInputBorder with the given fields
  /// replaced with the new values.
  DesignOutlineInputBorder copyWith({
    BorderSide? borderSide,
    DesignBorderRadius? borderRadius,
  }) {
    return DesignOutlineInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Converts an [DesignOutlineInputBorder] into an [OutlineInputBorder].
  ///
  /// Returns an [OutlineInputBorder] with the same [borderSide] and
  /// [borderRadius] configuration.
  OutlineInputBorder toOutline(RadiusTokens radiiTokens) {
    return OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: borderRadius.toBorderRadius(radiiTokens),
      gapPadding: gapPadding,
    );
  }
}
