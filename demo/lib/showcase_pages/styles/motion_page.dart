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
        padding: EdgeInsets.all(M3MarginToken.mediumScreen.value),
        children: [
          LaunchURLText(
            label:
                'M3MotionToken Equals:\nM3MotionDurationToken + M3MotionEasingToken',
            m3Url:
                'https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration',
          ),
          _MotionShowcase(
            title: 'Emphasized',
            curve: M3MotionEasingToken.emphasizedAccelerate.value,
            duration: M3MotionDurationToken.long2.value,
          ),
          _MotionShowcase(
            title: 'Emphasized Incoming',
            curve: M3MotionEasingToken.emphasizedDecelerate.value,
            duration: M3MotionDurationToken.long1.value,
          ),
          _MotionShowcase(
            title: 'Emphasized Outgoing',
            curve: M3MotionEasingToken.emphasizedAccelerate.value,
            duration: M3MotionDurationToken.short3.value,
          ),
          _MotionShowcase(
            title: 'Standard',
            curve: M3MotionEasingToken.standard.value,
            duration: M3MotionDurationToken.medium2.value,
          ),
          _MotionShowcase(
            title: 'Standard Incoming',
            curve: M3MotionEasingToken.standardDecelerate.value,
            duration: M3MotionDurationToken.medium1.value,
          ),
          _MotionShowcase(
            title: 'Standard Outgoing',
            curve: M3MotionEasingToken.standardAccelerate.value,
            duration: M3MotionDurationToken.short4.value,
          ),
          _MotionShowcase(
            title: 'Linear',
            curve: M3MotionEasingToken.linear.value,
            duration: M3MotionDurationToken.short3.value,
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
  final Curve curve;
  final Duration duration;

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

    return Padding(
      padding: EdgeInsets.only(bottom: M3SpacingToken.space16.value),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: textTheme.titleMedium),
          SizedBox(height: M3SpacingToken.space8.value),
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
  final Curve curve;
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
