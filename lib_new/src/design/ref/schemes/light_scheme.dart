/// Light color scheme based on Material Design 3 specification.
///
/// Reference: https://m3.material.io/styles/color/the-color-system/color-roles
library;

import 'dart:ui';
import '../tokens/color_tokens.dart';
import '../palettes/tonal_palette.dart';

/// Light color scheme following Material 3 specifications.
class M3LightColorScheme {
  const M3LightColorScheme._();

  /// The default light color scheme.
  static const M3LightColorScheme defaultScheme = M3LightColorScheme._();

  /// Primary color in light theme.
  Color get primary => M3TonalPalettes.primary.tone40;

  /// Color used for text and icons on primary.
  Color get onPrimary => M3TonalPalettes.primary.tone100;

  /// Primary container color in light theme.
  Color get primaryContainer => M3TonalPalettes.primary.tone90;

  /// Color used for text and icons on primary container.
  Color get onPrimaryContainer => M3TonalPalettes.primary.tone10;

  /// Secondary color in light theme.
  Color get secondary => M3TonalPalettes.secondary.tone40;

  /// Color used for text and icons on secondary.
  Color get onSecondary => M3TonalPalettes.secondary.tone100;

  /// Secondary container color in light theme.
  Color get secondaryContainer => M3TonalPalettes.secondary.tone90;

  /// Color used for text and icons on secondary container.
  Color get onSecondaryContainer => M3TonalPalettes.secondary.tone10;

  /// Tertiary color in light theme.
  Color get tertiary => M3TonalPalettes.tertiary.tone40;

  /// Color used for text and icons on tertiary.
  Color get onTertiary => M3TonalPalettes.tertiary.tone100;

  /// Tertiary container color in light theme.
  Color get tertiaryContainer => M3TonalPalettes.tertiary.tone90;

  /// Color used for text and icons on tertiary container.
  Color get onTertiaryContainer => M3TonalPalettes.tertiary.tone10;

  /// Error color in light theme.
  Color get error => M3TonalPalettes.error.tone40;

  /// Color used for text and icons on error.
  Color get onError => M3TonalPalettes.error.tone100;

  /// Error container color in light theme.
  Color get errorContainer => M3TonalPalettes.error.tone90;

  /// Color used for text and icons on error container.
  Color get onErrorContainer => M3TonalPalettes.error.tone10;

  /// Surface color in light theme.
  Color get surface => M3TonalPalettes.neutral.tone99;

  /// Color used for text and icons on surface.
  Color get onSurface => M3TonalPalettes.neutral.tone10;

  /// Surface variant color in light theme.
  Color get surfaceVariant => M3TonalPalettes.neutralVariant.tone90;

  /// Color used for text and icons on surface variant.
  Color get onSurfaceVariant => M3TonalPalettes.neutralVariant.tone30;

  /// Surface dim color in light theme.
  Color get surfaceDim => M3SurfaceTokens.surfaceDim;

  /// Surface bright color in light theme.
  Color get surfaceBright => M3SurfaceTokens.surfaceBright;

  /// Surface container lowest color in light theme.
  Color get surfaceContainerLowest => M3SurfaceTokens.surfaceContainerLowest;

  /// Surface container low color in light theme.
  Color get surfaceContainerLow => M3SurfaceTokens.surfaceContainerLow;

  /// Surface container color in light theme.
  Color get surfaceContainer => M3SurfaceTokens.surfaceContainer;

  /// Surface container high color in light theme.
  Color get surfaceContainerHigh => M3SurfaceTokens.surfaceContainerHigh;

  /// Surface container highest color in light theme.
  Color get surfaceContainerHighest => M3SurfaceTokens.surfaceContainerHighest;

  /// Outline color in light theme.
  Color get outline => M3TonalPalettes.neutralVariant.tone50;

  /// Outline variant color in light theme.
  Color get outlineVariant => M3TonalPalettes.neutralVariant.tone80;

  /// Inverse surface color in light theme.
  Color get inverseSurface => M3TonalPalettes.neutral.tone20;

  /// Color used for text and icons on inverse surface.
  Color get onInverseSurface => M3TonalPalettes.neutral.tone95;

  /// Inverse primary color in light theme.
  Color get inversePrimary => M3TonalPalettes.primary.tone80;

  /// Shadow color in light theme.
  Color get shadow => M3TonalPalettes.neutral.tone0;

  /// Scrim color in light theme.
  Color get scrim => M3TonalPalettes.neutral.tone0;

  /// Surface tint color in light theme.
  Color get surfaceTint => primary;

  /// Creates a custom light color scheme from a seed color.
  static M3LightColorScheme fromSeed(Color seedColor) {
    // This would normally generate a full palette from the seed color
    // For now, we return the default scheme
    // TODO: Implement actual color generation algorithm
    return defaultScheme;
  }

  /// Converts this color scheme to a map.
  Map<String, Color> toMap() {
    return {
      'primary': primary,
      'onPrimary': onPrimary,
      'primaryContainer': primaryContainer,
      'onPrimaryContainer': onPrimaryContainer,
      'secondary': secondary,
      'onSecondary': onSecondary,
      'secondaryContainer': secondaryContainer,
      'onSecondaryContainer': onSecondaryContainer,
      'tertiary': tertiary,
      'onTertiary': onTertiary,
      'tertiaryContainer': tertiaryContainer,
      'onTertiaryContainer': onTertiaryContainer,
      'error': error,
      'onError': onError,
      'errorContainer': errorContainer,
      'onErrorContainer': onErrorContainer,
      'surface': surface,
      'onSurface': onSurface,
      'surfaceVariant': surfaceVariant,
      'onSurfaceVariant': onSurfaceVariant,
      'outline': outline,
      'outlineVariant': outlineVariant,
      'inverseSurface': inverseSurface,
      'onInverseSurface': onInverseSurface,
      'inversePrimary': inversePrimary,
      'shadow': shadow,
      'scrim': scrim,
      'surfaceTint': surfaceTint,
    };
  }
}