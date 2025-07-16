import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class MotionPage extends StatelessWidget {
  const MotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Motion')),
      body: ListView(
        padding: const EdgeInsets.all(MaterialSpacing.space24),
        children: const [
          _MotionShowcase(
            title: 'Emphasized',
            motionToken: MaterialMotion.emphasized,
          ),
          _MotionShowcase(
            title: 'Emphasized Incoming',
            motionToken: MaterialMotion.emphasizedIncoming,
          ),
          _MotionShowcase(
            title: 'Emphasized Outgoing',
            motionToken: MaterialMotion.emphasizedOutgoing,
          ),
          _MotionShowcase(
            title: 'Standard',
            motionToken: MaterialMotion.standard,
          ),
          _MotionShowcase(
            title: 'Standard Incoming',
            motionToken: MaterialMotion.standardIncoming,
          ),
          _MotionShowcase(
            title: 'Standard Outgoing',
            motionToken: MaterialMotion.standardOutgoing,
          ),
          _MotionShowcase(
            title: 'Linear',
            motionToken: MaterialMotion.linear,
          ),
        ],
      ),
    );
  }
}

class _MotionShowcase extends StatefulWidget {
  const _MotionShowcase({
    required this.title,
    required this.motionToken,
  });

  final String title;
  final MaterialMotionToken motionToken;

  @override
  State<_MotionShowcase> createState() => _MotionShowcaseState();
}

class _MotionShowcaseState extends State<_MotionShowcase>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.motionToken.duration,
      vsync: this,
    );
    _animation = widget.motionToken
        .asTween(begin: 0.0, end: 1.0)
        .animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: MaterialSpacing.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: MaterialTypeScale.titleMedium),
          const SizedBox(height: MaterialSpacing.space8),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: _MotionPainter(
                  animationValue: _animation.value,
                  curve: widget.motionToken.curve,
                  color: colorScheme.primary,
                ),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MotionPainter extends CustomPainter {
  _MotionPainter({
    required this.animationValue,
    required this.curve,
    required this.color,
  });

  final double animationValue;
  final Curve curve;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.5)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height);

    for (double t = 0; t <= 1.0; t += 0.01) {
      final y = size.height - curve.transform(t) * size.height;
      path.lineTo(t * size.width, y);
    }
    canvas.drawPath(path, paint);

    final circlePaint = Paint()..color = color;
    final circleX = animationValue * size.width;
    final circleY = size.height - curve.transform(animationValue) * size.height;
    canvas.drawCircle(Offset(circleX, circleY), 6, circlePaint);
  }

  @override
  bool shouldRepaint(_MotionPainter oldDelegate) {
    return animationValue != oldDelegate.animationValue;
  }
}
