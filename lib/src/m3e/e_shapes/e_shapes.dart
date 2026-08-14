part of '../../expressive.dart';

/// Material Design 3 Expressive predefined shapes collection.
///
/// Provides a comprehensive library of [M3ERoundedPolygon] shapes designed for
/// Material Design 3's expressive visual language. These shapes can be used
/// directly in components or as part of [M3EMorph] animations for smooth
/// transitions between different forms.
///
/// ## Shape Categories
///
/// ### Basic Geometric Shapes
/// - [circle], [square], [triangle], [diamond], [oval]
/// - [rectangle], [pentagon], [arch], [semiCircle]
///
/// ### Expressive & Organic Shapes
/// - [heart], [flower], [ghostish], [bun]
/// - [arrow], [fan], [gem], [pill]
///
/// ### Cookie & Star Variations
/// - [cookie4Sided], [cookie6Sided], [cookie7Sided]
/// - [cookie9Sided], [cookie12Sided]
/// - [sunny], [verySunny], [burst], [softBurst]
/// - [boom], [softBoom]
///
/// ### Clover & Nature Patterns
/// - [clover4Leaf], [clover8Leaf]
/// - [puffy], [puffyDiamond]
///
/// ### Pixel & Digital Aesthetics
/// - [pixelCircle], [pixelTriangle]
///
/// ## Normalization
///
/// All shapes are normalized to fit within a unit coordinate space (0.0 to 1.0)
/// for consistent sizing and positioning across different contexts.
///
/// ## Usage Examples
///
/// ```dart
/// // Using individual shapes
/// final shape = M3EShapes.heart;
/// final path = shape.toPath();
///
/// // Creating morphing animations
/// final morph = M3EMorph(
///   M3EShapes.circle,
///   M3EShapes.heart,
/// );
///
/// // Accessing all shapes
/// for (final shape in M3EShapes.all) {
///   // Process each predefined shape
/// }
/// ```
///
/// ## References
///
/// This is the official Material Expressive shape library: all 35 shapes of
/// the published set, in the spec's own geometry, normalized to the unit
/// square.
///
/// * <https://m3.material.io/styles/shape/shape-scale-tokens>, the shape spec.
/// * <https://developer.android.com/images/reference/androidx/compose/material3/shapes.png>,
///   the reference sheet the geometry is taken from.
///
/// See also:
///
/// * [M3ERoundedPolygon], for the underlying shape implementation
/// * [M3EMorph], for shape transition animations
/// * [M3ELoadingIndicator], for practical usage examples
@experimental
abstract final class M3EShapes {
  const M3EShapes._();

  static const _cornerRound15 = M3ECornerRounding(radius: 0.15);
  static const _cornerRound20 = M3ECornerRounding(radius: 0.2);
  static const _cornerRound30 = M3ECornerRounding(radius: 0.3);
  static const _cornerRound50 = M3ECornerRounding(radius: 0.5);
  static const _cornerRound100 = M3ECornerRounding(radius: 1);

  static const double _negative45Radians = -45 * math.pi / 180;
  static const double _negative90Radians = -90 * math.pi / 180;
  static const double _negative135Radians = -135 * math.pi / 180;

  /// A circle shape.
  static final circle = M3ERoundedPolygon.circle(
    numVertices: 10,
    radius: 0.5,
    centerX: 0.5,
    centerY: 0.5,
  );

  /// A square shape.
  static final square = M3ERoundedPolygon.rectangle(
    width: 1,
    height: 1,
    rounding: _cornerRound30,
    centerX: 0.5,
    centerY: 0.5,
  );

  /// A slanted square shape.
  static final M3ERoundedPolygon slanted = _customPolygon(
    const [
      _PointNRound(
        M3EPoint(0.926, 0.970),
        M3ECornerRounding(radius: 0.189, smoothing: 0.811),
      ),
      _PointNRound(
        M3EPoint(-0.021, 0.967),
        M3ECornerRounding(radius: 0.187, smoothing: 0.057),
      ),
    ],
    2,
  ).normalized();

  /// An arch shape.
  static final M3ERoundedPolygon arch = M3ERoundedPolygon.fromVerticesNum(
    4,
    perVertexRounding: const [
      _cornerRound100,
      _cornerRound100,
      _cornerRound20,
      _cornerRound20,
    ],
  )
      .transformed(
        (Matrix4.identity()..rotateZ(_negative135Radians)).asPointTransformer(),
      )
      .normalized();

  /// A semi-circle shape.
  static final M3ERoundedPolygon semiCircle = M3ERoundedPolygon.rectangle(
    width: 1.6,
    height: 1,
    perVertexRounding: const [
      _cornerRound20,
      _cornerRound20,
      _cornerRound100,
      _cornerRound100,
    ],
  ).normalized();

  /// An oval shape.
  static final M3ERoundedPolygon oval = M3ERoundedPolygon.circle()
      .transformed(
        (Matrix4.identity()
              ..rotateZ(_negative45Radians)
              ..scale(1.0, 0.64))
            .asPointTransformer(),
      )
      .normalized();

  /// An pill shape.
  static final M3ERoundedPolygon pill = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.961, 0.039),
        M3ECornerRounding(radius: 0.426),
      ),
      const _PointNRound(M3EPoint(1.001, 0.428)),
      const _PointNRound(
        M3EPoint(1, 0.609),
        M3ECornerRounding(radius: 1),
      ),
    ],
    2,
    mirroring: true,
  ).normalized();

  /// A triangle shape.
  static final M3ERoundedPolygon triangle =
      M3ERoundedPolygon.fromVerticesNum(3, rounding: _cornerRound20)
          .transformed(
            (Matrix4.identity()..rotateZ(_negative90Radians))
                .asPointTransformer(),
          )
          .normalized();

  /// An arrow shape.
  static final M3ERoundedPolygon arrow = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.5, 0.892),
        M3ECornerRounding(radius: 0.313),
      ),
      const _PointNRound(
        M3EPoint(-0.216, 1.05),
        M3ECornerRounding(radius: 0.207),
      ),
      const _PointNRound(
        M3EPoint(0.499, -0.16),
        M3ECornerRounding(radius: 0.215, smoothing: 1),
      ),
      const _PointNRound(
        M3EPoint(1.225, 1.06),
        M3ECornerRounding(radius: 0.211),
      ),
    ],
    1,
  ).normalized();

  /// A fan shape.
  static final M3ERoundedPolygon fan = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(1.004, 1),
        M3ECornerRounding(radius: 0.148, smoothing: 0.417),
      ),
      const _PointNRound(
        M3EPoint(0, 1),
        M3ECornerRounding(radius: 0.151),
      ),
      const _PointNRound(
        M3EPoint(0, -0.003),
        M3ECornerRounding(radius: 0.148),
      ),
      const _PointNRound(
        M3EPoint(0.978, 0.02),
        M3ECornerRounding(radius: 0.803),
      ),
    ],
    1,
  ).normalized();

  /// A diamond shape.
  static final M3ERoundedPolygon diamond = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.5, 1.096),
        M3ECornerRounding(radius: 0.151, smoothing: 0.524),
      ),
      const _PointNRound(
        M3EPoint(0.04, 0.5),
        M3ECornerRounding(radius: .159),
      ),
    ],
    2,
  ).normalized();

  /// A clam-shell shape.
  static final M3ERoundedPolygon clamShell = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.171, 0.841),
        M3ECornerRounding(radius: 0.159),
      ),
      const _PointNRound(
        M3EPoint(-0.02, 0.5),
        M3ECornerRounding(radius: 0.140),
      ),
      const _PointNRound(
        M3EPoint(0.17, 0.159),
        M3ECornerRounding(radius: 0.159),
      ),
    ],
    2,
  ).normalized();

  /// A pentagon shape.
  static final M3ERoundedPolygon pentagon = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.5, -0.009),
        M3ECornerRounding(radius: 0.172),
      ),
      const _PointNRound(
        M3EPoint(1.03, 0.365),
        M3ECornerRounding(radius: 0.164),
      ),
      const _PointNRound(
        M3EPoint(0.828, 0.97),
        M3ECornerRounding(radius: 0.169),
      ),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A gem shape.
  static final M3ERoundedPolygon gem = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.499, 1.023),
        M3ECornerRounding(radius: 0.241, smoothing: 0.778),
      ),
      const _PointNRound(
        M3EPoint(-0.005, 0.792),
        M3ECornerRounding(radius: 0.208),
      ),
      const _PointNRound(
        M3EPoint(0.073, 0.258),
        M3ECornerRounding(radius: 0.228),
      ),
      const _PointNRound(
        M3EPoint(0.433, -0),
        M3ECornerRounding(radius: 0.491),
      ),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A sunny shape.
  static final M3ERoundedPolygon sunny = M3ERoundedPolygon.star(
    numVerticesPerRadius: 8,
    innerRadius: 0.8,
    rounding: _cornerRound15,
  ).normalized();

  /// A very-sunny shape.
  static final M3ERoundedPolygon verySunny = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.5, 1.080),
        M3ECornerRounding(radius: 0.085),
      ),
      const _PointNRound(
        M3EPoint(0.358, 0.843),
        M3ECornerRounding(radius: 0.085),
      ),
    ],
    8,
  ).normalized();

  /// A 4-sided cookie shape.
  static final M3ERoundedPolygon cookie4Sided = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(1.237, 1.236),
        M3ECornerRounding(radius: 0.258),
      ),
      const _PointNRound(
        M3EPoint(0.5, 0.918),
        M3ECornerRounding(radius: 0.233),
      ),
    ],
    4,
  ).normalized();

  /// A 6-sided cookie shape.
  static final M3ERoundedPolygon cookie6Sided = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.723, 0.884),
        M3ECornerRounding(radius: 0.394),
      ),
      const _PointNRound(
        M3EPoint(0.5, 1.099),
        M3ECornerRounding(radius: 0.398),
      ),
    ],
    6,
  ).normalized();

  /// A 7-sided cookie shape.
  static final M3ERoundedPolygon cookie7Sided = M3ERoundedPolygon.star(
    numVerticesPerRadius: 7,
    innerRadius: 0.75,
    rounding: _cornerRound50,
  )
      .transformed(
        (Matrix4.identity()..rotateZ(_negative90Radians)).asPointTransformer(),
      )
      .normalized();

  /// A 9-sided cookie shape.
  static final M3ERoundedPolygon cookie9Sided = M3ERoundedPolygon.star(
    numVerticesPerRadius: 9,
    innerRadius: 0.8,
    rounding: _cornerRound50,
  )
      .transformed(
        (Matrix4.identity()..rotateZ(_negative90Radians)).asPointTransformer(),
      )
      .normalized();

  /// A 12-sided cookie shape.
  static final M3ERoundedPolygon cookie12Sided = M3ERoundedPolygon.star(
    numVerticesPerRadius: 12,
    innerRadius: 0.8,
    rounding: _cornerRound50,
  )
      .transformed(
        (Matrix4.identity()..rotateZ(_negative90Radians)).asPointTransformer(),
      )
      .normalized();

  /// A 4-leaf clover shape.
  static final M3ERoundedPolygon clover4Leaf = _customPolygon(
    [
      const _PointNRound(M3EPoint(0.5, 0.074)),
      const _PointNRound(
        M3EPoint(0.725, -0.099),
        M3ECornerRounding(radius: 0.476),
      ),
    ],
    4,
    mirroring: true,
  ).normalized();

  /// A 8-leaf clover shape.
  static final M3ERoundedPolygon clover8Leaf = _customPolygon(
    [
      const _PointNRound(M3EPoint(0.5, 0.036)),
      const _PointNRound(
        M3EPoint(0.758, -0.101),
        M3ECornerRounding(radius: 0.209),
      ),
    ],
    8,
  ).normalized();

  /// A burst shape.
  static final M3ERoundedPolygon burst = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.5, -0.006),
        M3ECornerRounding(radius: 0.006),
      ),
      const _PointNRound(
        M3EPoint(0.592, 0.158),
        M3ECornerRounding(radius: 0.006),
      ),
    ],
    12,
  ).normalized();

  /// A soft-burst shape.
  static final M3ERoundedPolygon softBurst = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.193, 0.277),
        M3ECornerRounding(radius: 0.053),
      ),
      const _PointNRound(
        M3EPoint(0.176, 0.055),
        M3ECornerRounding(radius: 0.053),
      ),
    ],
    10,
  ).normalized();

  /// A boom shape.
  static final M3ERoundedPolygon boom = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.457, 0.296),
        M3ECornerRounding(radius: 0.007),
      ),
      const _PointNRound(
        M3EPoint(0.5, -0.051),
        M3ECornerRounding(radius: 0.007),
      ),
    ],
    15,
  ).normalized();

  /// A soft-boom shape.
  static final M3ERoundedPolygon softBoom = _customPolygon(
    [
      const _PointNRound(M3EPoint(0.733, 0.454)),
      const _PointNRound(
        M3EPoint(0.839, 0.437),
        M3ECornerRounding(radius: 0.532),
      ),
      const _PointNRound(
        M3EPoint(0.949, 0.449),
        M3ECornerRounding(radius: 0.439, smoothing: 1),
      ),
      const _PointNRound(
        M3EPoint(0.998, 0.478),
        M3ECornerRounding(radius: 0.174),
      ),
    ],
    16,
    mirroring: true,
  ).normalized();

  /// A flower shape.
  static final M3ERoundedPolygon flower = _customPolygon(
    [
      const _PointNRound(M3EPoint(0.370, 0.187)),
      const _PointNRound(
        M3EPoint(0.416, 0.049),
        M3ECornerRounding(radius: 0.381),
      ),
      const _PointNRound(
        M3EPoint(0.479, 0.001),
        M3ECornerRounding(radius: 0.095),
      ),
    ],
    8,
    mirroring: true,
  ).normalized();

  /// A puffy shape.
  static final M3ERoundedPolygon puffy = _customPolygon(
    [
      const _PointNRound(M3EPoint(0.5, 0.053)),
      const _PointNRound(
        M3EPoint(0.545, -0.04),
        M3ECornerRounding(radius: 0.405),
      ),
      const _PointNRound(
        M3EPoint(0.670, -0.035),
        M3ECornerRounding(radius: 0.426),
      ),
      const _PointNRound(
        M3EPoint(0.717, 0.066),
        M3ECornerRounding(radius: 0.574),
      ),
      const _PointNRound(M3EPoint(0.722, 0.128)),
      const _PointNRound(
        M3EPoint(0.777, 0.002),
        M3ECornerRounding(radius: 0.36),
      ),
      const _PointNRound(
        M3EPoint(0.914, 0.149),
        M3ECornerRounding(radius: 0.66),
      ),
      const _PointNRound(
        M3EPoint(0.926, 0.289),
        M3ECornerRounding(radius: 0.66),
      ),
      const _PointNRound(M3EPoint(0.881, 0.346)),
      const _PointNRound(
        M3EPoint(0.940, 0.344),
        M3ECornerRounding(radius: 0.126),
      ),
      const _PointNRound(
        M3EPoint(1.003, 0.437),
        M3ECornerRounding(radius: 0.255),
      ),
    ],
    2,
    mirroring: true,
  )
      .transformed(
        (Matrix4.identity()..scale(1.0, 0.742)).asPointTransformer(),
      )
      .normalized();

  /// A puffy-diamond shape.
  static final M3ERoundedPolygon puffyDiamond = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.87, 0.13),
        M3ECornerRounding(radius: 0.146),
      ),
      const _PointNRound(M3EPoint(0.818, 0.357)),
      const _PointNRound(
        M3EPoint(1, 0.332),
        M3ECornerRounding(radius: 0.853),
      ),
    ],
    4,
    mirroring: true,
  ).normalized();

  /// A ghostish shape.
  static final M3ERoundedPolygon ghostish = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.5, 0),
        M3ECornerRounding(radius: 1),
      ),
      const _PointNRound(
        M3EPoint(1, 0),
        M3ECornerRounding(radius: 1),
      ),
      const _PointNRound(
        M3EPoint(1, 1.14),
        M3ECornerRounding(radius: 0.254, smoothing: 0.106),
      ),
      const _PointNRound(
        M3EPoint(0.575, 0.906),
        M3ECornerRounding(radius: 0.253),
      ),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A pixel-circle shape.
  static final M3ERoundedPolygon pixelCircle = _customPolygon(
    [
      const _PointNRound(M3EPoint(0.5, 0)),
      const _PointNRound(M3EPoint(0.704, 0)),
      const _PointNRound(M3EPoint(0.704, 0.065)),
      const _PointNRound(M3EPoint(0.843, 0.065)),
      const _PointNRound(M3EPoint(0.843, 0.148)),
      const _PointNRound(M3EPoint(0.926, 0.148)),
      const _PointNRound(M3EPoint(0.926, 0.296)),
      const _PointNRound(M3EPoint(1, 0.296)),
    ],
    2,
    mirroring: true,
  ).normalized();

  /// A pixel-triangle shape.
  static final M3ERoundedPolygon pixelTriangle = _customPolygon(
    [
      const _PointNRound(M3EPoint(0.11, 0.5)),
      const _PointNRound(M3EPoint(0.113, 0)),
      const _PointNRound(M3EPoint(0.287, 0)),
      const _PointNRound(M3EPoint(0.287, 0.087)),
      const _PointNRound(M3EPoint(0.421, 0.087)),
      const _PointNRound(M3EPoint(0.421, 0.17)),
      const _PointNRound(M3EPoint(0.56, 0.17)),
      const _PointNRound(M3EPoint(0.56, 0.265)),
      const _PointNRound(M3EPoint(0.674, 0.265)),
      const _PointNRound(M3EPoint(0.675, 0.344)),
      const _PointNRound(M3EPoint(0.789, 0.344)),
      const _PointNRound(M3EPoint(0.789, 0.439)),
      const _PointNRound(M3EPoint(0.888, 0.439)),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A bun shape.
  static final M3ERoundedPolygon bun = _customPolygon(
    [
      const _PointNRound(M3EPoint(0.796, 0.5)),
      const _PointNRound(
        M3EPoint(0.853, 0.518),
        M3ECornerRounding(radius: 1),
      ),
      const _PointNRound(
        M3EPoint(0.992, 0.631),
        M3ECornerRounding(radius: 1),
      ),
      const _PointNRound(
        M3EPoint(0.968, 1),
        M3ECornerRounding(radius: 1),
      ),
    ],
    2,
    mirroring: true,
  ).normalized();

  /// A heart shape.
  static final M3ERoundedPolygon heart = _customPolygon(
    [
      const _PointNRound(
        M3EPoint(0.5, 0.268),
        M3ECornerRounding(radius: 0.016),
      ),
      const _PointNRound(
        M3EPoint(0.792, -0.066),
        M3ECornerRounding(radius: 0.958),
      ),
      const _PointNRound(
        M3EPoint(1.064, 0.276),
        M3ECornerRounding(radius: 1),
      ),
      const _PointNRound(
        M3EPoint(0.501, 0.946),
        M3ECornerRounding(radius: 0.129),
      ),
    ],
    1,
    mirroring: true,
  ).normalized();

  /// A list of all available shapes.
  static final UnmodifiableListView<M3ERoundedPolygon> all =
      UnmodifiableListView(
    <M3ERoundedPolygon>[
      M3EShapes.circle,
      M3EShapes.square,
      M3EShapes.slanted,
      M3EShapes.arch,
      M3EShapes.semiCircle,
      M3EShapes.oval,
      M3EShapes.pill,
      M3EShapes.triangle,
      M3EShapes.arrow,
      M3EShapes.fan,
      M3EShapes.diamond,
      M3EShapes.clamShell,
      M3EShapes.pentagon,
      M3EShapes.gem,
      M3EShapes.sunny,
      M3EShapes.verySunny,
      M3EShapes.cookie4Sided,
      M3EShapes.cookie6Sided,
      M3EShapes.cookie7Sided,
      M3EShapes.cookie9Sided,
      M3EShapes.cookie12Sided,
      M3EShapes.clover4Leaf,
      M3EShapes.clover8Leaf,
      M3EShapes.burst,
      M3EShapes.softBurst,
      M3EShapes.boom,
      M3EShapes.softBoom,
      M3EShapes.flower,
      M3EShapes.puffy,
      M3EShapes.puffyDiamond,
      M3EShapes.ghostish,
      M3EShapes.pixelCircle,
      M3EShapes.pixelTriangle,
      M3EShapes.bun,
      M3EShapes.heart,
    ],
  );

  static M3ERoundedPolygon _customPolygon(
    List<_PointNRound> pnr,
    int reps, {
    M3EPoint center = const M3EPoint(0.5, 0.5),
    bool mirroring = false,
  }) {
    final actualPoints = _doRepeat(pnr, reps, center, mirroring);

    final vertices = List<double>.filled(actualPoints.length * 2, 0);
    final perVertexRounding = List<M3ECornerRounding>.filled(
      actualPoints.length,
      M3ECornerRounding.unrounded,
    );

    for (var i = 0; i < actualPoints.length; i++) {
      final ap = actualPoints[i];
      perVertexRounding[i] = ap.r;

      final j = i * 2;
      vertices[j] = ap.p.x;
      vertices[j + 1] = ap.p.y;
    }

    return M3ERoundedPolygon.fromVertices(
      vertices,
      perVertexRounding: perVertexRounding,
      centerX: center.x,
      centerY: center.y,
    );
  }

  static List<_PointNRound> _doRepeat(
    List<_PointNRound> points,
    int reps,
    M3EPoint center,
    bool mirroring,
  ) {
    final result = <_PointNRound>[];

    if (mirroring) {
      final measures = List.generate(points.length, (i) {
        final point = points[i];
        final off = point.p - center;
        return (angle: off.angleRadians, distance: off.getDistance());
      });
      final actualReps = reps * 2;
      final sectionAngle = math.pi * 2 / actualReps;

      for (var r = 0; r < actualReps; r++) {
        for (var index = 0; index < points.length; index++) {
          final i = (r.isEven) ? index : points.length - 1 - index;
          if (i > 0 || r.isEven) {
            final a = sectionAngle * r +
                ((r.isEven)
                    ? measures[i].angle
                    : sectionAngle - measures[i].angle + 2 * measures[0].angle);

            final finalPoint = M3EPoint(
                      math.cos(a),
                      math.sin(a),
                    ) *
                    measures[i].distance +
                center;

            result.add(_PointNRound(finalPoint, points[i].r));
          }
        }
      }
    } else {
      final np = points.length;
      for (var i = 0; i < np * reps; i++) {
        final point = points[i % np].p.rotate(
              (i ~/ np) * 360 / reps,
              center: center,
            );
        result.add(_PointNRound(point, points[i % np].r));
      }
    }

    return result;
  }
}

class _PointNRound {
  const _PointNRound(
    this.p, [
    this.r = M3ECornerRounding.unrounded,
  ]);

  final M3EPoint p;

  final M3ECornerRounding r;
}
