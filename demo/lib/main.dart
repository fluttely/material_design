import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/foundations/border_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/breakpoint_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/icon_size_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/opacity_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/spacing_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/visual_density_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/z_index_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';
import 'package:provider/provider.dart';

import 'color_picker.dart';
import 'showcase_pages/components/utils_page.dart';
import 'showcase_pages/foundations/accessibility_page.dart';
import 'showcase_pages/foundations/adaptive_page.dart';
import 'showcase_pages/styles/color_page.dart';
import 'showcase_pages/styles/elevation_page.dart';
import 'showcase_pages/styles/motion_page.dart';
import 'showcase_pages/styles/shape_page.dart';
import 'showcase_pages/styles/typography_page.dart';
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
    // Foundations
    // const DesignTokensPage(),
    const SpacingPage(),
    const VisualDensityPage(),
    const BreakpointTokensPage(),
    const ZIndexTokensPage(),
    const BorderTokensPage(),
    const IconSizeTokensPage(),
    const OpacityTokensPage(),
    const AccessibilityPage(),
    const AdaptivePage(),
    // Styles
    const ColorPage(),
    const TypographyPage(),
    const ElevationPage(),
    const ShapePage(),
    const MotionPage(),
    // Components
    // const ComponentsShowcasePage(),
    const UtilsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        MediaQuery.of(context).size.width < M3BreakpointToken.medium.value;

    if (isSmallScreen) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: _buildScrollableNavigationDrawer(context),
        body: Stack(
          children: [
            _pages[_selectedIndex],
            Positioned(
              top: M3SpacingToken.space8.value,
              left: M3SpacingToken.space16.value,
              child: IconButton(
                tooltip: 'Open navigation menu',
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: const Icon(Icons.menu),
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

  List<NavigationRailDestination> _buildFoundationNavigationRailDestinations() {
    return const [
      NavigationRailDestination(
        icon: Icon(Icons.straighten_outlined),
        selectedIcon: Icon(Icons.straighten),
        label: Text('Spacing'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.density_medium_outlined),
        selectedIcon: Icon(Icons.density_medium),
        label: Text('Density'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.aspect_ratio_outlined),
        selectedIcon: Icon(Icons.aspect_ratio),
        label: Text('Breakpoints'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.layers_outlined),
        selectedIcon: Icon(Icons.layers),
        label: Text('Z-Indexes'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.border_style_outlined),
        selectedIcon: Icon(Icons.border_style),
        label: Text('Borders'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.photo_size_select_small_outlined),
        selectedIcon: Icon(Icons.photo_size_select_small),
        label: Text('Icon Sizes'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.opacity_outlined),
        selectedIcon: Icon(Icons.opacity),
        label: Text('Opacities'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.accessibility_outlined),
        selectedIcon: Icon(Icons.accessibility),
        label: Text('A11y'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.devices_outlined),
        selectedIcon: Icon(Icons.devices),
        label: Text('Adaptive'),
      ),
    ];
  }

  List<NavigationRailDestination> _buildStylesNavigationRailDestinations() {
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
        icon: Icon(Icons.copy_outlined),
        selectedIcon: Icon(Icons.copy),
        label: Text('Elevation'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.rounded_corner_outlined),
        selectedIcon: Icon(Icons.rounded_corner),
        label: Text('Shape'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.animation_outlined),
        selectedIcon: Icon(Icons.animation),
        label: Text('Motion'),
      ),
      // NavigationRailDestination(
      //   icon: Icon(Icons.widgets_outlined),
      //   selectedIcon: Icon(Icons.widgets),
      //   label: Text('Components'),
      // ),
      NavigationRailDestination(
        icon: Icon(Icons.auto_awesome_outlined),
        selectedIcon: Icon(Icons.auto_awesome),
        label: Text('Utils'),
      ),
    ];
  }

  Widget _buildScrollableNavigationDrawer(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    final foundationDestinations = _buildFoundationNavigationRailDestinations();
    final styleDestinations = _buildStylesNavigationRailDestinations();

    return NavigationDrawer(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
          Navigator.of(context).pop();
        });
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            M3SpacingToken.space28.value,
            M3SpacingToken.space16.value,
            M3SpacingToken.space16.value,
            M3SpacingToken.space12.value,
          ),
          child: Text(
            'Material Design 3',
            style: textTheme.titleSmall,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: M3SpacingToken.space28.value),
          child: Divider(),
        ),

        // Foundations Section
        Padding(
          padding: EdgeInsets.fromLTRB(
            M3SpacingToken.space28.value,
            M3SpacingToken.space16.value,
            M3SpacingToken.space16.value,
            M3SpacingToken.space12.value,
          ),
          child: Text('Foundations', style: textTheme.titleSmall),
        ),
        ...foundationDestinations.map(
          (d) => NavigationDrawerDestination(
            icon: d.icon,
            label: d.label,
            selectedIcon: d.selectedIcon,
          ),
        ),

        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: M3SpacingToken.space28.value),
          child: Divider(),
        ),

        // Styles Section
        Padding(
          padding: EdgeInsets.fromLTRB(
            M3SpacingToken.space28.value,
            M3SpacingToken.space16.value,
            M3SpacingToken.space16.value,
            M3SpacingToken.space12.value,
          ),
          child: Text('Styles', style: textTheme.titleSmall),
        ),
        ...styleDestinations.map(
          (d) => NavigationDrawerDestination(
            icon: d.icon,
            label: d.label,
            selectedIcon: d.selectedIcon,
          ),
        ),

        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: M3SpacingToken.space28.value),
          child: Divider(),
        ),

        // Theme Controls
        Padding(
          padding: EdgeInsets.fromLTRB(
            M3SpacingToken.space28.value,
            M3SpacingToken.space16.value,
            M3SpacingToken.space16.value,
            M3SpacingToken.space12.value,
          ),
          child: Text('Theme', style: textTheme.titleSmall),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: M3SpacingToken.space16.value),
          child: Row(
            children: [
              const Text('Dark Mode'),
              const Spacer(),
              Switch(
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeProvider.changeThemeMode(
                      value ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: M3SpacingToken.space16.value),
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
        SizedBox(height: M3SpacingToken.space8.value),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LaunchURLText(
            label: 'Flutter M3 Demo',
            m3Url: 'https://flutterweb-wasm.web.app/',
          ),
        ),
      ],
    );
  }

  Widget _buildScrollableNavigationRail(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final foundationDestinations = _buildFoundationNavigationRailDestinations();
    final styleDestinations = _buildStylesNavigationRailDestinations();

    return Container(
      width: 80,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          SizedBox(height: M3SpacingToken.space8.value),
          const LaunchURLText(
            label: 'M3',
            m3Url: 'https://m3.material.io/',
          ),
          SizedBox(height: M3SpacingToken.space8.value),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Divider(
                    indent: M3SpacingToken.space8.value,
                    endIndent: M3SpacingToken.space8.value,
                  ),
                  const LaunchURLText(
                    label: 'Foundations',
                    fontSize: 12,
                    m3Url: 'https://m3.material.io/foundations',
                  ),
                  ...foundationDestinations.asMap().entries.map((entry) {
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
                  Divider(
                    indent: M3SpacingToken.space8.value,
                    endIndent: M3SpacingToken.space8.value,
                  ),
                  const LaunchURLText(
                    label: 'Styles',
                    fontSize: 12,
                    m3Url: 'https://m3.material.io/styles',
                  ),
                  ...styleDestinations.asMap().entries.map((entry) {
                    final index = entry.key + foundationDestinations.length;
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
                  Divider(
                    indent: M3SpacingToken.space8.value,
                    endIndent: M3SpacingToken.space8.value,
                  ),
                  SizedBox(height: M3SpacingToken.space8.value),
                  Switch(
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (isDark) {
                      themeProvider.changeThemeMode(
                        isDark ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  ),
                  const Text('Dark Mode', style: TextStyle(fontSize: 12)),
                  SizedBox(height: M3SpacingToken.space16.value),
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
                  SizedBox(height: M3SpacingToken.space16.value),
                  const LaunchURLText(
                    label: 'Demo',
                    fontSize: 12,
                    m3Url: 'https://flutterweb-wasm.web.app/',
                  ),
                  SizedBox(height: M3SpacingToken.space8.value),
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
        padding: EdgeInsets.symmetric(vertical: M3SpacingToken.space4.value),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 32,
              decoration: ShapeDecoration(
                // color: isSelected
                //     ? colorScheme.secondaryContainer
                //     : Colors.transparent,
                shape: M3ShapeToken.medium.value,
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
