// The whole m3e module is @experimental; recipes for it necessarily opt in.
// ignore_for_file: experimental_member_use

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Expressive destination.
class ExpressiveRecipes extends StatelessWidget {
  const ExpressiveRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Expressive',
      summary: 'The 2025 M3 Expressive primitives. Every symbol is prefixed '
          'M3E and marked @experimental, so the analyzer tells you when you '
          'opt in — Material is still iterating on this upstream.',
      groups: [
        RecipeGroup(
          title: 'M3EShapeBorder',
          url: 'https://m3.material.io/styles/shape/shape-scale-tokens',
          recipes: [
            CodeRecipe(
              title: 'Any shape, anywhere Flutter takes a ShapeBorder',
              summary: 'It is a real OutlinedBorder, so Card, Material and '
                  'ShapeDecoration all accept it — and ink splashes clip to '
                  'the petals rather than to a rectangle.',
              code: '''
// ignore_for_file: experimental_member_use
Card(shape: M3EShapeBorder(M3EShapes.cookie7Sided));

Material(
  shape: M3EShapeBorder(M3EShapes.clover4Leaf),
  color: colorScheme.primaryContainer,
  child: InkWell(onTap: onTap, child: content),
);
''',
              preview: Wrap(
                spacing: M3Spacings.s16,
                runSpacing: M3Spacings.s16,
                children: [
                  for (final shape in <M3ERoundedPolygon>[
                    M3EShapes.clover4Leaf,
                    M3EShapes.cookie7Sided,
                    M3EShapes.sunny,
                    M3EShapes.pill,
                    M3EShapes.heart,
                  ])
                    SizedBox(
                      width: M3Spacings.s64,
                      height: M3Spacings.s64,
                      child: Material(
                        shape: M3EShapeBorder(shape),
                        color: colorScheme.primaryContainer,
                      ),
                    ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'Morphing is free',
              summary: 'Lerping two of these runs the real morph algorithm '
                  'rather than crossfading outlines, so any implicit '
                  'animation morphs without you wiring anything up.',
              code: '''
AnimatedContainer(
  duration: M3Motion.emphasized.duration,
  curve: M3Motion.emphasized.curve,
  decoration: ShapeDecoration(
    color: colorScheme.primaryContainer,
    shape: M3EShapeBorder(
      expanded ? M3EShapes.burst : M3EShapes.circle,
    ),
  ),
)
''',
              preview: _MorphDemo(),
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3EShapes & M3EMorph',
          url: 'https://m3.material.io/styles/shape/overview',
          recipes: [
            const CodeRecipe(
              title: 'The 35-shape library',
              summary: 'The official catalog, normalised to the unit square. '
                  'Members are static final, not const — the geometry is '
                  'computed.',
              code: '''
M3EShapes.circle;
M3EShapes.square;
M3EShapes.triangle;
M3EShapes.pentagon;
M3EShapes.cookie7Sided;
M3EShapes.clover4Leaf;
M3EShapes.burst;
M3EShapes.flower;
M3EShapes.heart;
''',
            ),
            const CodeRecipe(
              title: 'Draw or animate one yourself',
              summary: 'toPath gives a Path for a CustomPainter; M3EMorph '
                  'gives the shape halfway between two, for when you are '
                  'driving the progress by hand.',
              code: '''
final path = M3EShapes.sunny.toPath();
canvas.drawPath(path, paint);

final morph = M3EMorph(M3EShapes.circle, M3EShapes.burst);
final halfway = morph.toPath(progress: 0.5);
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3ELoadingIndicator',
          url: 'https://m3.material.io/components/loading-indicator/overview',
          recipes: [
            CodeRecipe(
              title: 'The indicator Flutter does not have yet',
              summary: 'Morphs through the shape library while it spins. A '
                  'stopgap by design: it goes when Flutter ships the real '
                  'one.',
              code: '''
M3ELoadingIndicator();

M3ELoadingIndicator.contained(
  activeIndicatorColor: colorScheme.onPrimaryContainer,
  containerColor: colorScheme.primaryContainer,
);

// Or morph through shapes you choose:
M3ELoadingIndicator(
  indicatorPolygons: [M3EShapes.circle, M3EShapes.clover4Leaf],
);
''',
              preview: Row(
                children: [
                  SizedBox(
                    width: M3Spacings.s48,
                    height: M3Spacings.s48,
                    child: M3ELoadingIndicator(),
                  ),
                  const M3Gap(M3Spacings.s24),
                  SizedBox(
                    width: M3Spacings.s64,
                    height: M3Spacings.s64,
                    child: M3ELoadingIndicator.contained(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// A container morphing between two expressive shapes.
class _MorphDemo extends StatefulWidget {
  const _MorphDemo();

  @override
  State<_MorphDemo> createState() => _MorphDemoState();
}

class _MorphDemoState extends State<_MorphDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: M3Motion.emphasized.duration,
          curve: M3Motion.emphasized.curve,
          width: M3Spacings.s96,
          height: M3Spacings.s96,
          decoration: ShapeDecoration(
            color: colorScheme.primaryContainer,
            shape: M3EShapeBorder(
              _expanded ? M3EShapes.burst : M3EShapes.circle,
            ),
          ),
        ),
        const M3Gap(M3Spacings.s12),
        FilledButton.tonal(
          onPressed: () => setState(() => _expanded = !_expanded),
          child: const Text('Morph'),
        ),
      ],
    );
  }
}
