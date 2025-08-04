/// A comprehensive toolkit for implementing Material Design 3 in Flutter.
///
/// This library provides a set of pre-defined tokens and utilities that align
/// with the official Material 3 specification, making it easier to build
/// beautiful and consistent user interfaces.
///
/// To use the tokens, simply import this file:
/// ```dart
/// import 'package:material_design/material_design.dart';
/// ```
///
/// Then, you can access all the tokens, such as:
/// - `M3TextStyleToken.headlineLarge`
/// - `M3ElevationToken.level5`
library;

import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design/material_design.dart';
import 'package:meta/meta.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

part 'src/m3/tokens/sys/elevation/m3_elevation_token.dart';
part 'src/m3/tokens/sys/elevation/m3_surface_color_token.dart';

/// **Elevation System**: Tonal elevation and shadow tokens.
/// Implements Material Design 3's primary depth indication system using
/// surface tinting combined with complementary shadow effects for natural
/// depth perception.
part 'src/m3/tokens/sys/elevation/shadow_token.dart';
part 'src/m3/tokens/sys/elevation/surface_tint.dart';

/// **Geometry Tokens**: Spatial and dimensional design tokens.
/// Comprehensive geometric system including borders, breakpoints, icon
/// sizing, and z-index layering.

/// Border width tokens for consistent component outlining and separation.
/// Provides semantic border widths from subtle (1dp) to prominent (4dp)
/// with usage guidelines.
part 'src/m3/tokens/sys/geometry/m3_border_token.dart';

/// Responsive breakpoint system for adaptive layout design.
/// Implements Material Design 3's five-tier breakpoint system with utility
/// methods
/// for responsive components, navigation patterns, and screen size
/// adaptation.
part 'src/m3/tokens/sys/geometry/m3_breakpoint_token.dart';

/// Icon sizing tokens for consistent iconography across interface elements.
/// Provides semantic icon sizes from dense (20dp) to extra-large (48dp)
/// with
/// context-appropriate usage recommendations.
part 'src/m3/tokens/sys/geometry/m3_icon_size_token.dart';

/// Z-index layering tokens for predictable component stacking order.
/// Establishes consistent layering hierarchy from background (0) to
/// tooltips (9999)
/// ensuring proper visual relationships and interaction patterns.
part 'src/m3/tokens/sys/geometry/m3_z_index_token.dart';

/// **Interaction Tokens**: User interaction and feedback systems.

/// Visual density tokens for adaptive component spacing.
/// Provides platform-aware density adjustment from compact (-2,-2) to
/// comfortable (-1,-1)
/// with automatic platform adaptation and accessibility considerations.
part 'src/m3/tokens/sys/interaction/m3_visual_density_token.dart';

/// Base interface for all Material Design 3 design tokens.
/// Defines the fundamental contract for type-safe token implementation
/// with comprehensive documentation and usage examples.
part 'src/m3/tokens/sys/interfaces/m3_token.dart';

/// **Motion System**: Animation duration and easing tokens.
/// Complete motion design system with duration tokens (50ms-1000ms) and
/// easing curves (emphasized, standard, linear) for natural, consistent
/// animations.
part 'src/m3/tokens/sys/motion/m3_motion_token.dart';

/// **Shape System**: Corner radius and border radius tokens.
/// Comprehensive shape system from sharp (0dp) to fully rounded (9999dp) with
/// semantic naming and component-specific recommendations.
part 'src/m3/tokens/sys/shape/m3_shape_token.dart';

/// **Spacing System**: 4dp grid-based spacing and margin tokens.
/// Complete spacing system with base spacing (4dp-128dp), responsive
/// margins,
/// and semantic spacer tokens for consistent spatial rhythm.
part 'src/m3/tokens/sys/spacing/m3_spacing_token.dart';

/// **State Tokens**: Interaction states and opacity management.

/// General opacity tokens for UI element transparency.
/// Provides semantic opacity values for disabled states (38%), dividers
/// (12%),
/// and backdrop overlays (50%) with accessibility-compliant transparency
/// levels.
part 'src/m3/tokens/sys/state/m3_opacity_token.dart';

/// Interactive state layer opacity tokens for user feedback.
/// Implements Material Design 3's state layer system with hover (8%),
/// focus (10%),
/// pressed (10%), and dragged (16%) opacity tokens for consistent
/// interaction feedback.
part 'src/m3/tokens/sys/state/m3_state_layer_opacity_token.dart';

/// State layer tokens for interactive element overlay management.
/// Provides comprehensive state layer implementation with color and
/// opacity combinations for consistent user interaction feedback
/// across all interactive components.
// part 'src/m3/tokens/sys/state/m3_state_layer_token.dart';

/// **Typography System**: Complete type scale and text styling tokens.
/// Comprehensive typography system with display, headline, title, body,
/// and label
/// categories, including responsive text, accessibility enhancements,
/// and adaptive scaling.
part 'src/m3/tokens/sys/typography/m3_text_style_token.dart';

/// Comprehensive accessibility toolkit for inclusive design.
/// Provides WCAG compliance tools, touch target management, high contrast
/// support, screen reader enhancements, and adaptive accessibility features.
part 'src/m3/utils/accessibility/m3_accessibility.dart';

/// Advanced adaptive design utilities for responsive, platform-aware layouts.
/// Includes breakpoint-based components, adaptive navigation patterns,
/// responsive dialogs, and platform-specific behavior adaptations.
part 'src/m3/utils/adaptive/m3_adaptive.dart';

/// Comprehensive color manipulation and accessibility utilities.
/// Provides color blending, contrast calculations, WCAG compliance checking,
/// state color generation, and accessible color adjustments.
part 'src/m3/utils/color/m3_color_utils.dart';
part 'src/m3/utils/layout/atom/m3_border_side.dart';

/// Advanced shape manipulation and component-specific shape utilities.
/// Includes responsive shapes, brand shape styles, accessibility enhancements,
/// and animation-ready shape transformations.
// part 'src/m3/utils/sys/m3_shape_utils.dart';

/// Custom BorderRadius that enforces Material Design 3 tokens.
part 'src/m3/utils/layout/atom/m3_radius.dart';
part 'src/m3/utils/layout/atom/m3_text_style.dart';
part 'src/m3/utils/layout/m3_border_radius.dart';

/// Material Design 3 EdgeInsets utility with comprehensive token integration.
/// Provides token-enforced edge insets with responsive calculations,
/// accessibility
/// adaptations, and common layout patterns for consistent spatial design.
part 'src/m3/utils/layout/m3_edge_insets.dart';
part 'src/m3/utils/layout/m3_rounded_rectangle_border.dart';
part 'src/m3/widgets/layout/box_shadow.dart';
part 'src/m3/widgets/layout/m3_border.dart';

/// Custom box decoration that enforces Material Design 3 tokens.
part 'src/m3/widgets/layout/m3_box_decoration.dart';
part 'src/m3/widgets/layout/m3_container.dart';

/// Intelligent gap widget with automatic orientation detection.
/// Creates spacing between layout elements with automatic parent context
/// detection,
/// supporting all spacing tokens with convenient factory methods and utilities.
part 'src/m3/widgets/layout/m3_gap.dart';

/// Token-enforced padding widget for consistent component spacing.
/// Ensures all padding uses Material Design 3 spacing tokens with support for
/// directional, symmetric, and uniform padding patterns with debug information.
part 'src/m3/widgets/layout/m3_padding.dart';

/// Material Design 3 ShapeDecoration utility with design token enforcement.
/// Provides comprehensive shape decoration creation using Material Design 3
/// shape tokens with built-in patterns, responsive shapes, and accessibility.
part 'src/m3/widgets/layout/m3_shape_decoration.dart';

/// **M3 Expressive Components**: Advanced Material Design 3 components.
/// Showcase Material Design 3's expressive capabilities with dynamic shapes,
/// morphing animations, and enhanced visual feedback.

/// Loading indicators with morphing shapes and expressive animations.
/// Provides contained and non-contained variants with customizable sequences.
part 'src/m3_expressive/loading_indicator/loading_indicator.dart';

/// Complete theming system for M3 Expressive loading indicators.
/// Defines visual properties and provides theme inheritance for styling.
part 'src/m3_expressive/loading_indicator/loading_indicator_theme.dart';

/// Material Design 3 expressive shapes collection.
/// Predefined shapes for morphing animations and decorative elements.
part 'src/m3_expressive/new_shapes/material_shapes.dart';

/// Shape corner rounding system for smooth polygon transitions.
part 'src/m3_expressive/new_shapes/shapes/corner_rounding.dart';

/// Cubic curve calculations for complex shape morphing.
part 'src/m3_expressive/new_shapes/shapes/cubic.dart';

/// Feature mapping utilities for shape transformation algorithms.
part 'src/m3_expressive/new_shapes/shapes/feature_mapping.dart';

/// Shape feature analysis and extraction system.
part 'src/m3_expressive/new_shapes/shapes/features.dart';

/// Float mapping utilities for precision shape calculations.
part 'src/m3_expressive/new_shapes/shapes/float_mapping.dart';

/// Shape morphing engine for smooth transitions between polygons.
part 'src/m3_expressive/new_shapes/shapes/morph.dart';

/// Point geometry utilities for shape vertex manipulation.
part 'src/m3_expressive/new_shapes/shapes/point.dart';

/// Polygon measurement and bounds calculation utilities.
part 'src/m3_expressive/new_shapes/shapes/polygon_measure.dart';

/// Core rounded polygon implementation with vertex and curve support.
part 'src/m3_expressive/new_shapes/shapes/rounded_polygon.dart';

/// Core shapes library with morphing, rounding, and transformation.
/// Foundation classes for creating and manipulating complex polygon shapes.
part 'src/m3_expressive/new_shapes/shapes/shapes.dart';

/// Shape utility functions and extension methods.
part 'src/m3_expressive/new_shapes/shapes/utils.dart';
