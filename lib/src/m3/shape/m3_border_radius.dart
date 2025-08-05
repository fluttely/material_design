part of '../../../../material_design.dart';

/// Material Design 3 [BorderRadius] objects for consistent component rounding.
///
/// This class provides pre-configured [BorderRadius] objects that implement
/// Material Design 3's shape system using uniform corner rounding. Each
/// [BorderRadius] applies the same radius to all four corners, creating
/// consistent visual appearance across different components.
///
/// These [BorderRadius] objects are built using [M3Radius] values, ensuring
/// consistency with the broader shape system while providing convenient
/// access for decoration and clipping operations.
///
/// ## Usage
///
/// ```dart
/// // Apply uniform border radius to containers
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: M3BorderRadius.medium,
///     color: Colors.blue,
///   ),
/// )
///
/// // Use with ClipRRect for content clipping
/// ClipRRect(
///   borderRadius: M3BorderRadius.large,
///   child: Image.network('https://example.com/image.jpg'),
/// )
///
/// // Apply to Material widgets
/// Material(
///   borderRadius: M3BorderRadius.small,
///   child: InkWell(
///     onTap: () {},
///     child: content,
///   ),
/// )
/// ```
///
/// ## Asymmetric Border M3Radius
///
/// For asymmetric corner rounding, use [BorderRadius.only] with individual
/// [M3Radius] values:
///
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: M3Radius.large,
///       topRight: M3Radius.large,
///       // Bottom corners remain sharp
///     ),
///   ),
/// )
/// ```
///
/// ## Performance
///
/// All [BorderRadius] objects are compile-time constants, ensuring optimal
/// performance with no runtime allocation overhead.
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
class M3BorderRadius extends BorderRadius {
  /// Creates uniform border radius from a shape token.
  const M3BorderRadius.all(M3Radius super.radius) : super.all();

  /// Creates vertical border radius (top or bottom).
  const M3BorderRadius.vertical({
    M3Radius top = M3Radius.zero,
    M3Radius bottom = M3Radius.zero,
  }) : super.vertical(
          top: top,
          bottom: bottom,
        );

  /// Creates horizontal border radius (left or right).
  const M3BorderRadius.horizontal({
    M3Radius left = M3Radius.zero,
    M3Radius right = M3Radius.zero,
  }) : super.horizontal(
          left: left,
          right: right,
        );

  /// Creates border radius with different tokens for each corner.
  const M3BorderRadius.only({
    M3Radius topLeft = M3Radius.zero,
    M3Radius topRight = M3Radius.zero,
    M3Radius bottomLeft = M3Radius.zero,
    M3Radius bottomRight = M3Radius.zero,
  }) : super.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        );

  /// No border radius - sharp rectangular corners.
  ///
  /// Equivalent to [M3BorderRadius.zero]. Creates precise geometric shapes
  /// with no corner rounding, suitable for technical interfaces and
  /// data-dense layouts.
  static const M3BorderRadius zero = M3BorderRadius.all(M3Radius.zero);

  /// Extra small uniform border radius (4dp all corners).
  ///
  /// Provides subtle corner rounding for small components like chips,
  /// badges, and compact interactive elements where minimal visual
  /// enhancement is desired.
  static const extraSmall = M3BorderRadius.all(M3Radius.extraSmall);

  /// Small uniform border radius (8dp all corners).
  ///
  /// The standard border radius for buttons, form controls, and small
  /// cards. Balances visual softness with functional clarity.
  static const small = M3BorderRadius.all(M3Radius.small);

  /// Medium uniform border radius (12dp all corners).
  ///
  /// The most commonly used border radius in Material Design 3.
  /// Optimal for standard cards, containers, dialogs, and most
  /// interface components requiring corner rounding.
  static const medium = M3BorderRadius.all(M3Radius.medium);

  /// Large uniform border radius (16dp all corners).
  ///
  /// Used for prominent components that need enhanced visual hierarchy.
  /// Creates friendly, approachable shapes while maintaining
  /// professional appearance.
  static const large = M3BorderRadius.all(M3Radius.large);

  /// Large increased uniform border radius (20dp all corners).
  ///
  /// Intermediate radius for components requiring more visual emphasis
  /// than standard large radius but less than extra-large.
  static const largeIncreased = M3BorderRadius.all(M3Radius.largeIncreased);

  /// Extra large uniform border radius (28dp all corners).
  ///
  /// Creates distinctive, friendly shapes for hero sections, large
  /// modal surfaces, bottom sheets, and prominent brand elements.
  static const extraLarge = M3BorderRadius.all(M3Radius.extraLarge);

  /// Extra large increased uniform border radius (32dp all corners).
  ///
  /// Maximum discrete border radius for special emphasis components
  /// and brand-specific interface elements requiring strong visual impact.
  static const extraLargeIncreased =
      M3BorderRadius.all(M3Radius.extraLargeIncreased);

  /// Extra extra large uniform border radius (48dp all corners).
  ///
  /// The largest discrete border radius value, reserved for unique
  /// creative elements and scenarios requiring maximum visual emphasis.
  static const extraExtraLarge = M3BorderRadius.all(M3Radius.extraExtraLarge);

  /// Full uniform border radius for pill shapes.
  ///
  /// Creates fully rounded shapes that adapt to component dimensions.
  /// Perfect for floating action buttons, pill-shaped buttons,
  /// search bars, and progress indicators.
  static const full = M3BorderRadius.all(M3Radius.full);
}
