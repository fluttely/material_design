import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

void main() {
  runApp(const StyleGuideApp());
}

/// The main application widget that sets up the Material 3 theme.
class StyleGuideApp extends StatelessWidget {
  const StyleGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material 3 Style Guide',
      theme: ThemeData(
        colorScheme: MaterialColorSchemes.lightScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: MaterialColorSchemes.darkScheme,
        useMaterial3: true,
      ),
      home: const StyleGuidePage(),
    );
  }
}

/// The main page of the example application, showcasing the design tokens.
class StyleGuidePage extends StatelessWidget {
  const StyleGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material 3 Tokens'),
        elevation: MaterialElevation.level2,
        shadowColor: Theme.of(context).colorScheme.shadow,
      ),
      body: ListView(
        padding: const EdgeInsets.all(MaterialSpacing.space16),
        children: const [
          _SectionTitle('Color Scheme'),
          _ColorGuide(),
          _SectionTitle('Type Scale'),
          _TypographyGuide(),
          _SectionTitle('Shapes & Shadows'),
          _ShapeAndShadowGuide(),
          _SectionTitle('Other Tokens'),
          _OtherTokensGuide(),
        ],
      ),
    );
  }
}

// --- Section Widgets ---

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MaterialSpacing.space24,
        bottom: MaterialSpacing.space16,
      ),
      child: Text(title, style: MaterialTypeScale.headlineSmall),
    );
  }
}

class _ColorGuide extends StatelessWidget {
  const _ColorGuide();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Wrap(
      spacing: MaterialSpacing.space8,
      runSpacing: MaterialSpacing.space8,
      children: [
        _ColorChip('Primary', colors.primary, colors.onPrimary),
        _ColorChip('On Primary', colors.onPrimary, colors.primary),
        _ColorChip(
          'Primary Container',
          colors.primaryContainer,
          colors.onPrimaryContainer,
        ),
        _ColorChip(
          'On Primary Container',
          colors.onPrimaryContainer,
          colors.primaryContainer,
        ),
        _ColorChip('Secondary', colors.secondary, colors.onSecondary),
        _ColorChip(
          'Secondary Container',
          colors.secondaryContainer,
          colors.onSecondaryContainer,
        ),
        _ColorChip('Tertiary', colors.tertiary, colors.onTertiary),
        _ColorChip(
          'Tertiary Container',
          colors.tertiaryContainer,
          colors.onTertiaryContainer,
        ),
        _ColorChip('Error', colors.error, colors.onError),
        _ColorChip(
          'Error Container',
          colors.errorContainer,
          colors.onErrorContainer,
        ),
        _ColorChip('Surface', colors.surface, colors.onSurface),
        _ColorChip('On Surface', colors.onSurface, colors.surface),
        _ColorChip(
          'Surface Variant',
          colors.surfaceVariant,
          colors.onSurfaceVariant,
        ),
        _ColorChip('Background', colors.background, colors.onBackground),
        _ColorChip('Outline', colors.outline, colors.surface),
      ],
    );
  }
}

class _TypographyGuide extends StatelessWidget {
  const _TypographyGuide();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TypeSample('Display Large', MaterialTypeScale.displayLarge),
        _TypeSample('Display Medium', MaterialTypeScale.displayMedium),
        _TypeSample('Display Small', MaterialTypeScale.displaySmall),
        _TypeSample('Headline Large', MaterialTypeScale.headlineLarge),
        _TypeSample('Headline Medium', MaterialTypeScale.headlineMedium),
        _TypeSample('Headline Small', MaterialTypeScale.headlineSmall),
        _TypeSample('Title Large', MaterialTypeScale.titleLarge),
        _TypeSample('Title Medium', MaterialTypeScale.titleMedium),
        _TypeSample('Title Small', MaterialTypeScale.titleSmall),
        _TypeSample('Body Large', MaterialTypeScale.bodyLarge),
        _TypeSample('Body Medium', MaterialTypeScale.bodyMedium),
        _TypeSample('Body Small', MaterialTypeScale.bodySmall),
        _TypeSample('Label Large', MaterialTypeScale.labelLarge),
        _TypeSample('Label Medium', MaterialTypeScale.labelMedium),
        _TypeSample('Label Small', MaterialTypeScale.labelSmall),
      ],
    );
  }
}

class _ShapeAndShadowGuide extends StatelessWidget {
  const _ShapeAndShadowGuide();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: MaterialSpacing.space16,
      runSpacing: MaterialSpacing.space16,
      alignment: WrapAlignment.start,
      children: [
        _ShapeCard(
          label: 'Level 0',
          shape: MaterialShape.extraSmall,
          shadow: MaterialShadow.level0,
        ),
        _ShapeCard(
          label: 'Level 1',
          shape: MaterialShape.small,
          shadow: MaterialShadow.level1,
        ),
        _ShapeCard(
          label: 'Level 2',
          shape: MaterialShape.medium,
          shadow: MaterialShadow.level2,
        ),
        _ShapeCard(
          label: 'Level 3',
          shape: MaterialShape.large,
          shadow: MaterialShadow.level3,
        ),
        _ShapeCard(
          label: 'Level 4',
          shape: MaterialShape.extraLarge,
          shadow: MaterialShadow.level4,
        ),
        _ShapeCard(
          label: 'Level 5',
          shape: MaterialShape.full,
          shadow: MaterialShadow.level5,
        ),
      ],
    );
  }
}

class _OtherTokensGuide extends StatelessWidget {
  const _OtherTokensGuide();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Borders', style: MaterialTypeScale.titleMedium),
        const SizedBox(height: MaterialSpacing.space8),
        Wrap(
          spacing: MaterialSpacing.space16,
          children: [
            _BorderedBox('Thin', MaterialBorder.thin, color),
            _BorderedBox('Thick', MaterialBorder.thick, color),
            _BorderedBox('Extra Thick', MaterialBorder.extraThick, color),
          ],
        ),
        const SizedBox(height: MaterialSpacing.space24),
        const Text('Opacities', style: MaterialTypeScale.titleMedium),
        const SizedBox(height: MaterialSpacing.space8),
        Wrap(
          spacing: MaterialSpacing.space16,
          runSpacing: MaterialSpacing.space16,
          children: [
            _OpacityBox('Hover', MaterialOpacity.hover, color),
            _OpacityBox('Focus', MaterialOpacity.focus, color),
            _OpacityBox('Pressed', MaterialOpacity.pressed, color),
            _OpacityBox('Dragged', MaterialOpacity.dragged, color),
            _OpacityBox(
              'Disabled Content',
              MaterialOpacity.disabledContent,
              color,
            ),
            _OpacityBox(
              'Disabled Container',
              MaterialOpacity.disabledContainer,
              color,
            ),
          ],
        ),
      ],
    );
  }
}

// --- Helper Widgets ---

class _ColorChip extends StatelessWidget {
  final String label;
  final Color color;
  final Color onColor;

  const _ColorChip(this.label, this.color, this.onColor);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: color,
      labelStyle: MaterialTypeScale.labelLarge.copyWith(color: onColor),
      padding: const EdgeInsets.all(MaterialSpacing.space8),
    );
  }
}

class _TypeSample extends StatelessWidget {
  final String label;
  final TextStyle style;

  const _TypeSample(this.label, this.style);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: MaterialSpacing.space8),
      child: Text(label, style: style),
    );
  }
}

class _ShapeCard extends StatelessWidget {
  final String label;
  final ShapeBorder shape;
  final List<BoxShadow> shadow;

  const _ShapeCard({
    required this.label,
    required this.shape,
    required this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: shape,
        shadows: shadow,
      ),
      child: Center(child: Text(label, style: MaterialTypeScale.bodyMedium)),
    );
  }
}

class _BorderedBox extends StatelessWidget {
  final String label;
  final double width;
  final Color color;

  const _BorderedBox(this.label, this.width, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MaterialSpacing.space16),
      decoration: BoxDecoration(
        border: Border.all(width: width, color: color),
        borderRadius: BorderRadius.circular(MaterialRadius.small),
      ),
      child: Text(label, style: MaterialTypeScale.bodyMedium),
    );
  }
}

class _OpacityBox extends StatelessWidget {
  final String label;
  final double opacity;
  final Color color;

  const _OpacityBox(this.label, this.opacity, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MaterialSpacing.space16),
      decoration: BoxDecoration(
        color: color.withOpacity(opacity),
        borderRadius: BorderRadius.circular(MaterialRadius.small),
      ),
      child: Text(
        label,
        style: MaterialTypeScale.bodyMedium.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
