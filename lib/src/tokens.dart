/// The Material Design 3 **token layer** — the scalar values every other
/// module is built from.
///
/// This module is a single Dart library on purpose. The type-safe wrappers
/// ([M3SpacingValue], [M3CornerValue], and the rest) rely on library-private
/// constructors to keep off-scale values out; splitting them across libraries
/// would force those constructors public and dissolve the contract. Every
/// deliberate deviation therefore has exactly one door: [M3Contract].
library;

import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as mcu;

part 'm3/tokens/contract.dart';
part 'm3/tokens/spacing/spacing_token.dart';
part 'm3/tokens/border/border_width_token.dart';
part 'm3/tokens/opacity/opacity_token.dart';
part 'm3/tokens/opacity/state_layer_opacity_token.dart';
part 'm3/tokens/shape/corner_token.dart';
part 'm3/tokens/icon/icon_size_token.dart';
part 'm3/tokens/z_index/z_index_token.dart';
part 'm3/tokens/responsive/breakpoint_token.dart';
part 'm3/tokens/elevation/elevation_dps.dart';
part 'm3/tokens/elevation/box_shadow.dart';
part 'm3/tokens/elevation/elevation_shadows.dart';
part 'm3/tokens/elevation/elevation.dart';
part 'm3/tokens/typography/type_scale_token.dart';
part 'm3/tokens/color/tonal_palette.dart';
