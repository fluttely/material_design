part of '../../expressive.dart';

/// While a polygon's shape can be drawn solely using a list of [M3ECubic] objects
/// representing its raw curves and lines, features add an extra layer of
/// context to groups of cubics. Features group cubics into (straight) edges,
/// convex corners, or concave corners. For example, rounding a rectangle adds
/// many cubics around its edges, but the rectangle's overall number of corners
/// remains the same. [M3EMorph] therefore uses this grouping for several reasons:
///   - Noise Reduction: Grouping cubics reduces the amount of noise introduced
///     by individual cubics (as seen in the rounded rectangle example).
///   - Mapping Base: The grouping serves as the base set for [M3EMorph]'s mapping
///     process.
///   - Curve Type Mapping: [M3EMorph] maps similar curve types (convex, concave)
///     together. Note that edges or features created with
///     [M3EFeature.buildIgnorableFeature] are ignored in the default mapping.
///
/// By using features, you can manipulate polygon shapes with more context and
/// control.
///
/// See <https://m3.material.io/styles/shape/shape-scale-tokens>.
@experimental
abstract class M3EFeature {
  /// Creates a [M3EFeature] with the given list of [M3ECubic] curves.
  ///
  /// This is the base constructor for all feature types. The [cubics] list
  /// must contain at least one cubic and must be continuous (each cubic's
  /// end anchor point must match the next cubic's start anchor point).
  const M3EFeature(List<M3ECubic> cubics) : _cubics = cubics;

  /// Group a list of [M3ECubic] objects to a feature that should be ignored in
  /// the default [M3EMorph] mapping. The feature can have any indentation.
  ///
  /// Sometimes, it's helpful to ignore certain features when morphing shapes.
  /// This is because only the features you mark as important will be smoothly
  /// transitioned between the start and end shapes. Additionally, the default
  /// morph algorithm will try to match convex corners to convex corners and
  /// concave to concave. Marking features as ignorable will influence this
  /// matching.
  ///
  /// For example, given a 12-pointed star, marking all concave corners as
  /// ignorable will create a [M3EMorph] that only considers the outer corners of
  /// the star. As a result, depending on the morphed to shape, the animation
  /// may have fewer intersections and rotations. Another example for the other
  /// way around is a [M3EMorph] between a pointed up triangle to a square.
  /// Marking the square's top edge as a convex corner matches it to the
  /// triangle's upper corner. Instead of moving triangle's upper corner to one
  /// of rectangle's corners, the animation now splits the triangle to match
  /// squares' outer corners.
  ///
  /// Throws [ArgumentError] for lists of empty cubics or non-continuous cubics.
  factory M3EFeature.buildIgnorableFeature(List<M3ECubic> cubics) =>
      _validated(M3EEdgeFeature(cubics));

  /// Group a [M3ECubic] object to an edge (neither inward or outward
  /// identification in a shape).
  ///
  /// Throws [ArgumentError] for lists of empty cubics or non-continuous cubics.
  factory M3EFeature.buildEdge(M3ECubic cubic) => M3EEdgeFeature([cubic]);

  /// Group a list of [M3ECubic] objects to a convex corner (outward indentation
  /// in a shape).
  ///
  /// Throws [ArgumentError] for lists of empty cubics or non-continuous cubics
  factory M3EFeature.buildConvexCorner(List<M3ECubic> cubics) =>
      _validated(M3ECornerFeature(cubics));

  /// Group a list of [M3ECubic] objects to a concave corner (inward indentation
  /// in a shape).
  ///
  /// Throws [ArgumentError] for lists of empty cubics or non-continuous cubics
  factory M3EFeature.buildConcaveCorner(List<M3ECubic> cubics) =>
      _validated(M3ECornerFeature(cubics, convex: false));

  static M3EFeature _validated(M3EFeature feature) {
    if (feature._cubics.isEmpty) {
      throw ArgumentError('Features need at least one cubic.');
    }

    if (!_isContinuous(feature)) {
      throw ArgumentError(
        'M3EFeature must be continuous, with the anchor points of all cubics '
        'matching the anchor points of the preceding and succeeding cubics',
      );
    }

    return feature;
  }

  static bool _isContinuous(M3EFeature feature) {
    var prevCubic = feature._cubics.first;
    for (var i = 1; i < feature._cubics.length; i++) {
      final cubic = feature._cubics[i];
      if ((cubic.anchor0X - prevCubic.anchor1X).abs() > _distanceEpsilon ||
          (cubic.anchor0Y - prevCubic.anchor1Y).abs() > _distanceEpsilon) {
        return false;
      }
      prevCubic = cubic;
    }
    return true;
  }

  final List<M3ECubic> _cubics;

  /// Returns unmodifiable list of [M3ECubic].
  List<M3ECubic> get cubics => UnmodifiableListView(_cubics);

  /// Whether this M3EFeature gets ignored in the M3EMorph mapping. See
  /// [M3EFeature.buildIgnorableFeature] for more details
  bool get isIgnorableFeature;

  /// Whether this M3EFeature is an Edge with no inward or outward indentation.
  bool get isEdge;

  /// Whether this M3EFeature is a corner.
  bool get isCorner;

  /// Whether this M3EFeature is a convex corner (outward indentation in a shape).
  bool get isConvexCorner;

  /// Whether this M3EFeature is a concave corner (inward indentation in a shape).
  bool get isConcaveCorner;

  /// Transforms the points in this [M3EFeature] with the given [M3EPointTransformer]
  /// and returns a new [M3EFeature].
  M3EFeature transformed(M3EPointTransformer f);

  /// Returns a new [M3EFeature] with the points that define the shape of this
  /// [M3EFeature] in reversed order.
  M3EFeature reversed();
}

/// Edges have only a list of the cubic curves which make up the edge. Edges
/// lie between corners and have no vertex or concavity; the curves are simply
/// straight lines (represented by [M3ECubic] curves).
/// A feature representing an edge of a polygon shape.
///
/// Edges have no vertex or concavity and are composed of cubic curves that
/// represent straight lines between corners. Edge features are marked as
/// ignorable in the default [M3EMorph] mapping process.
@experimental
class M3EEdgeFeature extends M3EFeature {
  /// Creates an [M3EEdgeFeature] with the given list of [M3ECubic] curves.
  ///
  /// The cubics should represent straight line segments that form the edge
  /// of a polygon between two corners.
  M3EEdgeFeature(super._cubics);

  @override
  M3EFeature transformed(M3EPointTransformer f) => M3EEdgeFeature(
        List.generate(
          _cubics.length,
          (i) => _cubics[i].transformed(f),
        ),
      );

  @override
  M3EFeature reversed() => M3EEdgeFeature(
        List.generate(
          _cubics.length,
          (i) => _cubics[_cubics.length - 1 - i].reverse(),
        ),
      );

  @override
  bool get isIgnorableFeature => true;

  @override
  bool get isEdge => true;

  @override
  bool get isCorner => false;

  @override
  bool get isConvexCorner => false;

  @override
  bool get isConcaveCorner => false;

  @override
  String toString() => 'Edge';
}

/// Corners contain the list of cubic curves which describe how the corner is
/// rounded (or not), and a flag indicating whether the corner is convex. A
/// regular polygon has all convex corners, while a star polygon generally
/// (but not necessarily) has both convex (outer) and concave (inner) corners.
/// A feature representing a corner of a polygon shape.
///
/// Corners contain cubic curves that describe how the corner is rounded
/// and include a flag indicating whether the corner is convex (outward)
/// or concave (inward). Corner features are not ignored in the default
/// [M3EMorph] mapping process.
@experimental
class M3ECornerFeature extends M3EFeature {
  /// Creates a [M3ECornerFeature] with the given list of [M3ECubic] curves.
  ///
  /// The [convex] parameter determines whether this corner bends outward
  /// (convex = true, the default) or inward (concave = false) from the shape.
  const M3ECornerFeature(super._cubics, {this.convex = true});

  /// Whether this corner is convex (outward indentation) or concave (inward).
  ///
  /// A convex corner bends outward from the shape (like the corners of a
  /// regular polygon), while a concave corner bends inward (like the inner
  /// corners of a star shape).
  final bool convex;

  @override
  M3EFeature transformed(M3EPointTransformer f) => M3ECornerFeature(
        List.generate(
          _cubics.length,
          (i) => _cubics[i].transformed(f),
        ),
        convex: convex,
      );

  @override
  M3EFeature reversed() => M3ECornerFeature(
        List.generate(
          _cubics.length,
          (i) => _cubics[_cubics.length - 1 - i].reverse(),
        ),
        // TODO: b/369320447 - Revert flag negation when [M3ERoundedPolygon]
        // ignores orientation for setting the flag.
        convex: !convex,
      );

  @override
  bool get isIgnorableFeature => false;

  @override
  bool get isEdge => false;

  @override
  bool get isCorner => true;

  @override
  bool get isConvexCorner => convex;

  @override
  bool get isConcaveCorner => !convex;

  @override
  String toString() {
    return 'Corner: cubics=${_cubics.map((c) => '[$c]').join(', ')} '
        'convex=$convex';
  }
}
