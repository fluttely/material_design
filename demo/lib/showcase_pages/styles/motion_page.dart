import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

class MotionPage extends StatelessWidget {
  const MotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motion'),
      ),
      body: ListView(
        padding: M3EdgeInsets.all(M3MarginToken.mediumScreen),
        children: [
          LaunchURLText(
            label:
                'M3MotionToken Equals:\nM3MotionDurationToken + M3MotionCurveToken',
            m3Url:
                'https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration',
          ),
          _MotionShowcase(
            title: 'Emphasized',
            easing: M3MotionCurveToken.emphasizedAccelerate,
            duration: M3MotionDurationToken.long2,
          ),
          _MotionShowcase(
            title: 'Emphasized Incoming',
            easing: M3MotionCurveToken.emphasizedDecelerate,
            duration: M3MotionDurationToken.long1,
          ),
          _MotionShowcase(
            title: 'Emphasized Outgoing',
            easing: M3MotionCurveToken.emphasizedAccelerate,
            duration: M3MotionDurationToken.short3,
          ),
          _MotionShowcase(
            title: 'Standard',
            easing: M3MotionCurveToken.standard,
            duration: M3MotionDurationToken.medium2,
          ),
          _MotionShowcase(
            title: 'Standard Incoming',
            easing: M3MotionCurveToken.standardDecelerate,
            duration: M3MotionDurationToken.medium1,
          ),
          _MotionShowcase(
            title: 'Standard Outgoing',
            easing: M3MotionCurveToken.standardAccelerate,
            duration: M3MotionDurationToken.short4,
          ),
          _MotionShowcase(
            title: 'Linear',
            easing: M3MotionCurveToken.linear,
            duration: M3MotionDurationToken.short3,
          ),
        ],
      ),
    );
  }
}

class _MotionShowcase extends StatefulWidget {
  const _MotionShowcase({
    required this.title,
    required this.easing,
    required this.duration,
  });

  final String title;
  final M3MotionCurveToken easing;
  final M3MotionDurationToken duration;

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
      duration: widget.duration.value,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).chain(CurveTween(curve: widget.easing.value)).animate(_controller);
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

    return M3Padding.only(
      bottom: M3SpacingToken.space16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: textTheme.titleMedium),
          const M3Gap(M3SpacingToken.space8),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: _MotionPainter(
                  animationValue: _animation.value,
                  easing: widget.easing,
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
    required this.easing,
    required this.color,
  });

  final double animationValue;
  final M3MotionCurveToken easing;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height);

    for (double t = 0; t <= 1.0; t += 0.01) {
      final y = size.height - easing.value.transform(t) * size.height;
      path.lineTo(t * size.width, y);
    }
    canvas.drawPath(path, paint);

    final circlePaint = Paint()..color = color;
    final circleX = animationValue * size.width;
    final circleY =
        size.height - easing.value.transform(animationValue) * size.height;
    canvas.drawCircle(Offset(circleX, circleY), 6, circlePaint);
  }

  @override
  bool shouldRepaint(_MotionPainter oldDelegate) {
    return animationValue != oldDelegate.animationValue;
  }
}
