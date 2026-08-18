import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/preview_bits.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the A11y destination.
class AccessibilityRecipes extends StatelessWidget {
  const AccessibilityRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final touchTarget = M3Accessibility.minTouchTarget(context);
    final reduceMotion = M3Accessibility.shouldReduceMotion(context);

    return RecipePage(
      title: 'A11y',
      summary: 'Accessibility settings are things the user already told the '
          'platform. These helpers read them back, so a layout adapts instead '
          'of assuming everyone is on your machine.',
      groups: [
        RecipeGroup(
          title: 'M3Accessibility — touch targets',
          url: 'https://m3.material.io/foundations/designing/structure',
          recipes: [
            CodeRecipe(
              title: 'The minimum a finger can hit',
              summary: '48dp on touch platforms, 32dp on desktop. Expand the '
                  'tap area rather than the visible control.',
              code: '''
final target = M3Accessibility.minTouchTarget(context);

SizedBox(
  width: target,
  height: target,
  child: IconButton(onPressed: onTap, icon: const Icon(Icons.close)),
)
''',
              preview: PreviewValue(
                '${touchTarget.toStringAsFixed(0)}dp',
                label: 'minTouchTarget on this platform',
              ),
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3Accessibility — contrast',
          url: 'https://m3.material.io/foundations/accessible-design/'
              'patterns',
          recipes: [
            CodeRecipe(
              title: 'Check a pair before you ship it',
              summary: 'WCAG AA for normal text is 4.5:1. The check is a '
                  'boolean, so it can guard a test as easily as a widget.',
              code: '''
M3Accessibility.meetsContrastRequirement(
  foreground: colorScheme.onPrimary,
  background: colorScheme.primary,
);

// Large text has a lower bar; AAA has a higher one.
M3Accessibility.meetsContrastRequirement(
  foreground: label,
  background: surface,
  isLargeText: true,
  useEnhanced: true,
);
''',
              preview: PreviewValue(
                M3Accessibility.meetsContrastRequirement(
                  foreground: colorScheme.onPrimary,
                  background: colorScheme.primary,
                )
                    ? 'true — onPrimary passes on primary'
                    : 'false — this seed needs adjusting',
                label: 'meetsContrastRequirement',
              ),
            ),
            const CodeRecipe(
              title: 'Fix one that fails',
              summary: 'Darkens or lightens the colour until it clears the '
                  'bar, instead of you nudging a hex value until it looks '
                  'right.',
              code: '''
final safe = M3Accessibility.makeAccessible(
  color: brandYellow,
  background: colorScheme.surface,
);
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3Accessibility — motion & contrast settings',
          url: 'https://m3.material.io/foundations/accessible-design/'
              'accessibility-basics',
          recipes: [
            CodeRecipe(
              title: 'Honour reduce-motion',
              summary: 'Do not branch on the flag by hand at every call site '
                  '— hand the normal duration in and get back whatever the '
                  'user asked for.',
              code: '''
AnimatedContainer(
  duration: M3Accessibility.adaptiveDuration(
    context: context,
    normal: M3Motion.emphasized.duration,
  ),
  curve: M3Accessibility.adaptiveCurve(
    context: context,
    normal: M3Motion.emphasized.curve,
  ),
)
''',
              preview: PreviewValue(
                reduceMotion ? 'true — animations reduced' : 'false',
                label: 'shouldReduceMotion',
              ),
            ),
            const CodeRecipe(
              title: 'Adapt a whole theme at once',
              summary: 'Reads high-contrast, reduced-motion and text scale off '
                  'the platform and applies what it finds to a ThemeData.',
              code: '''
final theme = M3AccessibilityConfig.fromContext(context)
    .applyToTheme(baseTheme);

MaterialApp(theme: theme, home: const HomePage());
''',
            ),
          ],
        ),
      ],
    );
  }
}
