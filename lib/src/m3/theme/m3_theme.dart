import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// A comprehensive Material Design 3 theme builder that integrates all tokens.
///
/// This class provides a complete theming solution that combines all the M3
/// design tokens (color, typography, shape, elevation, spacing, etc.) into
/// a cohesive theme system that follows Flutter's ThemeData conventions.
@immutable
class M3Theme {
  /// The color scheme for this theme.
  final ColorScheme colorScheme;

  /// The text theme for this theme.
  final TextTheme textTheme;

  /// Whether this is a dark theme.
  final bool isDark;

  /// Custom seed color for dynamic theming.
  final Color? seedColor;

  /// Visual density for the theme.
  final VisualDensity visualDensity;

  const M3Theme({
    required this.colorScheme,
    required this.textTheme,
    required this.isDark,
    this.seedColor,
    this.visualDensity = VisualDensity.standard,
  });

  /// Creates a light Material Design 3 theme.
  factory M3Theme.light({
    Color? seedColor,
    TextTheme? textTheme,
    VisualDensity visualDensity = VisualDensity.standard,
  }) {
    final colorScheme = seedColor != null
        ? ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.light,
          )
        : _defaultLightColorScheme;

    return M3Theme(
      colorScheme: colorScheme,
      textTheme: textTheme ?? _buildTextTheme(colorScheme),
      isDark: false,
      seedColor: seedColor,
      visualDensity: visualDensity,
    );
  }

  /// Creates a dark Material Design 3 theme.
  factory M3Theme.dark({
    Color? seedColor,
    TextTheme? textTheme,
    VisualDensity visualDensity = VisualDensity.standard,
  }) {
    final colorScheme = seedColor != null
        ? ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.dark,
          )
        : _defaultDarkColorScheme;

    return M3Theme(
      colorScheme: colorScheme,
      textTheme: textTheme ?? _buildTextTheme(colorScheme),
      isDark: true,
      seedColor: seedColor,
      visualDensity: visualDensity,
    );
  }

  /// Creates a high contrast variant of the theme.
  M3Theme toHighContrast() {
    return M3Theme(
      colorScheme: _createHighContrastColorScheme(colorScheme),
      textTheme: _createHighContrastTextTheme(textTheme),
      isDark: isDark,
      seedColor: seedColor,
      visualDensity: visualDensity,
    );
  }

  /// Converts this M3Theme to a Flutter ThemeData.
  ThemeData toThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      visualDensity: visualDensity,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: M3ComponentElevation.appBar.dp,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: M3TonalColor.calculateSurfaceColor(
          surface: colorScheme.surface,
          surfaceTint: colorScheme.surfaceTint,
          elevation: M3ComponentElevation.card.dp,
        ),
        elevation: M3ComponentElevation.card.dp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(M3Radius.medium),
        ),
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.surfaceTint,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: M3ComponentElevation.elevatedButton.dp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(M3Radius.large),
          ),
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: M3Spacing.space24,
            vertical: M3Spacing.space12,
          ),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(
            color: colorScheme.outline,
            width: M3Border.thin,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(M3Radius.large),
          ),
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: M3Spacing.space24,
            vertical: M3Spacing.space12,
          ),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(M3Radius.large),
          ),
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: M3Spacing.space12,
            vertical: M3Spacing.space12,
          ),
        ),
      ),

      // FAB Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        elevation: M3ComponentElevation.fab.dp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(M3Radius.large),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(M3Radius.extraSmall),
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: M3Border.thin,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(M3Radius.extraSmall),
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: M3Border.thin,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(M3Radius.extraSmall),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: M3Border.thick,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(M3Radius.extraSmall),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: M3Border.thick,
          ),
        ),
        labelStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        elevation: M3ComponentElevation.dialog.dp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(M3Radius.extraLarge),
        ),
        titleTextStyle: textTheme.headlineSmall?.copyWith(
          color: colorScheme.onSurface,
        ),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        elevation: M3ComponentElevation.bottomSheet.dp,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(M3Radius.large),
          ),
        ),
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
        elevation: M3ComponentElevation.snackbar.dp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(M3Radius.extraSmall),
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surface,
        deleteIconColor: colorScheme.onSurfaceVariant,
        disabledColor: colorScheme.onSurface.withValues(alpha: 0.12),
        selectedColor: colorScheme.secondaryContainer,
        secondarySelectedColor: colorScheme.secondaryContainer,
        padding: const EdgeInsets.symmetric(
          horizontal: M3Spacing.space8,
          vertical: M3Spacing.space4,
        ),
        labelStyle: textTheme.labelLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        secondaryLabelStyle: textTheme.labelLarge?.copyWith(
          color: colorScheme.onSecondaryContainer,
        ),
        brightness: isDark ? Brightness.dark : Brightness.light,
        elevation: M3Elevation.level0.dp,
        pressElevation: M3Elevation.level1.dp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(M3Radius.small),
        ),
      ),

      // Additional theme properties
      dividerColor: colorScheme.outlineVariant,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      shadowColor: colorScheme.shadow,

      // Page transition animations
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }

  // --- Private Helpers ---

  static ColorScheme get _defaultLightColorScheme {
    return const ColorScheme.light(
      primary: Color(0xFF6750A4),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFEADDFF),
      onPrimaryContainer: Color(0xFF21005D),
      secondary: Color(0xFF625B71),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFE8DEF8),
      onSecondaryContainer: Color(0xFF1D192B),
      tertiary: Color(0xFF7D5260),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFD8E4),
      onTertiaryContainer: Color(0xFF31111D),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xFFFFFBFE),
      onSurface: Color(0xFF1C1B1F),
      surfaceContainerHighest: Color(0xFFE7E0EC),
      onSurfaceVariant: Color(0xFF49454F),
      outline: Color(0xFF79747E),
      outlineVariant: Color(0xFFCAC4D0),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF313033),
      onInverseSurface: Color(0xFFF4EFF4),
      inversePrimary: Color(0xFFD0BCFF),
      surfaceTint: Color(0xFF6750A4),
    );
  }

  static ColorScheme get _defaultDarkColorScheme {
    return const ColorScheme.dark(
      primary: Color(0xFFD0BCFF),
      onPrimary: Color(0xFF381E72),
      primaryContainer: Color(0xFF4F378B),
      onPrimaryContainer: Color(0xFFEADDFF),
      secondary: Color(0xFFCCC2DC),
      onSecondary: Color(0xFF332D41),
      secondaryContainer: Color(0xFF4A4458),
      onSecondaryContainer: Color(0xFFE8DEF8),
      tertiary: Color(0xFFEFB8C8),
      onTertiary: Color(0xFF492532),
      tertiaryContainer: Color(0xFF633B48),
      onTertiaryContainer: Color(0xFFFFD8E4),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF1C1B1F),
      onSurface: Color(0xFFE6E1E5),
      surfaceContainerHighest: Color(0xFF49454F),
      onSurfaceVariant: Color(0xFFCAC4D0),
      outline: Color(0xFF938F99),
      outlineVariant: Color(0xFF49454F),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E1E5),
      onInverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFF6750A4),
      surfaceTint: Color(0xFFD0BCFF),
    );
  }

  static TextTheme _buildTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: M3TypeScale.displayLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      displayMedium: M3TypeScale.displayMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      displaySmall: M3TypeScale.displaySmall.copyWith(
        color: colorScheme.onSurface,
      ),
      headlineLarge: M3TypeScale.headlineLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      headlineMedium: M3TypeScale.headlineMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      headlineSmall: M3TypeScale.headlineSmall.copyWith(
        color: colorScheme.onSurface,
      ),
      titleLarge: M3TypeScale.titleLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      titleMedium: M3TypeScale.titleMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      titleSmall: M3TypeScale.titleSmall.copyWith(
        color: colorScheme.onSurface,
      ),
      bodyLarge: M3TypeScale.bodyLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      bodyMedium: M3TypeScale.bodyMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      bodySmall: M3TypeScale.bodySmall.copyWith(
        color: colorScheme.onSurface,
      ),
      labelLarge: M3TypeScale.labelLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      labelMedium: M3TypeScale.labelMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      labelSmall: M3TypeScale.labelSmall.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }

  static ColorScheme _createHighContrastColorScheme(ColorScheme base) {
    // Enhance contrast for accessibility
    return base.copyWith(
      primary: base.brightness == Brightness.light
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF),
      onPrimary: base.brightness == Brightness.light
          ? const Color(0xFFFFFFFF)
          : const Color(0xFF000000),
    );
  }

  static TextTheme _createHighContrastTextTheme(TextTheme base) {
    return base.apply(
      bodyColor: null, // Let color scheme handle colors
      displayColor: null,
    );
  }
}
