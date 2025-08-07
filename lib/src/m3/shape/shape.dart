part of '../../../../material_design.dart';

/// Material Design 3 [RoundedRectangleBorder] shapes for consistent component styling.
///
/// This class provides pre-configured [RoundedRectangleBorder] shapes that
/// implement Material Design 3's shape system. These shapes are ready to use
/// with Flutter widgets that accept [ShapeBorder] parameters, such as
/// [Material], [Card], [Button] variants, and custom containers.
///
/// Each shape uses [M3BorderRadius] values to ensure consistency with the
/// Material Design 3 specification while providing convenient access for
/// component styling and theming operations.
///
/// ## Usage
///
/// ```dart
/// // Apply shape to Material widget
/// Material(
///   shape: M3Shape.medium,
///   color: Colors.blue,
///   child: content,
/// )
///
/// // Use with Card widget
/// Card(
///   shape: M3Shape.large,
///   child: content,
/// )
///
/// // Apply to custom buttons
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     shape: M3Shape.small,
///   ),
///   onPressed: () {},
///   child: Text('Button'),
/// )
/// ```
///
/// ## Component Integration
///
/// These shapes integrate seamlessly with Flutter's theming system:
///
/// ```dart
/// // Apply globally through theme
/// MaterialApp(
///   theme: ThemeData(
///     cardTheme: CardTheme(shape: M3Shape.medium),
///     elevatedButtonTheme: ElevatedButtonThemeData(
///       style: ElevatedButton.styleFrom(shape: M3Shape.small),
///     ),
///   ),
/// )
/// ```
///
/// ## Performance
///
/// All shapes are compile-time constants, ensuring optimal performance
/// with no runtime allocation overhead.
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
class M3Shape extends RoundedRectangleBorder {
  /// Creates a rounded rectangle border with uniform border radius.
  const M3Shape({
    M3BorderSide super.side = M3BorderSide.none,
    M3BorderRadius super.borderRadius = M3BorderRadius.zero,
  });

  /// Sharp rectangular shape with no corner rounding.
  ///
  /// Creates precise geometric shapes suitable for technical interfaces,
  /// data displays, and components where corner rounding would interfere
  /// with functionality.
  static const zero = M3Shape();

  /// Extra small rounded rectangular shape (4dp corners).
  ///
  /// Provides subtle corner rounding for small components like chips,
  /// badges, and compact buttons where minimal visual enhancement is desired.
  static const extraSmall = M3Shape(borderRadius: M3BorderRadius.extraSmall);

  /// Small rounded rectangular shape (8dp corners).
  ///
  /// The standard shape for buttons, form controls, and small interactive
  /// elements. Balances visual appeal with functional clarity.
  static const small = M3Shape(borderRadius: M3BorderRadius.small);

  /// Medium rounded rectangular shape (12dp corners).
  ///
  /// The most commonly used shape in Material Design 3. Optimal for
  /// cards, containers, dialogs, and standard interface components.
  static const medium = M3Shape(borderRadius: M3BorderRadius.medium);

  /// Large rounded rectangular shape (16dp corners).
  ///
  /// Used for prominent components requiring enhanced visual hierarchy.
  /// Creates friendly, approachable shapes while maintaining professionalism.
  static const large = M3Shape(borderRadius: M3BorderRadius.large);

  /// Large increased rounded rectangular shape (20dp corners).
  ///
  /// Intermediate shape for components needing more visual emphasis than
  /// standard large but less than extra-large.
  static const largeIncreased = M3Shape(
    borderRadius: M3BorderRadius.largeIncreased,
  );

  /// Extra large rounded rectangular shape (28dp corners).
  ///
  /// Creates distinctive shapes for hero sections, large modal surfaces,
  /// bottom sheets, and prominent brand elements.
  static const extraLarge = M3Shape(borderRadius: M3BorderRadius.extraLarge);

  /// Extra large increased rounded rectangular shape (32dp corners).
  ///
  /// Maximum discrete shape for special emphasis components and
  /// brand-specific interface elements requiring strong visual impact.
  static const extraLargeIncreased = M3Shape(
    borderRadius: M3BorderRadius.extraLargeIncreased,
  );

  /// Extra extra large rounded rectangular shape (48dp corners).
  ///
  /// The largest discrete shape value, reserved for unique creative
  /// elements and scenarios requiring maximum visual emphasis.
  static const extraExtraLarge = M3Shape(
    borderRadius: M3BorderRadius.extraExtraLarge,
  );

  /// Fully rounded pill shape.
  ///
  /// Creates shapes with fully rounded ends that adapt to component
  /// dimensions. Perfect for floating action buttons, pill buttons,
  /// and search bars.
  static const full = M3Shape(borderRadius: M3BorderRadius.full);
}
