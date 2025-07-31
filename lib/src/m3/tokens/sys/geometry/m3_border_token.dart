part of '../../../../../material_design.dart';

abstract final class M3BorderWidths {
  const M3BorderWidths._();

  /// No border width (0dp).
  ///
  /// Used when borders need to be completely removed or made invisible.
  /// Commonly used in borderless variants of components or when creating
  /// seamless interfaces without visual boundaries.
  ///
  /// **Ideal use cases**:
  /// - Borderless buttons and cards
  /// - Seamless content areas
  /// - Hidden state indicators
  /// - Clean, minimal interface elements
  static const double none = 0;

  /// Standard thin border width (1dp).
  ///
  /// The default border width for most Material Design components.
  /// This width provides subtle definition and boundaries without being
  /// visually intrusive, maintaining the clean Material Design aesthetic.
  ///
  /// **Ideal use cases**:
  /// - OutlinedButton default border
  /// - TextField outline borders
  /// - Card borders and dividers
  /// - List item separators
  /// - Default component boundaries
  static const double thin = 1;

  /// Thick border width (2dp).
  ///
  /// Used for emphasis, selected states, and when borders need enhanced
  /// visibility. This width creates clear visual hierarchy and draws
  /// attention to important interactive elements or states.
  ///
  /// **Ideal use cases**:
  /// - Focus indicators and selected states
  /// - Primary action button borders
  /// - Active/highlighted components
  /// - Important form field borders
  /// - Navigation element indicators
  static const double thick = 2;

  /// Extra thick border width (4dp).
  ///
  /// Reserved for special cases requiring significant visual weight and
  /// maximum emphasis. This width creates strong visual boundaries and
  /// is typically used for critical states or high-priority elements.
  ///
  /// **Ideal use cases**:
  /// - Error state indicators
  /// - Critical alert borders
  /// - High-emphasis interactive elements
  /// - Accessibility-enhanced focus indicators
  /// - Special design accent elements
  static const double extraThick = 4;
}

abstract final class M3BorderSides {
  const M3BorderSides._();

  // static const BorderSide none = BorderSide(width: _borderWidthNone);
  // static const BorderSide thin = BorderSide();
  // static const BorderSide thick = BorderSide(width: _borderWidthThick);
  // static const BorderSide extraThick = BorderSide(width: _borderWidthExtraThick);

  /// No border side (0dp width).
  ///
  /// A completely transparent border side with zero width.
  /// Used when borders need to be removed or made invisible.
  static const BorderSide none = BorderSide(width: M3BorderWidths.none);

  /// Standard thin border side (1dp width).
  ///
  /// The default border side for most Material Design components.
  /// Provides subtle definition without visual intrusion.
  static const BorderSide thin = BorderSide();

  /// Thick border side (2dp width).
  ///
  /// Enhanced border side for emphasis and selected states.
  /// Creates clear visual hierarchy and attention.
  static const BorderSide thick = BorderSide(width: M3BorderWidths.thick);

  /// Extra thick border side (4dp width).
  ///
  /// High-emphasis border side for critical states and special cases.
  /// Maximum visual weight for important boundaries.
  static const BorderSide extraThick =
      BorderSide(width: M3BorderWidths.extraThick);
}

abstract final class M3Borders {
  const M3Borders._();

  /// No border on any side (0dp width).
  ///
  /// A completely borderless configuration.
  /// Used for seamless, boundary-free containers.
  static const Border none = Border.fromBorderSide(M3BorderSides.none);

  /// Thin border on all sides (1dp width).
  ///
  /// Standard border configuration for most components.
  /// Provides subtle container definition.
  static const Border thin = Border.fromBorderSide(M3BorderSides.thin);

  /// Thick border on all sides (2dp width).
  ///
  /// Enhanced border for emphasis and selected states.
  /// Creates clear container boundaries.
  static const Border thick = Border.fromBorderSide(M3BorderSides.thick);

  /// Extra thick border on all sides (4dp width).
  ///
  /// High-emphasis border for critical states.
  /// Maximum visual weight for important containers.
  static const Border extraThick =
      Border.fromBorderSide(M3BorderSides.extraThick);
}

/// Material Design 3 border width tokens for consistent component styling.
///
/// This enum defines conventional border width values for Material Design
/// components. While Material Design 3 does not specify formal border width
/// tokens, it extensively uses borders in components like OutlinedButton,
/// TextField, and Card. This system ensures consistency across all bordered
/// elements in the interface.
///
/// The border width scale is designed to provide visual hierarchy and state
/// indication while maintaining the clean, minimal aesthetic of Material
/// Design.
///
/// ## Usage
///
/// ```dart
/// // Get standard border width
/// double borderWidth = M3BorderWidthToken.thin.value; // 1.0
///
/// // Use in decorations
/// Container(
///   decoration: M3BoxDecoration(
///     border: M3Border.all(
///       width: M3BorderWidthToken.thin.value,
///       color: Colors.grey,
///     ),
///   ),
/// )
///
/// // Use with utility methods
/// Border border = M3BorderWidthToken.outline(
///   color: Colors.blue,
///   width: M3BorderWidthToken.thick.value,
/// );
/// ```
///
/// ## Width Guidelines
///
/// - **None (0dp)**: No border, invisible boundaries
/// - **Thin (1dp)**: Standard borders, default components
/// - **Thick (2dp)**: Emphasis, selected states, focus indicators
/// - **Extra Thick (4dp)**: High emphasis, error states, special cases
///
/// Reference: Material Design 3 component specifications
enum M3BorderWidthToken implements IM3Token<double> {
  /// No border width (0dp).
  ///
  /// Used when borders need to be completely removed or made invisible.
  /// Commonly used in borderless variants of components or when creating
  /// seamless interfaces without visual boundaries.
  ///
  /// **Ideal use cases**:
  /// - Borderless buttons and cards
  /// - Seamless content areas
  /// - Hidden state indicators
  /// - Clean, minimal interface elements
  none(M3BorderWidths.none),

  /// Standard thin border width (1dp).
  ///
  /// The default border width for most Material Design components.
  /// This width provides subtle definition and boundaries without being
  /// visually intrusive, maintaining the clean Material Design aesthetic.
  ///
  /// **Ideal use cases**:
  /// - OutlinedButton default border
  /// - TextField outline borders
  /// - Card borders and dividers
  /// - List item separators
  /// - Default component boundaries
  thin(M3BorderWidths.thin),

  /// Thick border width (2dp).
  ///
  /// Used for emphasis, selected states, and when borders need enhanced
  /// visibility. This width creates clear visual hierarchy and draws
  /// attention to important interactive elements or states.
  ///
  /// **Ideal use cases**:
  /// - Focus indicators and selected states
  /// - Primary action button borders
  /// - Active/highlighted components
  /// - Important form field borders
  /// - Navigation element indicators
  thick(M3BorderWidths.thick),

  /// Extra thick border width (4dp).
  ///
  /// Reserved for special cases requiring significant visual weight and
  /// maximum emphasis. This width creates strong visual boundaries and
  /// is typically used for critical states or high-priority elements.
  ///
  /// **Ideal use cases**:
  /// - Error state indicators
  /// - Critical alert borders
  /// - High-emphasis interactive elements
  /// - Accessibility-enhanced focus indicators
  /// - Special design accent elements
  extraThick(M3BorderWidths.extraThick);

  /// Creates a border token with the specified value.
  const M3BorderWidthToken(this.value);

  /// The border width value in density-independent pixels (dp).
  @override
  final double value;
}

// // TODO(fluttely):
// /// Provides utility methods for working with border tokens.
// extension _M3BorderWidthTokenUtils on M3BorderWidthToken {
//   // /// Creates a [BorderSide] with this token's width.
//   // ///
//   // /// This is a convenient way to create a [BorderSide] for use in
//   // /// various Flutter widgets.
//   // ///
//   // /// - [color]: The color of the border side.
//   // /// - [style]: The style of the border side, defaults to solid.
//   // BorderSide toSide({
//   //   required Color color,
//   //   BorderStyle style = BorderStyle.solid,
//   // }) {
//   //   return BorderSide(
//   //     color: color,
//   //     width: value,
//   //     style: style,
//   //   );
//   // }

//   /// Checks if this border width is thicker than another.
//   bool isThickerThan(M3BorderWidthToken other) => value > other.value;

//   /// Checks if this border width is thinner than another.
//   bool isThinnerThan(M3BorderWidthToken other) => value < other.value;

//   /// Returns the difference in width between this and another border token.
//   double differenceFrom(M3BorderWidthToken other) =>
//       (value - other.value).abs();

//   /// Creates a BorderRadius with this token's width as the radius.
//   BorderRadius asRadius() => BorderRadius.circular(value);

//   /// Creates a Radius with this token's width.
//   Radius get radius => Radius.circular(value);

//   /// Checks if this border is visible (has width > 0).
//   bool get isVisible => value > 0;

//   /// Creates an animated BorderSide that can transition between states.
//   BorderSide animatedSide({
//     required Color color,
//     required Animation<double> animation,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     return BorderSide(
//       color: color,
//       width: value * animation.value,
//       style: style,
//     );
//   }
// }

/// Material Design 3 border side tokens for consistent border styling.
///
/// This enum provides pre-configured [BorderSide] objects that correspond
/// to the standard Material Design 3 border widths. Each token represents
/// a complete border side configuration with the appropriate width.
///
/// These tokens ensure consistent border appearance across all components
/// and provide a centralized way to manage border styling throughout
/// the application.
///
/// ## Usage
///
/// ```dart
/// // Get a standard thin border side
/// BorderSide side = M3BorderSideToken.thin.value;
///
/// // Use in decorations
/// Container(
///   decoration: BoxDecoration(
///     border: Border(
///       top: M3BorderSideToken.thick.value,
///       bottom: M3BorderSideToken.thin.value,
///     ),
///   ),
/// )
/// ```
enum M3BorderSideToken implements IM3Token<BorderSide> {
  /// No border side (0dp width).
  ///
  /// A completely transparent border side with zero width.
  /// Used when borders need to be removed or made invisible.
  none(M3BorderSides.none),

  /// Standard thin border side (1dp width).
  ///
  /// The default border side for most Material Design components.
  /// Provides subtle definition without visual intrusion.
  thin(M3BorderSides.thin),

  /// Thick border side (2dp width).
  ///
  /// Enhanced border side for emphasis and selected states.
  /// Creates clear visual hierarchy and attention.
  thick(M3BorderSides.thick),

  /// Extra thick border side (4dp width).
  ///
  /// High-emphasis border side for critical states and special cases.
  /// Maximum visual weight for important boundaries.
  extraThick(M3BorderSides.extraThick);

  /// Creates a border side token with the specified value.
  const M3BorderSideToken(this.value);

  /// The [BorderSide] configuration for this token.
  @override
  final BorderSide value;
}

/// Material Design 3 border tokens for complete border styling.
///
/// This enum provides pre-configured [Border] objects that apply
/// consistent border styling to all sides of a container. Each token
/// uses the corresponding border width from the Material Design 3
/// specification.
///
/// These tokens ensure uniform border appearance across components
/// and provide a standardized approach to container styling.
///
/// ## Usage
///
/// ```dart
/// // Get a complete border
/// Border border = M3BorderToken.thin.value;
///
/// // Use in decorations
/// Container(
///   decoration: BoxDecoration(
///     border: M3BorderToken.thick.value,
///     borderRadius: BorderRadius.circular(8),
///   ),
/// )
/// ```
enum M3BorderToken implements IM3Token<Border> {
  /// No border on any side (0dp width).
  ///
  /// A completely borderless configuration.
  /// Used for seamless, boundary-free containers.
  none(M3Borders.none),

  /// Thin border on all sides (1dp width).
  ///
  /// Standard border configuration for most components.
  /// Provides subtle container definition.
  thin(M3Borders.thin),

  /// Thick border on all sides (2dp width).
  ///
  /// Enhanced border for emphasis and selected states.
  /// Creates clear container boundaries.
  thick(M3Borders.thick),

  /// Extra thick border on all sides (4dp width).
  ///
  /// High-emphasis border for critical states.
  /// Maximum visual weight for important containers.
  extraThick(M3Borders.extraThick);

  /// Creates a border token with the specified value.
  const M3BorderToken(this.value);

  /// The [Border] configuration for this token.
  @override
  final Border value;
}
