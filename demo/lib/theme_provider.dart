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
        visualDensity: VisualDensity.comfortable,
        textTheme: TextTheme(
          displayLarge: M3TypeScaleToken.displayLarge.value,
          displayMedium: M3TypeScaleToken.displayMedium.value,
          displaySmall: M3TypeScaleToken.displaySmall.value,
          headlineLarge: M3TypeScaleToken.headlineLarge.value,
          headlineMedium: M3TypeScaleToken.headlineMedium.value,
          headlineSmall: M3TypeScaleToken.headlineSmall.value,
          titleLarge: M3TypeScaleToken.titleLarge.value,
          titleMedium: M3TypeScaleToken.titleMedium.value,
          titleSmall: M3TypeScaleToken.titleSmall.value,
          bodyLarge: M3TypeScaleToken.bodyLarge.value,
          bodyMedium: M3TypeScaleToken.bodyMedium.value,
          bodySmall: M3TypeScaleToken.bodySmall.value,
          labelLarge: M3TypeScaleToken.labelLarge.value,
          labelMedium: M3TypeScaleToken.labelMedium.value,
          labelSmall: M3TypeScaleToken.labelSmall.value,
        ),
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        ),
        visualDensity: VisualDensity.comfortable,
        textTheme: TextTheme(
          displayLarge: M3TypeScaleToken.displayLarge.value,
          displayMedium: M3TypeScaleToken.displayMedium.value,
          displaySmall: M3TypeScaleToken.displaySmall.value,
          headlineLarge: M3TypeScaleToken.headlineLarge.value,
          headlineMedium: M3TypeScaleToken.headlineMedium.value,
          headlineSmall: M3TypeScaleToken.headlineSmall.value,
          titleLarge: M3TypeScaleToken.titleLarge.value,
          titleMedium: M3TypeScaleToken.titleMedium.value,
          titleSmall: M3TypeScaleToken.titleSmall.value,
          bodyLarge: M3TypeScaleToken.bodyLarge.value,
          bodyMedium: M3TypeScaleToken.bodyMedium.value,
          bodySmall: M3TypeScaleToken.bodySmall.value,
          labelLarge: M3TypeScaleToken.labelLarge.value,
          labelMedium: M3TypeScaleToken.labelMedium.value,
          labelSmall: M3TypeScaleToken.labelSmall.value,
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
