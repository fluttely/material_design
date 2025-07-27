part of '../../../../../material_design.dart';

/// Material Design 3 Padding widget with design token enforcement.
///
/// This widget provides a consistent way to apply padding using Material Design 3
/// spacing tokens. It enforces the use of predefined spacing values to ensure
/// visual consistency throughout the application.
///
/// Unlike Flutter's built-in Padding widget, M3Padding only accepts Material
/// Design 3 spacing tokens, preventing the use of arbitrary values that could
/// break the design system's visual rhythm.
///
/// ## Usage
///
/// ### Basic Padding
/// ```dart
/// M3Padding(
///   padding: M3SpacingToken.space16,
///   child: Text('Consistently padded text'),
/// )
/// ```
///
/// ### Directional Padding
/// ```dart
/// M3Padding.only(
///   left: M3SpacingToken.space16,
///   top: M3SpacingToken.space8,
///   child: Text('Custom directional padding'),
/// )
/// ```
///
/// ### Symmetric Padding
/// ```dart
/// M3Padding.symmetric(
///   horizontal: M3SpacingToken.space24,
///   vertical: M3SpacingToken.space12,
///   child: Text('Symmetric padding'),
/// )
/// ```
///
/// ### Static Convenience Methods
/// ```dart
/// M3Padding.small(child: Text('Small padding'))
/// M3Padding.medium(child: Text('Medium padding'))
/// M3Padding.large(child: Text('Large padding'))
/// ```
///
/// ## Design Token Enforcement
///
/// This widget only accepts M3SpacingToken values, ensuring that all padding
/// follows the Material Design 3 spacing scale. This prevents inconsistent
/// spacing and maintains visual rhythm across the application.
///
/// ## Performance
///
/// M3Padding is a lightweight wrapper around Flutter's Padding widget with
/// no additional performance overhead. The token enforcement happens at
/// compile time through the type system.
class M3Padding extends Padding {
  /// Creates a Material Design 3 padding widget with uniform padding.
  ///
  /// The [padding] parameter specifies the spacing token to apply to all sides.
  M3Padding.all(
    M3SpacingToken spacing, {
    required Widget child,
    super.key,
  }) : super(
          padding: M3EdgeInsets.all(spacing),
          child: child,
        );

  /// Creates a Material Design 3 padding widget with directional padding.
  ///
  /// Each parameter specifies the spacing token for that direction.
  /// Null values result in no padding for that direction.
  M3Padding.only({
    required Widget child,
    super.key,
    M3SpacingToken? left,
    M3SpacingToken? top,
    M3SpacingToken? right,
    M3SpacingToken? bottom,
  }) : super(
          padding: M3EdgeInsets.only(
            left: left,
            top: top,
            right: right,
            bottom: bottom,
          ),
          child: child,
        );

  /// Creates a Material Design 3 padding widget using fromLTRB.
  M3Padding.fromLTRB(
    M3SpacingToken left,
    M3SpacingToken top,
    M3SpacingToken right,
    M3SpacingToken bottom, {
    required Widget child,
    super.key,
  }) : super(
          padding: EdgeInsets.fromLTRB(
            left.value,
            top.value,
            right.value,
            bottom.value,
          ),
          child: child,
        );

  /// Creates a Material Design 3 padding widget with symmetric padding.
  ///
  /// The [horizontal] parameter applies to left and right sides.
  /// The [vertical] parameter applies to top and bottom sides.
  M3Padding.symmetric({
    required Widget child,
    super.key,
    M3SpacingToken? horizontal,
    M3SpacingToken? vertical,
  }) : super(
          padding: M3EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: child,
        );

  // /// Creates padding with no spacing (0dp).
  // ///
  // /// This can be useful for conditional padding or as a placeholder.
  // factory M3Padding.none({
  //   Key? key,
  //   required Widget child,
  // }) {
  //   return M3Padding.all(
  //     key: key,
  //     padding: M3SpacingToken.none,
  //     child: child,
  //   );
  // }

  // /// Creates a small padding (8dp) around the child.
  // factory M3Padding.small({
  //   Key? key,
  //   required Widget child,
  // }) {
  //   return M3Padding.all(
  //     key: key,
  //     padding: M3SpacingToken.space8,
  //     child: child,
  //   );
  // }

  // /// Creates a medium padding (16dp) around the child.
  // factory M3Padding.medium({
  //   Key? key,
  //   required Widget child,
  // }) {
  //   return M3Padding.all(
  //     key: key,
  //     padding: M3SpacingToken.space16,
  //     child: child,
  //   );
  // }

  // /// Creates a large padding (24dp) around the child.
  // factory M3Padding.large({
  //   Key? key,
  //   required Widget child,
  // }) {
  //   return M3Padding.all(
  //     key: key,
  //     padding: M3SpacingToken.space24,
  //     child: child,
  //   );
  // }

  // /// Creates an extra large padding (32dp) around the child.
  // factory M3Padding.extraLarge({
  //   Key? key,
  //   required Widget child,
  // }) {
  //   return M3Padding.all(
  //     key: key,
  //     padding: M3SpacingToken.space32,
  //     child: child,
  //   );
  // }
}

// /// Extension methods for convenient padding creation with widgets.
// ///
// /// These extensions provide shorthand methods for wrapping widgets with
// /// common padding patterns, making the code more readable and concise.
// ///
// /// Usage:
// /// ```dart
// /// Text('Hello').withM3Padding(M3SpacingToken.space16)
// /// Text('Hello').withM3PaddingSmall()
// /// Text('Hello').withM3PaddingSymmetric(
// ///   horizontal: M3SpacingToken.space24,
// ///   vertical: M3SpacingToken.space12,
// /// )
// /// ```
// extension M3PaddingExtensions on Widget {
//   /// Wraps the widget with Material Design 3 padding.
//   ///
//   /// [padding] - The spacing token to apply to all sides
//   M3Padding withM3Padding(M3SpacingToken padding) {
//     return M3Padding.all(
//       padding: padding,
//       child: this,
//     );
//   }

//   /// Wraps the widget with directional Material Design 3 padding.
//   ///
//   /// Each parameter specifies the spacing token for that direction.
//   M3Padding withM3PaddingOnly({
//     M3SpacingToken? left,
//     M3SpacingToken? top,
//     M3SpacingToken? right,
//     M3SpacingToken? bottom,
//   }) {
//     return M3Padding.only(
//       left: left,
//       top: top,
//       right: right,
//       bottom: bottom,
//       child: this,
//     );
//   }

//   /// Wraps the widget with symmetric Material Design 3 padding.
//   ///
//   /// [horizontal] - The spacing token for left and right sides
//   /// [vertical] - The spacing token for top and bottom sides
//   M3Padding withM3PaddingSymmetric({
//     M3SpacingToken? horizontal,
//     M3SpacingToken? vertical,
//   }) {
//     return M3Padding.symmetric(
//       horizontal: horizontal,
//       vertical: vertical,
//       child: this,
//     );
//   }

//   /// Wraps the widget with small Material Design 3 padding (8dp).
//   M3Padding withM3PaddingSmall() {
//     return M3Padding.small(child: this);
//   }

//   /// Wraps the widget with medium Material Design 3 padding (16dp).
//   M3Padding withM3PaddingMedium() {
//     return M3Padding.medium(child: this);
//   }

//   /// Wraps the widget with large Material Design 3 padding (24dp).
//   M3Padding withM3PaddingLarge() {
//     return M3Padding.large(child: this);
//   }

//   /// Wraps the widget with extra large Material Design 3 padding (32dp).
//   M3Padding withM3PaddingExtraLarge() {
//     return M3Padding.extraLarge(child: this);
//   }

//   /// Wraps the widget with no Material Design 3 padding (0dp).
//   M3Padding withM3PaddingNone() {
//     return M3Padding.none(child: this);
//   }
// }

// /// Utility class for creating padding-related helper methods.
// ///
// /// This class provides static methods for common padding operations and
// /// calculations that work with Material Design 3 spacing tokens.
// class M3PaddingUtils {
//   /// Gets the appropriate padding token for different UI density levels.
//   ///
//   /// This method helps choose spacing tokens based on the visual density
//   /// of the interface, ensuring appropriate padding for different contexts.
//   ///
//   /// [density] - The visual density level
//   static M3SpacingToken forDensity(VisualDensity density) {
//     if (density == VisualDensity.compact) {
//       return M3SpacingToken.space8;
//     } else if (density == VisualDensity.comfortable) {
//       return M3SpacingToken.space16;
//     } else {
//       return M3SpacingToken.space24;
//     }
//   }

//   /// Calculates responsive padding based on screen width.
//   ///
//   /// This method provides responsive padding that adapts to different
//   /// screen sizes, following Material Design 3 responsive guidelines.
//   ///
//   /// [screenWidth] - The screen width in logical pixels
//   static M3SpacingToken forScreenWidth(double screenWidth) {
//     if (screenWidth < M3BreakpointToken.medium.value) {
//       // Compact screens (phones in portrait)
//       return M3SpacingToken.space16;
//     } else if (screenWidth < M3BreakpointToken.expanded.value) {
//       // Medium screens (phones in landscape, small tablets)
//       return M3SpacingToken.space24;
//     } else {
//       // Expanded screens and larger
//       return M3SpacingToken.space32;
//     }
//   }
// }
