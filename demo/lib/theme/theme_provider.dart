import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// The demo's theme state: brightness and seed colour, both switchable live.
///
/// Both themes are built the same way from the same seed, so the only variable
/// between them is [Brightness] — which is what makes the showcase pages a
/// fair comparison in either mode.
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Color _seedColor = const Color(0xFF6750A4);

  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;

  ThemeData get lightTheme => _themeFor(Brightness.light);
  ThemeData get darkTheme => _themeFor(Brightness.dark);

  ThemeData _themeFor(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: brightness,
    );

    return M3TextTheme.applyToTheme(
      ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        visualDensity: M3VisualDensity.comfortable,
        // Icons carry a contract too: 24dp at regular weight, with the optical
        // size tracking the rendered size. On a dark surface the grade drops to
        // -25 to cancel the light-on-dark bloom.
        //
        // The color role has to be spelled out: setting `iconTheme` replaces
        // ThemeData's default wholesale, and an IconThemeData without a color
        // leaves Icon on its black fallback — black icons in dark mode.
        iconTheme: M3IconStyle(
          grade: brightness == Brightness.dark
              ? M3IconGrades.onDark
              : M3IconGrades.normal,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

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
