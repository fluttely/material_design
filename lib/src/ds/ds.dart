/// Material Design 3 Design Tokens
///
/// This library provides a complete implementation of Material Design 3
/// design tokens following the official specification structure.
///
/// The token system is organized in three hierarchical layers:
///
/// 1. **Reference tokens (ref)**: Base values like color palettes and typefaces
/// 2. **System tokens (sys)**: Semantic roles derived from reference tokens
/// 3. **Component tokens (comp)**: Component-specific specifications
///
/// ## Token Naming Convention
///
/// All tokens follow the official Material Design naming pattern:
/// `md.{layer}.{group}.{role}.{modifier}.{state}`
///
/// Examples:
/// - `MdSysColor.primary` → `md.sys.color.primary`
/// - `MdCompButton.labelTextType` → `md.comp.button.label-text.type`
/// - `MdSysMotionEasing.emphasized` → `md.sys.motion.easing.emphasized`
///
/// ## Usage
///
/// ```dart
/// import 'package:material_design/src/md/md.dart';
///
/// // Using system color tokens
/// Container(
///   color: MdSysColor.primaryContainer,
///   child: Text(
///     'Hello World',
///     style: MdSysTypescale.bodyLarge.copyWith(
///       color: MdSysColor.onPrimaryContainer,
///     ),
///   ),
/// )
///
/// // Using component tokens
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     backgroundColor: MdCompElevatedButton.containerColor,
///     foregroundColor: MdCompElevatedButton.labelTextColor,
///     elevation: MdCompElevatedButton.containerElevation,
///   ),
///   child: Text('Button'),
/// )
/// ```
///
/// Specification: https://m3.material.io/

// Component tokens (specific)
// Reference tokens (foundational)

/// System tokens for Material Design 3.
///
/// These semantic tokens are derived from reference tokens and provide
/// meaningful roles and contexts for use throughout the interface.
///
/// System tokens include:
/// - Color roles (primary, secondary, surface, etc.)
/// - Typography scale (display, headline, body, etc.)
/// - Motion specifications (easing, duration)
/// - Elevation levels
/// - Shape definitions
/// - State specifications
///
/// Specification: https://m3.material.io/foundations/design-tokens/overview
// Color exports
export 'sys/color/sys_color_scheme.dart';
export 'sys/color/sys_surface_colors.dart';
// Elevation exports
// Motion exports
export 'sys/motion/sys_motion.dart';
// Shape exports
// Spacing exports
// Theme exports
export 'sys/theme/m3_theme.dart';
export 'sys/theme/sys_color_theme.dart';
export 'sys/theme/sys_theme.dart';
// Typography exports
