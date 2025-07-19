import 'package:flutter/material.dart';

/// A utility class to handle Material 3 surface color calculations.
///
/// This class encapsulates the logic for applying a `surfaceTintColor` based on
/// elevation, as specified by the Material Design guidelines.
@immutable
abstract final class M3TonalColor {
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
}
