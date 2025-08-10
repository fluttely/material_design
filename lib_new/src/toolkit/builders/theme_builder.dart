/// Material 3 theme builder for creating Flutter ThemeData.
///
/// Reference: https://m3.material.io/styles/color/the-color-system
library;

import 'package:flutter/material.dart';
import '../../design/ref/ref.dart';
import '../../design/sys/sys.dart';
import '../../design/comp/comp.dart';

/// Builder for creating Material 3 theme data.
class M3ThemeBuilder {
  const M3ThemeBuilder._();

  /// Creates a light theme from a seed color.
  static ThemeData lightTheme({
    Color? seedColor,
    String? fontFamily,
    bool useMaterial3 = true,
  }) {
    final colorScheme = seedColor != null
        ? ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.light,
          )
        : _createLightColorScheme();

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: useMaterial3,
      fontFamily: fontFamily ?? M3TypeFamilies.googleSans,
      textTheme: _createTextTheme(colorScheme),
      elevatedButtonTheme: _createElevatedButtonTheme(colorScheme),
      filledButtonTheme: _createFilledButtonTheme(colorScheme),
      outlinedButtonTheme: _createOutlinedButtonTheme(colorScheme),
      textButtonTheme: _createTextButtonTheme(colorScheme),
      cardTheme: _createCardTheme(colorScheme),
      appBarTheme: _createAppBarTheme(colorScheme),
    );
  }

  /// Creates a dark theme from a seed color.
  static ThemeData darkTheme({
    Color? seedColor,
    String? fontFamily,
    bool useMaterial3 = true,
  }) {
    final colorScheme = seedColor != null
        ? ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.dark,
          )
        : _createDarkColorScheme();

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: useMaterial3,
      fontFamily: fontFamily ?? M3TypeFamilies.googleSans,
      textTheme: _createTextTheme(colorScheme),
      elevatedButtonTheme: _createElevatedButtonTheme(colorScheme),
      filledButtonTheme: _createFilledButtonTheme(colorScheme),
      outlinedButtonTheme: _createOutlinedButtonTheme(colorScheme),
      textButtonTheme: _createTextButtonTheme(colorScheme),
      cardTheme: _createCardTheme(colorScheme),
      appBarTheme: _createAppBarTheme(colorScheme),
    );
  }

  /// Creates the default light color scheme.
  static ColorScheme _createLightColorScheme() {
    final lightScheme = M3LightColorScheme.defaultScheme;
    
    return ColorScheme(
      brightness: Brightness.light,
      primary: lightScheme.primary,
      onPrimary: lightScheme.onPrimary,
      primaryContainer: lightScheme.primaryContainer,
      onPrimaryContainer: lightScheme.onPrimaryContainer,
      secondary: lightScheme.secondary,
      onSecondary: lightScheme.onSecondary,
      secondaryContainer: lightScheme.secondaryContainer,
      onSecondaryContainer: lightScheme.onSecondaryContainer,
      tertiary: lightScheme.tertiary,
      onTertiary: lightScheme.onTertiary,
      tertiaryContainer: lightScheme.tertiaryContainer,
      onTertiaryContainer: lightScheme.onTertiaryContainer,
      error: lightScheme.error,
      onError: lightScheme.onError,
      errorContainer: lightScheme.errorContainer,
      onErrorContainer: lightScheme.onErrorContainer,
      surface: lightScheme.surface,
      onSurface: lightScheme.onSurface,
      onSurfaceVariant: lightScheme.onSurfaceVariant,
      outline: lightScheme.outline,
      outlineVariant: lightScheme.outlineVariant,
      shadow: lightScheme.shadow,
      scrim: lightScheme.scrim,
      inverseSurface: lightScheme.inverseSurface,
      onInverseSurface: lightScheme.onInverseSurface,
      inversePrimary: lightScheme.inversePrimary,
      surfaceTint: lightScheme.surfaceTint,
    );
  }

  /// Creates a dark color scheme.
  static ColorScheme _createDarkColorScheme() {
    // For now, use Flutter's built-in dark scheme generation
    return ColorScheme.fromSeed(
      seedColor: M3TonalPalettes.primary.tone40,
      brightness: Brightness.dark,
    );
  }

  /// Creates the text theme based on M3 typography.
  static TextTheme _createTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: _createTextStyle(M3TypeScale.displayLarge, colorScheme.onSurface),
      displayMedium: _createTextStyle(M3TypeScale.displayMedium, colorScheme.onSurface),
      displaySmall: _createTextStyle(M3TypeScale.displaySmall, colorScheme.onSurface),
      headlineLarge: _createTextStyle(M3TypeScale.headlineLarge, colorScheme.onSurface),
      headlineMedium: _createTextStyle(M3TypeScale.headlineMedium, colorScheme.onSurface),
      headlineSmall: _createTextStyle(M3TypeScale.headlineSmall, colorScheme.onSurface),
      titleLarge: _createTextStyle(M3TypeScale.titleLarge, colorScheme.onSurface),
      titleMedium: _createTextStyle(M3TypeScale.titleMedium, colorScheme.onSurface),
      titleSmall: _createTextStyle(M3TypeScale.titleSmall, colorScheme.onSurface),
      bodyLarge: _createTextStyle(M3TypeScale.bodyLarge, colorScheme.onSurface),
      bodyMedium: _createTextStyle(M3TypeScale.bodyMedium, colorScheme.onSurface),
      bodySmall: _createTextStyle(M3TypeScale.bodySmall, colorScheme.onSurface),
      labelLarge: _createTextStyle(M3TypeScale.labelLarge, colorScheme.onSurface),
      labelMedium: _createTextStyle(M3TypeScale.labelMedium, colorScheme.onSurface),
      labelSmall: _createTextStyle(M3TypeScale.labelSmall, colorScheme.onSurface),
    );
  }

  /// Creates a text style from a type scale token.
  static TextStyle _createTextStyle(M3TypeScaleToken token, Color color) {
    return TextStyle(
      fontSize: token.fontSize,
      fontWeight: token.fontWeight,
      letterSpacing: token.letterSpacing,
      height: token.height,
      color: color,
    );
  }

  /// Creates elevated button theme.
  static ElevatedButtonThemeData _createElevatedButtonTheme(ColorScheme colorScheme) {
    final spec = M3ButtonSpecs.elevatedButton;
    
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: spec.paddingHorizontal,
            vertical: spec.paddingVertical,
          ),
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          Size(spec.minWidth, spec.containerHeight),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spec.containerShape),
          ),
        ),
      ),
    );
  }

  /// Creates filled button theme.
  static FilledButtonThemeData _createFilledButtonTheme(ColorScheme colorScheme) {
    final spec = M3ButtonSpecs.filledButton;
    
    return FilledButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: spec.paddingHorizontal,
            vertical: spec.paddingVertical,
          ),
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          Size(spec.minWidth, spec.containerHeight),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spec.containerShape),
          ),
        ),
      ),
    );
  }

  /// Creates outlined button theme.
  static OutlinedButtonThemeData _createOutlinedButtonTheme(ColorScheme colorScheme) {
    final spec = M3ButtonSpecs.outlinedButton;
    
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: spec.paddingHorizontal,
            vertical: spec.paddingVertical,
          ),
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          Size(spec.minWidth, spec.containerHeight),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spec.containerShape),
          ),
        ),
      ),
    );
  }

  /// Creates text button theme.
  static TextButtonThemeData _createTextButtonTheme(ColorScheme colorScheme) {
    final spec = M3ButtonSpecs.textButton;
    
    return TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: spec.paddingHorizontal,
            vertical: spec.paddingVertical,
          ),
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          Size(spec.minWidth, spec.containerHeight),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spec.containerShape),
          ),
        ),
      ),
    );
  }

  /// Creates card theme.
  static CardTheme _createCardTheme(ColorScheme colorScheme) {
    final spec = M3CardSpecs.elevatedCard;
    
    return CardTheme(
      elevation: spec.containerElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spec.containerShape),
      ),
    );
  }

  /// Creates app bar theme.
  static AppBarTheme _createAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      elevation: M3ElevationLevels.level0,
      scrolledUnderElevation: M3ElevationLevels.level2,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      surfaceTintColor: colorScheme.surfaceTint,
      shape: const RoundedRectangleBorder(),
    );
  }
}