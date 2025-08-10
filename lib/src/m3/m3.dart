/// # Material Design 3 (M3) Token System
///
/// This library provides a comprehensive implementation of Material Design 3's
/// design token system, including reference tokens, system tokens, and component tokens.
///
/// ## Token Hierarchy
///
/// Material Design 3 follows a three-tier token architecture:
///
/// ### Reference Tokens
/// Base atomic values that form the foundation of the design system.
/// These are the raw values from which all other tokens derive.
///
/// ### System Tokens
/// Semantic tokens that map reference tokens to specific design intentions,
/// providing meaning and context to the base reference values.
///
/// ### Component Tokens
/// Specific tokens for individual UI components that reference system tokens
/// for consistent styling and behavior across the design system.
///
/// ## Usage
///
/// ```dart
/// import 'package:material_design/m3/m3.dart';
///
/// // Use system color tokens
/// final primaryColor = M3SysColor.primary;
///
/// // Use typography tokens
/// final headlineStyle = M3TextStyleToken.headlineLarge.value;
///
/// // Use component tokens
/// final buttonHeight = M3CompButton.heightMedium;
/// ```
///
/// For more information, visit: https://m3.material.io/foundations/design-tokens
library;

// === UTILITIES ===
// Material Toolkit utilities for enhanced M3 functionality

/// Accessibility utilities for inclusive design
export 'mt/accessibility/m3_accessibility.dart';

/// Adaptive design utilities for responsive layouts
export 'mt/adaptive/m3_adaptive.dart';

/// Color utilities and tonal color system
export 'mt/color/m3_color_utils.dart';

/// Shape utilities
export 'mt/sys/m3_shape_utils.dart';

/// Component tokens for buttons
export 'tokens/sys/interfaces/m3_token.dart';

/// Reference color tokens - base atomic color values

/// Reference Tokens
///
/// Base tokens that form the foundation of the Material Design 3 system.
/// These tokens represent the atomic values from which all other tokens derive.


/// System Tokens
///
/// Semantic tokens that map reference tokens to specific design intentions.
/// These provide meaning and context to the base reference values.

/// System color tokens - semantic color roles

/// System elevation tokens - shadow and depth
export 'tokens/sys/elevation/m3_elevation_token.dart';

/// System geometry tokens - borders, breakpoints, sizing
export 'tokens/sys/geometry/m3_border_token.dart';
export 'tokens/sys/geometry/m3_breakpoint_token.dart';
export 'tokens/sys/geometry/m3_icon_size_token.dart';
export 'tokens/sys/geometry/m3_z_index_token.dart';

/// System interaction tokens - visual density and feedback
export 'tokens/sys/interaction/m3_visual_density_token.dart';

/// System motion tokens - animations and transitions
export 'tokens/sys/motion/m3_motion_token.dart';

/// System shape tokens - corner radii and borders
export 'tokens/sys/shape/m3_shape_token.dart';

/// System spacing tokens - margins, padding, gaps
export 'tokens/sys/spacing/m3_spacing_token.dart';

/// System state tokens - interaction states and opacity
export 'tokens/sys/state/m3_opacity_token.dart';
export 'tokens/sys/state/m3_state_layer_opacity_token.dart';

/// System typography tokens - text styles and scales
export 'tokens/sys/typography/m3_text_style_token.dart';
