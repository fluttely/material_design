// The layout pieces: the page a slide sits on, and the four blocks slides are
// built out of.
// ignore_for_file: experimental_member_use
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

import 'motion.dart';

/// The page every slide sits on: a generous margin, a capped content width,
/// and a staggered entrance for everything inside it.
///
/// Slides hand it a flat list of children and never think about choreography.
class SlideFrame extends StatelessWidget {
  const SlideFrame({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // Centred when it fits, scrollable when it does not. A projector at an
    // unexpected aspect ratio should cost a scroll, never a red overflow
    // stripe in front of the room.
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: M3LayoutWidths.ultraWide,
              ),
              child: M3Padding(
                padding: const M3EdgeInsets.symmetric(
                  horizontal: M3Spacings.s64,
                  vertical: M3Spacings.s48,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: _staggered(children),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Gaps are not revealed: animating empty space costs a frame and buys
  /// nothing, and skipping them keeps the stagger counting *content*.
  static List<Widget> _staggered(List<Widget> children) {
    var step = 0;
    return [
      for (final child in children)
        if (child is M3Gap) child else Reveal(step: step++, child: child),
    ];
  }
}

/// A labelled column, used for side-by-side comparisons. Wrap a row of them
/// in an [IntrinsicHeight] so the borders line up.
class Panel extends StatelessWidget {
  const Panel({
    required this.title,
    required this.children,
    this.accent,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final Color? accent;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = accent ?? scheme.outlineVariant;
    return Expanded(
      child: Container(
        padding: const M3EdgeInsets.all(M3Spacings.s24),
        decoration: M3BoxDecoration(
          color: scheme.surfaceAtElevation(M3Elevation.level1),
          borderRadius: M3BorderRadius.large,
          border:
              M3Border.all(outlineColor: color, width: M3BorderWidths.thick),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: M3TypeScale.titleLarge.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
            ),
            const M3Gap(M3Spacings.s16),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// The same rule, written for three different repositories.
///
/// This is what makes a pattern portable: a rule nobody can picture in their
/// own codebase is a rule nobody writes on Monday. Entries are
/// `(stack, rule)` and stay one or two lines — they are read from the back
/// of the room.
class StackRow extends StatelessWidget {
  const StackRow(this.entries, {super.key});

  final List<(String, String)> entries;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final (index, (stack, rule)) in entries.indexed) ...[
            if (index > 0) const M3Gap(M3Spacings.s16),
            Expanded(child: _StackCard(stack: stack, rule: rule)),
          ],
        ],
      ),
    );
  }
}

class _StackCard extends StatelessWidget {
  const _StackCard({required this.stack, required this.rule});

  final String stack;
  final String rule;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const M3EdgeInsets.all(M3Spacings.s16),
      decoration: M3BoxDecoration(
        color: scheme.surfaceAtElevation(M3Elevation.level1),
        borderRadius: M3BorderRadius.medium,
        border: M3Border.all(outlineColor: scheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            stack.toUpperCase(),
            style: M3TypeScale.labelLarge.copyWith(
              color: scheme.tertiary,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.6,
            ),
          ),
          const M3Gap(M3Spacings.s8),
          Text(
            rule,
            style: M3TypeScale.titleLarge.copyWith(
              color: scheme.onSurface,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

/// Big number + caption. Numeric values count up on a spring when revealed;
/// a number that lands is a number the room actually reads.
class Stat extends StatefulWidget {
  const Stat({
    required this.value,
    required this.caption,
    this.color,
    super.key,
  });

  final String value;
  final String caption;
  final Color? color;

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: M3Motion.emphasized.duration * 2,
  );

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 220), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final target = int.tryParse(widget.value);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final t = M3Motion.emphasized.curve.transform(_controller.value);
              final shown = target == null
                  ? widget.value
                  : (target * t).round().toString();
              return Text(
                shown,
                style: M3EmphasizedTypeScale.displayMedium.copyWith(
                  color: widget.color ?? scheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              );
            },
          ),
          const M3Gap(M3Spacings.s8),
          Text(
            widget.caption,
            style: M3TypeScale.bodyLarge.copyWith(
              color: scheme.onSurfaceVariant,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

/// Two-column table: what a framework gives you, next to what it maps to.
class MapTable extends StatelessWidget {
  const MapTable({
    required this.left,
    required this.right,
    required this.rows,
    super.key,
  });

  final String left;
  final String right;
  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    Widget cell(String text, {bool header = false, bool mono = false}) => Text(
          text,
          style: (header ? M3TypeScale.titleMedium : M3TypeScale.titleLarge)
              .copyWith(
            color: header ? scheme.primary : scheme.onSurfaceVariant,
            fontWeight: header ? FontWeight.w700 : FontWeight.w400,
            fontFamily: mono ? 'monospace' : null,
            height: 1.4,
          ),
        );

    return Table(
      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(1.25)},
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      border: TableBorder(
        horizontalInside: BorderSide(color: scheme.outlineVariant),
      ),
      children: [
        TableRow(
          children: [
            M3Padding(
              padding: const M3EdgeInsets.only(bottom: M3Spacings.s12),
              child: cell(left, header: true),
            ),
            M3Padding(
              padding: const M3EdgeInsets.only(bottom: M3Spacings.s12),
              child: cell(right, header: true),
            ),
          ],
        ),
        for (final (a, b) in rows)
          TableRow(
            children: [
              M3Padding(
                padding: const M3EdgeInsets.symmetric(
                  vertical: M3Spacings.s12,
                ),
                child: cell(a),
              ),
              M3Padding(
                padding: const M3EdgeInsets.symmetric(
                  vertical: M3Spacings.s12,
                ),
                child: cell(b, mono: true),
              ),
            ],
          ),
      ],
    );
  }
}
