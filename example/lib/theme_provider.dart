import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Color _seedColor = const Color(0xFF6750A4);

  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;

  ThemeData get lightTheme => M3Theme.light(
        seedColor: _seedColor,
        visualDensity: VisualDensity.comfortable,
        textTheme: TextTheme(
          displayLarge: M3TypeScale.displayLarge,
          displayMedium: M3TypeScale.displayMedium,
          displaySmall: M3TypeScale.displaySmall,
          headlineLarge: M3TypeScale.headlineLarge,
          headlineMedium: M3TypeScale.headlineMedium,
          headlineSmall: M3TypeScale.headlineSmall,
          titleLarge: M3TypeScale.titleLarge,
          titleMedium: M3TypeScale.titleMedium,
          titleSmall: M3TypeScale.titleSmall,
          bodyLarge: M3TypeScale.bodyLarge,
          bodyMedium: M3TypeScale.bodyMedium,
          bodySmall: M3TypeScale.bodySmall,
          labelLarge: M3TypeScale.labelLarge,
          labelMedium: M3TypeScale.labelMedium,
          labelSmall: M3TypeScale.labelSmall,
        ),
      ).toThemeData();

  ThemeData get darkTheme => M3Theme.dark(
        seedColor: _seedColor,
        visualDensity: VisualDensity.comfortable,
        textTheme: TextTheme(
          displayLarge: M3TypeScale.displayLarge,
          displayMedium: M3TypeScale.displayMedium,
          displaySmall: M3TypeScale.displaySmall,
          headlineLarge: M3TypeScale.headlineLarge,
          headlineMedium: M3TypeScale.headlineMedium,
          headlineSmall: M3TypeScale.headlineSmall,
          titleLarge: M3TypeScale.titleLarge,
          titleMedium: M3TypeScale.titleMedium,
          titleSmall: M3TypeScale.titleSmall,
          bodyLarge: M3TypeScale.bodyLarge,
          bodyMedium: M3TypeScale.bodyMedium,
          bodySmall: M3TypeScale.bodySmall,
          labelLarge: M3TypeScale.labelLarge,
          labelMedium: M3TypeScale.labelMedium,
          labelSmall: M3TypeScale.labelSmall,
        ),
      ).toThemeData();

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
