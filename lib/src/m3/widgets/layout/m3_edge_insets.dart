import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Material Design 3 EdgeInsets utility with design token integration.
///
/// This utility class provides a comprehensive set of methods for creating
/// EdgeInsets using Material Design 3 spacing tokens. It ensures consistent
/// spacing throughout the application by enforcing the use of predefined
/// spacing values from the design system.
///
/// Unlike Flutter's built-in EdgeInsets, M3EdgeInsets only accepts Material
/// Design 3 spacing tokens, preventing the use of arbitrary values that could
/// break the design system's visual rhythm.
///
/// ## Usage
///
/// ### Basic EdgeInsets Creation
/// ```dart
/// // Uniform spacing
/// final padding = M3EdgeInsets.all(M3SpacingToken.space16);
///
/// // Directional spacing
/// final margin = M3EdgeInsets.only(
///   left: M3SpacingToken.space8,
///   top: M3SpacingToken.space16,
///   right: M3SpacingToken.space8,
///   bottom: M3SpacingToken.space24,
/// );
///
/// // Symmetric spacing
/// final insets = M3EdgeInsets.symmetric(
///   horizontal: M3SpacingToken.space20,
///   vertical: M3SpacingToken.space12,
/// );
/// ```
///
/// ### Convenience Methods
/// ```dart
/// // Common padding patterns
/// final smallPadding = M3EdgeInsets.small();    // 8dp all
/// final mediumPadding = M3EdgeInsets.medium();  // 16dp all
/// final largePadding = M3EdgeInsets.large();    // 24dp all
///
/// // Directional helpers
/// final horizontal = M3EdgeInsets.horizontal(M3SpacingToken.space16);
/// final vertical = M3EdgeInsets.vertical(M3SpacingToken.space12);
/// ```
///
/// ### Combination and Operations
/// ```dart
/// // Combine different EdgeInsets
/// final combined = M3EdgeInsets.small() + M3EdgeInsets.vertical(M3SpacingToken.space8);
///
/// // Scale EdgeInsets
/// final scaled = M3EdgeInsets.medium() * 1.5;
/// ```
///
/// ## Design Token Integration
///
/// All spacing values come from Material Design 3 spacing tokens, ensuring
/// consistency with the design system. The utility prevents the use of
/// arbitrary values that could break the visual rhythm.
///
/// ## Performance
///
/// M3EdgeInsets methods are lightweight and have no performance overhead
/// compared to Flutter's EdgeInsets. The token enforcement happens at
/// compile time through the type system.
class M3EdgeInsets {
  /// Private constructor to prevent instantiation.
  M3EdgeInsets._();

  /// Creates EdgeInsets with uniform spacing from a Material Design 3 token.
  ///
  /// [token] - The spacing token to apply to all sides
  ///
  /// Example:
  /// ```dart
  /// final insets = M3EdgeInsets.all(M3SpacingToken.space16);
  /// ```
  static EdgeInsets all(M3SpacingToken token) {
    return EdgeInsets.all(token.value);
  }

  /// Creates EdgeInsets with directional spacing from Material Design 3 tokens.
  ///
  /// Each parameter specifies the spacing token for that direction.
  /// Null values result in no spacing for that direction.
  ///
  /// [left] - The spacing token for the left side
  /// [top] - The spacing token for the top side
  /// [right] - The spacing token for the right side
  /// [bottom] - The spacing token for the bottom side
  ///
  /// Example:
  /// ```dart
  /// final insets = M3EdgeInsets.only(
  ///   left: M3SpacingToken.space8,
  ///   right: M3SpacingToken.space8,
  ///   bottom: M3SpacingToken.space16,
  /// );
  /// ```
  static EdgeInsets only({
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

  /// Creates EdgeInsets with symmetric spacing from Material Design 3 tokens.
  ///
  /// [horizontal] - The spacing token for left and right sides
  /// [vertical] - The spacing token for top and bottom sides
  ///
  /// Example:
  /// ```dart
  /// final insets = M3EdgeInsets.symmetric(
  ///   horizontal: M3SpacingToken.space24,
  ///   vertical: M3SpacingToken.space12,
  /// );
  /// ```
  static EdgeInsets symmetric({
    M3SpacingToken? horizontal,
    M3SpacingToken? vertical,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal?.value ?? 0,
      vertical: vertical?.value ?? 0,
    );
  }

  // /// Creates EdgeInsets with horizontal spacing only.
  // ///
  // /// [token] - The spacing token for left and right sides
  // ///
  // /// Example:
  // /// ```dart
  // /// final insets = M3EdgeInsets.horizontal(M3SpacingToken.space16);
  // /// ```
  // static EdgeInsets horizontal(M3SpacingToken token) {
  //   return EdgeInsets.symmetric(horizontal: token.value);
  // }

  // /// Creates EdgeInsets with vertical spacing only.
  // ///
  // /// [token] - The spacing token for top and bottom sides
  // ///
  // /// Example:
  // /// ```dart
  // /// final insets = M3EdgeInsets.vertical(M3SpacingToken.space12);
  // /// ```
  // static EdgeInsets vertical(M3SpacingToken token) {
  //   return EdgeInsets.symmetric(vertical: token.value);
  // }

  // /// Creates EdgeInsets with left spacing only.
  // ///
  // /// [token] - The spacing token for the left side
  // static EdgeInsets left(M3SpacingToken token) {
  //   return EdgeInsets.only(left: token.value);
  // }

  // /// Creates EdgeInsets with top spacing only.
  // ///
  // /// [token] - The spacing token for the top side
  // static EdgeInsets top(M3SpacingToken token) {
  //   return EdgeInsets.only(top: token.value);
  // }

  // /// Creates EdgeInsets with right spacing only.
  // ///
  // /// [token] - The spacing token for the right side
  // static EdgeInsets right(M3SpacingToken token) {
  //   return EdgeInsets.only(right: token.value);
  // }

  // /// Creates EdgeInsets with bottom spacing only.
  // ///
  // /// [token] - The spacing token for the bottom side
  // static EdgeInsets bottom(M3SpacingToken token) {
  //   return EdgeInsets.only(bottom: token.value);
  // }

  // // Convenience methods for common spacing patterns

  // /// Creates EdgeInsets with no spacing (0dp all sides).
  // ///
  // /// This can be useful for conditional spacing or as a placeholder.
  // static EdgeInsets get none => EdgeInsets.all(M3SpacingToken.none.value);

  // /// Creates EdgeInsets with extra small spacing (4dp all sides).
  // static EdgeInsets get extraSmall => EdgeInsets.all(M3SpacingToken.space4.value);

  // /// Creates EdgeInsets with small spacing (8dp all sides).
  // static EdgeInsets get small => EdgeInsets.all(M3SpacingToken.space8.value);

  // /// Creates EdgeInsets with medium spacing (16dp all sides).
  // static EdgeInsets get medium => EdgeInsets.all(M3SpacingToken.space16.value);

  // /// Creates EdgeInsets with large spacing (24dp all sides).
  // static EdgeInsets get large => EdgeInsets.all(M3SpacingToken.space24.value);

  // /// Creates EdgeInsets with extra large spacing (32dp all sides).
  // static EdgeInsets get extraLarge => EdgeInsets.all(M3SpacingToken.space32.value);

  // Responsive spacing methods

  /// Gets appropriate EdgeInsets based on screen width.
  ///
  /// This method provides responsive spacing that adapts to different
  /// screen sizes, following Material Design 3 responsive guidelines.
  ///
  /// [screenWidth] - The screen width in logical pixels
  /// [factor] - Optional multiplier for the spacing (default: 1.0)
  ///
  /// Example:
  /// ```dart
  /// final insets = M3EdgeInsets.forScreenWidth(
  ///   MediaQuery.of(context).size.width,
  ///   factor: 1.5,
  /// );
  /// ```
  static EdgeInsets forScreenWidth(double screenWidth, {double factor = 1.0}) {
    late M3SpacingToken token;

    if (screenWidth < 600) {
      // Compact screens (phones in portrait)
      token = M3SpacingToken.space16;
    } else if (screenWidth < 840) {
      // Medium screens (phones in landscape, small tablets)
      token = M3SpacingToken.space24;
    } else {
      // Expanded screens and larger
      token = M3SpacingToken.space32;
    }

    return EdgeInsets.all(token.value * factor);
  }

  /// Gets appropriate EdgeInsets based on visual density.
  ///
  /// This method helps choose spacing based on the visual density
  /// of the interface, ensuring appropriate spacing for different contexts.
  ///
  /// [density] - The visual density level
  /// [factor] - Optional multiplier for the spacing (default: 1.0)
  static EdgeInsets forDensity(VisualDensity density, {double factor = 1.0}) {
    late M3SpacingToken token;

    if (density == VisualDensity.compact) {
      token = M3SpacingToken.space8;
    } else if (density == VisualDensity.comfortable) {
      token = M3SpacingToken.space16;
    } else {
      token = M3SpacingToken.space24;
    }

    return EdgeInsets.all(token.value * factor);
  }

  // // Margin-specific methods using M3MarginToken

  // /// Creates EdgeInsets using margin tokens for compact screens.
  // static EdgeInsets get compactMargin =>
  //     EdgeInsets.all(M3MarginToken.compactScreen.value);

  // /// Creates EdgeInsets using margin tokens for medium screens.
  // static EdgeInsets get mediumMargin =>
  //     EdgeInsets.all(M3MarginToken.mediumScreen.value);

  // /// Creates EdgeInsets using margin tokens for expanded screens.
  // static EdgeInsets get expandedMargin =>
  //     EdgeInsets.all(M3MarginToken.expandedScreen.value);

  // /// Creates EdgeInsets using margin tokens for large screens.
  // static EdgeInsets get largeMargin =>
  //     EdgeInsets.all(M3MarginToken.largeScreen.value);

  // /// Creates EdgeInsets using margin tokens for extra large screens.
  // static EdgeInsets get extraLargeMargin =>
  //     EdgeInsets.all(M3MarginToken.extraLargeScreen.value);

  /// Gets appropriate margin EdgeInsets based on screen width.
  ///
  /// This method automatically selects the appropriate margin token
  /// based on screen size breakpoints.
  ///
  /// [screenWidth] - The screen width in logical pixels
  static EdgeInsets marginForScreenWidth(double screenWidth) {
    if (screenWidth < 600) {
      return EdgeInsets.all(M3MarginToken.compactScreen.value);
    } else if (screenWidth < 840) {
      return EdgeInsets.all(M3MarginToken.mediumScreen.value);
    } else if (screenWidth < 1200) {
      return EdgeInsets.all(M3MarginToken.expandedScreen.value);
    } else if (screenWidth < 1600) {
      return EdgeInsets.all(M3MarginToken.largeScreen.value);
    } else {
      return EdgeInsets.all(M3MarginToken.extraLargeScreen.value);
    }
  }
}

/// Extension methods for EdgeInsets operations with Material Design 3 tokens.
///
/// These extensions provide additional functionality for working with
/// EdgeInsets in combination with Material Design 3 spacing tokens.
extension M3EdgeInsetsExtensions on EdgeInsets {
  /// Adds Material Design 3 spacing to existing EdgeInsets.
  ///
  /// [token] - The spacing token to add to all sides
  ///
  /// Example:
  /// ```dart
  /// final insets = EdgeInsets.all(8.0);
  /// final enhanced = insets.addM3Spacing(M3SpacingToken.space8);
  /// ```
  EdgeInsets addM3Spacing(M3SpacingToken token) {
    return EdgeInsets.only(
      left: left + token.value,
      top: top + token.value,
      right: right + token.value,
      bottom: bottom + token.value,
    );
  }

  /// Adds Material Design 3 spacing to specific sides.
  ///
  /// Each parameter specifies the spacing token to add to that direction.
  /// Null values result in no additional spacing for that direction.
  EdgeInsets addM3SpacingOnly({
    M3SpacingToken? left,
    M3SpacingToken? top,
    M3SpacingToken? right,
    M3SpacingToken? bottom,
  }) {
    return EdgeInsets.only(
      left: this.left + (left?.value ?? 0),
      top: this.top + (top?.value ?? 0),
      right: this.right + (right?.value ?? 0),
      bottom: this.bottom + (bottom?.value ?? 0),
    );
  }

  /// Adds symmetric Material Design 3 spacing.
  EdgeInsets addM3SpacingSymmetric({
    M3SpacingToken? horizontal,
    M3SpacingToken? vertical,
  }) {
    final h = horizontal?.value ?? 0;
    final v = vertical?.value ?? 0;

    return EdgeInsets.only(
      left: left + h,
      top: top + v,
      right: right + h,
      bottom: bottom + v,
    );
  }

  /// Scales EdgeInsets while maintaining Material Design 3 grid alignment.
  ///
  /// This method scales the EdgeInsets and then rounds to the nearest
  /// 4dp grid value to maintain design system consistency.
  ///
  /// [factor] - The scaling factor
  EdgeInsets scaleToM3Grid(double factor) {
    return EdgeInsets.only(
      left: _roundToGrid(left * factor),
      top: _roundToGrid(top * factor),
      right: _roundToGrid(right * factor),
      bottom: _roundToGrid(bottom * factor),
    );
  }

  /// Rounds a value to the nearest 4dp grid increment.
  double _roundToGrid(double value) {
    return (value / 4).round() * 4.0;
  }

  /// Converts EdgeInsets to the nearest Material Design 3 spacing tokens.
  ///
  /// This method finds the closest M3SpacingToken for each side and
  /// returns a map with the token recommendations.
  ///
  /// Returns a map with keys: 'left', 'top', 'right', 'bottom'
  Map<String, M3SpacingToken> toM3SpacingTokens() {
    return {
      'left': _findNearestToken(left),
      'top': _findNearestToken(top),
      'right': _findNearestToken(right),
      'bottom': _findNearestToken(bottom),
    };
  }

  /// Finds the nearest M3SpacingToken for a given value.
  M3SpacingToken _findNearestToken(double value) {
    final tokens = M3SpacingToken.values;
    M3SpacingToken nearest = tokens.first;
    double minDifference = (value - tokens.first.value).abs();

    for (final token in tokens) {
      if (token == M3SpacingToken.infinity) continue;

      final difference = (value - token.value).abs();
      if (difference < minDifference) {
        minDifference = difference;
        nearest = token;
      }
    }

    return nearest;
  }
}

/// Utility class for common EdgeInsets patterns with Material Design 3 tokens.
///
/// This class provides pre-configured EdgeInsets for common UI patterns,
/// ensuring consistency across the application while reducing boilerplate code.
class M3EdgeInsetsPatterns {
  /// Private constructor to prevent instantiation.
  M3EdgeInsetsPatterns._();

  // Card and Surface Patterns

  /// Standard card padding following Material Design 3 guidelines.
  static EdgeInsets get card => M3EdgeInsets.all(M3SpacingToken.space16);

  /// Compact card padding for dense layouts.
  static EdgeInsets get cardCompact => M3EdgeInsets.all(M3SpacingToken.space12);

  /// Large card padding for prominent surfaces.
  static EdgeInsets get cardLarge => M3EdgeInsets.all(M3SpacingToken.space24);

  // List Item Patterns

  /// Standard list item padding.
  static EdgeInsets get listItem => M3EdgeInsets.symmetric(
        horizontal: M3SpacingToken.space16,
        vertical: M3SpacingToken.space12,
      );

  /// Compact list item padding for dense lists.
  static EdgeInsets get listItemCompact => M3EdgeInsets.symmetric(
        horizontal: M3SpacingToken.space16,
        vertical: M3SpacingToken.space8,
      );

  /// List item padding with leading icon.
  static EdgeInsets get listItemWithIcon => M3EdgeInsets.only(
        left: M3SpacingToken.space16,
        top: M3SpacingToken.space12,
        right: M3SpacingToken.space16,
        bottom: M3SpacingToken.space12,
      );

  // Button Patterns

  /// Standard button padding.
  static EdgeInsets get button => M3EdgeInsets.symmetric(
        horizontal: M3SpacingToken.space24,
        vertical: M3SpacingToken.space12,
      );

  /// Compact button padding.
  static EdgeInsets get buttonCompact => M3EdgeInsets.symmetric(
        horizontal: M3SpacingToken.space16,
        vertical: M3SpacingToken.space8,
      );

  /// Large button padding.
  static EdgeInsets get buttonLarge => M3EdgeInsets.symmetric(
        horizontal: M3SpacingToken.space32,
        vertical: M3SpacingToken.space16,
      );

  // Dialog Patterns

  /// Standard dialog content padding.
  static EdgeInsets get dialogContent =>
      M3EdgeInsets.all(M3SpacingToken.space24);

  /// Dialog title padding.
  static EdgeInsets get dialogTitle => M3EdgeInsets.only(
        left: M3SpacingToken.space24,
        top: M3SpacingToken.space24,
        right: M3SpacingToken.space24,
        bottom: M3SpacingToken.space16,
      );

  /// Dialog actions padding.
  static EdgeInsets get dialogActions => M3EdgeInsets.only(
        left: M3SpacingToken.space24,
        top: M3SpacingToken.space16,
        right: M3SpacingToken.space24,
        bottom: M3SpacingToken.space24,
      );

  // Screen Layout Patterns

  /// Standard screen padding for mobile devices.
  static EdgeInsets get screenMobile =>
      M3EdgeInsets.all(M3SpacingToken.space16);

  /// Screen padding for tablet devices.
  static EdgeInsets get screenTablet =>
      M3EdgeInsets.all(M3SpacingToken.space24);

  /// Screen padding for desktop devices.
  static EdgeInsets get screenDesktop =>
      M3EdgeInsets.all(M3SpacingToken.space32);

  /// Responsive screen padding based on screen width.
  static EdgeInsets screenResponsive(double screenWidth) {
    return M3EdgeInsets.forScreenWidth(screenWidth);
  }
}
