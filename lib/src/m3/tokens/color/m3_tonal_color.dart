import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A utility class to handle Material 3 surface color calculations.
///
/// This class encapsulates the logic for applying a `surfaceTintColor` based on
/// elevation, as specified by the Material Design guidelines.
@immutable
abstract class M3TonalColor {
  /// Calculates the surface color with an elevation-based tint.
  ///
  /// This method is a convenient wrapper around Flutter's
  /// [ElevationOverlay.applySurfaceTint]. It fetches the `surface` and
  /// `surfaceTint` colors from the current theme's `ColorScheme` and applies
  /// the tint based on the provided [elevation] in logical pixels (dp).
  ///
  /// - [context]: The `BuildContext` used to access the current theme.
  /// - [elevation]: The elevation of the surface, which determines the
  ///   amount of tint to apply.
  ///
  /// Returns the final, tinted surface color.
  static Color fromElevation(BuildContext context, double elevation) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevationOverlay.applySurfaceTint(
      colorScheme.surface,
      colorScheme.surfaceTint,
      elevation,
    );
  }
  
  /// Calculates surface color with custom tint color and elevation.
  static Color calculateSurfaceColor({
    required Color surface,
    required Color surfaceTint,
    required double elevation,
  }) {
    if (elevation <= 0) return surface;
    
    // Calculate tint opacity based on elevation using M3 formula
    final tintOpacity = _calculateTintOpacity(elevation);
    
    return Color.alphaBlend(
      surfaceTint.withValues(alpha: tintOpacity),
      surface,
    );
  }
  
  /// Calculates the tint opacity for a given elevation.
  static double _calculateTintOpacity(double elevation) {
    if (elevation <= 0) return 0.0;
    if (elevation >= 24) return 0.12;
    
    // Exponential curve for natural progression
    return 0.12 * (1 - math.exp(-elevation / 8));
  }
  
  /// Gets surface color at specific elevation level.
  static Color surfaceAt(BuildContext context, double elevation) {
    final colorScheme = Theme.of(context).colorScheme;
    return calculateSurfaceColor(
      surface: colorScheme.surface,
      surfaceTint: colorScheme.surfaceTint,
      elevation: elevation,
    );
  }
  
  /// Predefined surface levels for common use cases.
  static Color surface1(BuildContext context) => surfaceAt(context, 1);
  static Color surface2(BuildContext context) => surfaceAt(context, 3);
  static Color surface3(BuildContext context) => surfaceAt(context, 6);
  static Color surface4(BuildContext context) => surfaceAt(context, 8);
  static Color surface5(BuildContext context) => surfaceAt(context, 12);
  
  /// Creates a high contrast surface color for accessibility.
  static Color highContrastSurface({
    required Color surface,
    required Color surfaceTint,
    required double elevation,
  }) {
    if (elevation <= 0) return surface;
    
    // Enhanced tinting for high contrast
    final tintOpacity = math.min(_calculateTintOpacity(elevation) * 1.5, 0.2);
    return Color.alphaBlend(
      surfaceTint.withValues(alpha: tintOpacity),
      surface,
    );
  }
}
