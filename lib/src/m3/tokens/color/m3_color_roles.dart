import 'package:flutter/material.dart';

/// Defines the complete Material Design 3 color roles.
///
/// These color roles provide semantic meaning and work together to create
/// cohesive, accessible interfaces. Each role has a specific purpose and
/// relationship to other colors in the system.
///
/// Reference: https://m3.material.io/styles/color/roles
@immutable
abstract class M3ColorRoles {
  // --- Primary Colors ---
  
  /// The primary color for the app, typically the brand color.
  static const Color primary = Color(0xFF6750A4);
  
  /// Color used for text and icons displayed on top of the primary color.
  static const Color onPrimary = Color(0xFFFFFFFF);
  
  /// A color used for elements needing less emphasis than primary.
  static const Color primaryContainer = Color(0xFFEADDFF);
  
  /// Color used for text and icons displayed on top of the primary container.
  static const Color onPrimaryContainer = Color(0xFF21005D);
  
  // --- Secondary Colors ---
  
  /// The secondary color provides more ways to accent and distinguish your product.
  static const Color secondary = Color(0xFF625B71);
  
  /// Color used for text and icons displayed on top of the secondary color.
  static const Color onSecondary = Color(0xFFFFFFFF);
  
  /// A color used for elements needing less emphasis than secondary.
  static const Color secondaryContainer = Color(0xFFE8DEF8);
  
  /// Color used for text and icons displayed on top of the secondary container.
  static const Color onSecondaryContainer = Color(0xFF1D192B);
  
  // --- Tertiary Colors ---
  
  /// The tertiary color is used to derive roles for contrasting accents.
  static const Color tertiary = Color(0xFF7D5260);
  
  /// Color used for text and icons displayed on top of the tertiary color.
  static const Color onTertiary = Color(0xFFFFFFFF);
  
  /// A color used for elements needing less emphasis than tertiary.
  static const Color tertiaryContainer = Color(0xFFFFD8E4);
  
  /// Color used for text and icons displayed on top of the tertiary container.
  static const Color onTertiaryContainer = Color(0xFF31111D);
  
  // --- Error Colors ---
  
  /// The error color is used to indicate errors within components.
  static const Color error = Color(0xFFBA1A1A);
  
  /// Color used for text and icons displayed on top of the error color.
  static const Color onError = Color(0xFFFFFFFF);
  
  /// A color used for error elements needing less emphasis than error.
  static const Color errorContainer = Color(0xFFFFDAD6);
  
  /// Color used for text and icons displayed on top of the error container.
  static const Color onErrorContainer = Color(0xFF410002);
  
  // --- Surface Colors ---
  
  /// The background color that appears behind scrollable content.
  static const Color surface = Color(0xFFFFFBFE);
  
  /// Color used for text and icons displayed on top of the surface color.
  static const Color onSurface = Color(0xFF1C1B1F);
  
  /// A variant of surface that can be used for differentiation.
  static const Color surfaceVariant = Color(0xFFE7E0EC);
  
  /// Color used for text and icons displayed on top of surface variant.
  static const Color onSurfaceVariant = Color(0xFF49454F);
  
  // --- Outline Colors ---
  
  /// Subtle color used for boundaries.
  static const Color outline = Color(0xFF79747E);
  
  /// Utility color used for boundaries for decorative elements.
  static const Color outlineVariant = Color(0xFFCAC4D0);
  
  // --- Inverse Colors ---
  
  /// A color that provides sufficient contrast with surface.
  static const Color inverseSurface = Color(0xFF313033);
  
  /// Color used for text and icons displayed on top of inverse surface.
  static const Color onInverseSurface = Color(0xFFF4EFF4);
  
  /// A color that provides sufficient contrast with primary.
  static const Color inversePrimary = Color(0xFFD0BCFF);
  
  // --- Shadow and Scrim ---
  
  /// Color for shadows.
  static const Color shadow = Color(0xFF000000);
  
  /// Color for scrims (overlay that darkens content behind it).
  static const Color scrim = Color(0xFF000000);
  
  /// Color used to tint surfaces at different elevations.
  static const Color surfaceTint = primary;
}

/// Dark theme color roles for Material Design 3.
@immutable
abstract class M3ColorRolesDark {
  // --- Primary Colors ---
  static const Color primary = Color(0xFFD0BCFF);
  static const Color onPrimary = Color(0xFF381E72);
  static const Color primaryContainer = Color(0xFF4F378B);
  static const Color onPrimaryContainer = Color(0xFFEADDFF);
  
  // --- Secondary Colors ---
  static const Color secondary = Color(0xFFCCC2DC);
  static const Color onSecondary = Color(0xFF332D41);
  static const Color secondaryContainer = Color(0xFF4A4458);
  static const Color onSecondaryContainer = Color(0xFFE8DEF8);
  
  // --- Tertiary Colors ---
  static const Color tertiary = Color(0xFFEFB8C8);
  static const Color onTertiary = Color(0xFF492532);
  static const Color tertiaryContainer = Color(0xFF633B48);
  static const Color onTertiaryContainer = Color(0xFFFFD8E4);
  
  // --- Error Colors ---
  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);
  
  // --- Surface Colors ---
  static const Color surface = Color(0xFF1C1B1F);
  static const Color onSurface = Color(0xFFE6E1E5);
  static const Color surfaceVariant = Color(0xFF49454F);
  static const Color onSurfaceVariant = Color(0xFFCAC4D0);
  
  // --- Outline Colors ---
  static const Color outline = Color(0xFF938F99);
  static const Color outlineVariant = Color(0xFF49454F);
  
  // --- Inverse Colors ---
  static const Color inverseSurface = Color(0xFFE6E1E5);
  static const Color onInverseSurface = Color(0xFF313033);
  static const Color inversePrimary = Color(0xFF6750A4);
  
  // --- Shadow and Scrim ---
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);
  static const Color surfaceTint = primary;
}