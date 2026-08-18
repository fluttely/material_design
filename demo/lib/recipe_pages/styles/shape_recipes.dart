import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Shape destination.
class ShapeRecipes extends StatelessWidget {
  const ShapeRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Shape',
      summary: 'The M3 shape scale has exactly seven stops. Every shape type '
          'here extends its Flutter counterpart, so they drop into any slot '
          'that already takes a Radius, a BorderRadius or a ShapeBorder.',
      groups: [
        RecipeGroup(
          title: 'M3Shape & M3Corners',
          url: 'https://m3.material.io/styles/shape/shape-scale-tokens',
          recipes: [
            CodeRecipe(
              title: 'A shape for a component',
              summary: 'M3Shape is a RoundedRectangleBorder, so it goes '
                  'straight into Card, Dialog, or anything taking a '
                  'ShapeBorder.',
              code: '''
Card(shape: M3Shape.medium);           // 12dp
Dialog(shape: M3Shape.extraLarge);     // 28dp
FloatingActionButton(shape: M3Shape.large, onPressed: onTap);
''',
              preview: Wrap(
                spacing: M3Spacings.s12,
                runSpacing: M3Spacings.s12,
                children: [
                  for (final (label, shape) in <(String, M3Shape)>[
                    ('none', M3Shape.none),
                    ('extraSmall', M3Shape.extraSmall),
                    ('small', M3Shape.small),
                    ('medium', M3Shape.medium),
                    ('large', M3Shape.large),
                    ('extraLarge', M3Shape.extraLarge),
                    ('full', M3Shape.full),
                  ])
                    Container(
                      width: M3Spacings.s96,
                      height: M3Spacings.s56,
                      alignment: Alignment.center,
                      decoration: M3ShapeDecoration(
                        shape: shape,
                        color: colorScheme.secondaryContainer,
                      ),
                      child: Text(
                        label,
                        style: M3TypeScale.labelSmall.copyWith(
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'The seven corner values',
              summary: 'The dp behind each stop, for the rare place that wants '
                  'the number rather than the shape.',
              code: '''
M3Corners.none;       //  0dp
M3Corners.extraSmall; //  4dp
M3Corners.small;      //  8dp
M3Corners.medium;     // 12dp
M3Corners.large;      // 16dp
M3Corners.extraLarge; // 28dp
M3Corners.full;       // a pill
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3BorderRadius & M3Radius',
          url: 'https://m3.material.io/styles/shape/shape-scale-tokens',
          recipes: [
            CodeRecipe(
              title: 'Round some corners and not others',
              summary: 'The M3 way to shape a bottom sheet or a grouped list '
                  'item: name a radius per corner, each one a token.',
              code: '''
const M3BorderRadius.only(
  topLeft: M3Radius.large,
  topRight: M3Radius.large,
);

const M3BorderRadius.vertical(top: M3Radius.extraLarge);
const M3BorderRadius.all(M3Radius.medium);
M3BorderRadius.full; // and the seven ready-made stops
''',
              preview: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: M3Spacings.s64,
                      decoration: M3BoxDecoration(
                        color: colorScheme.tertiaryContainer,
                        borderRadius: const M3BorderRadius.only(
                          topLeft: M3Radius.extraLarge,
                          topRight: M3Radius.extraLarge,
                        ),
                      ),
                    ),
                  ),
                  const M3Gap(M3Spacings.s16),
                  Expanded(
                    child: Container(
                      height: M3Spacings.s64,
                      decoration: M3BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: M3BorderRadius.full,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'Decorate a container',
              summary: 'M3BoxDecoration accepts only M3 radii, borders and '
                  'shadows — the whole decoration is inside the contract or '
                  'none of it is.',
              code: '''
Container(
  decoration: M3BoxDecoration(
    color: colorScheme.surfaceContainer,
    borderRadius: M3BorderRadius.large,
    border: M3Border.thin(colorScheme.outlineVariant),
    boxShadow: M3ElevationShadows.level1,
  ),
  child: content,
)
''',
            ),
          ],
        ),
      ],
    );
  }
}
