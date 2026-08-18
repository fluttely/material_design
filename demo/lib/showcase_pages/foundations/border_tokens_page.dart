import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';

/// The Visual half of the Border destination.
///
/// Sections mirror the Code half so switching modes never reshuffles the
/// subject: the width scale, the side, the border, the decoration that carries
/// it, and the focus indicator that deliberately sits off the scale.
class BorderTokensPage extends StatelessWidget {
  const BorderTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Border')),
      body: ListView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        children: const [
          _BorderWidthsSection(),
          M3Gap(M3Spacings.s32),
          _BorderSideSection(),
          M3Gap(M3Spacings.s32),
          _BorderSection(),
          M3Gap(M3Spacings.s32),
          _DecorationSection(),
          M3Gap(M3Spacings.s32),
          _FocusIndicatorSection(),
        ],
      ),
    );
  }
}

/// Intro copy under a section caption.
class _Note extends StatelessWidget {
  const _Note(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

/// A labelled sample: the caption names the call that drew the box above it.
class _Sample extends StatelessWidget {
  const _Sample({required this.caption, required this.child});

  final String caption;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: M3Spacings.s128 + M3Spacings.s32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: M3Spacings.s72, child: child),
          const M3Gap(M3Spacings.s8),
          Text(
            caption,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// The whole four-step width scale, driven by `M3BorderWidths.values` so the
/// page cannot fall behind the scale it documents.
class _BorderWidthsSection extends StatelessWidget {
  const _BorderWidthsSection();

  static const _names = <String>['none', 'thin', 'thick', 'extraThick'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShowcaseLink(
          label: 'M3BorderWidths',
          url: 'https://m3.material.io/styles/shape/overview',
        ),
        const _Note(
          'Four widths, and nothing between them. An outline is 0, 1, 2 or '
          '4dp — the weight carries the emphasis, so 1dp reads as an ordinary '
          'boundary and 4dp as a critical one.',
        ),
        const M3Gap(M3Spacings.s16),
        for (final (index, width) in M3BorderWidths.values.indexed)
          _WidthRow(name: _names[index], width: width),
      ],
    );
  }
}

/// One width, shown twice: as the stroke itself, and as an outline around a box.
class _WidthRow extends StatelessWidget {
  const _WidthRow({required this.name, required this.width});

  final String name;
  final M3BorderWidthValue width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isNone = width == M3BorderWidths.none;

    return M3Padding(
      padding: const M3EdgeInsets.only(bottom: M3Spacings.s12),
      child: Row(
        children: [
          SizedBox(
            width: M3Spacings.s128,
            child: Text(name, style: theme.textTheme.labelLarge),
          ),
          SizedBox(
            width: M3Spacings.s48,
            child: Text(
              '${width.toInt()}dp',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const M3Gap(M3Spacings.s16),
          // The stroke at its true thickness.
          Expanded(
            child: SizedBox(
              height: M3Spacings.s24,
              child: Center(
                child: isNone
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'BorderStyle.none — nothing is painted',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : Container(height: width, color: colorScheme.outline),
              ),
            ),
          ),
          const M3Gap(M3Spacings.s16),
          // The same width read as an outline, which is how it is usually met.
          Container(
            width: M3Spacings.s96,
            height: M3Spacings.s40,
            decoration: M3BoxDecoration(
              borderRadius: M3BorderRadius.small,
              border: M3Border.all(
                outlineColor: colorScheme.outline,
                width: width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The side: width is a token, colour is a scheme role.
class _BorderSideSection extends StatelessWidget {
  const _BorderSideSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget box(M3BorderSide side) => Container(
          decoration: M3BoxDecoration(
            borderRadius: M3BorderRadius.medium,
            border: M3Border.fromBorderSide(side),
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShowcaseLink(
          label: 'M3BorderSide',
          url: 'https://m3.material.io/styles/color/roles',
        ),
        const _Note(
          'A named constructor takes only the colour, because the width is '
          'already decided by which one you called. The colour stays a scheme '
          'role — outline for a boundary, primary for selection, error for a '
          'failure — so the same weight speaks in whatever the theme is.',
        ),
        const M3Gap(M3Spacings.s16),
        Wrap(
          spacing: M3Spacings.s16,
          runSpacing: M3Spacings.s16,
          children: [
            _Sample(
              caption: 'M3BorderSide.thin(outline)',
              child: box(M3BorderSide.thin(colorScheme.outline)),
            ),
            _Sample(
              caption: 'M3BorderSide.thin(outlineVariant)',
              child: box(M3BorderSide.thin(colorScheme.outlineVariant)),
            ),
            _Sample(
              caption: 'M3BorderSide.thick(primary)',
              child: box(M3BorderSide.thick(colorScheme.primary)),
            ),
            _Sample(
              caption: 'M3BorderSide.extraThick(error)',
              child: box(M3BorderSide.extraThick(colorScheme.error)),
            ),
            _Sample(
              caption: 'M3BorderSide.none',
              child: Container(
                decoration: M3BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: M3BorderRadius.medium,
                  border: const M3Border.fromBorderSide(M3BorderSide.none),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// The border: all four sides, or exactly the ones you name.
class _BorderSection extends StatelessWidget {
  const _BorderSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget box(M3Border border, {Color? fill}) => Container(
          decoration: M3BoxDecoration(
            color: fill,
            border: border,
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShowcaseLink(
          label: 'M3Border',
          url: 'https://m3.material.io/styles/shape/overview',
        ),
        const _Note(
          'The default constructor leaves every side at M3BorderSide.none, so '
          'a divider-like edge or a leading accent names just the side it '
          'wants. The .all / .thin / .thick / .extraThick constructors are the '
          'shorthand for the common case. These samples are square because '
          'Flutter only rounds a border whose four sides match — a one-sided '
          'border and a corner radius cannot be drawn together.',
        ),
        const M3Gap(M3Spacings.s16),
        Wrap(
          spacing: M3Spacings.s16,
          runSpacing: M3Spacings.s16,
          children: [
            _Sample(
              caption: 'M3Border.thin(outline)',
              child: box(M3Border.thin(colorScheme.outline)),
            ),
            _Sample(
              caption: 'M3Border.thick(primary)',
              child: box(M3Border.thick(colorScheme.primary)),
            ),
            _Sample(
              caption: 'M3Border.extraThick(error)',
              child: box(M3Border.extraThick(colorScheme.error)),
            ),
            _Sample(
              caption: 'M3Border(bottom: thin) — a list row',
              child: box(
                M3Border(bottom: M3BorderSide.thin(colorScheme.outlineVariant)),
              ),
            ),
            _Sample(
              caption: 'M3Border(left: extraThick) — an accent',
              child: box(
                M3Border(left: M3BorderSide.extraThick(colorScheme.primary)),
                fill: colorScheme.surfaceContainer,
              ),
            ),
            _Sample(
              caption: 'M3Border.none',
              child: box(M3Border.none, fill: colorScheme.surfaceContainer),
            ),
          ],
        ),
      ],
    );
  }
}

/// The decoration that carries a border, alongside the corner scale it meets.
class _DecorationSection extends StatelessWidget {
  const _DecorationSection();

  static const _radii = <(String, M3BorderRadius)>[
    ('none', M3BorderRadius.none),
    ('extraSmall', M3BorderRadius.extraSmall),
    ('small', M3BorderRadius.small),
    ('medium', M3BorderRadius.medium),
    ('large', M3BorderRadius.large),
    ('extraLarge', M3BorderRadius.extraLarge),
    ('full', M3BorderRadius.full),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShowcaseLink(
          label: 'M3BoxDecoration',
          url: 'https://m3.material.io/styles/shape/shape-scale-tokens',
        ),
        const _Note(
          'M3BoxDecoration takes an M3Border and an M3BorderRadius, so a '
          'decoration cannot be half tokenized — the outline and the corner it '
          'turns are both on scale. Each box below is a 1dp outline read '
          'against one step of the shape scale.',
        ),
        const M3Gap(M3Spacings.s16),
        Wrap(
          spacing: M3Spacings.s12,
          runSpacing: M3Spacings.s12,
          children: [
            for (final (name, radius) in _radii)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: M3Spacings.s96,
                    height: M3Spacings.s56,
                    decoration: M3BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: radius,
                      border: M3Border.thin(colorScheme.outline),
                    ),
                  ),
                  const M3Gap(M3Spacings.s8),
                  SizedBox(
                    width: M3Spacings.s96,
                    child: Text(
                      name,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

/// The focus ring, which is 3dp on purpose and therefore not on the scale.
class _FocusIndicatorSection extends StatelessWidget {
  const _FocusIndicatorSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShowcaseLink(
          label: 'M3FocusIndicator',
          url:
              'https://m3.material.io/foundations/interaction/states/state-layers',
        ),
        const _Note(
          'The focus ring sits on its own scale: 3dp thick at a 3dp offset. '
          'That 3dp is deliberately not a member of M3BorderWidths — a focus '
          'ring is an accessibility affordance, not a component outline, and '
          'keeping it separate stops 3dp leaking into ordinary borders.',
        ),
        const M3Gap(M3Spacings.s16),
        Wrap(
          spacing: M3Spacings.s32,
          runSpacing: M3Spacings.s24,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // The anatomy, drawn statically so it is readable without focus.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const M3EdgeInsets.all(M3FocusIndicator.offset),
                  decoration: M3BoxDecoration(
                    borderRadius: M3BorderRadius.large,
                    border: M3Border.all(
                      outlineColor: colorScheme.secondary,
                      width: M3FocusIndicator.thickness,
                    ),
                  ),
                  child: Container(
                    width: M3Spacings.s128,
                    height: M3Spacings.s48,
                    alignment: Alignment.center,
                    decoration: M3BoxDecoration(
                      color: colorScheme.surfaceContainer,
                      borderRadius: M3BorderRadius.medium,
                      border: M3Border.thin(colorScheme.outline),
                    ),
                    child: Text(
                      '1dp outline',
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                ),
                const M3Gap(M3Spacings.s8),
                Text(
                  'thickness 3dp · offset 3dp',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            // The real thing: M3FocusRing already reads these tokens.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                M3FocusRing(
                  borderRadius: M3BorderRadius.full,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Tab to me'),
                  ),
                ),
                const M3Gap(M3Spacings.s8),
                Text(
                  'M3FocusRing, at the token defaults',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
