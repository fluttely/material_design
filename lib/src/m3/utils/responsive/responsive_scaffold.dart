part of '../../../../material_design.dart';

/// A responsive scaffold that automatically adjusts navigation based on window
/// size.
///
/// This widget provides a complete scaffold solution that adapts its navigation
/// pattern based on the current window size class.
class M3ResponsiveScaffold extends StatelessWidget {
  /// Creates a responsive scaffold.
  const M3ResponsiveScaffold({
    required this.body,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  /// The main content of the scaffold.
  final Widget body;

  /// Navigation destinations.
  final List<NavigationDestination> destinations;

  /// Currently selected navigation index.
  final int selectedIndex;

  /// Callback when a destination is selected.
  final ValueChanged<int> onDestinationSelected;

  /// Optional app bar.
  final PreferredSizeWidget? appBar;

  /// Optional floating action button.
  final Widget? floatingActionButton;

  /// Optional floating action button location.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return M3ResponsiveBuilder(
      builder: (context, screenSize) {
        final navigationType = M3ResponsiveNavigation.getNavigationType(
          screenSize,
        );

        switch (navigationType) {
          case M3NavigationType.bottom:
            return Scaffold(
              appBar: appBar,
              body: body,
              bottomNavigationBar: NavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                destinations: destinations,
              ),
              floatingActionButton: floatingActionButton,
              floatingActionButtonLocation: floatingActionButtonLocation,
            );

          case M3NavigationType.rail:
            return Scaffold(
              appBar: appBar,
              body: Row(
                children: [
                  NavigationRail(
                    selectedIndex: selectedIndex,
                    onDestinationSelected: onDestinationSelected,
                    extended: M3ResponsiveNavigation.shouldExtendRail(
                      screenSize,
                    ),
                    destinations: destinations.map((dest) {
                      return NavigationRailDestination(
                        icon: dest.icon,
                        selectedIcon: dest.selectedIcon,
                        label: Text(dest.label),
                      );
                    }).toList(),
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(child: body),
                ],
              ),
              floatingActionButton: floatingActionButton,
              floatingActionButtonLocation: floatingActionButtonLocation,
            );

          case M3NavigationType.drawer:
            return Scaffold(
              appBar: appBar,
              body: Row(
                children: [
                  NavigationDrawer(
                    selectedIndex: selectedIndex,
                    onDestinationSelected: onDestinationSelected,
                    children: [
                      const M3Gap(M3SpacingToken.space12),
                      ...destinations.map((dest) {
                        return NavigationDrawerDestination(
                          icon: dest.icon,
                          selectedIcon: dest.selectedIcon,
                          label: Text(dest.label),
                        );
                      }),
                    ],
                  ),
                  Expanded(child: body),
                ],
              ),
              floatingActionButton: floatingActionButton,
              floatingActionButtonLocation: floatingActionButtonLocation,
            );
        }
      },
    );
  }
}
