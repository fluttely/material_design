import 'package:flutter/material.dart';

/// Provides pre-defined, Material 3-compliant color schemes.
///
/// This class offers complete `ColorScheme` objects for both light and dark
/// themes, generated from a default seed color. Using `ColorScheme.fromSeed`
/// is the recommended Material 3 approach in Flutter, as it automatically
/// generates the full set of 60+ color roles (primary, onPrimary, surface,
/// inversePrimary, etc.) needed for a compliant theme.
///
/// These schemes can be directly applied to `ThemeData.colorScheme`.
///
/// Reference: https://m3.material.io/styles/color/the-color-system
abstract final class MaterialColorScheme {
  /// The default seed color used to generate the color schemes.
  /// This is a standard Material blue color.
  static const Color defaulthSeedColor = Color(0xFF6750A4);

  /// A complete, pre-defined Material 3 color scheme.
  static ColorScheme create({
    Color seedColor = defaulthSeedColor,
    Brightness brightness = Brightness.light,
  }) {
    return ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );
  }
}
