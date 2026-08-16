import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';

/// The icon contract: the size scale, the four Material Symbols axes, and the
/// `IconThemeData` that types them all at once.
///
/// Only two of the four axes can be *shown* with the icon font Flutter bundles
/// (a static one). Rather than print seven identical glyphs under the labels
/// 100…700, this page renders what the font can render and presents the rest
/// as what they are: the scale, and the situation each value is for.
class IconTokensPage extends StatelessWidget {
  const IconTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icons')),
      body: ListView(
        padding: const M3EdgeInsets.all(M3Spacings.s16),
        children: const [
          _Intro(),
          M3Gap(M3Spacings.s16),
          _SizeSection(),
          _FillSection(),
          _WeightSection(),
          _GradeSection(),
          _StyleSection(),
        ],
      ),
    );
  }
}

/// What the page covers, and the one caveat that applies to all of it.
class _Intro extends StatelessWidget {
  const _Intro();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: M3Padding(
        padding: const M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Material Symbols is a variable font with four axes — size, '
              'weight, grade and fill — and Flutter passes all four as bare '
              'doubles. Each one has a scale here, so an icon is specified '
              'the same way a text style is.',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const M3Gap(M3Spacings.s12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline,
                  size: M3IconSizes.dense,
                  color: colorScheme.onPrimaryContainer,
                ),
                const M3Gap(M3Spacings.s8),
                Expanded(
                  child: Text(
                    'This demo ships the icon font that comes with Flutter, '
                    'which is static. Size and fill are shown for real below; '
                    'weight and grade are listed as the values to pass, and '
                    'come to life the moment an app loads the variable font.',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// `M3IconSizes` — the one axis that always renders.
class _SizeSection extends StatelessWidget {
  const _SizeSection();

  @override
  Widget build(BuildContext context) {
    return _Section(
      api: 'M3IconSizes',
      subtitle: 'Five sizes, 20 to 48dp. Optical size (opsz) tracks whichever '
          'one you pick, which is what keeps the stroke reading the same at '
          '20dp and at 48dp — M3IconStyle does that pairing for you.',
      child: Wrap(
        spacing: M3Spacings.s24,
        runSpacing: M3Spacings.s16,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          for (final size in M3IconSizes.values)
            _Sample(
              caption: '${size.toInt()}dp',
              child: Icon(
                Icons.directions_boat_filled,
                size: size,
                opticalSize: M3IconOpticalSizes.forIconSize(size),
              ),
            ),
        ],
      ),
    );
  }
}

/// `M3IconFills` — rendered with paired glyphs, which is how a static font
/// gets the same result.
class _FillSection extends StatelessWidget {
  const _FillSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _Section(
      api: 'M3IconFills',
      subtitle: 'Fill is a state, not a style: M3 marks the active navigation '
          'destination by moving from 0 to 1 on this axis instead of swapping '
          'in a different glyph. With a variable font that is an animation; '
          'with a static one — this demo, and the rail on the left — it is a '
          'pair of glyphs.',
      child: Wrap(
        spacing: M3Spacings.s24,
        runSpacing: M3Spacings.s16,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          _Sample(
            caption: 'unfilled · 0',
            child: Icon(
              Icons.star_outline,
              size: M3IconSizes.medium,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          _Sample(
            caption: 'filled · 1 — selected',
            child: Icon(
              Icons.star,
              size: M3IconSizes.medium,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

/// `M3IconWeights` — the values, with the concept shown on text, which *can*
/// carry a weight axis here.
class _WeightSection extends StatelessWidget {
  const _WeightSection();

  /// Every weight token with the name it carries and the case it is for.
  static const _weights = <(M3IconWeightValue, String, String)>[
    (
      M3IconWeights.thin,
      'thin',
      'display sizes, where thin strokes still read'
    ),
    (M3IconWeights.extraLight, 'extraLight', 'large icons on quiet surfaces'),
    (M3IconWeights.light, 'light', 'pairs with light text weights'),
    (
      M3IconWeights.regular,
      'regular',
      'the default — what Flutter assumes when weight is omitted',
    ),
    (M3IconWeights.medium, 'medium', 'pairs with M3 label and title styles'),
    (
      M3IconWeights.semiBold,
      'semiBold',
      'denser UI, or icons competing with bold text',
    ),
    (M3IconWeights.bold, 'bold', 'small icons that must stay legible'),
  ];

  @override
  Widget build(BuildContext context) {
    return _Section(
      api: 'M3IconWeights',
      subtitle: 'Weight changes stroke thickness without changing the icon\'s '
          'footprint, so nothing reflows when it moves. The specimen on each '
          'row is text, not an icon: it is the same axis, on the one font this '
          'demo can vary.',
      child: Column(
        children: [
          for (final (weight, name, usage) in _weights)
            _TokenRow(
              name: 'M3IconWeights.$name',
              value: weight.toInt().toString(),
              usage: usage,
              specimen: Text(
                'Aa',
                style: M3TypeScale.titleLarge.copyWith(
                  // The wght axis in 100 steps is exactly FontWeight's scale.
                  fontWeight: FontWeight.values[(weight ~/ 100) - 1],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// `M3IconGrades` — three values, each shown in the situation it exists for.
class _GradeSection extends StatelessWidget {
  const _GradeSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _Section(
      api: 'M3IconGrades',
      subtitle: 'Grade is weight\'s fine-grained sibling: it thickens or thins '
          'strokes without changing the icon\'s width at all, which makes it '
          'the axis for optical correction rather than restyling. Each value '
          'below is shown on the surface it exists for.',
      child: Column(
        children: [
          _GradeCase(
            name: 'M3IconGrades.onDark',
            value: '-25',
            usage: 'Light icons on a dark surface bloom optically; -25 pulls '
                'them back to the same apparent weight.',
            background: colorScheme.inverseSurface,
            foreground: colorScheme.onInverseSurface,
          ),
          _GradeCase(
            name: 'M3IconGrades.normal',
            value: '0',
            usage: 'The default: dark icons on a light surface.',
            background: colorScheme.surfaceContainerHighest,
            foreground: colorScheme.onSurface,
          ),
          _GradeCase(
            name: 'M3IconGrades.emphasis',
            value: '200',
            usage: 'For an icon that has to hold its own at a small size, or '
                'under a high-contrast setting.',
            background: colorScheme.surfaceContainerHighest,
            foreground: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

/// `M3IconStyle` — the presets, each with the axes it actually sets.
class _StyleSection extends StatelessWidget {
  const _StyleSection();

  static const _presets = <(String, M3IconStyle, String)>[
    ('standard', M3IconStyle.standard, 'the M3 default'),
    ('dense', M3IconStyle.dense, 'compact rows, chips, rails'),
    ('selected', M3IconStyle.selected, 'the active destination'),
    ('onDarkSurface', M3IconStyle.onDarkSurface, 'light icons on dark'),
    ('disabled', M3IconStyle.disabled, 'unavailable actions'),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _Section(
      api: 'M3IconStyle',
      subtitle: 'An IconThemeData whose every axis is a token, so a theme or a '
          'subtree is typed in one place. Colour stays out of it on purpose — '
          'that is a colour-scheme role, so use IconTheme.merge to restyle the '
          'axes and leave the inherited colour alone.',
      child: Column(
        children: [
          for (final (name, style, usage) in _presets)
            _PresetRow(
              name: 'M3IconStyle.$name',
              axes: _axisSummary(style),
              usage: usage,
              specimen: DecoratedBox(
                decoration: M3BoxDecoration(
                  color: name == 'onDarkSurface'
                      ? colorScheme.inverseSurface
                      : Colors.transparent,
                  borderRadius: M3BorderRadius.small,
                ),
                child: M3Padding(
                  padding: const M3EdgeInsets.all(M3Spacings.s4),
                  child: IconTheme.merge(
                    data: style,
                    child: Icon(
                      name == 'selected' ? Icons.bolt : Icons.bolt_outlined,
                      color: name == 'onDarkSurface'
                          ? colorScheme.onInverseSurface
                          : colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// The axes a preset sets, read back off the style itself.
  static String _axisSummary(M3IconStyle style) {
    final parts = <String>[
      '${style.size?.toInt()}dp',
      'wght ${style.weight?.toInt()}',
      'GRAD ${style.grade?.toInt()}',
      'FILL ${style.fill?.toInt()}',
      if (style.opacity != null) 'opacity ${(style.opacity! * 100).round()}%',
    ];
    return parts.join(' · ');
  }
}

/// A titled block: the API name (linking to the spec), why it exists, then the
/// samples.
class _Section extends StatelessWidget {
  const _Section({
    required this.api,
    required this.subtitle,
    required this.child,
  });

  final String api;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const M3EdgeInsets.only(bottom: M3Spacings.s16),
      child: M3Padding(
        padding: const M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowcaseLink(
              label: api,
              url: 'https://m3.material.io/styles/icons/applying-icons',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            const M3Gap(M3Spacings.s16),
            child,
          ],
        ),
      ),
    );
  }
}

/// A rendered sample with its value beneath.
class _Sample extends StatelessWidget {
  const _Sample({required this.caption, required this.child});

  final String caption;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        const M3Gap(M3Spacings.s4),
        Text(caption, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}

/// One `M3IconStyle` preset: the axes it sets go under the name rather than in
/// a trailing column — the summary is a sentence's worth of values, and a
/// narrow window has nowhere to put it on the right.
class _PresetRow extends StatelessWidget {
  const _PresetRow({
    required this.name,
    required this.axes,
    required this.usage,
    required this.specimen,
  });

  final String name;
  final String axes;
  final String usage;
  final Widget specimen;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return M3Padding(
      padding: const M3EdgeInsets.symmetric(vertical: M3Spacings.s8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: M3Spacings.s48,
            child: Center(child: specimen),
          ),
          const M3Gap(M3Spacings.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: M3TextUtils.mono(M3TypeScale.bodyMedium).copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  axes,
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                Text(
                  usage,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// One token: its name, its value, what it is for, and a specimen when there
/// is an honest one to show.
class _TokenRow extends StatelessWidget {
  const _TokenRow({
    required this.name,
    required this.value,
    required this.usage,
    this.specimen,
  });

  final String name;
  final String value;
  final String usage;
  final Widget? specimen;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return M3Padding(
      padding: const M3EdgeInsets.symmetric(vertical: M3Spacings.s8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (specimen != null) ...[
            SizedBox(
              width: M3Spacings.s48,
              child: Center(child: specimen),
            ),
            const M3Gap(M3Spacings.s16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: M3TextUtils.mono(M3TypeScale.bodyMedium).copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  usage,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const M3Gap(M3Spacings.s16),
          Text(
            value,
            style: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
          ),
        ],
      ),
    );
  }
}

/// A grade value shown on the surface it is meant for.
class _GradeCase extends StatelessWidget {
  const _GradeCase({
    required this.name,
    required this.value,
    required this.usage,
    required this.background,
    required this.foreground,
  });

  final String name;
  final String value;
  final String usage;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return M3Padding(
      padding: const M3EdgeInsets.symmetric(vertical: M3Spacings.s8),
      child: Row(
        children: [
          DecoratedBox(
            decoration: M3BoxDecoration(
              color: background,
              borderRadius: M3BorderRadius.small,
            ),
            child: M3Padding(
              padding: const M3EdgeInsets.all(M3Spacings.s12),
              child: Icon(
                Icons.shield_outlined,
                size: M3IconSizes.standard,
                color: foreground,
              ),
            ),
          ),
          const M3Gap(M3Spacings.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: M3TextUtils.mono(M3TypeScale.bodyMedium).copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  usage,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const M3Gap(M3Spacings.s16),
          Text(
            value,
            style: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
