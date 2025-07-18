import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class MotionPage extends StatelessWidget {
  const MotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Motion')),
      body: ListView(
        padding: const EdgeInsets.all(M3Spacing.space24),
        children: const [
          _MotionShowcase(
            title: 'Emphasized',
            token: M3Motion.emphasized,
          ),
          _MotionShowcase(
            title: 'Emphasized Incoming',
            token: M3Motion.emphasizedIncoming,
          ),
          _MotionShowcase(
            title: 'Emphasized Outgoing',
            token: M3Motion.emphasizedOutgoing,
          ),
          _MotionShowcase(
            title: 'Standard',
            token: M3Motion.standard,
          ),
          _MotionShowcase(
            title: 'Standard Incoming',
            token: M3Motion.standardIncoming,
          ),
          _MotionShowcase(
            title: 'Standard Outgoing',
            token: M3Motion.standardOutgoing,
          ),
          _MotionShowcase(
            title: 'Linear',
            token: M3Motion.linear,
          ),
        ],
      ),
    );
  }
}

class _MotionShowcase extends StatefulWidget {
  const _MotionShowcase({
    required this.title,
    required this.token,
  });

  final String title;
  final M3MotionScheme token;

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
      duration: widget.token.duration,
      vsync: this,
    );
    _animation = widget.token
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
      padding: const EdgeInsets.only(bottom: M3Spacing.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: M3TypeScale.titleMedium),
          const SizedBox(height: M3Spacing.space8),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: _MotionPainter(
                  animationValue: _animation.value,
                  curve: widget.token.curve,
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
