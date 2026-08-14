part of '../../../color.dart';

/// Extension on Flutter's [ColorScheme] that adds M3-aligned helpers.
///
/// Flutter's [ColorScheme] already contains all 30+ Material Design 3 color
/// roles (primary, onPrimary, primaryContainer, surface, etc.). This extension
/// adds convenience methods that integrate those roles with M3 token concepts.
extension M3ColorSchemeTokens on ColorScheme {
  // --- State layer colors ---

  /// Returns the state-layer overlay color for [base] in the given [state].
  ///
  /// [base] is the component's content color — `onSurface`, `onPrimary`, and
  /// so on. The opacity comes from [M3InteractionState.stateLayerOpacity].
  ///
  /// ```dart
  /// colorScheme.stateLayerColor(
  ///   colorScheme.onSurface,
  ///   M3InteractionState.hover,
  /// )
  /// ```
  Color stateLayerColor(Color base, M3InteractionState state) =>
      base.withValues(alpha: state.stateLayerOpacity);

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
