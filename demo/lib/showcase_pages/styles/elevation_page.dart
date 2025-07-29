import 'package:flutter/material.dart';
// Make sure this import points to the file where
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

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
      (M3ElevationToken.level0, false, 'Level 0'),
      (M3ElevationToken.level1, false, 'Level 1'),
      (M3ElevationToken.level2, false, 'Level 2'),
      (M3ElevationToken.level3, false, 'Level 3'),
      (M3ElevationToken.level4, false, 'Level 4'),
      (M3ElevationToken.level5, false, 'Level 5'),
    ];

    // final componentElevations = [
    //   (_M3ComponentElevationToken.card, true, 'card'),
    //   (_M3ComponentElevationToken.button, true, 'button'),
    //   (_M3ComponentElevationToken.elevatedButton, true, 'elevatedButton'),
    //   (_M3ComponentElevationToken.fab, true, 'fab'),
    //   (_M3ComponentElevationToken.appBar, true, 'appBar'),
    //   (_M3ComponentElevationToken.bottomAppBar, true, 'bottomAppBar'),
    //   (_M3ComponentElevationToken.drawer, true, 'drawer'),
    //   (_M3ComponentElevationToken.bottomSheet, true, 'bottomSheet'),
    //   (_M3ComponentElevationToken.dialog, true, 'dialog'),
    //   (_M3ComponentElevationToken.snackbar, true, 'snackbar'),
    //   (_M3ComponentElevationToken.tooltip, true, 'tooltip'),
    //   (_M3ComponentElevationToken.menu, true, 'menu'),
    //   (_M3ComponentElevationToken.navigationBar, true, 'navigationBar'),
    //   (_M3ComponentElevationToken.navigationRail, true, 'navigationRail'),
    //   (_M3ComponentElevationToken.searchBar, true, 'searchBar'),
    //   (_M3ComponentElevationToken.chip, true, 'chip'),
    // ];

    // final interactiveStateElevations = [
    //   (_M3StateElevationToken.cardHover, true, 'cardHover'),
    //   (_M3StateElevationToken.cardPressed, true, 'cardPressed'),
    //   (_M3StateElevationToken.buttonHover, true, 'buttonHover'),
    //   (_M3StateElevationToken.buttonPressed, true, 'buttonPressed'),
    //   (_M3StateElevationToken.fabHover, true, 'fabHover'),
    //   (_M3StateElevationToken.fabPressed, true, 'fabPressed'),
    //   (
    //     _M3StateElevationToken.filledIconButtonHover,
    //     true,
    //     'filledIconButtonHover'
    //   ),
    //   (
    //     _M3StateElevationToken.filledIconButtonPressed,
    //     true,
    //     'filledIconButtonPressed'
    //   ),
    //   (_M3StateElevationToken.chipDragged, true, 'chipDragged'),
    //   (_M3StateElevationToken.switchThumbRest, true, 'switchThumbRest'),
    //   (_M3StateElevationToken.switchThumbHover, true, 'switchThumbHover'),
    //   (_M3StateElevationToken.switchThumbPressed, true, 'switchThumbPressed'),
    //   (
    //     _M3StateElevationToken.navigationBarIndicatorHover,
    //     true,
    //     'navigationBarIndicatorHover'
    //   ),
    //   (
    //     _M3StateElevationToken.navigationBarIndicatorFocus,
    //     true,
    //     'navigationBarIndicatorFocus'
    //   ),
    //   (
    //     _M3StateElevationToken.navigationRailIndicatorHover,
    //     true,
    //     'navigationRailIndicatorHover'
    //   ),
    //   (
    //     _M3StateElevationToken.navigationRailIndicatorFocus,
    //     true,
    //     'navigationRailIndicatorFocus'
    //   ),
    // ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Elevation'),
      ),
      body: ListView(
        padding: M3EdgeInsets.all(M3MarginToken.mediumScreen),
        children: [
          Text(
            'Elevation in M3 is a combination of a surface tint and, for some components, a shadow. Below, the cards are rendered according to the official rules defined in the M3Elevation token class.',
            style: textTheme.bodyMedium,
          ),
          const M3Gap(M3SpacingToken.space16),
          _ElevationGrid(
            title: 'M3ElevationToken (Surface Tint Color and Shadow Color)',
            m3Link: 'https://m3.material.io/styles/elevation/overview',
            elevations: elevations,
            subtitle: '',
          ),
          const M3Gap(M3SpacingToken.space32),
          _ElevationGrid(
            title: 'M3ElevationToken (Surface Tint Color Only)',
            m3Link: 'https://m3.material.io/styles/elevation/overview',
            elevations: elevationsWithoutShadow,
            subtitle: '',
          ),
          // const M3Gap(M3SpacingToken.space32),
          // _ElevationGrid(
          //   title: 'M3ComponentElevationToken true,(Elevation by Component)',
          //   m3Link: 'https://m3.material.io/styles/elevation/overview',
          //   elevations: componentElevations,
          // subtitle: '',
          // ),
          // const M3Gap(M3SpacingToken.space32),
          // _ElevationGrid(
          //   title: 'M3StateElevationToken (Interactive State Elevation)',
          //   m3Link:
          //       'https://m3.material.io/foundations/interaction/states/overview',
          //   elevations: interactiveStateElevations,
          // subtitle: '',
          // ),
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
        const M3Gap(M3SpacingToken.space16),
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: textTheme.bodyMedium,
          ),
          const M3Gap(M3SpacingToken.space16),
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

    return Container(
      width: 160,
      height: 120,
      decoration: ShapeDecoration(
        shape: M3ShapeToken.small.value,
        color: M3SurfaceColorToken.fromElevation(elevation).value(context),
        shadows: useShadows ? elevation.shadows : null,
      ),
      child: M3Padding.all(
        M3SpacingToken.space12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: textTheme.labelLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const M3Gap(M3SpacingToken.space4),
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
