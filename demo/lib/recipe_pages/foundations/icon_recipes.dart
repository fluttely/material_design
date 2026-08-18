import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Icons destination.
class IconRecipes extends StatelessWidget {
  const IconRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Icons',
      summary: 'Material Symbols is a variable font with four axes, and '
          'Flutter exposes all four as bare doubles. Each axis has a scale '
          'here — and M3IconStyle carries all of them into any Flutter icon '
          'slot at once.',
      groups: [
        RecipeGroup(
          title: 'M3IconSizes',
          url: 'https://m3.material.io/styles/icons/applying-icons',
          recipes: [
            CodeRecipe(
              title: 'The five sizes',
              summary: 'Pass one wherever Flutter wants a size — the token is '
                  'a double, so nothing needs unwrapping.',
              code: '''
Icon(Icons.star, size: M3IconSizes.dense);      // 20dp
Icon(Icons.star, size: M3IconSizes.standard);   // 24dp
Icon(Icons.star, size: M3IconSizes.medium);     // 32dp
Icon(Icons.star, size: M3IconSizes.large);      // 40dp
Icon(Icons.star, size: M3IconSizes.extraLarge); // 48dp
''',
              preview: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final size in M3IconSizes.values)
                    M3Padding(
                      padding: const M3EdgeInsets.only(right: M3Spacings.s16),
                      child: Icon(
                        Icons.star,
                        size: size,
                        color: colorScheme.primary,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3IconStyle',
          url: 'https://m3.material.io/styles/icons/applying-icons',
          recipes: [
            const CodeRecipe(
              title: 'Style the whole app',
              summary: 'M3IconStyle is an IconThemeData. Replacing the theme '
                  'wholesale needs a colour — an IconThemeData with a null '
                  'colour drops Icon onto its black fallback.',
              code: '''
MaterialApp(
  theme: ThemeData(
    iconTheme: M3IconStyle(color: colorScheme.onSurface),
  ),
)
''',
            ),
            CodeRecipe(
              title: 'Restyle one subtree',
              summary: 'IconTheme.merge keeps the inherited colour and '
                  'overrides only the axes you name. IconTheme would replace '
                  'the colour too.',
              code: '''
IconTheme.merge(
  data: const M3IconStyle(
    size: M3IconSizes.dense,
    weight: M3IconWeights.medium,
  ),
  child: toolbar,
)
''',
              preview: IconTheme.merge(
                data: const M3IconStyle(size: M3IconSizes.dense),
                child: Row(
                  children: [
                    for (final icon in const [
                      Icons.format_bold,
                      Icons.format_italic,
                      Icons.format_underlined,
                    ])
                      M3Padding(
                        padding: const M3EdgeInsets.only(right: M3Spacings.s16),
                        child: Icon(icon),
                      ),
                  ],
                ),
              ),
            ),
            const CodeRecipe(
              title: 'The presets',
              summary: 'Five treatments the spec names, so the common cases '
                  'never need the constructor.',
              code: '''
M3IconStyle.standard;     // 24dp, regular, unfilled
M3IconStyle.dense;        // 20dp
M3IconStyle.selected;     // filled — the active destination
M3IconStyle.onDarkSurface;// grade -25
M3IconStyle.disabled;     // 38% opacity
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'The four axes',
          url: 'https://m3.material.io/styles/icons/applying-icons',
          recipes: [
            CodeRecipe(
              title: 'Fill marks selection, not a different glyph',
              summary: 'M3 moves the active destination along the FILL axis. '
                  'Flutter\'s bundled Icons font is static, so this carries '
                  'the value — ship Material Symbols to see it drawn.',
              code: '''
Icon(
  Icons.star,
  fill: isSelected ? M3IconFills.filled : M3IconFills.unfilled,
)
''',
              preview: Row(
                children: [
                  Icon(Icons.star_border, color: colorScheme.onSurfaceVariant),
                  const M3Gap(M3Spacings.s16),
                  Icon(Icons.star, color: colorScheme.primary),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'Weight, grade and optical size',
              summary: 'Weight matches the text beside the icon; grade '
                  'corrects strokes without changing width; optical size '
                  'keeps weight perceptually constant as the icon grows.',
              code: '''
M3IconWeights.thin;     // 100 … regular 400 … bold 700
M3IconGrades.onDark;    // -25, for light-on-dark
M3IconGrades.emphasis;  // 200
M3IconOpticalSizes.standard;

Icon(
  Icons.star,
  weight: M3IconWeights.medium,
  grade: M3IconGrades.emphasis,
  opticalSize: M3IconOpticalSizes.large,
)
''',
            ),
          ],
        ),
      ],
    );
  }
}
