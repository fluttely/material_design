import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Tonal destination.
class TonalPaletteRecipes extends StatelessWidget {
  const TonalPaletteRecipes({super.key});

  /// The seed every preview on this page is built from.
  static const _seed = Color(0xFF6750A4);

  @override
  Widget build(BuildContext context) {
    final palette = M3TonalPalette.fromSeed(_seed);
    final core = M3CorePalette.fromSeed(_seed);

    return RecipePage(
      title: 'Tonal',
      summary: 'Real HCT tonal palettes, through the same '
          'material_color_utilities Material itself uses. Every role in a '
          'ColorScheme is one tone out of one of these six palettes.',
      groups: [
        RecipeGroup(
          title: 'M3TonalPalette',
          url:
              'https://m3.material.io/styles/color/system/how-the-system-works',
          recipes: [
            CodeRecipe(
              title: 'Thirteen tones from one seed',
              summary: 'Tone 40 is the light scheme\'s primary; tone 80 is the '
                  'dark scheme\'s. That relationship is the whole system in '
                  'one line.',
              code: '''
final palette = M3TonalPalette.fromSeed(const Color(0xFF6750A4));

palette[M3Tones.t40]; // light-scheme primary
palette[M3Tones.t80]; // dark-scheme primary
palette.tone(55);     // any tone, not just the stops
palette.tones;        // all thirteen, darkest first
''',
              preview: _ToneRamp(palette),
            ),
            const CodeRecipe(
              title: 'Match a brand colour exactly',
              summary: 'fromColor keeps the hue and chroma you gave it; '
                  'fromSeed lets Material adjust chroma for legibility. Use '
                  'the first when the colour is contractual.',
              code: '''
M3TonalPalette.fromColor(brandRed); // exact hue and chroma
M3TonalPalette.fromSeed(brandRed);  // Material may adjust chroma
M3TonalPalette.of(hue: 265, chroma: 48);
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3CorePalette',
          url:
              'https://m3.material.io/styles/color/system/how-the-system-works',
          recipes: [
            CodeRecipe(
              title: 'The six palettes behind a scheme',
              summary: 'Error is generated independently of the seed — a red '
                  'that shifted with your brand would stop meaning "error".',
              code: '''
final core = M3CorePalette.fromSeed(seed);

core.primary[M3Tones.t40];
core.secondary[M3Tones.t40];
core.tertiary[M3Tones.t40];
core.neutral[M3Tones.t99];        // the light-scheme surface
core.neutralVariant[M3Tones.t50]; // outlines
core.error[M3Tones.t40];          // spec red, seed-independent
''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final (name, entry) in <(String, M3TonalPalette)>[
                    ('primary', core.primary),
                    ('secondary', core.secondary),
                    ('tertiary', core.tertiary),
                    ('neutral', core.neutral),
                    ('error', core.error),
                  ])
                    M3Padding(
                      padding: const M3EdgeInsets.only(bottom: M3Spacings.s8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: M3Spacings.s72,
                            child: Text(
                              name,
                              style: M3TypeScale.labelSmall.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                          Expanded(child: _ToneRamp(entry)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const RecipeGroup(
          title: 'M3Tones',
          url:
              'https://m3.material.io/styles/color/system/how-the-system-works',
          recipes: [
            CodeRecipe(
              title: 'The thirteen stops',
              summary: 'A tone is a lightness in HCT, 0 black to 100 white. '
                  'These are the stops the spec names; the palette will still '
                  'give you anything in between.',
              code: '''
M3Tones.t0;   // black
M3Tones.t10;  // dark-scheme surface-ish
M3Tones.t40;  // light-scheme primary
M3Tones.t80;  // dark-scheme primary
M3Tones.t90;  // light-scheme primaryContainer
M3Tones.t100; // white

M3Tones.values; // all thirteen
''',
            ),
          ],
        ),
      ],
    );
  }
}

/// A palette drawn as one swatch per M3 tone stop.
class _ToneRamp extends StatelessWidget {
  const _ToneRamp(this.palette);

  final M3TonalPalette palette;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: M3Spacings.s32,
      child: Row(
        children: [
          for (final tone in M3Tones.values)
            Expanded(child: ColoredBox(color: palette[tone])),
        ],
      ),
    );
  }
}
