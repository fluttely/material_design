part of '../../../../material_design.dart';

/// Material Design 3 state layer opacity tokens.
///
/// A state layer is a semi-transparent overlay applied over a component to
/// communicate its current interaction state. The overlay color comes from the
/// component's "content" color (e.g. onPrimary, onSurface).
///
/// Reference: https://m3.material.io/foundations/interaction/states/overview
abstract final class M3StateLayerOpacities {
  /// Hover state overlay opacity (8%).
  static const M3OpacityValue hover = M3OpacityValue(0.08);

  /// Focus state overlay opacity (10%).
  static const M3OpacityValue focus = M3OpacityValue(0.10);

  /// Pressed state overlay opacity (10%).
  static const M3OpacityValue pressed = M3OpacityValue(0.10);

  /// Dragged state overlay opacity (16%).
  static const M3OpacityValue dragged = M3OpacityValue(0.16);
}
