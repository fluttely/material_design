/// **M3 Expressive** — rounded-polygon geometry, shape morphing, and the
/// expressive loading indicator.
///
/// Self-contained: this module is a geometry engine that happens to ship with
/// the package, and it deliberately does not reach into the token layer.
library;

import 'dart:collection';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
