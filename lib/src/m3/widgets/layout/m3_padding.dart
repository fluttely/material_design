import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

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
class M3Padding extends StatelessWidget {
  /// Creates a Material Design 3 padding widget with uniform padding.
  ///
  /// The [padding] parameter specifies the spacing token to apply to all sides.
  const M3Padding.all(
    this.padding, {
    super.key,
    required this.child,
  })  : left = null,
        top = null,
        right = null,
        bottom = null,
        horizontal = null,
        vertical = null,
        _paddingType = _PaddingType.all;

  /// Creates a Material Design 3 padding widget with directional padding.
  ///
  /// Each parameter specifies the spacing token for that direction.
  /// Null values result in no padding for that direction.
  const M3Padding.only({
    super.key,
    required this.child,
    this.left,
    this.top,
    this.right,
    this.bottom,
  })  : padding = null,
        horizontal = null,
        vertical = null,
        _paddingType = _PaddingType.only;

  const M3Padding.fromLTRB(
    this.left,
    this.top,
    this.right,
    this.bottom, {
    super.key,
    required this.child,
  })  : padding = null,
        horizontal = null,
        vertical = null,
        _paddingType = _PaddingType.only;

  /// Creates a Material Design 3 padding widget with symmetric padding.
  ///
  /// The [horizontal] parameter applies to left and right sides.
  /// The [vertical] parameter applies to top and bottom sides.
  const M3Padding.symmetric({
    super.key,
    required this.child,
    this.horizontal,
    this.vertical,
  })  : padding = null,
        left = null,
        top = null,
        right = null,
        bottom = null,
        _paddingType = _PaddingType.symmetric;

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

  /// The uniform padding token (used with default constructor).
  final M3SpacingToken? padding;

  /// The left padding token (used with .only constructor).
  final M3SpacingToken? left;

  /// The top padding token (used with .only constructor).
  final M3SpacingToken? top;

  /// The right padding token (used with .only constructor).
  final M3SpacingToken? right;

  /// The bottom padding token (used with .only constructor).
  final M3SpacingToken? bottom;

  /// The horizontal padding token (used with .symmetric constructor).
  final M3SpacingToken? horizontal;

  /// The vertical padding token (used with .symmetric constructor).
  final M3SpacingToken? vertical;

  /// The child widget to apply padding to.
  final Widget child;

  /// The type of padding configuration.
  final _PaddingType _paddingType;

  /// Builds the EdgeInsets based on the padding configuration.
  EdgeInsets _buildPadding() {
    switch (_paddingType) {
      case _PaddingType.all:
        return EdgeInsets.all(padding!.value);
      case _PaddingType.only:
        return EdgeInsets.only(
          left: left?.value ?? 0,
          top: top?.value ?? 0,
          right: right?.value ?? 0,
          bottom: bottom?.value ?? 0,
        );
      case _PaddingType.symmetric:
        return EdgeInsets.symmetric(
          horizontal: horizontal?.value ?? 0,
          vertical: vertical?.value ?? 0,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _buildPadding(),
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<_PaddingType>('paddingType', _paddingType));

    switch (_paddingType) {
      case _PaddingType.all:
        properties.add(EnumProperty<M3SpacingToken?>('padding', padding));
      case _PaddingType.only:
        properties
          ..add(EnumProperty<M3SpacingToken?>('left', left))
          ..add(EnumProperty<M3SpacingToken?>('top', top))
          ..add(EnumProperty<M3SpacingToken?>('right', right))
          ..add(EnumProperty<M3SpacingToken?>('bottom', bottom));
      case _PaddingType.symmetric:
        properties
          ..add(EnumProperty<M3SpacingToken?>('horizontal', horizontal))
          ..add(EnumProperty<M3SpacingToken?>('vertical', vertical));
    }
  }
}

/// Internal enum to track the padding configuration type.
enum _PaddingType {
  /// Uniform padding on all sides.
  all,

  /// Directional padding with individual control per side.
  only,

  /// Symmetric padding with horizontal and vertical control.
  symmetric,
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

/// Utility class for creating padding-related helper methods.
///
/// This class provides static methods for common padding operations and
/// calculations that work with Material Design 3 spacing tokens.
class M3PaddingUtils {
  /// Private constructor to prevent instantiation.
  M3PaddingUtils._();

  /// Combines multiple M3SpacingTokens into a single EdgeInsets.
  ///
  /// This method allows you to create custom EdgeInsets using different
  /// spacing tokens for each direction while maintaining design system
  /// consistency.
  ///
  /// [left] - The spacing token for the left side
  /// [top] - The spacing token for the top side
  /// [right] - The spacing token for the right side
  /// [bottom] - The spacing token for the bottom side
  static EdgeInsets fromTokens({
    M3SpacingToken? left,
    M3SpacingToken? top,
    M3SpacingToken? right,
    M3SpacingToken? bottom,
  }) {
    return EdgeInsets.only(
      left: left?.value ?? 0,
      top: top?.value ?? 0,
      right: right?.value ?? 0,
      bottom: bottom?.value ?? 0,
    );
  }

  /// Creates symmetric EdgeInsets from M3SpacingTokens.
  ///
  /// [horizontal] - The spacing token for left and right sides
  /// [vertical] - The spacing token for top and bottom sides
  static EdgeInsets symmetric({
    M3SpacingToken? horizontal,
    M3SpacingToken? vertical,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal?.value ?? 0,
      vertical: vertical?.value ?? 0,
    );
  }

  /// Creates uniform EdgeInsets from an M3SpacingToken.
  ///
  /// [token] - The spacing token to apply to all sides
  static EdgeInsets all(M3SpacingToken token) {
    return EdgeInsets.all(token.value);
  }

  /// Gets the appropriate padding token for different UI density levels.
  ///
  /// This method helps choose spacing tokens based on the visual density
  /// of the interface, ensuring appropriate padding for different contexts.
  ///
  /// [density] - The visual density level
  static M3SpacingToken forDensity(VisualDensity density) {
    if (density == VisualDensity.compact) {
      return M3SpacingToken.space8;
    } else if (density == VisualDensity.comfortable) {
      return M3SpacingToken.space16;
    } else {
      return M3SpacingToken.space24;
    }
  }

  /// Calculates responsive padding based on screen width.
  ///
  /// This method provides responsive padding that adapts to different
  /// screen sizes, following Material Design 3 responsive guidelines.
  ///
  /// [screenWidth] - The screen width in logical pixels
  static M3SpacingToken forScreenWidth(double screenWidth) {
    if (screenWidth < 600) {
      // Compact screens (phones in portrait)
      return M3SpacingToken.space16;
    } else if (screenWidth < 840) {
      // Medium screens (phones in landscape, small tablets)
      return M3SpacingToken.space24;
    } else {
      // Expanded screens and larger
      return M3SpacingToken.space32;
    }
  }
}
