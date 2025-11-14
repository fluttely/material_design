part of '../design_tokens.dart';

/// Defines radius values and helpers to resolve them.

enum MaterialRadius {
  none,
  extraSmall,
  small,
  semiSmall,
  medium,
  semiLarge,
  large,
  extraLarge,
  superLarge;

  double toDouble(RadiusTokens tokens) {
    return switch (this) {
      MaterialRadius.none => tokens.none,
      MaterialRadius.extraSmall => tokens.extraSmall,
      MaterialRadius.small => tokens.small,
      MaterialRadius.semiSmall => tokens.semiSmall,
      MaterialRadius.medium => tokens.medium,
      MaterialRadius.semiLarge => tokens.semiLarge,
      MaterialRadius.large => tokens.large,
      MaterialRadius.extraLarge => tokens.extraLarge,
      MaterialRadius.superLarge => tokens.superLarge,
    };
  }
}

/// Radius presets used to build shapes and borders.
class RadiusTokens extends Equatable {
  const RadiusTokens({
    double? extraSmall,
    double? small,
    double? semiSmall,
    double? medium,
    double? semiLarge,
    double? large,
    double? extraLarge,
    double? superLarge,
  }) : extraSmall = extraSmall ?? MaterialDimensions.x4,
       small = small ?? MaterialDimensions.x8,
       semiSmall = semiSmall ?? MaterialDimensions.x12,
       medium = medium ?? MaterialDimensions.x16,
       semiLarge = semiLarge ?? MaterialDimensions.x20,
       large = large ?? MaterialDimensions.x24,
       extraLarge = extraLarge ?? MaterialDimensions.x32,
       superLarge = superLarge ?? MaterialDimensions.x48;

  factory RadiusTokens.fromMap(Map<String, dynamic> map) {
    double? parse(String key) => (map[key] as num?)?.toDouble();

    return RadiusTokens(
      extraSmall: parse('extraSmall'),
      small: parse('small'),
      semiSmall: parse('semiSmall'),
      medium: parse('medium'),
      semiLarge: parse('semiLarge'),
      large: parse('large'),
      extraLarge: parse('extraLarge'),
      superLarge: parse('superLarge'),
    );
  }

  final double extraSmall;
  final double small;
  final double semiSmall;
  final double medium;
  final double semiLarge;
  final double large;
  final double extraLarge;
  final double superLarge;

  double get none => MaterialDimensions.zero;

  RadiusTokens copyWith({
    double? extraSmall,
    double? small,
    double? semiSmall,
    double? medium,
    double? semiLarge,
    double? large,
    double? extraLarge,
    double? superLarge,
  }) {
    return RadiusTokens(
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      semiSmall: semiSmall ?? this.semiSmall,
      medium: medium ?? this.medium,
      semiLarge: semiLarge ?? this.semiLarge,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      superLarge: superLarge ?? this.superLarge,
    );
  }

  @override
  List<Object?> get props => [
    none,
    extraSmall,
    small,
    semiSmall,
    medium,
    semiLarge,
    large,
    extraLarge,
    superLarge,
  ];

  @override
  String toString() =>
      '''
RadiusTokens(
  none: $none,
  extraSmall: $extraSmall,
  small: $small,
  semiSmall: $semiSmall,
  medium: $medium,
  semiLarge: $semiLarge,
  large: $large,
  extraLarge: $extraLarge,
  superLarge: $superLarge,
)
''';
}
