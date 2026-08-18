import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Z-Index destination.
class ZIndexRecipes extends StatelessWidget {
  const ZIndexRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipePage(
      title: 'Z-Index',
      summary: 'Flutter has no z-index — a Stack paints in list order. These '
          'tokens give the order a name, so a child moves because it is a '
          'tooltip, not because someone moved a line.',
      groups: [
        RecipeGroup(
          title: 'M3ZIndexes',
          recipes: [
            CodeRecipe(
              title: 'Order a Stack by intent',
              summary: 'Sort by the token and the list order stops being the '
                  'thing you have to keep right by hand.',
              code: '''
final layers = <(int, Widget)>[
  (M3ZIndexes.tooltip, tooltip),
  (M3ZIndexes.content, page),
  (M3ZIndexes.modal, dialog),
]..sort((a, b) => a.\$1.compareTo(b.\$1));

Stack(
  children: [for (final (_, child) in layers) child],
)
''',
              preview: _StackedLayers(),
            ),
            CodeRecipe(
              title: 'The seven layers',
              summary: 'Wide gaps between them on purpose: a value can be '
                  'slotted between two named layers without renumbering.',
              code: '''
M3ZIndexes.background; //    0
M3ZIndexes.content;    //    1
M3ZIndexes.floating;   //   10  FAB, chips
M3ZIndexes.drawer;     //  100
M3ZIndexes.modal;      // 1000  dialogs, sheets
M3ZIndexes.snackbar;   // 2000
M3ZIndexes.tooltip;    // 9999  always on top
''',
            ),
            CodeRecipe(
              title: 'Elevate to match the layer',
              summary: 'Stacking order and elevation are different questions '
                  'with the same answer often enough that it is worth pairing '
                  'them explicitly.',
              code: '''
Material(
  elevation: M3Elevation.level3.dp, // 6dp — a modal
  child: dialog,
)
''',
            ),
          ],
        ),
      ],
    );
  }
}

/// Three overlapping cards in token order, bottom to top.
class _StackedLayers extends StatelessWidget {
  const _StackedLayers();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final layers = <(int, String, Color)>[
      (M3ZIndexes.tooltip, 'tooltip', colorScheme.tertiaryContainer),
      (M3ZIndexes.content, 'content', colorScheme.surfaceContainerHighest),
      (M3ZIndexes.modal, 'modal', colorScheme.secondaryContainer),
    ]..sort((a, b) => a.$1.compareTo(b.$1));

    return SizedBox(
      height: M3Spacings.s128,
      child: Stack(
        children: [
          for (final (index, (order, name, color)) in layers.indexed)
            Positioned(
              left: M3Spacings.s24 * index,
              top: M3Spacings.s16 * index,
              child: Container(
                width: M3Spacings.s128,
                height: M3Spacings.s64,
                alignment: Alignment.center,
                decoration: M3ShapeDecoration(
                  shape: M3Shape.medium,
                  color: color,
                  shadows: M3ElevationShadows.level2,
                ),
                child: Text(
                  '$name · $order',
                  style: M3TypeScale.labelMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
