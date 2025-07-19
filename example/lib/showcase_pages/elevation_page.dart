import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class ElevationPage extends StatelessWidget {
  const ElevationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('M3Elevation Tokens')),
      body: ListView(
        padding: const EdgeInsets.all(M3Spacing.space24),
        children: const [
          _ElevationShowcase(
            title: 'Surface Tint Color Only',
            useShadow: false,
          ),
          _ElevationShowcase(
            title: 'Surface Tint Color and Shadow Color',
            useShadow: true,
          ),
        ],
      ),
    );
  }
}

class _ElevationShowcase extends StatelessWidget {
  const _ElevationShowcase({
    required this.title,
    required this.useShadow,
  });

  final String title;
  final bool useShadow;

  @override
  Widget build(BuildContext context) {
    final elevationLevels = [
      (M3Elevation.level0, 'Level 0', '0%'),
      (M3Elevation.level1, 'Level 1', '5%'),
      (M3Elevation.level2, 'Level 2', '8%'),
      (M3Elevation.level3, 'Level 3', '11%'),
      (M3Elevation.level4, 'Level 4', '12%'),
      (M3Elevation.level5, 'Level 5', '14%'),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: M3Spacing.space32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: M3TypeScale.titleLarge),
          const SizedBox(height: M3Spacing.space16),
          Wrap(
            spacing: M3Spacing.space16,
            runSpacing: M3Spacing.space16,
            children: elevationLevels.asMap().entries.map((entry) {
              final elevation = entry.value.$1;
              final levelName = entry.value.$2;
              final levelPercent = entry.value.$3;

              final surfaceColor = M3TonalColor.fromElevation(
                context,
                elevation,
              );

              final shadows = useShadow
                  ? M3Shadow.fromElevation(elevation)
                  : <BoxShadow>[];

              return Container(
                width: double.infinity,
                height: M3Spacing.space120,
                decoration: ShapeDecoration(
                  color: surfaceColor,
                  shadows: shadows,
                  shape: M3Shape.small,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(M3Spacing.space8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            levelName,
                            style: M3TypeScale.labelMedium,
                          ),
                          Text(
                            '${elevation.toStringAsFixed(0)} dp',
                            style: M3TypeScale.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(M3Spacing.space8),
                        child: Text(
                          levelPercent,
                          style: M3TypeScale.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
