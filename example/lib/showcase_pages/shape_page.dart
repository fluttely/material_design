import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class ShapePage extends StatelessWidget {
  const ShapePage({super.key});

  @override
  Widget build(BuildContext context) {
    final shapes = [
      ('None', MaterialShape.none),
      ('Extra Small', MaterialShape.extraSmall),
      ('Small', MaterialShape.small),
      ('Medium', MaterialShape.medium),
      ('Large', MaterialShape.large),
      ('Extra Large', MaterialShape.extraLarge),
      ('Full (Stadium)', MaterialShape.full),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Shape Tokens')),
      body: GridView.builder(
        padding: const EdgeInsets.all(MaterialSpacing.space24),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          mainAxisSpacing: MaterialSpacing.space16,
          crossAxisSpacing: MaterialSpacing.space16,
        ),
        itemCount: shapes.length,
        itemBuilder: (context, index) {
          final (label, shape) = shapes[index];
          return Container(
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              shape: shape,
            ),
            child: Center(
              child: Text(
                label,
                style: MaterialTypeScale.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
