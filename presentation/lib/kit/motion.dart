// ignore_for_file: experimental_member_use
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Animates one element into place on a spring, after [step] × 60 ms.
///
/// `expressiveSpatialFast` is the bounciest token Material ships (damping 0.6)
/// — it overshoots, which is the whole point of the Expressive scheme. Opacity
/// is clamped because a spring goes past 1 and colour channels do not.
class Reveal extends StatefulWidget {
  const Reveal({
    required this.child,
    this.step = 0,
    this.spring = M3ESpring.expressiveSpatialFast,
    this.rise = M3Spacings.s24,
    super.key,
  });

  final Widget child;
  final int step;
  final M3ESpring spring;
  final double rise;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController.unbounded(
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(
      Duration(milliseconds: 60 * widget.step),
      () {
        if (!mounted) return;
        _controller.animateWith(widget.spring.simulation(start: 0, end: 1));
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        return Opacity(
          opacity: t.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, (1 - t) * widget.rise),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
