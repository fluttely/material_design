part of '../../../material_design.dart';

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
/// final combined = M3EdgeInsets.small() +
/// M3EdgeInsets.vertical(M3SpacingToken.space8);
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
class M3EdgeInsets extends EdgeInsets {
  /// Creates EdgeInsets from Material Design 3 spacing tokens with const support.
  const M3EdgeInsets.only({
    IM3SpacingToken? left,
    IM3SpacingToken? top,
    IM3SpacingToken? right,
    IM3SpacingToken? bottom,
  }) : super.only(
          left: left == null
              ? 0
              : left == M3MarginToken.compactScreen
                  ? M3Margins.compactScreen
                  : left == M3MarginToken.mediumScreen
                      ? M3Margins.mediumScreen
                      : left == M3MarginToken.expandedScreen
                          ? M3Margins.expandedScreen
                          : left == M3MarginToken.largeScreen
                              ? M3Margins.largeScreen
                              : left == M3MarginToken.extraLargeScreen
                                  ? M3Margins.extraLargeScreen
                                  : left == M3SpacingToken.none
                                      ? M3Spacings.none
                                      : left == M3SpacingToken.space4
                                          ? M3Spacings.space4
                                          : left == M3SpacingToken.space8
                                              ? M3Spacings.space8
                                              : left == M3SpacingToken.space12
                                                  ? M3Spacings.space12
                                                  : left ==
                                                          M3SpacingToken.space16
                                                      ? M3Spacings.space16
                                                      : left ==
                                                              M3SpacingToken
                                                                  .space20
                                                          ? M3Spacings.space20
                                                          : left ==
                                                                  M3SpacingToken
                                                                      .space24
                                                              ? M3Spacings
                                                                  .space24
                                                              : left ==
                                                                      M3SpacingToken
                                                                          .space28
                                                                  ? M3Spacings
                                                                      .space28
                                                                  : left ==
                                                                          M3SpacingToken
                                                                              .space32
                                                                      ? M3Spacings
                                                                          .space32
                                                                      : left ==
                                                                              M3SpacingToken.space36
                                                                          ? M3Spacings.space36
                                                                          : left == M3SpacingToken.space40
                                                                              ? M3Spacings.space40
                                                                              : left == M3SpacingToken.space48
                                                                                  ? M3Spacings.space48
                                                                                  : left == M3SpacingToken.space56
                                                                                      ? M3Spacings.space56
                                                                                      : left == M3SpacingToken.space64
                                                                                          ? M3Spacings.space64
                                                                                          : left == M3SpacingToken.space72
                                                                                              ? M3Spacings.space72
                                                                                              : left == M3SpacingToken.space80
                                                                                                  ? M3Spacings.space80
                                                                                                  : left == M3SpacingToken.space96
                                                                                                      ? M3Spacings.space96
                                                                                                      : left == M3SpacingToken.space128
                                                                                                          ? M3Spacings.space128
                                                                                                          : left == M3SpacingToken.infinity
                                                                                                              ? M3Spacings.infinity
                                                                                                              : M3Spacings.none,
          top: top == null
              ? 0
              : top == M3MarginToken.compactScreen
                  ? M3Margins.compactScreen
                  : top == M3MarginToken.mediumScreen
                      ? M3Margins.mediumScreen
                      : top == M3MarginToken.expandedScreen
                          ? M3Margins.expandedScreen
                          : top == M3MarginToken.largeScreen
                              ? M3Margins.largeScreen
                              : top == M3MarginToken.extraLargeScreen
                                  ? M3Margins.extraLargeScreen
                                  : top == M3SpacingToken.none
                                      ? M3Spacings.none
                                      : top == M3SpacingToken.space4
                                          ? M3Spacings.space4
                                          : top == M3SpacingToken.space8
                                              ? M3Spacings.space8
                                              : top == M3SpacingToken.space12
                                                  ? M3Spacings.space12
                                                  : top ==
                                                          M3SpacingToken.space16
                                                      ? M3Spacings.space16
                                                      : top ==
                                                              M3SpacingToken
                                                                  .space20
                                                          ? M3Spacings.space20
                                                          : top ==
                                                                  M3SpacingToken
                                                                      .space24
                                                              ? M3Spacings
                                                                  .space24
                                                              : top ==
                                                                      M3SpacingToken
                                                                          .space28
                                                                  ? M3Spacings
                                                                      .space28
                                                                  : top ==
                                                                          M3SpacingToken
                                                                              .space32
                                                                      ? M3Spacings
                                                                          .space32
                                                                      : top ==
                                                                              M3SpacingToken.space36
                                                                          ? M3Spacings.space36
                                                                          : top == M3SpacingToken.space40
                                                                              ? M3Spacings.space40
                                                                              : top == M3SpacingToken.space48
                                                                                  ? M3Spacings.space48
                                                                                  : top == M3SpacingToken.space56
                                                                                      ? M3Spacings.space56
                                                                                      : top == M3SpacingToken.space64
                                                                                          ? M3Spacings.space64
                                                                                          : top == M3SpacingToken.space72
                                                                                              ? M3Spacings.space72
                                                                                              : top == M3SpacingToken.space80
                                                                                                  ? M3Spacings.space80
                                                                                                  : top == M3SpacingToken.space96
                                                                                                      ? M3Spacings.space96
                                                                                                      : top == M3SpacingToken.space128
                                                                                                          ? M3Spacings.space128
                                                                                                          : top == M3SpacingToken.infinity
                                                                                                              ? M3Spacings.infinity
                                                                                                              : M3Spacings.none,
          right: right == null
              ? 0
              : right == M3MarginToken.compactScreen
                  ? M3Margins.compactScreen
                  : right == M3MarginToken.mediumScreen
                      ? M3Margins.mediumScreen
                      : right == M3MarginToken.expandedScreen
                          ? M3Margins.expandedScreen
                          : right == M3MarginToken.largeScreen
                              ? M3Margins.largeScreen
                              : right == M3MarginToken.extraLargeScreen
                                  ? M3Margins.extraLargeScreen
                                  : right == M3SpacingToken.none
                                      ? M3Spacings.none
                                      : right == M3SpacingToken.space4
                                          ? M3Spacings.space4
                                          : right == M3SpacingToken.space8
                                              ? M3Spacings.space8
                                              : right == M3SpacingToken.space12
                                                  ? M3Spacings.space12
                                                  : right ==
                                                          M3SpacingToken.space16
                                                      ? M3Spacings.space16
                                                      : right ==
                                                              M3SpacingToken
                                                                  .space20
                                                          ? M3Spacings.space20
                                                          : right ==
                                                                  M3SpacingToken
                                                                      .space24
                                                              ? M3Spacings
                                                                  .space24
                                                              : right ==
                                                                      M3SpacingToken
                                                                          .space28
                                                                  ? M3Spacings
                                                                      .space28
                                                                  : right ==
                                                                          M3SpacingToken
                                                                              .space32
                                                                      ? M3Spacings
                                                                          .space32
                                                                      : right ==
                                                                              M3SpacingToken.space36
                                                                          ? M3Spacings.space36
                                                                          : right == M3SpacingToken.space40
                                                                              ? M3Spacings.space40
                                                                              : right == M3SpacingToken.space48
                                                                                  ? M3Spacings.space48
                                                                                  : right == M3SpacingToken.space56
                                                                                      ? M3Spacings.space56
                                                                                      : right == M3SpacingToken.space64
                                                                                          ? M3Spacings.space64
                                                                                          : right == M3SpacingToken.space72
                                                                                              ? M3Spacings.space72
                                                                                              : right == M3SpacingToken.space80
                                                                                                  ? M3Spacings.space80
                                                                                                  : right == M3SpacingToken.space96
                                                                                                      ? M3Spacings.space96
                                                                                                      : right == M3SpacingToken.space128
                                                                                                          ? M3Spacings.space128
                                                                                                          : right == M3SpacingToken.infinity
                                                                                                              ? M3Spacings.infinity
                                                                                                              : M3Spacings.none,
          bottom: bottom == null
              ? 0
              : bottom == M3MarginToken.compactScreen
                  ? M3Margins.compactScreen
                  : bottom == M3MarginToken.mediumScreen
                      ? M3Margins.mediumScreen
                      : bottom == M3MarginToken.expandedScreen
                          ? M3Margins.expandedScreen
                          : bottom == M3MarginToken.largeScreen
                              ? M3Margins.largeScreen
                              : bottom == M3MarginToken.extraLargeScreen
                                  ? M3Margins.extraLargeScreen
                                  : bottom == M3SpacingToken.none
                                      ? M3Spacings.none
                                      : bottom == M3SpacingToken.space4
                                          ? M3Spacings.space4
                                          : bottom == M3SpacingToken.space8
                                              ? M3Spacings.space8
                                              : bottom == M3SpacingToken.space12
                                                  ? M3Spacings.space12
                                                  : bottom ==
                                                          M3SpacingToken.space16
                                                      ? M3Spacings.space16
                                                      : bottom ==
                                                              M3SpacingToken
                                                                  .space20
                                                          ? M3Spacings.space20
                                                          : bottom ==
                                                                  M3SpacingToken
                                                                      .space24
                                                              ? M3Spacings
                                                                  .space24
                                                              : bottom ==
                                                                      M3SpacingToken
                                                                          .space28
                                                                  ? M3Spacings
                                                                      .space28
                                                                  : bottom ==
                                                                          M3SpacingToken
                                                                              .space32
                                                                      ? M3Spacings
                                                                          .space32
                                                                      : bottom ==
                                                                              M3SpacingToken.space36
                                                                          ? M3Spacings.space36
                                                                          : bottom == M3SpacingToken.space40
                                                                              ? M3Spacings.space40
                                                                              : bottom == M3SpacingToken.space48
                                                                                  ? M3Spacings.space48
                                                                                  : bottom == M3SpacingToken.space56
                                                                                      ? M3Spacings.space56
                                                                                      : bottom == M3SpacingToken.space64
                                                                                          ? M3Spacings.space64
                                                                                          : bottom == M3SpacingToken.space72
                                                                                              ? M3Spacings.space72
                                                                                              : bottom == M3SpacingToken.space80
                                                                                                  ? M3Spacings.space80
                                                                                                  : bottom == M3SpacingToken.space96
                                                                                                      ? M3Spacings.space96
                                                                                                      : bottom == M3SpacingToken.space128
                                                                                                          ? M3Spacings.space128
                                                                                                          : bottom == M3SpacingToken.infinity
                                                                                                              ? M3Spacings.infinity
                                                                                                              : M3Spacings.none,
        );

  /// Creates EdgeInsets with uniform spacing from a Material Design 3 token.
  ///
  /// [spacing] - The spacing token to apply to all sides
  ///
  /// Example:
  /// ```dart
  /// final insets = M3EdgeInsets.all(M3SpacingToken.space16);
  /// ```
  const M3EdgeInsets.all(IM3SpacingToken spacing)
      : this.only(
          left: spacing,
          top: spacing,
          right: spacing,
          bottom: spacing,
        );

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
  const M3EdgeInsets.fromLTRB(
    IM3SpacingToken? left,
    IM3SpacingToken? top,
    IM3SpacingToken? right,
    IM3SpacingToken? bottom,
  ) : this.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );

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
  const M3EdgeInsets.symmetric({
    IM3SpacingToken? horizontal,
    IM3SpacingToken? vertical,
  }) : this.only(
          left: horizontal,
          top: vertical,
          right: horizontal,
          bottom: vertical,
        );

  // /// Creates EdgeInsets with horizontal spacing only.
  // ///
  // /// [token] - The spacing token for left and right sides
  // ///
  // /// Example:
  // /// ```dart
  // /// final insets = M3EdgeInsets.horizontal(M3SpacingToken.space16);
  // /// ```
  // static EdgeInsets horizontal(IM3SpacingToken spacing) {
  //   return EdgeInsets.symmetric(horizontal: spacing.value);
  // }

  // /// Creates EdgeInsets with vertical spacing only.
  // ///
  // /// [token] - The spacing token for top and bottom sides
  // ///
  // /// Example:
  // /// ```dart
  // /// final insets = M3EdgeInsets.vertical(M3SpacingToken.space12);
  // /// ```
  // static EdgeInsets vertical(IM3SpacingToken spacing) {
  //   return EdgeInsets.symmetric(vertical: spacing.value);
  // }

  // /// Creates EdgeInsets with left spacing only.
  // ///
  // /// [token] - The spacing token for the left side
  // static EdgeInsets left(IM3SpacingToken spacing) {
  //   return EdgeInsets.only(left: spacing.value);
  // }

  // /// Creates EdgeInsets with top spacing only.
  // ///
  // /// [token] - The spacing token for the top side
  // static EdgeInsets top(IM3SpacingToken spacing) {
  //   return EdgeInsets.only(top: spacing.value);
  // }

  // /// Creates EdgeInsets with right spacing only.
  // ///
  // /// [token] - The spacing token for the right side
  // static EdgeInsets right(IM3SpacingToken spacing) {
  //   return EdgeInsets.only(right: spacing.value);
  // }

  // /// Creates EdgeInsets with bottom spacing only.
  // ///
  // /// [token] - The spacing token for the bottom side
  // static EdgeInsets bottom(IM3SpacingToken spacing) {
  //   return EdgeInsets.only(bottom: spacing.value);
  // }

  // // Convenience methods for common spacing patterns

  // /// Creates EdgeInsets with no spacing (0dp all sides).
  // ///
  // /// This can be useful for conditional spacing or as a placeholder.
  // static const EdgeInsets get none => EdgeInsets.all(IM3SpacingToken.none.value);

  // /// Creates EdgeInsets with extra small spacing (4dp all sides).
  // static const EdgeInsets get extraSmall =>
  // EdgeInsets.all(IM3SpacingToken.space4.value);

  // /// Creates EdgeInsets with small spacing (8dp all sides).
  // static const EdgeInsets get small =>
  // EdgeInsets.all(IM3SpacingToken.space8.value);

  // /// Creates EdgeInsets with medium spacing (16dp all sides).
  // static const EdgeInsets get medium =>
  // EdgeInsets.all(IM3SpacingToken.space16.value);

  // /// Creates EdgeInsets with large spacing (24dp all sides).
  // static const EdgeInsets get large =>
  // EdgeInsets.all(IM3SpacingToken.space24.value);

  // /// Creates EdgeInsets with extra large spacing (32dp all sides).
  // static const EdgeInsets get extraLarge =>
  // EdgeInsets.all(IM3SpacingToken.space32.value);

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
  factory M3EdgeInsets.forScreenWidth(
    double screenWidth, {
    double factor = 1.0,
  }) {
    late M3SpacingToken spacing;

    if (screenWidth < M3BreakpointToken.medium.value) {
      // Compact screens (phones in portrait)
      spacing = M3SpacingToken.space16;
    } else if (screenWidth < M3BreakpointToken.expanded.value) {
      // Medium screens (phones in landscape, small tablets)
      spacing = M3SpacingToken.space24;
    } else {
      // Expanded screens and larger
      spacing = M3SpacingToken.space32;
    }

    final value = spacing.value * factor;
    return M3EdgeInsets._(value, value, value, value);
  }

  /// Gets appropriate EdgeInsets based on visual density.
  ///
  /// This method helps choose spacing based on the visual density
  /// of the interface, ensuring appropriate spacing for different contexts.
  ///
  /// [density] - The visual density level
  /// [factor] - Optional multiplier for the spacing (default: 1.0)
  factory M3EdgeInsets.forDensity(VisualDensity density,
      {double factor = 1.0}) {
    late M3SpacingToken spacing;

    if (density == VisualDensity.compact) {
      spacing = M3SpacingToken.space8;
    } else if (density == VisualDensity.comfortable) {
      spacing = M3SpacingToken.space16;
    } else {
      spacing = M3SpacingToken.space24;
    }

    final value = spacing.value * factor;
    return M3EdgeInsets._(value, value, value, value);
  }

  // // Margin-specific methods using M3MarginToken

  // /// Creates EdgeInsets using margin tokens for compact screens.
  // static const EdgeInsets get compactMargin =>
  //     EdgeInsets.all(M3MarginToken.compactScreen.value);

  // /// Creates EdgeInsets using margin tokens for medium screens.
  // static const EdgeInsets get mediumMargin =>
  //     EdgeInsets.all(M3MarginToken.mediumScreen.value);

  // /// Creates EdgeInsets using margin tokens for expanded screens.
  // static const EdgeInsets get expandedMargin =>
  //     EdgeInsets.all(M3MarginToken.expandedScreen.value);

  // /// Creates EdgeInsets using margin tokens for large screens.
  // static const EdgeInsets get largeMargin =>
  //     EdgeInsets.all(M3MarginToken.largeScreen.value);

  // /// Creates EdgeInsets using margin tokens for extra large screens.
  // static const EdgeInsets get extraLargeMargin =>
  //     EdgeInsets.all(M3MarginToken.extraLargeScreen.value);

  /// Gets appropriate margin EdgeInsets based on screen width.
  ///
  /// This method automatically selects the appropriate margin token
  /// based on screen size breakpoints.
  ///
  /// [screenWidth] - The screen width in logical pixels
  factory M3EdgeInsets.marginForScreenWidth(double screenWidth) {
    if (screenWidth < M3BreakpointToken.medium.value) {
      const value = M3MarginToken.compactScreen;
      return const M3EdgeInsets.fromLTRB(value, value, value, value);
    } else if (screenWidth < M3BreakpointToken.expanded.value) {
      const value = M3MarginToken.mediumScreen;
      return const M3EdgeInsets.fromLTRB(value, value, value, value);
    } else if (screenWidth < M3BreakpointToken.large.value) {
      const value = M3MarginToken.expandedScreen;
      return const M3EdgeInsets.fromLTRB(value, value, value, value);
    } else if (screenWidth < M3BreakpointToken.extraLarge.value) {
      const value = M3MarginToken.largeScreen;
      return const M3EdgeInsets.fromLTRB(value, value, value, value);
    } else {
      const value = M3MarginToken.extraLargeScreen;
      return const M3EdgeInsets.fromLTRB(value, value, value, value);
    }
  }

  /// Private constructor to prevent direct instantiation.
  const M3EdgeInsets._(
    double? left,
    double? top,
    double? right,
    double? bottom,
  ) : super.fromLTRB(
          left ?? 0,
          top ?? 0,
          right ?? 0,
          bottom ?? 0,
        );
}

/// Extension methods for EdgeInsets operations with Material Design 3 tokens.
///
/// These extensions provide additional functionality for working with
/// EdgeInsets in combination with Material Design 3 spacing tokens.
extension M3EdgeInsetsExtensions on M3EdgeInsets {
  /// Adds Material Design 3 spacing to existing EdgeInsets.
  ///
  /// [spacing] - The spacing token to add to all sides
  ///
  /// Example:
  /// ```dart
  /// final insets = EdgeInsets.all(8.0);
  /// final enhanced = insets.addM3Spacing(M3SpacingToken.space8);
  /// ```
  EdgeInsets addM3Spacing(IM3SpacingToken spacing) {
    return EdgeInsets.only(
      left: left + spacing.value,
      top: top + spacing.value,
      right: right + spacing.value,
      bottom: bottom + spacing.value,
    );
  }

  /// Adds Material Design 3 spacing to specific sides.
  ///
  /// Each parameter specifies the spacing token to add to that direction.
  /// Null values result in no additional spacing for that direction.
  EdgeInsets addM3SpacingOnly({
    IM3SpacingToken? left,
    IM3SpacingToken? top,
    IM3SpacingToken? right,
    IM3SpacingToken? bottom,
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
    IM3SpacingToken? horizontal,
    IM3SpacingToken? vertical,
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
  Map<String, IM3SpacingToken> toM3SpacingTokens() {
    return {
      'left': _findNearestToken(left),
      'top': _findNearestToken(top),
      'right': _findNearestToken(right),
      'bottom': _findNearestToken(bottom),
    };
  }

  /// Finds the nearest M3SpacingToken for a given value.
  M3SpacingToken _findNearestToken(double value) {
    const tokens = M3SpacingToken.values;
    var nearest = tokens.first;
    var minDifference = (value - tokens.first.value).abs();

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
  const M3EdgeInsetsPatterns._();

  // Card and Surface Patterns

  /// Standard card padding following Material Design 3 guidelines.
  static const M3EdgeInsets card = M3EdgeInsets.all(M3SpacingToken.space16);

  /// Compact card padding for dense layouts.
  static const M3EdgeInsets cardCompact =
      M3EdgeInsets.all(M3SpacingToken.space12);

  /// Large card padding for prominent surfaces.
  static const M3EdgeInsets cardLarge =
      M3EdgeInsets.all(M3SpacingToken.space24);

  // List Item Patterns

  /// Standard list item padding.
  static const M3EdgeInsets listItem = M3EdgeInsets.symmetric(
    horizontal: M3SpacingToken.space16,
    vertical: M3SpacingToken.space12,
  );

  /// Compact list item padding for dense lists.
  static const M3EdgeInsets listItemCompact = M3EdgeInsets.symmetric(
    horizontal: M3SpacingToken.space16,
    vertical: M3SpacingToken.space8,
  );

  /// List item padding with leading icon.
  static const M3EdgeInsets listItemWithIcon = M3EdgeInsets.only(
    left: M3SpacingToken.space16,
    top: M3SpacingToken.space12,
    right: M3SpacingToken.space16,
    bottom: M3SpacingToken.space12,
  );

  // Button Patterns

  /// Standard button padding.
  static const M3EdgeInsets button = M3EdgeInsets.symmetric(
    horizontal: M3SpacingToken.space24,
    vertical: M3SpacingToken.space12,
  );

  /// Compact button padding.
  static const M3EdgeInsets buttonCompact = M3EdgeInsets.symmetric(
    horizontal: M3SpacingToken.space16,
    vertical: M3SpacingToken.space8,
  );

  /// Large button padding.
  static const M3EdgeInsets buttonLarge = M3EdgeInsets.symmetric(
    horizontal: M3SpacingToken.space32,
    vertical: M3SpacingToken.space16,
  );

  // Dialog Patterns

  /// Standard dialog content padding.
  static const M3EdgeInsets dialogContent =
      M3EdgeInsets.all(M3SpacingToken.space24);

  /// Dialog title padding.
  static const M3EdgeInsets dialogTitle = M3EdgeInsets.only(
    left: M3SpacingToken.space24,
    top: M3SpacingToken.space24,
    right: M3SpacingToken.space24,
    bottom: M3SpacingToken.space16,
  );

  /// Dialog actions padding.
  static const M3EdgeInsets dialogActions = M3EdgeInsets.only(
    left: M3SpacingToken.space24,
    top: M3SpacingToken.space16,
    right: M3SpacingToken.space24,
    bottom: M3SpacingToken.space24,
  );

  // Screen Layout Patterns

  /// Standard screen padding for mobile devices.
  static const M3EdgeInsets screenMobile =
      M3EdgeInsets.all(M3SpacingToken.space16);

  /// Screen padding for tablet devices.
  static const M3EdgeInsets screenTablet =
      M3EdgeInsets.all(M3SpacingToken.space24);

  /// Screen padding for desktop devices.
  static const M3EdgeInsets screenDesktop =
      M3EdgeInsets.all(M3SpacingToken.space32);

  /// Responsive screen padding based on screen width.
  static M3EdgeInsets screenResponsive(double screenWidth) =>
      M3EdgeInsets.forScreenWidth(screenWidth);
}
