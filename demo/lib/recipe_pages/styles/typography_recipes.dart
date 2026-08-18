// M3EmphasizedTypeScale is M3 Expressive and still @experimental upstream.
// ignore_for_file: experimental_member_use

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Typography destination.
class TypographyRecipes extends StatelessWidget {
  const TypographyRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Typography',
      summary: 'The fifteen M3 styles as const TextStyles with the exact spec '
          'metrics — and an emphasized counterpart for each, at the same size '
          'and line height, so swapping one in never moves the layout.',
      groups: [
        RecipeGroup(
          title: 'M3TypeScale',
          url: 'https://m3.material.io/styles/typography/type-scale-tokens',
          recipes: [
            CodeRecipe(
              title: 'Use a role, not a font size',
              summary: 'Five families — display, headline, title, body, label '
                  '— each in large, medium and small.',
              code: '''
Text('Page title', style: M3TypeScale.headlineSmall);
Text('Body copy', style: M3TypeScale.bodyMedium);
Text('BUTTON', style: M3TypeScale.labelLarge);
''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final (name, style) in <(String, TextStyle)>[
                    ('headlineSmall', M3TypeScale.headlineSmall),
                    ('titleMedium', M3TypeScale.titleMedium),
                    ('bodyMedium', M3TypeScale.bodyMedium),
                    ('labelSmall', M3TypeScale.labelSmall),
                  ])
                    Text(
                      name,
                      style: style.copyWith(color: colorScheme.onSurface),
                    ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'Merge the scale into your theme',
              summary: 'applyToTheme keeps the theme\'s colours and replaces '
                  'only the metrics, so you get the spec type without losing '
                  'your scheme.',
              code: '''
MaterialApp(
  theme: M3TextTheme.applyToTheme(
    ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: brandPurple),
    ),
  ),
);

M3TextTheme.toTextTheme(); // the bare TextTheme, if you prefer
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3EmphasizedTypeScale',
          url: 'https://m3.material.io/styles/typography/type-scale-tokens',
          recipes: [
            CodeRecipe(
              title: 'Emphasis is a style, not a copyWith',
              summary: 'Weight goes one step up and tracking moves only where '
                  'the spec moves it. Same size, same line height — the '
                  'vertical rhythm holds.',
              code: '''
Text('Balance', style: M3TypeScale.titleMedium);
Text(r'R\$ 12.480', style: M3EmphasizedTypeScale.headlineLarge);
''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'headlineSmall',
                    style: M3TypeScale.headlineSmall.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    'headlineSmall, emphasized',
                    style: M3EmphasizedTypeScale.headlineSmall.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'Map any style to its counterpart',
              summary: 'Useful when the baseline style is a variable — a '
                  'selected row emphasizes whatever it was already using.',
              code: '''
Text(
  label,
  style: isSelected
      ? M3EmphasizedTypeScale.of(M3TypeScale.bodyLarge)
      : M3TypeScale.bodyLarge,
)
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3TextUtils',
          url: 'https://m3.material.io/styles/typography/applying-type',
          recipes: [
            CodeRecipe(
              title: 'The runtime transformations',
              summary: 'Everything the scale cannot be a constant for: a '
                  'monospace variant, a heavier variant, a display size that '
                  'follows the window.',
              code: '''
M3TextUtils.mono(M3TypeScale.bodyMedium);
M3TextUtils.highContrast(M3TypeScale.titleMedium);
M3TextUtils.dyslexiaFriendly(M3TypeScale.bodyLarge);
M3TextUtils.responsiveDisplay(context);
M3TextUtils.withFontFamily(
  base: M3TypeScale.bodyMedium,
  fontFamily: 'Inter',
);
''',
              preview: Text(
                'total(items) => items.fold(0, sum);',
                style: M3TextUtils.mono(M3TypeScale.bodyMedium).copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            const CodeRecipe(
              title: 'Clamp text scaling, reluctantly',
              summary: 'This fights the user\'s accessibility setting, so it '
                  'is a last resort — make the layout flex first, and clamp '
                  'only what genuinely cannot.',
              code: '''
Text(
  label,
  style: M3TypeScale.labelLarge,
  textScaler: M3TextUtils.clampedScaler(context, maxScaleFactor: 1.5),
)
''',
            ),
          ],
        ),
      ],
    );
  }
}
