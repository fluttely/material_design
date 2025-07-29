part of '../../../../../material_design.dart';

/// Material Design 3 Border implementation that enforces design token usage.
///
/// This class extends Flutter's Border class while ensuring that all border
/// widths use Material Design 3 tokens, preventing the use of arbitrary values
/// that could break the design system's visual consistency.
///
/// M3Border provides the same functionality as Flutter's Border class but with
/// type-safe token enforcement, ensuring consistent border styling throughout
/// the application according to Material Design 3 specifications.
///
/// ## Usage
///
/// ### Creating Borders with Tokens
/// ```dart
/// // All sides with same width
/// final border = M3Border.all(
///   width: M3BorderWidthToken.thin,
///   color: Colors.grey,
/// );
///
/// // Individual sides with different tokens
/// final border = M3Border(
///   top: M3BorderWidthToken.thick.toSide(color: Colors.blue),
///   right: M3BorderWidthToken.thin.toSide(color: Colors.grey),
///   bottom: M3BorderWidthToken.none.toSide(color: Colors.transparent),
///   left: M3BorderWidthToken.thin.toSide(color: Colors.grey),
/// );
/// ```
///
/// ### Common Patterns
/// ```dart
/// // Outlined container
/// Container(
///   decoration: M3BoxDecoration(
///     border: M3Border.all(
///       width: M3BorderWidthToken.thin,
///       color: Theme.of(context).colorScheme.outline,
///     ),
///   ),
/// );
///
/// // Focus indicator
/// Container(
///   decoration: M3BoxDecoration(
///     border: M3Border.all(
///       width: M3BorderWidthToken.thick,
///       color: Theme.of(context).colorScheme.primary,
///     ),
///   ),
/// );
/// ```
///
/// ### Symmetric Borders
/// ```dart
/// // Horizontal borders only
/// final horizontalBorder = M3Border.symmetric(
///   horizontal: M3BorderWidthToken.thin.toSide(color: Colors.grey),
/// );
///
/// // Vertical borders only
/// final verticalBorder = M3Border.symmetric(
///   vertical: M3BorderWidthToken.thick.toSide(color: Colors.blue),
/// );
/// ```
///
/// ## Design Token Integration
///
/// All border widths must use M3BorderWidthToken values, ensuring consistency
/// with the Material Design 3 specification. This prevents the use of
/// arbitrary width values that could create visual inconsistencies.
///
/// ## Compatibility
///
/// M3Border is fully compatible with all Flutter widgets that accept a
/// Border, including Container, DecoratedBox, and any custom widgets
/// using M3BoxDecoration.
class M3Border extends Border {
  /// Creates a border with all sides using the same Material Design 3 token.
  ///
  /// This is the most common way to create a uniform border around a component.
  /// The width parameter must be a Material Design 3 border token to ensure
  /// consistent styling.
  ///
  /// The [side] parameter defines the border appearance for all sides.
  ///
  /// Example:
  /// ```dart
  /// final border = M3Border.all(
  ///   width: M3BorderWidthToken.thin,
  ///   color: Colors.grey,
  /// );
  /// ```
  M3Border.all(M3BorderSideToken? side)
      : super(
          top: side?.value ?? BorderSide.none,
          right: side?.value ?? BorderSide.none,
          bottom: side?.value ?? BorderSide.none,
          left: side?.value ?? BorderSide.none,
        );

  // factory Border.all({
  //   Color color = const Color(0xFF000000),
  //   double width = 1.0,
  //   BorderStyle style = BorderStyle.solid,
  //   double strokeAlign = BorderSide.strokeAlignInside,
  // }) {
  //   final BorderSide side = BorderSide(
  //     color: color,
  //     width: width,
  //     style: style,
  //     strokeAlign: strokeAlign,
  //   );
  //   return Border.fromBorderSide(side);
  // }

//   // factory M3Border.all({
//   //   required M3BorderWidthToken width,
//   //   required Color color,
//   //   BorderStyle style = BorderStyle.solid,
//   // }) {
//   //   final side = width.toSide(color: color, style: style);
//   //   return M3Border(
//   //     top: side,
//   //     right: side,
//   //     bottom: side,
//   //     left: side,
//   //   );
//   // }

//   /// Creates a border with symmetric sides using Material Design 3 tokens.
//   ///
//   /// This factory allows you to specify different borders for horizontal
//   /// and vertical sides, useful for creating borders that only appear on
//   /// specific sides of a container.
//   ///
//   /// [vertical] - BorderSide for top and bottom (use M3BorderWidthToken.toSide())
//   /// [horizontal] - BorderSide for left and right (use M3BorderWidthToken.toSide())
//   ///
//   /// Example:
//   /// ```dart
//   /// // Only top and bottom borders
//   /// final border = M3Border.symmetric(
//   ///   horizontal: M3BorderWidthToken.thin.toSide(color: Colors.grey),
//   /// );
//   ///
//   /// // Different vertical and horizontal borders
//   /// final border = M3Border.symmetric(
//   ///   vertical: M3BorderWidthToken.thick.toSide(color: Colors.blue),
//   ///   horizontal: M3BorderWidthToken.thin.toSide(color: Colors.grey),
//   /// );
//   /// ```
//   factory M3Border.symmetric({
//     BorderSide vertical = BorderSide.none,
//     BorderSide horizontal = BorderSide.none,
//   }) {
//     return M3Border(
//       top: vertical,
//       right: horizontal,
//       bottom: vertical,
//       left: horizontal,
//     );
//   }

//   /// Creates a border with only the top side using a Material Design 3 token.
//   ///
//   /// [width] - The M3BorderWidthToken defining the border width
//   /// [color] - The color of the border
//   /// [style] - The style of the border (defaults to solid)
//   factory M3Border.top({
//     required M3BorderWidthToken width,
//     required Color color,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     return M3Border(
//       top: width.toSide(color: color, style: style),
//     );
//   }

//   /// Creates a border with only the right side using a Material Design 3 token.
//   ///
//   /// [width] - The M3BorderWidthToken defining the border width
//   /// [color] - The color of the border
//   /// [style] - The style of the border (defaults to solid)
//   factory M3Border.right({
//     required M3BorderWidthToken width,
//     required Color color,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     return M3Border(
//       right: width.toSide(color: color, style: style),
//     );
//   }

//   /// Creates a border with only the bottom side using a Material Design 3 token.
//   ///
//   /// [width] - The M3BorderWidthToken defining the border width
//   /// [color] - The color of the border
//   /// [style] - The style of the border (defaults to solid)
//   factory M3Border.bottom({
//     required M3BorderWidthToken width,
//     required Color color,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     return M3Border(
//       bottom: width.toSide(color: color, style: style),
//     );
//   }

//   /// Creates a border with only the left side using a Material Design 3 token.
//   ///
//   /// [width] - The M3BorderWidthToken defining the border width
//   /// [color] - The color of the border
//   /// [style] - The style of the border (defaults to solid)
//   factory M3Border.left({
//     required M3BorderWidthToken width,
//     required Color color,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     return M3Border(
//       left: width.toSide(color: color, style: style),
//     );
//   }

//   /// Creates a horizontal border (top and bottom) using Material Design 3 tokens.
//   ///
//   /// [width] - The M3BorderWidthToken defining the border width
//   /// [color] - The color of the border
//   /// [style] - The style of the border (defaults to solid)
//   factory M3Border.horizontal({
//     required M3BorderWidthToken width,
//     required Color color,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     final side = width.toSide(color: color, style: style);
//     return M3Border(
//       top: side,
//       bottom: side,
//     );
//   }

//   /// Creates a vertical border (left and right) using Material Design 3 tokens.
//   ///
//   /// [width] - The M3BorderWidthToken defining the border width
//   /// [color] - The color of the border
//   /// [style] - The style of the border (defaults to solid)
//   factory M3Border.vertical({
//     required M3BorderWidthToken width,
//     required Color color,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     final side = width.toSide(color: color, style: style);
//     return M3Border(
//       left: side,
//       right: side,
//     );
//   }

//   /// Creates a border from an existing Flutter Border, preserving the structure
//   /// but potentially losing Material Design 3 token enforcement.
//   ///
//   /// This factory is useful for migration or when working with existing code
//   /// that uses Flutter's Border class. However, it's recommended to use the
//   /// token-enforced constructors when possible.
//   ///
//   /// [border] - The existing Flutter Border to convert
//   factory M3Border.fromBorder(Border border) {
//     return M3Border(
//       top: border.top,
//       right: border.right,
//       bottom: border.bottom,
//       left: border.left,
//     );
//   }

//   /// Creates a border that provides a common outline pattern for components.
//   ///
//   /// This is a convenience method that creates a standard outline border
//   /// using the thin border token, commonly used for outlined buttons,
//   /// text fields, and cards.
//   ///
//   /// [color] - The color of the outline
//   /// [style] - The style of the border (defaults to solid)
//   factory M3Border.outline({
//     required Color color,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     return M3Border.all(
//       width: M3BorderWidthToken.thin,
//       color: color,
//       style: style,
//     );
//   }

//   /// Creates a border that provides a common focus indicator pattern.
//   ///
//   /// This is a convenience method that creates a thick border typically
//   /// used for focus indicators and selected states, following Material
//   /// Design 3 accessibility guidelines.
//   ///
//   /// [color] - The color of the focus indicator
//   /// [style] - The style of the border (defaults to solid)
//   factory M3Border.focus({
//     required Color color,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     return M3Border.all(
//       width: M3BorderWidthToken.thick,
//       color: color,
//       style: style,
//     );
//   }

//   /// Creates a border that provides a common error state pattern.
//   ///
//   /// This is a convenience method that creates an extra thick border
//   /// typically used for error states and critical alerts, providing
//   /// strong visual emphasis.
//   ///
//   /// [color] - The color of the error border (typically error color)
//   /// [style] - The style of the border (defaults to solid)
//   factory M3Border.error({
//     required Color color,
//     BorderStyle style = BorderStyle.solid,
//   }) {
//     return M3Border.all(
//       width: M3BorderWidthToken.extraThick,
//       color: color,
//       style: style,
//     );
//   }

//   /// Creates a border with no visible borders (transparent).
//   ///
//   /// This is useful when you need to maintain layout consistency but
//   /// want to hide the border temporarily or in certain states.
//   factory M3Border.none() {
//     return const M3Border();
//   }
// }

// /// Extension methods for working with M3Border in various contexts.
// extension M3BorderExtensions on M3Border {
//   /// Creates a copy of this border with modified properties.
//   ///
//   /// This method allows you to create variations of an existing border
//   /// while maintaining the Material Design 3 token constraints.
//   M3Border copyWith({
//     BorderSide? top,
//     BorderSide? right,
//     BorderSide? bottom,
//     BorderSide? left,
//   }) {
//     return M3Border(
//       top: top ?? this.top,
//       right: right ?? this.right,
//       bottom: bottom ?? this.bottom,
//       left: left ?? this.left,
//     );
//   }

  // /// Returns true if this border has any visible sides.
  // ///
  // /// A border is considered visible if any of its sides have a width
  // /// greater than 0 and a style other than BorderStyle.none.
  // bool get hasVisibleBorder {
  //   return top.width > 0 && top.style != BorderStyle.none ||
  //       right.width > 0 && right.style != BorderStyle.none ||
  //       bottom.width > 0 && bottom.style != BorderStyle.none ||
  //       left.width > 0 && left.style != BorderStyle.none;
  // }

  // /// Returns true if this border is uniform (all sides are identical).
  // ///
  // /// This is useful for determining if a border was created with M3Border.all()
  // /// or has been modified to have different sides.
  // bool get isUniform {
  //   return top == right && right == bottom && bottom == left;
  // }

  // /// Gets the maximum border width among all sides.
  // ///
  // /// This is useful for calculating spacing or determining the visual
  // /// prominence of the border.
  // double get maxWidth {
  //   return [top.width, right.width, bottom.width, left.width]
  //       .reduce((a, b) => a > b ? a : b);
  // }

  // /// Gets the minimum border width among all sides.
  // ///
  // /// This is useful for calculating minimum spacing requirements.
  // double get minWidth {
  //   return [top.width, right.width, bottom.width, left.width]
  //       .reduce((a, b) => a < b ? a : b);
  // }

  // /// Creates an animated version of this border that can transition smoothly.
  // ///
  // /// This method is useful for creating smooth transitions between different
  // /// border states, such as hover effects or focus animations.
  // ///
  // /// [animation] - The animation controller driving the transition
  // /// [begin] - The starting border state
  // /// [end] - The ending border state
  // static M3Border lerp(M3Border begin, M3Border end, double t) {
  //   return M3Border(
  //     top: BorderSide.lerp(begin.top, end.top, t),
  //     right: BorderSide.lerp(begin.right, end.right, t),
  //     bottom: BorderSide.lerp(begin.bottom, end.bottom, t),
  //     left: BorderSide.lerp(begin.left, end.left, t),
  //   );
  // }
}

// /// Utility class providing common Material Design 3 border patterns.
// ///
// /// This class offers pre-configured borders for common use cases,
// /// ensuring consistency and reducing boilerplate code throughout
// /// the application.
// abstract class M3BorderPatterns {
//   /// Standard component outline border.
//   ///
//   /// Uses thin border token with the provided color, commonly used
//   /// for outlined buttons, text fields, and container outlines.
//   static M3Border componentOutline(Color color) =>
//       M3Border.outline(color: color);

//   /// Interactive focus indicator border.
//   ///
//   /// Uses thick border token for accessibility-compliant focus
//   /// indication, typically with the primary color.
//   static M3Border focusIndicator(Color color) =>
//       M3Border.focus(color: color);

//   /// Error state indicator border.
//   ///
//   /// Uses extra thick border token for prominent error indication,
//   /// typically with the error color from the theme.
//   static M3Border errorIndicator(Color color) =>
//       M3Border.error(color: color);

//   /// Subtle divider border.
//   ///
//   /// Creates a minimal border typically used for separating content
//   /// areas or list items.
//   static M3Border divider(Color color) => M3Border.bottom(
//         width: M3BorderWidthToken.thin,
//         color: color,
//       );

//   /// Card outline border.
//   ///
//   /// Standard border for card components with subtle outline styling.
//   static M3Border cardOutline(Color color) => M3Border.outline(color: color);

//   /// Button outline border.
//   ///
//   /// Standard border for outlined button components.
//   static M3Border buttonOutline(Color color) =>
//       M3Border.outline(color: color);

//   /// Text field border.
//   ///
//   /// Standard border for text input fields and form controls.
//   static M3Border textField(Color color) => M3Border.outline(color: color);

//   /// Selected state border.
//   ///
//   /// Border indicating selected or active state, using thick width
//   /// for clear visual indication.
//   static M3Border selected(Color color) => M3Border.focus(color: color);

//   /// Disabled state border.
//   ///
//   /// Subtle border for disabled components, typically using
//   /// reduced opacity to indicate non-interactive state.
//   static M3Border disabled(Color color) => M3Border.outline(
//         color: color.withValues(alpha: 0.38),
//       );
// }
