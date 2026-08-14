part of '../../interaction.dart';

/// Draws a Material Design 3 focus ring around [child] while it — or anything
/// inside it — holds keyboard focus.
///
/// The ring is [M3FocusIndicator.thickness] thick and sits
/// [M3FocusIndicator.offset] away from the component boundary.
///
/// ## Layout
///
/// The gap and ring are reserved **at all times**, not only while focused.
/// Adding the inset on focus would shift the child by 6dp the instant a user
/// tabs to it, which is exactly the population that can least afford a moving
/// target. The cost is a constant, predictable 6dp of padding.
///
/// ## Focusability
///
/// This widget observes focus; it does not take it. [child] must contain
/// something focusable (a button, a text field, a [Focus] of its own) for the
/// ring to ever appear.
///
/// ```dart
/// M3FocusRing(
///   borderRadius: M3BorderRadius.full,
///   child: IconButton(
///     onPressed: () {},
///     icon: const Icon(Icons.star),
///   ),
/// )
/// ```
class M3FocusRing extends StatefulWidget {
  /// Creates an M3 focus ring around [child].
  const M3FocusRing({
    required this.child,
    super.key,
    this.color,
    this.thickness = M3FocusIndicator.thickness,
    this.offset = M3FocusIndicator.offset,
    this.borderRadius = M3BorderRadius.none,
    this.focusNode,
  });

  /// The widget the ring is drawn around.
  final Widget child;

  /// Ring color. Defaults to `colorScheme.secondary`, per the M3 spec.
  final Color? color;

  /// Thickness of the focus ring (3dp by default).
  final M3BorderWidthValue thickness;

  /// Gap between the component boundary and the ring (3dp by default).
  final M3SpacingValue offset;

  /// Corner radius of the ring. Match this to the child's own shape.
  final M3BorderRadius borderRadius;

  /// An existing node to observe instead of creating one.
  ///
  /// Supply this when the child already owns a [FocusNode] so the ring tracks
  /// that node directly.
  final FocusNode? focusNode;

  @override
  State<M3FocusRing> createState() => _M3FocusRingState();
}

class _M3FocusRingState extends State<M3FocusRing> {
  FocusNode? _internalNode;
  bool _hasFocus = false;

  FocusNode get _node => widget.focusNode ?? (_internalNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _node.addListener(_onFocusChange);
    _hasFocus = _node.hasFocus;
  }

  @override
  void didUpdateWidget(M3FocusRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      (oldWidget.focusNode ?? _internalNode)?.removeListener(_onFocusChange);
      _node.addListener(_onFocusChange);
      _hasFocus = _node.hasFocus;
    }
  }

  @override
  void dispose() {
    _node.removeListener(_onFocusChange);
    _internalNode?.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!mounted || _node.hasFocus == _hasFocus) return;
    setState(() => _hasFocus = _node.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final ringColor = widget.color ?? Theme.of(context).colorScheme.secondary;
    final inset = widget.offset + widget.thickness;

    return Focus(
      focusNode: _node,
      canRequestFocus: false,
      skipTraversal: true,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(end: _hasFocus ? 1 : 0),
        duration: M3Motion.linearDuration,
        curve: M3Motion.linearCurve,
        builder: (context, t, child) => CustomPaint(
          foregroundPainter: t == 0
              ? null
              : _M3FocusRingPainter(
                  color: ringColor,
                  thickness: widget.thickness,
                  borderRadius: widget.borderRadius,
                  opacity: t,
                ),
          child: child,
        ),
        child: Padding(
          padding: EdgeInsets.all(inset),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Paints the focus ring inside the padding reserved by [M3FocusRing].
class _M3FocusRingPainter extends CustomPainter {
  const _M3FocusRingPainter({
    required this.color,
    required this.thickness,
    required this.borderRadius,
    required this.opacity,
  });

  final Color color;
  final double thickness;
  final BorderRadius borderRadius;
  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    // Stroke straddles the path, so inset by half the thickness to keep the
    // ring fully inside the reserved area.
    final bounds = Offset.zero & size;
    final rect = bounds.deflate(thickness / 2);
    if (rect.isEmpty) return;

    canvas.drawRRect(
      borderRadius.toRRect(rect),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness
        ..color = color.withValues(alpha: color.a * opacity),
    );
  }

  @override
  bool shouldRepaint(_M3FocusRingPainter oldDelegate) =>
      color != oldDelegate.color ||
      thickness != oldDelegate.thickness ||
      borderRadius != oldDelegate.borderRadius ||
      opacity != oldDelegate.opacity;
}
