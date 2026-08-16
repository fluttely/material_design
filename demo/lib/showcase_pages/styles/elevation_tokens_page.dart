import 'package:flutter/material.dart';
// Make sure this import points to the file where
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';

class ElevationPage extends StatelessWidget {
  const ElevationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final elevations = [
      (M3Elevation.level0, true, 'Level 0'),
      (M3Elevation.level1, true, 'Level 1'),
      (M3Elevation.level2, true, 'Level 2'),
      (M3Elevation.level3, true, 'Level 3'),
      (M3Elevation.level4, true, 'Level 4'),
      (M3Elevation.level5, true, 'Level 5'),
    ];

    final elevationsWithoutShadow = [
      (M3Elevation.level0, false, 'Level 0'),
      (M3Elevation.level1, false, 'Level 1'),
      (M3Elevation.level2, false, 'Level 2'),
      (M3Elevation.level3, false, 'Level 3'),
      (M3Elevation.level4, false, 'Level 4'),
      (M3Elevation.level5, false, 'Level 5'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Elevation'),
      ),
      body: ListView(
        padding: M3EdgeInsets.all(M3Margins.mediumScreen),
        children: [
          Text(
            'Elevation in M3 is a combination of a surface tint and, for some components, a shadow. Below, the cards are rendered according to the official rules defined in the M3ElevationDps | M3Elevation classes.',
            style: textTheme.bodyMedium,
          ),
          const M3Gap(M3Spacings.s16),
          ShowcaseLink(
            label: 'M3ElevationDps | M3Elevation',
            url: 'https://m3.material.io/styles/elevation/overview',
          ),
          _ElevationGrid(
            title: '(Surface Tint Color and Shadow Color)',
            elevations: elevations,
          ),
          const M3Gap(M3Spacings.s32),
          _ElevationGrid(
            title: '(Surface Tint Color Only)',
            elevations: elevationsWithoutShadow,
          ),
        ],
      ),
    );
  }
}

/// The Grid now receives a list of profiles, no longer a complex tuple.
class _ElevationGrid extends StatelessWidget {
  const _ElevationGrid({
    required this.title,
    required this.elevations,
  });

  final String title;
  final List<(M3Elevation, bool, String)> elevations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowcaseLink(label: title),
        Wrap(
          spacing: M3Spacings.s16,
          runSpacing: M3Spacings.s16,
          children: elevations.map((data) {
            // Passes the entire profile object and the name to the card.
            return _ElevationCard(
              elevation: data.$1,
              useShadows: data.$2,
              name: data.$3,
            );
          }).toList(),
        ),
      ],
    );
  }
}

/// The Card has been simplified to receive a single `profile` object.
class _ElevationCard extends StatelessWidget {
  const _ElevationCard({
    required this.elevation,
    required this.useShadows,
    required this.name,
  });

  final M3Elevation elevation;
  final bool useShadows;
  final String name;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 160,
      height: 120,
      decoration: M3ShapeDecoration(
        shape: M3Shape.small,
        color: elevation.surfaceColor(context),
        shadows: useShadows ? elevation.shadows : null,
      ),
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: textTheme.labelLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              '${elevation.dp.toStringAsFixed(0)} dp',
              style: textTheme.bodySmall,
            ),
            const Spacer(),
            // Displays an icon indicating the presence of a shadow for visual clarity.
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                useShadows && elevation.dp > 0
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: M3IconSizes.dense,
                color: textTheme.bodySmall?.color
                    ?.withValues(alpha: M3Contract.opacity(0.75)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
