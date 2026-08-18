// The ambient layer. Every frame runs the package's own polygon engine, so
// the outline travels between shapes instead of crossfading.
// ignore_for_file: experimental_member_use
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// A soft wash plus three Expressive polygons that rotate and morph behind
/// the content. Decoration only — it never takes a pointer.
class ExpressiveBackdrop extends StatelessWidget {
  const ExpressiveBackdrop({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.7, -0.8),
          radius: 1.4,
          colors: [
            Color.lerp(scheme.surface, scheme.primary, 0.10)!,
            scheme.surface,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -M3Spacings.s96,
            top: -M3Spacings.s64,
            child: _Blob(
              size: 380,
              color: scheme.primary.withValues(alpha: 0.10),
              from: M3EShapes.cookie9Sided,
              to: M3EShapes.clover4Leaf,
              period: const Duration(seconds: 11),
              spin: const Duration(seconds: 90),
            ),
          ),
          Positioned(
            left: -M3Spacings.s80,
            bottom: -M3Spacings.s96,
            child: _Blob(
              size: 320,
              color: scheme.tertiary.withValues(alpha: 0.10),
              from: M3EShapes.sunny,
              to: M3EShapes.pentagon,
              period: const Duration(seconds: 14),
              spin: const Duration(seconds: 120),
              clockwise: false,
            ),
          ),
          Positioned(
            right: M3LayoutWidths.pane,
            bottom: -M3Spacings.s48,
            child: _Blob(
              size: 180,
              color: scheme.secondary.withValues(alpha: 0.08),
              from: M3EShapes.gem,
              to: M3EShapes.cookie6Sided,
              period: const Duration(seconds: 9),
              spin: const Duration(seconds: 70),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _Blob extends StatefulWidget {
  const _Blob({
    required this.size,
    required this.color,
    required this.from,
    required this.to,
    required this.period,
    required this.spin,
    this.clockwise = true,
  });

  final double size;
  final Color color;
  final M3ERoundedPolygon from;
  final M3ERoundedPolygon to;
  final Duration period;
  final Duration spin;
  final bool clockwise;

  @override
  State<_Blob> createState() => _BlobState();
}

class _BlobState extends State<_Blob> with TickerProviderStateMixin {
  late final AnimationController _morph = AnimationController(
    vsync: this,
    duration: widget.period,
  )..repeat(reverse: true);

  late final AnimationController _spin = AnimationController(
    vsync: this,
    duration: widget.spin,
  )..repeat();

  @override
  void dispose() {
    _morph.dispose();
    _spin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final a = M3EShapeBorder(widget.from);
    final b = M3EShapeBorder(widget.to);

    return IgnorePointer(
      child: AnimatedBuilder(
        animation: Listenable.merge([_morph, _spin]),
        builder: (context, _) {
          final t = Curves.easeInOut.transform(_morph.value);
          final direction = widget.clockwise ? 1 : -1;
          return Transform.rotate(
            angle: _spin.value * 2 * math.pi * direction,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: widget.color,
                  shape: ShapeBorder.lerp(a, b, t)!,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// A morphing accent shape, used as the title slide's mark.
class MorphMark extends StatefulWidget {
  const MorphMark({this.size = M3Spacings.s96, super.key});

  final double size;

  @override
  State<MorphMark> createState() => _MorphMarkState();
}

class _MorphMarkState extends State<MorphMark>
    with SingleTickerProviderStateMixin {
  static final _shapes = <M3ERoundedPolygon>[
    M3EShapes.cookie7Sided,
    M3EShapes.clover4Leaf,
    M3EShapes.sunny,
    M3EShapes.gem,
  ];

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final scaled = _controller.value * _shapes.length;
        final index = scaled.floor() % _shapes.length;
        final t = Curves.easeInOutCubic.transform(scaled - scaled.floor());
        final shape = ShapeBorder.lerp(
          M3EShapeBorder(_shapes[index]),
          M3EShapeBorder(_shapes[(index + 1) % _shapes.length]),
          t,
        )!;

        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: DecoratedBox(
            decoration: ShapeDecoration(color: scheme.primary, shape: shape),
          ),
        );
      },
    );
  }
}
