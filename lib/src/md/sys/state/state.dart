/// System state tokens for Material Design 3.
///
/// These define the interaction states and their visual properties
/// such as state layer opacities and focus indicators.
///
/// Specification: https://m3.material.io/foundations/interaction/states/state-layers
abstract class MdSysState {
  // TODO(M3): Verified
  /// Token: md.sys.state.hover.state-layer-opacity
  static const double hoverStateLayerOpacity = 0.08;

  // TODO(M3): Verified
  /// Token: md.sys.state.focus.state-layer-opacity
  static const double focusStateLayerOpacity = 0.10;

  // TODO(M3): Verified
  /// Token: md.sys.state.pressed.state-layer-opacity
  static const double pressedStateLayerOpacity = 0.10;

  // TODO(M3): Verified
  /// Token: md.sys.state.dragged.state-layer-opacity
  static const double draggedStateLayerOpacity = 0.16;

  // TODO(M3): Pending
  /// Token: md.sys.state.selected.state-layer-opacity
  static const double selectedStateLayerOpacity = 0.12;

  // TODO(M3): Pending
  /// Token: md.sys.state.disabled.content-opacity
  static const double disabledContentOpacity = 0.38;

  // TODO(M3): Pending
  /// Token: md.sys.state.disabled.container-opacity
  static const double disabledContainerOpacity = 0.12;

  // TODO(M3): Pending
  /// Token: md.sys.state.focus.indicator-thickness
  static const double focusIndicatorThickness = 2.0;

  // TODO(M3): Pending
  /// Token: md.sys.state.focus.indicator-outer-offset
  static const double focusIndicatorOuterOffset = 2.0;

  // TODO(M3): Pending
  /// Token: md.sys.state.focus.indicator-inner-offset
  static const double focusIndicatorInnerOffset = 4.0;
}
