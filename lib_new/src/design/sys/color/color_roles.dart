/// Color roles based on Material Design 3 specification.
///
/// Reference: https://m3.material.io/styles/color/roles
library;

import 'dart:ui';

/// Defines the color roles used throughout the Material 3 design system.
abstract class M3ColorRoles {
  /// Primary color role - the most prominent color in the UI.
  /// Used for key components like primary buttons and active states.
  static const String primary = 'primary';
  
  /// Color used for text and icons displayed on top of the primary color.
  static const String onPrimary = 'onPrimary';
  
  /// Container color for the primary role.
  /// Less prominent than primary, used for containers and backgrounds.
  static const String primaryContainer = 'primaryContainer';
  
  /// Color used for text and icons on primary container.
  static const String onPrimaryContainer = 'onPrimaryContainer';
  
  /// Secondary color role - less prominent than primary.
  /// Used for secondary actions and less important UI elements.
  static const String secondary = 'secondary';
  
  /// Color used for text and icons displayed on top of the secondary color.
  static const String onSecondary = 'onSecondary';
  
  /// Container color for the secondary role.
  static const String secondaryContainer = 'secondaryContainer';
  
  /// Color used for text and icons on secondary container.
  static const String onSecondaryContainer = 'onSecondaryContainer';
  
  /// Tertiary color role - used for contrasting accents.
  /// Balances primary and secondary colors or brings heightened attention to an element.
  static const String tertiary = 'tertiary';
  
  /// Color used for text and icons displayed on top of the tertiary color.
  static const String onTertiary = 'onTertiary';
  
  /// Container color for the tertiary role.
  static const String tertiaryContainer = 'tertiaryContainer';
  
  /// Color used for text and icons on tertiary container.
  static const String onTertiaryContainer = 'onTertiaryContainer';
  
  /// Error color role - used for error states and destructive actions.
  static const String error = 'error';
  
  /// Color used for text and icons displayed on top of the error color.
  static const String onError = 'onError';
  
  /// Container color for the error role.
  static const String errorContainer = 'errorContainer';
  
  /// Color used for text and icons on error container.
  static const String onErrorContainer = 'onErrorContainer';
  
  /// Surface color - the main background color.
  static const String surface = 'surface';
  
  /// Color used for text and icons displayed on top of the surface color.
  static const String onSurface = 'onSurface';
  
  /// Surface variant color - lower emphasis than surface.
  static const String surfaceVariant = 'surfaceVariant';
  
  /// Color used for text and icons on surface variant.
  static const String onSurfaceVariant = 'onSurfaceVariant';
  
  /// Outline color - used for borders and dividers.
  static const String outline = 'outline';
  
  /// Outline variant color - lower emphasis than outline.
  static const String outlineVariant = 'outlineVariant';
  
  /// Inverse surface color - for high contrast themes.
  static const String inverseSurface = 'inverseSurface';
  
  /// Color used for text and icons on inverse surface.
  static const String onInverseSurface = 'onInverseSurface';
  
  /// Inverse primary color - for high contrast accents.
  static const String inversePrimary = 'inversePrimary';
  
  /// Shadow color - used for drop shadows.
  static const String shadow = 'shadow';
  
  /// Scrim color - used for modal scrims.
  static const String scrim = 'scrim';
  
  /// Surface tint color - used for elevation tinting.
  static const String surfaceTint = 'surfaceTint';
}

/// Represents a complete set of color roles for a theme.
class M3ColorRoleSet {
  const M3ColorRoleSet({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.shadow,
    required this.scrim,
    required this.surfaceTint,
  });

  /// Primary color role
  final Color primary;
  
  /// Color used for text and icons displayed on top of the primary color
  final Color onPrimary;
  
  /// Container color for the primary role
  final Color primaryContainer;
  
  /// Color used for text and icons on primary container
  final Color onPrimaryContainer;
  
  /// Secondary color role
  final Color secondary;
  
  /// Color used for text and icons displayed on top of the secondary color
  final Color onSecondary;
  
  /// Container color for the secondary role
  final Color secondaryContainer;
  
  /// Color used for text and icons on secondary container
  final Color onSecondaryContainer;
  
  /// Tertiary color role
  final Color tertiary;
  
  /// Color used for text and icons displayed on top of the tertiary color
  final Color onTertiary;
  
  /// Container color for the tertiary role
  final Color tertiaryContainer;
  
  /// Color used for text and icons on tertiary container
  final Color onTertiaryContainer;
  
  /// Error color role
  final Color error;
  
  /// Color used for text and icons displayed on top of the error color
  final Color onError;
  
  /// Container color for the error role
  final Color errorContainer;
  
  /// Color used for text and icons on error container
  final Color onErrorContainer;
  
  /// Surface color
  final Color surface;
  
  /// Color used for text and icons displayed on top of the surface color
  final Color onSurface;
  
  /// Surface variant color
  final Color surfaceVariant;
  
  /// Color used for text and icons on surface variant
  final Color onSurfaceVariant;
  
  /// Outline color
  final Color outline;
  
  /// Outline variant color
  final Color outlineVariant;
  
  /// Inverse surface color
  final Color inverseSurface;
  
  /// Color used for text and icons on inverse surface
  final Color onInverseSurface;
  
  /// Inverse primary color
  final Color inversePrimary;
  
  /// Shadow color
  final Color shadow;
  
  /// Scrim color
  final Color scrim;
  
  /// Surface tint color
  final Color surfaceTint;
  
  /// Creates a copy of this color role set with the given fields replaced.
  M3ColorRoleSet copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
  }) {
    return M3ColorRoleSet(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      onInverseSurface: onInverseSurface ?? this.onInverseSurface,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      surfaceTint: surfaceTint ?? this.surfaceTint,
    );
  }
}