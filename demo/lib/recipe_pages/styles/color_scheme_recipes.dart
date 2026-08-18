import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/preview_bits.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Schemes destination.
class ColorSchemeRecipes extends StatelessWidget {
  const ColorSchemeRecipes({super.key});

  /// The seed the previews on this page are built from.
  static const _seed = Color(0xFF6750A4);

  @override
  Widget build(BuildContext context) {
    return RecipePage(
      title: 'Schemes',
      summary: 'A scheme is a seed plus two choices: which variant, and how '
          'much contrast. Both are tokens here rather than raw enums and '
          'doubles, and both can come from the user instead of from you.',
      groups: [
        RecipeGroup(
          title: 'M3ColorSchemes',
          url:
              'https://m3.material.io/styles/color/system/how-the-system-works',
          recipes: [
            CodeRecipe(
              title: 'Seed a scheme with a variant',
              summary: 'Nine spec variants, from neutral to vibrant. The '
                  'variant decides how much chroma survives the seeding.',
              code: '''
final scheme = M3ColorSchemes.fromSeed(
  seedColor: brandPurple,
  variant: M3SchemeVariant.expressive,
  contrastLevel: M3ContrastLevels.standard,
);

MaterialApp(theme: ThemeData(colorScheme: scheme));
''',
              preview: _VariantStrip(),
            ),
            const CodeRecipe(
              title: 'Follow the user, not your defaults',
              summary: 'fromContext reads the platform brightness *and* the '
                  'contrast accessibility setting. Hard-coding standard '
                  'contrast is the most common seeded-theme bug.',
              code: '''
final scheme = M3ColorSchemes.fromContext(
  context,
  seedColor: brandPurple,
);
''',
            ),
            CodeRecipe(
              title: 'The four contrast levels',
              summary: 'A user who asked the OS for more contrast has already '
                  'told you what they want; these are the values that answer.',
              code: '''
M3ContrastLevels.reduced;  // -1.0
M3ContrastLevels.standard; //  0.0
M3ContrastLevels.medium;   //  0.5
M3ContrastLevels.high;     //  1.0

M3ColorSchemes.light(seedColor: seed, contrastLevel: M3ContrastLevels.high);
M3ColorSchemes.dark(seedColor: seed);
''',
              preview: _ContrastStrip(),
            ),
          ],
        ),
        const RecipeGroup(
          title: 'M3ExtendedColors',
          url: 'https://m3.material.io/styles/color/advanced/'
              'define-new-colors',
          recipes: [
            CodeRecipe(
              title: 'Brand colours that survive the theme',
              summary: 'Each source colour becomes the four M3 custom-colour '
                  'roles, harmonized against the scheme, and rides along in '
                  'ThemeData like any other extension.',
              code: '''
ThemeData(
  extensions: [
    M3ExtendedColors.of(
      {'success': brandGreen, 'warning': brandAmber},
      harmonizeWith: colorScheme.primary,
      brightness: Brightness.light,
    ),
  ],
);
''',
            ),
            CodeRecipe(
              title: 'Read one back',
              summary: 'Returns an empty set rather than throwing when the '
                  'extension is absent, so a widget degrades instead of '
                  'crashing.',
              code: '''
final success = M3ExtendedColors.from(context)['success']!;

Text('Saved', style: TextStyle(color: success.color));
Container(
  color: success.colorContainer,
  child: Text('Saved', style: TextStyle(color: success.onColorContainer)),
);
''',
            ),
          ],
        ),
      ],
    );
  }
}

/// One swatch per scheme variant, all from the same seed.
class _VariantStrip extends StatelessWidget {
  const _VariantStrip();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Wrap(
      spacing: M3Spacings.s8,
      runSpacing: M3Spacings.s8,
      children: [
        for (final variant in M3SchemeVariant.values)
          PreviewBox(
            label: variant.name,
            width: M3Spacings.s96,
            height: M3Spacings.s40,
            color: M3ColorSchemes.fromSeed(
              seedColor: ColorSchemeRecipes._seed,
              variant: variant,
              brightness: brightness,
            ).primaryContainer,
          ),
      ],
    );
  }
}

/// The same seed at each contrast level.
class _ContrastStrip extends StatelessWidget {
  const _ContrastStrip();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Row(
      children: [
        for (final (label, level) in <(String, M3ContrastLevelValue)>[
          ('reduced', M3ContrastLevels.reduced),
          ('standard', M3ContrastLevels.standard),
          ('medium', M3ContrastLevels.medium),
          ('high', M3ContrastLevels.high),
        ])
          Expanded(
            child: M3Padding(
              padding: const M3EdgeInsets.only(right: M3Spacings.s8),
              child: PreviewBox(
                label: label,
                height: M3Spacings.s48,
                color: M3ColorSchemes.fromSeed(
                  seedColor: ColorSchemeRecipes._seed,
                  contrastLevel: level,
                  brightness: brightness,
                ).primaryContainer,
              ),
            ),
          ),
      ],
    );
  }
}
