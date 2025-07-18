import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_example/showcase_pages/motion_page.dart';
import 'package:provider/provider.dart';

import 'color_picker.dart';
// New, separated showcase pages
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
      title: 'Material Design Tokens Showcase',
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

    // Layout para telas pequenas (mantém o NavigationDrawer)
    if (isSmallScreen) {
      return Scaffold(
        appBar: AppBar(title: const Text('Material 3 Tokens')),
        drawer: NavigationDrawer(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
              Navigator.of(context).pop();
            });
          },
          children: _buildNavigationDrawerChildren(context),
        ),
        body: _pages[_selectedIndex],
      );
    }

    // Layout para telas grandes com NavigationRail
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            leading: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Material 3 Tokens',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            destinations: _buildNavigationRailDestinations(),
            trailing: _buildNavigationRailTrailing(context),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }

  /// Constrói os destinos para o NavigationRail (telas grandes).
  List<NavigationRailDestination> _buildNavigationRailDestinations() {
    return const [
      NavigationRailDestination(
        icon: Icon(Icons.palette_outlined),
        selectedIcon: Icon(Icons.palette),
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
        icon: Icon(Icons.token_outlined),
        selectedIcon: Icon(Icons.token),
        label: Text('Others'),
      ),
    ];
  }

  /// Constrói os widgets do rodapé (trailing) para o NavigationRail (telas grandes).
  Widget _buildNavigationRailTrailing(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Divider(height: 20, indent: 8, endIndent: 8),
              const SizedBox(height: 10),
              Switch(
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (isDark) {
                  themeProvider.changeThemeMode(
                    isDark ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
              const Text('Dark Mode'),
              const SizedBox(height: 20),
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
              const Text('Seed Color'),
            ],
          ),
        ),
      ),
    );
  }

  /// Constrói a lista completa de widgets para o NavigationDrawer (telas pequenas).
  List<Widget> _buildNavigationDrawerChildren(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return [
      const Padding(
        padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
        child: Text('Material 3 Tokens'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.palette_outlined),
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
        icon: Icon(Icons.token_outlined),
        label: Text('Others'),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
        child: Divider(),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Text('Theme', style: Theme.of(context).textTheme.titleSmall),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
    ];
  }
}
