import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';

class ShapePage extends StatelessWidget {
  const ShapePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Each level with the M3Corners radius behind it, so the number on the
    // tile is read off the token rather than typed beside it.
    final shapes = [
      ('None', M3Shape.none, M3Corners.none),
      ('Extra Small', M3Shape.extraSmall, M3Corners.extraSmall),
      ('Small', M3Shape.small, M3Corners.small),
      ('Medium', M3Shape.medium, M3Corners.medium),
      ('Large', M3Shape.large, M3Corners.large),
      ('Extra Large', M3Shape.extraLarge, M3Corners.extraLarge),
      ('Full (Stadium)', M3Shape.full, M3Corners.full),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Shape')),
      body: Column(
        children: [
          const M3Padding(
            padding: M3EdgeInsets.only(left: M3Spacings.s12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowcaseLink(label: 'M3Corners'),
                  Icon(Icons.keyboard_arrow_down_rounded),
                  ShowcaseLink(label: 'M3Radius'),
                  Icon(Icons.keyboard_arrow_down_rounded),
                  ShowcaseLink(label: 'M3BorderRadius'),
                  Icon(Icons.keyboard_arrow_down_rounded),
                  ShowcaseLink(
                    label: 'M3Shape',
                    url:
                        'https://m3.material.io/styles/shape/corner-radius-scale',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const M3EdgeInsets.all(M3Margins.mediumScreen),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.5,
                mainAxisSpacing: M3Spacings.s16,
                crossAxisSpacing: M3Spacings.s16,
              ),
              itemCount: shapes.length,
              itemBuilder: (context, index) {
                final (label, shape, corner) = shapes[index];
                return Container(
                  decoration: ShapeDecoration(
                    color: colorScheme.surfaceContainer,
                    shape: shape,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        corner == M3Corners.full
                            ? 'M3Corners.full'
                            : '${corner.toInt()}dp',
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
