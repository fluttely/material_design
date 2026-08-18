import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase/showcase_destinations.dart';
import 'package:material_design_demo/showcase/showcase_mode.dart';
import 'package:material_design_demo/showcase/theme_controls.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';

/// The navigation drawer used on the compact window size class.
///
/// Same destinations as [ShowcaseRail], same order, same selection index,
/// same Visual/Code switch — both read [showcaseSections].
class ShowcaseDrawer extends StatelessWidget {
  const ShowcaseDrawer({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.mode,
    required this.onModeSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final ShowcaseMode mode;
  final ValueChanged<ShowcaseMode> onModeSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      children: [
        const _DrawerHeading('Material Design 3'),
        M3Padding(
          padding: const M3EdgeInsets.only(bottom: M3Spacings.s8),
          child: ShowcaseModeSwitch(
            mode: mode,
            onModeSelected: onModeSelected,
            axis: Axis.horizontal,
          ),
        ),
        const _DrawerDivider(),
        for (final section in showcaseSections) ...[
          _DrawerHeading(section.title),
          for (final destination in section.destinations)
            NavigationDrawerDestination(
              icon: Icon(destination.icon),
              selectedIcon: Icon(destination.selectedIcon),
              label: Text(destination.label),
            ),
          const _DrawerDivider(),
        ],
        const _DrawerHeading('Theme'),
        const ThemeControls(axis: Axis.horizontal),
        const M3Gap(M3Spacings.s8),
        M3Padding(
          padding: const M3EdgeInsets.symmetric(horizontal: M3Spacings.s16),
          child: const ShowcaseLink(
            label: 'Flutter M3 Demo',
            url: 'https://flutterweb-wasm.web.app/',
          ),
        ),
      ],
    );
  }
}

/// A section heading, inset to the M3 drawer's 28dp text margin.
class _DrawerHeading extends StatelessWidget {
  const _DrawerHeading(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return M3Padding(
      padding: const M3EdgeInsets.fromLTRB(
        M3Spacings.s28,
        M3Spacings.s16,
        M3Spacings.s16,
        M3Spacings.s12,
      ),
      child: Text(title, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}

/// The drawer's inset divider.
class _DrawerDivider extends StatelessWidget {
  const _DrawerDivider();

  @override
  Widget build(BuildContext context) {
    return const M3Padding(
      padding: M3EdgeInsets.symmetric(horizontal: M3Spacings.s28),
      child: Divider(),
    );
  }
}
