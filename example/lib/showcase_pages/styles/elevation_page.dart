import 'package:flutter/material.dart';
// Make sure this import points to the file where
import 'package:material_design/material_design.dart';
import 'package:material_design_example/showcase_pages/widgets/launch_url_text.dart';

class ElevationPage extends StatelessWidget {
  const ElevationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final elevations = [
      (M3ElevationToken.level0, true, 'Level 0'),
      (M3ElevationToken.level1, true, 'Level 1'),
      (M3ElevationToken.level2, true, 'Level 2'),
      (M3ElevationToken.level3, true, 'Level 3'),
      (M3ElevationToken.level4, true, 'Level 4'),
      (M3ElevationToken.level5, true, 'Level 5'),
    ];

    final elevationsWithoutShadow = [
      (M3ElevationToken.level0, false, 'Level 0 Without Shadow'),
      (M3ElevationToken.level1, false, 'Level 1 Without Shadow'),
      (M3ElevationToken.level2, false, 'Level 2 Without Shadow'),
      (M3ElevationToken.level3, false, 'Level 3 Without Shadow'),
      (M3ElevationToken.level4, false, 'Level 4 Without Shadow'),
      (M3ElevationToken.level5, false, 'Level 5 Without Shadow'),
    ];

    final componentElevations = [
      (M3ComponentElevationToken.card, true, 'card'),
      (M3ComponentElevationToken.button, true, 'button'),
      (M3ComponentElevationToken.elevatedButton, true, 'elevatedButton'),
      (M3ComponentElevationToken.fab, true, 'fab'),
      (M3ComponentElevationToken.appBar, true, 'appBar'),
      (M3ComponentElevationToken.bottomAppBar, true, 'bottomAppBar'),
      (M3ComponentElevationToken.drawer, true, 'drawer'),
      (M3ComponentElevationToken.bottomSheet, true, 'bottomSheet'),
      (M3ComponentElevationToken.dialog, true, 'dialog'),
      (M3ComponentElevationToken.snackbar, true, 'snackbar'),
      (M3ComponentElevationToken.tooltip, true, 'tooltip'),
      (M3ComponentElevationToken.menu, true, 'menu'),
      (M3ComponentElevationToken.navigationBar, true, 'navigationBar'),
      (M3ComponentElevationToken.navigationRail, true, 'navigationRail'),
      (M3ComponentElevationToken.searchBar, true, 'searchBar'),
      (M3ComponentElevationToken.chip, true, 'chip'),
    ];

    final interactiveStateElevations = [
      (M3StateElevationToken.cardHover, true, 'cardHover'),
      (M3StateElevationToken.cardPressed, true, 'cardPressed'),
      (M3StateElevationToken.buttonHover, true, 'buttonHover'),
      (M3StateElevationToken.buttonPressed, true, 'buttonPressed'),
      (M3StateElevationToken.fabHover, true, 'fabHover'),
      (M3StateElevationToken.fabPressed, true, 'fabPressed'),
      (
        M3StateElevationToken.filledIconButtonHover,
        true,
        'filledIconButtonHover'
      ),
      (
        M3StateElevationToken.filledIconButtonPressed,
        true,
        'filledIconButtonPressed'
      ),
      (M3StateElevationToken.chipDragged, true, 'chipDragged'),
      (M3StateElevationToken.switchThumbRest, true, 'switchThumbRest'),
      (M3StateElevationToken.switchThumbHover, true, 'switchThumbHover'),
      (M3StateElevationToken.switchThumbPressed, true, 'switchThumbPressed'),
      (
        M3StateElevationToken.navigationBarIndicatorHover,
        true,
        'navigationBarIndicatorHover'
      ),
      (
        M3StateElevationToken.navigationBarIndicatorFocus,
        true,
        'navigationBarIndicatorFocus'
      ),
      (
        M3StateElevationToken.navigationRailIndicatorHover,
        true,
        'navigationRailIndicatorHover'
      ),
      (
        M3StateElevationToken.navigationRailIndicatorFocus,
        true,
        'navigationRailIndicatorFocus'
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Elevation'),
      ),
      body: ListView(
        padding: EdgeInsets.all(M3MarginToken.mediumScreen.value),
        children: [
          Text(
            'Elevation in M3 is a combination of a surface tint and, for some components, a shadow. Below, the cards are rendered according to the official rules defined in the M3Elevation token class.',
            style: textTheme.bodyMedium,
          ),
          SizedBox(height: M3SpacingToken.space16.value),
          _ElevationGrid(
            title: 'M3Elevation Tokens (Levels)',
            m3Link: 'https://m3.material.io/styles/elevation/overview',
            elevations: elevations,
          ),
          SizedBox(height: M3SpacingToken.space32.value),
          _ElevationGrid(
            title: 'M3Elevation Tokens (Levels Without Shadow)',
            m3Link: 'https://m3.material.io/styles/elevation/overview',
            elevations: elevationsWithoutShadow,
          ),
          SizedBox(height: M3SpacingToken.space32.value),
          _ElevationGrid(
            title: 'M3ComponentElevation Tokens  true,(Elevation by Component)',
            m3Link: 'https://m3.material.io/styles/elevation/overview',
            elevations: componentElevations,
          ),
          SizedBox(height: M3SpacingToken.space32.value),
          _ElevationGrid(
            title: 'M3StateElevation Tokens (Interactive State Elevation)',
            m3Link:
                'https://m3.material.io/foundations/interaction/states/overview',
            elevations: interactiveStateElevations,
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
    required this.elevations,
    this.subtitle,
  });

  final String title;
  final String m3Link;
  final String? subtitle;
  final List<(IM3ElevationToken, bool, String)> elevations;

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
        SizedBox(height: M3SpacingToken.space16.value),
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: textTheme.bodyMedium,
          ),
          SizedBox(height: M3SpacingToken.space16.value),
        ],
        Wrap(
          spacing: M3SpacingToken.space16.value,
          runSpacing: M3SpacingToken.space16.value,
          children: elevations.map((data) {
            // Passes the entire profile object and the name to the card.
            return _ElevationCard(
              elevation: data.$1,
              useShadows: data.$2,
              name: data.$3,
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
    required this.elevation,
    required this.useShadows,
    required this.name,
  });

  final IM3ElevationToken elevation;
  final bool useShadows;
  final String name;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // // The surface color is calculated using `profile.value`.
    // final elevationSurfaceColor = M3TonalColor.fromElevation(
    //   context,
    //   elevation.value,
    // );
    // // The shadows are applied based on `profile.hasShadow` and `profile.value`.
    // final elevationShadows =
    //     elevation.hasShadow ? M3Shadow.fromElevation(elevation.value) : null;

    return Container(
      width: 160,
      height: 120,
      decoration: ShapeDecoration(
        shape: M3ShapeToken.small.value,
        color: elevation.surfaceColor(context),
        shadows: useShadows ? elevation.shadows : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space12.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: textTheme.labelLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: M3SpacingToken.space4.value),
            Text(
              '${elevation.value.toStringAsFixed(0)} dp',
              style: textTheme.bodySmall,
            ),
            const Spacer(),
            // Displays an icon indicating the presence of a shadow for visual clarity.
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                elevation.hasShadow ? Icons.visibility : Icons.visibility_off,
                size: M3IconSizeToken.dense.value,
                color: textTheme.bodySmall?.color?.withValues(alpha: 0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
