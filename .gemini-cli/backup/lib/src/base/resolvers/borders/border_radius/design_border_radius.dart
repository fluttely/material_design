part of '../../resolvers.dart';

/// An immutable set of radii for each corner of a rectangle.
///
/// Used by [BoxDecoration] when the shape is a [BoxShape.rectangle].
///
/// The [DesignBorderRadius] class specifies offsets in terms of visual corners, e.g.
/// [topLeft]. These values are not affected by the [TextDirection]. To support
/// both left-to-right and right-to-left layouts, consider using
/// [BorderRadiusDirectional], which is expressed in terms that are relative to
/// a [TextDirection] (typically obtained from the ambient [Directionality]).
class DesignBorderRadius {
  /// Creates a border radius where all radii are [radius].
  const DesignBorderRadius.all(DesignRadius radius)
    : this.only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      );

  /// Creates a border radius where all radii are [DesignRadius.circular(radius)].
  DesignBorderRadius.circular(MaterialRadius radius)
    : this.all(
        DesignRadius.circular(radius),
      );

  /// Creates a vertically symmetric border radius where the top and bottom
  /// sides of the rectangle have the same radii.
  const DesignBorderRadius.vertical({
    DesignRadius top = DesignRadius.none,
    DesignRadius bottom = DesignRadius.none,
  }) : this.only(
         topLeft: top,
         topRight: top,
         bottomLeft: bottom,
         bottomRight: bottom,
       );

  /// Creates a horizontally symmetrical border radius where the left and right
  /// sides of the rectangle have the same radii.
  const DesignBorderRadius.horizontal({
    DesignRadius left = DesignRadius.none,
    DesignRadius right = DesignRadius.none,
  }) : this.only(
         topLeft: left,
         topRight: right,
         bottomLeft: left,
         bottomRight: right,
       );

  /// Creates a border radius with only the given non-zero values. The other
  /// corners will be right angles.
  const DesignBorderRadius.only({
    this.topLeft = DesignRadius.none,
    this.topRight = DesignRadius.none,
    this.bottomLeft = DesignRadius.none,
    this.bottomRight = DesignRadius.none,
  });

  /// The top-left [DesignRadius].
  final DesignRadius topLeft;

  /// The top-right [DesignRadius].
  final DesignRadius topRight;

  /// The bottom-left [DesignRadius].
  final DesignRadius bottomLeft;

  /// The bottom-right [DesignRadius].
  final DesignRadius bottomRight;

  /// A border radius with all none radii.
  static const DesignBorderRadius none = DesignBorderRadius.all(
    DesignRadius.none,
  );

  /// Returns a copy of this DesignBorderRadius with the given fields replaced with
  /// the new values.
  DesignBorderRadius copyWith({
    DesignRadius? topLeft,
    DesignRadius? topRight,
    DesignRadius? bottomLeft,
    DesignRadius? bottomRight,
  }) {
    return DesignBorderRadius.only(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
    );
  }

  /// Converts [DesignBorderRadius] to a Flutter [BorderRadius].
  ///
  /// Otherwise, it returns a [BorderRadius.only] with the given radii for each corner.
  BorderRadius toBorderRadius(RadiusTokens radiiTokens) {
    return BorderRadius.only(
      topLeft: Radius.elliptical(
        topLeft.toRadius(radiiTokens).x,
        topLeft.toRadius(radiiTokens).y,
      ),
      topRight: Radius.elliptical(
        topRight.toRadius(radiiTokens).x,
        topRight.toRadius(radiiTokens).y,
      ),
      bottomLeft: Radius.elliptical(
        bottomLeft.toRadius(radiiTokens).x,
        bottomLeft.toRadius(radiiTokens).y,
      ),
      bottomRight: Radius.elliptical(
        bottomRight.toRadius(radiiTokens).x,
        bottomRight.toRadius(radiiTokens).y,
      ),
    );
  }
}
