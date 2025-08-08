part of '../../../../material_design.dart';

/// {@template m3_tonal_color}
/// Internal utility class for Material Design 3 surface tint calculations.
///
/// This class implements the core tonal elevation system of Material Design 3,
/// where surfaces at different elevations receive varying amounts of surface
/// tint to indicate their relative depth. The tonal system is the primary
/// method for expressing elevation in Material Design 3, with shadows serving
/// as a complementary enhancement.
///
/// ## Material Design 3 Tonal System
///
/// The tonal elevation system works by blending a surface tint color
/// (typically the primary color) with the base surface color. Higher
/// elevations receive more tint, creating a visual hierarchy that
/// indicates relative depth and importance.
///
/// ## Tint Application Formula
///
/// The tint opacity is calculated using an exponential curve that provides
/// natural-feeling progression:
/// - **0dp**: No tint (pure surface color)
/// - **1-6dp**: Gradual tint increase (subtle depth indication)
/// - **8-24dp**: Enhanced tint (prominent elevation)
/// - **24dp+**: Maximum tint (critical elevation)
///
/// ## Integration with Theme System
///
/// The tonal color system integrates seamlessly with Flutter's theme system,
/// automatically extracting surface and surfaceTint colors from the current
/// ColorScheme and applying appropriate tinting based on elevation values.
///
/// **Internal Implementation**: This is a private utility used by the elevation
/// token system. External code should use [M3Elevation] extensions like
/// `surfaceColor(context)` or `calculateSurfaceColor()`.
///
/// Reference: https://m3.material.io/styles/elevation/applying-elevation
/// {@endtemplate}
@immutable
abstract interface class M3SurfaceTint {
  static Color fromElevationToken(
    BuildContext context,
    M3Elevation elevation,
  ) {
    return fromElevation(context, elevation.dp);
  }

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
  static Color fromElevation(BuildContext context, double elevationValue) {
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
    required M3Elevation elevation,
  }) {
    if (elevation.dp <= 0) return surface;

    // Calculate tint opacity based on elevation using M3 formula
    final tintOpacity = _calculateTintOpacity(elevation);

    return Color.alphaBlend(
      surfaceTint.withValues(alpha: tintOpacity),
      surface,
    );
  }

  /// Calculates the tint opacity for a given elevation using M3's formula.
  ///
  /// This method implements Material Design 3's exponential tint progression
  /// that provides natural depth perception. The formula ensures:
  /// - Smooth opacity transitions between elevation levels
  /// - Maximum tint cap at 12% for readability
  /// - Exponential curve that feels natural to users
  ///
  /// **Formula**: `opacity = 0.12 * (1 - e^(-elevation/8))`
  ///
  /// [elevation] - The elevation token to calculate opacity for
  /// Returns opacity dp between 0.0 and 0.12
  static double _calculateTintOpacity(M3Elevation elevation) {
    if (elevation.dp <= 0) return 0;
    if (elevation.dp >= 24) return 0.12;

    // Exponential curve for natural progression
    return 0.12 * (1 - math.exp(-elevation.dp / 8));
  }

  /// Creates a high contrast surface color for accessibility compliance.
  ///
  /// This method enhances the standard surface tinting to provide better
  /// visual distinction for users with accessibility needs. The enhanced
  /// tinting ensures elevation differences are more pronounced while
  /// maintaining readability standards.
  ///
  /// **Accessibility Features**:
  /// - 1.5x tint multiplier for enhanced visibility
  /// - Maximum opacity cap at 20% to preserve readability
  /// - Maintains color harmony with the base tint system
  ///
  /// [surface] - The base surface color
  /// [surfaceTint] - The tint color to blend
  /// [elevation] - The elevation level for tint calculation
  /// Returns enhanced surface color with accessibility-friendly tinting
  static Color highContrastSurface({
    required Color surface,
    required Color surfaceTint,
    required M3Elevation elevation,
  }) {
    if (elevation.dp <= 0) return surface;

    // Enhanced tinting for high contrast (1.5x multiplier, max 20%)
    final tintOpacity = math.min(_calculateTintOpacity(elevation) * 1.5, 0.2);
    return Color.alphaBlend(
      surfaceTint.withValues(alpha: tintOpacity),
      surface,
    );
  }
}
