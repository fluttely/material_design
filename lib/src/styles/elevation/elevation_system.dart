/// Material Design 3 elevation system with design tokens.
///
/// This file implements the Material Design 3 elevation specifications
/// using the design token hierarchy system for maintainable and scalable
/// elevation management.
///
/// Token Hierarchy:
/// - Reference tokens: Raw elevation values and shadow specifications
/// - System tokens: Semantic elevation levels for the design system
/// - Component tokens: Component-specific elevation values
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/styles/elevation
library;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

// ============================================================================
// REFERENCE TOKENS - Raw elevation and shadow values
// ============================================================================

/// Reference tokens for elevation dp values.
class ElevationReferenceTokens {
  ElevationReferenceTokens._();

  static const dp0 = ReferenceToken<double>(
    0,
    'elevation.dp0',
    description: 'No elevation',
  );

  static const dp1 = ReferenceToken<double>(
    1,
    'elevation.dp1',
    description: '1dp elevation',
  );

  static const dp3 = ReferenceToken<double>(
    3,
    'elevation.dp3',
    description: '3dp elevation',
  );

  static const dp6 = ReferenceToken<double>(
    6,
    'elevation.dp6',
    description: '6dp elevation',
  );

  static const dp8 = ReferenceToken<double>(
    8,
    'elevation.dp8',
    description: '8dp elevation',
  );

  static const dp12 = ReferenceToken<double>(
    12,
    'elevation.dp12',
    description: '12dp elevation',
  );
}

/// Reference tokens for shadow opacity values.
class ShadowOpacityReferenceTokens {
  ShadowOpacityReferenceTokens._();

  static const umbra = ReferenceToken<double>(
    0.30,
    'shadow.opacity.umbra',
    description: 'Umbra (key) shadow opacity - 30%',
  );

  static const penumbra = ReferenceToken<double>(
    0.15,
    'shadow.opacity.penumbra',
    description: 'Penumbra (ambient) shadow opacity - 15%',
  );
}

/// Reference tokens for tonal overlay opacity values.
class TonalOpacityReferenceTokens {
  TonalOpacityReferenceTokens._();

  static const opacity0 = ReferenceToken<double>(
    0,
    'tonal.opacity.0',
    description: 'No tonal overlay',
  );

  static const opacity5 = ReferenceToken<double>(
    0.05,
    'tonal.opacity.5',
    description: '5% tonal overlay',
  );

  static const opacity8 = ReferenceToken<double>(
    0.08,
    'tonal.opacity.8',
    description: '8% tonal overlay',
  );

  static const opacity11 = ReferenceToken<double>(
    0.11,
    'tonal.opacity.11',
    description: '11% tonal overlay',
  );

  static const opacity12 = ReferenceToken<double>(
    0.12,
    'tonal.opacity.12',
    description: '12% tonal overlay',
  );

  static const opacity14 = ReferenceToken<double>(
    0.14,
    'tonal.opacity.14',
    description: '14% tonal overlay',
  );
}

// ============================================================================
// SYSTEM TOKENS - Semantic elevation levels
// ============================================================================

/// System tokens for Material Design 3 elevation levels.
class ElevationSystemTokens {
  ElevationSystemTokens._();

  static final level0 = SystemToken<double>.fromReference(
    ElevationReferenceTokens.dp0,
    systemName: 'elevation.level0',
    description: 'Level 0: Flat surfaces',
  );

  static final level1 = SystemToken<double>.fromReference(
    ElevationReferenceTokens.dp1,
    systemName: 'elevation.level1',
    description: 'Level 1: Low elevation for cards and buttons',
  );

  static final level2 = SystemToken<double>.fromReference(
    ElevationReferenceTokens.dp3,
    systemName: 'elevation.level2',
    description: 'Level 2: Medium-low elevation for hover states',
  );

  static final level3 = SystemToken<double>.fromReference(
    ElevationReferenceTokens.dp6,
    systemName: 'elevation.level3',
    description: 'Level 3: Medium elevation for FABs',
  );

  static final level4 = SystemToken<double>.fromReference(
    ElevationReferenceTokens.dp8,
    systemName: 'elevation.level4',
    description: 'Level 4: Medium-high elevation for dialogs',
  );

  static final level5 = SystemToken<double>.fromReference(
    ElevationReferenceTokens.dp12,
    systemName: 'elevation.level5',
    description: 'Level 5: High elevation for menus and tooltips',
  );
}

/// System tokens for tonal elevation overlays.
class TonalElevationSystemTokens {
  TonalElevationSystemTokens._();

  static final level0 = SystemToken<double>.fromReference(
    TonalOpacityReferenceTokens.opacity0,
    systemName: 'tonal.elevation.level0',
    description: 'No tonal overlay',
  );

  static final level1 = SystemToken<double>.fromReference(
    TonalOpacityReferenceTokens.opacity5,
    systemName: 'tonal.elevation.level1',
    description: '5% primary overlay for level 1',
  );

  static final level2 = SystemToken<double>.fromReference(
    TonalOpacityReferenceTokens.opacity8,
    systemName: 'tonal.elevation.level2',
    description: '8% primary overlay for level 2',
  );

  static final level3 = SystemToken<double>.fromReference(
    TonalOpacityReferenceTokens.opacity11,
    systemName: 'tonal.elevation.level3',
    description: '11% primary overlay for level 3',
  );

  static final level4 = SystemToken<double>.fromReference(
    TonalOpacityReferenceTokens.opacity12,
    systemName: 'tonal.elevation.level4',
    description: '12% primary overlay for level 4',
  );

  static final level5 = SystemToken<double>.fromReference(
    TonalOpacityReferenceTokens.opacity14,
    systemName: 'tonal.elevation.level5',
    description: '14% primary overlay for level 5',
  );
}

/// System tokens for shadow specifications.
class ShadowSystemTokens {
  ShadowSystemTokens._();

  static const elevation0 = SystemToken<List<BoxShadow>>(
    [],
    'shadow.elevation0',
    description: 'No shadow',
  );

  static final elevation1 = SystemToken<List<BoxShadow>>(
    [
      BoxShadow(
        offset: const Offset(0, 1),
        blurRadius: 2,
        color:
            Color.fromRGBO(0, 0, 0, ShadowOpacityReferenceTokens.umbra.value),
      ),
      BoxShadow(
        offset: const Offset(0, 1),
        blurRadius: 3,
        spreadRadius: 1,
        color: Color.fromRGBO(
            0, 0, 0, ShadowOpacityReferenceTokens.penumbra.value),
      ),
    ],
    'shadow.elevation1',
    description: 'Level 1 shadow',
  );

  static final elevation2 = SystemToken<List<BoxShadow>>(
    [
      BoxShadow(
        offset: const Offset(0, 1),
        blurRadius: 2,
        color:
            Color.fromRGBO(0, 0, 0, ShadowOpacityReferenceTokens.umbra.value),
      ),
      BoxShadow(
        offset: const Offset(0, 2),
        blurRadius: 6,
        spreadRadius: 2,
        color: Color.fromRGBO(
            0, 0, 0, ShadowOpacityReferenceTokens.penumbra.value),
      ),
    ],
    'shadow.elevation2',
    description: 'Level 2 shadow',
  );

  static final elevation3 = SystemToken<List<BoxShadow>>(
    [
      BoxShadow(
        offset: const Offset(0, 1),
        blurRadius: 3,
        color:
            Color.fromRGBO(0, 0, 0, ShadowOpacityReferenceTokens.umbra.value),
      ),
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 8,
        spreadRadius: 3,
        color: Color.fromRGBO(
            0, 0, 0, ShadowOpacityReferenceTokens.penumbra.value),
      ),
    ],
    'shadow.elevation3',
    description: 'Level 3 shadow',
  );

  static final elevation4 = SystemToken<List<BoxShadow>>(
    [
      BoxShadow(
        offset: const Offset(0, 2),
        blurRadius: 3,
        color:
            Color.fromRGBO(0, 0, 0, ShadowOpacityReferenceTokens.umbra.value),
      ),
      BoxShadow(
        offset: const Offset(0, 6),
        blurRadius: 10,
        spreadRadius: 4,
        color: Color.fromRGBO(
            0, 0, 0, ShadowOpacityReferenceTokens.penumbra.value),
      ),
    ],
    'shadow.elevation4',
    description: 'Level 4 shadow',
  );

  static final elevation5 = SystemToken<List<BoxShadow>>(
    [
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 4,
        color:
            Color.fromRGBO(0, 0, 0, ShadowOpacityReferenceTokens.umbra.value),
      ),
      BoxShadow(
        offset: const Offset(0, 8),
        blurRadius: 12,
        spreadRadius: 6,
        color: Color.fromRGBO(
            0, 0, 0, ShadowOpacityReferenceTokens.penumbra.value),
      ),
    ],
    'shadow.elevation5',
    description: 'Level 5 shadow',
  );
}

// ============================================================================
// COMPONENT TOKENS - Component-specific elevation values
// ============================================================================

/// Component tokens for card elevations.
class CardElevationTokens {
  CardElevationTokens._();

  static final elevated = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level1,
    component: 'Card',
    tokenName: 'elevation',
    variant: 'elevated',
    description: 'Elevated card default elevation',
  );

  static final elevatedHover = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level2,
    component: 'Card',
    tokenName: 'elevation',
    variant: 'elevated',
    state: 'hover',
    description: 'Elevated card hover elevation',
  );

  static final elevatedDragged = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level3,
    component: 'Card',
    tokenName: 'elevation',
    variant: 'elevated',
    state: 'dragged',
    description: 'Elevated card dragged elevation',
  );

  static final filled = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level0,
    component: 'Card',
    tokenName: 'elevation',
    variant: 'filled',
    description: 'Filled card elevation',
  );

  static final outlined = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level0,
    component: 'Card',
    tokenName: 'elevation',
    variant: 'outlined',
    description: 'Outlined card elevation',
  );
}

/// Component tokens for button elevations.
class ButtonElevationTokens {
  ButtonElevationTokens._();

  static final elevated = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level1,
    component: 'Button',
    tokenName: 'elevation',
    variant: 'elevated',
    description: 'Elevated button default elevation',
  );

  static final elevatedHover = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level2,
    component: 'Button',
    tokenName: 'elevation',
    variant: 'elevated',
    state: 'hover',
    description: 'Elevated button hover elevation',
  );

  static final elevatedPressed = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level1,
    component: 'Button',
    tokenName: 'elevation',
    variant: 'elevated',
    state: 'pressed',
    description: 'Elevated button pressed elevation',
  );

  static final elevatedDisabled = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level0,
    component: 'Button',
    tokenName: 'elevation',
    variant: 'elevated',
    state: 'disabled',
    description: 'Elevated button disabled elevation',
  );

  static final filled = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level0,
    component: 'Button',
    tokenName: 'elevation',
    variant: 'filled',
    description: 'Filled button elevation',
  );

  static final filledTonal = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level0,
    component: 'Button',
    tokenName: 'elevation',
    variant: 'filledTonal',
    description: 'Filled tonal button elevation',
  );

  static final outlined = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level0,
    component: 'Button',
    tokenName: 'elevation',
    variant: 'outlined',
    description: 'Outlined button elevation',
  );

  static final text = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level0,
    component: 'Button',
    tokenName: 'elevation',
    variant: 'text',
    description: 'Text button elevation',
  );
}

/// Component tokens for FAB elevations.
class FABElevationTokens {
  FABElevationTokens._();

  static final default_ = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level3,
    component: 'FAB',
    tokenName: 'elevation',
    description: 'FAB default elevation',
  );

  static final hover = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level4,
    component: 'FAB',
    tokenName: 'elevation',
    state: 'hover',
    description: 'FAB hover elevation',
  );

  static final pressed = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level3,
    component: 'FAB',
    tokenName: 'elevation',
    state: 'pressed',
    description: 'FAB pressed elevation',
  );

  static final lowered = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level1,
    component: 'FAB',
    tokenName: 'elevation',
    state: 'lowered',
    description: 'FAB lowered elevation',
  );
}

/// Component tokens for navigation elevations.
class NavigationElevationTokens {
  NavigationElevationTokens._();

  static final topAppBarFlat = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level0,
    component: 'TopAppBar',
    tokenName: 'elevation',
    state: 'flat',
    description: 'Top app bar flat elevation',
  );

  static final topAppBarScrolled = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level2,
    component: 'TopAppBar',
    tokenName: 'elevation',
    state: 'scrolled',
    description: 'Top app bar scrolled elevation',
  );

  static final bottomAppBar = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level3,
    component: 'BottomAppBar',
    tokenName: 'elevation',
    description: 'Bottom app bar elevation',
  );

  static final navigationBar = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level2,
    component: 'NavigationBar',
    tokenName: 'elevation',
    description: 'Navigation bar elevation',
  );

  static final navigationRail = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level0,
    component: 'NavigationRail',
    tokenName: 'elevation',
    description: 'Navigation rail elevation',
  );

  static final navigationDrawerModal = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level1,
    component: 'NavigationDrawer',
    tokenName: 'elevation',
    variant: 'modal',
    description: 'Modal navigation drawer elevation',
  );
}

/// Component tokens for dialog and sheet elevations.
class DialogSheetElevationTokens {
  DialogSheetElevationTokens._();

  static final dialog = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level3,
    component: 'Dialog',
    tokenName: 'elevation',
    description: 'Dialog elevation',
  );

  static final bottomSheetModal = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level1,
    component: 'BottomSheet',
    tokenName: 'elevation',
    variant: 'modal',
    description: 'Modal bottom sheet elevation',
  );

  static final sideSheetModal = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level1,
    component: 'SideSheet',
    tokenName: 'elevation',
    variant: 'modal',
    description: 'Modal side sheet elevation',
  );
}

/// Component tokens for menu and tooltip elevations.
class MenuTooltipElevationTokens {
  MenuTooltipElevationTokens._();

  static final menu = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level2,
    component: 'Menu',
    tokenName: 'elevation',
    description: 'Menu elevation',
  );

  static final tooltip = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level2,
    component: 'Tooltip',
    tokenName: 'elevation',
    description: 'Tooltip elevation',
  );
}

/// Component tokens for other component elevations.
class MiscElevationTokens {
  MiscElevationTokens._();

  static final snackbar = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level3,
    component: 'Snackbar',
    tokenName: 'elevation',
    description: 'Snackbar elevation',
  );

  static final switch_ = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level1,
    component: 'Switch',
    tokenName: 'elevation',
    description: 'Switch elevation',
  );

  static final searchBar = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level2,
    component: 'SearchBar',
    tokenName: 'elevation',
    description: 'Search bar elevation',
  );

  static final searchView = ComponentToken<double>.fromSystem(
    ElevationSystemTokens.level3,
    component: 'SearchView',
    tokenName: 'elevation',
    description: 'Search view elevation',
  );
}

// ============================================================================
// PUBLIC API - Elevation utilities and helpers
// ============================================================================

/// Material Design 3 elevation system.
///
/// Provides access to elevation tokens and utilities for working with
/// elevation in Material Design 3.
class MaterialElevation {
  MaterialElevation._();

  /// Gets the elevation value for a given level (0-5).
  static double getLevel(int level) {
    switch (level) {
      case 0:
        return ElevationSystemTokens.level0.value;
      case 1:
        return ElevationSystemTokens.level1.value;
      case 2:
        return ElevationSystemTokens.level2.value;
      case 3:
        return ElevationSystemTokens.level3.value;
      case 4:
        return ElevationSystemTokens.level4.value;
      case 5:
        return ElevationSystemTokens.level5.value;
      default:
        return ElevationSystemTokens.level0.value;
    }
  }

  /// Gets the box shadows for a given elevation level.
  static List<BoxShadow> getShadows(int level) {
    switch (level) {
      case 0:
        return ShadowSystemTokens.elevation0.value;
      case 1:
        return ShadowSystemTokens.elevation1.value;
      case 2:
        return ShadowSystemTokens.elevation2.value;
      case 3:
        return ShadowSystemTokens.elevation3.value;
      case 4:
        return ShadowSystemTokens.elevation4.value;
      case 5:
        return ShadowSystemTokens.elevation5.value;
      default:
        return ShadowSystemTokens.elevation0.value;
    }
  }

  /// Gets the tonal overlay opacity for a given elevation level.
  static double getTonalOpacity(int level) {
    switch (level) {
      case 0:
        return TonalElevationSystemTokens.level0.value;
      case 1:
        return TonalElevationSystemTokens.level1.value;
      case 2:
        return TonalElevationSystemTokens.level2.value;
      case 3:
        return TonalElevationSystemTokens.level3.value;
      case 4:
        return TonalElevationSystemTokens.level4.value;
      case 5:
        return TonalElevationSystemTokens.level5.value;
      default:
        return TonalElevationSystemTokens.level0.value;
    }
  }

  /// Converts a continuous elevation value to a discrete level (0-5).
  static int elevationToLevel(double elevation) {
    if (elevation <= 0) return 0;
    if (elevation <= 1) return 1;
    if (elevation <= 3) return 2;
    if (elevation <= 6) return 3;
    if (elevation <= 8) return 4;
    return 5;
  }

  /// Applies tonal elevation to a surface color.
  static Color applyTonalElevation(
    Color surfaceColor,
    Color tintColor,
    double elevation,
  ) {
    final level = elevationToLevel(elevation);
    final opacity = getTonalOpacity(level);

    if (opacity == 0.0) return surfaceColor;

    return Color.alphaBlend(
      tintColor.withOpacity(opacity),
      surfaceColor,
    );
  }

  /// Creates custom shadows with a specific color.
  static List<BoxShadow> createShadowsWithColor(int level, Color shadowColor) {
    final baseShadows = getShadows(level);
    if (baseShadows.isEmpty) return baseShadows;

    return baseShadows.map((shadow) {
      final opacity = shadow.color.opacity;
      return BoxShadow(
        offset: shadow.offset,
        blurRadius: shadow.blurRadius,
        spreadRadius: shadow.spreadRadius,
        color: shadowColor.withOpacity(opacity),
      );
    }).toList();
  }

  /// Interpolates between two elevation values.
  static double lerp(double begin, double end, double t) {
    return begin + (end - begin) * t;
  }

  /// Gets elevation for a component state.
  static double getStateElevation({
    required DesignToken<double> idle,
    DesignToken<double>? hover,
    DesignToken<double>? focus,
    DesignToken<double>? pressed,
    DesignToken<double>? dragged,
    DesignToken<double>? disabled,
    bool isHovered = false,
    bool isFocused = false,
    bool isPressed = false,
    bool isDragged = false,
    bool isDisabled = false,
  }) {
    if (isDisabled && disabled != null) return disabled.value;
    if (isDragged && dragged != null) return dragged.value;
    if (isPressed && pressed != null) return pressed.value;
    if (isHovered && hover != null) return hover.value;
    if (isFocused && focus != null) return focus.value;
    return idle.value;
  }
}

/// Elevation overlay utilities for dark themes.
class ElevationOverlay {
  ElevationOverlay._();

  /// Applies elevation overlay to a surface in dark theme.
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

    final primaryColor = theme.colorScheme.primary;
    return MaterialElevation.applyTonalElevation(
      surface,
      primaryColor,
      elevation,
    );
  }

  /// Creates an overlay without context.
  static Color createOverlay(
    Color surface,
    Color primary,
    double elevation, {
    bool isDarkTheme = false,
  }) {
    if (!isDarkTheme || elevation == 0.0) {
      return surface;
    }

    return MaterialElevation.applyTonalElevation(
      surface,
      primary,
      elevation,
    );
  }
}

/// A widget that applies Material Design 3 elevation to its child.
///
/// This widget uses the design token system to apply consistent
/// elevation throughout the application.
class ElevatedSurface extends StatelessWidget {
  const ElevatedSurface({
    required this.child,
    super.key,
    this.elevationToken,
    this.elevation,
    this.color,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.shadowColor,
    this.padding,
    this.margin,
    this.applyTonalElevation = true,
  }) : assert(
          elevationToken != null || elevation != null,
          'Either elevationToken or elevation must be provided',
        );

  /// The child widget to elevate.
  final Widget child;

  /// The elevation token to use.
  final DesignToken<double>? elevationToken;

  /// Direct elevation value (overrides token if provided).
  final double? elevation;

  /// The surface color.
  final Color? color;

  /// The border radius.
  final BorderRadius? borderRadius;

  /// The shape of the surface.
  final BoxShape shape;

  /// Custom shadow color.
  final Color? shadowColor;

  /// Padding inside the surface.
  final EdgeInsetsGeometry? padding;

  /// Margin around the surface.
  final EdgeInsetsGeometry? margin;

  /// Whether to apply tonal elevation in dark theme.
  final bool applyTonalElevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;

    // Resolve elevation value
    final elevationValue = elevation ?? elevationToken!.value;

    // Get the base color
    final baseColor = color ?? theme.colorScheme.surface;

    // Apply tonal elevation in dark theme if enabled
    final surfaceColor = (isDarkTheme && applyTonalElevation)
        ? ElevationOverlay.applyOverlay(context, baseColor, elevationValue)
        : baseColor;

    // Get shadows for the elevation level
    final level = MaterialElevation.elevationToLevel(elevationValue);
    final shadows = shadowColor != null
        ? MaterialElevation.createShadowsWithColor(level, shadowColor!)
        : MaterialElevation.getShadows(level);

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

// /// Extension methods for easy access to elevation tokens.
// extension ElevationContext on BuildContext {
//   /// Gets the card elevation tokens.
//   CardElevationTokens get cardElevation => CardElevationTokens();

//   /// Gets the button elevation tokens.
//   ButtonElevationTokens get buttonElevation => ButtonElevationTokens();

//   /// Gets the FAB elevation tokens.
//   FABElevationTokens get fabElevation => FABElevationTokens();

//   /// Gets the navigation elevation tokens.
//   NavigationElevationTokens get navigationElevation => NavigationElevationTokens();

//   /// Gets the dialog and sheet elevation tokens.
//   DialogSheetElevationTokens get dialogSheetElevation => DialogSheetElevationTokens();

//   /// Gets the menu and tooltip elevation tokens.
//   MenuTooltipElevationTokens get menuTooltipElevation => MenuTooltipElevationTokens();
// }
