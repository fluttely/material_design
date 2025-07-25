part of '../design_tokens.dart';

/// Spacing scale used for margins, padding and gaps following Material Design 3.
enum MaterialSpacings {
  none,
  extraSmall,
  small,
  medium,
  large,
  extraLarge;

  double toDouble(SpacingTokens spacings) {
    return switch (this) {
      MaterialSpacings.none => spacings.none,
      MaterialSpacings.extraSmall => spacings.extraSmall,
      MaterialSpacings.small => spacings.small,
      MaterialSpacings.medium => spacings.medium,
      MaterialSpacings.large => spacings.large,
      MaterialSpacings.extraLarge => spacings.extraLarge,
    };
  }
}

/// Common spacing values following Material Design 3 spacing scale (4dp base).
class SpacingTokens extends Equatable {
  const SpacingTokens({
    double? extraSmall,
    double? small,
    double? medium,
    double? large,
    double? extraLarge,
  }) : extraSmall = extraSmall ?? MaterialDimensions.x4,
       small = small ?? MaterialDimensions.x8,
       medium = medium ?? MaterialDimensions.x16,
       large = large ?? MaterialDimensions.x24,
       extraLarge = extraLarge ?? MaterialDimensions.x32;

  factory SpacingTokens.fromMap(Map<String, dynamic> map) {
    double? d(String key) => (map[key] as num?)?.toDouble();

    return SpacingTokens(
      extraSmall: d('extraSmall'),
      small: d('small'),
      medium: d('medium'),
      large: d('large'),
      extraLarge: d('extraLarge'),
    );
  }

  final double extraSmall;
  final double small;
  final double medium;
  final double large;
  final double extraLarge;

  /// Material Design 3 spacing scale
  double get none => MaterialDimensions.zero;

  double custom(double size) => size;

  // Base spacing scale (4dp increments)
  double get space4 => MaterialDimensions.x4;
  double get space8 => MaterialDimensions.x8;
  double get space12 => MaterialDimensions.x12;
  double get space16 => MaterialDimensions.x16;
  double get space20 => MaterialDimensions.x20;
  double get space24 => MaterialDimensions.x24;
  double get space28 => MaterialDimensions.x28;
  double get space32 => MaterialDimensions.x32;
  double get space36 => MaterialDimensions.x36;
  double get space40 => MaterialDimensions.x40;
  double get space44 => MaterialDimensions.x44;
  double get space48 => MaterialDimensions.x48;
  double get space52 => MaterialDimensions.x52;
  double get space56 => MaterialDimensions.x56;
  double get space60 => MaterialDimensions.x60;
  double get space64 => MaterialDimensions.x64;

  // Extended spacing scale (8dp increments for larger spacing)
  double get space72 => MaterialDimensions.x72;
  double get space80 => MaterialDimensions.x80;
  double get space88 => MaterialDimensions.x88;
  double get space96 => MaterialDimensions.x96;
  double get space104 => MaterialDimensions.x104;
  double get space112 => MaterialDimensions.x112;
  double get space120 => MaterialDimensions.x120;
  double get space128 => MaterialDimensions.x128;

  // Large spacing scale (16dp increments)
  double get space144 => MaterialDimensions.x144;
  double get space160 => MaterialDimensions.x160;
  double get space176 => MaterialDimensions.x176;
  double get space192 => MaterialDimensions.x192;
  double get space208 => MaterialDimensions.x208;
  double get space224 => MaterialDimensions.x224;
  double get space240 => MaterialDimensions.x240;
  double get space256 => MaterialDimensions.x256;

  // Extra large spacing for special cases
  double get space320 => MaterialDimensions.x320;
  double get space384 => MaterialDimensions.x384;
  double get space448 => MaterialDimensions.x448;
  double get space512 => MaterialDimensions.x512;

  @override
  List<Object?> get props => [
    none,
    extraSmall,
    small,
    medium,
    large,
    extraLarge,
  ];

  @override
  String toString() =>
      '''
SpacingTokens(
  none: $none,
  extraSmall: $extraSmall,
  small: $small,
  medium: $medium,
  large: $large,
  extraLarge: $extraLarge,
)
''';
}
