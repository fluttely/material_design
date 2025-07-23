import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Page demonstrating adaptive design features.
class AdaptivePage extends StatefulWidget {
  const AdaptivePage({super.key});

  @override
  State<AdaptivePage> createState() => _AdaptivePageState();
}

class _AdaptivePageState extends State<AdaptivePage> {
  int _selectedIndex = 0;

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Design'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adaptive Design Examples',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: M3SpacingToken.space16.value),

            // Current window size class
            _buildSection(
              context,
              'Current Window Size',
              Card(
                child: Padding(
                  padding: EdgeInsets.all(M3SpacingToken.space16.value),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Window Size Class: ${_getWindowSizeClassName(context)}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: M3SpacingToken.space8.value),
                      Text(
                        'Screen width: ${MediaQuery.of(context).size.width.toInt()}dp',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Is compact: ${M3BreakpointToken.isCompact(context)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: M3SpacerToken.pane.value),

            // Responsive values example
            _buildSection(
              context,
              'Responsive Values',
              Card(
                child: Padding(
                  padding: EdgeInsets.all(M3SpacingToken.space16.value),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grid Columns',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: M3SpacingToken.space8.value),
                      Text(
                        'Current columns: ${M3Adaptive.responsiveValue<int>(
                          context: context,
                          compact: 1,
                          medium: 2,
                          expanded: 3,
                          large: 4,
                          extraLarge: 5,
                        )}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: M3SpacingToken.space16.value),
                      _buildResponsiveGrid(),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: M3SpacerToken.pane.value),

            // Adaptive layout example
            _buildSection(
              context,
              'Adaptive Layout',
              SizedBox(
                height: 200,
                child: M3Adaptive.responsiveLayout(
                  context: context,
                  compact: const _CompactLayoutDemo(),
                  medium: const _MediumLayoutDemo(),
                  expanded: const _ExpandedLayoutDemo(),
                ),
              ),
            ),

            SizedBox(height: M3SpacerToken.pane.value),

            // Adaptive navigation example
            _buildSection(
              context,
              'Adaptive Navigation Example',
              SizedBox(
                height: 300,
                child: Card(
                  child: M3AdaptiveScaffold(
                    destinations: _destinations,
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _destinations[_selectedIndex].icon is Icon
                                ? (_destinations[_selectedIndex].icon as Icon)
                                    .icon
                                : Icons.home,
                            size: 48,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(height: M3SpacingToken.space8.value),
                          Text(
                            _destinations[_selectedIndex].label,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: M3SpacerToken.pane.value),

            // Adaptive dialogs example
            _buildSection(
              context,
              'Adaptive Dialogs',
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _showAdaptiveDialog(context),
                    child: const Text('Show Adaptive Dialog'),
                  ),
                  SizedBox(height: M3SpacingToken.space8.value),
                  ElevatedButton(
                    onPressed: () => _showAdaptiveSheet(context),
                    child: const Text('Show Adaptive Sheet'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: M3SpacingToken.space12.value),
        content,
      ],
    );
  }

  Widget _buildResponsiveGrid() {
    final columns = M3Adaptive.responsiveValue<int>(
      context: context,
      compact: 1,
      medium: 2,
      expanded: 3,
      large: 4,
      extraLarge: 5,
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: M3SpacingToken.space8.value,
        mainAxisSpacing: M3SpacingToken.space8.value,
        childAspectRatio: 2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => Container(
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: M3ShapeToken.small.value,
        ),
        child: Center(
          child: Text(
            '${index + 1}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
      ),
    );
  }

  String _getWindowSizeClassName(BuildContext context) {
    final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
    switch (sizeClass) {
      case WindowSizeClass.compact:
        return 'Compact';
      case WindowSizeClass.medium:
        return 'Medium';
      case WindowSizeClass.expanded:
        return 'Expanded';
      case WindowSizeClass.large:
        return 'Large';
      case WindowSizeClass.extraLarge:
        return 'Extra Large';
    }
  }

  void _showAdaptiveDialog(BuildContext context) {
    M3Adaptive.showAdaptiveDialog(
      context: context,
      title: 'Adaptive Dialog',
      content: const Text(
        'This dialog adapts to the screen size. On mobile, it appears fullscreen. On larger screens, it appears as a modal dialog.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  void _showAdaptiveSheet(BuildContext context) {
    M3Adaptive.showAdaptiveSheet(
      context: context,
      title: 'Adaptive Sheet',
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Text(
          'This sheet adapts to the screen size. On mobile, it appears as a bottom sheet. On larger screens, it appears as a side sheet.',
        ),
      ),
    );
  }
}

// Demo layout widgets
class _CompactLayoutDemo extends StatelessWidget {
  const _CompactLayoutDemo();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: M3ShapeToken.medium.value,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone_android,
              size: 48,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            SizedBox(height: M3SpacingToken.space8.value),
            Text(
              'Compact Layout\n(Mobile Portrait)',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MediumLayoutDemo extends StatelessWidget {
  const _MediumLayoutDemo();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        shape: M3ShapeToken.medium.value,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.tablet_android,
              size: 48,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            SizedBox(height: M3SpacingToken.space8.value),
            Text(
              'Medium Layout\n(Tablet/Mobile Landscape)',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpandedLayoutDemo extends StatelessWidget {
  const _ExpandedLayoutDemo();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        shape: M3ShapeToken.medium.value,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.desktop_windows,
              size: 48,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
            SizedBox(height: M3SpacingToken.space8.value),
            Text(
              'Expanded Layout\n(Desktop)',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
