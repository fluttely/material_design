part of '../../expressive.dart';

/// An [OutlinedBorder] that renders an [M3ERoundedPolygon], so the 35-shape
/// Material Expressive library can be handed to any Flutter API that takes a
/// shape.
///
/// Until now the shape engine only produced a [Path], which meant a
/// [CustomPainter] and no interaction with `Card`, `Material`, `InkWell`,
/// `ShapeDecoration`, or clipping. This bridges it:
///
/// ```dart
/// Card(shape: M3EShapeBorder(M3EShapes.cookie7Sided));
///
/// Material(
///   shape: M3EShapeBorder(M3EShapes.clover4Leaf),
///   clipBehavior: Clip.antiAlias,
///   child: InkWell(onTap: () {}, child: content), // ripple is clipped too
/// );
/// ```
///
/// **Morphing comes for free.** Lerping between two `M3EShapeBorder`s runs the
/// real [M3EMorph] algorithm rather than crossfading two outlines, so any
/// implicit animation that lerps a shape will morph it:
///
/// ```dart
/// AnimatedContainer(
///   duration: const Duration(milliseconds: 500),
///   decoration: ShapeDecoration(
///     color: color,
///     shape: M3EShapeBorder(expanded ? M3EShapes.burst : M3EShapes.circle),
///   ),
/// );
/// ```
///
/// The polygon is fitted to the layout rect by its own bounds, so shapes that
/// are not normalised to unit space still fill the box.
///
/// Spec: https://m3.material.io/styles/shape/overview
@experimental
class M3EShapeBorder extends OutlinedBorder {
  /// Creates a border that draws [polygon].
  const M3EShapeBorder(
    this.polygon, {
    super.side = BorderSide.none,
  })  : _morphTo = null,
        _progress = 0;

  const M3EShapeBorder._morphing({
    required M3ERoundedPolygon from,
    required M3ERoundedPolygon to,
    required double progress,
    super.side,
  })  : polygon = from,
        _morphTo = to,
        _progress = progress;

  /// The shape to draw. Any [M3ERoundedPolygon] — an [M3EShapes] constant or
  /// one you built yourself.
  final M3ERoundedPolygon polygon;

  /// The shape being morphed toward, when this border is mid-lerp.
  final M3ERoundedPolygon? _morphTo;

  /// How far along the morph this border is, in 0..1.
  final double _progress;

  /// Whether this border is currently interpolating between two shapes.
  bool get isMorphing => _morphTo != null;

  /// The path this border draws, in unit space, before it is fitted to a rect.
  Path _unitPath() => _morphTo == null
      ? polygon.toPath()
      : M3EMorph(polygon, _morphTo).toPath(progress: _progress);

  /// The bounds the path occupies, used to fit it to the layout rect.
  ///
  /// A morph is bounded by the union of its two endpoints rather than by the
  /// current frame's bounds — otherwise the shape would breathe as the morph
  /// ran, because the fit would rescale on every frame. Every [M3EShapes]
  /// constant is normalised to the unit box, so in the common case the union
  /// equals both endpoints and the settled shape lines up exactly with the
  /// last morph frame.
  List<double> _sourceBounds() {
    final from = polygon.calculateBounds(approximate: false);
    if (_morphTo == null) return from;

    final to = _morphTo.calculateBounds(approximate: false);
    return <double>[
      math.min(from[0], to[0]),
      math.min(from[1], to[1]),
      math.max(from[2], to[2]),
      math.max(from[3], to[3]),
    ];
  }

  Path _pathFor(Rect rect) {
    final bounds = _sourceBounds();
    final width = bounds[2] - bounds[0];
    final height = bounds[3] - bounds[1];
    if (width <= 0 || height <= 0) return Path();

    final matrix = Matrix4.identity()
      ..translateByDouble(rect.left, rect.top, 0, 1)
      ..scaleByDouble(rect.width / width, rect.height / height, 1, 1)
      ..translateByDouble(-bounds[0], -bounds[1], 0, 1);

    return _unitPath().transform(matrix.storage);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      _pathFor(rect);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      _pathFor(rect.deflate(side.strokeInset));

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == BorderStyle.none) return;
    canvas.drawPath(
      _pathFor(rect.deflate(side.strokeOffset / 2)),
      side.toPaint(),
    );
  }

  @override
  M3EShapeBorder copyWith({BorderSide? side}) => _morphTo == null
      ? M3EShapeBorder(polygon, side: side ?? this.side)
      : M3EShapeBorder._morphing(
          from: polygon,
          to: _morphTo,
          progress: _progress,
          side: side ?? this.side,
        );

  @override
  ShapeBorder scale(double t) => copyWith(side: side.scale(t));

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.strokeInset);

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is M3EShapeBorder) return _lerp(a, this, t);
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is M3EShapeBorder) return _lerp(this, b, t);
    return super.lerpTo(b, t);
  }

  /// Interpolates two shape borders by morphing their polygons.
  ///
  /// Endpoints are returned as plain (non-morphing) borders so a settled
  /// animation does not keep paying for morph setup on every paint.
  // Static rather than a constructor, matching ShapeBorder.lerp.
  // ignore: prefer_constructors_over_static_methods
  static M3EShapeBorder _lerp(
    M3EShapeBorder from,
    M3EShapeBorder to,
    double t,
  ) {
    final side = BorderSide.lerp(from.side, to.side, t);
    if (t <= 0) return from.copyWith(side: side);
    if (t >= 1) return to.copyWith(side: side);
    return M3EShapeBorder._morphing(
      from: from.polygon,
      to: to.polygon,
      progress: t,
      side: side,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is M3EShapeBorder &&
      other.polygon == polygon &&
      other._morphTo == _morphTo &&
      other._progress == _progress &&
      other.side == side;

  @override
  int get hashCode => Object.hash(polygon, _morphTo, _progress, side);

  @override
  String toString() => isMorphing
      ? 'M3EShapeBorder.morphing($polygon → $_morphTo, $_progress)'
      : 'M3EShapeBorder($polygon)';
}

/// Morphs between two Material Expressive shapes whenever [shape] changes.
///
/// A thin implicit-animation wrapper: it holds the shape as state and animates
/// through [M3EShapeBorder]'s morphing lerp. Reach for it when you want the
/// shape itself to animate and nothing else; if you are already animating a
/// container, pass an [M3EShapeBorder] to that container's `shape` instead and
/// get the morph for free.
///
/// ```dart
/// M3EShapeMorph(
///   shape: isPlaying ? M3EShapes.pill : M3EShapes.circle,
///   color: colorScheme.primaryContainer,
///   duration: M3Motion.emphasized.duration,
///   child: const Icon(Icons.play_arrow),
/// )
/// ```
@experimental
class M3EShapeMorph extends StatelessWidget {
  /// Creates a shape that morphs when [shape] changes.
  const M3EShapeMorph({
    required this.shape,
    super.key,
    this.child,
    this.color,
    this.side = BorderSide.none,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOutCubicEmphasized,
    this.clipBehavior = Clip.antiAlias,
  });

  /// The shape to settle on. Changing it starts a morph.
  final M3ERoundedPolygon shape;

  /// Content drawn inside the shape, clipped to it.
  final Widget? child;

  /// Fill color.
  final Color? color;

  /// Outline.
  final BorderSide side;

  /// How long the morph takes.
  final Duration duration;

  /// Easing for the morph.
  final Curve curve;

  /// How the child is clipped to the shape.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      clipBehavior: clipBehavior,
      decoration: ShapeDecoration(
        color: color ?? Colors.transparent,
        shape: M3EShapeBorder(shape, side: side),
      ),
      child: child,
    );
  }
}
