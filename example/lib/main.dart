import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

void main() {
  runApp(const MaterialDesignDemo());
}

class MaterialDesignDemo extends StatefulWidget {
  const MaterialDesignDemo({super.key});

  @override
  State<MaterialDesignDemo> createState() => _MaterialDesignDemoState();
}

class _MaterialDesignDemoState extends State<MaterialDesignDemo> {
  ThemeMode _themeMode = ThemeMode.light;
  Color _seedColor = Colors.blue;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _changeSeedColor(Color color) {
    setState(() {
      _seedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design 3 Demo',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: DemoHomePage(
        onThemeToggle: _toggleTheme,
        onSeedColorChange: _changeSeedColor,
        currentSeedColor: _seedColor,
        isDark: _themeMode == ThemeMode.dark,
      ),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final Function(Color) onSeedColorChange;
  final Color currentSeedColor;
  final bool isDark;

  const DemoHomePage({
    super.key,
    required this.onThemeToggle,
    required this.onSeedColorChange,
    required this.currentSeedColor,
    required this.isDark,
  });

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  double _elevation = 1.0;
  VisualDensity _visualDensity = VisualDensity.standard;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompact = screenWidth < M3BreakpointToken.medium.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design 3 Demo'),
        backgroundColor: colorScheme.surfaceContainer,
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onThemeToggle,
            tooltip: 'Toggle theme',
          ),
          _ColorPickerButton(
            currentColor: widget.currentSeedColor,
            onColorChanged: widget.onSeedColorChange,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(context),
            SizedBox(height: M3SpacingToken.space24.value),
            _buildFoundationsSection(context, isCompact),
            SizedBox(height: M3SpacingToken.space24.value),
            _buildStylesSection(context, colorScheme, textTheme),
            SizedBox(height: M3SpacingToken.space24.value),
            _buildComponentsSection(context, colorScheme),
            SizedBox(height: M3SpacingToken.space24.value),
            _buildInteractiveSection(context, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Material Design 3 Library Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: M3SpacingToken.space8.value),
            Text(
              'This demo showcases the key features of the Material Design 3 library, including design tokens, components, and utilities.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: M3SpacingToken.space12.value),
            Wrap(
              spacing: M3SpacingToken.space8.value,
              children: [
                Chip(
                  label: Text(
                      'Screen: ${MediaQuery.of(context).size.width.toInt()}px'),
                  avatar: const Icon(Icons.aspect_ratio, size: 16),
                ),
                Chip(
                  label: Text('Breakpoint: ${_getCurrentBreakpoint()}'),
                  avatar: const Icon(Icons.devices, size: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getCurrentBreakpoint() {
    final width = MediaQuery.of(context).size.width;
    if (width < M3BreakpointToken.medium.value) return 'Compact';
    if (width < M3BreakpointToken.expanded.value) return 'Medium';
    if (width < M3BreakpointToken.large.value) return 'Expanded';
    if (width < M3BreakpointToken.extraLarge.value) return 'Large';
    return 'Extra Large';
  }

  String _getDensityName(VisualDensity density) {
    if (density == VisualDensity.standard) return 'Standard';
    if (density == VisualDensity.comfortable) return 'Comfortable';
    if (density == VisualDensity.compact) return 'Compact';
    if (density == VisualDensity.adaptivePlatformDensity) return 'Adaptive';
    return 'Custom';
  }

  Widget _buildFoundationsSection(BuildContext context, bool isCompact) {
    return _SectionCard(
      title: 'Foundations',
      subtitle: 'Design tokens and system foundations',
      children: [
        _buildSpacingDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildVisualDensityDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildOpacityDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildBorderDemo(),
      ],
    );
  }

  Widget _buildSpacingDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Spacing Tokens', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          runSpacing: M3SpacingToken.space8.value,
          children: [
            M3SpacingToken.space4,
            M3SpacingToken.space8,
            M3SpacingToken.space12,
            M3SpacingToken.space16,
            M3SpacingToken.space24,
            M3SpacingToken.space32,
          ].map((token) => _SpacingExample(token: token)).toList(),
        ),
      ],
    );
  }

  Widget _buildVisualDensityDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Visual Density', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          children: [
            VisualDensity.standard,
            VisualDensity.comfortable,
            VisualDensity.compact,
            VisualDensity.adaptivePlatformDensity,
          ]
              .map(
                (density) => FilterChip(
                  label: Text(_getDensityName(density)),
                  selected: _visualDensity == density,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _visualDensity = density);
                    }
                  },
                ),
              )
              .toList(),
        ),
        SizedBox(height: M3SpacingToken.space8.value),
        ListTile(
          title:
              Text('List item with ${_getDensityName(_visualDensity)} density'),
          subtitle: Text('Density value: $_visualDensity'),
          leading: const Icon(Icons.density_medium),
          visualDensity: _visualDensity,
        ),
      ],
    );
  }

  Widget _buildOpacityDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Opacity Tokens', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Row(
          children: [
            _OpacityExample(
                token: M3StateLayerOpacityToken.hover, label: 'Hover'),
            SizedBox(width: M3SpacingToken.space16.value),
            _OpacityExample(
                token: M3StateLayerOpacityToken.focus, label: 'Focus'),
            SizedBox(width: M3SpacingToken.space16.value),
            _OpacityExample(
                token: M3StateLayerOpacityToken.pressed, label: 'Pressed'),
          ],
        ),
      ],
    );
  }

  Widget _buildBorderDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Border Tokens', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Row(
          children: [
            M3BorderToken.thin,
            M3BorderToken.thick,
            M3BorderToken.extraThick,
          ]
              .map((token) => Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: M3SpacingToken.space4.value),
                      padding: EdgeInsets.all(M3SpacingToken.space12.value),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: token.value,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: M3BorderRadiusToken.small.value,
                      ),
                      child: Text(
                        '${token.name}\n${token.value}px',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildStylesSection(
      BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return _SectionCard(
      title: 'Styles',
      subtitle: 'Colors, typography, shapes, and elevation',
      children: [
        _buildColorDemo(colorScheme),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildTypographyDemo(textTheme),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildShapeDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildElevationDemo(),
      ],
    );
  }

  Widget _buildColorDemo(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color Scheme', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          runSpacing: M3SpacingToken.space8.value,
          children: [
            _ColorSwatch(color: colorScheme.primary, label: 'Primary'),
            _ColorSwatch(color: colorScheme.secondary, label: 'Secondary'),
            _ColorSwatch(color: colorScheme.tertiary, label: 'Tertiary'),
            _ColorSwatch(color: colorScheme.error, label: 'Error'),
            _ColorSwatch(color: colorScheme.surface, label: 'Surface'),
            _ColorSwatch(
                color: colorScheme.surfaceContainer,
                label: 'Surface Container'),
          ],
        ),
      ],
    );
  }

  Widget _buildTypographyDemo(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Typography Scale',
            style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Display Large', style: textTheme.displayLarge),
            Text('Headline Large', style: textTheme.headlineLarge),
            Text('Title Large', style: textTheme.titleLarge),
            Text('Body Large', style: textTheme.bodyLarge),
            Text('Label Large', style: textTheme.labelLarge),
          ],
        ),
      ],
    );
  }

  Widget _buildShapeDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shape Tokens', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Row(
          children: [
            M3ShapeToken.none,
            M3ShapeToken.small,
            M3ShapeToken.medium,
            M3ShapeToken.large,
            M3ShapeToken.extraLarge,
          ]
              .map((token) => Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: M3SpacingToken.space4.value),
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: M3BorderRadiusToken.values
                            .firstWhere((r) => r.name == token.name)
                            .value,
                      ),
                      child: Center(
                        child: Text(
                          token.name,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildElevationDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Elevation', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Text('Current elevation: ${_elevation.toInt()}'),
        Slider(
          value: _elevation,
          min: 0,
          max: 5,
          divisions: 5,
          onChanged: (value) => setState(() => _elevation = value),
        ),
        SizedBox(height: M3SpacingToken.space8.value),
        Card(
          elevation: _elevation,
          child: Padding(
            padding: EdgeInsets.all(M3SpacingToken.space16.value),
            child: Text('Card with elevation ${_elevation.toInt()}'),
          ),
        ),
      ],
    );
  }

  Widget _buildComponentsSection(
      BuildContext context, ColorScheme colorScheme) {
    return _SectionCard(
      title: 'Components',
      subtitle: 'Material Design 3 components showcase',
      children: [
        _buildButtonsDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildCardsDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildChipsDemo(),
      ],
    );
  }

  Widget _buildButtonsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Buttons', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          runSpacing: M3SpacingToken.space8.value,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cards', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Row(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(M3SpacingToken.space16.value),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Elevated Card',
                          style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(height: M3SpacingToken.space8.value),
                      Text('Default Material 3 card with elevation',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: M3SpacingToken.space8.value),
            Expanded(
              child: Card.outlined(
                child: Padding(
                  padding: EdgeInsets.all(M3SpacingToken.space16.value),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Outlined Card',
                          style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(height: M3SpacingToken.space8.value),
                      Text('Card with outline border',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChipsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Chips', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          runSpacing: M3SpacingToken.space8.value,
          children: [
            const Chip(
              label: Text('Assist Chip'),
              avatar: Icon(Icons.star, size: 16),
            ),
            FilterChip(
              label: const Text('Filter Chip'),
              selected: true,
              onSelected: (value) {},
            ),
            InputChip(
              label: const Text('Input Chip'),
              onDeleted: () {},
            ),
            ActionChip(
              label: const Text('Action Chip'),
              onPressed: () {},
              avatar: const Icon(Icons.settings, size: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInteractiveSection(
      BuildContext context, ColorScheme colorScheme) {
    return _SectionCard(
      title: 'Interactive Demo',
      subtitle: 'Test theme switching and adaptive behavior',
      children: [
        Text('Theme Controls', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        SwitchListTile(
          title: const Text('Dark Mode'),
          subtitle: const Text('Toggle between light and dark themes'),
          value: widget.isDark,
          onChanged: (value) => widget.onThemeToggle(),
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        Text('Seed Colors', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          children: [
            Colors.blue,
            Colors.red,
            Colors.green,
            Colors.purple,
            Colors.orange,
            Colors.teal,
          ]
              .map((color) => GestureDetector(
                    onTap: () => widget.onSeedColorChange(color),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: widget.currentSeedColor == color
                            ? Border.all(color: colorScheme.outline, width: 3)
                            : null,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: M3SpacingToken.space16.value),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _SpacingExample extends StatelessWidget {
  final M3SpacingToken token;

  const _SpacingExample({required this.token});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: token.value,
          height: 20,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(height: M3SpacingToken.space4.value),
        Text(
          '${token.name}\n${token.value}px',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _OpacityExample extends StatelessWidget {
  final M3StateLayerOpacityToken token;
  final String label;

  const _OpacityExample({required this.token, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .primary
                .withValues(alpha: token.value),
            borderRadius: M3BorderRadiusToken.small.value,
          ),
        ),
        SizedBox(height: M3SpacingToken.space4.value),
        Text(
          '$label\n${(token.value * 100).toInt()}%',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final Color color;
  final String label;

  const _ColorSwatch({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: M3BorderRadiusToken.small.value,
            border: Border.all(
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
        ),
        SizedBox(height: M3SpacingToken.space4.value),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _ColorPickerButton extends StatelessWidget {
  final Color currentColor;
  final Function(Color) onColorChanged;

  const _ColorPickerButton({
    required this.currentColor,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Color>(
      icon: Icon(Icons.color_lens, color: currentColor),
      tooltip: 'Change seed color',
      onSelected: onColorChanged,
      itemBuilder: (context) => [
        Colors.blue,
        Colors.red,
        Colors.green,
        Colors.purple,
        Colors.orange,
        Colors.teal,
        Colors.pink,
        Colors.indigo,
      ]
          .map((color) => PopupMenuItem(
                value: color,
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outlineVariant,
                          width: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 12.0), // Use um valor fixo ou um token válido
                    // ✅ CORREÇÃO: Maneira robusta de obter o valor hexadecimal da cor.
                    Text(
                      '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
