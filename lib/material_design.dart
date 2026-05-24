/// A Material Design 3 contract for Flutter. Enforces M3 tokens system-wide,
/// replacing free primitives with type-safe M3 equivalents.
///
/// To use the tokens, simply import this file:
/// ```dart
/// import 'package:material_design/material_design.dart';
/// ```
library;

import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

part 'src/m3/border/border.dart';
part 'src/m3/decorations/box_decoration.dart';
part 'src/m3/decorations/shape_decoration.dart';
part 'src/m3/interaction/focus_ring.dart';
part 'src/m3/interaction/state_layer.dart';
part 'src/m3/interaction/visual_density.dart';
part 'src/m3/motion/motion.dart';
part 'src/m3/shape/border_radius.dart';
part 'src/m3/shape/shape.dart';
part 'src/m3/spacing/edge_insets.dart';
part 'src/m3/spacing/gap.dart';
part 'src/m3/spacing/padding.dart';
part 'src/m3/tokens/border/border_side.dart';
part 'src/m3/tokens/border/border_width_token.dart';
part 'src/m3/tokens/color/color_scheme_token.dart';
part 'src/m3/tokens/elevation/box_shadow.dart';
part 'src/m3/tokens/elevation/elevation.dart';
part 'src/m3/tokens/elevation/elevation_dps.dart';
part 'src/m3/tokens/elevation/elevation_shadows.dart';
part 'src/m3/tokens/icon/icon_size_token.dart';
part 'src/m3/tokens/opacity/opacity_token.dart';
part 'src/m3/tokens/opacity/state_layer_opacity_token.dart';
part 'src/m3/tokens/responsive/breakpoint_token.dart';
part 'src/m3/tokens/shape/corner_token.dart';
part 'src/m3/tokens/shape/radius.dart';
part 'src/m3/tokens/spacing/spacing_token.dart';
part 'src/m3/tokens/typography/type_scale_token.dart';
part 'src/m3/tokens/z_index/z_index_token.dart';
part 'src/m3/typography/text_utils.dart';
part 'src/m3/utils/accessibility/m3_accessibility.dart';
part 'src/m3/utils/adaptive/m3_adaptive.dart';
part 'src/m3/utils/color/color_utils.dart';
part 'src/m3/utils/elevation/surface_tint.dart';
part 'src/m3/utils/responsive/responsive_builder.dart';
part 'src/m3/utils/responsive/responsive_grid.dart';
part 'src/m3/utils/responsive/responsive_grid_config.dart';
part 'src/m3/utils/responsive/responsive_navigation.dart';
part 'src/m3/utils/responsive/responsive_scaffold.dart';
part 'src/m3/utils/responsive/responsive_value.dart';
part 'src/m3/utils/responsive/responsive_visibility.dart';
part 'src/m3e/e_loading_indicator/e_loading_indicator.dart';
part 'src/m3e/e_loading_indicator/e_loading_indicator_theme.dart';
part 'src/m3e/e_shapes/corner_rounding.dart';
part 'src/m3e/e_shapes/cubic.dart';
part 'src/m3e/e_shapes/e_shapes.dart';
part 'src/m3e/e_shapes/feature_mapping.dart';
part 'src/m3e/e_shapes/features.dart';
part 'src/m3e/e_shapes/float_mapping.dart';
part 'src/m3e/e_shapes/morph.dart';
part 'src/m3e/e_shapes/point.dart';
part 'src/m3e/e_shapes/polygon_measure.dart';
part 'src/m3e/e_shapes/rounded_polygon.dart';
part 'src/m3e/e_shapes/shapes.dart';
part 'src/m3e/e_shapes/utils.dart';
