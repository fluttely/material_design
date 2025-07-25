part of '../design_tokens.dart';

/// Shadow presets for text elements.

/// Predefined [Shadow] values used for text.
class TextShadowTokens extends Equatable {
  const TextShadowTokens({
    Shadow? small,
    Shadow? medium,
    Shadow? large,
  }) : small =
           small ??
           const Shadow(
             blurRadius: ExtendedValues.x2,
             offset: Offset(0, 1),
             color: Color(0x44000000),
           ),
       medium =
           medium ??
           const Shadow(
             blurRadius: ExtendedValues.x4,
             offset: Offset(0, 2),
             color: Color(0x44000000),
           ),
       large =
           large ??
           const Shadow(
             blurRadius: ExtendedValues.x8,
             offset: Offset(0, 4),
             color: Color(0x44000000),
           );

  factory TextShadowTokens.fromMap(Map<String, dynamic> map) {
    Shadow? parseShadow(String key) {
      final value = map[key];
      if (value is Map<String, dynamic>) {
        return Shadow(
          blurRadius: (value['blurRadius'] as num?)?.toDouble() ?? 0,
          offset: Offset(
            (value['offsetX'] as num?)?.toDouble() ?? 0,
            (value['offsetY'] as num?)?.toDouble() ?? 0,
          ),
          color: Color((value['color'] as int?) ?? 0x44000000),
        );
      }
      return null;
    }

    return TextShadowTokens(
      small: parseShadow('small'),
      medium: parseShadow('medium'),
      large: parseShadow('large'),
    );
  }

  final Shadow small;
  final Shadow medium;
  final Shadow large;

  Shadow get none => const Shadow(
    color: Color(0x00000000),
  );

  @override
  List<Object?> get props => [none, small, medium, large];

  @override
  String toString() =>
      '''
TextShadowTokens(
  none: $none,
  small: $small,
  medium: $medium,
  large: $large,
)
''';
}
