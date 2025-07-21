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
        padding: const EdgeInsets.all(M3Spacing.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adaptive Design Examples',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: M3Spacing.space16),

            // Current window size class
            _buildSection(
              context,
              'Current Window Size',
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(M3Spacing.space16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Window Size Class: ${_getWindowSizeClassName(context)}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: M3Spacing.space8),
                      Text(
                        'Screen width: ${MediaQuery.of(context).size.width.toInt()}dp',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Is compact: ${M3Breakpoint.isCompact(context)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: M3Spacer.pane),

            // Responsive values example
            _buildSection(
              context,
              'Responsive Values',
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(M3Spacing.space16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grid Columns',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: M3Spacing.space8),
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
                      const SizedBox(height: M3Spacing.space16),
                      _buildResponsiveGrid(),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: M3Spacer.pane),

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

            const SizedBox(height: M3Spacer.pane),

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
                          const SizedBox(height: M3Spacing.space8),
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

            const SizedBox(height: M3Spacer.pane),

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
                  const SizedBox(height: M3Spacing.space8),
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
        const SizedBox(height: M3Spacing.space12),
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
        crossAxisSpacing: M3Spacing.space8,
        mainAxisSpacing: M3Spacing.space8,
        childAspectRatio: 2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(M3Radius.small),
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
    final sizeClass = M3Breakpoint.getWindowSizeClassFromContext(context);
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
      child: const Padding(
        padding: EdgeInsets.all(M3Spacing.space16),
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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(M3Radius.medium),
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
            const SizedBox(height: M3Spacing.space8),
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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(M3Radius.medium),
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
            const SizedBox(height: M3Spacing.space8),
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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(M3Radius.medium),
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
            const SizedBox(height: M3Spacing.space8),
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
