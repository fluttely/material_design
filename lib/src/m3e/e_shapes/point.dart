part of '../../expressive.dart';

/// Maps a point to another point, as a plain `(x, y) -> (x, y)` function.
///
/// This is the transform hook of the shape engine: pass one to
/// [M3ERoundedPolygon.transformed], [M3ECubic.transformed] or
/// [M3EFeature.transformed] to scale, translate, rotate or otherwise warp a
/// shape. Any function of the right shape will do:
///
/// ```dart
/// final scaled = polygon.transformed((x, y) => (x * 2, y * 2));
///
/// final matrix = Matrix4.identity()..rotateZ(math.pi / 4);
/// final rotated = polygon.transformed((x, y) {
///   final v = matrix.transform3(Vector3(x, y, 0));
///   return (v.x, v.y);
/// });
/// ```
@experimental
typedef M3EPointTransformer = (double, double) Function(double x, double y);

/// An immutable 2D point, doubling as the vector type of the shape engine.
///
/// Deliberately separate from [Offset]: the geometry here runs in the shapes'
/// own canonical coordinate space (usually the unit square, or a circle of
/// radius 1 around the origin) rather than in logical pixels, and it needs
/// vector operations — [rotate90], [getDirection], [dotProduct],
/// [clockwise] — that [Offset] does not provide.
///
/// See <https://m3.material.io/styles/shape/shape-scale-tokens>.
@experimental
@immutable
class M3EPoint {
  /// Creates a point at ([x], [y]) in the shape's own coordinate space.
  const M3EPoint(this.x, this.y);

  /// The origin of the shape coordinate space, `(0, 0)`.
  ///
  /// Doubles as the zero vector, and is the default pivot of [rotate].
  static const zero = M3EPoint(0, 0);

  /// The horizontal coordinate, increasing to the right.
  ///
  /// Expressed in the shape's own coordinate space — for the polygons built by
  /// this module that is usually the unit square `(0, 0)`–`(1, 1)` after
  /// [M3ERoundedPolygon.normalized], or a circle of radius 1 centred on the
  /// origin before it — never logical pixels.
  final double x;

  /// The vertical coordinate, increasing downwards.
  ///
  /// Shares the coordinate space described on [x]. The downwards-positive
  /// convention matches Flutter's canvas, so a positive rotation angle turns
  /// clockwise on screen.
  final double y;

  /// Returns a point with the same coordinates as this one.
  ///
  /// [M3EPoint] is immutable, so this is only useful when porting upstream
  /// code that relies on a distinct instance.
  M3EPoint copy() => M3EPoint(x, y);

  /// Returns this vector turned a quarter turn about the origin.
  ///
  /// The turn is clockwise on screen, matching the downwards-positive [y] of
  /// the coordinate space. Used to build the corner normals that the rounding
  /// arcs are laid out along.
  M3EPoint rotate90() => M3EPoint(-y, x);

  /// Returns this point rotated by [degrees] about [center].
  ///
  /// [degrees] is measured in degrees, positive turning clockwise on screen.
  /// [center] is the pivot, in the same coordinate space as this point, and
  /// defaults to the origin.
  M3EPoint rotate(double degrees, {M3EPoint center = M3EPoint.zero}) {
    final radians = degrees * math.pi / 180;
    final off = this - center;
    final cos = math.cos(radians);
    final sin = math.sin(radians);
    return M3EPoint(
          off.x * cos - off.y * sin,
          off.x * sin + off.y * cos,
        ) +
        center;
  }

  /// Returns this point moved by [dx] horizontally and [dy] vertically.
  ///
  /// Both offsets are in the shape's coordinate space, not logical pixels.
  M3EPoint translate(double dx, double dy) => M3EPoint(x + dx, y + dy);

  /// Returns this point scaled about the origin by [sx] and [sy].
  ///
  /// Scaling is anisotropic: pass different factors to squash a shape along
  /// one axis, as the built-in oval and pill do.
  M3EPoint scale(double sx, double sy) => M3EPoint(x * sx, y * sy);

  /// The direction of this vector from the origin, in degrees.
  ///
  /// Measured counter-clockwise from the positive x-axis, in the range
  /// (-180, 180].
  double get angleDegrees => angleRadians * 180 / math.pi;

  /// The direction of this vector from the origin, in radians.
  ///
  /// Measured from the positive x-axis, growing clockwise on screen, in the
  /// range `(-pi, pi]`. Zero for the zero vector.
  double get angleRadians => math.atan2(y, x);

  /// The magnitude of the [M3EPoint], which is the distance of this point from
  /// (0, 0).
  ///
  /// If you need this value to compare it to another [M3EPoint]'s distance,
  /// consider using [getDistanceSquared] instead, since it is cheaper to
  /// compute.
  double getDistance() => math.sqrt(x * x + y * y);

  /// The square of the magnitude (which is the distance of this point from
  /// (0, 0)) of the [M3EPoint].
  ///
  /// This is cheaper than computing the [getDistance] itself.
  double getDistanceSquared() => x * x + y * y;

  /// The dot product of this vector and [other].
  ///
  /// Zero when the two are perpendicular, positive when they point the same
  /// way. The shape engine uses the sign to tell whether a corner's rounding
  /// arc runs with or against an edge.
  double dotProduct(M3EPoint other) => x * other.x + y * other.y;

  /// The dot product of this vector and the vector ([otherX], [otherY]).
  ///
  /// Same result as [dotProduct], without allocating a [M3EPoint] for the
  /// operand — it is called from the inner loops of the morph.
  double dotProductXY(double otherX, double otherY) => x * otherX + y * otherY;

  /// Compute the Z coordinate of the cross product of two vectors, to check
  /// if the second vector is going clockwise ( > 0 ) or counterclockwise
  /// (< 0) compared with the first one. It could also be 0, if the vectors
  /// are co-linear.
  bool clockwise(M3EPoint other) => (x * other.y - y * other.x) > 0;

  /// Returns this vector normalized to unit length.
  ///
  /// Asserts in debug mode if this is the zero vector, which has no direction.
  M3EPoint getDirection() {
    final d = getDistance();
    assert(d > 0, "Can't get the direction of a 0-length vector");
    return this / d;
  }

  /// Unary negation operator.
  ///
  /// Returns a [M3EPoint] with the coordinates negated.
  ///
  /// If the [M3EPoint] represents an arrow on a plane, this operator returns
  /// the same arrow but pointing in the reverse direction.
  M3EPoint operator -() => M3EPoint(-x, -y);

  /// Binary subtraction operator.
  ///
  /// Returns a M3EPoint whose [x] value is the left-hand-side operand's [x]
  /// minus the right-hand-side operand's [x] and whose [y] value is the
  /// left-hand-side operand's [y] minus the right-hand-side operand's [y].
  M3EPoint operator -(M3EPoint operand) =>
      M3EPoint(x - operand.x, y - operand.y);

  /// Binary addition operator.
  ///
  /// Returns a M3EPoint whose [x] value is the sum of the [x] values of the two
  /// operands, and whose [y] value is the sum of the [y] values of the two
  /// operands.
  M3EPoint operator +(M3EPoint operand) =>
      M3EPoint(x + operand.x, y + operand.y);

  /// Multiplication operator.
  ///
  /// Returns a M3EPoint whose coordinates are the coordinates of the
  /// left-hand-side operand (a [M3EPoint]) multiplied by the scalar
  /// right-hand-side operand (a [double]).
  M3EPoint operator *(double operand) => M3EPoint(x * operand, y * operand);

  /// Division operator.
  ///
  /// Returns a M3EPoint whose coordinates are the coordinates of the
  /// left-hand-side operand (a [M3EPoint]) divided by the scalar
  /// right-hand-side operand (a [double]).
  M3EPoint operator /(double operand) => M3EPoint(x / operand, y / operand);

  /// Modulo (remainder) operator.
  ///
  /// Returns a M3EPoint whose coordinates are the remainder of dividing the
  /// coordinates of the left-hand-side operand (a [M3EPoint]) by the scalar
  /// right-hand-side operand (a [double]).
  M3EPoint operator %(double operand) => M3EPoint(x % operand, y % operand);

  /// Returns this point mapped through [f].
  ///
  /// The result stays in whatever coordinate space [f] maps into; nothing here
  /// re-normalizes it. This is the per-point primitive behind
  /// [M3ECubic.transformed] and [M3ERoundedPolygon.transformed].
  M3EPoint transformed(M3EPointTransformer f) {
    final result = f(x, y);
    return M3EPoint(result.$1, result.$2);
  }

  @override
  String toString() => 'M3EPoint($x, $y)';

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }

    if (other is! M3EPoint) {
      return false;
    }

    return other.x == x && other.y == y;
  }

  @override
  int get hashCode => Object.hashAll([x, y]);
}

/// Linearly interpolate between two Points.
///
/// The [fraction] argument represents position on the timeline,
/// with 0.0 meaning that the interpolation has not started, returning
/// [start] (or something equivalent to [start]), 1.0 meaning that the
/// interpolation has finished, returning [stop] (or something equivalent to
/// [stop]), and values in between meaning that the interpolation is at the
/// relevant point on the timeline between [start] and [stop]. The
/// interpolation can be extrapolated beyond 0.0 and 1.0, so negative values
/// and values greater than 1.0 are valid (and can easily be generated by
/// curves).
M3EPoint _interpolate(M3EPoint start, M3EPoint stop, double fraction) {
  return M3EPoint(
    _lerp(start.x, stop.x, fraction),
    _lerp(start.y, stop.y, fraction),
  );
}
