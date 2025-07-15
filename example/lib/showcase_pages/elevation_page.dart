import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'dart:ui';

class ElevationPage extends StatelessWidget {
  const ElevationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Elevation')),
      body: ListView(
        padding: const EdgeInsets.all(MaterialSpacing.space24),
        children: const [
          _ElevationShowcase(
            title: 'Surface Tint Color Only',
            useSurfaceTint: true,
            useShadow: false,
          ),
          _ElevationShowcase(
            title: 'Shadow Only',
            useSurfaceTint: false,
            useShadow: true,
          ),
          _ElevationShowcase(
            title: 'Surface Tint Color and Shadow',
            useSurfaceTint: true,
            useShadow: true,
          ),
        ],
      ),
    );
  }
}

class _ElevationShowcase extends StatefulWidget {
  const _ElevationShowcase({
    required this.title,
    required this.useSurfaceTint,
    required this.useShadow,
  });
  final String title;
  final bool useSurfaceTint;
  final bool useShadow;

  @override
  State<_ElevationShowcase> createState() => _ElevationShowcaseState();
}

class _ElevationShowcaseState extends State<_ElevationShowcase> {
  double _currentElevation = 0;

  List<BoxShadow> _getShadowsForElevation(double elevation) {
    if (elevation <= 0) return [];
    if (elevation >= 12) return MaterialShadow.level5;

    final levels = [0.0, 1.0, 3.0, 6.0, 8.0, 12.0];
    final shadows = [
      MaterialShadow.level0,
      MaterialShadow.level1,
      MaterialShadow.level2,
      MaterialShadow.level3,
      MaterialShadow.level4,
      MaterialShadow.level5,
    ];

    int lowerIndex = levels.lastIndexWhere((l) => l <= elevation);
    int upperIndex = lowerIndex + 1;

    final lowerLevel = levels[lowerIndex];
    final upperLevel = levels[upperIndex];
    final lowerShadows = shadows[lowerIndex];
    final upperShadows = shadows[upperIndex];

    final t = (elevation - lowerLevel) / (upperLevel - lowerLevel);

    if (lowerShadows.isEmpty) return upperShadows;

    List<BoxShadow> lerpedShadows = [];
    for (int i = 0; i < lowerShadows.length; i++) {
      lerpedShadows.add(BoxShadow.lerp(lowerShadows[i], upperShadows[i], t)!);
    }
    return lerpedShadows;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    final surfaceColor = widget.useSurfaceTint
        ? MaterialSurface.getTintedColor(context, _currentElevation)
        : colorScheme.surface;
        
    final shadows = widget.useShadow
        ? _getShadowsForElevation(_currentElevation)
        : <BoxShadow>[];

    return Padding(
      padding: const EdgeInsets.only(bottom: MaterialSpacing.space32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: MaterialTypeScale.titleLarge),
          const SizedBox(height: MaterialSpacing.space16),
          Container(
            height: 120,
            decoration: ShapeDecoration(
              color: surfaceColor,
              shape: MaterialShape.medium,
              shadows: shadows,
            ),
            child: Center(
              child: Text(
                'Elevation: ${_currentElevation.toStringAsFixed(1)}dp',
                style: MaterialTypeScale.bodyLarge,
              ),
            ),
          ),
          const SizedBox(height: MaterialSpacing.space8),
          Slider(
            value: _currentElevation,
            min: 0,
            max: 16,
            divisions: 160,
            label: _currentElevation.toStringAsFixed(1),
            onChanged: (value) {
              setState(() {
                _currentElevation = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
