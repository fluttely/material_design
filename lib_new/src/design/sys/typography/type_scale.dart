/// Typography scale based on Material Design 3 specification.
///
/// Reference: https://m3.material.io/styles/typography/type-scale
library;

import 'dart:ui';

/// The Material 3 type scale provides a range of contrasting styles that
/// support the needs of your product and its content.
abstract class M3TypeScale {
  /// Display styles are reserved for short, important text or numerals.
  static const M3TypeScaleToken displayLarge = M3TypeScaleToken._(
    fontSize: 57,
    lineHeight: 64,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w400,
  );

  static const M3TypeScaleToken displayMedium = M3TypeScaleToken._(
    fontSize: 45,
    lineHeight: 52,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const M3TypeScaleToken displaySmall = M3TypeScaleToken._(
    fontSize: 36,
    lineHeight: 44,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Headline styles are best-suited for short, high-emphasis text on smaller screens.
  static const M3TypeScaleToken headlineLarge = M3TypeScaleToken._(
    fontSize: 32,
    lineHeight: 40,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const M3TypeScaleToken headlineMedium = M3TypeScaleToken._(
    fontSize: 28,
    lineHeight: 36,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const M3TypeScaleToken headlineSmall = M3TypeScaleToken._(
    fontSize: 24,
    lineHeight: 32,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  /// Title styles are smaller than headline styles and should be used for
  /// medium-emphasis text that remains relatively short.
  static const M3TypeScaleToken titleLarge = M3TypeScaleToken._(
    fontSize: 22,
    lineHeight: 28,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const M3TypeScaleToken titleMedium = M3TypeScaleToken._(
    fontSize: 16,
    lineHeight: 24,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w500,
  );

  static const M3TypeScaleToken titleSmall = M3TypeScaleToken._(
    fontSize: 14,
    lineHeight: 20,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the content body.
  static const M3TypeScaleToken labelLarge = M3TypeScaleToken._(
    fontSize: 14,
    lineHeight: 20,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  static const M3TypeScaleToken labelMedium = M3TypeScaleToken._(
    fontSize: 12,
    lineHeight: 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  static const M3TypeScaleToken labelSmall = M3TypeScaleToken._(
    fontSize: 11,
    lineHeight: 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  /// Body styles are used for longer-form writing as it works well for
  /// small text sizes. For longer sections of text, a serif or sans serif
  /// typeface is recommended.
  static const M3TypeScaleToken bodyLarge = M3TypeScaleToken._(
    fontSize: 16,
    lineHeight: 24,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
  );

  static const M3TypeScaleToken bodyMedium = M3TypeScaleToken._(
    fontSize: 14,
    lineHeight: 20,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
  );

  static const M3TypeScaleToken bodySmall = M3TypeScaleToken._(
    fontSize: 12,
    lineHeight: 16,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w400,
  );
}

/// Represents a single token in the Material 3 type scale.
class M3TypeScaleToken {
  const M3TypeScaleToken._({
    required this.fontSize,
    required this.lineHeight,
    required this.letterSpacing,
    required this.fontWeight,
  });

  /// The font size in logical pixels.
  final double fontSize;

  /// The line height in logical pixels.
  final double lineHeight;

  /// The letter spacing in logical pixels.
  final double letterSpacing;

  /// The font weight.
  final FontWeight fontWeight;

  /// Returns the height multiplier (line height / font size).
  double get height => lineHeight / fontSize;

  @override
  String toString() {
    return 'M3TypeScaleToken('
        'fontSize: $fontSize, '
        'lineHeight: $lineHeight, '
        'letterSpacing: $letterSpacing, '
        'fontWeight: $fontWeight'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is M3TypeScaleToken &&
        other.fontSize == fontSize &&
        other.lineHeight == lineHeight &&
        other.letterSpacing == letterSpacing &&
        other.fontWeight == fontWeight;
  }

  @override
  int get hashCode {
    return Object.hash(fontSize, lineHeight, letterSpacing, fontWeight);
  }
}

/// Font family recommendations for Material 3 typography.
abstract class M3TypeFamilies {
  /// Google Sans is the default font family for Material 3.
  static const String googleSans = 'Google Sans';

  /// Roboto is the fallback font family.
  static const String roboto = 'Roboto';

  /// Noto Sans is recommended for international support.
  static const String notoSans = 'Noto Sans';

  /// Default font stack for Material 3.
  static const List<String> defaultFontStack = [
    googleSans,
    roboto,
    notoSans,
    'Arial',
    'sans-serif',
  ];
}