part of '../../../../material_design.dart';

/// IT'S AN ATOM
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

  // /// Thick border width (2dp).
  // ///
  // /// Used for emphasis, selected states, and when borders need enhanced
  // /// visibility. This width creates clear visual hierarchy and draws
  // /// attention to important interactive elements or states.
  // ///
  // /// **Ideal use cases**:
  // /// - Focus indicators and selected states
  // /// - Primary action button borders
  // /// - Active/highlighted components
  // /// - Important form field borders
  // /// - Navigation element indicators
  // static const double thick = 2;

  // /// Extra thick border width (4dp).
  // ///
  // /// Reserved for special cases requiring significant visual weight and
  // /// maximum emphasis. This width creates strong visual boundaries and
  // /// is typically used for critical states or high-priority elements.
  // ///
  // /// **Ideal use cases**:
  // /// - Error state indicators
  // /// - Critical alert borders
  // /// - High-emphasis interactive elements
  // /// - Accessibility-enhanced focus indicators
  // /// - Special design accent elements
  // static const double extraThick = 4;
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
  thin(M3BorderWidths.thin);

  // /// Thick border width (2dp).
  // ///
  // /// Used for emphasis, selected states, and when borders need enhanced
  // /// visibility. This width creates clear visual hierarchy and draws
  // /// attention to important interactive elements or states.
  // ///
  // /// **Ideal use cases**:
  // /// - Focus indicators and selected states
  // /// - Primary action button borders
  // /// - Active/highlighted components
  // /// - Important form field borders
  // /// - Navigation element indicators
  // thick(M3BorderWidths.thick),

  // /// Extra thick border width (4dp).
  // ///
  // /// Reserved for special cases requiring significant visual weight and
  // /// maximum emphasis. This width creates strong visual boundaries and
  // /// is typically used for critical states or high-priority elements.
  // ///
  // /// **Ideal use cases**:
  // /// - Error state indicators
  // /// - Critical alert borders
  // /// - High-emphasis interactive elements
  // /// - Accessibility-enhanced focus indicators
  // /// - Special design accent elements
  // extraThick(M3BorderWidths.extraThick);

  /// Creates a border token with the specified value.
  const M3BorderWidthToken(this.value);

  /// The border width value in density-independent pixels (dp).
  @override
  final double value;
}
