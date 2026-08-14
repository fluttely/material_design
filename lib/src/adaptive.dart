/// Material Design 3 **adaptive layout** — window size classes, responsive
/// scaffolding, and accessibility adaptation.
///
/// This is the module that composes the others: it reads tokens, lays out with
/// layout widgets, and shapes with shape widgets.
library;

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:material_design/src/color.dart';
import 'package:material_design/src/layout.dart';
import 'package:material_design/src/motion.dart';
import 'package:material_design/src/shape.dart';
import 'package:material_design/src/tokens.dart';

part 'm3/utils/responsive/responsive_builder.dart';
part 'm3/utils/responsive/responsive_grid_config.dart';
part 'm3/utils/responsive/responsive_grid.dart';
part 'm3/utils/responsive/responsive_navigation.dart';
part 'm3/utils/responsive/responsive_scaffold.dart';
part 'm3/utils/responsive/responsive_value.dart';
part 'm3/utils/responsive/responsive_visibility.dart';
part 'm3/utils/responsive/canonical_layouts.dart';
part 'm3/utils/adaptive/m3_adaptive.dart';
part 'm3/utils/accessibility/m3_accessibility.dart';
