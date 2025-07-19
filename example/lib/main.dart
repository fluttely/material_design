import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_example/showcase_pages/motion_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

    if (isSmallScreen) {
      return Scaffold(
        appBar: AppBar(title: const Text('Material Design 3')),
        drawer: _buildScrollableNavigationDrawer(context),
        body: _pages[_selectedIndex],
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
        icon: Icon(Icons.token_outlined),
        selectedIcon: Icon(Icons.token),
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
          child: Text('M3 Tokens'),
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
          icon: Icon(Icons.token_outlined),
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
      ],
    );
  }

  Widget _buildScrollableNavigationRail(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final m3Url = 'https://m3.material.io/';
    return Container(
      width: 80,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Tooltip(
            // 1. O texto que aparecerá no tooltip
            message: m3Url,
            child: InkWell(
              // 2. A função que será chamada ao clicar
              onTap: () async {
                await launchUrl(
                  Uri.parse(m3Url),
                  // Este parâmetro garante que o link abra em uma nova aba no navegador
                  webOnlyWindowName: '_blank',
                );
              },
              child: Container(
                height: 56,
                alignment: Alignment.center,
                // O seu widget original permanece aqui
                child: Text(
                  'M3',
                  // Opcional: Adicionar um estilo para parecer um link
                  style: M3TypeScale.titleMedium.copyWith(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
              ),
            ),
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

                  const SizedBox(height: M3Spacing.space16),

                  const Divider(height: 20, indent: 8, endIndent: 8),
                  const SizedBox(height: M3Spacing.space12),

                  Switch(
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (isDark) {
                      themeProvider.changeThemeMode(
                        isDark ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  ),
                  const Text('Dark Mode', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: M3Spacing.space20),

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
                  const SizedBox(height: M3Spacing.space16),
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
