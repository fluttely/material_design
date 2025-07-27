/// # Material Design 3 (M3) Comprehensive Token System
///
/// This library provides a complete, production-ready implementation of Material
/// Design 3's design token system, utilities, and widgets. It includes reference
/// tokens, system tokens, component-specific implementations, accessibility
/// features, and responsive design capabilities.
///
/// ## Token Architecture
///
/// Material Design 3 follows a sophisticated three-tier token architecture:
///
/// ### Reference Tokens
/// Base atomic values that form the foundation of the design system.
/// These are the raw values from which all other tokens derive, including
/// fundamental color palettes, typography scales, and spacing increments.
///
/// ### System Tokens
/// Semantic tokens that map reference tokens to specific design intentions,
/// providing meaning and context to the base reference values. System tokens
/// include elevation, spacing, typography, motion, and interaction states.
///
/// ### Component Tokens
/// Specific tokens for individual UI components that reference system tokens
/// for consistent styling and behavior across the design system. These ensure
/// component-specific implementations remain aligned with the global system.
///
/// ## Core System Features
///
/// ### 🎨 Complete Token Coverage
/// - **Spacing**: 4dp grid system with semantic tokens
/// - **Typography**: Full type scale with accessibility support
/// - **Elevation**: Tonal elevation system with shadow support
/// - **Motion**: Duration and easing tokens for animations
/// - **Shape**: Comprehensive corner radius system
/// - **State**: Interaction states and opacity tokens
/// - **Visual Density**: Adaptive spacing for different contexts
///
/// ### 📱 Responsive & Adaptive
/// - **Breakpoint System**: Five-tier responsive breakpoints
/// - **Adaptive Utilities**: Platform-aware component behavior
/// - **Screen Size Classes**: Compact to extra-large support
/// - **Context-Aware**: Automatic adaptation based on environment
///
/// ### ♿ Accessibility Built-In
/// - **WCAG Compliance**: AA and AAA contrast support
/// - **Touch Targets**: Minimum size enforcement
/// - **High Contrast**: Enhanced visibility options
/// - **Reduced Motion**: Animation preferences support
/// - **Screen Reader**: Semantic markup and labels
///
/// ### 🛠️ Developer Experience
/// - **Type Safety**: Compile-time token validation
/// - **IntelliSense**: Rich documentation and autocompletion
/// - **Performance**: Optimized implementations with caching
/// - **Debugging**: Rich diagnostic information
///
/// ## Quick Start Examples
///
/// ### Basic Token Usage
/// ```dart
/// import 'package:material_design/m3/m3.dart';
///
/// // Spacing with design tokens
/// M3Padding.all(
///   M3SpacingToken.space16,
///   child: Text('Token-based spacing'),
/// )
///
/// // Typography with semantic roles
/// Text(
///   'Heading',
///   style: M3TextStyleToken.headlineLarge.value,
/// )
///
/// // Responsive design
/// M3Adaptive.responsiveLayout(
///   context: context,
///   compact: MobileLayout(),
///   expanded: TabletLayout(),
///   large: DesktopLayout(),
/// )
/// ```
///
/// ### Advanced Features
/// ```dart
/// // Accessibility-enhanced components
/// M3Accessibility.accessibleButton(
///   child: Text('Accessible Button'),
///   onPressed: handlePress,
///   semanticLabel: 'Submit form',
/// )
///
/// // Responsive navigation
/// M3AdaptiveScaffold(
///   body: content,
///   destinations: navItems,
///   selectedIndex: currentIndex,
///   onDestinationSelected: onNavChanged,
/// )
///
/// // Motion with proper easing
/// AnimatedContainer(
///   duration: M3MotionToken.standard.duration,
///   curve: M3MotionToken.standard.easing,
///   // ... other properties
/// )
/// ```
///
/// ### Color and Elevation
/// ```dart
/// // Elevation with proper tonal colors
/// Container(
///   decoration: BoxDecoration(
///     color: M3ElevationToken.level2.surfaceColor(context),
///     boxShadow: M3ElevationToken.level2.shadows,
///     borderRadius: M3ShapeToken.medium.borderRadius,
///   ),
/// )
///
/// // Accessible color combinations
/// final accessibleColor = M3ColorUtils.adjustForAccessibility(
///   myColor,
///   backgroundColor,
///   minContrast: 4.5,
/// );
/// ```
///
/// ## Integration Patterns
///
/// ### Theme Integration
/// ```dart
/// // Apply M3 tokens to Flutter theme
/// ThemeData(
///   textTheme: TextTheme(
///     headlineLarge: M3TextStyleToken.headlineLarge.value,
///     bodyLarge: M3TextStyleToken.bodyLarge.value,
///   ),
///   visualDensity: M3VisualDensityToken.standard.value,
/// )
/// ```
///
/// ### Custom Component Development
/// ```dart
/// // Build components with M3 tokens
/// class CustomCard extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Container(
///       padding: M3EdgeInsets.all(M3SpacingToken.space16),
///       margin: M3EdgeInsets.all(M3SpacingToken.space8),
///       decoration: BoxDecoration(
///         color: M3ElevationToken.level1.surfaceColor(context),
///         borderRadius: M3ShapeToken.medium.borderRadius,
///         boxShadow: M3ElevationToken.level1.shadows,
///       ),
///       child: content,
///     );
///   }
/// }
/// ```
///
/// ## Performance & Best Practices
///
/// - All tokens are compile-time constants for optimal performance
/// - Utility classes use static methods to avoid object allocation
/// - Responsive utilities cache calculations for smooth animations
/// - Design system enforcement prevents inconsistent spacing/styling
///
/// ## References
///
/// - [Material Design 3 Guidelines](https://m3.material.io/)
/// - [Design Tokens Specification](https://m3.material.io/foundations/design-tokens)
/// - [Accessibility Guidelines](https://m3.material.io/foundations/accessible-design)
/// - [Responsive Layout Guide](https://m3.material.io/foundations/layout)
library;

// === CORE SYSTEM UTILITIES ===
// Essential utilities that enhance Material Design 3 functionality

/// **Elevation System**: Tonal elevation and shadow tokens.
/// Implements Material Design 3's primary depth indication system using
/// surface tinting combined with complementary shadow effects for natural depth perception.
export 'tokens/sys/elevation/m3_elevation_token.dart';

/// **Geometry Tokens**: Spatial and dimensional design tokens.
/// Comprehensive geometric system including borders, breakpoints, icon sizing, and z-index layering.

/// Border width tokens for consistent component outlining and separation.
/// Provides semantic border widths from subtle (1dp) to prominent (4dp) with usage guidelines.
export 'tokens/sys/geometry/m3_border_token.dart';

/// Responsive breakpoint system for adaptive layout design.
/// Implements Material Design 3's five-tier breakpoint system with utility methods
/// for responsive components, navigation patterns, and screen size adaptation.
export 'tokens/sys/geometry/m3_breakpoint_token.dart';

/// Icon sizing tokens for consistent iconography across interface elements.
/// Provides semantic icon sizes from dense (20dp) to extra-large (48dp) with
/// context-appropriate usage recommendations.
export 'tokens/sys/geometry/m3_icon_size_token.dart';

/// Z-index layering tokens for predictable component stacking order.
/// Establishes consistent layering hierarchy from background (0) to tooltips (9999)
/// ensuring proper visual relationships and interaction patterns.
export 'tokens/sys/geometry/m3_z_index_token.dart';

/// **Interaction Tokens**: User interaction and feedback systems.

/// Visual density tokens for adaptive component spacing.
/// Provides platform-aware density adjustment from compact (-2,-2) to comfortable (-1,-1)
/// with automatic platform adaptation and accessibility considerations.
export 'tokens/sys/interaction/m3_visual_density_token.dart';

/// Base interface for all Material Design 3 design tokens.
/// Defines the fundamental contract for type-safe token implementation
/// with comprehensive documentation and usage examples.
export 'tokens/sys/interfaces/m3_token.dart';

/// **Motion System**: Animation duration and easing tokens.
/// Complete motion design system with duration tokens (50ms-1000ms) and
/// easing curves (emphasized, standard, linear) for natural, consistent animations.
export 'tokens/sys/motion/m3_motion_token.dart';

/// **Shape System**: Corner radius and border radius tokens.
/// Comprehensive shape system from sharp (0dp) to fully rounded (9999dp) with
/// semantic naming and component-specific recommendations.
export 'tokens/sys/shape/m3_shape_token.dart';

/// **Spacing System**: 4dp grid-based spacing and margin tokens.
/// Complete spacing system with base spacing (4dp-128dp), responsive margins,
/// and semantic spacer tokens for consistent spatial rhythm.
export 'tokens/sys/spacing/m3_spacing_token.dart';

/// **State Tokens**: Interaction states and opacity management.

/// General opacity tokens for UI element transparency.
/// Provides semantic opacity values for disabled states (38%), dividers (12%),
/// and backdrop overlays (50%) with accessibility-compliant transparency levels.
export 'tokens/sys/state/m3_opacity_token.dart';

/// Interactive state layer opacity tokens for user feedback.
/// Implements Material Design 3's state layer system with hover (8%), focus (10%),
/// pressed (10%), and dragged (16%) opacity tokens for consistent interaction feedback.
export 'tokens/sys/state/m3_state_layer_opacity_token.dart';

/// **Typography System**: Complete type scale and text styling tokens.
/// Comprehensive typography system with display, headline, title, body, and label
/// categories, including responsive text, accessibility enhancements, and adaptive scaling.
export 'tokens/sys/typography/m3_text_style_token.dart';

/// Comprehensive accessibility toolkit for inclusive design.
/// Provides WCAG compliance tools, touch target management, high contrast
/// support, screen reader enhancements, and adaptive accessibility features.
export 'utils/accessibility/m3_accessibility.dart';

/// Advanced adaptive design utilities for responsive, platform-aware layouts.
/// Includes breakpoint-based components, adaptive navigation patterns,
/// responsive dialogs, and platform-specific behavior adaptations.
export 'utils/adaptive/m3_adaptive.dart';

/// Comprehensive color manipulation and accessibility utilities.
/// Provides color blending, contrast calculations, WCAG compliance checking,
/// state color generation, and accessible color adjustments.
export 'utils/color/m3_color_utils.dart';

/// Advanced shape manipulation and component-specific shape utilities.
/// Includes responsive shapes, brand shape styles, accessibility enhancements,
/// and animation-ready shape transformations.
export 'utils/sys/m3_shape_utils.dart';

/// Material Design 3 EdgeInsets utility with comprehensive token integration.
/// Provides token-enforced edge insets with responsive calculations, accessibility
/// adaptations, and common layout patterns for consistent spatial design.
export 'widgets/layout/m3_edge_insets.dart';

/// Intelligent gap widget with automatic orientation detection.
/// Creates spacing between layout elements with automatic parent context detection,
/// supporting all spacing tokens with convenient factory methods and utilities.
export 'widgets/layout/m3_gap.dart';

/// Token-enforced padding widget for consistent component spacing.
/// Ensures all padding uses Material Design 3 spacing tokens with support for
/// directional, symmetric, and uniform padding patterns with debug information.
export 'widgets/layout/m3_padding.dart';
