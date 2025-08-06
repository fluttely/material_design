part of '../../../../material_design.dart';

/// Material Design 3 corner radius values in density-independent pixels (dp).
///
/// This class defines the core corner radius values used throughout the Material
/// Design 3 shape system. These values are carefully selected to provide
/// optimal visual hierarchy and consistency across different components
/// and interaction states.
///
/// The corner radius values follow Material Design 3's shape system principles:
/// - **Progressive scaling**: Each step provides meaningful visual difference
/// - **Semantic naming**: Names reflect size relationships and use cases
/// - **Component compatibility**: Values work harmoniously across components
/// - **Accessibility compliance**: Suitable contrast and touch target sizes
///
/// ## Value Categories
///
/// - **None to Small (0-8dp)**: Subtle corner rounding for compact elements
/// - **Medium to Large (12-20dp)**: Standard rounding for most components
/// - **Extra Large+ (28dp+)**: Prominent rounding for surfaces and containers
/// - **Full (9999dp)**: Pill shapes and fully rounded elements
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
abstract final class M3Corners {
  const M3Corners._();

  /// No corner radius (0dp).
  ///
  /// Creates sharp, rectangular corners. Used when geometric precision
  /// is required or when corner rounding would interfere with content.
  ///
  /// **Common use cases:**
  /// - System UI elements requiring precision
  /// - Dense data display components
  /// - Technical interfaces and dashboards
  static const double zero = 0;

  /// Extra small corner radius (4dp).
  ///
  /// Provides minimal corner softening while maintaining a crisp appearance.
  /// Ideal for small components where subtle rounding improves aesthetics
  /// without affecting functionality.
  ///
  /// **Common use cases:**
  /// - Small chips and tags
  /// - Compact buttons in dense interfaces
  /// - Icon containers and avatars (small)
  /// - Input field decorations
  static const double extraSmall = 4;

  /// Small corner radius (8dp).
  ///
  /// The standard radius for buttons and small interactive elements.
  /// Provides comfortable visual softness while maintaining clear boundaries.
  ///
  /// **Common use cases:**
  /// - Text buttons and outlined buttons
  /// - Small cards and containers
  /// - Chips and selection controls
  /// - Tab indicators and badges
  static const double small = 8;

  /// Medium corner radius (12dp).
  ///
  /// The most commonly used radius in Material Design 3. Provides optimal
  /// balance between softness and clarity for most interface components.
  ///
  /// **Common use cases:**
  /// - Standard cards and surfaces
  /// - Medium-sized buttons and controls
  /// - Input fields and text areas
  /// - Modal and dialog containers
  static const double medium = 12;

  /// Large corner radius (16dp).
  ///
  /// Used for prominent components that need enhanced visual hierarchy. Creates a
  /// friendly, approachable appearance while maintaining professionalism.
  ///
  /// **Common use cases:**
  /// - Prominent cards and hero sections
  /// - Large buttons and call-to-action elements
  /// - Feature containers and highlight boxes
  /// - Navigation panels and drawers
  static const double large = 16;

  /// Large increased corner radius (20dp).
  ///
  /// An intermediate value between large and extra-large, used for components
  /// that need slightly more emphasis than standard large radius provides.
  ///
  /// **Common use cases:**
  /// - Extended FAB containers
  /// - Feature showcase cards
  /// - Secondary navigation elements
  /// - Content preview containers
  static const double largeIncreased = 20;

  /// Extra large corner radius (28dp).
  ///
  /// Creates distinctive, friendly shapes for prominent surfaces and containers.
  /// Ideal for components that should feel approachable and engaging.
  ///
  /// **Common use cases:**
  /// - Hero sections and feature containers
  /// - Large modal surfaces and bottom sheets
  /// - Prominent call-to-action areas
  /// - Brand elements and promotional content
  static const double extraLarge = 28;

  /// Extra large increased corner radius (32dp).
  ///
  /// Provides stronger visual emphasis than standard extra-large radius.
  /// Used sparingly for components requiring maximum corner emphasis.
  ///
  /// **Common use cases:**
  /// - Premium feature containers
  /// - Large promotional surfaces
  /// - Special status indicators
  /// - Brand-specific interface elements
  static const double extraLargeIncreased = 32;

  /// Extra extra large corner radius (48dp).
  ///
  /// The largest discrete radius value, creating distinctive organic shapes.
  /// Reserved for special cases requiring maximum visual impact.
  ///
  /// **Common use cases:**
  /// - Special promotional containers
  /// - Brand showcase elements
  /// - Unique status indicators
  /// - Creative layout elements
  static const double extraExtraLarge = 48;

  /// Full corner radius for creating pill shapes (9999dp).
  ///
  /// Creates fully rounded ends that adapt to component height or width.
  /// The large value ensures complete rounding regardless of component size.
  ///
  /// **Common use cases:**
  /// - Floating action buttons
  /// - Pill-shaped buttons and controls
  /// - Search bars and input fields
  /// - Progress indicators and badges
  static const double full = 9999;
}

/// Material Design 3 corner radius values in density-independent pixels (dp).
///
/// This class defines the core corner radius values used throughout the Material
/// Design 3 shape system. These values are carefully selected to provide
/// optimal visual hierarchy and consistency across different components
/// and interaction states.
///
/// The corner radius values follow Material Design 3's shape system principles:
/// - **Progressive scaling**: Each step provides meaningful visual difference
/// - **Semantic naming**: Names reflect size relationships and use cases
/// - **Component compatibility**: Values work harmoniously across components
/// - **Accessibility compliance**: Suitable contrast and touch target sizes
///
/// ## Value Categories
///
/// - **None to Small (0-8dp)**: Subtle corner rounding for compact elements
/// - **Medium to Large (12-20dp)**: Standard rounding for most components
/// - **Extra Large+ (28dp+)**: Prominent rounding for surfaces and containers
/// - **Full (9999dp)**: Pill shapes and fully rounded elements
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
enum M3CornerToken implements IM3Token<double> {
  /// No corner radius (0dp).
  zero(M3Corners.zero),

  /// Extra small corner radius (4dp).
  extraSmall(M3Corners.extraSmall),

  /// Small corner radius (8dp).
  small(M3Corners.small),

  /// Medium corner radius (12dp).
  medium(M3Corners.medium),

  /// Large corner radius (16dp).
  large(M3Corners.large),

  /// Large increased corner radius (20dp).
  largeIncreased(M3Corners.largeIncreased),

  /// Extra large corner radius (28dp).
  extraLarge(M3Corners.extraLarge),

  /// Extra large increased corner radius (32dp).
  extraLargeIncreased(M3Corners.extraLargeIncreased),

  /// Extra extra large corner radius (48dp).
  extraExtraLarge(M3Corners.extraExtraLarge),

  /// Full corner radius, used for creating pill shapes.
  full(M3Corners.full);

  const M3CornerToken(this.value);

  @override
  final double value;
}

// // Supondo que 'token' seja uma constante de tempo de compilação.
// const M3CornersToken token = M3CornersToken.medium;

// // Ternário aninhado que mapeia o enum M3CornersToken para M3CornersToken.
// const double result = token == M3CornersToken.none
//     ? M3CornersToken.none
//     : token == M3CornersToken.extraSmall
//         ? M3CornersToken.extraSmall
//         : token == M3CornersToken.small
//             ? M3CornersToken.small
//             : token == M3CornersToken.medium
//                 ? M3CornersToken.medium
//                 : token == M3CornersToken.large
//                     ? M3CornersToken.large
//                     : token == M3CornersToken.largeIncreased
//                         ? M3CornersToken.largeIncreased
//                         : token == M3CornersToken.extraLarge
//                             ? M3CornersToken.extraLarge
//                             : token == M3CornersToken.extraLargeIncreased
//                                 ? M3CornersToken.extraLargeIncreased
//                                 : token == M3CornersToken.extraExtraLarge
//                                     ? M3CornersToken.extraExtraLarge
//                                     : M3CornersToken.full;

// void main() {
//   // result terá o valor de M3CornersToken.medium (12.0)
//   print(result);
// }
