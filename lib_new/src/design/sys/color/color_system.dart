/// Color system based on Material Design 3 specification.
///
/// Reference: https://m3.material.io/styles/color/system
library;

import 'dart:ui';

/// The Material 3 color system provides a foundation for applying color to UI
/// in a meaningful and expressive way.
abstract class M3ColorSystem {
  /// Primary colors for your app's main components.
  static const ColorRole primary = ColorRole._();
  
  /// Secondary colors for less prominent components.
  static const ColorRole secondary = ColorRole._();
  
  /// Tertiary colors for contrasting accents.
  static const ColorRole tertiary = ColorRole._();
  
  /// Error colors for components that communicate error.
  static const ColorRole error = ColorRole._();
  
  /// Neutral colors for backgrounds and surfaces.
  static const ColorRole neutral = ColorRole._();
  
  /// Neutral variant colors for medium emphasis surfaces and text.
  static const ColorRole neutralVariant = ColorRole._();
}

/// Represents a color role in the Material 3 design system.
class ColorRole {
  const ColorRole._();
  
  /// The main color for this role.
  Color get color => throw UnimplementedError();
  
  /// Color used for text and icons displayed on top of the main color.
  Color get onColor => throw UnimplementedError();
  
  /// A container color for this role, providing more visual separation.
  Color get container => throw UnimplementedError();
  
  /// Color used for text and icons displayed on top of the container color.
  Color get onContainer => throw UnimplementedError();
}

/// Surface colors for backgrounds, cards, and sheets.
abstract class M3SurfaceColors {
  /// Primary surface color - the main background color.
  static const Color surface = Color(0xFFFEFBFF);
  
  /// Surface color displayed on top of the main surface.
  static const Color onSurface = Color(0xFF1C1B1F);
  
  /// Variant surface color for lower emphasis backgrounds.
  static const Color surfaceVariant = Color(0xFFE7E0EC);
  
  /// Color for text and icons on surface variant.
  static const Color onSurfaceVariant = Color(0xFF49454F);
  
  /// Surface color with the lowest emphasis.
  static const Color surfaceDim = Color(0xFFDED8E1);
  
  /// Surface color with medium emphasis.
  static const Color surfaceBright = Color(0xFFFEF7FF);
  
  /// Container surface colors for different elevation levels.
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF7F2FA);
  static const Color surfaceContainer = Color(0xFFF3EDF7);
  static const Color surfaceContainerHigh = Color(0xFFECE6F0);
  static const Color surfaceContainerHighest = Color(0xFFE6E0E9);
}

/// Outline colors for borders and dividers.
abstract class M3OutlineColors {
  /// Primary outline color for borders with medium emphasis.
  static const Color outline = Color(0xFF79747E);
  
  /// Variant outline color for borders with lower emphasis.
  static const Color outlineVariant = Color(0xFFCAC4D0);
}

/// Inverse colors for high contrast themes.
abstract class M3InverseColors {
  /// Inverse surface color for high contrast backgrounds.
  static const Color inverseSurface = Color(0xFF313033);
  
  /// Color for text and icons on inverse surface.
  static const Color onInverseSurface = Color(0xFFF4EFF4);
  
  /// Inverse primary color for high contrast accents.
  static const Color inversePrimary = Color(0xFFD0BCFF);
}

/// Color mappings for different UI states.
abstract class M3StateColors {
  /// Color for hovered state layers.
  static const double hoveredOpacity = 0.08;
  
  /// Color for focused state layers.
  static const double focusedOpacity = 0.12;
  
  /// Color for pressed state layers.
  static const double pressedOpacity = 0.12;
  
  /// Color for dragged state layers.
  static const double draggedOpacity = 0.16;
}