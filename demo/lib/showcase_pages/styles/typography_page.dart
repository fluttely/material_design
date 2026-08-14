// ignore_for_file: experimental_member_use
// M3EmphasizedTypeScale is @experimental and showcasing it is this page's job.

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

/// Display names for the 15 roles, index-aligned with [M3TypeScale.values]
/// and [M3EmphasizedTypeScale.values].
const _roleNames = <String>[
  'Display Large',
  'Display Medium',
  'Display Small',
  'Headline Large',
  'Headline Medium',
  'Headline Small',
  'Title Large',
  'Title Medium',
  'Title Small',
  'Body Large',
  'Body Medium',
  'Body Small',
  'Label Large',
  'Label Medium',
  'Label Small',
];

/// Formats a token value for display, dropping trailing zeros so that
/// `57.0` reads as `57` and `-0.25` stays `-0.25`.
String _format(double value) {
  return value.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0+$'), '');
}

String _weight(TextStyle style) =>
    'w${(style.fontWeight ?? FontWeight.w400).value}';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Type Scale')),
      body: Column(
        children: [
          M3Padding(
            padding: M3EdgeInsets.only(left: M3Spacings.s12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: LaunchURLText(
                label: 'M3TypeScale',
                url:
                    'https://m3.material.io/styles/typography/type-scale-tokens',
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: M3EdgeInsets.all(M3Spacings.s16),
              children: [
                const _EmphasisNote(),
                const M3Gap(M3Spacings.s24),
                Text('Baseline vs Emphasized', style: textTheme.titleLarge),
                const M3Gap(M3Spacings.s4),
                Text(
                  'Every role, side by side. Scroll a specimen sideways on a '
                  'narrow window — neither column is ever clipped or resized.',
                  style: textTheme.bodyMedium,
                ),
                const M3Gap(M3Spacings.s16),
                for (var index = 0; index < M3TypeScale.values.length; index++)
                  _RoleComparison(index: index),
                const M3Gap(M3Spacings.s8),
                Text('Emphasis in place', style: textTheme.titleLarge),
                const M3Gap(M3Spacings.s4),
                Text(
                  'Tap a row. The selected one swaps to '
                  'M3EmphasizedTypeScale.of(M3TypeScale.bodyLarge) and nothing '
                  'else moves: same size, same line height, same row bounds.',
                  style: textTheme.bodyMedium,
                ),
                const M3Gap(M3Spacings.s16),
                const _EmphasisSelectionDemo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Explains what the emphasized scale is for, before the specimens.
class _EmphasisNote extends StatelessWidget {
  const _EmphasisNote();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: M3BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: M3BorderRadius.large,
      ),
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emphasis is a token, not a copyWith',
              style: textTheme.titleMedium,
            ),
            const M3Gap(M3Spacings.s8),
            Text(
              'M3 Expressive makes emphasis part of the type system. Instead '
              'of improvising with copyWith(fontWeight: ...) at the call '
              'site, each of the 15 roles has a companion style that the spec '
              'already tuned: regular roles step 400 → 500, roles that are '
              'already medium step 500 → 700, and tracking is adjusted where '
              'the heavier weight needs it.',
              style: textTheme.bodyMedium,
            ),
            const M3Gap(M3Spacings.s8),
            Text(
              'Size and line height never change, so an emphasized style is a '
              'drop-in that cannot reflow a layout. Spend it on the one '
              'element in a view that has to win — a hero headline, the '
              'selected list item, the primary action — because emphasis '
              'applied everywhere is emphasis nowhere.',
              style: textTheme.bodyMedium,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: LaunchURLText(
                label: 'M3EmphasizedTypeScale',
                url:
                    'https://m3.material.io/styles/typography/type-scale-tokens',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// One role: its metrics, then the baseline and emphasized specimens sharing
/// a horizontally scrollable row.
class _RoleComparison extends StatelessWidget {
  const _RoleComparison({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final name = _roleNames[index];
    final baseline = M3TypeScale.values[index];
    final emphasized = M3EmphasizedTypeScale.values[index];

    // Read straight off the TextStyle objects: both roles share these.
    final fontSize = baseline.fontSize ?? 0;
    final lineHeight = fontSize * (baseline.height ?? 1);
    final baselineTracking = baseline.letterSpacing ?? 0;
    final emphasizedTracking = emphasized.letterSpacing ?? 0;

    final metrics = StringBuffer()
      ..write('${_format(fontSize)}sp')
      ..write('  ·  line height ${_format(lineHeight)}dp')
      ..write('  ·  ${_weight(baseline)} → ${_weight(emphasized)}');
    if (baselineTracking != emphasizedTracking) {
      metrics.write(
        '  ·  tracking ${_format(baselineTracking)} → '
        '${_format(emphasizedTracking)}',
      );
    }

    return Card(
      margin: M3EdgeInsets.only(bottom: M3Spacings.s16),
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: textTheme.titleMedium),
            const M3Gap(M3Spacings.s4),
            Text(
              metrics.toString(),
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const M3Gap(M3Spacings.s12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Specimen(label: 'baseline', text: name, style: baseline),
                  const M3Gap(M3Spacings.s32),
                  _Specimen(label: 'emphasized', text: name, style: emphasized),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A labelled sample of one style, rendered at its true size.
class _Specimen extends StatelessWidget {
  const _Specimen({
    required this.label,
    required this.text,
    required this.style,
  });

  final String label;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const M3Gap(M3Spacings.s4),
        Text(text, style: style, softWrap: false, maxLines: 1),
      ],
    );
  }
}

/// Four rows where only the selected one is emphasized, so the swap can be
/// watched for movement that never happens.
class _EmphasisSelectionDemo extends StatefulWidget {
  const _EmphasisSelectionDemo();

  @override
  State<_EmphasisSelectionDemo> createState() => _EmphasisSelectionDemoState();
}

class _EmphasisSelectionDemoState extends State<_EmphasisSelectionDemo> {
  static const _options = <String>[
    'Automatic',
    'Always on',
    'Only while charging',
    'Never',
  ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: M3EdgeInsets.only(bottom: M3Spacings.s16),
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s8),
        child: Column(
          children: [
            for (var index = 0; index < _options.length; index++)
              Ink(
                decoration: M3BoxDecoration(
                  color: index == _selectedIndex
                      ? colorScheme.secondaryContainer
                      : Colors.transparent,
                  borderRadius: M3BorderRadius.large,
                ),
                child: InkWell(
                  borderRadius: M3BorderRadius.large,
                  onTap: () => setState(() => _selectedIndex = index),
                  child: M3Padding(
                    padding: M3EdgeInsets.symmetric(
                      horizontal: M3Spacings.s16,
                      vertical: M3Spacings.s12,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          index == _selectedIndex
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: index == _selectedIndex
                              ? colorScheme.onSecondaryContainer
                              : colorScheme.onSurfaceVariant,
                        ),
                        const M3Gap(M3Spacings.s12),
                        Expanded(
                          child: Text(
                            _options[index],
                            style: index == _selectedIndex
                                ? M3EmphasizedTypeScale.of(
                                    M3TypeScale.bodyLarge,
                                  )
                                : M3TypeScale.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            M3Padding(
              padding: M3EdgeInsets.all(M3Spacings.s8),
              child: Text(
                'Selected row: M3EmphasizedTypeScale.of(M3TypeScale.bodyLarge)'
                ' — ${_weight(M3EmphasizedTypeScale.of(M3TypeScale.bodyLarge))}'
                ' instead of ${_weight(M3TypeScale.bodyLarge)}, at the same '
                '${_format(M3TypeScale.bodyLarge.fontSize ?? 0)}sp.',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
