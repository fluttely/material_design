import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/preview_bits.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Spacing destination.
class SpacingRecipes extends StatelessWidget {
  const SpacingRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = M3ScreenSize.of(context);

    return RecipePage(
      title: 'Spacing',
      summary: 'Every gap in an M3 layout is a multiple of 4dp. These are the '
          'four ways the package hands you one: as insets, as padding, as a '
          'gap between children, and as the page margin for the window you are '
          'on.',
      groups: [
        RecipeGroup(
          title: 'M3EdgeInsets & M3Padding',
          url: 'https://m3.material.io/foundations/layout/'
              'understanding-layout/spacing',
          recipes: [
            CodeRecipe(
              title: 'Pad with a token, not a number',
              summary: 'M3Padding takes M3EdgeInsets and nothing else, so '
                  'EdgeInsets.all(17.3) cannot reach a layout by accident.',
              code: '''
M3Padding(
  padding: const M3EdgeInsets.all(M3Spacings.s16),
  child: content,
)
''',
              preview: ColoredBox(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: const M3Padding(
                  padding: M3EdgeInsets.all(M3Spacings.s16),
                  child: PreviewBox(label: '16dp on every side'),
                ),
              ),
            ),
            const CodeRecipe(
              title: 'One side, two sides, four sides',
              summary: 'The same four constructors EdgeInsets has, with every '
                  'parameter typed as a spacing token.',
              code: '''
const M3EdgeInsets.all(M3Spacings.s24);
const M3EdgeInsets.symmetric(
  horizontal: M3Spacings.s16,
  vertical: M3Spacings.s8,
);
const M3EdgeInsets.only(top: M3Spacings.s12);
const M3EdgeInsets.fromLTRB(
  M3Spacings.s16,
  M3Spacings.s8,
  M3Spacings.s16,
  M3Spacings.s24,
);
''',
            ),
            const CodeRecipe(
              title: 'The insets the spec already named',
              summary: 'Card, dialog and list-item padding are spec values, so '
                  'they ship as constants rather than as numbers you look up.',
              code: '''
M3EdgeInsetsPatterns.card;         // 16dp all round
M3EdgeInsetsPatterns.dialog;       // 24dp all round
M3EdgeInsetsPatterns.listItem;     // 16dp / 8dp
M3EdgeInsetsPatterns.compactPage;  // 16dp horizontal
M3EdgeInsetsPatterns.expandedPage; // 24dp horizontal
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3Gap',
          url: 'https://m3.material.io/foundations/layout/'
              'understanding-layout/spacing',
          recipes: [
            const CodeRecipe(
              title: 'A gap that knows which way it is facing',
              summary: 'M3Gap walks up to its parent and orients itself — the '
                  'same line is a height in a Column and a width in a Row.',
              code: '''
Column(
  children: [
    Text('Header'),
    M3Gap(M3Spacings.s16), // vertical here
    Text('Body'),
  ],
);

Row(
  children: [
    Icon(Icons.check),
    M3Gap(M3Spacings.s8), // horizontal here
    Text('Done'),
  ],
);
''',
              preview: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PreviewBox(label: 'Header', height: M3Spacings.s32),
                  M3Gap(M3Spacings.s16),
                  PreviewBox(label: 'Body', height: M3Spacings.s32),
                  M3Gap(M3Spacings.s16),
                  Row(
                    children: [
                      PreviewBox(
                        label: 'A',
                        width: M3Spacings.s48,
                        height: M3Spacings.s32,
                      ),
                      M3Gap(M3Spacings.s8),
                      PreviewBox(
                        label: 'B',
                        width: M3Spacings.s48,
                        height: M3Spacings.s32,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CodeRecipe(
              title: 'Space a list you already have',
              summary: 'addGaps interleaves the gaps instead of making you '
                  'write one between every pair by hand.',
              code: '''
Row(
  children: M3GapUtils.addGaps(
    [chipA, chipB, chipC],
    M3Spacings.s8,
  ),
)
''',
              preview: Row(
                children: M3GapUtils.addGaps(
                  const [
                    PreviewBox(
                      label: 'A',
                      width: M3Spacings.s56,
                      height: M3Spacings.s32,
                    ),
                    PreviewBox(
                      label: 'B',
                      width: M3Spacings.s56,
                      height: M3Spacings.s32,
                    ),
                    PreviewBox(
                      label: 'C',
                      width: M3Spacings.s56,
                      height: M3Spacings.s32,
                    ),
                  ],
                  M3Spacings.s8,
                ),
              ),
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3Margins & M3Spacers',
          url: 'https://m3.material.io/foundations/layout/applying-layout/'
              'compact',
          recipes: [
            CodeRecipe(
              title: 'Page margin follows the window',
              summary: '16dp on a phone, 24dp everywhere else. Read it off the '
                  'window size class rather than hard-coding either.',
              code: '''
final margin = M3ScreenSize.of(context).pageMargin;

M3Padding(
  padding: M3EdgeInsets.symmetric(horizontal: margin),
  child: page,
)
''',
              preview: PreviewValue(
                '${screenSize.name} → '
                '${screenSize.pageMargin.toStringAsFixed(0)}dp',
                label: 'this window',
              ),
            ),
            const CodeRecipe(
              title: 'The gap between two panes',
              summary: 'A pane spacer is 24dp — its own token, because it is a '
                  'layout decision rather than component padding.',
              code: '''
Row(
  children: [
    Expanded(child: listPane),
    M3Gap(M3Spacers.pane), // 24dp
    Expanded(child: detailPane),
  ],
)
''',
            ),
          ],
        ),
      ],
    );
  }
}
