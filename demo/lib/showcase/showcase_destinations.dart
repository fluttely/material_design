import 'package:flutter/material.dart';
import 'package:material_design_demo/recipe_pages/foundations/accessibility_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/adaptive_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/border_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/breakpoint_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/canonical_layout_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/component_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/icon_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/interaction_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/opacity_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/responsive_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/spacing_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/visual_density_recipes.dart';
import 'package:material_design_demo/recipe_pages/foundations/z_index_recipes.dart';
import 'package:material_design_demo/recipe_pages/m3_expressive/expressive_recipes.dart';
import 'package:material_design_demo/recipe_pages/styles/color_recipes.dart';
import 'package:material_design_demo/recipe_pages/styles/color_scheme_recipes.dart';
import 'package:material_design_demo/recipe_pages/styles/elevation_recipes.dart';
import 'package:material_design_demo/recipe_pages/styles/motion_recipes.dart';
import 'package:material_design_demo/recipe_pages/styles/shape_recipes.dart';
import 'package:material_design_demo/recipe_pages/styles/spring_recipes.dart';
import 'package:material_design_demo/recipe_pages/styles/tonal_palette_recipes.dart';
import 'package:material_design_demo/recipe_pages/styles/typography_recipes.dart';
import 'package:material_design_demo/recipe_pages/utilities/utils_recipes.dart';
import 'package:material_design_demo/showcase_pages/foundations/accessibility_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/adaptive_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/border_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/breakpoint_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/canonical_layouts_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/component_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/icon_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/interaction_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/opacity_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/responsive_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/spacing_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/visual_density_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/z_index_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/m3_expressive/m3_expressive_page.dart';
import 'package:material_design_demo/showcase_pages/styles/color_schemes_page.dart';
import 'package:material_design_demo/showcase_pages/styles/color_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/styles/elevation_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/styles/motion_page.dart';
import 'package:material_design_demo/showcase_pages/styles/shape_page.dart';
import 'package:material_design_demo/showcase_pages/styles/spring_page.dart';
import 'package:material_design_demo/showcase_pages/styles/tonal_palette_page.dart';
import 'package:material_design_demo/showcase_pages/styles/typography_page.dart';
import 'package:material_design_demo/showcase_pages/utilities/utils_page.dart';

/// One entry in the showcase: a destination and the two pages behind it.
///
/// Page and destination live in the same object on purpose. They used to be
/// two parallel lists — a `List<Widget>` of pages and a `List<
/// NavigationRailDestination>` of labels — kept in step by index arithmetic,
/// which is a silent-breakage machine: insert a page in the middle and every
/// label below it points at the wrong screen.
///
/// The same argument is why [codePage] is a field here rather than a second
/// list of destinations: a token family and the code that uses it are one
/// subject, and the rail should not grow a second copy of itself to say so.
@immutable
class ShowcaseDestination {
  const ShowcaseDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.page,
    required this.codePage,
  });

  /// Short label shown under the rail icon and beside the drawer icon.
  final String label;

  /// Icon for the unselected state.
  final IconData icon;

  /// Icon for the selected state — the filled counterpart of [icon].
  ///
  /// M3 marks the active destination by moving along the Material Symbols
  /// `FILL` axis. Flutter's bundled `Icons` font is static rather than
  /// variable, so the demo swaps to the filled glyph to get the same result.
  final IconData selectedIcon;

  /// The page this destination opens in `ShowcaseMode.visual` — the tokens,
  /// rendered.
  final Widget page;

  /// The page it opens in `ShowcaseMode.code` — the same families, written
  /// out as the calls that produce them.
  final Widget codePage;
}

/// A titled group of destinations, optionally linking to the spec page it
/// covers.
@immutable
class ShowcaseSection {
  const ShowcaseSection({
    required this.title,
    required this.destinations,
    this.url,
  });

  /// Heading shown above the group in both the rail and the drawer.
  final String title;

  /// The spec page this group implements, if it has a single one.
  final String? url;

  /// The destinations in this group, in presentation order.
  final List<ShowcaseDestination> destinations;
}

/// Every section of the showcase, in the canonical order the README and
/// `example/lib/main.dart` also use.
///
/// This list is the single source of truth for navigation: the rail, the
/// drawer, and the page body are all derived from it.
const List<ShowcaseSection> showcaseSections = [
  ShowcaseSection(
    title: 'Expressive',
    url: 'https://m3.material.io/blog/building-with-m3-expressive',
    destinations: [
      ShowcaseDestination(
        label: 'Expressive',
        icon: Icons.local_activity_outlined,
        selectedIcon: Icons.local_activity,
        page: M3ExpressivePage(),
        codePage: ExpressiveRecipes(),
      ),
    ],
  ),
  ShowcaseSection(
    title: 'Foundations',
    url: 'https://m3.material.io/foundations',
    destinations: [
      ShowcaseDestination(
        label: 'Spacing',
        icon: Icons.straighten_outlined,
        selectedIcon: Icons.straighten,
        page: SpacingPage(),
        codePage: SpacingRecipes(),
      ),
      ShowcaseDestination(
        label: 'Density',
        icon: Icons.density_medium_outlined,
        selectedIcon: Icons.density_medium,
        page: VisualDensityPage(),
        codePage: VisualDensityRecipes(),
      ),
      ShowcaseDestination(
        label: 'Breakpoints',
        icon: Icons.aspect_ratio_outlined,
        selectedIcon: Icons.aspect_ratio,
        page: BreakpointTokensPage(),
        codePage: BreakpointRecipes(),
      ),
      ShowcaseDestination(
        label: 'Z-Index',
        icon: Icons.layers_outlined,
        selectedIcon: Icons.layers,
        page: ZIndexTokensPage(),
        codePage: ZIndexRecipes(),
      ),
      ShowcaseDestination(
        label: 'Border',
        icon: Icons.border_style_outlined,
        selectedIcon: Icons.border_style,
        page: BorderTokensPage(),
        codePage: BorderRecipes(),
      ),
      ShowcaseDestination(
        label: 'Icons',
        icon: Icons.emoji_symbols_outlined,
        selectedIcon: Icons.emoji_symbols,
        page: IconTokensPage(),
        codePage: IconRecipes(),
      ),
      ShowcaseDestination(
        label: 'Components',
        icon: Icons.widgets_outlined,
        selectedIcon: Icons.widgets,
        page: ComponentTokensPage(),
        codePage: ComponentRecipes(),
      ),
      ShowcaseDestination(
        label: 'Opacity',
        icon: Icons.opacity_outlined,
        selectedIcon: Icons.opacity,
        page: OpacityTokensPage(),
        codePage: OpacityRecipes(),
      ),
      ShowcaseDestination(
        label: 'A11y',
        icon: Icons.accessibility_outlined,
        selectedIcon: Icons.accessibility,
        page: AccessibilityPage(),
        codePage: AccessibilityRecipes(),
      ),
      ShowcaseDestination(
        label: 'Adaptive',
        icon: Icons.devices_outlined,
        selectedIcon: Icons.devices,
        page: AdaptivePage(),
        codePage: AdaptiveRecipes(),
      ),
      ShowcaseDestination(
        label: 'Responsive',
        icon: Icons.grid_view_outlined,
        selectedIcon: Icons.grid_view,
        page: ResponsivePage(),
        codePage: ResponsiveRecipes(),
      ),
      ShowcaseDestination(
        label: 'Layouts',
        icon: Icons.view_quilt_outlined,
        selectedIcon: Icons.view_quilt,
        page: CanonicalLayoutsPage(),
        codePage: CanonicalLayoutRecipes(),
      ),
      ShowcaseDestination(
        label: 'Interaction',
        icon: Icons.touch_app_outlined,
        selectedIcon: Icons.touch_app,
        page: InteractionPage(),
        codePage: InteractionRecipes(),
      ),
    ],
  ),
  ShowcaseSection(
    title: 'Styles',
    url: 'https://m3.material.io/styles',
    destinations: [
      ShowcaseDestination(
        label: 'Color',
        icon: Icons.format_paint_outlined,
        selectedIcon: Icons.format_paint,
        page: ColorTokensPage(),
        codePage: ColorRecipes(),
      ),
      ShowcaseDestination(
        label: 'Schemes',
        icon: Icons.gradient_outlined,
        selectedIcon: Icons.gradient,
        page: ColorSchemesPage(),
        codePage: ColorSchemeRecipes(),
      ),
      ShowcaseDestination(
        label: 'Tonal',
        icon: Icons.palette_outlined,
        selectedIcon: Icons.palette,
        page: TonalPalettePage(),
        codePage: TonalPaletteRecipes(),
      ),
      ShowcaseDestination(
        label: 'Typography',
        icon: Icons.text_fields_outlined,
        selectedIcon: Icons.text_fields,
        page: TypographyPage(),
        codePage: TypographyRecipes(),
      ),
      ShowcaseDestination(
        label: 'Elevation',
        icon: Icons.copy_outlined,
        selectedIcon: Icons.copy,
        page: ElevationPage(),
        codePage: ElevationRecipes(),
      ),
      ShowcaseDestination(
        label: 'Shape',
        icon: Icons.rounded_corner_outlined,
        selectedIcon: Icons.rounded_corner,
        page: ShapePage(),
        codePage: ShapeRecipes(),
      ),
      ShowcaseDestination(
        label: 'Motion',
        icon: Icons.animation_outlined,
        selectedIcon: Icons.animation,
        page: MotionPage(),
        codePage: MotionRecipes(),
      ),
      ShowcaseDestination(
        label: 'Springs',
        icon: Icons.waves_outlined,
        selectedIcon: Icons.waves,
        page: SpringPage(),
        codePage: SpringRecipes(),
      ),
    ],
  ),
  ShowcaseSection(
    title: 'Utilities',
    destinations: [
      ShowcaseDestination(
        label: 'Utils',
        icon: Icons.auto_awesome_outlined,
        selectedIcon: Icons.auto_awesome,
        page: UtilsPage(),
        codePage: UtilsRecipes(),
      ),
    ],
  ),
];

/// Every destination, flattened in section order.
///
/// The selected index addresses this list, so section boundaries never leak
/// into the selection logic.
final List<ShowcaseDestination> showcaseDestinations = [
  for (final section in showcaseSections) ...section.destinations,
];

/// The flat index of the first destination of [section].
int showcaseSectionOffset(ShowcaseSection section) {
  var offset = 0;
  for (final candidate in showcaseSections) {
    if (identical(candidate, section)) return offset;
    offset += candidate.destinations.length;
  }
  return offset;
}
