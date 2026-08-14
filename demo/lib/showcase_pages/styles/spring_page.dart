// The whole M3 Expressive spring API (M3ESpring, M3MotionScheme,
// M3MotionSpeed, M3MotionSpringKind) is annotated @experimental, and
// demonstrating it is the entire point of this page.
// ignore_for_file: experimental_member_use

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

/// The fraction of the track the dot is allowed to travel past each end.
///
/// A spatial spring overshoots its target, so the resting positions are inset
/// from the rail ends — otherwise the interesting part of the motion happens
/// off-screen.
const double _overshootRoom = 0.2;

/// Demonstrates the M3 Expressive spring tokens: [M3MotionScheme],
/// [M3MotionSpeed], [M3MotionSpringKind] and the [M3ESpring] values they
/// select.
class SpringPage extends StatefulWidget {
  const SpringPage({super.key});

  @override
  State<SpringPage> createState() => _SpringPageState();
}

class _SpringPageState extends State<SpringPage> {
  M3MotionScheme _scheme = M3MotionScheme.expressive;
  M3MotionSpeed _speed = M3MotionSpeed.fast;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Springs')),
      body: ListView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        children: [
          LaunchURLText(
            label: 'M3ESpring | M3MotionScheme | M3MotionSpeed',
            url: 'https://m3.material.io/styles/motion/overview/specs',
          ),
          _buildNoteSection(context, colorScheme),
          const M3Gap(M3Spacings.s16),
          _buildSelectorSection(context, colorScheme),
          const M3Gap(M3Spacings.s16),
          _SpringRunnerSection(scheme: _scheme, speed: _speed),
          const M3Gap(M3Spacings.s16),
          _VelocitySection(spring: _scheme.spatial(_speed)),
          const M3Gap(M3Spacings.s16),
          _buildTokenTableSection(context, colorScheme),
        ],
      ),
    );
  }

  /// What a spring is, and why there are two kinds of them.
  Widget _buildNoteSection(BuildContext context, ColorScheme cs) {
    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Two kinds of spring',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s8),
            Text(
              'A spring is described by damping and stiffness instead of a '
              'duration and a curve, which makes it interruptible and '
              'velocity-aware: a gesture handed off mid-flight continues '
              'rather than restarting.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s12),
            _noteRow(
              context,
              cs,
              icon: Icons.open_with,
              title: 'Spatial — position, size, shape',
              body: 'Damping below 1.0, so the motion overshoots its target '
                  'and settles back. That overshoot is what reads as alive.',
            ),
            const M3Gap(M3Spacings.s8),
            _noteRow(
              context,
              cs,
              icon: Icons.gradient,
              title: 'Effects — color, opacity, tint',
              body: 'Critically damped at 1.0, so it never overshoots. A '
                  'shape that bounces feels expressive; a color that bounces '
                  'looks like a bug.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _noteRow(
    BuildContext context,
    ColorScheme cs, {
    required IconData icon,
    required String title,
    required String body,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: M3IconSizes.dense, color: cs.primary),
        const M3Gap(M3Spacings.s12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.labelLarge),
              Text(
                body,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// The scheme / speed selector every demo below reads from.
  Widget _buildSelectorSection(BuildContext context, ColorScheme cs) {
    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick a spring',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'A scheme is chosen once for the product; a speed is chosen per '
              'interaction. Together they name one of the twelve tokens.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            Text(
              'M3MotionScheme',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const M3Gap(M3Spacings.s8),
            Wrap(
              spacing: M3Spacings.s8,
              runSpacing: M3Spacings.s8,
              children: M3MotionScheme.values.map((scheme) {
                return ChoiceChip(
                  label: Text(scheme.name),
                  selected: _scheme == scheme,
                  onSelected: (_) => setState(() => _scheme = scheme),
                );
              }).toList(),
            ),
            const M3Gap(M3Spacings.s16),
            Text(
              'M3MotionSpeed',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const M3Gap(M3Spacings.s8),
            Wrap(
              spacing: M3Spacings.s8,
              runSpacing: M3Spacings.s8,
              children: M3MotionSpeed.values.map((speed) {
                return ChoiceChip(
                  label: Text(speed.name),
                  selected: _speed == speed,
                  onSelected: (_) => setState(() => _speed = speed),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  /// Every [M3ESpring] value, grouped by the scheme it belongs to.
  Widget _buildTokenTableSection(BuildContext context, ColorScheme cs) {
    final selectedSpatial = _scheme.spatial(_speed);
    final selectedEffects = _scheme.effects(_speed);

    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3ESpring — all twelve tokens',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'The effects springs are identical in both schemes: expression '
              'belongs to movement, not to color. The two highlighted rows are '
              'the current selection.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            ...M3MotionScheme.values.map((scheme) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const M3Gap(M3Spacings.s16),
                  Text(
                    scheme.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const M3Gap(M3Spacings.s8),
                  Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(4),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        decoration: M3BoxDecoration(
                          color: cs.surfaceContainerHigh,
                          borderRadius: M3BorderRadius.small,
                        ),
                        children: [
                          _headerCell(cs, 'Token'),
                          _headerCell(cs, 'Damping'),
                          _headerCell(cs, 'Stiffness'),
                          _headerCell(cs, 'Bouncy'),
                        ],
                      ),
                      ...scheme.springs.map((spring) {
                        final isSelected = spring == selectedSpatial ||
                            spring == selectedEffects;
                        final color = isSelected
                            ? cs.onSecondaryContainer
                            : cs.onSurfaceVariant;

                        return TableRow(
                          decoration: isSelected
                              ? M3BoxDecoration(
                                  color: cs.secondaryContainer,
                                  borderRadius: M3BorderRadius.small,
                                )
                              : null,
                          children: [
                            _valueCell(
                              spring.name,
                              isSelected
                                  ? cs.onSecondaryContainer
                                  : cs.onSurface,
                            ),
                            _valueCell(
                              spring.damping.toStringAsFixed(1),
                              color,
                            ),
                            _valueCell(
                              spring.stiffness.toStringAsFixed(0),
                              color,
                            ),
                            _valueCell(spring.isBouncy ? 'yes' : 'no', color),
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _headerCell(ColorScheme cs, String label) {
    return M3Padding(
      padding: M3EdgeInsets.symmetric(
        horizontal: M3Spacings.s8,
        vertical: M3Spacings.s8,
      ),
      child: Text(
        label,
        style: M3TypeScale.labelMedium.copyWith(color: cs.onSurface),
      ),
    );
  }

  Widget _valueCell(String value, Color color) {
    return M3Padding(
      padding: M3EdgeInsets.symmetric(
        horizontal: M3Spacings.s8,
        vertical: M3Spacings.s8,
      ),
      child: Text(
        value,
        style: M3TypeScale.labelSmall.copyWith(color: color),
      ),
    );
  }
}

/// Runs the selected spatial and effects springs side by side over the same
/// distance, so the overshoot of one against the other is visible.
class _SpringRunnerSection extends StatefulWidget {
  const _SpringRunnerSection({required this.scheme, required this.speed});

  final M3MotionScheme scheme;
  final M3MotionSpeed speed;

  @override
  State<_SpringRunnerSection> createState() => _SpringRunnerSectionState();
}

class _SpringRunnerSectionState extends State<_SpringRunnerSection>
    with TickerProviderStateMixin {
  late final AnimationController _spatialController;
  late final AnimationController _effectsController;

  /// Whether the next run travels back toward the start.
  bool _atEnd = false;

  @override
  void initState() {
    super.initState();
    _spatialController = AnimationController.unbounded(vsync: this);
    _effectsController = AnimationController.unbounded(vsync: this);
  }

  @override
  void dispose() {
    _spatialController.dispose();
    _effectsController.dispose();
    super.dispose();
  }

  void _run() {
    final target = _atEnd ? 0.0 : 1.0;
    setState(() => _atEnd = !_atEnd);

    _spatialController.animateWith(
      widget.scheme.spatial(widget.speed).simulation(
            start: _spatialController.value,
            end: target,
          ),
    );
    _effectsController.animateWith(
      widget.scheme.effects(widget.speed).simulation(
            start: _effectsController.value,
            end: target,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final spatial = widget.scheme.spatial(widget.speed);
    final effects = widget.scheme.effects(widget.speed);

    return Card(
      child: InkWell(
        borderRadius: M3BorderRadius.medium,
        onTap: _run,
        child: M3Padding(
          padding: M3EdgeInsets.all(M3Spacings.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Side by side',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const M3Gap(M3Spacings.s4),
              Text(
                'Both dots are driven by AnimationController.unbounded and '
                'animateWith over the same distance. Tap anywhere on this card '
                'to run them again.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
              ),
              const M3Gap(M3Spacings.s16),
              _buildTrack(
                cs: cs,
                spring: spatial,
                controller: _spatialController,
                label: 'spatial',
                note: spatial.isBouncy
                    ? 'overshoots the target and settles'
                    : 'barely overshoots at damping 0.9',
                isEffects: false,
              ),
              const M3Gap(M3Spacings.s16),
              _buildTrack(
                cs: cs,
                spring: effects,
                controller: _effectsController,
                label: 'effects',
                note: 'critically damped — stops dead on the target',
                isEffects: true,
              ),
              const M3Gap(M3Spacings.s16),
              Align(
                alignment: Alignment.centerLeft,
                child: FilledButton.icon(
                  onPressed: _run,
                  icon: const Icon(Icons.play_arrow),
                  label: Text(_atEnd ? 'Run back' : 'Run'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrack({
    required ColorScheme cs,
    required M3ESpring spring,
    required AnimationController controller,
    required String label,
    required String note,
    required bool isEffects,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label — ${spring.name}',
          style: M3TypeScale.labelLarge.copyWith(color: cs.onSurface),
        ),
        Text(
          'damping ${spring.damping.toStringAsFixed(1)} · stiffness '
          '${spring.stiffness.toStringAsFixed(0)} · $note',
          style: M3TypeScale.labelSmall.copyWith(color: cs.onSurfaceVariant),
        ),
        const M3Gap(M3Spacings.s8),
        SizedBox(
          height: M3Spacings.s48,
          child: Stack(
            children: [
              // The rail the dot travels along.
              Center(
                child: Container(
                  height: M3Spacings.s4,
                  decoration: M3BoxDecoration(
                    color: cs.surfaceContainerHighest,
                    borderRadius: M3BorderRadius.full,
                  ),
                ),
              ),
              // The two resting positions, inset to leave room for overshoot.
              Align(
                alignment: Alignment(_alignmentFor(0), 0),
                child: _restMarker(cs),
              ),
              Align(
                alignment: Alignment(_alignmentFor(1), 0),
                child: _restMarker(cs),
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  final value = controller.value;
                  final color = isEffects
                      ? Color.lerp(
                          cs.secondary,
                          cs.tertiary,
                          value.clamp(0.0, 1.0),
                        )!
                      : cs.primary;

                  return Align(
                    alignment: Alignment(_alignmentFor(value), 0),
                    child: Container(
                      width: M3Spacings.s24,
                      height: M3Spacings.s24,
                      decoration: M3BoxDecoration(
                        color: color,
                        borderRadius: M3BorderRadius.full,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// A hollow ring marking where the spring is trying to come to rest.
  Widget _restMarker(ColorScheme cs) {
    return Container(
      width: M3Spacings.s12,
      height: M3Spacings.s12,
      decoration: M3BoxDecoration(
        borderRadius: M3BorderRadius.full,
        border: M3Border.thin(cs.outline),
      ),
    );
  }

  /// Maps a simulation value onto the track, leaving [_overshootRoom] of slack
  /// at each end so an overshoot is drawn rather than clipped.
  double _alignmentFor(double value) {
    final clamped = value.clamp(-_overshootRoom, 1 + _overshootRoom);
    return (clamped - 0.5) / (0.5 + _overshootRoom);
  }
}

/// Hands a real gesture velocity to a spring, which is the property that
/// separates springs from durations.
class _VelocitySection extends StatefulWidget {
  const _VelocitySection({required this.spring});

  final M3ESpring spring;

  @override
  State<_VelocitySection> createState() => _VelocitySectionState();
}

class _VelocitySectionState extends State<_VelocitySection>
    with SingleTickerProviderStateMixin {
  /// Offset from the centre, in logical pixels.
  late final AnimationController _controller;

  /// Half the width the knob may be dragged to, set from the layout.
  double _dragLimit = 0;

  /// The velocity of the last gesture handed to the simulation, in dp/s.
  double _lastVelocity = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails details) => _controller.stop();

  void _onDragUpdate(DragUpdateDetails details) {
    _controller.value =
        (_controller.value + details.delta.dx).clamp(-_dragLimit, _dragLimit);
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dx;
    setState(() => _lastVelocity = velocity);

    _controller.animateWith(
      widget.spring.simulation(
        start: _controller.value,
        end: 0,
        velocity: velocity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Velocity hand-off',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'Drag or fling the knob. Its release velocity is passed straight '
              'into ${widget.spring.name}.simulation(velocity: …), so the '
              'spring continues the gesture instead of restarting from zero.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            LayoutBuilder(
              builder: (context, constraints) {
                final travel = (constraints.maxWidth - M3Spacings.s48) / 2;
                final safeTravel = travel > 0 ? travel : 0.0;
                _dragLimit = safeTravel * (1 - _overshootRoom);

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragStart: _onDragStart,
                  onHorizontalDragUpdate: _onDragUpdate,
                  onHorizontalDragEnd: _onDragEnd,
                  child: SizedBox(
                    height: M3Spacings.s64,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: M3BorderWidths.thin,
                            height: M3Spacings.s24,
                            color: cs.outlineVariant,
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            final dx = _controller.value
                                .clamp(-safeTravel, safeTravel);

                            return Align(
                              alignment: Alignment.center,
                              child: Transform.translate(
                                offset: Offset(dx, 0),
                                child: child,
                              ),
                            );
                          },
                          child: Container(
                            width: M3Spacings.s48,
                            height: M3Spacings.s48,
                            decoration: M3BoxDecoration(
                              color: cs.primaryContainer,
                              borderRadius: M3BorderRadius.full,
                              border: M3Border.thin(cs.outline),
                            ),
                            child: Icon(
                              Icons.drag_indicator,
                              size: M3IconSizes.dense,
                              color: cs.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const M3Gap(M3Spacings.s8),
            Text(
              _lastVelocity == 0
                  ? 'No gesture yet — fling the knob to hand a velocity over.'
                  : 'Released at ${_lastVelocity.toStringAsFixed(0)} dp/s.',
              style: M3TypeScale.labelSmall.copyWith(
                color: cs.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
