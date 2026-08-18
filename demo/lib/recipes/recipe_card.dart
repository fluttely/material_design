import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_block.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';

/// One [CodeRecipe]: what it is, why you would use it, it running, and the
/// code that produced it.
///
/// The preview sits *above* the snippet rather than below, because the
/// question a reader arrives with is "which one of these do I want?" — you
/// recognise the result faster than you read the call.
class RecipeCard extends StatelessWidget {
  const RecipeCard(this.recipe, {super.key});

  final CodeRecipe recipe;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final preview = recipe.preview;

    // Side by side only from the large window class up. At `expanded` (840dp)
    // the rail has already taken 80dp, so two columns would leave the snippet
    // about 360dp — narrow enough that every interesting line scrolls, which
    // is worse than reading it under the preview.
    final isWide = M3ScreenSize.of(context).isAtLeast(M3ScreenSize.large);
    final sideBySide = preview != null && isWide;

    return Card(
      margin: const M3EdgeInsets.only(bottom: M3Spacings.s16),
      child: M3Padding(
        padding: M3EdgeInsetsPatterns.card,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe.title,
              style: M3TypeScale.titleMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              recipe.summary,
              style: M3TypeScale.bodyMedium.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const M3Gap(M3Spacings.s16),
            if (sideBySide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: PreviewSurface(child: preview)),
                  const M3Gap(M3Spacings.s16),
                  Expanded(child: CodeBlock(recipe.code)),
                ],
              )
            else ...[
              if (preview != null) ...[
                PreviewSurface(child: preview),
                const M3Gap(M3Spacings.s16),
              ],
              CodeBlock(recipe.code),
            ],
          ],
        ),
      ),
    );
  }
}

/// The outlined stage a recipe's live example stands on.
///
/// Outlined rather than filled so it reads as *the app*, while the filled
/// container beside it reads as *an editor*.
class PreviewSurface extends StatelessWidget {
  const PreviewSurface({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const M3EdgeInsets.all(M3Spacings.s16),
      decoration: M3BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: M3BorderRadius.medium,
        border: M3Border.thin(colorScheme.outlineVariant),
      ),
      child: child,
    );
  }
}
