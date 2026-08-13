/// A Material Design 3 contract for Flutter. Enforces M3 tokens system-wide,
/// replacing free primitives with type-safe M3 equivalents.
///
/// ```dart
/// import 'package:material_design/material_design.dart';
/// ```
///
/// The package is split into modules that depend on each other in one
/// direction only — tokens know nothing about widgets, and the expressive
/// shape engine knows nothing about either:
///
/// ```text
/// tokens ──┬─> shape ──┬─> interaction
///          ├─> layout ─┤
///          ├─> color ──┴─> adaptive
///          └─> typography
/// motion  ─────────────────> interaction, adaptive
/// expressive (standalone)
/// ```
///
/// Importing this file gives you all of them.
library;

export 'src/adaptive.dart';
export 'src/color.dart';
export 'src/expressive.dart';
export 'src/interaction.dart';
export 'src/layout.dart';
export 'src/motion.dart';
export 'src/shape.dart';
export 'src/tokens.dart';
export 'src/typography.dart';
