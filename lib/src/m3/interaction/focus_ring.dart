part of '../../../material_design.dart';

/// Displays a Material Design 3 focus ring around [child] when it has
/// keyboard focus.
///
/// The focus ring uses a 3dp ring with a 3dp gap between the ring and the
/// component boundary, following the M3 spec for focus indicators.
///
/// ```dart
/// M3FocusRing(
///   child: IconButton(
///     onPressed: () {},
///     icon: const Icon(Icons.star),
///   ),
/// )
/// ```
class M3FocusRing extends StatefulWidget {
  /// Creates an M3 focus ring widget.
  const M3FocusRing({
    required this.child,
    super.key,
    this.color,
    this.ringWidth = 3.0,
    this.ringOffset = 3.0,
    this.borderRadius,
    this.focusNode,
  });

  /// The widget that receives keyboard focus and displays the ring.
  final Widget child;

  /// Ring color. Defaults to `colorScheme.secondary`.
  final Color? color;

  /// Thickness of the focus ring in dp (default: 3dp per M3 spec).
  final double ringWidth;

  /// Gap between the component boundary and the ring (default: 3dp).
  final double ringOffset;

  /// Corner radius of the ring. Inferred from the child's shape when null.
  final BorderRadius? borderRadius;

  /// Custom focus node to listen to focus state changes.
  final FocusNode? focusNode;

  @override
  State<M3FocusRing> createState() => _M3FocusRingState();
}

class _M3FocusRingState extends State<M3FocusRing> {
  late final FocusNode _node;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _node = widget.focusNode ?? FocusNode();
    _node.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _node.removeListener(_onFocusChange);
    if (widget.focusNode == null) _node.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (mounted) setState(() => _hasFocus = _node.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final ringColor = widget.color ?? Theme.of(context).colorScheme.secondary;
    final radius = widget.borderRadius ?? BorderRadius.zero;

    return Focus(
      focusNode: _node,
      child: AnimatedContainer(
        duration: M3MotionDuration.short2,
        curve: M3MotionCurve.standard,
        decoration: _hasFocus
            ? BoxDecoration(
                borderRadius: radius.add(
                  BorderRadius.circular(widget.ringOffset + widget.ringWidth),
                ) as BorderRadius,
                border: Border.all(
                  color: ringColor,
                  width: widget.ringWidth,
                ),
              )
            : null,
        child: Padding(
          padding:
              _hasFocus ? EdgeInsets.all(widget.ringOffset) : EdgeInsets.zero,
          child: widget.child,
        ),
      ),
    );
  }
}
