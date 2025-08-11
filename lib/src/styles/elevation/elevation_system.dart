/// Material Design 3 elevation system.
///
/// This file implements the Material Design 3 elevation specifications
/// including shadow values, tonal elevation, and overlay colors.
///
/// Elevation creates hierarchy and depth by combining shadows and
/// surface tint colors (in dark theme).
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/styles/elevation
library;

import 'package:flutter/material.dart';

/// Material Design 3 elevation levels.
///
/// Provides standardized elevation values from 0 to 5.
/// Each level has specific shadow values and tonal overlays.
///
/// Reference: https://m3.material.io/styles/elevation/tokens
class MaterialElevation {
  MaterialElevation._();

  /// Level 0: No elevation (0dp).
  ///
  /// Use cases:
  /// - Flat surfaces
  /// - Disabled components
  /// - Background surfaces
  static const double level0 = 0.0;

  /// Level 1: Low elevation (1dp).
  ///
  /// Use cases:
  /// - Cards (elevated variant)
  /// - Search bars
  /// - Switches, checkboxes
  /// - Elevated buttons (default state)
  static const double level1 = 1.0;

  /// Level 2: Medium-low elevation (3dp).
  ///
  /// Use cases:
  /// - Elevated buttons (hover state)
  /// - Cards (hover state)
  /// - Top app bar (scrolled state)
  /// - FAB (lowered state)
  static const double level2 = 3.0;

  /// Level 3: Medium elevation (6dp).
  ///
  /// Use cases:
  /// - FAB (default state)
  /// - Elevated buttons (pressed state)
  /// - Bottom app bar
  /// - Modal side sheets
  static const double level3 = 6.0;

  /// Level 4: Medium-high elevation (8dp).
  ///
  /// Use cases:
  /// - Modal bottom sheets
  /// - Standard dialogs
  /// - Navigation drawers (modal)
  /// - FAB (hover state)
  static const double level4 = 8.0;

  /// Level 5: High elevation (12dp).
  ///
  /// Use cases:
  /// - FAB (pressed state)
  /// - Menus and dropdowns
  /// - Tooltips
  /// - Time/date pickers
  static const double level5 = 12.0;

  /// Gets the elevation value for a given level.
  static double getElevation(int level) {
    switch (level) {
      case 0:
        return level0;
      case 1:
        return level1;
      case 2:
        return level2;
      case 3:
        return level3;
      case 4:
        return level4;
      case 5:
        return level5;
      default:
        return level0;
    }
  }
}

/// Material Design 3 shadow specifications.
///
/// Provides box shadows for each elevation level following M3 guidelines.
/// Each elevation level uses two shadows for more realistic depth.
class MaterialShadows {
  MaterialShadows._();

  /// Shadow for elevation level 0 (no shadow).
  static const List<BoxShadow> elevation0 = [];

  /// Shadow for elevation level 1.
  ///
  /// Used for slightly elevated surfaces like cards and buttons.
  static const List<BoxShadow> elevation1 = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
      color: Color(0x4D000000), // 30% opacity
    ),
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 1,
      color: Color(0x26000000), // 15% opacity
    ),
  ];

  /// Shadow for elevation level 2.
  ///
  /// Used for hover states and slightly more prominent surfaces.
  static const List<BoxShadow> elevation2 = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
      color: Color(0x4D000000), // 30% opacity
    ),
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 2,
      color: Color(0x26000000), // 15% opacity
    ),
  ];

  /// Shadow for elevation level 3.
  ///
  /// Used for FABs and pressed states.
  static const List<BoxShadow> elevation3 = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
      color: Color(0x4D000000), // 30% opacity
    ),
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 3,
      color: Color(0x26000000), // 15% opacity
    ),
  ];

  /// Shadow for elevation level 4.
  ///
  /// Used for dialogs and modal sheets.
  static const List<BoxShadow> elevation4 = [
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 3,
      spreadRadius: 0,
      color: Color(0x4D000000), // 30% opacity
    ),
    BoxShadow(
      offset: Offset(0, 6),
      blurRadius: 10,
      spreadRadius: 4,
      color: Color(0x26000000), // 15% opacity
    ),
  ];

  /// Shadow for elevation level 5.
  ///
  /// Used for menus, tooltips, and highest elevation surfaces.
  static const List<BoxShadow> elevation5 = [
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 4,
      spreadRadius: 0,
      color: Color(0x4D000000), // 30% opacity
    ),
    BoxShadow(
      offset: Offset(0, 8),
      blurRadius: 12,
      spreadRadius: 6,
      color: Color(0x26000000), // 15% opacity
    ),
  ];

  /// Gets box shadows for a given elevation level.
  static List<BoxShadow> getShadows(int level) {
    switch (level) {
      case 0:
        return elevation0;
      case 1:
        return elevation1;
      case 2:
        return elevation2;
      case 3:
        return elevation3;
      case 4:
        return elevation4;
      case 5:
        return elevation5;
      default:
        return elevation0;
    }
  }

  /// Creates custom shadows with a specific color.
  static List<BoxShadow> withColor(int level, Color shadowColor) {
    final baseShadows = getShadows(level);
    if (baseShadows.isEmpty) return baseShadows;

    return baseShadows.map((shadow) {
      // Maintain the original opacity ratios
      final opacity = shadow.color.opacity;
      return BoxShadow(
        offset: shadow.offset,
        blurRadius: shadow.blurRadius,
        spreadRadius: shadow.spreadRadius,
        color: shadowColor.withOpacity(opacity),
      );
    }).toList();
  }
}

/// Material Design 3 tonal elevation for dark themes.
///
/// In dark themes, elevation is indicated by overlaying the primary
/// color with increasing opacity at higher elevation levels.
class TonalElevation {
  TonalElevation._();

  /// Opacity for elevation level 0 (no overlay).
  static const double level0Opacity = 0.0;

  /// Opacity for elevation level 1 (5% overlay).
  static const double level1Opacity = 0.05;

  /// Opacity for elevation level 2 (8% overlay).
  static const double level2Opacity = 0.08;

  /// Opacity for elevation level 3 (11% overlay).
  static const double level3Opacity = 0.11;

  /// Opacity for elevation level 4 (12% overlay).
  static const double level4Opacity = 0.12;

  /// Opacity for elevation level 5 (14% overlay).
  static const double level5Opacity = 0.14;

  /// Gets the tonal overlay opacity for a given elevation level.
  static double getOpacity(int level) {
    switch (level) {
      case 0:
        return level0Opacity;
      case 1:
        return level1Opacity;
      case 2:
        return level2Opacity;
      case 3:
        return level3Opacity;
      case 4:
        return level4Opacity;
      case 5:
        return level5Opacity;
      default:
        return level0Opacity;
    }
  }

  /// Creates a tonal elevation color overlay.
  ///
  /// [surfaceColor]: The base surface color.
  /// [tintColor]: The primary color used for tinting (usually primary).
  /// [elevation]: The elevation level (0-5).
  static Color applyTonalElevation(
    Color surfaceColor,
    Color tintColor,
    int elevation,
  ) {
    final opacity = getOpacity(elevation);
    if (opacity == 0.0) return surfaceColor;

    return Color.alphaBlend(
      tintColor.withOpacity(opacity),
      surfaceColor,
    );
  }

  /// Creates a surface tint color for dark theme overlays.
  static Color getSurfaceTint(Color primaryColor, int elevation) {
    final opacity = getOpacity(elevation);
    return primaryColor.withOpacity(opacity);
  }
}

/// Material Design 3 elevation overlay colors.
///
/// Provides the overlay colors used in dark themes to indicate elevation
/// through color instead of (or in addition to) shadows.
class ElevationOverlay {
  ElevationOverlay._();

  /// Applies elevation overlay to a surface color.
  ///
  /// In light theme, returns the surface color unchanged.
  /// In dark theme, applies a primary color tint based on elevation.
  static Color applyOverlay(
    BuildContext context,
    Color surface,
    double elevation,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (!isDark || elevation == 0.0) {
      return surface;
    }

    // Get the primary color for tinting
    final primaryColor = theme.colorScheme.primary;

    // Convert elevation to level (0-5)
    final level = _elevationToLevel(elevation);

    // Apply tonal elevation
    return TonalElevation.applyTonalElevation(
      surface,
      primaryColor,
      level,
    );
  }

  /// Converts a continuous elevation value to a discrete level (0-5).
  static int _elevationToLevel(double elevation) {
    if (elevation <= 0) return 0;
    if (elevation <= 1) return 1;
    if (elevation <= 3) return 2;
    if (elevation <= 6) return 3;
    if (elevation <= 8) return 4;
    return 5;
  }

  /// Creates an overlay color without context.
  ///
  /// Useful for creating elevation overlays when context is not available.
  static Color createOverlay(
    Color surface,
    Color primary,
    double elevation, {
    bool isDarkTheme = false,
  }) {
    if (!isDarkTheme || elevation == 0.0) {
      return surface;
    }

    final level = _elevationToLevel(elevation);
    return TonalElevation.applyTonalElevation(surface, primary, level);
  }
}

/// Component-specific elevation values.
///
/// Predefined elevation values for common Material Design 3 components.
class ComponentElevation {
  ComponentElevation._();

  // Cards
  static const double cardElevated = MaterialElevation.level1;
  static const double cardElevatedHover = MaterialElevation.level2;
  static const double cardElevatedDragged = MaterialElevation.level3;

  // Buttons
  static const double buttonElevated = MaterialElevation.level1;
  static const double buttonElevatedHover = MaterialElevation.level2;
  static const double buttonElevatedPressed = MaterialElevation.level1;
  static const double buttonElevatedDisabled = MaterialElevation.level0;

  // FAB
  static const double fabDefault = MaterialElevation.level3;
  static const double fabHover = MaterialElevation.level4;
  static const double fabPressed = MaterialElevation.level3;
  static const double fabLowered = MaterialElevation.level1;

  // App bars
  static const double topAppBarFlat = MaterialElevation.level0;
  static const double topAppBarScrolled = MaterialElevation.level2;
  static const double bottomAppBar = MaterialElevation.level3;

  // Navigation
  static const double navigationBar = MaterialElevation.level2;
  static const double navigationDrawerModal = MaterialElevation.level1;
  static const double navigationRail = MaterialElevation.level0;

  // Sheets and dialogs
  static const double bottomSheetModal = MaterialElevation.level1;
  static const double dialogDefault = MaterialElevation.level3;
  static const double sideSheetModal = MaterialElevation.level1;

  // Menus and tooltips
  static const double menu = MaterialElevation.level2;
  static const double tooltip = MaterialElevation.level2;

  // Other components
  static const double snackbar = MaterialElevation.level3;
  static const double switchLevel = MaterialElevation.level1;
  static const double searchBar = MaterialElevation.level2;
  static const double searchView = MaterialElevation.level3;
}

/// Utilities for working with elevation.
class ElevationUtils {
  ElevationUtils._();

  /// Animates between two elevation levels.
  ///
  /// Returns an elevation value interpolated between [begin] and [end]
  /// based on the animation [value] (0.0 to 1.0).
  static double lerp(double begin, double end, double value) {
    return begin + (end - begin) * value;
  }

  /// Creates an animated elevation transition.
  ///
  /// Useful for hover, focus, and pressed states.
  static double animate({
    required double idle,
    required double hover,
    required double pressed,
    bool isHovered = false,
    bool isPressed = false,
  }) {
    if (isPressed) return pressed;
    if (isHovered) return hover;
    return idle;
  }

  /// Gets the appropriate elevation for a component state.
  static double getStateElevation({
    required double idle,
    double? hover,
    double? focus,
    double? pressed,
    double? dragged,
    double? disabled,
    bool isHovered = false,
    bool isFocused = false,
    bool isPressed = false,
    bool isDragged = false,
    bool isDisabled = false,
  }) {
    if (isDisabled && disabled != null) return disabled;
    if (isDragged && dragged != null) return dragged;
    if (isPressed && pressed != null) return pressed;
    if (isHovered && hover != null) return hover;
    if (isFocused && focus != null) return focus;
    return idle;
  }

  /// Creates a decoration with elevation.
  ///
  /// Combines box shadows and surface tint for proper elevation rendering.
  static BoxDecoration createElevatedDecoration({
    required Color color,
    required double elevation,
    Color? shadowColor,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.rectangle,
  }) {
    final level = ElevationOverlay._elevationToLevel(elevation);
    final shadows = shadowColor != null
        ? MaterialShadows.withColor(level, shadowColor)
        : MaterialShadows.getShadows(level);

    return BoxDecoration(
      color: color,
      borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
      shape: shape,
      boxShadow: shadows,
    );
  }

  /// Validates if an elevation value is within M3 specifications.
  static bool isValidElevation(double elevation) {
    return elevation >= 0 && elevation <= MaterialElevation.level5;
  }

  /// Gets a human-readable description of the elevation level.
  static String getDescription(double elevation) {
    if (elevation == 0) return 'Flat (Level 0)';
    if (elevation <= 1) return 'Low (Level 1)';
    if (elevation <= 3) return 'Medium-Low (Level 2)';
    if (elevation <= 6) return 'Medium (Level 3)';
    if (elevation <= 8) return 'Medium-High (Level 4)';
    if (elevation <= 12) return 'High (Level 5)';
    return 'Very High (Above Level 5)';
  }
}

/// A widget that applies elevation to its child.
///
/// This widget combines shadows and tonal elevation (in dark theme)
/// to create proper Material Design 3 elevation.
class ElevatedSurface extends StatelessWidget {
  /// The child widget to elevate.
  final Widget child;

  /// The elevation level (0-5 recommended, can use decimal values).
  final double elevation;

  /// The surface color. If null, uses the theme's surface color.
  final Color? color;

  /// The border radius of the elevated surface.
  final BorderRadius? borderRadius;

  /// The shape of the elevated surface.
  final BoxShape shape;

  /// Custom shadow color. If null, uses default shadows.
  final Color? shadowColor;

  /// Padding inside the elevated surface.
  final EdgeInsetsGeometry? padding;

  /// Margin around the elevated surface.
  final EdgeInsetsGeometry? margin;

  /// Whether to apply tonal elevation in dark theme.
  final bool applyTonalElevation;

  const ElevatedSurface({
    super.key,
    required this.child,
    this.elevation = MaterialElevation.level1,
    this.color,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.shadowColor,
    this.padding,
    this.margin,
    this.applyTonalElevation = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;
    
    // Get the base color
    final baseColor = color ?? theme.colorScheme.surface;
    
    // Apply tonal elevation in dark theme if enabled
    final surfaceColor = (isDarkTheme && applyTonalElevation)
        ? ElevationOverlay.applyOverlay(context, baseColor, elevation)
        : baseColor;

    // Get shadows for the elevation level
    final level = ElevationOverlay._elevationToLevel(elevation);
    final shadows = shadowColor != null
        ? MaterialShadows.withColor(level, shadowColor!)
        : MaterialShadows.getShadows(level);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
        shape: shape,
        boxShadow: shadows,
      ),
      padding: padding,
      child: child,
    );
  }
}