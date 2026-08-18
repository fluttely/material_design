import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/preview_bits.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Color destination.
class ColorRecipes extends StatelessWidget {
  const ColorRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final contrast = M3ColorUtils.calculateContrast(
      colorScheme.onSurface,
      colorScheme.surface,
    );

    return RecipePage(
      title: 'Color',
      summary: 'Flutter already gives you the M3 roles through ColorScheme. '
          'What the package adds is the arithmetic around them: state layers, '
          'disabled treatments, surface tint, and WCAG contrast.',
      groups: [
        RecipeGroup(
          title: 'ColorScheme extensions',
          url: 'https://m3.material.io/styles/color/roles',
          recipes: [
            CodeRecipe(
              title: 'The five answers a scheme should already have',
              summary: 'Each of these was a hand-written withValues call in '
                  'every app that needed it. They live on the scheme now.',
              code: '''
colorScheme.stateLayerColor(
  colorScheme.onSurface,
  M3InteractionState.hover,
);
colorScheme.disabledContent(colorScheme.onSurface);   // 38%
colorScheme.disabledContainer(colorScheme.onSurface); // 12%
colorScheme.surfaceAtElevation(M3Elevation.level2);
colorScheme.isAccessible(foreground, background);
''',
              preview: Row(
                children: [
                  for (final (label, color) in <(String, Color)>[
                    ('surface', colorScheme.surface),
                    (
                      'level2',
                      colorScheme.surfaceAtElevation(
                        M3Elevation.level2,
                      )
                    ),
                    (
                      'level5',
                      colorScheme.surfaceAtElevation(
                        M3Elevation.level5,
                      )
                    ),
                  ])
                    Expanded(
                      child: M3Padding(
                        padding: const M3EdgeInsets.only(right: M3Spacings.s8),
                        child: PreviewBox(
                          label: label,
                          height: M3Spacings.s48,
                          color: color,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3ColorUtils — contrast',
          url: 'https://m3.material.io/styles/color/system/accessibility',
          recipes: [
            CodeRecipe(
              title: 'Measure a pair, then fix it',
              summary: 'Real WCAG relative-luminance maths, not an eyeball '
                  'test. AA wants 4.5:1 for body text, AAA wants 7:1.',
              code: '''
M3ColorUtils.calculateContrast(foreground, background); // e.g. 12.4
M3ColorUtils.meetsWCAGAA(foreground, background);
M3ColorUtils.meetsWCAGAAA(foreground, background);
M3ColorUtils.meetsLargeTextAA(foreground, background);

final safe = M3ColorUtils.adjustForAccessibility(
  brandYellow,
  colorScheme.surface,
);
''',
              preview: PreviewValue(
                '${contrast.toStringAsFixed(2)}:1',
                label: 'onSurface against surface',
              ),
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3ColorUtils — manipulation',
          url:
              'https://m3.material.io/styles/color/system/how-the-system-works',
          recipes: [
            CodeRecipe(
              title: 'Blend, lighten, darken, saturate',
              summary: 'The small operations a design system needs, in one '
                  'place, so they behave the same everywhere.',
              code: '''
M3ColorUtils.blend(colorA, colorB, 0.5);
M3ColorUtils.lighten(color, 0.1);
M3ColorUtils.darken(color, 0.1);
M3ColorUtils.saturate(color, 0.2);
M3ColorUtils.isLight(color);
M3ColorUtils.onColor(background); // black or white, whichever reads
''',
              preview: Row(
                children: [
                  for (final (label, color) in <(String, Color)>[
                    ('darken', M3ColorUtils.darken(colorScheme.primary, 0.2)),
                    ('primary', colorScheme.primary),
                    ('lighten', M3ColorUtils.lighten(colorScheme.primary, 0.2)),
                  ])
                    Expanded(
                      child: M3Padding(
                        padding: const M3EdgeInsets.only(right: M3Spacings.s8),
                        child: PreviewBox(
                          label: label,
                          height: M3Spacings.s48,
                          color: color,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const CodeRecipe(
              title: 'Keep a brand colour inside a seeded scheme',
              summary: 'Harmonize shifts the hue toward the scheme in HCT — '
                  'the spec algorithm — so the brand still reads as itself but '
                  'stops fighting the palette.',
              code: '''
final green = M3ColorUtils.harmonize(brandGreen, colorScheme.primary);
''',
            ),
          ],
        ),
      ],
    );
  }
}
