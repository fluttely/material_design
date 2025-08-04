import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Color _seedColor = const Color(0xFF6750A4);

  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.light,
        ),
        visualDensity: M3VisualDensityToken.comfortable.value,
        textTheme: TextTheme(
          displayLarge: M3TextStyle.displayLarge,
          displayMedium: M3TextStyle.displayMedium,
          displaySmall: M3TextStyle.displaySmall,
          headlineLarge: M3TextStyle.headlineLarge,
          headlineMedium: M3TextStyle.headlineMedium,
          headlineSmall: M3TextStyle.headlineSmall,
          titleLarge: M3TextStyle.titleLarge,
          titleMedium: M3TextStyle.titleMedium,
          titleSmall: M3TextStyle.titleSmall,
          bodyLarge: M3TextStyle.bodyLarge,
          bodyMedium: M3TextStyle.bodyMedium,
          bodySmall: M3TextStyle.bodySmall,
          labelLarge: M3TextStyle.labelLarge,
          labelMedium: M3TextStyle.labelMedium,
          labelSmall: M3TextStyle.labelSmall,
        ),
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        ),
        visualDensity: M3VisualDensityToken.comfortable.value,
        textTheme: TextTheme(
          displayLarge: M3TextStyle.displayLarge,
          displayMedium: M3TextStyle.displayMedium,
          displaySmall: M3TextStyle.displaySmall,
          headlineLarge: M3TextStyle.headlineLarge,
          headlineMedium: M3TextStyle.headlineMedium,
          headlineSmall: M3TextStyle.headlineSmall,
          titleLarge: M3TextStyle.titleLarge,
          titleMedium: M3TextStyle.titleMedium,
          titleSmall: M3TextStyle.titleSmall,
          bodyLarge: M3TextStyle.bodyLarge,
          bodyMedium: M3TextStyle.bodyMedium,
          bodySmall: M3TextStyle.bodySmall,
          labelLarge: M3TextStyle.labelLarge,
          labelMedium: M3TextStyle.labelMedium,
          labelSmall: M3TextStyle.labelSmall,
        ),
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
