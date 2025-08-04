part of '../../../../../../material_design.dart';

/// Material Design 3 [M3Radius] objects for consistent corner rounding.
///
/// This class provides pre-configured [M3Radius] objects that correspond to
/// Material Design 3's shape system values. These [M3Radius] objects can be
/// used directly with Flutter's layout and decoration APIs to create
/// consistent corner rounding throughout the application.
///
/// Each [M3Radius] uses the circular constructor with values from [M3CornersToken],
/// ensuring consistency with the Material Design 3 specification while
/// providing type-safe access to radius values.
///
/// ## Usage
///
/// ```dart
/// // Use directly with BorderRadius
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.all(M3Radius.medium),
///   ),
/// )
///
/// // Use with ClipRRect
/// ClipRRect(
///   borderRadius: BorderRadius.all(M3Radius.large),
///   child: Image.asset('image.jpg'),
/// )
///
/// // Mix with other radius values
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: M3Radius.large,
///       topRight: M3Radius.large,
///       bottomLeft: M3Radius.small,
///       bottomRight: M3Radius.small,
///     ),
///   ),
/// )
/// ```
///
/// ## Performance
///
/// All [M3Radius] objects are declared as compile-time constants, providing
/// optimal performance with no runtime overhead.
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
class M3Radius extends Radius {
  /// Creates uniform border radius from a shape token.
  const M3Radius.circular(M3CornersToken corner)
      : super.circular(
          corner == M3CornersToken.none
              ? M3Corners.none
              : corner == M3CornersToken.extraSmall
                  ? M3Corners.extraSmall
                  : corner == M3CornersToken.small
                      ? M3Corners.small
                      : corner == M3CornersToken.medium
                          ? M3Corners.medium
                          : corner == M3CornersToken.large
                              ? M3Corners.large
                              : corner == M3CornersToken.largeIncreased
                                  ? M3Corners.largeIncreased
                                  : corner == M3CornersToken.extraLarge
                                      ? M3Corners.extraLarge
                                      : corner ==
                                              M3CornersToken.extraLargeIncreased
                                          ? M3Corners.extraLargeIncreased
                                          : corner ==
                                                  M3CornersToken.extraExtraLarge
                                              ? M3Corners.extraExtraLarge
                                              : M3Corners.full,
        );

  /// No corner radius - sharp rectangular corners.
  ///
  /// Equivalent to [M3Radius.zero]. Used for precise geometric shapes
  /// or when corner rounding would interfere with content display.
  static const M3Radius zero = M3Radius.circular(M3CornersToken.none);

  /// Extra small circular radius (4dp).
  ///
  /// Provides subtle corner softening for small components and
  /// precise interface elements that need minimal visual enhancement.
  static const extraSmall = M3Radius.circular(M3CornersToken.extraSmall);

  /// Small circular radius (8dp).
  ///
  /// The standard radius for buttons, chips, and small interactive
  /// elements. Balances visual appeal with functional clarity.
  static const small = M3Radius.circular(M3CornersToken.small);

  /// Medium circular radius (12dp).
  ///
  /// The most commonly used radius in Material Design 3. Optimal
  /// for cards, containers, and standard interface components.
  static const medium = M3Radius.circular(M3CornersToken.medium);

  /// Large circular radius (16dp).
  ///
  /// Used for prominent components requiring enhanced visual hierarchy
  /// and friendly, approachable appearance.
  static const large = M3Radius.circular(M3CornersToken.large);

  /// Large increased circular radius (20dp).
  ///
  /// Intermediate radius for components needing more emphasis than
  /// standard large but less than extra-large.
  static const largeIncreased =
      M3Radius.circular(M3CornersToken.largeIncreased);

  /// Extra large circular radius (28dp).
  ///
  /// Creates distinctive shapes for hero sections, large modals,
  /// and prominent brand elements.
  static const extraLarge = M3Radius.circular(M3CornersToken.extraLarge);

  /// Extra large increased circular radius (32dp).
  ///
  /// Maximum discrete radius for special emphasis and brand-specific
  /// interface elements requiring strong visual impact.
  static const extraLargeIncreased =
      M3Radius.circular(M3CornersToken.extraLargeIncreased);

  /// Extra extra large circular radius (48dp).
  ///
  /// The largest discrete radius value, reserved for unique creative
  /// elements and maximum visual emphasis scenarios.
  static const extraExtraLarge =
      M3Radius.circular(M3CornersToken.extraExtraLarge);

  /// Full circular radius for pill shapes.
  ///
  /// Creates fully rounded ends that adapt to component dimensions.
  /// Perfect for floating action buttons, pill buttons, and search bars.
  static const full = M3Radius.circular(M3CornersToken.full);
}
