import 'package:flutter/material.dart';

import '../../../md/ref/palette/ref_palette.dart';
import '../../../md/ref/palette/tonal_palette.dart';

// TODO(Kevin): Verified
/// Material Design 3 Color Scheme with semantic color roles.
///
/// This class provides all the color roles defined in the M3 specification,
/// properly mapped to their tonal values for both light and dark themes.
///
/// See: https://m3.material.io/styles/color/roles
@immutable
class SysColorScheme {
  // Surface colors
  final Color surface;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color surfaceVariant;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color surfaceTint;

  // Primary colors
  final Color primary;
  final Color primaryContainer;
  final Color onPrimary;
  final Color onPrimaryContainer;
  final Color inversePrimary;

  // Secondary colors
  final Color secondary;
  final Color secondaryContainer;
  final Color onSecondary;
  final Color onSecondaryContainer;

  // Tertiary colors
  final Color tertiary;
  final Color tertiaryContainer;
  final Color onTertiary;
  final Color onTertiaryContainer;

  // Error colors
  final Color error;
  final Color errorContainer;
  final Color onError;
  final Color onErrorContainer;

  // Neutral colors
  final Color outline;
  final Color outlineVariant;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color scrim;
  final Color shadow;

  const SysColorScheme({
    required this.surface,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.surfaceVariant,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.surfaceTint,
    required this.primary,
    required this.primaryContainer,
    required this.onPrimary,
    required this.onPrimaryContainer,
    required this.inversePrimary,
    required this.secondary,
    required this.secondaryContainer,
    required this.onSecondary,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.tertiaryContainer,
    required this.onTertiary,
    required this.onTertiaryContainer,
    required this.error,
    required this.errorContainer,
    required this.onError,
    required this.onErrorContainer,
    required this.outline,
    required this.outlineVariant,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.scrim,
    required this.shadow,
  });

  /// Creates a light color scheme from tonal palettes
  factory SysColorScheme.light({
    TonalPalette? primary,
    TonalPalette? secondary,
    TonalPalette? tertiary,
    TonalPalette? error,
    TonalPalette? neutral,
    TonalPalette? neutralVariant,
  }) {
    primary ??= RefPalette.primary;
    secondary ??= RefPalette.secondary;
    tertiary ??= RefPalette.tertiary;
    error ??= RefPalette.error;
    neutral ??= RefPalette.neutral;
    neutralVariant ??= RefPalette.neutralVariant;

    return SysColorScheme(
      // Surface colors - Light theme
      surface: neutral[98]!,
      surfaceDim: neutral[87]!,
      surfaceBright: neutral[98]!,
      surfaceContainerLowest: neutral[100]!,
      surfaceContainerLow: neutral[96]!,
      surfaceContainer: neutral[94]!,
      surfaceContainerHigh: neutral[92]!,
      surfaceContainerHighest: neutral[90]!,
      surfaceVariant: neutralVariant[90]!,
      onSurface: neutral[10]!,
      onSurfaceVariant: neutralVariant[30]!,

      // Primary colors - Light theme
      primary: primary[40]!,
      primaryContainer: primary[90]!,
      onPrimary: primary[100]!,
      onPrimaryContainer: primary[10]!,
      inversePrimary: primary[80]!,

      // Secondary colors - Light theme
      secondary: secondary[40]!,
      secondaryContainer: secondary[90]!,
      onSecondary: secondary[100]!,
      onSecondaryContainer: secondary[10]!,

      // Tertiary colors - Light theme
      tertiary: tertiary[40]!,
      tertiaryContainer: tertiary[90]!,
      onTertiary: tertiary[100]!,
      onTertiaryContainer: tertiary[10]!,

      // Error colors - Light theme
      error: error[40]!,
      errorContainer: error[90]!,
      onError: error[100]!,
      onErrorContainer: error[10]!,

      // Neutral colors - Light theme
      outline: neutralVariant[50]!,
      outlineVariant: neutralVariant[80]!,
      inverseSurface: neutral[20]!,
      inverseOnSurface: neutral[95]!,
      scrim: neutral[0]!,
      shadow: neutral[0]!,
      surfaceTint: primary[40]!,
    );
  }

  /// Creates a dark color scheme from tonal palettes
  factory SysColorScheme.dark({
    TonalPalette? primary,
    TonalPalette? secondary,
    TonalPalette? tertiary,
    TonalPalette? error,
    TonalPalette? neutral,
    TonalPalette? neutralVariant,
  }) {
    primary ??= RefPalette.primary;
    secondary ??= RefPalette.secondary;
    tertiary ??= RefPalette.tertiary;
    error ??= RefPalette.error;
    neutral ??= RefPalette.neutral;
    neutralVariant ??= RefPalette.neutralVariant;

    return SysColorScheme(
      // Surface colors - Dark theme
      surface: neutral[6]!,
      surfaceDim: neutral[6]!,
      surfaceBright: neutral[24]!,
      surfaceContainerLowest: neutral[4]!,
      surfaceContainerLow: neutral[10]!,
      surfaceContainer: neutral[12]!,
      surfaceContainerHigh: neutral[17]!,
      surfaceContainerHighest: neutral[22]!,
      surfaceVariant: neutralVariant[30]!,
      onSurface: neutral[90]!,
      onSurfaceVariant: neutralVariant[80]!,

      // Primary colors - Dark theme
      primary: primary[80]!,
      primaryContainer: primary[30]!,
      onPrimary: primary[20]!,
      onPrimaryContainer: primary[90]!,
      inversePrimary: primary[40]!,

      // Secondary colors - Dark theme
      secondary: secondary[80]!,
      secondaryContainer: secondary[30]!,
      onSecondary: secondary[20]!,
      onSecondaryContainer: secondary[90]!,

      // Tertiary colors - Dark theme
      tertiary: tertiary[80]!,
      tertiaryContainer: tertiary[30]!,
      onTertiary: tertiary[20]!,
      onTertiaryContainer: tertiary[90]!,

      // Error colors - Dark theme
      error: error[80]!,
      errorContainer: error[30]!,
      onError: error[20]!,
      onErrorContainer: error[90]!,

      // Neutral colors - Dark theme
      outline: neutralVariant[60]!,
      outlineVariant: neutralVariant[30]!,
      inverseSurface: neutral[90]!,
      inverseOnSurface: neutral[20]!,
      scrim: neutral[0]!,
      shadow: neutral[0]!,
      surfaceTint: primary[80]!,
    );
  }

  /// Converts to Flutter's standard ColorScheme
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: _isLight ? Brightness.light : Brightness.dark,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      outline: outline,
      outlineVariant: outlineVariant, // Deprecated but required
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
      shadow: shadow,
      scrim: scrim,
    );
  }

  /// Helper to determine if this is a light scheme
  bool get _isLight => surface.computeLuminance() > 0.5;
}
