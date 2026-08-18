import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Components destination.
class ComponentRecipes extends StatelessWidget {
  const ComponentRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Components',
      summary: 'This package ships no M3 components — Flutter owns those. '
          'What it ships is their measurements, so a control you build by '
          'hand lands on the same numbers as the built-in one beside it.',
      groups: [
        RecipeGroup(
          title: 'M3ButtonHeights',
          url: 'https://m3.material.io/components/buttons/specs',
          recipes: [
            CodeRecipe(
              title: 'The five Expressive size classes',
              summary: 'extraSmall (32dp) and small (40dp) are below the 48dp '
                  'touch minimum on purpose — they are visual heights. Expand '
                  'the tap area, not the box.',
              code: '''
SizedBox(
  height: M3ButtonHeights.medium, // 56dp
  child: FilledButton(onPressed: onSave, child: const Text('Save')),
)
''',
              preview: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final (label, height) in <(String, double)>[
                    ('xs', M3ButtonHeights.extraSmall),
                    ('s', M3ButtonHeights.small),
                    ('m', M3ButtonHeights.medium),
                    ('l', M3ButtonHeights.large),
                  ])
                    M3Padding(
                      padding: const M3EdgeInsets.only(right: M3Spacings.s8),
                      child: Container(
                        width: M3Spacings.s56,
                        height: height,
                        alignment: Alignment.center,
                        decoration: M3ShapeDecoration(
                          shape: M3Shape.full,
                          color: colorScheme.secondaryContainer,
                        ),
                        child: Text(
                          label,
                          style: M3TypeScale.labelMedium.copyWith(
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const RecipeGroup(
          title: 'The rest of the measurements',
          url: 'https://m3.material.io/components',
          recipes: [
            CodeRecipe(
              title: 'FABs, app bars, navigation, list items',
              summary: 'Values only. Reach for them when you are building the '
                  'custom thing that has to line up with the standard one.',
              code: '''
M3FabSizes.small;                    //  40dp
M3FabSizes.standard;                 //  56dp
M3FabSizes.large;                    //  96dp

M3AppBarHeights.small;               //  64dp
M3AppBarHeights.large;               // 152dp

M3NavigationSizes.barHeight;         //  80dp
M3NavigationSizes.railWidth;         //  80dp
M3NavigationSizes.extendedRailWidth; // 256dp
M3NavigationSizes.drawerWidth;       // 360dp

M3ListItemHeights.oneLine;           //  56dp
M3ListItemHeights.twoLine;           //  72dp
M3ListItemHeights.threeLine;         //  88dp
''',
            ),
            CodeRecipe(
              title: 'A rail built to the spec',
              summary: 'This demo\'s own rail is drawn from these — the '
                  'indicator is a 56×32dp stadium because the token says so, '
                  'not because it looked right.',
              code: '''
SizedBox(
  width: M3NavigationSizes.railWidth,
  child: Column(
    children: [
      for (final destination in destinations)
        SizedBox(
          height: M3NavigationSizes.railDestinationHeight,
          child: destination,
        ),
    ],
  ),
)
''',
            ),
          ],
        ),
      ],
    );
  }
}
