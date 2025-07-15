import 'package:flutter/material.dart';

/// Elevation values used for Material surfaces following the Material Design 3
/// specification.
///
/// Elevation is the relative distance between two surfaces along the z-axis.
/// The Material Design 3 elevation system uses 6 levels (0-5) with specific
/// dp values.
///
/// Reference: https://m3.material.io/styles/elevation/tokens
abstract final class MaterialElevation {
  /// No elevation (0dp) - Used for surfaces at the base level.
  static const double level0 = 0;

  /// Level 1 elevation (1dp) - Used for raised components like filled buttons.
  static const double level1 = 1;

  /// Level 2 elevation (3dp) - Used for elevated components like cards.
  static const double level2 = 3;

  /// Level 3 elevation (6dp) - Used for floating components like FABs.
  static const double level3 = 6;

  /// Level 4 elevation (8dp) - Used for navigation drawers.
  static const double level4 = 8;

  /// Level 5 elevation (12dp) - Used for modal components like dialogs.
  static const double level5 = 12;
}

/// A utility class to map elevation values to [BoxShadow]s.
class ElevationHelper {
  /// Generates a Material Design-like shadow list algorithmically for any
  /// given elevation `value`.
  ///
  /// This method uses linear interpolation to create plausible shadows that
  /// scale smoothly with the elevation `value`.
  ///
  /// NOTE: This is an approximation of the Material Design system, not a strict
  /// implementation of its discrete tokens. It provides flexibility at the cost
  /// of deviating from the official, hand-tuned values.
  ///
  /// - `value`: The desired elevation in logical pixels (dp).
  /// - `shadowColor`: The base color for the shadows, typically from the theme.
  static List<BoxShadow> toBoxShadow(
    double value, {
    Color shadowColor = Colors.black,
  }) {
    if (value <= 0) {
      return [];
    }

    // Helper function for linear interpolation.
    double lerp(double a, double b, double t) {
      return a + (b - a) * t;
    }

    // Normalize the elevation value to a 0.0-1.0 range.
    // We'll cap the "max" interpolation effect at 24dp, a common high
    // elevation value.
    final progress = (value / 24.0).clamp(0.0, 1.0);

    // --- Define the two shadows (Umbra and Penumbra) ---

    // 1. Umbra (the darker, sharper shadow directly under the element)
    final umbra = BoxShadow(
      color: shadowColor.withValues(alpha: lerp(0.1, 0.2, progress)),
      offset: Offset(
        0,
        lerp(0.5, 10, progress),
      ), // y-offset grows significantly
      blurRadius: lerp(1, 12, progress), // blur grows
    );

    // 2. Penumbra (the softer, wider, more ambient shadow)
    final penumbra = BoxShadow(
      color: shadowColor.withValues(alpha: lerp(0.08, 0.15, progress)),
      offset: Offset(0, lerp(1, 20, progress)), // y-offset grows even more
      blurRadius: lerp(2, 28, progress), // blur is much larger
      spreadRadius: lerp(0, 4, progress), // spread appears at higher elevations
    );

    return [umbra, penumbra];
  }
}
