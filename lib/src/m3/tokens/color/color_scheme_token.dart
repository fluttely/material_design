part of '../../../../material_design.dart';

/// Extension on Flutter's [ColorScheme] that adds M3-aligned helpers.
///
/// Flutter's [ColorScheme] already contains all 30+ Material Design 3 color
/// roles (primary, onPrimary, primaryContainer, surface, etc.). This extension
/// adds convenience methods that integrate those roles with M3 token concepts.
extension M3ColorSchemeTokens on ColorScheme {
  // --- State layer colors ---

  /// Returns [base] blended with a hover state layer (8% opacity).
  Color hoverLayerOn(Color base) =>
      base.withValues(alpha: M3StateLayerOpacities.hover);

  /// Returns [base] blended with a focus state layer (10% opacity).
  Color focusLayerOn(Color base) =>
      base.withValues(alpha: M3StateLayerOpacities.focus);

  /// Returns [base] blended with a press state layer (10% opacity).
  Color pressLayerOn(Color base) =>
      base.withValues(alpha: M3StateLayerOpacities.pressed);

  /// Returns [base] blended with a drag state layer (16% opacity).
  Color dragLayerOn(Color base) =>
      base.withValues(alpha: M3StateLayerOpacities.dragged);

  // --- Disabled colors ---

  /// Returns a color at the disabled content opacity (38%).
  Color disabledContent(Color base) =>
      base.withValues(alpha: M3Opacities.disabledContent);

  /// Returns a color at the disabled container opacity (12%).
  Color disabledContainer(Color base) =>
      base.withValues(alpha: M3Opacities.disabledContainer);

  // --- Surface tinting ---

  /// Returns the surface color tinted for [elevation] using this scheme.
  Color surfaceAtElevation(M3Elevation elevation) =>
      ElevationOverlay.applySurfaceTint(surface, surfaceTint, elevation.dp);

  // --- Contrast checking ---

  /// Whether [foreground] meets WCAG AA contrast against [background].
  bool isAccessible(Color foreground, Color background) =>
      M3ColorUtils.meetsWCAGAA(foreground, background);
}

/// A tonal palette reference aligned with the M3 tonal system.
///
/// Each key is a "tone" value from 0 (black) to 100 (white). These tones
/// correspond to the Material Design 3 tonal palette specification, where tone
/// 40 maps to the "primary" role in a light scheme and tone 80 in a dark
/// scheme.
///
/// Note: Precise HCT-space palettes require the `material_color_utilities`
/// package. These constants describe the tonal axis values only; the actual
/// colors depend on the seed color used to generate the palette.
abstract final class M3TonalPalette {
  /// Tone 0 — black.
  static const int black = 0;

  /// Tone 10 — darkest usable color (surface in dark high-contrast schemes).
  static const int tone10 = 10;

  /// Tone 20 — very dark.
  static const int tone20 = 20;

  /// Tone 30 — dark (onTertiary in dark schemes).
  static const int tone30 = 30;

  /// Tone 40 — primary role in light schemes.
  static const int tone40 = 40;

  /// Tone 50 — mid-tone.
  static const int tone50 = 50;

  /// Tone 60 — medium-light.
  static const int tone60 = 60;

  /// Tone 70 — light (tertiary in dark schemes).
  static const int tone70 = 70;

  /// Tone 80 — primary role in dark schemes.
  static const int tone80 = 80;

  /// Tone 90 — primaryContainer in light schemes.
  static const int tone90 = 90;

  /// Tone 95 — surfaceContainer in light schemes.
  static const int tone95 = 95;

  /// Tone 99 — near-white surface.
  static const int tone99 = 99;

  /// Tone 100 — white.
  static const int white = 100;

  /// All tones in ascending order.
  static const List<int> all = [
    black,
    tone10,
    tone20,
    tone30,
    tone40,
    tone50,
    tone60,
    tone70,
    tone80,
    tone90,
    tone95,
    tone99,
    white,
  ];
}
