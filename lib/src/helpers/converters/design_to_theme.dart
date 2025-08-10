/// Converter from M3 design specifications to Flutter ThemeData.
///
/// This converter bridges the gap between Material 3 design specifications
/// and practical Flutter theme implementation.
library;

import 'package:flutter/material.dart';
import '../../design/sys/sys.dart';
import '../../design/ref/ref.dart';

/// Converts Material 3 design specifications to Flutter ThemeData.
abstract class M3DesignToThemeConverter {
  /// Converts M3 color scheme to Flutter ColorScheme.
  static ColorScheme convertColorScheme(M3LightColorScheme m3ColorScheme) {
    return ColorScheme(
      brightness: Brightness.light,
      primary: m3ColorScheme.primary,
      onPrimary: m3ColorScheme.onPrimary,
      primaryContainer: m3ColorScheme.primaryContainer,
      onPrimaryContainer: m3ColorScheme.onPrimaryContainer,
      secondary: m3ColorScheme.secondary,
      onSecondary: m3ColorScheme.onSecondary,
      secondaryContainer: m3ColorScheme.secondaryContainer,
      onSecondaryContainer: m3ColorScheme.onSecondaryContainer,
      tertiary: m3ColorScheme.tertiary,
      onTertiary: m3ColorScheme.onTertiary,
      tertiaryContainer: m3ColorScheme.tertiaryContainer,
      onTertiaryContainer: m3ColorScheme.onTertiaryContainer,
      error: m3ColorScheme.error,
      onError: m3ColorScheme.onError,
      errorContainer: m3ColorScheme.errorContainer,
      onErrorContainer: m3ColorScheme.onErrorContainer,
      surface: m3ColorScheme.surface,
      onSurface: m3ColorScheme.onSurface,
      onSurfaceVariant: m3ColorScheme.onSurfaceVariant,
      outline: m3ColorScheme.outline,
      outlineVariant: m3ColorScheme.outlineVariant,
      shadow: m3ColorScheme.shadow,
      scrim: m3ColorScheme.scrim,
      inverseSurface: m3ColorScheme.inverseSurface,
      onInverseSurface: m3ColorScheme.onInverseSurface,
      inversePrimary: m3ColorScheme.inversePrimary,
      surfaceTint: m3ColorScheme.surfaceTint,
    );
  }

  /// Converts M3 type scale to Flutter TextTheme.
  static TextTheme convertTextTheme({
    required ColorScheme colorScheme,
    String? fontFamily,
  }) {
    return TextTheme(
      displayLarge: convertTextStyle(
        M3TypeScale.displayLarge,
        colorScheme.onSurface,
        fontFamily,
      ),
      displayMedium: convertTextStyle(
        M3TypeScale.displayMedium,
        colorScheme.onSurface,
        fontFamily,
      ),
      displaySmall: convertTextStyle(
        M3TypeScale.displaySmall,
        colorScheme.onSurface,
        fontFamily,
      ),
      headlineLarge: convertTextStyle(
        M3TypeScale.headlineLarge,
        colorScheme.onSurface,
        fontFamily,
      ),
      headlineMedium: convertTextStyle(
        M3TypeScale.headlineMedium,
        colorScheme.onSurface,
        fontFamily,
      ),
      headlineSmall: convertTextStyle(
        M3TypeScale.headlineSmall,
        colorScheme.onSurface,
        fontFamily,
      ),
      titleLarge: convertTextStyle(
        M3TypeScale.titleLarge,
        colorScheme.onSurface,
        fontFamily,
      ),
      titleMedium: convertTextStyle(
        M3TypeScale.titleMedium,
        colorScheme.onSurface,
        fontFamily,
      ),
      titleSmall: convertTextStyle(
        M3TypeScale.titleSmall,
        colorScheme.onSurface,
        fontFamily,
      ),
      bodyLarge: convertTextStyle(
        M3TypeScale.bodyLarge,
        colorScheme.onSurface,
        fontFamily,
      ),
      bodyMedium: convertTextStyle(
        M3TypeScale.bodyMedium,
        colorScheme.onSurface,
        fontFamily,
      ),
      bodySmall: convertTextStyle(
        M3TypeScale.bodySmall,
        colorScheme.onSurface,
        fontFamily,
      ),
      labelLarge: convertTextStyle(
        M3TypeScale.labelLarge,
        colorScheme.onSurface,
        fontFamily,
      ),
      labelMedium: convertTextStyle(
        M3TypeScale.labelMedium,
        colorScheme.onSurface,
        fontFamily,
      ),
      labelSmall: convertTextStyle(
        M3TypeScale.labelSmall,
        colorScheme.onSurface,
        fontFamily,
      ),
    );
  }

  /// Converts M3 type scale token to Flutter TextStyle.
  static TextStyle convertTextStyle(
    M3TypeScaleToken token,
    Color color, [
    String? fontFamily,
  ]) {
    return TextStyle(
      fontSize: token.fontSize,
      fontWeight: token.fontWeight,
      letterSpacing: token.letterSpacing,
      height: token.height,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// Converts M3 shape scale to Flutter BorderRadius.
  static BorderRadius convertShapeScale(double shapeValue) {
    return BorderRadius.circular(shapeValue);
  }

  /// Converts M3 elevation level to Flutter elevation value.
  static double convertElevation(double m3Elevation) {
    // M3 elevation values map directly to Flutter elevation
    return m3Elevation;
  }

  /// Converts M3 spacing value to Flutter EdgeInsets.
  static EdgeInsets convertSpacing(double spacing) {
    return EdgeInsets.all(spacing);
  }

  /// Converts M3 spacing values to Flutter EdgeInsets with specific directions.
  static EdgeInsets convertSpacingDirectional({
    double? top,
    double? right,
    double? bottom,
    double? left,
    double? horizontal,
    double? vertical,
    double? all,
  }) {
    if (all != null) {
      return EdgeInsets.all(all);
    } else if (horizontal != null || vertical != null) {
      return EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      );
    } else {
      return EdgeInsets.only(
        top: top ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
        left: left ?? 0,
      );
    }
  }

  /// Converts M3 tonal palette to List of Colors.
  static List<Color> convertTonalPalette(M3TonalPalette palette) {
    return [
      palette.tone0,
      palette.tone10,
      palette.tone20,
      palette.tone25,
      palette.tone30,
      palette.tone35,
      palette.tone40,
      palette.tone50,
      palette.tone60,
      palette.tone70,
      palette.tone80,
      palette.tone90,
      palette.tone95,
      palette.tone99,
      palette.tone100,
    ];
  }

  /// Creates a complete ThemeData from M3 specifications.
  static ThemeData createThemeFromSpecs({
    required M3LightColorScheme colorScheme,
    String? fontFamily,
    bool useMaterial3 = true,
  }) {
    final flutterColorScheme = convertColorScheme(colorScheme);
    final textTheme = convertTextTheme(
      colorScheme: flutterColorScheme,
      fontFamily: fontFamily,
    );

    return ThemeData(
      colorScheme: flutterColorScheme,
      textTheme: textTheme,
      fontFamily: fontFamily ?? M3TypeFamilies.googleSans,
      useMaterial3: useMaterial3,
      
      // Apply M3 component themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: M3ElevationLevels.level1,
          shape: RoundedRectangleBorder(
            borderRadius: convertShapeScale(M3ShapeScale.large),
          ),
        ),
      ),
      
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: convertShapeScale(M3ShapeScale.large),
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: convertShapeScale(M3ShapeScale.large),
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: convertShapeScale(M3ShapeScale.large),
          ),
        ),
      ),
      
      cardTheme: CardTheme(
        elevation: M3ElevationLevels.level1,
        shape: RoundedRectangleBorder(
          borderRadius: convertShapeScale(M3ShapeScale.medium),
        ),
      ),
      
      appBarTheme: AppBarTheme(
        elevation: M3ElevationLevels.level0,
        scrolledUnderElevation: M3ElevationLevels.level2,
        backgroundColor: flutterColorScheme.surface,
        foregroundColor: flutterColorScheme.onSurface,
        surfaceTintColor: flutterColorScheme.surfaceTint,
      ),
      
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: M3ElevationLevels.level3,
        backgroundColor: flutterColorScheme.primaryContainer,
        foregroundColor: flutterColorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: convertShapeScale(M3ShapeScale.large),
        ),
      ),
    );
  }
}