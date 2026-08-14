import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

class ShapePage extends StatelessWidget {
  const ShapePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final shapes = [
      ('None', M3Shape.none),
      ('Extra Small', M3Shape.extraSmall),
      ('Small', M3Shape.small),
      ('Medium', M3Shape.medium),
      ('Large', M3Shape.large),
      ('Extra Large', M3Shape.extraLarge),
      ('Full (Stadium)', M3Shape.full),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Shape')),
      body: Column(
        children: [
          M3Padding(
            padding: M3EdgeInsets.only(left: M3Spacings.s12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LaunchURLText(label: 'M3Corners'),
                  Icon(Icons.keyboard_arrow_down_rounded),
                  LaunchURLText(label: 'M3Radius'),
                  Icon(Icons.keyboard_arrow_down_rounded),
                  LaunchURLText(label: 'M3BorderRadius'),
                  Icon(Icons.keyboard_arrow_down_rounded),
                  LaunchURLText(
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
              padding: M3EdgeInsets.all(M3Margins.mediumScreen),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.5,
                mainAxisSpacing: M3Spacings.s16,
                crossAxisSpacing: M3Spacings.s16,
              ),
              itemCount: shapes.length,
              itemBuilder: (context, index) {
                final (label, shape) = shapes[index];
                return Container(
                  decoration: ShapeDecoration(
                    color: colorScheme.surfaceContainer,
                    shape: shape,
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
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
