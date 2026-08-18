import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/preview_bits.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Responsive destination.
class ResponsiveRecipes extends StatelessWidget {
  const ResponsiveRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return RecipePage(
      title: 'Responsive',
      summary: 'Widgets that take the window size class as an input. Each one '
          'replaces the same hand-written MediaQuery branch, so the breakpoint '
          'logic lives in one place instead of in every screen.',
      groups: [
        RecipeGroup(
          title: 'M3ResponsiveValue & M3ResponsiveBuilder',
          url: 'https://m3.material.io/foundations/layout/applying-layout/'
              'window-size-classes',
          recipes: [
            CodeRecipe(
              title: 'Build from a value that varies by size',
              summary: 'You give a value per class and a builder; it resolves '
                  'the value and calls you. Unnamed classes fall back to the '
                  'nearest smaller one.',
              code: '''
M3ResponsiveValue<int>(
  compact: 2,
  medium: 4,
  expanded: 6,
  builder: (context, columns) => PhotoGrid(columns: columns),
)
''',
              preview: M3ResponsiveValue<int>(
                compact: 2,
                medium: 4,
                expanded: 6,
                builder: (context, columns) => Row(
                  children: [
                    for (var i = 0; i < columns; i++)
                      Expanded(
                        child: M3Padding(
                          padding: const M3EdgeInsets.only(
                            right: M3Spacings.s8,
                          ),
                          child: PreviewBox(
                            height: M3Spacings.s32,
                            label: '${i + 1}',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            CodeRecipe(
              title: 'Or take the class itself',
              summary: 'When the difference is structural rather than a single '
                  'number, build from the class directly.',
              code: '''
M3ResponsiveBuilder(
  builder: (context, size) => size.isAtLeast(M3ScreenSize.expanded)
      ? const TwoPane()
      : const SinglePane(),
)
''',
              preview: M3ResponsiveBuilder(
                builder: (context, size) => PreviewValue(
                  'M3ScreenSize.${size.name}',
                  label: 'M3ResponsiveBuilder gave us',
                ),
              ),
            ),
          ],
        ),
        const RecipeGroup(
          title: 'M3ResponsiveVisibility',
          url: 'https://m3.material.io/foundations/layout/applying-layout/'
              'window-size-classes',
          recipes: [
            CodeRecipe(
              title: 'Show something only where it fits',
              summary: 'A sidebar that would crush a phone simply is not '
                  'built. Pass a replacement when the space still needs '
                  'filling.',
              code: '''
M3ResponsiveVisibility(
  visibleOn: const [M3ScreenSize.expanded, M3ScreenSize.large],
  replacement: const SizedBox.shrink(),
  child: const Sidebar(),
)
''',
            ),
          ],
        ),
        const RecipeGroup(
          title: 'M3ResponsiveGrid & M3ResponsiveScaffold',
          url: 'https://m3.material.io/foundations/layout/'
              'understanding-layout/parts-of-layout',
          recipes: [
            CodeRecipe(
              title: 'A grid on the M3 column count',
              summary: 'Columns, gutters and margins come from the size class '
                  '— 4 columns on a phone, 8 on a tablet, 12 above that.',
              code: '''
M3ResponsiveGrid(
  children: [for (final photo in photos) PhotoTile(photo)],
)
''',
            ),
            CodeRecipe(
              title: 'A scaffold whose navigation adapts',
              summary: 'Bottom bar on compact, rail on medium, drawer above. '
                  'One destination list, no branch of your own.',
              code: '''
M3ResponsiveScaffold(
  destinations: destinations,
  selectedIndex: index,
  onDestinationSelected: onSelect,
  body: body,
)
''',
            ),
            CodeRecipe(
              title: 'Ask which navigation is right',
              summary: 'When you are building the navigation yourself, the '
                  'policy is still available as a plain answer.',
              code: '''
M3ResponsiveNavigation.getNavigationType(size); // bottom / rail / drawer
M3ResponsiveNavigation.shouldExtendRail(size);
M3ResponsiveNavigation.getRailWidth(extended: false); // 80dp

// The grid numbers behind M3ResponsiveGrid:
M3ResponsiveGridConfig.forScreenSize(size).columns;
''',
            ),
          ],
        ),
      ],
    );
  }
}
