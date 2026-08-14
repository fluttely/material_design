import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Showcase of the package's responsive utilities: [M3ScreenSize],
/// [M3ResponsiveValue], [M3ResponsiveVisibility], [M3ResponsiveBuilder],
/// and [M3ResponsiveGrid].
///
/// Resize the window to watch every card react to the current
/// Material Design 3 window size class.
class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive'),
      ),
      body: SingleChildScrollView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resize the window to see each widget react to the current '
              'window size class.',
              style: textTheme.bodyMedium,
            ),
            const M3Gap(M3Spacings.s16),
            _buildCard(
              context,
              title: 'M3ScreenSize.of(context)',
              child: _buildScreenSizeReadout(context),
            ),
            _buildCard(
              context,
              title: 'M3ResponsiveValue<String>',
              child: M3ResponsiveValue<String>(
                compact: 'compact — single pane, bottom navigation',
                medium: 'medium — single pane, navigation rail',
                expanded: 'expanded — two panes, navigation rail',
                builder: (context, value) => Text(
                  value,
                  style: textTheme.bodyLarge,
                ),
              ),
            ),
            _buildCard(
              context,
              title: 'M3ResponsiveVisibility',
              child: M3ResponsiveVisibility(
                visibleOn: const [
                  M3ScreenSize.expanded,
                  M3ScreenSize.large,
                  M3ScreenSize.extraLarge,
                ],
                replacement: Text(
                  'Hidden on compact and medium screens — widen the window.',
                  style: textTheme.bodyMedium,
                ),
                child: Text(
                  'Visible on expanded, large, and extra-large screens.',
                  style: textTheme.bodyLarge,
                ),
              ),
            ),
            _buildCard(
              context,
              title: 'M3ResponsiveBuilder',
              child: M3ResponsiveBuilder(
                builder: (context, screenSize) => Text(
                  'rebuilds on: ${screenSize.name}',
                  style: textTheme.bodyLarge,
                ),
              ),
            ),
            _buildCard(
              context,
              title: 'M3ResponsiveGrid',
              child: M3ResponsiveGrid(
                children: [
                  for (final (index, color) in _tileColors(context).indexed)
                    _buildTile(context, index, color),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenSizeReadout(BuildContext context) {
    final screenSize = M3ScreenSize.of(context);
    final textTheme = Theme.of(context).textTheme;

    Widget row(String label, String value) {
      return M3Padding(
        padding: M3EdgeInsets.only(bottom: M3Spacings.s4),
        child: Row(
          children: [
            SizedBox(
              width: M3Spacings.s128,
              child: Text(label, style: textTheme.labelLarge),
            ),
            Text(value, style: textTheme.bodyMedium),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row('name', screenSize.name),
        row('columns', '${screenSize.columns}'),
        row('gutterWidth', '${screenSize.gutterWidth.toInt()}dp'),
        row('pageMargin', '${screenSize.pageMargin.toInt()}dp'),
      ],
    );
  }

  List<Color> _tileColors(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return [
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
      colorScheme.primaryContainer,
      colorScheme.secondaryContainer,
      colorScheme.tertiaryContainer,
    ];
  }

  Widget _buildTile(BuildContext context, int index, Color color) {
    return DecoratedBox(
      decoration: M3BoxDecoration(
        color: color,
        borderRadius: M3BorderRadius.medium,
      ),
      child: Center(
        child: Text(
          '${index + 1}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ThemeData.estimateBrightnessForColor(color) ==
                        Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Card(
      margin: M3EdgeInsets.only(bottom: M3Spacings.s16),
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const M3Gap(M3Spacings.s12),
            child,
          ],
        ),
      ),
    );
  }
}
