import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_example/showcase_pages/widgets/launch_url_text.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final keyColors = [
      (
        'Primary',
        colorScheme.primary,
        colorScheme.onPrimary,
      ),
      (
        'Secondary',
        colorScheme.secondary,
        colorScheme.onSecondary,
      ),
      (
        'Tertiary',
        colorScheme.tertiary,
        colorScheme.onTertiary,
      ),
      (
        'Error',
        colorScheme.error,
        colorScheme.onError,
      ),
    ];

    final allColors = [
      (
        'Primary Container',
        colorScheme.primaryContainer,
        colorScheme.onPrimaryContainer,
      ),
      (
        'On Primary',
        colorScheme.onPrimary,
        colorScheme.primary,
      ),
      (
        'Secondary Container',
        colorScheme.secondaryContainer,
        colorScheme.onSecondaryContainer,
      ),
      (
        'On Secondary',
        colorScheme.onSecondary,
        colorScheme.secondary,
      ),
      (
        'Tertiary Container',
        colorScheme.tertiaryContainer,
        colorScheme.onTertiaryContainer,
      ),
      (
        'On Tertiary',
        colorScheme.onTertiary,
        colorScheme.tertiary,
      ),
      (
        'Error Container',
        colorScheme.errorContainer,
        colorScheme.onErrorContainer,
      ),
      (
        'On Error',
        colorScheme.onError,
        colorScheme.error,
      ),
      (
        'Surface Dim',
        colorScheme.surfaceDim,
        colorScheme.onSurface,
      ),
      (
        'Surface',
        colorScheme.surface,
        colorScheme.onSurface,
      ),
      (
        'Surface Bright',
        colorScheme.surfaceBright,
        colorScheme.onSurface,
      ),
      (
        'Surface Container Lowest',
        colorScheme.surfaceContainerLowest,
        colorScheme.onSurface,
      ),
      (
        'Surface Container Low',
        colorScheme.surfaceContainerLow,
        colorScheme.onSurface,
      ),
      (
        'Surface Container',
        colorScheme.surfaceContainer,
        colorScheme.onSurface,
      ),
      (
        'Surface Container High',
        colorScheme.surfaceContainerHigh,
        colorScheme.onSurface,
      ),
      (
        'Surface Container Highest',
        colorScheme.surfaceContainerHighest,
        colorScheme.onSurface,
      ),
      (
        'On Surface',
        colorScheme.onSurface,
        colorScheme.surface,
      ),
      (
        'On Surface Variant',
        colorScheme.onSurfaceVariant,
        colorScheme.surface,
      ),
      (
        'Outline',
        colorScheme.outline,
        colorScheme.surface,
      ),
      (
        'Outline Variant',
        colorScheme.outlineVariant,
        colorScheme.surface,
      ),
      (
        'Inverse Surface',
        colorScheme.inverseSurface,
        colorScheme.onInverseSurface,
      ),
      (
        'On Inverse Surface',
        colorScheme.onInverseSurface,
        colorScheme.inverseSurface,
      ),
      (
        'Inverse Primary',
        colorScheme.inversePrimary,
        colorScheme.onPrimary,
      ),
      (
        'Surface Tint',
        colorScheme.surfaceTint,
        colorScheme.onSurface,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: LaunchURLText(
          label: 'ColorScheme Tokens',
          m3Url: 'https://m3.material.io/styles/color/roles',
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(M3MarginToken.mediumScreen.value),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Key Colors', style: textTheme.titleLarge),
                  SizedBox(height: M3SpacingToken.space16.value),
                  ...keyColors.map(
                    (p) =>
                        _KeyColorChip(name: p.$1, color: p.$2, onColor: p.$3),
                  ),
                ],
              ),
            ),
            SizedBox(width: M3SpacerToken.pane.value),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Scheme', style: textTheme.titleLarge),
                  SizedBox(height: M3SpacingToken.space16.value),
                  Wrap(
                    spacing: M3SpacingToken.space8.value,
                    runSpacing: M3SpacingToken.space8.value,
                    children: allColors
                        .map(
                          (p) => _ColorChip(
                            name: p.$1,
                            color: p.$2,
                            onColor: p.$3,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KeyColorChip extends StatelessWidget {
  const _KeyColorChip({
    required this.name,
    required this.color,
    required this.onColor,
  });
  final String name;
  final Color color;
  final Color onColor;

  String _colorToHex(Color color) =>
      '#${color.value.toRadixString(16).substring(2).toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(bottom: M3SpacingToken.space8.value),
      child: Container(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        decoration: BoxDecoration(
          color: color,
          borderRadius: M3BorderRadiusToken.medium.value,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: textTheme.titleMedium?.copyWith(color: onColor),
            ),
            Text(
              _colorToHex(color),
              style: textTheme.bodyMedium?.copyWith(color: onColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorChip extends StatelessWidget {
  const _ColorChip({
    required this.name,
    required this.color,
    required this.onColor,
  });
  final String name;
  final Color color;
  final Color onColor;

  String _colorToHex(Color color) =>
      '#${color.value.toRadixString(16).substring(2).toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 150,
      padding: EdgeInsets.all(M3SpacingToken.space8.value),
      decoration: BoxDecoration(
        color: color,
        borderRadius: M3BorderRadiusToken.small.value,
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: textTheme.labelLarge?.copyWith(color: onColor),
          ),
          Text(
            _colorToHex(color),
            style: textTheme.labelSmall?.copyWith(color: onColor),
          ),
        ],
      ),
    );
  }
}
