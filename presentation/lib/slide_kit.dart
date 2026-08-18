// Reusable slide furniture. Everything measurable here is an M3 token — the
// deck models the contract it is about.
//
// The motion is M3 Expressive: real spring simulations rather than durations,
// and the ambient shapes are morphed by the package's own polygon engine.
// ignore_for_file: experimental_member_use
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// A slide is just a builder plus the label shown in the speaker footer.
class Slide {
  const Slide({required this.section, required this.build});

  final String section;
  final WidgetBuilder build;
}

/// Semantic colours for the deck's one running argument: context that rots
/// versus context a machine enforces.
extension DeckColors on ColorScheme {
  Color get rots => brightness == Brightness.dark
      ? const Color(0xFFFFB4A8)
      : const Color(0xFFB3261E);
  Color get enforced => brightness == Brightness.dark
      ? const Color(0xFF7BDCA0)
      : const Color(0xFF1E6B3C);
}

/// Animates one element into place on a spring, after [step] × 60 ms.
///
/// `expressiveSpatialFast` is the bounciest token Material ships (damping 0.6)
/// — it overshoots, which is the whole point of the Expressive scheme. Opacity
/// is clamped because a spring goes past 1 and colour channels do not.
class Reveal extends StatefulWidget {
  const Reveal({
    required this.child,
    this.step = 0,
    this.spring = M3ESpring.expressiveSpatialFast,
    this.rise = M3Spacings.s24,
    super.key,
  });

  final Widget child;
  final int step;
  final M3ESpring spring;
  final double rise;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController.unbounded(
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(
      Duration(milliseconds: 60 * widget.step),
      () {
        if (!mounted) return;
        _controller.animateWith(widget.spring.simulation(start: 0, end: 1));
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        return Opacity(
          opacity: t.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, (1 - t) * widget.rise),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

/// The page every slide sits on: a generous margin, a max content width, and
/// a staggered entrance for everything inside it.
///
/// Slides hand it a plain `Column`; the frame wraps each child in a [Reveal]
/// so no slide has to think about choreography. Gaps are skipped — animating
/// empty space costs a frame and buys nothing, and skipping them keeps the
/// stagger counting *content*.
class SlideFrame extends StatelessWidget {
  const SlideFrame({required this.child, this.align, super.key});

  final Widget child;
  final CrossAxisAlignment? align;

  @override
  Widget build(BuildContext context) {
    final content = child;

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
                  crossAxisAlignment: align ?? CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (content is Column) _staggered(content) else content,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _staggered(Column column) {
    var step = 0;
    return Column(
      crossAxisAlignment: column.crossAxisAlignment,
      mainAxisAlignment: column.mainAxisAlignment,
      mainAxisSize: column.mainAxisSize,
      children: [
        for (final child in column.children)
          if (child is M3Gap) child else Reveal(step: step++, child: child),
      ],
    );
  }
}

/// The ambient layer: a soft wash plus three Expressive polygons that rotate
/// and morph behind the content.
///
/// Every frame of the morph runs `M3EMorph` on the real polygons — the same
/// engine the package ships — so the outline itself travels between shapes
/// instead of crossfading.
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

/// Small caps label above a heading — orients the room without stealing focus.
class Kicker extends StatelessWidget {
  const Kicker(this.text, {this.color, super.key});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Text(
      text.toUpperCase(),
      style: M3TypeScale.titleSmall.copyWith(
        color: color ?? scheme.primary,
        letterSpacing: 2.4,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading(this.text, {this.color, super.key});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // The Expressive scale is tighter and heavier than the standard one —
    // built for exactly this: a headline that has to carry a room.
    return Text(
      text,
      style: M3EmphasizedTypeScale.displaySmall.copyWith(
        color: color ?? scheme.onSurface,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body(this.text, {this.color, this.emphasis = false, super.key});

  final String text;
  final Color? color;
  final bool emphasis;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Text(
      text,
      style: M3TypeScale.headlineSmall.copyWith(
        color: color ?? scheme.onSurfaceVariant,
        fontWeight: emphasis ? FontWeight.w600 : FontWeight.w400,
        height: 1.45,
      ),
    );
  }
}

/// A quotation lifted verbatim from the repository, with its source.
class RepoQuote extends StatelessWidget {
  const RepoQuote({required this.quote, required this.source, super.key});

  final String quote;
  final String source;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const M3EdgeInsets.all(M3Spacings.s24),
      decoration: M3BoxDecoration(
        color: scheme.surfaceAtElevation(M3Elevation.level1),
        borderRadius: M3BorderRadius.large,
        border: M3Border.all(outlineColor: scheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            quote,
            style: M3TypeScale.titleLarge.copyWith(
              color: scheme.onSurface,
              height: 1.4,
              fontStyle: FontStyle.italic,
            ),
          ),
          const M3Gap(M3Spacings.s12),
          Text(
            source,
            style: M3TypeScale.labelLarge.copyWith(
              color: scheme.onSurfaceVariant,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

/// Monospaced block for code and terminal output.
class CodeBlock extends StatelessWidget {
  const CodeBlock(this.text, {this.tint, super.key});

  final String text;
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const M3EdgeInsets.all(M3Spacings.s20),
      decoration: M3BoxDecoration(
        color: scheme.surfaceAtElevation(M3Elevation.level2),
        borderRadius: M3BorderRadius.medium,
        border: M3Border.all(outlineColor: tint ?? scheme.outlineVariant),
      ),
      child: Text(
        text,
        style: M3TypeScale.titleMedium.copyWith(
          fontFamily: 'monospace',
          color: tint ?? scheme.onSurface,
          height: 1.55,
        ),
      ),
    );
  }
}

/// A labelled column used for side-by-side comparisons.
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

/// One line of a ✗ / ✓ contrast: a big marker, the text beside it.
///
/// Framework-agnostic on purpose — the example belongs to whoever is watching.
class VersusLine extends StatelessWidget {
  const VersusLine({
    required this.marker,
    required this.text,
    required this.color,
    this.mono = false,
    super.key,
  });

  final String marker;
  final String text;
  final Color color;
  final bool mono;

  @override
  Widget build(BuildContext context) {
    return M3Padding(
      padding: const M3EdgeInsets.only(bottom: M3Spacings.s20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: M3Spacings.s48,
            child: Text(
              marker,
              style: M3TypeScale.headlineMedium.copyWith(
                color: color,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: M3TypeScale.headlineSmall.copyWith(
                color: color,
                height: 1.4,
                fontFamily: mono ? 'monospace' : null,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The takeaway line under a ✗ / ✓ contrast.
class Lesson extends StatelessWidget {
  const Lesson(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: M3Spacings.s48,
          child: Text(
            '→',
            style: M3TypeScale.headlineMedium.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: M3TypeScale.headlineSmall.copyWith(
              color: scheme.onSurface,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

/// A bulleted line with a leading marker.
class Bullet extends StatelessWidget {
  const Bullet(this.text, {this.marker = '—', this.color, super.key});

  final String text;
  final String marker;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return M3Padding(
      padding: const M3EdgeInsets.only(bottom: M3Spacings.s12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            marker,
            style: M3TypeScale.titleLarge.copyWith(
              color: color ?? scheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const M3Gap(M3Spacings.s12),
          Expanded(
            child: Text(
              text,
              style: M3TypeScale.titleLarge.copyWith(
                color: scheme.onSurfaceVariant,
                height: 1.4,
              ),
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

/// Two-column table used for the BMAD ↔ repository mapping.
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
          style: (header ? M3TypeScale.titleMedium : M3TypeScale.bodyLarge)
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
