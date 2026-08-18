import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Border destination.
class BorderRecipes extends StatelessWidget {
  const BorderRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Border',
      summary: 'Four widths, and a named constructor for each — an outline is '
          'either 1, 2 or 4dp. The colour stays yours: outline weight is a '
          'token, outline colour is a scheme role.',
      groups: [
        RecipeGroup(
          title: 'M3BorderWidths & M3BorderSide',
          url: 'https://m3.material.io/styles/shape/overview',
          recipes: [
            CodeRecipe(
              title: 'A side at each width',
              summary: 'The named constructors take just the colour, because '
                  'the width is already decided by which one you called.',
              code: '''
M3BorderSide.thin(colorScheme.outline);       // 1dp
M3BorderSide.thick(colorScheme.outline);      // 2dp
M3BorderSide.extraThick(colorScheme.outline); // 4dp

// Or name the token explicitly:
M3BorderSide(
  outlineColor: colorScheme.outline,
  width: M3BorderWidths.thick,
);
''',
              preview: Row(
                children: [
                  for (final (label, width) in <(String, double)>[
                    ('thin', M3BorderWidths.thin),
                    ('thick', M3BorderWidths.thick),
                    ('extraThick', M3BorderWidths.extraThick),
                  ])
                    Expanded(
                      child: M3Padding(
                        padding: const M3EdgeInsets.only(right: M3Spacings.s8),
                        child: Container(
                          height: M3Spacings.s56,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: M3BorderRadius.small,
                            border: Border.all(
                              color: colorScheme.outline,
                              width: width,
                            ),
                          ),
                          child: Text(
                            label,
                            style: M3TypeScale.labelSmall.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            CodeRecipe(
              title: 'Outline a container',
              summary: 'M3BoxDecoration takes an M3Border and an '
                  'M3BorderRadius, so a decoration cannot be half tokenized.',
              code: '''
Container(
  decoration: M3BoxDecoration(
    color: colorScheme.surfaceContainer,
    borderRadius: M3BorderRadius.large,
    border: M3Border.thin(colorScheme.outlineVariant),
  ),
  child: content,
)
''',
              preview: Container(
                height: M3Spacings.s72,
                alignment: Alignment.center,
                decoration: M3BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: M3BorderRadius.large,
                  border: M3Border.thin(colorScheme.outlineVariant),
                ),
                child: Text(
                  '16dp corners, 1dp outline',
                  style: M3TypeScale.labelMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            const CodeRecipe(
              title: 'One side only',
              summary: 'The default constructor leaves every side at '
                  'M3BorderSide.none, so a divider-like edge names just the '
                  'one it wants.',
              code: '''
M3Border(
  bottom: M3BorderSide.thin(colorScheme.outlineVariant),
)
''',
            ),
            const CodeRecipe(
              title: 'The focus indicator is its own token',
              summary: 'M3 specifies the focus ring separately from ordinary '
                  'outlines — 3dp thick at a 3dp offset. M3FocusRing already '
                  'uses these; reach for them when you draw your own.',
              code: '''
M3FocusIndicator.thickness; // 3dp
M3FocusIndicator.offset;    // 3dp
''',
            ),
          ],
        ),
      ],
    );
  }
}
