import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase/showcase_destinations.dart';
import 'package:material_design_demo/showcase/showcase_drawer.dart';
import 'package:material_design_demo/showcase/showcase_mode.dart';
import 'package:material_design_demo/showcase/showcase_rail.dart';

/// The showcase shell: one selected destination, one mode, two navigation
/// presentations.
///
/// The switch between rail and drawer is the window size class, read through
/// [M3ScreenSize.of] rather than a hand-rolled `MediaQuery` width comparison —
/// the demo should reach for the package's own answer to the question it is
/// showcasing.
///
/// The switch between Visual and Code is [ShowcaseMode], and it lives here
/// rather than inside the pages: it applies to whichever destination is
/// selected, and it survives changing destination, so a reader who came for
/// the code stays in the code.
class ShowcaseShell extends StatefulWidget {
  const ShowcaseShell({super.key});

  @override
  State<ShowcaseShell> createState() => _ShowcaseShellState();
}

class _ShowcaseShellState extends State<ShowcaseShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  ShowcaseMode _mode = ShowcaseMode.visual;

  void _select(int index) => setState(() => _selectedIndex = index);

  void _selectMode(ShowcaseMode mode) => setState(() => _mode = mode);

  @override
  Widget build(BuildContext context) {
    final destination = showcaseDestinations[_selectedIndex];
    final page = switch (_mode) {
      ShowcaseMode.visual => destination.page,
      ShowcaseMode.code => destination.codePage,
    };
    final isCompact = M3ScreenSize.of(context) == M3ScreenSize.compact;

    if (!isCompact) {
      return Scaffold(
        body: Row(
          children: [
            ShowcaseRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _select,
              mode: _mode,
              onModeSelected: _selectMode,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: page),
          ],
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: ShowcaseDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          _select(index);
          Navigator.of(context).pop();
        },
        mode: _mode,
        onModeSelected: _selectMode,
      ),
      body: Stack(
        children: [
          page,
          Positioned(
            top: M3Spacings.s8,
            left: M3Spacings.s16,
            child: _MenuButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}

/// The floating button that opens the drawer on compact screens.
class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      tooltip: 'Open navigation menu',
      onPressed: onPressed,
      icon: const Icon(Icons.menu),
      style: IconButton.styleFrom(
        // The page scrolls under the button, so the container needs enough
        // opacity to stay a surface rather than a tint: one step above the
        // 50% backdrop token.
        backgroundColor: colorScheme.surface.withValues(
          alpha: M3Contract.opacity(0.8),
        ),
        foregroundColor: colorScheme.onSurface,
      ),
    );
  }
}
