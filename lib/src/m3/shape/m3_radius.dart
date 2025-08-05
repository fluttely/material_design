// part of '../../../../../material_design.dart';

// /// Material Design 3 Radius utility with design token integration.
// ///
// /// This utility class provides a comprehensive set of methods for creating
// /// [Radius] objects using Material Design 3 shape tokens. It ensures consistent
// /// corner rounding throughout the application by enforcing the use of predefined
// /// radius values from the design system.
// ///
// /// Unlike Flutter's built-in [Radius] constructor, [M3Radius] factory methods
// /// only accept Material Design 3 shape tokens, preventing the use of arbitrary
// /// values that could break the design system's visual consistency.
// ///
// /// ## Usage
// ///
// /// ### Basic Radius Creation
// /// ```dart
// /// // Circular radius from shape token
// /// final radius = M3Radius.fromToken(M3Radius.medium);
// ///
// /// // Direct radius creation
// /// final radius = M3Radius.medium; // Returns Radius.circular(12)
// /// ```
// ///
// /// ### Convenience Methods
// /// ```dart
// /// // Common radius patterns using static constants
// /// final small = M3Radius.small;     // 8dp circular
// /// final medium = M3Radius.medium;   // 12dp circular
// /// final large = M3Radius.large;     // 16dp circular
// /// ```
// ///
// /// ### Integration with Widgets
// /// ```dart
// /// // Use with BorderRadius
// /// Container(
// ///   decoration: BoxDecoration(
// ///     borderRadius: BorderRadius.all(M3Radius.medium),
// ///   ),
// /// )
// ///
// /// // Use with ClipRRect
// /// ClipRRect(
// ///   borderRadius: BorderRadius.all(M3Radius.large),
// ///   child: Image.asset('image.jpg'),
// /// )
// /// ```
// ///
// /// ## Design Token Integration
// ///
// /// All radius values come from Material Design 3 shape tokens, ensuring
// /// consistency with the design system. Available radius tokens include:
// /// - `none` (0dp) - Sharp corners
// /// - `extraSmall` (4dp) - Subtle rounding
// /// - `small` (8dp) - Small rounding
// /// - `medium` (12dp) - Standard rounding
// /// - `large` (16dp) - Prominent rounding
// /// - `extraLarge` (28dp) - Large rounding
// /// - `full` (9999dp) - Pill shape
// ///
// /// ## Performance
// ///
// /// M3Radius utilities are lightweight and have no performance overhead
// /// compared to Flutter's [Radius]. The token enforcement happens at
// /// compile time through the type system.
// ///
// /// Reference: https://m3.material.io/foundations/shape/overview
// class M3Radius {
//   /// Private constructor to prevent instantiation.
//   const M3Radius._();

//   /// Creates a circular radius from a Material Design 3 radius token.
//   ///
//   /// [token] - The radius token to use for both x and y dimensions
//   ///
//   /// Example:
//   /// ```dart
//   /// final radius = M3Radius.fromToken(M3Radius.medium);
//   /// ```
//   static Radius fromToken(M3Radius token) => token.value;

//   /// Creates an elliptical radius from Material Design 3 radius tokens.
//   ///
//   /// [x] - The radius token for the horizontal dimension
//   /// [y] - The radius token for the vertical dimension
//   ///
//   /// Example:
//   /// ```dart
//   /// final radius = M3Radius.elliptical(
//   ///   M3Radius.large,
//   ///   M3Radius.small,
//   /// );
//   /// ```
//   static Radius elliptical(M3Radius x, M3Radius y) {
//     return Radius.elliptical(x.value.x, y.value.x);
//   }

//   /// Gets appropriate radius based on component size.
//   ///
//   /// This method provides size-appropriate radius selection following
//   /// Material Design 3 guidelines for different component scales.
//   ///
//   /// [isSmall] - Whether the component is small scale
//   /// [isLarge] - Whether the component is large scale
//   ///
//   /// Example:
//   /// ```dart
//   /// final radius = M3Radius.forComponentSize(isSmall: true);
//   /// final radius = M3Radius.forComponentSize(isLarge: true);
//   /// final radius = M3Radius.forComponentSize(); // Returns medium
//   /// ```
//   static Radius forComponentSize({
//     bool isSmall = false,
//     bool isLarge = false,
//   }) {
//     if (isSmall) return M3Radius.small.value;
//     if (isLarge) return M3Radius.large.value;
//     return M3Radius.medium.value;
//   }

//   /// Gets appropriate radius based on interaction state.
//   ///
//   /// Some components may use different radius values during interaction
//   /// states like hover or press for enhanced visual feedback.
//   ///
//   /// [isInteracting] - Whether the component is in an interaction state
//   /// [baseRadius] - The base radius token to use
//   ///
//   /// Example:
//   /// ```dart
//   /// final radius = M3Radius.forInteractionState(
//   ///   isInteracting: true,
//   ///   baseRadius: M3Radius.medium,
//   /// );
//   /// ```
//   static Radius forInteractionState({
//     bool isInteracting = false,
//     M3Radius baseRadius = M3Radius.medium,
//   }) {
//     // In Material Design 3, interaction states typically don't change radius,
//     // but this method provides flexibility for custom implementations
//     return baseRadius.value;
//   }
// }
