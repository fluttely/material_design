// Material Design 3 contract — the whole public API in one file.
//
// This example is deliberately a single file so you can read it top to bottom
// and copy any section straight into your app. The sections follow the same
// order as the README's "API tour":
//
//   1. Spacing & layout        6. Interaction states & focus
//   2. Shape & borders         7. Motion
//   3. Elevation & surfaces    8. Adaptive & responsive
//   4. Typography              9. Accessibility
//   5. Color                  10. M3 Expressive (experimental)
//   5b. Schemes & contrast    11. Breaking the contract (M3Contract)
//
// Live version of everything here: https://fluttely.github.io/material_design/
//
// Section 10 uses the M3 Expressive module, whose API is marked @experimental
// because Material is still iterating on it upstream. Opting in is a decision,
// so the analyzer warns — this file acknowledges it once, deliberately:
// ignore_for_file: experimental_member_use

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  ThemeMode _mode = ThemeMode.light;

  ThemeData _theme(Brightness brightness) {
    // M3TextTheme.applyToTheme MERGES the 15 M3 text styles into the theme,
    // preserving the brightness-resolved colors the theme already computed.
    return M3TextTheme.applyToTheme(
      ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: brightness,
        ),
        visualDensity: M3VisualDensity.standard,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'material_design example',
      debugShowCheckedModeBanner: false,
      theme: _theme(Brightness.light),
      darkTheme: _theme(Brightness.dark),
      themeMode: _mode,
      home: ExampleHomePage(
        onToggleTheme: () => setState(() {
          _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
        }),
      ),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({required this.onToggleTheme, super.key});

  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design 3 — design contract'),
        actions: [
          IconButton(
            onPressed: onToggleTheme,
            icon: const Icon(Icons.brightness_6),
            tooltip: 'Toggle light/dark',
          ),
        ],
      ),
      body: ListView(
        // The page margin is itself a token: 16dp on compact screens.
        padding: const M3EdgeInsets.all(M3Margins.compactScreen),
        children: const [
          _SpacingSection(),
          _ShapeSection(),
          _ElevationSection(),
          _TypographySection(),
          _ColorSection(),
          _SchemeSection(),
          _InteractionSection(),
          _MotionSection(),
          _AdaptiveSection(),
          _AccessibilitySection(),
          _ExpressiveSection(),
          _ContractSection(),
        ],
      ),
    );
  }
}

/// Shared section scaffold — a Card shaped, padded, and spaced by tokens only.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: M3Shape.medium, // 12dp — the M3 card shape
      margin: const M3EdgeInsets.only(bottom: M3Spacings.s16),
      child: M3Padding(
        padding: M3EdgeInsetsPatterns.card, // 16dp all around
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: M3TypeScale.titleLarge),
            const M3Gap(M3Spacings.s16),
            ...children,
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 1. SPACING & LAYOUT — M3Spacings, M3EdgeInsets, M3Padding, M3Gap
// ═════════════════════════════════════════════════════════════════════════

class _SpacingSection extends StatelessWidget {
  const _SpacingSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _Section(
      title: '1. Spacing & layout',
      children: [
        // Every stop of the 4dp grid, straight from the scale's `values` list.
        for (final spacing in const [
          M3Spacings.s4,
          M3Spacings.s8,
          M3Spacings.s16,
          M3Spacings.s24,
          M3Spacings.s32,
          M3Spacings.s48,
        ])
          M3Padding(
            padding: const M3EdgeInsets.only(bottom: M3Spacings.s4),
            child: Row(
              children: [
                SizedBox(
                  width: M3Spacings.s48,
                  child: Text('${spacing.toInt()}dp',
                      style: M3TypeScale.labelMedium),
                ),
                Container(
                  width: spacing, // M3SpacingValue IS a double — no unwrap
                  height: M3Spacings.s16,
                  color: colorScheme.primary,
                ),
              ],
            ),
          ),
        const M3Gap(M3Spacings.s16), // vertical inside this Column
        Text(
          'M3Gap detects its orientation from the surrounding Row/Column. '
          'M3GapUtils.addGaps interleaves a whole list:',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        Row(
          children: M3GapUtils.addGaps(
            [
              const Chip(label: Text('one')),
              const Chip(label: Text('two')),
              const Chip(label: Text('three')),
            ],
            M3Spacings.s8,
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 2. SHAPE & BORDERS — M3Shape, M3BorderRadius, M3Border, M3BorderWidths
// ═════════════════════════════════════════════════════════════════════════

class _ShapeSection extends StatelessWidget {
  const _ShapeSection();

  static const _corners = <(String, M3BorderRadius)>[
    ('none 0', M3BorderRadius.none),
    ('xs 4', M3BorderRadius.extraSmall),
    ('sm 8', M3BorderRadius.small),
    ('md 12', M3BorderRadius.medium),
    ('lg 16', M3BorderRadius.large),
    ('xl 28', M3BorderRadius.extraLarge),
    ('full', M3BorderRadius.full),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _Section(
      title: '2. Shape & borders',
      children: [
        Text('The shape scale has exactly seven stops:',
            style: M3TypeScale.bodyMedium),
        const M3Gap(M3Spacings.s8),
        Wrap(
          spacing: M3Spacings.s8,
          runSpacing: M3Spacings.s8,
          children: [
            for (final (label, radius) in _corners)
              Container(
                width: M3Spacings.s64,
                height: M3Spacings.s48,
                alignment: Alignment.center,
                decoration: M3BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: radius,
                ),
                child: Text(label, style: M3TypeScale.labelSmall),
              ),
          ],
        ),
        const M3Gap(M3Spacings.s16),
        Text('Border widths are a scale too (0 / 1 / 2 / 4 dp):',
            style: M3TypeScale.bodyMedium),
        const M3Gap(M3Spacings.s8),
        Row(
          children: M3GapUtils.addGaps(
            [
              for (final (label, border) in <(String, M3Border)>[
                ('thin', M3Border.thin(colorScheme.outline)),
                ('thick', M3Border.thick(colorScheme.outline)),
                ('extraThick', M3Border.extraThick(colorScheme.outline)),
              ])
                Expanded(
                  child: Container(
                    padding: const M3EdgeInsets.all(M3Spacings.s12),
                    alignment: Alignment.center,
                    decoration: M3BoxDecoration(
                      border: border,
                      borderRadius: M3BorderRadius.small,
                    ),
                    child: Text(label, style: M3TypeScale.labelMedium),
                  ),
                ),
            ],
            M3Spacings.s8,
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 3. ELEVATION & SURFACES — M3Elevation, M3ElevationShadows, surface tint
// ═════════════════════════════════════════════════════════════════════════

class _ElevationSection extends StatelessWidget {
  const _ElevationSection();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: '3. Elevation & surfaces',
      children: [
        Text(
          'Each level carries its dp AND its shadows; the surface color is '
          'computed with the official tint formula.',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        Wrap(
          spacing: M3Spacings.s12,
          runSpacing: M3Spacings.s12,
          children: [
            for (final level in M3Elevation.values)
              Container(
                width: M3Spacings.s96,
                height: M3Spacings.s64,
                alignment: Alignment.center,
                decoration: M3BoxDecoration(
                  color: level.surfaceColor(context),
                  borderRadius: M3BorderRadius.medium,
                  boxShadow: level.shadows,
                ),
                child: Text(
                  'level ${level.index}\n${level.dp.toInt()}dp',
                  textAlign: TextAlign.center,
                  style: M3TypeScale.labelMedium,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 4. TYPOGRAPHY — M3TypeScale (15 styles), M3TextUtils
// ═════════════════════════════════════════════════════════════════════════

class _TypographySection extends StatelessWidget {
  const _TypographySection();

  static const _styles = <(String, TextStyle)>[
    ('displaySmall 36', M3TypeScale.displaySmall),
    ('headlineSmall 24', M3TypeScale.headlineSmall),
    ('titleLarge 22', M3TypeScale.titleLarge),
    ('titleMedium 16', M3TypeScale.titleMedium),
    ('bodyLarge 16', M3TypeScale.bodyLarge),
    ('bodyMedium 14', M3TypeScale.bodyMedium),
    ('labelLarge 14', M3TypeScale.labelLarge),
    ('labelSmall 11', M3TypeScale.labelSmall),
  ];

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: '4. Typography',
      children: [
        for (final (name, style) in _styles) Text(name, style: style),
        const M3Gap(M3Spacings.s16),
        Text(
          'Emphasized counterparts keep size and line height, so swapping one '
          'in never reflows the layout — only the weight changes:',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        for (final (name, style) in _styles.take(4))
          Row(
            children: [
              Expanded(child: Text(name, style: style)),
              Expanded(
                child: Text(
                  name,
                  style: M3EmphasizedTypeScale.of(style),
                ),
              ),
            ],
          ),
        const M3Gap(M3Spacings.s16),
        Text(
          'M3TextUtils.mono — code-friendly variant of any style',
          style: M3TextUtils.mono(M3TypeScale.bodyMedium),
        ),
        Text(
          'M3TextUtils.dyslexiaFriendly — wider tracking, taller lines',
          style: M3TextUtils.dyslexiaFriendly(M3TypeScale.bodyMedium),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 5. COLOR — M3TonalPalette, M3Tones, ColorScheme extensions, opacities
// ═════════════════════════════════════════════════════════════════════════

class _ColorSection extends StatelessWidget {
  const _ColorSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // Real HCT tonal palette — the same math Material uses.
    final palette = M3TonalPalette.fromSeed(const Color(0xFF6750A4));

    return _Section(
      title: '5. Color',
      children: [
        Text('Tonal palette from seed, at the 13 M3 tone stops:',
            style: M3TypeScale.bodyMedium),
        const M3Gap(M3Spacings.s8),
        SizedBox(
          height: M3Spacings.s40,
          child: Row(
            children: [
              for (final tone in M3Tones.values)
                Expanded(child: Container(color: palette[tone])),
            ],
          ),
        ),
        const M3Gap(M3Spacings.s16),
        Wrap(
          spacing: M3Spacings.s8,
          runSpacing: M3Spacings.s8,
          children: [
            _colorChip(
              'hover state layer',
              colorScheme.stateLayerColor(
                colorScheme.primary,
                M3InteractionState.hover,
              ),
            ),
            _colorChip(
              'disabled content (38%)',
              colorScheme.disabledContent(colorScheme.onSurface),
            ),
            _colorChip(
              'surface @ level3',
              colorScheme.surfaceAtElevation(M3Elevation.level3),
            ),
          ],
        ),
      ],
    );
  }

  Widget _colorChip(String label, Color color) {
    return Chip(
      avatar: CircleAvatar(backgroundColor: color),
      label: Text(label, style: M3TypeScale.labelMedium),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 5b. COLOR SCHEMES — M3ColorSchemes, M3SchemeVariant, M3ContrastLevels
// ═════════════════════════════════════════════════════════════════════════

class _SchemeSection extends StatefulWidget {
  const _SchemeSection();

  @override
  State<_SchemeSection> createState() => _SchemeSectionState();
}

class _SchemeSectionState extends State<_SchemeSection> {
  M3SchemeVariant _variant = M3SchemeVariant.tonalSpot;
  M3ContrastLevelValue _contrast = M3ContrastLevels.standard;

  static const _seed = Color(0xFF6750A4);

  @override
  Widget build(BuildContext context) {
    // The variant and the contrast level are tokens, not loose values: you
    // cannot pass `2.7` as a contrast level or invent a tenth variant.
    final scheme = M3ColorSchemes.fromSeed(
      seedColor: _seed,
      variant: _variant,
      contrastLevel: _contrast,
      brightness: Theme.of(context).brightness,
    );

    return _Section(
      title: '5b. Color schemes, variants & contrast',
      children: [
        Text('Variant', style: M3TypeScale.labelLarge),
        const M3Gap(M3Spacings.s8),
        Wrap(
          spacing: M3Spacings.s8,
          runSpacing: M3Spacings.s8,
          children: [
            for (final variant in M3SchemeVariant.values)
              ChoiceChip(
                label: Text(variant.name, style: M3TypeScale.labelMedium),
                selected: _variant == variant,
                onSelected: (_) => setState(() => _variant = variant),
              ),
          ],
        ),
        const M3Gap(M3Spacings.s16),
        Text('Contrast', style: M3TypeScale.labelLarge),
        const M3Gap(M3Spacings.s8),
        Wrap(
          spacing: M3Spacings.s8,
          children: [
            for (final (label, level) in const <(String, M3ContrastLevelValue)>[
              ('reduced', M3ContrastLevels.reduced),
              ('standard', M3ContrastLevels.standard),
              ('medium', M3ContrastLevels.medium),
              ('high', M3ContrastLevels.high),
            ])
              ChoiceChip(
                label: Text(label, style: M3TypeScale.labelMedium),
                selected: _contrast == level,
                onSelected: (_) => setState(() => _contrast = level),
              ),
          ],
        ),
        const M3Gap(M3Spacings.s16),
        Row(
          children: M3GapUtils.addGaps(
            [
              for (final (label, bg, fg) in <(String, Color, Color)>[
                ('primary', scheme.primary, scheme.onPrimary),
                (
                  'primaryContainer',
                  scheme.primaryContainer,
                  scheme.onPrimaryContainer
                ),
                ('tertiary', scheme.tertiary, scheme.onTertiary),
                ('surface', scheme.surface, scheme.onSurface),
              ])
                Expanded(
                  child: Container(
                    height: M3Spacings.s64,
                    alignment: Alignment.center,
                    decoration: M3BoxDecoration(
                      color: bg,
                      borderRadius: M3BorderRadius.small,
                    ),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: M3TypeScale.labelSmall.copyWith(color: fg),
                    ),
                  ),
                ),
            ],
            M3Spacings.s8,
          ),
        ),
        const M3Gap(M3Spacings.s16),
        Text(
          'onSurface/surface contrast: '
          '${M3ColorUtils.calculateContrast(scheme.onSurface, scheme.surface).toStringAsFixed(2)}:1',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s16),
        Text(
          'Brand colors harmonized into this scheme — a bounded HCT hue shift, '
          'so they belong without becoming a different color:',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        Row(
          children: M3GapUtils.addGaps(
            [
              for (final (name, source) in const <(String, Color)>[
                ('success', Color(0xFF2E7D32)),
                ('warning', Color(0xFFF9A825)),
                ('info', Color(0xFF0277BD)),
              ])
                Expanded(
                  child: _ExtendedColorTile(
                    color: M3ExtendedColor.harmonized(
                      name: name,
                      source: source,
                      harmonizeWith: scheme.primary,
                      brightness: Theme.of(context).brightness,
                    ),
                    raw: source,
                  ),
                ),
            ],
            M3Spacings.s8,
          ),
        ),
      ],
    );
  }
}

class _ExtendedColorTile extends StatelessWidget {
  const _ExtendedColorTile({required this.color, required this.raw});

  final M3ExtendedColor color;
  final Color raw;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: M3Spacings.s20,
          decoration: M3BoxDecoration(
            color: raw,
            borderRadius: M3BorderRadius.extraSmall,
          ),
        ),
        const M3Gap(M3Spacings.s4),
        Container(
          padding: const M3EdgeInsets.all(M3Spacings.s8),
          decoration: M3BoxDecoration(
            color: color.colorContainer,
            borderRadius: M3BorderRadius.small,
          ),
          child: Text(
            color.name,
            textAlign: TextAlign.center,
            style: M3TypeScale.labelMedium.copyWith(
              color: color.onColorContainer,
            ),
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 6. INTERACTION STATES & FOCUS — M3StateLayer, M3FocusRing
// ═════════════════════════════════════════════════════════════════════════

class _InteractionSection extends StatelessWidget {
  const _InteractionSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _Section(
      title: '6. Interaction states & focus',
      children: [
        Text(
          'Hover / focus / press / drag overlays at official opacities '
          '(8% / 10% / 10% / 16%), with M3 precedence:',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        M3StateLayer(
          overlayColor: colorScheme.onSurface,
          borderRadius: M3BorderRadius.medium,
          onTap: () {},
          child: Container(
            padding: const M3EdgeInsets.all(M3Spacings.s16),
            decoration: M3BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              borderRadius: M3BorderRadius.medium,
            ),
            child:
                Text('Hover, press, or drag me', style: M3TypeScale.bodyLarge),
          ),
        ),
        const M3Gap(M3Spacings.s16),
        Text(
          'M3FocusRing reserves its 6dp inset permanently, so tabbing to the '
          'control never shifts the layout. Tab to see the 3dp ring:',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        M3FocusRing(
          borderRadius: M3BorderRadius.full,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star),
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 7. MOTION — M3Motion (duration + curve together)
// ═════════════════════════════════════════════════════════════════════════

class _MotionSection extends StatefulWidget {
  const _MotionSection();

  @override
  State<_MotionSection> createState() => _MotionSectionState();
}

class _MotionSectionState extends State<_MotionSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _Section(
      title: '7. Motion',
      children: [
        Text(
          'Duration and curve travel together — you never pair them by hand. '
          'This container animates with M3Motion.emphasized (500ms):',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: AnimatedContainer(
            duration: M3Motion.emphasized.duration,
            curve: M3Motion.emphasized.curve,
            width: _expanded ? M3Spacings.s128 * 2 : M3Spacings.s128,
            height: M3Spacings.s64,
            alignment: Alignment.center,
            decoration: M3BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius:
                  _expanded ? M3BorderRadius.extraLarge : M3BorderRadius.medium,
            ),
            child: Text('tap me', style: M3TypeScale.labelLarge),
          ),
        ),
        const M3Gap(M3Spacings.s16),
        Text(
          'Pick by intent: M3Motion.durationFor(M3MotionDistance.long) → '
          '${M3Motion.durationFor(M3MotionDistance.long).inMilliseconds}ms',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s24),
        Text(
          'M3 Expressive springs are the physics-based alternative: '
          'interruptible and velocity-aware. Tap to launch both.',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        const _SpringDemo(),
      ],
    );
  }
}

/// Runs the same distance under a bouncy spatial spring and a critically
/// damped effects spring, so the difference is visible rather than described.
class _SpringDemo extends StatefulWidget {
  const _SpringDemo();

  @override
  State<_SpringDemo> createState() => _SpringDemoState();
}

class _SpringDemoState extends State<_SpringDemo>
    with TickerProviderStateMixin {
  late final AnimationController _spatial = AnimationController.unbounded(
    vsync: this,
  );
  late final AnimationController _effects = AnimationController.unbounded(
    vsync: this,
  );

  @override
  void dispose() {
    _spatial.dispose();
    _effects.dispose();
    super.dispose();
  }

  void _run() {
    for (final (controller, spring) in <(AnimationController, M3ESpring)>[
      // Spatial springs move things and are allowed to overshoot.
      (_spatial, M3MotionScheme.expressive.spatial(M3MotionSpeed.fast)),
      // Effects springs change color/opacity and never overshoot.
      (_effects, M3MotionScheme.expressive.effects(M3MotionSpeed.standard)),
    ]) {
      final from = controller.value > 0.5 ? 1.0 : 0.0;
      controller
        ..value = from
        ..animateWith(
          spring.simulation(start: from, end: 1 - from),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: _run,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (label, controller, bouncy)
              in <(String, AnimationController, bool)>[
            ('spatial · fast — overshoots', _spatial, true),
            ('effects · standard — never overshoots', _effects, false),
          ]) ...[
            Text(label, style: M3TypeScale.labelMedium),
            const M3Gap(M3Spacings.s4),
            SizedBox(
              height: M3Spacings.s40,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Align(
                  // Values outside 0..1 are exactly the overshoot.
                  alignment: Alignment(
                    (controller.value.clamp(-0.2, 1.2) * 2) - 1,
                    0,
                  ),
                  child: child,
                ),
                child: Container(
                  width: M3Spacings.s32,
                  height: M3Spacings.s32,
                  decoration: M3BoxDecoration(
                    color: bouncy
                        ? colorScheme.primary
                        : colorScheme.tertiaryContainer,
                    borderRadius: M3BorderRadius.full,
                  ),
                ),
              ),
            ),
            const M3Gap(M3Spacings.s8),
          ],
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 8. ADAPTIVE & RESPONSIVE — M3ScreenSize, M3ResponsiveValue, M3Adaptive
// ═════════════════════════════════════════════════════════════════════════

class _AdaptiveSection extends StatelessWidget {
  const _AdaptiveSection();

  @override
  Widget build(BuildContext context) {
    final size = M3ScreenSize.of(context);

    return _Section(
      title: '8. Adaptive & responsive',
      children: [
        Text(
          'Window class: ${size.name} — ${size.columns} columns, '
          '${size.gutterWidth.toInt()}dp gutters, '
          '${size.pageMargin.toInt()}dp margins. Resize the window.',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        M3ResponsiveValue<String>(
          compact: 'compact: single column',
          medium: 'medium: rail + content',
          expanded: 'expanded: rail + content + panel',
          builder: (context, layout) =>
              Text(layout, style: M3TypeScale.labelLarge),
        ),
        const M3Gap(M3Spacings.s8),
        M3ResponsiveVisibility(
          visibleOn: const [
            M3ScreenSize.expanded,
            M3ScreenSize.large,
            M3ScreenSize.extraLarge,
          ],
          replacement: Text(
            '(a side panel would appear here on wider windows)',
            style: M3TypeScale.bodySmall,
          ),
          child: Text(
            'This side-panel text only exists on expanded+ windows.',
            style: M3TypeScale.bodySmall,
          ),
        ),
        const M3Gap(M3Spacings.s8),
        FilledButton(
          onPressed: () => M3Adaptive.showAdaptiveDialog<void>(
            context: context,
            title: 'Adaptive dialog',
            content: const Text(
              'Fullscreen on compact windows, AlertDialog elsewhere.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
          child: const Text('M3Adaptive.showAdaptiveDialog'),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 9. ACCESSIBILITY — M3Accessibility, WCAG helpers
// ═════════════════════════════════════════════════════════════════════════

class _AccessibilitySection extends StatelessWidget {
  const _AccessibilitySection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final contrast = M3ColorUtils.calculateContrast(
      colorScheme.onSurface,
      colorScheme.surface,
    );
    final passes = M3Accessibility.meetsContrastRequirement(
      foreground: colorScheme.onSurface,
      background: colorScheme.surface,
    );

    return _Section(
      title: '9. Accessibility',
      children: [
        Text(
          'onSurface on surface: contrast ${contrast.toStringAsFixed(2)}:1 — '
          '${passes ? 'passes' : 'fails'} WCAG AA (4.5:1).',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        Text(
          'Minimum touch target here: '
          '${M3Accessibility.minTouchTarget(context).toInt()}dp. '
          'Reduce motion requested: '
          '${M3Accessibility.shouldReduceMotion(context)}.',
          style: M3TypeScale.bodyMedium,
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// 10. M3 EXPRESSIVE (experimental) — loading indicator, 35-shape library
// ═════════════════════════════════════════════════════════════════════════

class _ExpressiveSection extends StatelessWidget {
  const _ExpressiveSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _Section(
      title: '10. M3 Expressive (experimental)',
      children: [
        Text(
          'The morphing loading indicator replaces most indeterminate '
          'spinners, and MaterialShapes ships the official 35-shape library:',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        Row(
          children: M3GapUtils.addGaps(
            [
              SizedBox(
                width: M3Spacings.s64,
                height: M3Spacings.s64,
                child: M3ELoadingIndicator(),
              ),
              SizedBox(
                width: M3Spacings.s64,
                height: M3Spacings.s64,
                child: M3ELoadingIndicator.contained(),
              ),
              for (final shape in [
                M3EShapes.sunny,
                M3EShapes.cookie7Sided,
                M3EShapes.flower,
                M3EShapes.heart,
              ])
                CustomPaint(
                  size: const Size.square(M3Spacings.s48),
                  painter: _PolygonPainter(shape, colorScheme.primary),
                ),
            ],
            M3Spacings.s16,
          ),
        ),
      ],
    );
  }
}

/// Draws a normalized (unit-space) [M3ERoundedPolygon] scaled to the canvas.
class _PolygonPainter extends CustomPainter {
  const _PolygonPainter(this.polygon, this.color);

  final M3ERoundedPolygon polygon;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final matrix = Matrix4.diagonal3Values(size.width, size.height, 1);
    canvas.drawPath(
      polygon.toPath().transform(matrix.storage),
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(_PolygonPainter oldDelegate) =>
      oldDelegate.polygon != polygon || oldDelegate.color != color;
}

// ═════════════════════════════════════════════════════════════════════════
// 11. BREAKING THE CONTRACT — M3Contract, the one greppable escape hatch
// ═════════════════════════════════════════════════════════════════════════

class _ContractSection extends StatelessWidget {
  const _ContractSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _Section(
      title: '11. Breaking the contract, deliberately',
      children: [
        Text(
          'A brand asset that is genuinely 18dp does not have to lie about '
          'it. M3Contract is the single sanctioned escape hatch — grep for '
          'it to audit every deviation in your codebase:',
          style: M3TypeScale.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        Container(
          // Off the 4dp grid, on purpose, and visibly so.
          padding: M3EdgeInsets.all(M3Contract.spacing(18)),
          decoration: M3BoxDecoration(
            color: colorScheme.tertiaryContainer,
            borderRadius: M3BorderRadius.medium,
          ),
          child: Text(
            "padding: M3EdgeInsets.all(M3Contract.spacing(18))\n"
            r"audit:   grep -rn 'M3Contract\.' lib/ | wc -l",
            style: M3TextUtils.mono(M3TypeScale.bodySmall),
          ),
        ),
      ],
    );
  }
}
