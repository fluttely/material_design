import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/preview_bits.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Adaptive destination.
class AdaptiveRecipes extends StatelessWidget {
  const AdaptiveRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = M3Adaptive.adaptivePadding(context).resolve(
      Directionality.of(context),
    );

    return RecipePage(
      title: 'Adaptive',
      summary: 'M3Adaptive is the bag of decisions that depend on the window: '
          'which layout, how much padding, which navigation, whether a dialog '
          'is a dialog or a fullscreen page.',
      groups: [
        RecipeGroup(
          title: 'M3Adaptive — layout & values',
          url: 'https://m3.material.io/foundations/adaptive-design/overview',
          recipes: [
            const CodeRecipe(
              title: 'One widget per size class',
              summary: 'Only compact is required — every larger class falls '
                  'back to the nearest one you did supply, so you describe the '
                  'sizes that actually differ.',
              code: '''
M3Adaptive.responsiveLayout(
  context: context,
  compact: const SinglePane(),
  expanded: const TwoPane(),
)
''',
            ),
            CodeRecipe(
              title: 'One value per size class',
              summary: 'The same fallback rule for anything that is not a '
                  'widget — a column count, a font size, a flag.',
              code: '''
final columns = M3Adaptive.responsiveValue<int>(
  context: context,
  compact: 1,
  medium: 2,
  expanded: 3,
);
''',
              preview: PreviewValue(
                M3Adaptive.responsiveValue<String>(
                  context: context,
                  compact: 'compact → 1 column',
                  medium: 'medium → 2 columns',
                  expanded: 'expanded → 3 columns',
                ),
                label: 'this window',
              ),
            ),
            CodeRecipe(
              title: 'Page padding and margins',
              summary: 'Both read the window size class and return the margin '
                  'the spec assigns it, so no screen invents its own.',
              code: '''
Padding(
  padding: M3Adaptive.adaptivePadding(context),
  child: page,
);

M3Adaptive.adaptiveMargin(context); // horizontal only
''',
              preview: PreviewValue(
                'left ${padding.left.toStringAsFixed(0)}dp · '
                'top ${padding.top.toStringAsFixed(0)}dp',
                label: 'adaptivePadding on this window',
              ),
            ),
          ],
        ),
        const RecipeGroup(
          title: 'M3Adaptive — navigation & surfaces',
          url: 'https://m3.material.io/foundations/adaptive-design/'
              'canonical-layouts',
          recipes: [
            CodeRecipe(
              title: 'Bottom bar, rail or drawer — automatically',
              summary: 'One list of destinations; the window decides which '
                  'navigation component renders them.',
              code: '''
M3Adaptive.adaptiveNavigation(
  context: context,
  destinations: destinations,
  selectedIndex: index,
  onDestinationSelected: onSelect,
)
''',
            ),
            CodeRecipe(
              title: 'A dialog that knows where it is',
              summary: 'Fullscreen page on a phone, dialog on a desktop — the '
                  'M3 answer, and the one people forget on the way to ship.',
              code: '''
M3Adaptive.showAdaptiveDialog<void>(
  context: context,
  title: 'Rename',
  content: const RenameForm(),
);

// Bottom sheet on compact, side panel above it.
M3Adaptive.showAdaptiveSheet<void>(
  context: context,
  child: const FilterPanel(),
);
''',
            ),
            CodeRecipe(
              title: 'Touch and mouse want different targets',
              summary: '48dp on touch, 32dp with a mouse. adaptiveButton sizes '
                  'itself; inputMethodType answers the question directly.',
              code: '''
M3Adaptive.adaptiveButton(
  context: context,
  onPressed: onSave,
  child: const Text('Save'),
);

M3Adaptive.inputMethodType(context); // touch or mouse
''',
            ),
          ],
        ),
      ],
    );
  }
}
