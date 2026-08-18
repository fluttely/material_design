import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Interaction destination.
class InteractionRecipes extends StatelessWidget {
  const InteractionRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Interaction',
      summary: 'Hover, focus, press and drag each have a specified overlay '
          'strength, and a specified precedence when two are true at once. '
          'Both are already in these two widgets — try them with a pointer and '
          'with the Tab key.',
      groups: [
        RecipeGroup(
          title: 'M3StateLayer',
          url: 'https://m3.material.io/foundations/interaction/states/'
              'state-layers',
          recipes: [
            CodeRecipe(
              title: 'Make anything respond like a component',
              summary: 'Wrap a custom surface and it gets the four M3 '
                  'overlays, in the spec\'s precedence, clipped to the shape '
                  'you name.',
              code: '''
M3StateLayer(
  overlayColor: colorScheme.onSurface,
  borderRadius: M3BorderRadius.medium,
  onTap: onOpen,
  child: card,
)
''',
              preview: M3StateLayer(
                overlayColor: colorScheme.onSurface,
                borderRadius: M3BorderRadius.medium,
                onTap: () {},
                child: Container(
                  height: M3Spacings.s72,
                  alignment: Alignment.center,
                  decoration: M3BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: M3BorderRadius.medium,
                  ),
                  child: Text(
                    'Hover or press me',
                    style: M3TypeScale.labelLarge.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
            const CodeRecipe(
              title: 'The overlay colour is the content colour',
              summary: 'A state layer tints with the colour of whatever sits '
                  'on the surface, not with the surface itself — that is what '
                  'keeps it legible on a filled container.',
              code: '''
// On a plain surface:
M3StateLayer(overlayColor: colorScheme.onSurface, child: tile);

// On a filled container, take its content role instead:
M3StateLayer(
  overlayColor: colorScheme.onSecondaryContainer,
  child: selectedTile,
);
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3InteractionState',
          url: 'https://m3.material.io/foundations/interaction/states/'
              'overview',
          recipes: [
            const CodeRecipe(
              title: 'Resolve a state yourself',
              summary: 'When you are driving the states by hand, take the '
                  'strongest active one — that is the precedence the spec '
                  'defines, and the order this switch is written in.',
              code: '''
final state = switch (this) {
  _ when pressed => M3InteractionState.pressed,
  _ when focused => M3InteractionState.focus,
  _ when hovered => M3InteractionState.hover,
  _ => null,
};

final overlay = state == null
    ? Colors.transparent
    : baseColor.withValues(alpha: state.stateLayerOpacity);
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3FocusRing',
          url: 'https://m3.material.io/foundations/accessible-design/'
              'accessibility-basics',
          recipes: [
            CodeRecipe(
              title: 'The official focus indicator',
              summary: 'A 3dp ring at a 3dp offset. It reserves that 6dp even '
                  'when unfocused, so tabbing through a row never shifts the '
                  'controls sideways.',
              code: '''
M3FocusRing(
  borderRadius: M3BorderRadius.full,
  child: IconButton(onPressed: onStar, icon: const Icon(Icons.star)),
)
''',
              preview: Row(
                children: [
                  M3FocusRing(
                    borderRadius: M3BorderRadius.full,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.star),
                    ),
                  ),
                  const M3Gap(M3Spacings.s16),
                  M3FocusRing(
                    borderRadius: M3BorderRadius.medium,
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('Tab to me'),
                    ),
                  ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'Restyle the ring, not its geometry',
              summary: 'Colour is a scheme role, so it is a parameter. The '
                  'thickness and offset default to the spec tokens and rarely '
                  'want changing.',
              code: '''
M3FocusRing(
  color: colorScheme.secondary,
  thickness: M3FocusIndicator.thickness, // 3dp, the default
  offset: M3FocusIndicator.offset,       // 3dp, the default
  borderRadius: M3BorderRadius.large,
  child: child,
)
''',
            ),
          ],
        ),
      ],
    );
  }
}
