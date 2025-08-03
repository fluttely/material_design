part of '../../../../../material_design.dart';

/// Material Design 3 radius values in density-independent pixels (dp).
///
/// This class defines the core radius values used throughout the Material
/// Design 3 shape system. These values are carefully selected to provide
/// optimal visual hierarchy and consistency across different components
/// and interaction states.
///
/// The radius values follow Material Design 3's shape system principles:
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
abstract final class M3RadiusValues {
  const M3RadiusValues._();

  /// No corner radius (0dp).
  ///
  /// Creates sharp, rectangular corners. Used when geometric precision
  /// is required or when corner rounding would interfere with content.
  ///
  /// **Common use cases:**
  /// - System UI elements requiring precision
  /// - Dense data display components
  /// - Technical interfaces and dashboards
  static const double none = 0;

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

/// Material Design 3 [Radius] objects for consistent corner rounding.
///
/// This class provides pre-configured [Radius] objects that correspond to
/// Material Design 3's shape system values. These [Radius] objects can be
/// used directly with Flutter's layout and decoration APIs to create
/// consistent corner rounding throughout the application.
///
/// Each [Radius] uses the circular constructor with values from [M3RadiusValues],
/// ensuring consistency with the Material Design 3 specification while
/// providing type-safe access to radius values.
///
/// ## Usage
///
/// ```dart
/// // Use directly with BorderRadius
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.all(M3Radii.medium),
///   ),
/// )
///
/// // Use with ClipRRect
/// ClipRRect(
///   borderRadius: BorderRadius.all(M3Radii.large),
///   child: Image.asset('image.jpg'),
/// )
///
/// // Mix with other radius values
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: M3Radii.large,
///       topRight: M3Radii.large,
///       bottomLeft: M3Radii.small,
///       bottomRight: M3Radii.small,
///     ),
///   ),
/// )
/// ```
///
/// ## Performance
///
/// All [Radius] objects are declared as compile-time constants, providing
/// optimal performance with no runtime overhead.
///
/// Reference: https://m3.material.io/foundations/shape/shape-scale
abstract final class M3Radii {
  const M3Radii._();

  /// No corner radius - sharp rectangular corners.
  ///
  /// Equivalent to [Radius.zero]. Used for precise geometric shapes
  /// or when corner rounding would interfere with content display.
  static const Radius none = Radius.zero;

  /// Extra small circular radius (4dp).
  ///
  /// Provides subtle corner softening for small components and
  /// precise interface elements that need minimal visual enhancement.
  static const extraSmall = Radius.circular(M3RadiusValues.extraSmall);

  /// Small circular radius (8dp).
  ///
  /// The standard radius for buttons, chips, and small interactive
  /// elements. Balances visual appeal with functional clarity.
  static const small = Radius.circular(M3RadiusValues.small);

  /// Medium circular radius (12dp).
  ///
  /// The most commonly used radius in Material Design 3. Optimal
  /// for cards, containers, and standard interface components.
  static const medium = Radius.circular(M3RadiusValues.medium);

  /// Large circular radius (16dp).
  ///
  /// Used for prominent components requiring enhanced visual hierarchy
  /// and friendly, approachable appearance.
  static const large = Radius.circular(M3RadiusValues.large);

  /// Large increased circular radius (20dp).
  ///
  /// Intermediate radius for components needing more emphasis than
  /// standard large but less than extra-large.
  static const largeIncreased = Radius.circular(M3RadiusValues.largeIncreased);

  /// Extra large circular radius (28dp).
  ///
  /// Creates distinctive shapes for hero sections, large modals,
  /// and prominent brand elements.
  static const extraLarge = Radius.circular(M3RadiusValues.extraLarge);

  /// Extra large increased circular radius (32dp).
  ///
  /// Maximum discrete radius for special emphasis and brand-specific
  /// interface elements requiring strong visual impact.
  static const extraLargeIncreased =
      Radius.circular(M3RadiusValues.extraLargeIncreased);

  /// Extra extra large circular radius (48dp).
  ///
  /// The largest discrete radius value, reserved for unique creative
  /// elements and maximum visual emphasis scenarios.
  static const extraExtraLarge =
      Radius.circular(M3RadiusValues.extraExtraLarge);

  /// Full circular radius for pill shapes.
  ///
  /// Creates fully rounded ends that adapt to component dimensions.
  /// Perfect for floating action buttons, pill buttons, and search bars.
  static const full = Radius.circular(M3RadiusValues.full);
}

/// Material Design 3 [BorderRadius] objects for consistent component rounding.
///
/// This class provides pre-configured [BorderRadius] objects that implement
/// Material Design 3's shape system using uniform corner rounding. Each
/// [BorderRadius] applies the same radius to all four corners, creating
/// consistent visual appearance across different components.
///
/// These [BorderRadius] objects are built using [M3Radii] values, ensuring
/// consistency with the broader shape system while providing convenient
/// access for decoration and clipping operations.
///
/// ## Usage
///
/// ```dart
/// // Apply uniform border radius to containers
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: M3BorderRadii.medium,
///     color: Colors.blue,
///   ),
/// )
///
/// // Use with ClipRRect for content clipping
/// ClipRRect(
///   borderRadius: M3BorderRadii.large,
///   child: Image.network('https://example.com/image.jpg'),
/// )
///
/// // Apply to Material widgets
/// Material(
///   borderRadius: M3BorderRadii.small,
///   child: InkWell(
///     onTap: () {},
///     child: content,
///   ),
/// )
/// ```
///
/// ## Asymmetric Border Radius
///
/// For asymmetric corner rounding, use [BorderRadius.only] with individual
/// [M3Radii] values:
///
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: M3Radii.large,
///       topRight: M3Radii.large,
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
abstract final class M3BorderRadii {
  const M3BorderRadii._();

  /// No border radius - sharp rectangular corners.
  ///
  /// Equivalent to [BorderRadius.zero]. Creates precise geometric shapes
  /// with no corner rounding, suitable for technical interfaces and
  /// data-dense layouts.
  static const BorderRadius radiusNone = BorderRadius.zero;

  /// Extra small uniform border radius (4dp all corners).
  ///
  /// Provides subtle corner rounding for small components like chips,
  /// badges, and compact interactive elements where minimal visual
  /// enhancement is desired.
  static const extraSmall = BorderRadius.all(M3Radii.extraSmall);

  /// Small uniform border radius (8dp all corners).
  ///
  /// The standard border radius for buttons, form controls, and small
  /// cards. Balances visual softness with functional clarity.
  static const small = BorderRadius.all(M3Radii.small);

  /// Medium uniform border radius (12dp all corners).
  ///
  /// The most commonly used border radius in Material Design 3.
  /// Optimal for standard cards, containers, dialogs, and most
  /// interface components requiring corner rounding.
  static const medium = BorderRadius.all(M3Radii.medium);

  /// Large uniform border radius (16dp all corners).
  ///
  /// Used for prominent components that need enhanced visual hierarchy.
  /// Creates friendly, approachable shapes while maintaining
  /// professional appearance.
  static const large = BorderRadius.all(M3Radii.large);

  /// Large increased uniform border radius (20dp all corners).
  ///
  /// Intermediate radius for components requiring more visual emphasis
  /// than standard large radius but less than extra-large.
  static const largeIncreased = BorderRadius.all(M3Radii.largeIncreased);

  /// Extra large uniform border radius (28dp all corners).
  ///
  /// Creates distinctive, friendly shapes for hero sections, large
  /// modal surfaces, bottom sheets, and prominent brand elements.
  static const extraLarge = BorderRadius.all(M3Radii.extraLarge);

  /// Extra large increased uniform border radius (32dp all corners).
  ///
  /// Maximum discrete border radius for special emphasis components
  /// and brand-specific interface elements requiring strong visual impact.
  static const extraLargeIncreased =
      BorderRadius.all(M3Radii.extraLargeIncreased);

  /// Extra extra large uniform border radius (48dp all corners).
  ///
  /// The largest discrete border radius value, reserved for unique
  /// creative elements and scenarios requiring maximum visual emphasis.
  static const extraExtraLarge = BorderRadius.all(M3Radii.extraExtraLarge);

  /// Full uniform border radius for pill shapes.
  ///
  /// Creates fully rounded shapes that adapt to component dimensions.
  /// Perfect for floating action buttons, pill-shaped buttons,
  /// search bars, and progress indicators.
  static const full = BorderRadius.all(M3Radii.full);
}

/// Material Design 3 [RoundedRectangleBorder] shapes for consistent component styling.
///
/// This class provides pre-configured [RoundedRectangleBorder] shapes that
/// implement Material Design 3's shape system. These shapes are ready to use
/// with Flutter widgets that accept [ShapeBorder] parameters, such as
/// [Material], [Card], [Button] variants, and custom containers.
///
/// Each shape uses [M3BorderRadii] values to ensure consistency with the
/// Material Design 3 specification while providing convenient access for
/// component styling and theming operations.
///
/// ## Usage
///
/// ```dart
/// // Apply shape to Material widget
/// Material(
///   shape: M3Shapes.medium,
///   color: Colors.blue,
///   child: content,
/// )
///
/// // Use with Card widget
/// Card(
///   shape: M3Shapes.large,
///   child: content,
/// )
///
/// // Apply to custom buttons
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     shape: M3Shapes.small,
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
///     cardTheme: CardTheme(shape: M3Shapes.medium),
///     elevatedButtonTheme: ElevatedButtonThemeData(
///       style: ElevatedButton.styleFrom(shape: M3Shapes.small),
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
abstract final class M3Shapes {
  const M3Shapes._();

  /// Sharp rectangular shape with no corner rounding.
  ///
  /// Creates precise geometric shapes suitable for technical interfaces,
  /// data displays, and components where corner rounding would interfere
  /// with functionality.
  static const none = RoundedRectangleBorder();

  /// Extra small rounded rectangular shape (4dp corners).
  ///
  /// Provides subtle corner rounding for small components like chips,
  /// badges, and compact buttons where minimal visual enhancement is desired.
  static const extraSmall =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.extraSmall);

  /// Small rounded rectangular shape (8dp corners).
  ///
  /// The standard shape for buttons, form controls, and small interactive
  /// elements. Balances visual appeal with functional clarity.
  static const small =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.small);

  /// Medium rounded rectangular shape (12dp corners).
  ///
  /// The most commonly used shape in Material Design 3. Optimal for
  /// cards, containers, dialogs, and standard interface components.
  static const medium =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.medium);

  /// Large rounded rectangular shape (16dp corners).
  ///
  /// Used for prominent components requiring enhanced visual hierarchy.
  /// Creates friendly, approachable shapes while maintaining professionalism.
  static const large =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.large);

  /// Large increased rounded rectangular shape (20dp corners).
  ///
  /// Intermediate shape for components needing more visual emphasis than
  /// standard large but less than extra-large.
  static const largeIncreased =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.largeIncreased);

  /// Extra large rounded rectangular shape (28dp corners).
  ///
  /// Creates distinctive shapes for hero sections, large modal surfaces,
  /// bottom sheets, and prominent brand elements.
  static const extraLarge =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.extraLarge);

  /// Extra large increased rounded rectangular shape (32dp corners).
  ///
  /// Maximum discrete shape for special emphasis components and
  /// brand-specific interface elements requiring strong visual impact.
  static const extraLargeIncreased =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.extraLargeIncreased);

  /// Extra extra large rounded rectangular shape (48dp corners).
  ///
  /// The largest discrete shape value, reserved for unique creative
  /// elements and scenarios requiring maximum visual emphasis.
  static const extraExtraLarge =
      RoundedRectangleBorder(borderRadius: M3BorderRadii.extraExtraLarge);

  /// Fully rounded pill shape.
  ///
  /// Creates shapes with fully rounded ends that adapt to component
  /// dimensions. Perfect for floating action buttons, pill buttons,
  /// and search bars.
  static const full = RoundedRectangleBorder(borderRadius: M3BorderRadii.full);
}

enum M3RadiusValueToken implements IM3Token<double> {
  /// No corner radius (0dp).
  none(M3RadiusValues.none),

  /// Extra small corner radius (4dp).
  extraSmall(M3RadiusValues.extraSmall),

  /// Small corner radius (8dp).
  small(M3RadiusValues.small),

  /// Medium corner radius (12dp).
  medium(M3RadiusValues.medium),

  /// Large corner radius (16dp).
  large(M3RadiusValues.large),

  /// Large increased corner radius (20dp).
  largeIncreased(M3RadiusValues.largeIncreased),

  /// Extra large corner radius (28dp).
  extraLarge(M3RadiusValues.extraLarge),

  /// Extra large increased corner radius (32dp).
  extraLargeIncreased(M3RadiusValues.extraLargeIncreased),

  /// Extra extra large corner radius (48dp).
  extraExtraLarge(M3RadiusValues.extraExtraLarge),

  /// Full corner radius, used for creating pill shapes.
  full(M3RadiusValues.full);

  const M3RadiusValueToken(this.value);

  @override
  final double value;
}

/// Defines the corner radius values (`Radius`) for shape tokens according to
/// Material Design 3.
///
/// Shape is a token category in Material 3 that replaces the small, medium,
/// and large component shape categories from Material 2. These tokens can be
/// applied to components to affect their corner rounding.
///
/// This is the most granular level of shape tokens.
///
/// ### Usage:
/// `final myRadius = M3Radius.medium.value; // Returns a Radius.circular(12)`
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
enum M3RadiusToken implements IM3Token<Radius> {
  /// No corner radius (0dp).
  none(M3Radii.none),

  /// Extra small corner radius (4dp).
  extraSmall(M3Radii.extraSmall),

  /// Small corner radius (8dp).
  small(M3Radii.small),

  /// Medium corner radius (12dp).
  medium(M3Radii.medium),

  /// Large corner radius (16dp).
  large(M3Radii.large),

  /// Large increased corner radius (20dp).
  largeIncreased(M3Radii.largeIncreased),

  /// Extra large corner radius (28dp).
  extraLarge(M3Radii.extraLarge),

  /// Extra large increased corner radius (32dp).
  extraLargeIncreased(M3Radii.extraLargeIncreased),

  /// Extra extra large corner radius (48dp).
  extraExtraLarge(M3Radii.extraExtraLarge),

  /// Full corner radius, used for creating pill shapes.
  full(M3Radii.full);

  const M3RadiusToken(this.value);

  /// The final `Radius` object.
  @override
  final Radius value;

  /// The raw radius value in dp.
  double get dp => value.x;
}

/// Defines the border radius values (`BorderRadius`) for shape tokens
/// according to Material Design 3.
///
/// This enum uses [M3RadiusToken] tokens to build `BorderRadius` objects, which
/// can be applied to components to affect their border rounding.
///
/// ### Usage:
/// `final myBorderRadius = M3BorderRadii.large.value;`
///
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
enum M3BorderRadiusToken implements IM3Token<BorderRadius> {
  /// No border radius (0dp).
  none(M3BorderRadii.radiusNone),

  /// Extra small border radius (4dp).
  extraSmall(M3BorderRadii.extraSmall),

  /// Small border radius (8dp).
  small(M3BorderRadii.small),

  /// Medium border radius (12dp).
  medium(M3BorderRadii.medium),

  /// Large border radius (16dp).
  large(M3BorderRadii.large),

  /// Large increased border radius (20dp).
  largeIncreased(M3BorderRadii.largeIncreased),

  /// Extra large border radius (28dp).
  extraLarge(M3BorderRadii.extraLarge),

  /// Extra large increased border radius (32dp).
  extraLargeIncreased(M3BorderRadii.extraLargeIncreased),

  /// Extra extra large border radius (48dp).
  extraExtraLarge(M3BorderRadii.extraExtraLarge),

  /// Full border radius, used for creating pill shapes.
  full(M3BorderRadii.full);

  const M3BorderRadiusToken(this.value);

  /// The final `BorderRadius` object.
  @override
  final BorderRadius value;

  /// Returns the corresponding [M3RadiusToken] for this border radius.
  ///
  /// This getter provides access to the underlying radius token, allowing for
  /// consistent radius values across different shape abstractions.
  ///
  /// Example:
  /// ```dart
  /// final radius = M3BorderRadiusToken.medium.radius; // Returns M3RadiusToken.medium
  /// ```
  M3RadiusToken get radius {
    return switch (this) {
      M3BorderRadiusToken.none => M3RadiusToken.none,
      M3BorderRadiusToken.extraSmall => M3RadiusToken.extraSmall,
      M3BorderRadiusToken.small => M3RadiusToken.small,
      M3BorderRadiusToken.medium => M3RadiusToken.medium,
      M3BorderRadiusToken.large => M3RadiusToken.large,
      M3BorderRadiusToken.largeIncreased => M3RadiusToken.largeIncreased,
      M3BorderRadiusToken.extraLarge => M3RadiusToken.extraLarge,
      M3BorderRadiusToken.extraLargeIncreased =>
        M3RadiusToken.extraLargeIncreased,
      M3BorderRadiusToken.extraExtraLarge => M3RadiusToken.extraExtraLarge,
      M3BorderRadiusToken.full => M3RadiusToken.full,
    };
  }
}

/// Provides pre-defined, Material 3-compliant shape tokens (`ShapeBorder`).
///
/// These tokens make it easy to apply consistent corner rounding to Flutter
/// widgets like [Card], [InkWell], and `Container` decorations. Using these
/// shape tokens helps maintain a consistent visual language across the
/// application.
///
/// This is the highest-level token, ready to be used in widget properties.
///
/// ### Usage:
/// ```dart
/// Container(
///   decoration: ShapeDecoration(
///     shape: M3Shapes.medium.value, // Returns a RoundedRectangleBorder
///   ),
/// )
/// ```
/// Reference: https://m3.material.io/styles/shape/corner-radius-scale
enum M3ShapeToken implements IM3Token<RoundedRectangleBorder> {
  /// A shape with no corner rounding (0dp).
  none(M3Shapes.none),

  /// A shape with extra-small corner rounding (4dp).
  extraSmall(M3Shapes.extraSmall),

  /// A shape with small corner rounding (8dp).
  small(M3Shapes.small),

  /// A shape with medium corner rounding (12dp).
  medium(M3Shapes.medium),

  /// A shape with large corner rounding (16dp).
  large(M3Shapes.large),

  /// A shape with an increased large corner rounding (e.g., 20dp).
  largeIncreased(M3Shapes.largeIncreased),

  /// A shape with extra-large corner rounding (28dp).
  extraLarge(M3Shapes.extraLarge),

  /// A shape with an increased extra-large corner rounding (e.g., 32dp).
  extraLargeIncreased(M3Shapes.extraLargeIncreased),

  /// A shape with an extra-extra-large corner rounding (e.g., 48dp).
  extraExtraLarge(M3Shapes.extraExtraLarge),

  /// A fully rounded shape, creating a pill or circular form.
  ///
  /// This is equivalent to using a `StadiumBorder`.
  full(M3Shapes.full);

  const M3ShapeToken(this.value);

  /// The final `ShapeBorder` object.
  @override
  final RoundedRectangleBorder value;

  /// Returns the corresponding [M3BorderRadiusToken] for this shape.
  ///
  /// This getter provides access to the underlying border radius token,
  /// allowing for consistent border radius values across different shape
  /// abstractions.
  ///
  /// Example:
  /// ```dart
  /// final borderRadius = M3ShapeToken.medium; // Returns M3BorderRadiusToken.medium
  /// ```
  M3BorderRadiusToken get borderRadius {
    return switch (this) {
      M3ShapeToken.none => M3BorderRadiusToken.none,
      M3ShapeToken.extraSmall => M3BorderRadiusToken.extraSmall,
      M3ShapeToken.small => M3BorderRadiusToken.small,
      M3ShapeToken.medium => M3BorderRadiusToken.medium,
      M3ShapeToken.large => M3BorderRadiusToken.large,
      M3ShapeToken.largeIncreased => M3BorderRadiusToken.largeIncreased,
      M3ShapeToken.extraLarge => M3BorderRadiusToken.extraLarge,
      M3ShapeToken.extraLargeIncreased =>
        M3BorderRadiusToken.extraLargeIncreased,
      M3ShapeToken.extraExtraLarge => M3BorderRadiusToken.extraExtraLarge,
      M3ShapeToken.full => M3BorderRadiusToken.full,
    };
  }

  // /// Returns the appropriate shape token for a given component size.
  // ///
  // /// This helper method suggests shape tokens based on common
  // /// Material Design 3 patterns.
  // static M3ShapeToken forComponentSize(ComponentSize size) {
  //   return switch (size) {
  //     ComponentSize.small => M3ShapeToken.small,
  //     ComponentSize.medium => M3ShapeToken.medium,
  //     ComponentSize.large => M3ShapeToken.large,
  //   };
  // }

  // /// Returns the shape token typically used for a component type.
  // ///
  // /// Based on Material Design 3 component specifications.
  // static M3ShapeToken forComponent(M3Component component) {
  //   return switch (component) {
  //     M3Component.button => M3ShapeToken.small,
  //     M3Component.fab => M3ShapeToken.full,
  //     M3Component.chip => M3ShapeToken.extraSmall,
  //     M3Component.card => M3ShapeToken.medium,
  //     M3Component.dialog => M3ShapeToken.large,
  //     M3Component.sheet => M3ShapeToken.extraLarge,
  //     M3Component.textField => M3ShapeToken.small,
  //     M3Component.menu => M3ShapeToken.medium,
  //     _ => M3ShapeToken.medium,
  //   };
  // }
}

// /// Component size categories for shape selection.
// enum ComponentSize {
//   /// Small component size.
//   small,

//   /// Medium component size.
//   medium,

//   /// Large component size.
//   large
// }

// /// Material Design 3 component types.
// enum M3Component {
//   /// Button component.
//   button,

//   /// Floating action button component.
//   fab,

//   /// Chip component.
//   chip,

//   /// Card component.
//   card,

//   /// Dialog component.
//   dialog,

//   /// Sheet component.
//   sheet,

//   /// Text field component.
//   textField,

//   /// Menu component.
//   menu,

//   /// Navigation bar component.
//   navigationBar,

//   /// Navigation rail component.
//   navigationRail,

//   /// Other component type.
//   other,
// }

// /// Extension methods for shape-related functionality.
// extension M3ShapeExtensions on Widget {
//   /// Wraps this widget with a shaped container using the specified token.
//   Widget withShape(M3ShapeToken shape, {Color? color}) {
//     return Container(
//       decoration: ShapeDecoration(
//         shape: shape.value,
//         color: color,
//       ),
//       child: this,
//     );
//   }

//   /// Clips this widget with the specified shape token.
//   Widget clipWithShape(M3ShapeToken shape) {
//     return ClipRRect(
//       borderRadius: shape.borderRadius.value,
//       child: this,
//     );
//   }
// }
