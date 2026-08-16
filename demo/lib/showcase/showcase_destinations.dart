import 'package:flutter/material.dart';
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

/// One entry in the showcase: a page and the destination that reaches it.
///
/// Page and destination live in the same object on purpose. They used to be
/// two parallel lists — a `List<Widget>` of pages and a `List<
/// NavigationRailDestination>` of labels — kept in step by index arithmetic,
/// which is a silent-breakage machine: insert a page in the middle and every
/// label below it points at the wrong screen.
@immutable
class ShowcaseDestination {
  const ShowcaseDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.page,
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

  /// The page this destination opens.
  final Widget page;
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
    title: 'Foundations',
    url: 'https://m3.material.io/foundations',
    destinations: [
      ShowcaseDestination(
        label: 'Spacing',
        icon: Icons.straighten_outlined,
        selectedIcon: Icons.straighten,
        page: SpacingPage(),
      ),
      ShowcaseDestination(
        label: 'Density',
        icon: Icons.density_medium_outlined,
        selectedIcon: Icons.density_medium,
        page: VisualDensityPage(),
      ),
      ShowcaseDestination(
        label: 'Breakpoints',
        icon: Icons.aspect_ratio_outlined,
        selectedIcon: Icons.aspect_ratio,
        page: BreakpointTokensPage(),
      ),
      ShowcaseDestination(
        label: 'Z-Index',
        icon: Icons.layers_outlined,
        selectedIcon: Icons.layers,
        page: ZIndexTokensPage(),
      ),
      ShowcaseDestination(
        label: 'Border',
        icon: Icons.border_style_outlined,
        selectedIcon: Icons.border_style,
        page: BorderTokensPage(),
      ),
      ShowcaseDestination(
        label: 'Icons',
        icon: Icons.emoji_symbols_outlined,
        selectedIcon: Icons.emoji_symbols,
        page: IconTokensPage(),
      ),
      ShowcaseDestination(
        label: 'Components',
        icon: Icons.widgets_outlined,
        selectedIcon: Icons.widgets,
        page: ComponentTokensPage(),
      ),
      ShowcaseDestination(
        label: 'Opacity',
        icon: Icons.opacity_outlined,
        selectedIcon: Icons.opacity,
        page: OpacityTokensPage(),
      ),
      ShowcaseDestination(
        label: 'A11y',
        icon: Icons.accessibility_outlined,
        selectedIcon: Icons.accessibility,
        page: AccessibilityPage(),
      ),
      ShowcaseDestination(
        label: 'Adaptive',
        icon: Icons.devices_outlined,
        selectedIcon: Icons.devices,
        page: AdaptivePage(),
      ),
      ShowcaseDestination(
        label: 'Responsive',
        icon: Icons.grid_view_outlined,
        selectedIcon: Icons.grid_view,
        page: ResponsivePage(),
      ),
      ShowcaseDestination(
        label: 'Layouts',
        icon: Icons.view_quilt_outlined,
        selectedIcon: Icons.view_quilt,
        page: CanonicalLayoutsPage(),
      ),
      ShowcaseDestination(
        label: 'Interaction',
        icon: Icons.touch_app_outlined,
        selectedIcon: Icons.touch_app,
        page: InteractionPage(),
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
      ),
      ShowcaseDestination(
        label: 'Schemes',
        icon: Icons.gradient_outlined,
        selectedIcon: Icons.gradient,
        page: ColorSchemesPage(),
      ),
      ShowcaseDestination(
        label: 'Tonal',
        icon: Icons.palette_outlined,
        selectedIcon: Icons.palette,
        page: TonalPalettePage(),
      ),
      ShowcaseDestination(
        label: 'Typography',
        icon: Icons.text_fields_outlined,
        selectedIcon: Icons.text_fields,
        page: TypographyPage(),
      ),
      ShowcaseDestination(
        label: 'Elevation',
        icon: Icons.copy_outlined,
        selectedIcon: Icons.copy,
        page: ElevationPage(),
      ),
      ShowcaseDestination(
        label: 'Shape',
        icon: Icons.rounded_corner_outlined,
        selectedIcon: Icons.rounded_corner,
        page: ShapePage(),
      ),
      ShowcaseDestination(
        label: 'Motion',
        icon: Icons.animation_outlined,
        selectedIcon: Icons.animation,
        page: MotionPage(),
      ),
      ShowcaseDestination(
        label: 'Springs',
        icon: Icons.waves_outlined,
        selectedIcon: Icons.waves,
        page: SpringPage(),
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
      ),
    ],
  ),
  ShowcaseSection(
    title: 'Expressive',
    url: 'https://m3.material.io/blog/building-with-m3-expressive',
    destinations: [
      ShowcaseDestination(
        label: 'Expressive',
        icon: Icons.local_activity_outlined,
        selectedIcon: Icons.local_activity,
        page: M3ExpressivePage(),
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
