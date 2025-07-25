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
/// Component tokens for Material Design 3.
///
/// These tokens define specific styling properties for individual
/// components, derived from system tokens with component-specific
/// customizations and states.
///
/// Component tokens include specifications for:
/// - Buttons (elevated, filled, outlined, text)
/// - Cards (elevated, filled, outlined)
/// - FABs (primary, secondary, small, large, extended)
/// - Dialogs
/// - Navigation components
/// - And many more...
///
/// Specification: https://m3.material.io/foundations/design-tokens/overview
export 'comp/button/button.dart';
export 'comp/card/card.dart';
export 'comp/fab/fab.dart';

/// Reference tokens for Material Design 3.
///
/// These are the foundational tokens that define the base values
/// from which all other tokens are derived.
///
/// Reference tokens include:
/// - Color palettes (tonal scales)
/// - Typeface definitions
///
/// Specification: https://m3.material.io/foundations/design-tokens/overview
export 'ref/palette/ref_palette.dart';
export 'ref/palette/tonal_palette.dart';
export 'ref/typeface/typeface.dart';

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
export 'sys/color/old/color.dart';
export 'sys/elevation/elevation.dart';
// Elevation exports
export 'sys/elevation/sys_elevation.dart';
export 'sys/motion/motion.dart';
// Motion exports
// Shape exports
export 'sys/shape/sys_radius.dart';
// Spacing exports
export 'sys/spacing/sys_spacing.dart';
export 'sys/state/state.dart';
// Theme exports
// Typography exports
export 'sys/typography/sys_type_scale.dart';
export 'sys/typography/typescale.dart';
