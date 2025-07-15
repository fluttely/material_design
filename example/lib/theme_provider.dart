import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// A provider class for managing the application's theme.
///
/// It allows changing the theme mode and the seed color that generates
/// the color schemes.
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Color _seedColor = const Color(0xFF6750A4); // Default Material blue

  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;

  ThemeData get lightTheme => ThemeData(
    colorScheme: MaterialColorScheme.create(
      seedColor: _seedColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  ThemeData get darkTheme => ThemeData(
    colorScheme: MaterialColorScheme.create(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );

  void changeThemeMode(ThemeMode newMode) {
    if (newMode == _themeMode) return;
    _themeMode = newMode;
    notifyListeners();
  }

  void changeSeedColor(Color newColor) {
    if (newColor == _seedColor) return;
    _seedColor = newColor;
    notifyListeners();
  }
}
