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
          displayLarge: M3TextStyleToken.displayLarge.value,
          displayMedium: M3TextStyleToken.displayMedium.value,
          displaySmall: M3TextStyleToken.displaySmall.value,
          headlineLarge: M3TextStyleToken.headlineLarge.value,
          headlineMedium: M3TextStyleToken.headlineMedium.value,
          headlineSmall: M3TextStyleToken.headlineSmall.value,
          titleLarge: M3TextStyleToken.titleLarge.value,
          titleMedium: M3TextStyleToken.titleMedium.value,
          titleSmall: M3TextStyleToken.titleSmall.value,
          bodyLarge: M3TextStyleToken.bodyLarge.value,
          bodyMedium: M3TextStyleToken.bodyMedium.value,
          bodySmall: M3TextStyleToken.bodySmall.value,
          labelLarge: M3TextStyleToken.labelLarge.value,
          labelMedium: M3TextStyleToken.labelMedium.value,
          labelSmall: M3TextStyleToken.labelSmall.value,
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
          displayLarge: M3TextStyleToken.displayLarge.value,
          displayMedium: M3TextStyleToken.displayMedium.value,
          displaySmall: M3TextStyleToken.displaySmall.value,
          headlineLarge: M3TextStyleToken.headlineLarge.value,
          headlineMedium: M3TextStyleToken.headlineMedium.value,
          headlineSmall: M3TextStyleToken.headlineSmall.value,
          titleLarge: M3TextStyleToken.titleLarge.value,
          titleMedium: M3TextStyleToken.titleMedium.value,
          titleSmall: M3TextStyleToken.titleSmall.value,
          bodyLarge: M3TextStyleToken.bodyLarge.value,
          bodyMedium: M3TextStyleToken.bodyMedium.value,
          bodySmall: M3TextStyleToken.bodySmall.value,
          labelLarge: M3TextStyleToken.labelLarge.value,
          labelMedium: M3TextStyleToken.labelMedium.value,
          labelSmall: M3TextStyleToken.labelSmall.value,
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
