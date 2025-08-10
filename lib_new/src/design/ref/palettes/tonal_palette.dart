/// Tonal palettes based on Material Design 3 specification.
///
/// Reference: https://m3.material.io/styles/color/the-color-system/color-roles
library;

import 'dart:ui';
import '../tokens/color_tokens.dart';

/// A tonal palette consists of 13 tones, including white and black.
/// 
/// Tonal palettes are used to create color schemes that provide
/// accessible and harmonious color combinations.
class M3TonalPalette {
  const M3TonalPalette({
    required this.tone0,
    required this.tone10,
    required this.tone20,
    required this.tone25,
    required this.tone30,
    required this.tone35,
    required this.tone40,
    required this.tone50,
    required this.tone60,
    required this.tone70,
    required this.tone80,
    required this.tone90,
    required this.tone95,
    required this.tone99,
    required this.tone100,
  });

  /// Tone 0 - Black.
  final Color tone0;

  /// Tone 10 - Very dark.
  final Color tone10;

  /// Tone 20 - Dark.
  final Color tone20;

  /// Tone 25 - Medium dark.
  final Color tone25;

  /// Tone 30 - Medium dark.
  final Color tone30;

  /// Tone 35 - Medium.
  final Color tone35;

  /// Tone 40 - Medium.
  final Color tone40;

  /// Tone 50 - Medium.
  final Color tone50;

  /// Tone 60 - Medium light.
  final Color tone60;

  /// Tone 70 - Light.
  final Color tone70;

  /// Tone 80 - Light.
  final Color tone80;

  /// Tone 90 - Very light.
  final Color tone90;

  /// Tone 95 - Very light.
  final Color tone95;

  /// Tone 99 - Nearly white.
  final Color tone99;

  /// Tone 100 - White.
  final Color tone100;

  /// Gets a color by its tone value.
  Color getTone(int tone) {
    switch (tone) {
      case 0:
        return tone0;
      case 10:
        return tone10;
      case 20:
        return tone20;
      case 25:
        return tone25;
      case 30:
        return tone30;
      case 35:
        return tone35;
      case 40:
        return tone40;
      case 50:
        return tone50;
      case 60:
        return tone60;
      case 70:
        return tone70;
      case 80:
        return tone80;
      case 90:
        return tone90;
      case 95:
        return tone95;
      case 99:
        return tone99;
      case 100:
        return tone100;
      default:
        throw ArgumentError('Invalid tone: $tone');
    }
  }

  /// Creates a copy of this tonal palette with the given fields replaced.
  M3TonalPalette copyWith({
    Color? tone0,
    Color? tone10,
    Color? tone20,
    Color? tone25,
    Color? tone30,
    Color? tone35,
    Color? tone40,
    Color? tone50,
    Color? tone60,
    Color? tone70,
    Color? tone80,
    Color? tone90,
    Color? tone95,
    Color? tone99,
    Color? tone100,
  }) {
    return M3TonalPalette(
      tone0: tone0 ?? this.tone0,
      tone10: tone10 ?? this.tone10,
      tone20: tone20 ?? this.tone20,
      tone25: tone25 ?? this.tone25,
      tone30: tone30 ?? this.tone30,
      tone35: tone35 ?? this.tone35,
      tone40: tone40 ?? this.tone40,
      tone50: tone50 ?? this.tone50,
      tone60: tone60 ?? this.tone60,
      tone70: tone70 ?? this.tone70,
      tone80: tone80 ?? this.tone80,
      tone90: tone90 ?? this.tone90,
      tone95: tone95 ?? this.tone95,
      tone99: tone99 ?? this.tone99,
      tone100: tone100 ?? this.tone100,
    );
  }

  @override
  String toString() {
    return 'M3TonalPalette('
        'tone0: $tone0, '
        'tone10: $tone10, '
        'tone20: $tone20, '
        'tone25: $tone25, '
        'tone30: $tone30, '
        'tone35: $tone35, '
        'tone40: $tone40, '
        'tone50: $tone50, '
        'tone60: $tone60, '
        'tone70: $tone70, '
        'tone80: $tone80, '
        'tone90: $tone90, '
        'tone95: $tone95, '
        'tone99: $tone99, '
        'tone100: $tone100'
        ')';
  }
}

/// Predefined tonal palettes for the Material 3 color system.
abstract class M3TonalPalettes {
  /// Primary tonal palette.
  static const M3TonalPalette primary = M3TonalPalette(
    tone0: M3ColorTokens.primary0,
    tone10: M3ColorTokens.primary10,
    tone20: M3ColorTokens.primary20,
    tone25: M3ColorTokens.primary25,
    tone30: M3ColorTokens.primary30,
    tone35: M3ColorTokens.primary35,
    tone40: M3ColorTokens.primary40,
    tone50: M3ColorTokens.primary50,
    tone60: M3ColorTokens.primary60,
    tone70: M3ColorTokens.primary70,
    tone80: M3ColorTokens.primary80,
    tone90: M3ColorTokens.primary90,
    tone95: M3ColorTokens.primary95,
    tone99: M3ColorTokens.primary99,
    tone100: M3ColorTokens.primary100,
  );

  /// Secondary tonal palette.
  static const M3TonalPalette secondary = M3TonalPalette(
    tone0: M3ColorTokens.secondary0,
    tone10: M3ColorTokens.secondary10,
    tone20: M3ColorTokens.secondary20,
    tone25: M3ColorTokens.secondary25,
    tone30: M3ColorTokens.secondary30,
    tone35: M3ColorTokens.secondary35,
    tone40: M3ColorTokens.secondary40,
    tone50: M3ColorTokens.secondary50,
    tone60: M3ColorTokens.secondary60,
    tone70: M3ColorTokens.secondary70,
    tone80: M3ColorTokens.secondary80,
    tone90: M3ColorTokens.secondary90,
    tone95: M3ColorTokens.secondary95,
    tone99: M3ColorTokens.secondary99,
    tone100: M3ColorTokens.secondary100,
  );

  /// Tertiary tonal palette.
  static const M3TonalPalette tertiary = M3TonalPalette(
    tone0: M3ColorTokens.tertiary0,
    tone10: M3ColorTokens.tertiary10,
    tone20: M3ColorTokens.tertiary20,
    tone25: M3ColorTokens.tertiary25,
    tone30: M3ColorTokens.tertiary30,
    tone35: M3ColorTokens.tertiary35,
    tone40: M3ColorTokens.tertiary40,
    tone50: M3ColorTokens.tertiary50,
    tone60: M3ColorTokens.tertiary60,
    tone70: M3ColorTokens.tertiary70,
    tone80: M3ColorTokens.tertiary80,
    tone90: M3ColorTokens.tertiary90,
    tone95: M3ColorTokens.tertiary95,
    tone99: M3ColorTokens.tertiary99,
    tone100: M3ColorTokens.tertiary100,
  );

  /// Error tonal palette.
  static const M3TonalPalette error = M3TonalPalette(
    tone0: M3ColorTokens.error0,
    tone10: M3ColorTokens.error10,
    tone20: M3ColorTokens.error20,
    tone25: M3ColorTokens.error25,
    tone30: M3ColorTokens.error30,
    tone35: M3ColorTokens.error35,
    tone40: M3ColorTokens.error40,
    tone50: M3ColorTokens.error50,
    tone60: M3ColorTokens.error60,
    tone70: M3ColorTokens.error70,
    tone80: M3ColorTokens.error80,
    tone90: M3ColorTokens.error90,
    tone95: M3ColorTokens.error95,
    tone99: M3ColorTokens.error99,
    tone100: M3ColorTokens.error100,
  );

  /// Neutral tonal palette.
  static const M3TonalPalette neutral = M3TonalPalette(
    tone0: M3ColorTokens.neutral0,
    tone10: M3ColorTokens.neutral10,
    tone20: M3ColorTokens.neutral20,
    tone25: M3ColorTokens.neutral25,
    tone30: M3ColorTokens.neutral30,
    tone35: M3ColorTokens.neutral35,
    tone40: M3ColorTokens.neutral40,
    tone50: M3ColorTokens.neutral50,
    tone60: M3ColorTokens.neutral60,
    tone70: M3ColorTokens.neutral70,
    tone80: M3ColorTokens.neutral80,
    tone90: M3ColorTokens.neutral90,
    tone95: M3ColorTokens.neutral95,
    tone99: M3ColorTokens.neutral99,
    tone100: M3ColorTokens.neutral100,
  );

  /// Neutral variant tonal palette.
  static const M3TonalPalette neutralVariant = M3TonalPalette(
    tone0: M3ColorTokens.neutralVariant0,
    tone10: M3ColorTokens.neutralVariant10,
    tone20: M3ColorTokens.neutralVariant20,
    tone25: M3ColorTokens.neutralVariant25,
    tone30: M3ColorTokens.neutralVariant30,
    tone35: M3ColorTokens.neutralVariant35,
    tone40: M3ColorTokens.neutralVariant40,
    tone50: M3ColorTokens.neutralVariant50,
    tone60: M3ColorTokens.neutralVariant60,
    tone70: M3ColorTokens.neutralVariant70,
    tone80: M3ColorTokens.neutralVariant80,
    tone90: M3ColorTokens.neutralVariant90,
    tone95: M3ColorTokens.neutralVariant95,
    tone99: M3ColorTokens.neutralVariant99,
    tone100: M3ColorTokens.neutralVariant100,
  );
}