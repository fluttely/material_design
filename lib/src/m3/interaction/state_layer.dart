part of '../../interaction.dart';

/// Applies a Material Design 3 state-layer overlay to its [child].
///
/// A state layer is a semi-transparent color overlay that communicates the
/// current interaction state. The color comes from [overlayColor]; the opacity
/// comes from [M3InteractionState.stateLayerOpacity].
///
/// Hover, focus, press, and drag are handled automatically.
///
/// ```dart
/// M3StateLayer(
///   overlayColor: colorScheme.onSurface,
///   borderRadius: M3BorderRadius.medium,
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
    this.borderRadius = M3BorderRadius.none,
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

  /// Corner radius applied to the ripple clip region. Match this to the
  /// surrounding component's shape.
  final M3BorderRadius borderRadius;

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
    // Ordered by M3 precedence: the strongest active state wins.
    final state = switch (states) {
      _ when states.contains(WidgetState.dragged) => M3InteractionState.dragged,
      _ when states.contains(WidgetState.pressed) => M3InteractionState.pressed,
      _ when states.contains(WidgetState.focused) => M3InteractionState.focus,
      _ when states.contains(WidgetState.hovered) => M3InteractionState.hover,
      _ => null,
    };
    if (state == null) return null;
    return overlayColor.withValues(alpha: state.stateLayerOpacity);
  }
}
