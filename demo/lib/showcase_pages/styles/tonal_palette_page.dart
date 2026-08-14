import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

/// Demonstrates M3TonalPalette, M3ColorSchemeTokens, and M3ColorUtils helpers.
class TonalPalettePage extends StatelessWidget {
  const TonalPalettePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tonal Palette')),
      body: ListView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        children: [
          LaunchURLText(
            label: 'M3TonalPalette | M3ColorSchemeTokens',
            url:
                'https://m3.material.io/styles/color/the-color-system/key-colors-tones',
          ),
          const M3Gap(M3Spacings.s16),
          _buildTonalPaletteSection(context, colorScheme),
          const M3Gap(M3Spacings.s24),
          _buildStateColorsSection(context, colorScheme),
          const M3Gap(M3Spacings.s24),
          _buildSurfaceElevationSection(context, colorScheme),
          const M3Gap(M3Spacings.s24),
          _buildContrastSection(context, colorScheme),
        ],
      ),
    );
  }

  Widget _buildTonalPaletteSection(BuildContext context, ColorScheme cs) {
    final palette = M3TonalPalette.fromColor(cs.primary);

    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3TonalPalette',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'Tones 0–100 generated from the primary seed color in HCT '
              'space — the same math Material Design uses.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            // Tone strip
            ClipRRect(
              borderRadius: M3BorderRadius.medium,
              child: Row(
                children: M3Tones.values.map((tone) {
                  final color = palette[tone];
                  final isLight = M3ColorUtils.isLight(color);
                  return Expanded(
                    child: Tooltip(
                      message: 'Tone $tone',
                      child: Container(
                        height: 48,
                        color: color,
                        child: Center(
                          child: Text(
                            '$tone',
                            style: TextStyle(
                              fontSize: 9,
                              color: isLight ? Colors.black54 : Colors.white54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const M3Gap(M3Spacings.s12),
            Wrap(
              spacing: M3Spacings.s8,
              runSpacing: M3Spacings.s8,
              children: M3Tones.values.map((tone) {
                final color = palette[tone];
                final isLight = M3ColorUtils.isLight(color);
                return Container(
                  width: 56,
                  padding: M3EdgeInsets.symmetric(vertical: M3Spacings.s8),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: M3BorderRadius.small,
                    border: Border.all(
                      color: cs.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$tone',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: isLight ? Colors.black : Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateColorsSection(BuildContext context, ColorScheme cs) {
    final base = cs.primary;
    final stateColors = [
      ('Default', base),
      ('Hover  8%', cs.stateLayerColor(base, M3InteractionState.hover)),
      ('Focus 10%', cs.stateLayerColor(base, M3InteractionState.focus)),
      ('Press 10%', cs.stateLayerColor(base, M3InteractionState.pressed)),
      ('Drag  16%', cs.stateLayerColor(base, M3InteractionState.dragged)),
      ('Disabled 38%', cs.disabledContent(base)),
    ];

    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3ColorSchemeTokens — State layers',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'Extension on ColorScheme that returns the correct overlay color '
              'for each M3 interaction state.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            ...stateColors.map(
              (entry) => M3Padding(
                padding: M3EdgeInsets.only(bottom: M3Spacings.s8),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: entry.$2,
                        borderRadius: M3BorderRadius.small,
                        border: Border.all(
                          color: cs.outline.withValues(alpha: 0.3),
                        ),
                      ),
                    ),
                    const M3Gap(M3Spacings.s12),
                    Text(
                      entry.$1,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSurfaceElevationSection(BuildContext context, ColorScheme cs) {
    final elevations = [
      (elevation: M3Elevation.level0, label: 'L0'),
      (elevation: M3Elevation.level1, label: 'L1'),
      (elevation: M3Elevation.level2, label: 'L2'),
      (elevation: M3Elevation.level3, label: 'L3'),
      (elevation: M3Elevation.level4, label: 'L4'),
      (elevation: M3Elevation.level5, label: 'L5'),
    ];

    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3ColorSchemeTokens — Surface tint',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'surfaceAtElevation applies the primary tint color at increasing '
              'opacity as elevation increases — the M3 tonal elevation system.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            Row(
              children: elevations
                  .map(
                    (e) => Expanded(
                      child: Tooltip(
                        message: '${e.elevation.dp.toInt()}dp',
                        child: Container(
                          height: 64,
                          margin: M3EdgeInsets.only(right: M3Spacings.s4),
                          decoration: BoxDecoration(
                            color: cs.surfaceAtElevation(e.elevation),
                            borderRadius: M3BorderRadius.small,
                            border: Border.all(
                              color: cs.outline.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              e.label,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: cs.onSurface),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContrastSection(BuildContext context, ColorScheme cs) {
    final pairs = [
      ('Primary on Surface', cs.primary, cs.surface),
      ('onPrimary on Primary', cs.onPrimary, cs.primary),
      ('onSurface on Surface', cs.onSurface, cs.surface),
      ('Outline on Surface', cs.outline, cs.surface),
    ];

    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3ColorSchemeTokens — isAccessible',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'Checks if a foreground/background pair meets WCAG AA (4.5:1).',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            ...pairs.map((p) {
              final accessible = cs.isAccessible(p.$2, p.$3);
              final ratio = M3ColorUtils.calculateContrast(p.$2, p.$3);
              return M3Padding(
                padding: M3EdgeInsets.only(bottom: M3Spacings.s12),
                child: Container(
                  padding: M3EdgeInsets.all(M3Spacings.s12),
                  decoration: BoxDecoration(
                    color: p.$3,
                    borderRadius: M3BorderRadius.small,
                    border: Border.all(
                      color: (accessible ? Colors.green : Colors.red)
                          .withValues(alpha: 0.5),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          p.$1,
                          style: TextStyle(
                            color: p.$2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const M3Gap(M3Spacings.s8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${ratio.toStringAsFixed(1)}:1',
                            style: TextStyle(
                              color: p.$2,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            accessible ? Icons.check_circle : Icons.cancel,
                            color: accessible ? Colors.green : Colors.red,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
