import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_block.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_card.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';

/// The Code half of a showcase destination: the same families the Visual page
/// renders, written out as the calls that produce them.
///
/// Every code page is this widget with a different list — the layout, the
/// import line and the section headings are decided once here, so a new page
/// is a list of [RecipeGroup]s and nothing else.
class RecipePage extends StatelessWidget {
  const RecipePage({
    required this.title,
    required this.summary,
    required this.groups,
    super.key,
  });

  /// The destination's name — the Visual page carries the same one.
  final String title;

  /// One or two sentences on what the whole page is for.
  final String summary;

  /// The families covered, in the order the Visual page shows them.
  final List<RecipeGroup> groups;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('$title · Code')),
      body: ListView(
        padding: const M3EdgeInsets.all(M3Spacings.s16),
        children: [
          Text(
            summary,
            style: M3TypeScale.bodyLarge.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const M3Gap(M3Spacings.s12),
          // Stated once instead of in a hundred snippets: one import carries
          // the whole package.
          const CodeBlock(
            "import 'package:material_design/material_design.dart';",
          ),
          for (final group in groups) ...[
            ShowcaseLink(label: group.title, url: group.url),
            for (final recipe in group.recipes) RecipeCard(recipe),
          ],
        ],
      ),
    );
  }
}
