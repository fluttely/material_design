import 'package:flutter/material.dart';
import 'package:material_design_demo/showcase/showcase_shell.dart';
import 'package:material_design_demo/theme/theme_provider.dart';
import 'package:provider/provider.dart';

/// The live showcase of the `material_design` package: every M3 token family
/// on its own page, in the order the README and `example/lib/main.dart` use.
///
/// Navigation lives in `lib/showcase/`, and every page in
/// `lib/showcase_pages/`. The app itself is only the theme and the shell.
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const ShowcaseApp(),
    ),
  );
}

/// Wires the seed-driven light and dark themes to the shell.
class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'Material Design 3 Token Showcase',
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: theme.themeMode,
      debugShowCheckedModeBanner: false,
      home: const ShowcaseShell(),
    );
  }
}
