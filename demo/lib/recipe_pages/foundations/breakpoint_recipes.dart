import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/preview_bits.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Breakpoints destination.
class BreakpointRecipes extends StatelessWidget {
  const BreakpointRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = M3ScreenSize.of(context);

    return RecipePage(
      title: 'Breakpoints',
      summary: 'M3 has five window size classes, not a set of device names. '
          'Ask which class you are in and everything else — columns, margins, '
          'pane widths — follows from the answer.',
      groups: [
        RecipeGroup(
          title: 'M3ScreenSize',
          url: 'https://m3.material.io/foundations/layout/applying-layout/'
              'window-size-classes',
          recipes: [
            CodeRecipe(
              title: 'Which class am I in?',
              summary: 'One call, and never a MediaQuery width comparison of '
                  'your own — that is how two screens end up disagreeing '
                  'about what "tablet" means.',
              code: '''
final size = M3ScreenSize.of(context);

if (size.isAtLeast(M3ScreenSize.expanded)) {
  return twoPaneLayout;
}
return singlePaneLayout;
''',
              preview: PreviewValue(
                'M3ScreenSize.${screenSize.name}',
                label: 'this window',
              ),
            ),
            CodeRecipe(
              title: 'Everything the class already knows',
              summary: 'Columns, gutters and page margins are properties of '
                  'the size class, so you read them rather than decide them.',
              code: '''
size.columns;       // 4 / 8 / 12
size.gutterWidth;   // 16dp or 24dp
size.pageMargin;    // 16dp or 24dp
size.bodyWidth;     // max readable width, or null
size.paneWidth;     // side-pane width
''',
              preview: PreviewValue(
                '${screenSize.columns} columns · '
                'gutter ${screenSize.gutterWidth.toStringAsFixed(0)}dp · '
                'margin ${screenSize.pageMargin.toStringAsFixed(0)}dp',
                label: 'this window',
              ),
            ),
            const CodeRecipe(
              title: 'Classify a width you already have',
              summary: 'Inside a LayoutBuilder the useful width is the box, '
                  'not the window — fromWidth classifies either.',
              code: '''
LayoutBuilder(
  builder: (context, constraints) {
    final size = M3ScreenSize.fromWidth(constraints.maxWidth);
    return grid(columns: size.columns);
  },
)
''',
            ),
          ],
        ),
        const RecipeGroup(
          title: 'M3Breakpoints & M3LayoutWidths',
          url: 'https://m3.material.io/foundations/layout/applying-layout/'
              'window-size-classes',
          recipes: [
            CodeRecipe(
              title: 'The five boundaries',
              summary: 'The dp values behind the classes, for the rare case '
                  'that needs the number itself.',
              code: '''
M3Breakpoints.compact;    //    0
M3Breakpoints.medium;     //  600
M3Breakpoints.expanded;   //  840
M3Breakpoints.large;      // 1200
M3Breakpoints.extraLarge; // 1600
''',
            ),
            CodeRecipe(
              title: 'Widths a layout is measured against',
              summary: 'A breakpoint says when the layout changes; a layout '
                  'width says how wide the content may get. Body caps line '
                  'length at the readable maximum.',
              code: '''
ConstrainedBox(
  constraints: const BoxConstraints(
    maxWidth: M3LayoutWidths.body, // 1040dp
  ),
  child: article,
);

M3LayoutWidths.pane;      //  360dp
M3LayoutWidths.ultraWide; // 1920dp
M3LayoutWidths.unbounded; // fill the space
''',
            ),
          ],
        ),
      ],
    );
  }
}
