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
      ('None', M3ShapeToken.none.value),
      ('Extra Small', M3ShapeToken.extraSmall.value),
      ('Small', M3ShapeToken.small.value),
      ('Medium', M3ShapeToken.medium.value),
      ('Large', M3ShapeToken.large.value),
      ('Large Increased', M3ShapeToken.largeIncreased.value),
      ('Extra Large', M3ShapeToken.extraLarge.value),
      ('Extra Large Increased', M3ShapeToken.extraLargeIncreased.value),
      ('Extra Extra Large', M3ShapeToken.extraExtraLarge.value),
      ('Full (Stadium)', M3ShapeToken.full.value),
    ];

    return Scaffold(
      appBar: AppBar(
        title: LaunchURLText(
          label: 'M3ShapeToken',
          m3Url: 'https://m3.material.io/styles/shape/corner-radius-scale',
        ),
      ),
      body: GridView.builder(
        padding: M3EdgeInsets.all(M3MarginToken.mediumScreen),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          mainAxisSpacing: M3SpacingToken.space16.value,
          crossAxisSpacing: M3SpacingToken.space16.value,
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
    );
  }
}
