import 'package:flutter/material.dart';

/// Defines conventional border width tokens for Material Design.
///
/// While Material Design 3 does not have a formal token scale for border
/// widths, it uses borders on several components (e.g., `OutlinedButton`,
/// `TextField`). A thin, 1dp border is the most common application.
///
/// This class provides a set of conventional widths to ensure consistency
/// when creating bordered components.
@immutable
abstract class M3Border {
  /// No border width (0dp).
  static const double none = 0;
  
  /// The standard thin border width (1dp).
  ///
  /// This is the default for most components like `OutlinedButton`.
  static const double thin = 1;

  /// A thicker border width (2dp) for emphasis or selected states.
  static const double thick = 2;

  /// An extra-thick border width (4dp) for special cases requiring
  /// significant visual weight.
  static const double extraThick = 4;
  
  // --- Border Utilities ---
  
  /// Creates a standard outline border with the given color and width.
  static Border outline({
    required Color color,
    double width = thin,
  }) {
    return Border.all(color: color, width: width);
  }
  
  /// Creates a bottom border only.
  static Border bottom({
    required Color color,
    double width = thin,
  }) {
    return Border(
      bottom: BorderSide(color: color, width: width),
    );
  }
  
  /// Creates a top border only.
  static Border top({
    required Color color,
    double width = thin,
  }) {
    return Border(
      top: BorderSide(color: color, width: width),
    );
  }
  
  /// Creates left and right borders only.
  static Border vertical({
    required Color color,
    double width = thin,
  }) {
    return Border(
      left: BorderSide(color: color, width: width),
      right: BorderSide(color: color, width: width),
    );
  }
  
  /// Creates top and bottom borders only.
  static Border horizontal({
    required Color color,
    double width = thin,
  }) {
    return Border(
      top: BorderSide(color: color, width: width),
      bottom: BorderSide(color: color, width: width),
    );
  }
  
  /// Creates a focus border with enhanced visibility.
  static Border focus({
    required Color color,
    double width = thick,
  }) {
    return Border.all(color: color, width: width);
  }
  
  /// Creates an error border for form validation.
  static Border error({
    required Color color,
    double width = thick,
  }) {
    return Border.all(color: color, width: width);
  }
  
  /// Creates a disabled border with reduced opacity.
  static Border disabled({
    required Color color,
    double width = thin,
    double opacity = 0.38,
  }) {
    return Border.all(
      color: color.withValues(alpha: opacity),
      width: width,
    );
  }
}
