// The text pieces every slide is written with. Sizes come from the M3 type
// scale; nothing here picks a font size by hand.
// ignore_for_file: experimental_member_use
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

import '../open_link.dart';

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

/// The one sentence the slide is about.
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

/// Running text. [emphasis] is for the line the slide lands on.
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

/// Running text with one clickable segment, opened via [openLink].
class BodyLink extends StatefulWidget {
  const BodyLink({
    required this.before,
    required this.link,
    required this.url,
    this.after = '',
    super.key,
  });

  final String before;
  final String link;
  final String after;
  final String url;

  @override
  State<BodyLink> createState() => _BodyLinkState();
}

class _BodyLinkState extends State<BodyLink> {
  late final _recognizer = TapGestureRecognizer()
    ..onTap = () => openLink(widget.url);

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final style = M3TypeScale.headlineSmall.copyWith(
      color: scheme.onSurfaceVariant,
      height: 1.45,
    );
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: widget.before, style: style),
          TextSpan(
            text: widget.link,
            style: style.copyWith(
              color: scheme.primary,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: scheme.primary,
            ),
            recognizer: _recognizer,
            mouseCursor: SystemMouseCursors.click,
          ),
          TextSpan(text: widget.after, style: style),
        ],
      ),
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

/// Monospaced block for code, rules files and terminal output.
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
        style: M3TypeScale.titleLarge.copyWith(
          fontFamily: 'monospace',
          color: tint ?? scheme.onSurface,
          height: 1.55,
        ),
      ),
    );
  }
}

/// One line of a ✗ / ✓ contrast: a big marker, the text beside it.
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
    return VersusRow(
      marker: marker,
      color: color,
      child: Text(
        text,
        style: M3TypeScale.headlineSmall.copyWith(
          color: color,
          height: 1.4,
          fontFamily: mono ? 'monospace' : null,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// The same ✗ / ✓ slot, holding anything — a diagram, a chart, a box.
class VersusRow extends StatelessWidget {
  const VersusRow({
    required this.marker,
    required this.color,
    required this.child,
    super.key,
  });

  final String marker;
  final Color color;
  final Widget child;

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
          Expanded(child: child),
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
