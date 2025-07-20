import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_example/showcase_pages/motion_page.dart';
import 'package:material_design_example/showcase_pages/widgets/launch_url_text.dart';
import 'package:provider/provider.dart';

import 'color_picker.dart';
import 'showcase_pages/color_page.dart';
import 'showcase_pages/density_page.dart';
import 'showcase_pages/elevation_page.dart';
import 'showcase_pages/other_tokens_page.dart';
import 'showcase_pages/shape_page.dart';
import 'showcase_pages/spacing_page.dart';
import 'showcase_pages/typography_page.dart';
import 'theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const TokenShowcaseApp(),
    ),
  );
}

class TokenShowcaseApp extends StatelessWidget {
  const TokenShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Material Design 3',
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      home: const ShowcaseHomePage(),
    );
  }
}

class ShowcaseHomePage extends StatefulWidget {
  const ShowcaseHomePage({super.key});

  @override
  State<ShowcaseHomePage> createState() => _ShowcaseHomePageState();
}

class _ShowcaseHomePageState extends State<ShowcaseHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ColorPage(),
    const TypographyPage(),
    const ShapePage(),
    const ElevationPage(),
    const SpacingPage(),
    const MotionPage(),
    const DensityPage(),
    const OtherTokensPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        MediaQuery.of(context).size.width < M3Breakpoint.medium;

    if (isSmallScreen) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: _buildScrollableNavigationDrawer(context),
        body: Stack(
          children: [
            _pages[_selectedIndex],
            Positioned(
              top: M3Spacing.space8,
              left: M3Spacing.space16,
              child: IconButton(
                tooltip: 'Open navigation menu',
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: Icon(Icons.menu),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          _buildScrollableNavigationRail(context),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }

  List<NavigationRailDestination> _buildNavigationRailDestinations() {
    return const [
      NavigationRailDestination(
        icon: Icon(Icons.format_paint_outlined),
        selectedIcon: Icon(Icons.format_paint),
        label: Text('Color'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.text_fields_outlined),
        selectedIcon: Icon(Icons.text_fields),
        label: Text('Typography'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.rounded_corner_outlined),
        selectedIcon: Icon(Icons.rounded_corner),
        label: Text('Shape'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.copy_outlined),
        selectedIcon: Icon(Icons.copy),
        label: Text('Elevation'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.space_bar_outlined),
        selectedIcon: Icon(Icons.space_bar),
        label: Text('Spacing'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.animation_outlined),
        selectedIcon: Icon(Icons.animation),
        label: Text('Motion'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.density_medium_outlined),
        selectedIcon: Icon(Icons.density_medium),
        label: Text('Density'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.more_horiz_outlined),
        // icon: Icon(Icons.extension_outlined),
        // icon: Icon(Icons.widgets_outlined),
        // icon: Icon(Icons.layers_outlined),
        // icon: Icon(Icons.design_services_outlined),
        // icon: Icon(Icons.dashboard_customize_outlined),
        // icon: Icon(Icons.category_outlined),
        // icon: Icon(Icons.miscellaneous_services_outlined),
        // icon: Icon(Icons.grid_view_outlined),
        selectedIcon: Icon(Icons.more_horiz),
        label: Text('Others'),
      ),
    ];
  }

  Widget _buildScrollableNavigationDrawer(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return NavigationDrawer(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
          Navigator.of(context).pop();
        });
      },
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(
            M3Spacing.space28,
            M3Spacing.space16,
            M3Spacing.space16,
            M3Spacing.space12,
          ),
          child: LaunchURLText(
            label: 'M3 Tokens',
            m3Url: 'https://m3.material.io',
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.format_paint),
          label: Text('Color'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.text_fields_outlined),
          label: Text('Typography'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.rounded_corner_outlined),
          label: Text('Shape'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.copy_outlined),
          label: Text('Elevation'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.space_bar_outlined),
          label: Text('Spacing'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.animation),
          label: Text('Motion'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.density_medium),
          label: Text('Density'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.more_horiz_outlined),
          label: Text('Others'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(
            M3Spacing.space28,
            M3Spacing.space16,
            M3Spacing.space28,
            M3Spacing.space12,
          ),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: M3Spacing.space28),
          child: Text('Theme', style: Theme.of(context).textTheme.titleSmall),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: M3Spacing.space16),
          child: Row(
            children: [
              const Text('Dark Mode'),
              const Spacer(),
              Switch(
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (isDark) {
                  themeProvider.changeThemeMode(
                    isDark ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: M3Spacing.space16),
          child: Row(
            children: [
              const Text('Seed Color'),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.color_lens, color: themeProvider.seedColor),
                onPressed: () async {
                  final newColor = await showColorPickerDialog(
                    context,
                    themeProvider.seedColor,
                  );
                  if (newColor != null) {
                    themeProvider.changeSeedColor(newColor);
                  }
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: M3Spacing.space16),
          child: Row(
            children: [
              LaunchURLText(
                label: 'M3 Components',
                m3Url: 'https://flutterweb-wasm.web.app/',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScrollableNavigationRail(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: 80,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          LaunchURLText(
            label: 'M3',
            m3Url: 'https://m3.material.io/',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ..._buildNavigationRailDestinations().asMap().entries.map((
                    entry,
                  ) {
                    final index = entry.key;
                    final destination = entry.value;

                    return _buildNavigationRailItem(
                      destination: destination,
                      index: index,
                      isSelected: _selectedIndex == index,
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    );
                  }),
                  const Divider(
                    indent: M3Spacing.space8,
                    endIndent: M3Spacing.space8,
                  ),
                  const SizedBox(height: M3Spacing.space8),
                  Switch(
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (isDark) {
                      themeProvider.changeThemeMode(
                        isDark ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  ),
                  const Text('Dark Mode', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: M3Spacing.space16),
                  IconButton(
                    icon: Icon(
                      Icons.color_lens,
                      color: themeProvider.seedColor,
                    ),
                    onPressed: () async {
                      final newColor = await showColorPickerDialog(
                        context,
                        themeProvider.seedColor,
                      );
                      if (newColor != null) {
                        themeProvider.changeSeedColor(newColor);
                      }
                    },
                  ),
                  const Text('Seed Color', style: TextStyle(fontSize: 12)),
                  LaunchURLText(
                    label: 'Demo',
                    m3Url: 'https://flutterweb-wasm.web.app/',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationRailItem({
    required NavigationRailDestination destination,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 72,
        padding: const EdgeInsets.symmetric(vertical: M3Spacing.space4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.secondaryContainer
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                isSelected
                    ? (destination.selectedIcon as Icon).icon
                    : (destination.icon as Icon).icon,
                color: isSelected
                    ? colorScheme.onSecondaryContainer
                    : colorScheme.onSurfaceVariant,
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              (destination.label as Text).data!,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? colorScheme.onSurface
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
