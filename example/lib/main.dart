import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_picker.dart';
// New, separated showcase pages
import 'showcase_pages/color_page.dart';
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
    const OtherTokensPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: isSmallScreen
          ? AppBar(title: const Text('Material Tokens'))
          : null,
      drawer: isSmallScreen
          ? NavigationDrawer(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                  Navigator.of(context).pop();
                });
              },
              children: _buildNavigationDestinations(context),
            )
          : null,
      body: Row(
        children: [
          if (!isSmallScreen)
            NavigationDrawer(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: _buildNavigationDestinations(context),
            ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

List<Widget> _buildNavigationDestinations(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  return [
    const Padding(
      padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
      child: Text('Tokens'),
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
          const Text('Brightness'),
          const Spacer(),
          Switch(
            value: themeProvider.themeMode == ThemeMode.light,
            onChanged: (isOn) {
              themeProvider.changeThemeMode(
                isOn ? ThemeMode.light : ThemeMode.dark,
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
