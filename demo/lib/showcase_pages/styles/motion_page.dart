import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';

class MotionPage extends StatelessWidget {
  const MotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motion'),
      ),
      body: ListView(
        padding: M3EdgeInsets.all(M3Margins.mediumScreen),
        children: [
          ShowcaseLink(
            label: 'M3Motion (M3MotionDuration + M3MotionCurve)',
            url:
                'https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration',
          ),
          _MotionShowcase(
            title: 'Emphasized',
            curve: M3Motion.emphasizedCurve,
            duration: M3Motion.emphasizedDuration,
          ),
          _MotionShowcase(
            title: 'Emphasized Incoming',
            curve: M3Motion.emphasizedIncomingCurve,
            duration: M3Motion.emphasizedIncomingDuration,
          ),
          _MotionShowcase(
            title: 'Emphasized Outgoing',
            curve: M3Motion.emphasizedOutgoingCurve,
            duration: M3Motion.emphasizedOutgoingDuration,
          ),
          _MotionShowcase(
            title: 'Standard',
            curve: M3Motion.standardCurve,
            duration: M3Motion.standardDuration,
          ),
          _MotionShowcase(
            title: 'Standard Incoming',
            curve: M3Motion.standardIncomingCurve,
            duration: M3Motion.standardIncomingDuration,
          ),
          _MotionShowcase(
            title: 'Standard Outgoing',
            curve: M3Motion.standardOutgoingCurve,
            duration: M3Motion.standardOutgoingDuration,
          ),
          _MotionShowcase(
            title: 'Linear',
            curve: M3Motion.linearCurve,
            duration: M3Motion.linearDuration,
          ),
        ],
      ),
    );
  }
}

class _MotionShowcase extends StatefulWidget {
  const _MotionShowcase({
    required this.title,
    required this.curve,
    required this.duration,
  });

  final String title;
  final M3MotionCurve curve;
  final M3MotionDuration duration;

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
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).chain(CurveTween(curve: widget.curve)).animate(_controller);
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
    final textTheme = Theme.of(context).textTheme;

    return M3Padding(
      padding: M3EdgeInsets.only(bottom: M3Spacings.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: textTheme.titleMedium),
          const M3Gap(M3Spacings.s8),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: _MotionPainter(
                  animationValue: _animation.value,
                  curve: widget.curve,
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
  final M3MotionCurve curve;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: M3Contract.opacity(0.5))
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
