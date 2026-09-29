import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';

class MotionPage extends StatelessWidget {
  const MotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motion'),
      ),
      body: ListView(
        padding: const M3EdgeInsets.all(M3Margins.mediumScreen),
        children: const [
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
          M3Gap(M3Spacings.s8),
          _DurationScale(),
          M3Gap(M3Spacings.s16),
          _Selectors(),
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
      begin: 0,
      end: 1,
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
      padding: const M3EdgeInsets.only(bottom: M3Spacings.s16),
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
                child: const SizedBox(
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

    final path = Path()..moveTo(0, size.height);

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

/// The names the spec gives the curves, index-aligned with
/// [M3MotionCurve.values]. Names only — every number on this page is read
/// off a token.
const _curveNames = <String>[
  'emphasized',
  'emphasizedDecelerate',
  'emphasizedAccelerate',
  'standard',
  'standardDecelerate',
  'standardAccelerate',
  'linear',
];

String _curveName(M3MotionCurve curve) =>
    _curveNames[M3MotionCurve.values.indexOf(curve)];

/// The four duration groups, four steps each, in [M3MotionDuration.values]
/// order.
const _durationGroups = <String>['short', 'medium', 'long', 'extraLong'];

/// All sixteen duration tokens as bars against the longest one.
class _DurationScale extends StatelessWidget {
  const _DurationScale();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final longest = M3MotionDuration.values.last.inMilliseconds;

    return Card(
      child: M3Padding(
        padding: const M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('M3MotionDuration — all sixteen', style: textTheme.titleLarge),
            const M3Gap(M3Spacings.s4),
            Text(
              'The schemes above use seven of these. The rest are there for '
              'motion a scheme does not describe: 50ms steps up to 600ms, then '
              '100ms steps to a full second.',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const M3Gap(M3Spacings.s12),
            for (final (i, duration) in M3MotionDuration.values.indexed)
              M3Padding(
                padding: const M3EdgeInsets.only(bottom: M3Spacings.s4),
                child: Row(
                  children: [
                    SizedBox(
                      width: M3Spacings.s96,
                      child: Text(
                        '${_durationGroups[i ~/ 4]}${i % 4 + 1}',
                        style: M3TypeScale.labelMedium,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: duration.inMilliseconds / longest,
                          child: Container(
                            height: M3Spacings.s8,
                            decoration: M3BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: M3BorderRadius.full,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: M3Spacings.s64,
                      child: Text(
                        '${duration.inMilliseconds}ms',
                        textAlign: TextAlign.end,
                        style: M3TypeScale.labelMedium.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// What [M3Motion.durationFor] and [M3Motion.curveFor] resolve to.
class _Selectors extends StatelessWidget {
  const _Selectors();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Widget row(String from, String to) => M3Padding(
          padding: const M3EdgeInsets.only(bottom: M3Spacings.s4),
          child: Row(
            children: [
              Expanded(child: Text(from, style: M3TypeScale.labelMedium)),
              Icon(
                Icons.arrow_forward,
                size: M3IconSizes.dense,
                color: colorScheme.onSurfaceVariant,
              ),
              const M3Gap(M3Spacings.s8),
              Expanded(
                child: Text(
                  to,
                  style: M3TypeScale.labelMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        );

    return Card(
      child: M3Padding(
        padding: const M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Choosing by intent', style: textTheme.titleLarge),
            const M3Gap(M3Spacings.s4),
            Text(
              'Two selectors pick from the scales without naming a number: '
              'how far the element travels decides its duration, and whether '
              'it is arriving, leaving or staying decides its easing.',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const M3Gap(M3Spacings.s12),
            Text('M3Motion.durationFor', style: textTheme.titleSmall),
            const M3Gap(M3Spacings.s8),
            for (final distance in M3MotionDistance.values)
              row(
                'M3MotionDistance.${distance.name}',
                '${M3Motion.durationFor(distance).inMilliseconds}ms',
              ),
            const M3Gap(M3Spacings.s12),
            Text('M3Motion.curveFor', style: textTheme.titleSmall),
            const M3Gap(M3Spacings.s8),
            for (final type in M3MotionType.values)
              row(
                'M3MotionType.${type.name}',
                _curveName(M3Motion.curveFor(type)),
              ),
          ],
        ),
      ),
    );
  }
}
