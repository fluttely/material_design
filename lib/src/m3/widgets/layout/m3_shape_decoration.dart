part of '../../../../../material_design.dart';

/// Material Design 3 ShapeDecoration utility with design token enforcement.
///
/// This utility class provides a comprehensive set of methods for creating
/// ShapeDecoration using Material Design 3 shape tokens. It ensures consistent
/// shape styling throughout the application by enforcing the use of predefined
/// shape values from the design system.
///
/// Unlike Flutter's built-in ShapeDecoration, M3ShapeDecoration only accepts
/// Material Design 3 shape tokens, preventing the use of arbitrary values that
/// could break the design system's visual consistency.
///
/// ## Usage
///
/// ### Basic ShapeDecoration Creation
/// ```dart
/// // Simple shape decoration
/// final decoration = M3ShapeDecoration.withShape(M3ShapeToken.medium);
///
/// // Shape decoration with color
/// final coloredDecoration = M3ShapeDecoration.filled(
///   shape: M3ShapeToken.large,
///   color: Colors.blue,
/// );
///
/// // Shape decoration with gradient
/// final gradientDecoration = M3ShapeDecoration.gradient(
///   shape: M3ShapeToken.small,
///   gradient: LinearGradient(
///     colors: [Colors.red, Colors.blue],
///   ),
/// );
/// ```
///
/// ### Advanced Decorations
/// ```dart
/// // Shape decoration with border
/// final borderedDecoration = M3ShapeDecoration.bordered(
///   shape: M3ShapeToken.medium,
///   border: Border.all(color: Colors.grey, width: 2),
/// );
///
/// // Complex decoration with multiple properties
/// final complexDecoration = M3ShapeDecoration(
///   shape: M3ShapeToken.large,
///   color: Colors.white,
///   border: Border.all(color: Colors.black),
///   shadows: [
///     BoxShadow(
///       color: Colors.grey.withValues(alpha: 0.3),
///       blurRadius: 4,
///       offset: Offset(0, 2),
///     ),
///   ],
/// );
/// ```
///
/// ### Convenience Methods
/// ```dart
/// // Common shape patterns
/// final card = M3ShapeDecoration.card();        // Medium shape, card styling
/// final button = M3ShapeDecoration.button();    // Small shape, button styling
/// final surface = M3ShapeDecoration.surface();  // Large shape, surface styling
/// ```
///
/// ## Design Token Integration
///
/// All shape values come from Material Design 3 shape tokens, ensuring
/// consistency with the design system. The utility prevents the use of
/// arbitrary values that could break the visual consistency.
///
/// ## Performance
///
/// M3ShapeDecoration methods are lightweight and have no performance overhead
/// compared to Flutter's ShapeDecoration. The token enforcement happens at
/// compile time through the type system.
class M3ShapeDecoration extends ShapeDecoration {
  /// Creates a ShapeDecoration with a Material Design 3 shape token.
  M3ShapeDecoration({
    required M3ShapeToken shape,
    M3ShadowToken? shadows,
    super.color,
    super.image,
    super.gradient,
  }) : super(
          shadows: shadows?.value,
          shape: shape.value,
        );

  ShapeDecoration fromBoxDecoration(M3BoxDecoration source) =>
      ShapeDecoration.fromBoxDecoration(source);

  // /// Creates a ShapeDecoration with filled color.
  // M3ShapeDecoration.filled({
  //   required M3ShapeToken shapeToken,
  //   required Color color,
  //   super.image,
  //   super.shadows,
  // }) : super(
  //        shape: shapeToken.value,
  //        color: color,
  //      );

  // /// Creates a ShapeDecoration with gradient.
  // M3ShapeDecoration.gradient({
  //   required M3ShapeToken shapeToken,
  //   required Gradient gradient,
  //   super.image,
  //   super.shadows,
  // }) : super(
  //        shape: shapeToken.value,
  //        gradient: gradient,
  //      );

  // /// Creates a simple ShapeDecoration with only a shape token.
  // static M3ShapeDecoration withShape(M3ShapeToken shapeToken) {
  //   return M3ShapeDecoration(shapeToken: shapeToken);
  // }

  // /// Creates a ShapeDecoration with border.
  // ///
  // /// [shape] - The shape token to apply
  // /// [border] - The border to apply
  // /// [color] - Optional fill color
  // ///
  // /// Example:
  // /// ```dart
  // /// final decoration = M3ShapeDecoration.bordered(
  // ///   shape: M3ShapeToken.medium,
  // ///   border: Border.all(color: Colors.grey),
  // /// );
  // /// ```
  // static ShapeDecoration bordered({
  //   required M3ShapeToken shape,
  //   required Border border,
  //   Color? color,
  // }) {
  //   return ShapeDecoration(
  //     shape: shape.value.copyWith(side: border.top),
  //     color: color,
  //   );
  // }

  // /// Creates a ShapeDecoration with shadows.
  // ///
  // /// [shape] - The shape token to apply
  // /// [shadows] - The list of box shadows
  // /// [color] - Optional fill color
  // ///
  // /// Example:
  // /// ```dart
  // /// final decoration = M3ShapeDecoration.shadowed(
  // ///   shape: M3ShapeToken.large,
  // ///   shadows: [
  // ///     BoxShadow(
  // ///       color: Colors.grey.withValues(alpha: 0.3),
  // ///       blurRadius: 4,
  // ///     ),
  // ///   ],
  // /// );
  // /// ```
  // static ShapeDecoration shadowed({
  //   required M3ShapeToken shape,
  //   required List<BoxShadow> shadows,
  //   Color? color,
  // }) {
  //   return ShapeDecoration(
  //     shape: shape.value,
  //     shadows: shadows,
  //     color: color,
  //   );
  // }

  // // Convenience methods for common patterns

  // /// Creates a card-style ShapeDecoration.
  // ///
  // /// Uses medium shape token with optional customization.
  // static ShapeDecoration card({
  //   Color? color,
  //   List<BoxShadow>? shadows,
  // }) {
  //   return ShapeDecoration(
  //     shape: M3ShapeToken.medium.value,
  //     color: color,
  //     shadows: shadows ??
  //         [
  //           BoxShadow(
  //             color: Colors.black.withValues(alpha: 0.1),
  //             blurRadius: 4,
  //             offset: const Offset(0, 2),
  //           ),
  //         ],
  //   );
  // }

  // /// Creates a button-style ShapeDecoration.
  // ///
  // /// Uses small shape token for compact button styling.
  // static ShapeDecoration button({
  //   Color? color,
  //   Border? border,
  // }) {
  //   return ShapeDecoration(
  //     shape: border != null
  //         ? M3ShapeToken.small.value.copyWith(side: border.top)
  //         : M3ShapeToken.small.value,
  //     color: color,
  //   );
  // }

  // /// Creates a surface-style ShapeDecoration.
  // ///
  // /// Uses large shape token for prominent surfaces.
  // static ShapeDecoration surface({
  //   Color? color,
  //   List<BoxShadow>? shadows,
  // }) {
  //   return ShapeDecoration(
  //     shape: M3ShapeToken.large.value,
  //     color: color,
  //     shadows: shadows,
  //   );
  // }

  // /// Creates a chip-style ShapeDecoration.
  // ///
  // /// Uses small shape token with subtle styling.
  // static ShapeDecoration chip({
  //   Color? color,
  //   Border? border,
  // }) {
  //   return ShapeDecoration(
  //     shape: border != null
  //         ? M3ShapeToken.small.value.copyWith(side: border.top)
  //         : M3ShapeToken.small.value,
  //     color: color,
  //   );
  // }

  // /// Creates a dialog-style ShapeDecoration.
  // ///
  // /// Uses large shape token with elevated styling.
  // static ShapeDecoration dialog({
  //   Color? color,
  //   List<BoxShadow>? shadows,
  // }) {
  //   return ShapeDecoration(
  //     shape: M3ShapeToken.extraLarge.value,
  //     color: color,
  //     shadows: shadows ??
  //         [
  //           BoxShadow(
  //             color: Colors.black.withValues(alpha: 0.2),
  //             blurRadius: 8,
  //             offset: const Offset(0, 4),
  //           ),
  //         ],
  //   );
  // }

  // /// Creates a pill-style ShapeDecoration.
  // ///
  // /// Uses full shape token for fully rounded elements.
  // static ShapeDecoration pill({
  //   Color? color,
  //   Border? border,
  // }) {
  //   return ShapeDecoration(
  //     shape: border != null
  //         ? M3ShapeToken.full.value.copyWith(side: border.top)
  //         : M3ShapeToken.full.value,
  //     color: color,
  //   );
  // }

  // // Responsive shape methods

  // /// Gets appropriate ShapeDecoration based on screen width.
  // ///
  // /// This method provides responsive shapes that adapt to different
  // /// screen sizes, following Material Design 3 responsive guidelines.
  // ///
  // /// [screenWidth] - The screen width in logical pixels
  // /// [color] - Optional fill color
  // ///
  // /// Example:
  // /// ```dart
  // /// final decoration = M3ShapeDecoration.forScreenWidth(
  // ///   MediaQuery.of(context).size.width,
  // ///   color: Colors.blue,
  // /// );
  // /// ```
  // static ShapeDecoration forScreenWidth(
  //   double screenWidth, {
  //   Color? color,
  //   List<BoxShadow>? shadows,
  // }) {
  //   late M3ShapeToken shape;

  //   if (screenWidth < M3BreakpointToken.medium.value) {
  //     // Compact screens (phones in portrait)
  //     shape = M3ShapeToken.small;
  //   } else if (screenWidth < M3BreakpointToken.expanded.value) {
  //     // Medium screens (phones in landscape, small tablets)
  //     shape = M3ShapeToken.medium;
  //   } else {
  //     // Expanded screens and larger
  //     shape = M3ShapeToken.large;
  //   }

  //   return ShapeDecoration(
  //     shape: shape.value,
  //     color: color,
  //     shadows: shadows,
  //   );
  // }

  // /// Gets appropriate ShapeDecoration based on visual density.
  // ///
  // /// This method helps choose shapes based on the visual density
  // /// of the interface, ensuring appropriate styling for different contexts.
  // ///
  // /// [density] - The visual density level
  // /// [color] - Optional fill color
  // static ShapeDecoration forDensity(
  //   VisualDensity density, {
  //   Color? color,
  //   List<BoxShadow>? shadows,
  // }) {
  //   late M3ShapeToken shape;

  //   if (density == VisualDensity.compact) {
  //     shape = M3ShapeToken.extraSmall;
  //   } else if (density == VisualDensity.comfortable) {
  //     shape = M3ShapeToken.small;
  //   } else {
  //     shape = M3ShapeToken.medium;
  //   }

  //   return ShapeDecoration(
  //     shape: shape.value,
  //     color: color,
  //     shadows: shadows,
  //   );
  // }
}

/// Extension methods for ShapeDecoration operations with Material Design 3 tokens.
///
/// These extensions provide additional functionality for working with
/// ShapeDecoration in combination with Material Design 3 shape tokens.
extension M3ShapeDecorationExtensions on ShapeDecoration {
  /// Applies a Material Design 3 shape token to existing ShapeDecoration.
  ///
  /// [shape] - The shape token to apply
  ///
  /// Example:
  /// ```dart
  /// final decoration = ShapeDecoration(color: Colors.blue);
  /// final shaped = decoration.withM3Shape(M3ShapeToken.medium);
  /// ```
  ShapeDecoration withM3Shape(M3ShapeToken shape) {
    return ShapeDecoration(
      shape: shape.value,
      color: _color,
      gradient: gradient,
      image: image,
      shadows: shadows,
    );
  }

  /// Adds Material Design 3 shadows to existing ShapeDecoration.
  ///
  /// [shadows] - The list of box shadows to add
  ///
  /// Example:
  /// ```dart
  /// final decoration = ShapeDecoration(shape: M3ShapeToken.medium.value);
  /// final shadowed = decoration.addM3Shadows([
  ///   BoxShadow(
  ///     color: Colors.grey.withValues(alpha: 0.3),
  ///     blurRadius: 4,
  ///   ),
  /// ]);
  /// ```
  ShapeDecoration addM3Shadows(List<BoxShadow> newShadows) {
    final existingShadows = shadows ?? [];
    return ShapeDecoration(
      shape: shape,
      color: _color,
      gradient: gradient,
      image: image,
      shadows: [...existingShadows, ...newShadows],
    );
  }

  // /// Converts ShapeDecoration to the nearest Material Design 3 shape token.
  // ///
  // /// This method analyzes the current shape and returns the closest
  // /// M3ShapeToken that matches the border radius.
  // ///
  // /// Returns null if the shape is not a RoundedRectangleBorder or if
  // /// no close match is found.
  // M3ShapeToken? toM3ShapeToken() {
  //   if (shape is! RoundedRectangleBorder) return null;

  //   final roundedShape = shape as RoundedRectangleBorder;
  //   final borderRadius = roundedShape.borderRadius;

  //   // Check if it's a uniform border radius
  //   if (borderRadius is! BorderRadius) return null;

  //   final uniformRadius = borderRadius;
  //   final topLeft = uniformRadius.topLeft;

  //   // Find the nearest M3ShapeToken
  //   return _findNearestShapeToken(topLeft.x);
  // }

  // /// Finds the nearest M3ShapeToken for a given radius value.
  // M3RadiusToken _findNearestShapeToken(double radiusValue) {
  //   const tokens = M3RadiusToken.values;
  //   var nearest = tokens.first;
  //   var minDifference = (radiusValue - tokens.first.dp).abs();

  //   for (final token in tokens) {
  //     final difference = (radiusValue - token.dp).abs();
  //     if (difference < minDifference) {
  //       minDifference = difference;
  //       nearest = token;
  //     }
  //   }

  //   return nearest;
  // }
}

// /// Utility class for common ShapeDecoration patterns with Material Design 3 tokens.
// ///
// /// This class provides pre-configured ShapeDecoration for common UI patterns,
// /// ensuring consistency across the application while reducing boilerplate code.
// class M3ShapeDecorationPatterns {
//   /// Private constructor to prevent instantiation.
//  const M3ShapeDecorationPatterns._();

//   // Card Patterns

//   /// Standard card decoration following Material Design 3 guidelines.
//   static ShapeDecoration get card => M3ShapeDecoration.card();

//   /// Elevated card decoration with prominent shadows.
//   static ShapeDecoration get cardElevated => M3ShapeDecoration.card(
//         shadows: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.15),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       );

//   /// Compact card decoration for dense layouts.
//   static ShapeDecoration get cardCompact => M3ShapeDecoration.shadowed(
//         shape: M3ShapeToken.small,
//         shadows: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.08),
//             blurRadius: 2,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       );

//   // Button Patterns

//   /// Standard button decoration.
//   static ShapeDecoration get button => M3ShapeDecoration.button();

//   /// Outlined button decoration.
//   static ShapeDecoration buttonOutlined(Color borderColor) =>
//       M3ShapeDecoration.button(
//         border: Border.all(color: borderColor),
//       );

//   /// Filled button decoration.
//   static ShapeDecoration buttonFilled(Color fillColor) =>
//       M3ShapeDecoration.button(color: fillColor);

//   // Surface Patterns

//   /// Standard surface decoration.
//   static ShapeDecoration get surface => M3ShapeDecoration.surface();

//   /// Elevated surface decoration.
//   static ShapeDecoration get surfaceElevated => M3ShapeDecoration.surface(
//         shadows: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.1),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       );

//   // Input Patterns

//   /// Standard input field decoration.
//   static ShapeDecoration get inputField => M3ShapeDecoration.withShape(
//         M3ShapeToken.extraSmall,
//       );

//   /// Focused input field decoration.
//   static ShapeDecoration inputFieldFocused(Color focusColor) =>
//       M3ShapeDecoration.bordered(
//         shape: M3ShapeToken.extraSmall,
//         border: Border.all(color: focusColor, width: 2),
//       );

//   /// Error input field decoration.
//   static ShapeDecoration inputFieldError(Color errorColor) =>
//       M3ShapeDecoration.bordered(
//         shape: M3ShapeToken.extraSmall,
//         border: Border.all(color: errorColor),
//       );

//   // Navigation Patterns

//   /// Navigation rail decoration.
//   static ShapeDecoration get navigationRail => M3ShapeDecoration.shadowed(
//         shape: M3ShapeToken.medium,
//         shadows: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.05),
//             blurRadius: 4,
//             offset: const Offset(2, 0),
//           ),
//         ],
//       );

//   /// Bottom navigation decoration.
//   static ShapeDecoration get bottomNavigation => M3ShapeDecoration.shadowed(
//         shape: M3ShapeToken.none,
//         shadows: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.1),
//             blurRadius: 4,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       );

//   // Dialog Patterns

//   /// Standard dialog decoration.
//   static ShapeDecoration get dialog => M3ShapeDecoration.dialog();

//   /// Alert dialog decoration.
//   static ShapeDecoration get alertDialog => M3ShapeDecoration.dialog(
//         shadows: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.25),
//             blurRadius: 12,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       );

//   // Chip Patterns

//   /// Standard chip decoration.
//   static ShapeDecoration get chip => M3ShapeDecoration.chip();

//   /// Selected chip decoration.
//   static ShapeDecoration chipSelected(Color selectedColor) =>
//       M3ShapeDecoration.chip(color: selectedColor);

//   /// Outlined chip decoration.
//   static ShapeDecoration chipOutlined(Color borderColor) =>
//       M3ShapeDecoration.chip(
//         border: Border.all(color: borderColor),
//       );

//   /// Responsive decoration based on screen width.
//   static ShapeDecoration responsive(double screenWidth) {
//     return M3ShapeDecoration.forScreenWidth(screenWidth);
//   }
// }
