part of '../design_tokens.dart';

/// Opacity values used for interactive states.

/// Defines opacity values for different component states.
class OpacityTokens extends Equatable {
  const OpacityTokens({
    double? disabled,
    double? hover,
    double? focus,
    double? pressed,
    double? backdrop,
    double? divider,
  }) : disabled = disabled ?? ExtendedValues.x038,
       hover = hover ?? ExtendedValues.x008,
       focus = focus ?? ExtendedValues.x012,
       pressed = pressed ?? ExtendedValues.x016,
       backdrop = backdrop ?? ExtendedValues.x05,
       divider = divider ?? ExtendedValues.x012;
  final double disabled;
  final double hover;
  final double focus;
  final double pressed;
  final double backdrop;
  final double divider;

  @override
  List<Object?> get props => [
    disabled,
    hover,
    focus,
    pressed,
    backdrop,
    divider,
  ];

  @override
  String toString() =>
      '''
OpacityTokens(
  disabled: $disabled,
  hover: $hover,
  focus: $focus,
  pressed: $pressed,
  backdrop: $backdrop,
  divider: $divider,
)''';
}
