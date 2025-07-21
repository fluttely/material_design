import 'package:flutter/material.dart';
// Make sure this import points to the file where
// M3ElevationProfile and M3Elevation are defined.
import 'package:material_design/material_design.dart';
import 'package:material_design_example/showcase_pages/widgets/launch_url_text.dart';

class ElevationPage extends StatelessWidget {
  const ElevationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // The lists now use the M3ElevationProfile class directly.
    // The structure is: (M3ElevationProfile, CardName)
    final elevations = [
      (M3Elevation.level0, 'Level 0'),
      (M3Elevation.level1, 'Level 1'),
      (M3Elevation.level2, 'Level 2'),
      (M3Elevation.level3, 'Level 3'),
      (M3Elevation.level4, 'Level 4'),
      (M3Elevation.level5, 'Level 5'),
    ];

    final elevationsWithoutShadow = [
      (M3Elevation.level0.withoutShadow, 'Level 0 Without Shadow'),
      (M3Elevation.level1.withoutShadow, 'Level 1 Without Shadow'),
      (M3Elevation.level2.withoutShadow, 'Level 2 Without Shadow'),
      (M3Elevation.level3.withoutShadow, 'Level 3 Without Shadow'),
      (M3Elevation.level4.withoutShadow, 'Level 4 Without Shadow'),
      (M3Elevation.level5.withoutShadow, 'Level 5 Without Shadow'),
    ];

    final componentElevations = [
      (M3ComponentElevation.card, 'card'),
      (M3ComponentElevation.button, 'button'),
      (M3ComponentElevation.elevatedButton, 'elevatedButton'),
      (M3ComponentElevation.fab, 'fab'),
      (M3ComponentElevation.appBar, 'appBar'),
      (M3ComponentElevation.bottomAppBar, 'bottomAppBar'),
      (M3ComponentElevation.drawer, 'drawer'),
      (M3ComponentElevation.bottomSheet, 'bottomSheet'),
      (M3ComponentElevation.dialog, 'dialog'),
      (M3ComponentElevation.snackbar, 'snackbar'),
      (M3ComponentElevation.tooltip, 'tooltip'),
      (M3ComponentElevation.menu, 'menu'),
      (M3ComponentElevation.navigationBar, 'navigationBar'),
      (M3ComponentElevation.navigationRail, 'navigationRail'),
      (M3ComponentElevation.searchBar, 'searchBar'),
      (M3ComponentElevation.chip, 'chip'),
    ];

    final interactiveStateElevations = [
      (M3StateElevation.cardHover, 'cardHover'),
      (M3StateElevation.cardPressed, 'cardPressed'),
      (M3StateElevation.buttonHover, 'buttonHover'),
      (M3StateElevation.buttonPressed, 'buttonPressed'),
      (M3StateElevation.fabHover, 'fabHover'),
      (M3StateElevation.fabPressed, 'fabPressed'),
      (M3StateElevation.filledIconButtonHover, 'filledIconButtonHover'),
      (M3StateElevation.filledIconButtonPressed, 'filledIconButtonPressed'),
      (M3StateElevation.chipDragged, 'chipDragged'),
      (M3StateElevation.switchThumbRest, 'switchThumbRest'),
      (M3StateElevation.switchThumbHover, 'switchThumbHover'),
      (M3StateElevation.switchThumbPressed, 'switchThumbPressed'),
      (
        M3StateElevation.navigationBarIndicatorHover,
        'navigationBarIndicatorHover'
      ),
      (
        M3StateElevation.navigationBarIndicatorFocus,
        'navigationBarIndicatorFocus'
      ),
      (
        M3StateElevation.navigationRailIndicatorHover,
        'navigationRailIndicatorHover'
      ),
      (
        M3StateElevation.navigationRailIndicatorFocus,
        'navigationRailIndicatorFocus'
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Elevation'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(M3Margin.mediumScreen),
        children: [
          Text(
            'Elevation in M3 is a combination of a surface tint and, for some components, a shadow. Below, the cards are rendered according to the official rules defined in the M3Elevation token class.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: M3Spacing.space16),
          _ElevationGrid(
            title: 'M3Elevation Tokens (Levels)',
            m3Link: 'https://m3.material.io/styles/elevation/overview',
            profiles: elevations,
          ),
          const SizedBox(height: M3Spacing.space32),
          _ElevationGrid(
            title: 'M3Elevation Tokens (Levels Without Shadow)',
            m3Link: 'https://m3.material.io/styles/elevation/overview',
            profiles: elevationsWithoutShadow,
          ),
          const SizedBox(height: M3Spacing.space32),
          _ElevationGrid(
            title: 'M3ComponentElevation Tokens (Elevation by Component)',
            m3Link: 'https://m3.material.io/styles/elevation/overview',
            profiles: componentElevations,
          ),
          const SizedBox(height: M3Spacing.space32),
          _ElevationGrid(
            title: 'M3StateElevation Tokens (Interactive State Elevation)',
            m3Link:
                'https://m3.material.io/foundations/interaction/states/overview',
            profiles: interactiveStateElevations,
          ),
        ],
      ),
    );
  }
}

/// The Grid now receives a list of profiles, no longer a complex tuple.
class _ElevationGrid extends StatelessWidget {
  const _ElevationGrid({
    required this.title,
    required this.m3Link,
    required this.profiles,
    this.subtitle,
  });

  final String title;
  final String m3Link;
  final String? subtitle;
  final List<(M3ElevationProfile, String)> profiles;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LaunchURLText(
          label: title,
          m3Url: m3Link,
        ),
        const SizedBox(height: M3Spacing.space16),
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: M3Spacing.space16),
        ],
        Wrap(
          spacing: M3Spacing.space16,
          runSpacing: M3Spacing.space16,
          children: profiles.map((data) {
            // Passes the entire profile object and the name to the card.
            return _ElevationCard(
              profile: data.$1,
              name: data.$2,
            );
          }).toList(),
        ),
      ],
    );
  }
}

/// The Card has been simplified to receive a single `profile` object.
class _ElevationCard extends StatelessWidget {
  const _ElevationCard({
    required this.profile,
    required this.name,
  });

  final M3ElevationProfile profile;
  final String name;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // The surface color is calculated using `profile.dp`.
    final elevationSurfaceColor = M3TonalColor.fromElevation(
      context,
      profile.dp,
    );
    // The shadows are applied based on `profile.hasShadow` and `profile.dp`.
    final elevationShadows =
        profile.hasShadow ? M3Shadow.fromElevation(profile.dp) : null;

    return Container(
      width: 160,
      height: 120,
      decoration: ShapeDecoration(
        shape: M3Shape.small,
        color: elevationSurfaceColor,
        shadows: elevationShadows,
      ),
      child: Padding(
        padding: const EdgeInsets.all(M3Spacing.space12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: textTheme.labelLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: M3Spacing.space4),
            Text(
              '${profile.dp.toStringAsFixed(0)} dp',
              style: textTheme.bodySmall,
            ),
            const Spacer(),
            // Displays an icon indicating the presence of a shadow for visual clarity.
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                profile.hasShadow ? Icons.visibility : Icons.visibility_off,
                size: 16,
                color: textTheme.bodySmall?.color?.withOpacity(0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
