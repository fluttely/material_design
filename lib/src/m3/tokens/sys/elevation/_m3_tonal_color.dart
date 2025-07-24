part of 'm3_elevation.dart';

/// A utility class to handle Material 3 surface color calculations.
///
/// This class encapsulates the logic for applying a `surfaceTintColor` based on
/// elevation, as specified by the Material Design guidelines.
@immutable
abstract interface class _M3TonalColor {
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
  static Color fromElevation(
      BuildContext context, IM3ElevationToken elevation) {
    return _fromElevationValue(context, elevation.value);
  }

  static Color _fromElevationValue(
      BuildContext context, double elevationValue) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevationOverlay.applySurfaceTint(
      colorScheme.surface,
      colorScheme.surfaceTint,
      elevationValue,
    );
  }

  /// Calculates surface color with custom tint color and elevation.
  static Color calculateSurfaceColor({
    required Color surface,
    required Color surfaceTint,
    required IM3ElevationToken elevation,
  }) {
    if (elevation.value <= 0) return surface;

    // Calculate tint opacity based on elevation using M3 formula
    final tintOpacity = _calculateTintOpacity(elevation);

    return Color.alphaBlend(
      surfaceTint.withValues(alpha: tintOpacity),
      surface,
    );
  }

  /// Calculates the tint opacity for a given elevation.
  static double _calculateTintOpacity(IM3ElevationToken elevation) {
    if (elevation.value <= 0) return 0;
    if (elevation.value >= 24) return 0.12;

    // Exponential curve for natural progression
    return 0.12 * (1 - math.exp(-elevation.value / 8));
  }

  /// Creates a high contrast surface color for accessibility.
  static Color highContrastSurface({
    required Color surface,
    required Color surfaceTint,
    required IM3ElevationToken elevation,
  }) {
    if (elevation.value <= 0) return surface;

    // Enhanced tinting for high contrast
    final tintOpacity = math.min(_calculateTintOpacity(elevation) * 1.5, 0.2);
    return Color.alphaBlend(
      surfaceTint.withValues(alpha: tintOpacity),
      surface,
    );
  }
}
