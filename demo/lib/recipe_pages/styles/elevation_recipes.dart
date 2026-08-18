import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Elevation destination.
class ElevationRecipes extends StatelessWidget {
  const ElevationRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Elevation',
      summary: 'In M3 a raised surface reads two ways at once: it casts a '
          'shadow, and it takes a tint of primary. M3Elevation is a composite '
          'token so you always get both, never one without the other.',
      groups: [
        RecipeGroup(
          title: 'M3Elevation',
          url: 'https://m3.material.io/styles/elevation/overview',
          recipes: [
            CodeRecipe(
              title: 'One level, both halves',
              summary: 'Read dp and shadows together. The tinted surface comes '
                  'from the same level, so a card cannot end up with level-1 '
                  'shadows on a level-3 surface.',
              code: '''
Container(
  decoration: ShapeDecoration(
    color: M3Elevation.level2.surfaceColor(context),
    shape: M3Shape.medium,
    shadows: M3Elevation.level2.shadows,
  ),
  child: card,
);

M3Elevation.level2.dp; // 3.0
''',
              preview: Wrap(
                spacing: M3Spacings.s16,
                runSpacing: M3Spacings.s16,
                children: [
                  for (final level in M3Elevation.values)
                    Container(
                      width: M3Spacings.s80,
                      height: M3Spacings.s64,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: level.surfaceColor(context),
                        shape: M3Shape.medium,
                        shadows: level.shadows,
                      ),
                      child: Text(
                        '${level.dp.toStringAsFixed(0)}dp',
                        style: M3TypeScale.labelMedium.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'The tint, straight off the scheme',
              summary: 'Same answer as surfaceColor, reached from whichever '
                  'side you already have — the level or the scheme.',
              code: '''
colorScheme.surfaceAtElevation(M3Elevation.level3);
M3Elevation.level3.surfaceColor(context);
''',
            ),
            const CodeRecipe(
              title: 'Coming back from a raw dp',
              summary: 'Flutter APIs hand back plain elevation doubles; '
                  'fromValue snaps one to the nearest M3 level instead of '
                  'letting it stay off-scale.',
              code: '''
final level = M3Elevation.fromValue(theme.cardTheme.elevation ?? 0);

level.isHigherThan(M3Elevation.level1);
level.differenceFrom(M3Elevation.level3);
''',
            ),
          ],
        ),
        const RecipeGroup(
          title: 'M3ElevationDps & M3ElevationShadows',
          url: 'https://m3.material.io/styles/elevation/tokens',
          recipes: [
            CodeRecipe(
              title: 'The halves on their own',
              summary: 'For the cases that genuinely want one without the '
                  'other — a Material widget that takes a bare elevation, or a '
                  'shadow on something that is not a surface.',
              code: '''
M3ElevationDps.level0; //  0dp
M3ElevationDps.level3; //  6dp
M3ElevationDps.level5; // 12dp

Material(elevation: M3ElevationDps.level2, child: sheet);

BoxDecoration(boxShadow: M3ElevationShadows.level1);
''',
            ),
            CodeRecipe(
              title: 'Shape and shadow in one decoration',
              summary: 'M3ShapeDecoration takes an M3Shape and a list of '
                  'M3BoxShadow, so a decoration cannot be half tokenized.',
              code: '''
DecoratedBox(
  decoration: M3ShapeDecoration(
    shape: M3Shape.large,
    color: colorScheme.surfaceContainer,
    shadows: M3ElevationShadows.level2,
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
