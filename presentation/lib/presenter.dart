// The second screen — the one the room never sees.
//
// Deliberately unanimated and deliberately plain. The audience deck gets the
// springs and the morphing polygons; this one has to be readable in a glance
// by someone who just lost their place, so nothing here moves, fades, or
// staggers.
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

import 'notes.dart';
import 'slide_kit.dart';
import 'slides.dart';

/// How many pages presenter mode has: one per slide, then the Q&A cards.
int get presenterPageCount => deck.length + faq.length;

class PresenterView extends StatelessWidget {
  const PresenterView({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ColoredBox(
      color: scheme.surface,
      child: index < deck.length
          ? _NotesPage(index: index)
          : _FaqPage(index: index - deck.length),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Notes for one slide
// ─────────────────────────────────────────────────────────────────────────

class _NotesPage extends StatelessWidget {
  const _NotesPage({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final note = speakerNotes[index];
    final next = index + 1 < deck.length
        ? speakerNotes[index + 1].title
        : 'Perguntas frequentes';

    return SingleChildScrollView(
      child: M3Padding(
        padding: const M3EdgeInsets.all(M3Spacings.s32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              clock: note.clock,
              position: '${index + 1} / ${deck.length}',
              section: deck[index].section,
            ),
            const M3Gap(M3Spacings.s16),
            Text(
              note.title,
              style: M3TypeScale.headlineMedium.copyWith(
                color: scheme.onSurface,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            const M3Gap(M3Spacings.s24),
            _Callout(
              label: 'FALE',
              text: note.opening,
              color: scheme.primary,
            ),
            if (note.warning != null) ...[
              const M3Gap(M3Spacings.s16),
              _Callout(
                label: 'ATENÇÃO',
                text: note.warning!,
                color: scheme.rots,
              ),
            ],
            const M3Gap(M3Spacings.s24),
            const _SectionLabel('Tópicos'),
            const M3Gap(M3Spacings.s12),
            for (final (i, beat) in note.beats.indexed)
              _Beat(number: i + 1, text: beat),
            if (note.glossary.isNotEmpty) ...[
              const M3Gap(M3Spacings.s24),
              const _SectionLabel('Se perguntarem o que significa'),
              const M3Gap(M3Spacings.s12),
              for (final (term, meaning) in note.glossary)
                _GlossaryRow(term: term, meaning: meaning),
            ],
            if (note.bridge != null) ...[
              const M3Gap(M3Spacings.s24),
              _Callout(
                label: 'PONTE',
                text: note.bridge!,
                color: scheme.enforced,
              ),
            ],
            const M3Gap(M3Spacings.s24),
            Text(
              'A seguir  →  $next',
              style: M3TypeScale.titleMedium.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Q&A
// ─────────────────────────────────────────────────────────────────────────

class _FaqPage extends StatelessWidget {
  const _FaqPage({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final card = faq[index];

    return SingleChildScrollView(
      child: M3Padding(
        padding: const M3EdgeInsets.all(M3Spacings.s32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              clock: 'Q&A',
              position: '${index + 1} / ${faq.length}',
              section: 'Perguntas prováveis',
            ),
            const M3Gap(M3Spacings.s24),
            Text(
              card.question,
              style: M3TypeScale.headlineMedium.copyWith(
                color: scheme.onSurface,
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            const M3Gap(M3Spacings.s24),
            _Callout(
              label: 'RESPONDA',
              text: card.answer,
              color: scheme.enforced,
            ),
            const M3Gap(M3Spacings.s24),
            Text(
              index + 1 < faq.length
                  ? 'A seguir  →  ${faq[index + 1].question}'
                  : 'Última. ← volta para os slides.',
              style: M3TypeScale.titleMedium.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Pieces
// ─────────────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header({
    required this.clock,
    required this.position,
    required this.section,
  });

  final String clock;
  final String position;
  final String section;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const M3EdgeInsets.symmetric(
            horizontal: M3Spacings.s16,
            vertical: M3Spacings.s8,
          ),
          decoration: M3BoxDecoration(
            color: scheme.primaryContainer,
            borderRadius: M3BorderRadius.full,
          ),
          child: Text(
            clock,
            style: M3TypeScale.titleMedium.copyWith(
              color: scheme.onPrimaryContainer,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const M3Gap(M3Spacings.s16),
        Expanded(
          child: Text(
            section.toUpperCase(),
            style: M3TypeScale.labelLarge.copyWith(
              color: scheme.onSurfaceVariant,
              letterSpacing: 1.6,
            ),
          ),
        ),
        Text(
          position,
          style: M3TypeScale.titleMedium.copyWith(
            color: scheme.onSurfaceVariant,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }
}

/// A labelled box. `FALE` is what you say, `ATENÇÃO` is about delivery,
/// `PONTE` is the handoff to the next slide.
class _Callout extends StatelessWidget {
  const _Callout({
    required this.label,
    required this.text,
    required this.color,
  });

  final String label;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const M3EdgeInsets.all(M3Spacings.s20),
      decoration: M3BoxDecoration(
        color: scheme.surfaceAtElevation(M3Elevation.level1),
        borderRadius: M3BorderRadius.medium,
        border: M3Border.all(outlineColor: color, width: M3BorderWidths.thick),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: M3TypeScale.labelLarge.copyWith(
              color: color,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.8,
            ),
          ),
          const M3Gap(M3Spacings.s8),
          Text(
            text,
            style: M3TypeScale.headlineSmall.copyWith(
              color: scheme.onSurface,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Text(
      text.toUpperCase(),
      style: M3TypeScale.labelLarge.copyWith(
        color: scheme.primary,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.8,
      ),
    );
  }
}

class _Beat extends StatelessWidget {
  const _Beat({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return M3Padding(
      padding: const M3EdgeInsets.only(bottom: M3Spacings.s12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: M3Spacings.s32,
            child: Text(
              '$number.',
              style: M3TypeScale.titleLarge.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.w700,
                fontFamily: 'monospace',
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: M3TypeScale.titleLarge.copyWith(
                color: scheme.onSurface,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlossaryRow extends StatelessWidget {
  const _GlossaryRow({required this.term, required this.meaning});

  final String term;
  final String meaning;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return M3Padding(
      padding: const M3EdgeInsets.only(bottom: M3Spacings.s12),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$term — ',
              style: M3TypeScale.titleLarge.copyWith(
                color: scheme.tertiary,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: meaning,
              style: M3TypeScale.titleLarge.copyWith(
                color: scheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
