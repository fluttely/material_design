import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Material Design 3 border width tokens for consistent component styling.
///
/// This enum defines conventional border width values for Material Design
/// components. While Material Design 3 does not specify formal border width
/// tokens, it extensively uses borders in components like OutlinedButton,
/// TextField, and Card. This system ensures consistency across all bordered
/// elements in the interface.
///
/// The border width scale is designed to provide visual hierarchy and state
/// indication while maintaining the clean, minimal aesthetic of Material Design.
///
/// ## Usage
///
/// ```dart
/// // Get standard border width
/// double borderWidth = M3BorderToken.thin.value; // 1.0
///
/// // Use in decorations
/// Container(
///   decoration: BoxDecoration(
///     border: Border.all(
///       width: M3BorderToken.thin.value,
///       color: Colors.grey,
///     ),
///   ),
/// )
///
/// // Use with utility methods
/// Border border = M3BorderToken.outline(
///   color: Colors.blue,
///   width: M3BorderToken.thick.value,
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
enum M3BorderToken implements IM3Token<double> {
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
  none(0),

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
  thin(1),

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
  thick(2),

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
  extraThick(4);

  /// Creates a border token with the specified value.
  const M3BorderToken(this.value);

  /// The border width value in density-independent pixels (dp).
  @override
  final double value;
}

// TODO(fluttely):
/// Provides utility methods for working with border tokens.
extension M3BorderTokenUtils on M3BorderToken {
  /// Creates a [BorderSide] with this token's width.
  ///
  /// This is a convenient way to create a [BorderSide] for use in
  /// various Flutter widgets.
  ///
  /// - [color]: The color of the border side.
  /// - [style]: The style of the border side, defaults to solid.
  BorderSide toSide({
    required Color color,
    BorderStyle style = BorderStyle.solid,
  }) {
    return BorderSide(
      color: color,
      width: value,
      style: style,
    );
  }

  /// Checks if this border width is thicker than another.
  bool isThickerThan(M3BorderToken other) => value > other.value;

  /// Checks if this border width is thinner than another.
  bool isThinnerThan(M3BorderToken other) => value < other.value;

  /// Returns the difference in width between this and another border token.
  double differenceFrom(M3BorderToken other) => (value - other.value).abs();

  /// Creates a BorderRadius with this token's width as the radius.
  BorderRadius asRadius() => BorderRadius.circular(value);

  /// Creates a Radius with this token's width.
  Radius get radius => Radius.circular(value);

  /// Checks if this border is visible (has width > 0).
  bool get isVisible => value > 0;

  /// Creates an animated BorderSide that can transition between states.
  BorderSide animatedSide({
    required Color color,
    required Animation<double> animation,
    BorderStyle style = BorderStyle.solid,
  }) {
    return BorderSide(
      color: color,
      width: value * animation.value,
      style: style,
    );
  }
}
