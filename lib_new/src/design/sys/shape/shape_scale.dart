/// Shape scale based on Material Design 3 specification.
///
/// Reference: https://m3.material.io/styles/shape/shape-scale-tokens
library;

import 'package:flutter/painting.dart';

/// The Material 3 shape scale provides a systematic approach to applying
/// shape to components and layouts.
abstract class M3ShapeScale {
  /// None - no rounding, sharp corners.
  /// Used for components that need to feel stable and grounded.
  static const double none = 0.0;

  /// Extra small - minimal rounding.
  /// Used for small components like chips and text fields.
  static const double extraSmall = 4.0;

  /// Small - subtle rounding.
  /// Used for components like buttons and cards.
  static const double small = 8.0;

  /// Medium - moderate rounding.
  /// Used for larger components like dialogs and sheets.
  static const double medium = 12.0;

  /// Large - prominent rounding.
  /// Used for large surfaces and containers.
  static const double large = 16.0;

  /// Extra large - maximum rounding.
  /// Used for floating action buttons and other prominent elements.
  static const double extraLarge = 28.0;

  /// Full - completely rounded (circular or pill-shaped).
  /// Used for elements that should be circular or pill-shaped.
  static const double full = 1000.0; // Large enough to create full rounding
}

/// Corner styles for different shape applications.
abstract class M3CornerStyles {
  /// Rounded corners using circular arcs.
  static const String rounded = 'rounded';

  /// Cut corners using straight lines.
  static const String cut = 'cut';

  /// Mixed corners combining rounded and cut styles.
  static const String mixed = 'mixed';
}

/// Shape tokens for specific component categories.
abstract class M3ShapeTokens {
  /// Corner radius tokens for different sizes.
  static const M3ShapeToken corner = M3ShapeToken._(
    none: M3ShapeScale.none,
    extraSmall: M3ShapeScale.extraSmall,
    small: M3ShapeScale.small,
    medium: M3ShapeScale.medium,
    large: M3ShapeScale.large,
    extraLarge: M3ShapeScale.extraLarge,
    full: M3ShapeScale.full,
  );
}

/// Represents a complete set of shape values.
class M3ShapeToken {
  const M3ShapeToken._({
    required this.none,
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
    required this.full,
  });

  /// No rounding.
  final double none;

  /// Extra small rounding.
  final double extraSmall;

  /// Small rounding.
  final double small;

  /// Medium rounding.
  final double medium;

  /// Large rounding.
  final double large;

  /// Extra large rounding.
  final double extraLarge;

  /// Full rounding.
  final double full;

  @override
  String toString() {
    return 'M3ShapeToken('
        'none: $none, '
        'extraSmall: $extraSmall, '
        'small: $small, '
        'medium: $medium, '
        'large: $large, '
        'extraLarge: $extraLarge, '
        'full: $full'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is M3ShapeToken &&
        other.none == none &&
        other.extraSmall == extraSmall &&
        other.small == small &&
        other.medium == medium &&
        other.large == large &&
        other.extraLarge == extraLarge &&
        other.full == full;
  }

  @override
  int get hashCode {
    return Object.hash(
      none,
      extraSmall,
      small,
      medium,
      large,
      extraLarge,
      full,
    );
  }
}

/// Utility functions for working with shapes.
abstract class M3ShapeUtils {
  /// Creates a circular border radius with the given value.
  static BorderRadius circular(double radius) {
    return BorderRadius.circular(radius);
  }

  /// Creates a border radius with only the top corners rounded.
  static BorderRadius topOnly(double radius) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );
  }

  /// Creates a border radius with only the bottom corners rounded.
  static BorderRadius bottomOnly(double radius) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }

  /// Creates a border radius with only the left corners rounded.
  static BorderRadius leftOnly(double radius) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
    );
  }

  /// Creates a border radius with only the right corners rounded.
  static BorderRadius rightOnly(double radius) {
    return BorderRadius.only(
      topRight: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }

  /// Creates a border radius with different values for each corner.
  static BorderRadius custom({
    double topLeft = 0.0,
    double topRight = 0.0,
    double bottomLeft = 0.0,
    double bottomRight = 0.0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }
}