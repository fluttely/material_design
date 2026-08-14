/// **M3 Expressive** — rounded-polygon geometry, shape morphing, and the
/// expressive loading indicator.
///
/// Self-contained: this module is a geometry engine that happens to ship with
/// the package, and it deliberately does not reach into the token layer.
///
/// ## Naming
///
/// Everything this module exports is prefixed with `M3E` (`M3EPoint`,
/// `M3ECubic`, `M3ERoundedPolygon`, `M3EMorph`, `M3EShapes`, …). The package
/// is re-exported wholesale from `material_design.dart`, so the prefix is
/// what keeps generic geometry names such as `Point`, `Cubic` or `Morph` out
/// of your root namespace. Anything without the prefix is an
/// implementation detail and is library-private: because the module is one
/// library assembled from `part` files, a leading underscore hides a name from
/// the whole package while still letting every part use it.
///
/// ## Stability
///
/// The whole module is annotated [experimental]. Material Expressive is not
/// final, and this API tracks it: names, defaults and shape geometry may change
/// in a minor release. Pin the package version if you depend on the exact
/// output.
///
/// See also:
///
///  * <https://m3.material.io/styles/shape/shape-scale-tokens>, the shape spec.
///  * <https://m3.material.io/components/loading-indicator/overview>, the
///    loading indicator spec.
library;

import 'dart:collection';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

part 'm3e/e_shapes/point.dart';
part 'm3e/e_shapes/utils.dart';
part 'm3e/e_shapes/float_mapping.dart';
part 'm3e/e_shapes/corner_rounding.dart';
part 'm3e/e_shapes/cubic.dart';
part 'm3e/e_shapes/features.dart';
part 'm3e/e_shapes/feature_mapping.dart';
part 'm3e/e_shapes/polygon_measure.dart';
part 'm3e/e_shapes/rounded_polygon.dart';
part 'm3e/e_shapes/shapes.dart';
part 'm3e/e_shapes/e_shapes.dart';
part 'm3e/e_shapes/morph.dart';
part 'm3e/e_loading_indicator/e_loading_indicator_theme.dart';
part 'm3e/e_loading_indicator/e_loading_indicator.dart';
