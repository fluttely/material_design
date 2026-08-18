import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/preview_bits.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Density destination.
class VisualDensityRecipes extends StatelessWidget {
  const VisualDensityRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final density = context.visualDensity;

    return RecipePage(
      title: 'Density',
      summary: 'Visual density shrinks or relaxes every built-in Material '
          'control at once. Set it on the theme and the whole app follows; '
          'reach for it per subtree only when one region genuinely differs.',
      groups: [
        RecipeGroup(
          title: 'M3VisualDensity',
          url: 'https://m3.material.io/foundations/layout/'
              'understanding-layout/spacing',
          recipes: [
            const CodeRecipe(
              title: 'The three densities',
              summary: 'Each is a VisualDensity, so it drops into any Flutter '
                  'slot that already takes one.',
              code: '''
M3VisualDensity.standard;    //  0, 0
M3VisualDensity.comfortable; // -1, -1
M3VisualDensity.compact;     // -2, -2

MaterialApp(
  theme: ThemeData(visualDensity: M3VisualDensity.comfortable),
);
''',
            ),
            const CodeRecipe(
              title: 'Restyle one subtree',
              summary: 'A Theme override changes density for its children only '
                  '— a settings list can be denser than the app around it.',
              code: '''
Theme(
  data: Theme.of(context).copyWith(
    visualDensity: M3VisualDensity.compact,
  ),
  child: settingsList,
)
''',
              preview: _DensityComparison(),
            ),
            const CodeRecipe(
              title: 'Let the platform decide',
              summary: 'Touch platforms want comfortable, desktops want '
                  'standard. Both selectors answer that without a switch '
                  'statement at the call site.',
              code: '''
M3VisualDensity.adaptivePlatformDensity;
M3VisualDensity.forPlatform(TargetPlatform.iOS);
M3VisualDensity.forScreenSize(M3ScreenSize.of(context));
''',
            ),
            CodeRecipe(
              title: 'Read the density in force',
              summary: 'The BuildContext extension answers straight from the '
                  'ambient theme, which is usually what a widget needs.',
              code: '''
context.visualDensity;         // the theme's density
context.recommendedDensity;    // what this platform wants
context.prefersCompactDensity; // true when either axis is negative
''',
              preview: PreviewValue(
                'horizontal ${density.horizontal}, '
                'vertical ${density.vertical}',
                label: 'context.visualDensity',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// The same list at two densities, side by side.
class _DensityComparison extends StatelessWidget {
  const _DensityComparison();

  @override
  Widget build(BuildContext context) {
    Widget sample(String label, M3VisualDensity density) => Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: M3TypeScale.labelSmall.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const M3Gap(M3Spacings.s4),
              Theme(
                data: Theme.of(context).copyWith(visualDensity: density),
                child: const Column(
                  children: [
                    ListTile(title: Text('One')),
                    ListTile(title: Text('Two')),
                  ],
                ),
              ),
            ],
          ),
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sample('standard', M3VisualDensity.standard),
        const M3Gap(M3Spacings.s16),
        sample('compact', M3VisualDensity.compact),
      ],
    );
  }
}
