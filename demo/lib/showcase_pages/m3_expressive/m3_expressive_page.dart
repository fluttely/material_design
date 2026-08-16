import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/m3_expressive/loading_indicator/loading_indicator_page.dart';
import 'package:material_design_demo/m3_expressive/new_shapes/shapes_preview.dart';
import 'package:material_design_demo/m3_expressive/shape_border/shape_border_showcase.dart';

class M3ExpressivePage extends StatelessWidget {
  const M3ExpressivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('M3 Expressive'),
      ),
      body: SingleChildScrollView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Loading Indicator', style: textTheme.headlineSmall),
            const M3Gap(M3Spacings.s8),
            Text(
              'The M3 Expressive loading indicator morphs between shapes '
              'while it spins, in a default and a contained variant.',
              style: textTheme.bodyMedium,
            ),
            const M3Gap(M3Spacings.s16),
            const LoadingIndicatorPage(),
            const M3Gap(M3Spacings.s32),
            Text('Shape Library', style: textTheme.headlineSmall),
            const M3Gap(M3Spacings.s8),
            Text(
              'The expressive shape library morphs continuously through the '
              'full Material Shapes catalog.',
              style: textTheme.bodyMedium,
            ),
            const M3Gap(M3Spacings.s16),
            const ShapesPreview(),
            const M3Gap(M3Spacings.s32),
            Text('Shapes as Borders', style: textTheme.headlineSmall),
            const M3Gap(M3Spacings.s8),
            Text(
              'M3EShapeBorder turns the shape library into an OutlinedBorder, '
              'so a Material, a Card or a ShapeDecoration can wear an '
              'Expressive shape — and morph between two of them.',
              style: textTheme.bodyMedium,
            ),
            const M3Gap(M3Spacings.s16),
            const ShapeBorderShowcase(),
          ],
        ),
      ),
    );
  }
}
