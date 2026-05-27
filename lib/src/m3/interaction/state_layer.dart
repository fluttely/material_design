part of '../../../material_design.dart';

/// The possible interaction states a Material Design 3 component can be in.
///
/// Each state has a corresponding opacity defined in [M3StateLayerOpacities].
/// The overlay color is always the component's "content" color (e.g. onPrimary,
/// onSurface) applied at the state's opacity.
enum M3InteractionState {
  /// The pointer is hovering over the component (8% overlay).
  hover,

  /// The component has keyboard or programmatic focus (10% overlay).
  focus,

  /// The component is being pressed (10% overlay).
  pressed,

  /// The component is being dragged (16% overlay).
  dragged,
}

/// Applies a Material Design 3 state-layer overlay to its [child].
///
/// A state layer is a semi-transparent color overlay that communicates the
/// current interaction state. The color comes from [overlayColor] and the
/// opacity comes from [M3StateLayerOpacities].
///
/// Handles hover, focus, press, and drag states automatically via [InkWell].
///
/// ```dart
/// M3StateLayer(
///   overlayColor: colorScheme.onSurface,
///   onTap: () {},
///   child: MyWidget(),
/// )
/// ```
class M3StateLayer extends StatelessWidget {
  /// Creates an M3 state layer overlay.
  const M3StateLayer({
    required this.child,
    required this.overlayColor,
    super.key,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.focusNode,
    this.enabled = true,
    this.borderRadius,
  });

  /// The child widget that receives the state layer overlay.
  final Widget child;

  /// The base color for the overlay. Typically `colorScheme.onSurface`,
  /// `colorScheme.onPrimary`, etc.
  final Color overlayColor;

  /// Callback when the state layer is tapped.
  final VoidCallback? onTap;

  /// Callback when the state layer is long pressed.
  final VoidCallback? onLongPress;

  /// Callback when the hover state changes.
  final ValueChanged<bool>? onHover;

  /// FocusNode to listen to focus state changes.
  final FocusNode? focusNode;

  /// Whether interaction states (hover, press, focus) are active.
  final bool enabled;

  /// Corner radius applied to the ripple clip region.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        onLongPress: enabled ? onLongPress : null,
        onHover: enabled ? onHover : null,
        focusNode: focusNode,
        borderRadius: borderRadius,
        overlayColor: enabled
            ? WidgetStateProperty.resolveWith(_resolveOverlayColor)
            : null,
        child: child,
      ),
    );
  }

  Color? _resolveOverlayColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.dragged)) {
      return overlayColor.withValues(alpha: M3StateLayerOpacities.dragged);
    }
    if (states.contains(WidgetState.pressed)) {
      return overlayColor.withValues(alpha: M3StateLayerOpacities.pressed);
    }
    if (states.contains(WidgetState.focused)) {
      return overlayColor.withValues(alpha: M3StateLayerOpacities.focus);
    }
    if (states.contains(WidgetState.hovered)) {
      return overlayColor.withValues(alpha: M3StateLayerOpacities.hover);
    }
    return null;
  }
}

/// Extension on [ColorScheme] for computing M3 state layer colors.
extension M3ColorSchemeStateLayers on ColorScheme {
  /// Returns the state-layer color for [base] at the given [state].
  Color stateLayerColor(Color base, M3InteractionState state) {
    final opacity = switch (state) {
      M3InteractionState.hover => M3StateLayerOpacities.hover,
      M3InteractionState.focus => M3StateLayerOpacities.focus,
      M3InteractionState.pressed => M3StateLayerOpacities.pressed,
      M3InteractionState.dragged => M3StateLayerOpacities.dragged,
    };
    return base.withValues(alpha: opacity);
  }
}
