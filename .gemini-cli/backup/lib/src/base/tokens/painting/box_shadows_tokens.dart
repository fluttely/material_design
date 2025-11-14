part of '../design_tokens.dart';

/// Box shadow presets used by components.

/// Predefined [BoxShadow] values for different elevation levels.
class BoxShadowTokens extends Equatable {
  const BoxShadowTokens({
    BoxShadow? small,
    BoxShadow? medium,
    BoxShadow? large,
  }) : small =
           small ??
           const BoxShadow(
             blurRadius: ExtendedValues.x2,
             spreadRadius: ExtendedValues.x1,
             offset: Offset(0, 2),
             color: Color(0x44000000),
           ),
       medium =
           medium ??
           const BoxShadow(
             blurRadius: ExtendedValues.x4,
             spreadRadius: ExtendedValues.x1,
             offset: Offset(0, 4),
             color: Color(0x44000000),
           ),
       large =
           large ??
           const BoxShadow(
             blurRadius: ExtendedValues.x8,
             spreadRadius: ExtendedValues.x2,
             offset: Offset(0, 8),
             color: Color(0x44000000),
           );

  factory BoxShadowTokens.fromMap(Map<String, dynamic> map) {
    BoxShadow? parseShadow(String key) {
      final value = map[key];
      if (value is Map<String, dynamic>) {
        return BoxShadow(
          blurRadius: (value['blurRadius'] as num?)?.toDouble() ?? 0,
          spreadRadius: (value['spreadRadius'] as num?)?.toDouble() ?? 0,
          offset: Offset(
            (value['offsetX'] as num?)?.toDouble() ?? 0,
            (value['offsetY'] as num?)?.toDouble() ?? 0,
          ),
          color: Color((value['color'] as int?) ?? 0x44000000),
        );
      }
      return null;
    }

    return BoxShadowTokens(
      small: parseShadow('small'),
      medium: parseShadow('medium'),
      large: parseShadow('large'),
    );
  }

  final BoxShadow small;
  final BoxShadow medium;
  final BoxShadow large;

  BoxShadow get none => const BoxShadow(
    color: Color(0x00000000),
  );

  @override
  List<Object?> get props => [none, small, medium, large];

  @override
  String toString() {
    return '''
BoxShadowTokens(
  none: $none,
  small: $small,
  medium: $medium,
  large: $large,
)
''';
  }
}
