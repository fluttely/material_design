import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

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
      appBar: AppBar(title: const Text('M3Shape Tokens')),
      body: GridView.builder(
        padding: const EdgeInsets.all(M3Spacing.space24),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          mainAxisSpacing: M3Spacing.space16,
          crossAxisSpacing: M3Spacing.space16,
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
