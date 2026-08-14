part of '../../expressive.dart';

/// Defines the amount and quality around a given vertex of a shape.
/// [radius] defines the radius of the circle which forms the basis of
/// the rounding for the vertex. [smoothing] defines the amount by which the
/// curve is extended from the circular arc around the corner to the
/// edge between vertices.
///
/// Each corner of a shape can be thought of as either:
///   1) unrounded (with a corner radius of 0 and no smoothing).
///   2) rounded with only a circular arc (with smoothing of 0). In this case,
///      the rounding around the corner follows an approximated circular arc
///      between the edges to adjacent vertices.
///   3) rounded with three curves: There is an inner circular arc and two
///      symmetric flanking curves. The flanking curves determine the curvature
///      from the inner curve to the edges, with a value of 0 (no smoothing)
///      meaning that it is purely a circular curve and a value of 1 meaning
///      that the flanking curves are maximized between the inner curve and
///      the edges.
///
/// [radius] is  a value of 0 or greater, representing the radius of the
/// circle which defines the inner rounding arc of the corner. A value of 0
/// indicates that the corner is sharp, or completely unrounded. A positive
/// value is the requested size of the radius. Note that this radius is an
/// absolute size that should relate to the overall size of its shape. Thus if
/// the shape is in screen coordinate size, the radius should be sized
/// appropriately. If the shape is in some canonical form (bounds of (-1,-1) to
/// (1,1), for example, which is the default when creating a [M3ERoundedPolygon]
/// from a number of vertices), then the radius should be relative to that
/// size. The radius will be scaled if the shape itself is transformed, since
/// it will produce curves which round the corner and thus get transformed
/// along with the overall shape.
///
/// [smoothing] is the amount by which the arc is "smoothed" by extending the
/// curve from the inner circular arc to the edge between vertices. A value of
/// 0 (no smoothing) indicates that the corner is rounded by only a circular
/// arc; there are no flanking curves. A value of 1 indicates that there is no
/// circular arc in the center; the flanking curves on either side meet at the
/// middle.
///
/// See <https://m3.material.io/styles/shape/shape-scale-tokens>.
@experimental
class M3ECornerRounding {
  /// Creates a corner rounding of [radius], optionally flanked by [smoothing].
  ///
  /// [radius] must be zero or greater and [smoothing] must be in `[0, 1]`;
  /// both are asserted in debug mode.
  const M3ECornerRounding({
    this.radius = 0,
    this.smoothing = 0,
  })  : assert(radius >= 0, 'radius has to be greater that zero'),
        assert(
          smoothing >= 0 && smoothing <= 1,
          'smoothing has to be in range [0, 1]',
        );

  /// A sharp corner: no rounding arc and no smoothing.
  ///
  /// This is the default rounding of every vertex of a [M3ERoundedPolygon],
  /// and corresponds to the `none` step of the Material shape scale. See
  /// <https://m3.material.io/styles/shape/overview>.
  static const unrounded = M3ECornerRounding();

  /// The radius of the circle whose arc rounds the corner.
  ///
  /// Expressed in the shape's own coordinate space rather than logical pixels,
  /// so it has to be sized against the shape it belongs to: a polygon built
  /// from a vertex count lives in the `(-1, -1)`–`(1, 1)` canonical square, and
  /// a radius of `0.2` there is a fifth of that half-extent. Zero leaves the
  /// corner sharp. The radius rides along with any transform applied to the
  /// shape, because it has already been baked into the corner's curves by then.
  final double radius;

  /// How far the rounding is extended past the circular arc, in `[0, 1]`.
  ///
  /// Unitless. Zero rounds the corner with the [radius] arc alone; one drops
  /// the arc entirely and lets the two flanking curves meet in the middle,
  /// producing the continuous, squircle-like corner of the Material shape
  /// system. See <https://m3.material.io/styles/shape/overview>.
  final double smoothing;
}
