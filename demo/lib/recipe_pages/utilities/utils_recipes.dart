import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Utils destination.
class UtilsRecipes extends StatelessWidget {
  const UtilsRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecipePage(
      title: 'Utils',
      summary: 'Two things that do not belong to any single scale: the way out '
          'of the contract when a value genuinely is off-scale, and the '
          'handful of helpers that compose several scales at once.',
      groups: [
        RecipeGroup(
          title: 'M3Contract',
          recipes: [
            CodeRecipe(
              title: 'Break the contract on purpose',
              summary: 'Sometimes the design system is not the authority — a '
                  'brand asset really is 18dp. This is the one sanctioned door '
                  'out, and it names itself so the deviation is visible.',
              code: '''
M3Padding(
  padding: M3EdgeInsets.all(M3Contract.spacing(18)),
  child: brandLogo,
)
''',
              preview: Container(
                padding: M3EdgeInsets.all(M3Contract.spacing(18)),
                decoration: M3BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: M3BorderRadius.medium,
                ),
                child: Text(
                  '18dp — off the 4dp grid, on purpose',
                  style: M3TypeScale.bodyMedium.copyWith(
                    color: colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
            ),
            const CodeRecipe(
              title: 'A factory per scale',
              summary: 'Every scale has exactly one escape hatch, and they all '
                  'share an identifier — which is what makes drift countable.',
              code: '''
M3Contract.spacing(18);
M3Contract.corner(10);
M3Contract.borderWidth(3);
M3Contract.opacity(0.72);
M3Contract.iconSize(28);
M3Contract.breakpoint(960);
M3Contract.elevationDp(5);
M3Contract.zIndex(42);
M3Contract.contrastLevel(0.25);
''',
            ),
            CodeRecipe(
              title: 'Measure the drift',
              summary: 'Because every deviation names the same identifier, '
                  'compliance is a number. Zero-drift teams fail CI on any '
                  'hit; migrating teams watch it fall.',
              code: r'''
// grep -rn 'M3Contract\.' lib/ | wc -l
''',
              preview: Text(
                r"grep -rn 'M3Contract\.' lib/ | wc -l",
                style: M3TextUtils.mono(M3TypeScale.bodyMedium).copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        RecipeGroup(
          title: 'Composed helpers',
          url: 'https://m3.material.io/styles',
          recipes: [
            CodeRecipe(
              title: 'A surface that raises itself properly',
              summary: 'Elevation, shape and motion in one widget — the tint '
                  'and the shadow move together, because they come from the '
                  'same token.',
              code: '''
AnimatedContainer(
  duration: M3Motion.standardDuration,
  curve: M3Motion.standardCurve,
  decoration: ShapeDecoration(
    color: elevation.surfaceColor(context),
    shape: M3Shape.large,
    shadows: elevation.shadows,
  ),
  child: card,
)
''',
              preview: _ElevationSlider(),
            ),
            const CodeRecipe(
              title: 'Typography that answers to the reader',
              summary: 'The three M3TextUtils transformations that depend on '
                  'something outside the type scale: the window, the user, and '
                  'the content.',
              code: '''
Text('Headline', style: M3TextUtils.responsiveDisplay(context));
Text(body, style: M3TextUtils.dyslexiaFriendly(M3TypeScale.bodyLarge));
Text(code, style: M3TextUtils.mono(M3TypeScale.bodySmall));
''',
            ),
          ],
        ),
      ],
    );
  }
}

/// A card whose tint and shadow follow one elevation token.
class _ElevationSlider extends StatefulWidget {
  const _ElevationSlider();

  @override
  State<_ElevationSlider> createState() => _ElevationSliderState();
}

class _ElevationSliderState extends State<_ElevationSlider> {
  M3Elevation _elevation = M3Elevation.level2;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: M3Motion.standardDuration,
          curve: M3Motion.standardCurve,
          height: M3Spacings.s64,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: _elevation.surfaceColor(context),
            shape: M3Shape.large,
            shadows: _elevation.shadows,
          ),
          child: Text(
            '${_elevation.name} · ${_elevation.dp.toStringAsFixed(0)}dp',
            style: M3TypeScale.labelLarge.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ),
        Slider(
          value: _elevation.index.toDouble(),
          max: (M3Elevation.values.length - 1).toDouble(),
          divisions: M3Elevation.values.length - 1,
          label: _elevation.name,
          onChanged: (value) => setState(
            () => _elevation = M3Elevation.values[value.round()],
          ),
        ),
      ],
    );
  }
}
