// The M3 Expressive shape engine is @experimental by design; a showcase for it
// necessarily opts in.
// ignore_for_file: experimental_member_use

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:material_design/material_design.dart';

class ShapesPreview extends StatefulWidget {
  const ShapesPreview({super.key});

  @override
  State<ShapesPreview> createState() => _ShapesPreviewState();
}

class _ShapesPreviewState extends State<ShapesPreview>
    with SingleTickerProviderStateMixin {
  static final List<({M3ERoundedPolygon shape, String title})> _shapes = [
    (shape: M3EShapes.circle, title: 'Circle'),
    (shape: M3EShapes.square, title: 'Square'),
    (shape: M3EShapes.slanted, title: 'Slanted'),
    (shape: M3EShapes.arch, title: 'Arch'),
    (shape: M3EShapes.semiCircle, title: 'Semicircle'),
    (shape: M3EShapes.oval, title: 'Oval'),
    (shape: M3EShapes.pill, title: 'Pill'),
    (shape: M3EShapes.triangle, title: 'Triangle'),
    (shape: M3EShapes.arrow, title: 'Arrow'),
    (shape: M3EShapes.fan, title: 'Fan'),
    (shape: M3EShapes.diamond, title: 'Diamond'),
    (shape: M3EShapes.clamShell, title: 'Clammshell'),
    (shape: M3EShapes.pentagon, title: 'Pentagon'),
    (shape: M3EShapes.gem, title: 'Gem'),
    (shape: M3EShapes.verySunny, title: 'Very sunny'),
    (shape: M3EShapes.sunny, title: 'Sunny'),
    (shape: M3EShapes.cookie4Sided, title: '4-sided cookie'),
    (shape: M3EShapes.cookie6Sided, title: '6-sided cookie'),
    (shape: M3EShapes.cookie7Sided, title: '8-sided cookie'),
    (shape: M3EShapes.cookie9Sided, title: '9-sided cookie'),
    (shape: M3EShapes.cookie12Sided, title: '12-sided cookie'),
    (shape: M3EShapes.clover4Leaf, title: '4-leaf clover'),
    (shape: M3EShapes.clover8Leaf, title: '8-leaf clover'),
    (shape: M3EShapes.burst, title: 'Burst'),
    (shape: M3EShapes.softBurst, title: 'Soft burst'),
    (shape: M3EShapes.boom, title: 'Boom'),
    (shape: M3EShapes.softBoom, title: 'Soft boom'),
    (shape: M3EShapes.puffyDiamond, title: 'Puffy diamond'),
    (shape: M3EShapes.puffy, title: 'Puffy'),
    (shape: M3EShapes.flower, title: 'Flower'),
    (shape: M3EShapes.ghostish, title: 'Ghost-ish'),
    (shape: M3EShapes.pixelCircle, title: 'Pixel circle'),
    (shape: M3EShapes.pixelTriangle, title: 'Pixel triangle'),
    (shape: M3EShapes.bun, title: 'Bun'),
    (shape: M3EShapes.heart, title: 'Heart'),
  ];

  late final ValueNotifier<int> _shapeIndex;

  late final ValueNotifier<int> _morphIndex;

  late final List<M3EMorph> _morphs;

  late final AnimationController _controller;

  Timer? _timer;
  Timer? _startTimer;

  final _bouncySimulation = SpringSimulation(
    SpringDescription.withDampingRatio(
      ratio: 0.5,
      stiffness: 400,
      mass: 1,
    ),
    0,
    1,
    5,
    snapToEnd: true,
  );

  // This simulation used for Heart shape morphing, as progress greater than 1
  // produces sharp weird shape.
  final _lessBouncySimulation = SpringSimulation(
    SpringDescription.withDampingRatio(
      ratio: 0.8,
      stiffness: 300,
      mass: 1,
    ),
    0,
    1,
    0,
    snapToEnd: true,
  );

  @override
  void initState() {
    super.initState();

    _shapeIndex = ValueNotifier(0);
    _morphIndex = ValueNotifier(0);

    _morphs = <M3EMorph>[];
    for (var i = 0; i < _shapes.length; i++) {
      _morphs.add(
        M3EMorph(
          _shapes[i].shape,
          _shapes[(i + 1) % _shapes.length].shape,
        ),
      );
    }

    _controller = AnimationController.unbounded(vsync: this);

    // A cancellable timer rather than a fire-and-forget Future.delayed: the
    // widget can be disposed during the initial pause, and a pending future
    // outlives it.
    _startTimer = Timer(M3MotionDuration.extraLong4, () {
      _timer = Timer.periodic(
        M3MotionDuration.extraLong4,
        (_) => _onAnimationDone(),
      );

      _controller
        ..value = 0
        ..animateWith(_bouncySimulation);

      _shapeIndex.value += 1;
    });
  }

  @override
  void dispose() {
    _shapeIndex.dispose();
    _morphIndex.dispose();
    _controller.dispose();
    _startTimer?.cancel();
    _timer?.cancel();
    super.dispose();
  }

  void _onAnimationDone() {
    if (!mounted) {
      return;
    }

    _morphIndex.value = (_morphIndex.value + 1) % _morphs.length;
    _shapeIndex.value = (_shapeIndex.value + 1) % _shapes.length;

    final isHeart = _shapeIndex.value == _shapes.length - 1;
    _controller
      ..value = 0
      ..animateWith(
        isHeart ? _lessBouncySimulation : _bouncySimulation,
      );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
              maxHeight: 300,
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: CustomPaint(
                painter: _M3EMorphPainter(
                  morphs: _morphs,
                  morphIndex: _morphIndex,
                  progress: _controller,
                  color: colorScheme.onSurface,
                ),
                willChange: true,
                child: const SizedBox.expand(),
              ),
            ),
          ),
          const M3Gap(M3Spacings.s40),
          ValueListenableBuilder(
            valueListenable: _shapeIndex,
            builder: (context, index, child) {
              return _AnimatedTitle(title: _shapes[index].title);
            },
          ),
        ],
      ),
    );
  }
}

class _M3EMorphPainter extends CustomPainter {
  _M3EMorphPainter({
    required this.morphs,
    required this.morphIndex,
    required this.progress,
    required this.color,
  }) : super(
          repaint: Listenable.merge([morphIndex, progress]),
        );

  final List<M3EMorph> morphs;

  final ValueListenable<int> morphIndex;

  final Animation<double> progress;

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = morphs[morphIndex.value].toPath(progress: progress.value);

    canvas
      ..save()
      ..scale(size.width)
      ..drawPath(
        path,
        Paint()
          ..style = PaintingStyle.fill
          ..color = color,
      )
      ..restore();
  }

  @override
  bool shouldRepaint(_M3EMorphPainter oldDelegate) {
    return oldDelegate.morphs != morphs ||
        oldDelegate.morphIndex != morphIndex ||
        oldDelegate.progress != progress ||
        oldDelegate.color != color;
  }
}

class _AnimatedTitle extends StatefulWidget {
  const _AnimatedTitle({
    required this.title,
  });

  final String title;

  @override
  State<_AnimatedTitle> createState() => __AnimatedTitleState();
}

class __AnimatedTitleState extends State<_AnimatedTitle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _width;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      value: 1,
      duration: M3MotionDuration.short4,
    );
    _width = Tween<double>(
      begin: 600,
      end: 400,
    )
        .chain(CurveTween(curve: M3MotionCurve.standardDecelerate))
        .animate(_controller);
  }

  @override
  void didUpdateWidget(_AnimatedTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _width,
      builder: (context, _) {
        return Text(
          widget.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontVariations: [FontVariation.weight(_width.value)],
          ),
        );
      },
    );
  }
}
