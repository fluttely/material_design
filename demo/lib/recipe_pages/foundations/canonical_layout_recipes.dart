import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/preview_bits.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Layouts destination.
class CanonicalLayoutRecipes extends StatelessWidget {
  const CanonicalLayoutRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = M3CanonicalLayout.displayModeOf(context);

    return RecipePage(
      title: 'Layouts',
      summary: 'The three canonical M3 layouts, ready-made. Each handles the '
          'one-pane case the way the spec says — and that is not the same way '
          'for all three, which is the part worth reading twice.',
      groups: [
        RecipeGroup(
          title: 'M3ListDetailLayout',
          url: 'https://m3.material.io/foundations/layout/canonical-layouts/'
              'list-detail',
          recipes: [
            CodeRecipe(
              title: 'The detail replaces the list on a phone',
              summary: 'Selection is navigation here, so on one pane the '
                  'detail takes over and the back gesture returns to the list '
                  '— which is why onNavigateBack exists.',
              code: '''
M3ListDetailLayout(
  list: MailList(onSelect: (id) => setState(() => _selected = id)),
  detail: _selected == null ? null : MailDetail(_selected!),
  onNavigateBack: () => setState(() => _selected = null),
)
''',
              preview: SizedBox(
                height: M3Spacings.s128,
                child: M3ListDetailLayout(
                  list: const PreviewBox(
                    label: 'list · 360dp',
                    height: M3Spacings.infinity,
                  ),
                  detail: PreviewBox(
                    label: 'detail · fills the rest',
                    height: M3Spacings.infinity,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3SupportingPaneLayout',
          url: 'https://m3.material.io/foundations/layout/canonical-layouts/'
              'supporting-pane',
          recipes: [
            CodeRecipe(
              title: 'The support stacks below instead',
              summary: 'Filters and properties belong to the task you are '
                  'already doing, so on one pane they scroll underneath rather '
                  'than becoming a place you navigate to.',
              code: '''
M3SupportingPaneLayout(
  primary: const Editor(),
  supporting: const PropertiesPanel(),
)
''',
              preview: SizedBox(
                height: M3Spacings.s128,
                child: M3SupportingPaneLayout(
                  primary: PreviewBox(
                    label: 'primary',
                    height: M3Spacings.s56,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  supporting: const PreviewBox(
                    label: 'supporting · 360dp',
                    height: M3Spacings.s56,
                  ),
                ),
              ),
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3FeedLayout',
          url: 'https://m3.material.io/foundations/layout/canonical-layouts/'
              'feed',
          recipes: [
            const CodeRecipe(
              title: 'A grid that reflows with the window',
              summary: 'Columns, gutter and margin all come from the size '
                  'class. Override itemColumns only for the classes that '
                  'genuinely want a different density.',
              code: '''
M3FeedLayout(
  itemColumns: const {M3ScreenSize.compact: 2},
  children: [for (final story in stories) StoryCard(story)],
)
''',
              preview: SizedBox(
                height: M3Spacings.s128,
                child: M3FeedLayout(
                  shrinkWrap: true,
                  childAspectRatio: 2,
                  physics: NeverScrollableScrollPhysics(),
                  padding: M3EdgeInsets.zero,
                  children: [
                    PreviewBox(label: '1', height: M3Spacings.infinity),
                    PreviewBox(label: '2', height: M3Spacings.infinity),
                    PreviewBox(label: '3', height: M3Spacings.infinity),
                    PreviewBox(label: '4', height: M3Spacings.infinity),
                  ],
                ),
              ),
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3CanonicalLayout',
          url: 'https://m3.material.io/foundations/layout/canonical-layouts/'
              'overview',
          recipes: [
            CodeRecipe(
              title: 'The same policy, for a layout we do not ship',
              summary: 'One pane or two, and how wide a pane in that role gets '
                  '— so a fourth layout of your own agrees with the three '
                  'above.',
              code: '''
M3CanonicalLayout.displayModeOf(context);  // single or dual
M3CanonicalLayout.displayModeFor(size);

M3CanonicalLayout.paneWidthFor(
  M3PaneRole.secondary,
  M3ScreenSize.of(context),
); // 360dp when two panes fit
''',
              preview: PreviewValue(
                'M3PaneDisplayMode.${mode.name}',
                label: 'displayModeOf on this window',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
