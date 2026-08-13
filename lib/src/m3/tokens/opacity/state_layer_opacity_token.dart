part of '../../../tokens.dart';

/// Material Design 3 state layer opacity tokens.
///
/// A state layer is a semi-transparent overlay applied over a component to
/// communicate its current interaction state. The overlay color comes from the
/// component's "content" color (e.g. onPrimary, onSurface).
///
/// Reference: https://m3.material.io/foundations/interaction/states/overview
abstract final class M3StateLayerOpacities {
  /// Hover state overlay opacity (8%).
  static const M3OpacityValue hover = M3OpacityValue._(0.08);

  /// Focus state overlay opacity (10%).
  static const M3OpacityValue focus = M3OpacityValue._(0.10);

  /// Pressed state overlay opacity (10%).
  static const M3OpacityValue pressed = M3OpacityValue._(0.10);

  /// Dragged state overlay opacity (16%).
  static const M3OpacityValue dragged = M3OpacityValue._(0.16);
}

/// The interaction states a Material Design 3 component can be in.
///
/// Each state carries the overlay opacity the M3 spec assigns to it, so the
/// state-to-opacity mapping lives in exactly one place.
///
/// Reference: https://m3.material.io/foundations/interaction/states/overview
enum M3InteractionState {
  /// The pointer is hovering over the component (8% overlay).
  hover(M3StateLayerOpacities.hover),

  /// The component has keyboard or programmatic focus (10% overlay).
  focus(M3StateLayerOpacities.focus),

  /// The component is being pressed (10% overlay).
  pressed(M3StateLayerOpacities.pressed),

  /// The component is being dragged (16% overlay).
  dragged(M3StateLayerOpacities.dragged);

  const M3InteractionState(this.stateLayerOpacity);

  /// The state layer overlay opacity for this state.
  final M3OpacityValue stateLayerOpacity;
}
