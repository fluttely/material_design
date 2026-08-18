import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Opacity destination.
class OpacityRecipes extends StatelessWidget {
  const OpacityRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Opacity',
      summary: 'M3 specifies two separate opacity scales: what a disabled or '
          'scrimmed element looks like, and how strong a state layer is. '
          'Neither is a number you get to pick.',
      groups: [
        RecipeGroup(
          title: 'M3Opacities',
          url: 'https://m3.material.io/foundations/interaction/states/'
              'state-layers',
          recipes: [
            CodeRecipe(
              title: 'Disabled content and containers',
              summary: 'Content fades to 38%, its container to 12%. The '
                  'ColorScheme extensions apply both without you naming the '
                  'percentage.',
              code: '''
Text(
  'Unavailable',
  style: TextStyle(
    color: colorScheme.disabledContent(colorScheme.onSurface),
  ),
);

Container(
  color: colorScheme.disabledContainer(colorScheme.onSurface),
);
''',
              preview: Row(
                children: [
                  Text(
                    'Enabled',
                    style: M3TypeScale.bodyLarge.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const M3Gap(M3Spacings.s24),
                  Text(
                    'Disabled',
                    style: M3TypeScale.bodyLarge.copyWith(
                      color: colorScheme.disabledContent(colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'The four values, when you need them raw',
              summary: 'Pass them to withValues — the token is a double, so '
                  'nothing needs unwrapping first.',
              code: '''
M3Opacities.disabledContent;   // 38%
M3Opacities.disabledContainer; // 12%
M3Opacities.divider;           // 12%
M3Opacities.backdrop;          // 50% — the scrim behind a modal

colorScheme.scrim.withValues(alpha: M3Opacities.backdrop);
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3StateLayerOpacities & M3InteractionState',
          url: 'https://m3.material.io/foundations/interaction/states/'
              'state-layers',
          recipes: [
            CodeRecipe(
              title: 'The state layer for a state',
              summary: 'M3InteractionState pairs the situation with its '
                  'opacity, so you select by what is happening rather than by '
                  'the number.',
              code: '''
Container(
  color: colorScheme.stateLayerColor(
    colorScheme.onSurface,
    M3InteractionState.hover,
  ),
);

// Or the opacity alone:
colorScheme.onSurface.withValues(
  alpha: M3InteractionState.pressed.stateLayerOpacity,
);
''',
              preview: Row(
                children: [
                  for (final state in M3InteractionState.values)
                    M3Padding(
                      padding: const M3EdgeInsets.only(right: M3Spacings.s8),
                      child: Container(
                        width: M3Spacings.s72,
                        height: M3Spacings.s48,
                        alignment: Alignment.center,
                        decoration: M3ShapeDecoration(
                          shape: M3Shape.small,
                          color: colorScheme.stateLayerColor(
                            colorScheme.onSurface,
                            state,
                          ),
                        ),
                        child: Text(
                          state.name,
                          style: M3TypeScale.labelSmall.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'The scale behind the states',
              summary: 'Focus and pressed share 10% in the current spec — '
                  'they are still separate tokens, because they are separate '
                  'decisions.',
              code: '''
M3StateLayerOpacities.hover;   //  8%
M3StateLayerOpacities.focus;   // 10%
M3StateLayerOpacities.pressed; // 10%
M3StateLayerOpacities.dragged; // 16%
''',
            ),
          ],
        ),
      ],
    );
  }
}
