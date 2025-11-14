# Material Design 3 - Color System

## Overview
The Material Design 3 color system provides a foundation for expressing brand and creating accessible, harmonious color schemes. It's built on principles of accessibility, usability, and expression.

## Current Implementation Status

### ✅ Implemented Features

#### Tonal Color System
- **Surface Tinting** (`m3_tonal_color.dart`)
  - Elevation-based surface color calculations
  - Integration with Flutter's ElevationOverlay
  - Automatic tint application based on elevation

### 🔄 Missing/Incomplete Features

#### Core Color Roles
- **Primary Colors**: Main brand colors and variations
- **Secondary Colors**: Supporting brand colors
- **Tertiary Colors**: Accent and highlighting colors
- **Error Colors**: System error states
- **Neutral Colors**: Surface and outline colors
- **Neutral Variant Colors**: Lower emphasis surfaces

#### Dynamic Color
- **Material You Integration**: System-generated color schemes
- **Seed Color Generation**: Color schemes from source colors
- **Custom Color Extraction**: Colors from user images

#### Color Schemes
- **Light Theme**: Standard light color scheme
- **Dark Theme**: Standard dark color scheme
- **High Contrast**: Accessibility-focused schemes

## Color System Architecture

### Color Roles
Material Design 3 defines specific color roles that work together to create cohesive interfaces:

```dart
abstract class M3ColorRoles {
  // Primary colors
  static const Color primary = Color(0xFF6750A4);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFEADDFF);
  static const Color onPrimaryContainer = Color(0xFF21005D);
  
  // Secondary colors
  static const Color secondary = Color(0xFF625B71);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE8DEF8);
  static const Color onSecondaryContainer = Color(0xFF1D192B);
  
  // Tertiary colors
  static const Color tertiary = Color(0xFF7D5260);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFFD8E4);
  static const Color onTertiaryContainer = Color(0xFF31111D);
  
  // Error colors
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);
  
  // Surface colors
  static const Color surface = Color(0xFFFFFBFE);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color surfaceVariant = Color(0xFFE7E0EC);
  static const Color onSurfaceVariant = Color(0xFF49454F);
  
  // Outline colors
  static const Color outline = Color(0xFF79747E);
  static const Color outlineVariant = Color(0xFFCAC4D0);
  
  // Other surface colors
  static const Color inverseSurface = Color(0xFF313033);
  static const Color onInverseSurface = Color(0xFFF4EFF4);
  static const Color inversePrimary = Color(0xFFD0BCFF);
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);
  static const Color surfaceTint = primary;
}
```

### Tonal Palettes
Material Design 3 uses tonal palettes to generate harmonious color variations:

```dart
class M3TonalPalette {
  final Color _keyColor;
  
  const M3TonalPalette(this._keyColor);
  
  // Tonal variations (0-100, where 0 is black and 100 is white)
  Color get tone0 => Color(0xFF000000);   // Black
  Color get tone10 => _generateTone(10);
  Color get tone20 => _generateTone(20);
  Color get tone30 => _generateTone(30);
  Color get tone40 => _generateTone(40);
  Color get tone50 => _generateTone(50);
  Color get tone60 => _generateTone(60);
  Color get tone70 => _generateTone(70);
  Color get tone80 => _generateTone(80);
  Color get tone90 => _generateTone(90);
  Color get tone95 => _generateTone(95);
  Color get tone99 => _generateTone(99);
  Color get tone100 => Color(0xFFFFFFFF); // White
  
  Color _generateTone(int tone) {
    // Implementation would use HCT color space
    // to generate tonal variations
    // This is a simplified version
    final hsl = HSLColor.fromColor(_keyColor);
    final adjustedLightness = tone / 100.0;
    return hsl.withLightness(adjustedLightness).toColor();
  }
}
```

### Color Schemes
Complete color schemes for light and dark themes:

```dart
class M3ColorScheme {
  final Brightness brightness;
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;
  final Color surfaceTint;
  
  const M3ColorScheme({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.surfaceTint,
  });
  
  // Light theme factory
  factory M3ColorScheme.light({Color? seedColor}) {
    final seed = seedColor ?? M3ColorRoles.primary;
    return M3ColorScheme(
      brightness: Brightness.light,
      primary: seed,
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFEADDFF),
      onPrimaryContainer: Color(0xFF21005D),
      // ... other colors
      surface: Color(0xFFFFFBFE),
      onSurface: Color(0xFF1C1B1F),
      surfaceTint: seed,
    );
  }
  
  // Dark theme factory
  factory M3ColorScheme.dark({Color? seedColor}) {
    final seed = seedColor ?? M3ColorRoles.primary;
    return M3ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFD0BCFF),
      onPrimary: Color(0xFF381E72),
      primaryContainer: Color(0xFF4F378B),
      onPrimaryContainer: Color(0xFFEADDFF),
      // ... other colors
      surface: Color(0xFF1C1B1F),
      onSurface: Color(0xFFE6E1E5),
      surfaceTint: Color(0xFFD0BCFF),
    );
  }
  
  // Convert to Flutter ColorScheme
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: onInverseSurface,
      inversePrimary: inversePrimary,
      surfaceTint: surfaceTint,
    );
  }
}
```

## Dynamic Color Implementation

### Material You Integration
```dart
class M3DynamicColor {
  static Future<M3ColorScheme?> extractFromWallpaper() async {
    // This would integrate with platform-specific APIs
    // to extract colors from user wallpaper
    try {
      // Platform channel implementation
      // final colors = await platform.invokeMethod('extractColors');
      // return M3ColorScheme.fromSeedColor(colors['primary']);
      return null; // Placeholder
    } catch (e) {
      return null;
    }
  }
  
  static M3ColorScheme fromSeedColor(Color seedColor) {
    // Generate full color scheme from seed color
    // This would use the HCT color space algorithm
    final primaryPalette = M3TonalPalette(seedColor);
    
    return M3ColorScheme.light(seedColor: seedColor);
  }
  
  static M3ColorScheme fromImage(ImageProvider image) {
    // Extract dominant colors from image
    // This would use quantization algorithms
    // Return generated color scheme
    return M3ColorScheme.light();
  }
}
```

### Custom Color Generation
```dart
class M3ColorGeneration {
  static List<Color> generateHarmoniousColors(Color base) {
    final baseHsl = HSLColor.fromColor(base);
    
    return [
      // Analogous colors
      baseHsl.withHue((baseHsl.hue + 30) % 360).toColor(),
      baseHsl.withHue((baseHsl.hue - 30) % 360).toColor(),
      
      // Complementary color
      baseHsl.withHue((baseHsl.hue + 180) % 360).toColor(),
      
      // Triadic colors
      baseHsl.withHue((baseHsl.hue + 120) % 360).toColor(),
      baseHsl.withHue((baseHsl.hue + 240) % 360).toColor(),
    ];
  }
  
  static Color adjustForAccessibility(Color color, Color background) {
    // Adjust color to meet contrast requirements
    final colorLuminance = color.computeLuminance();
    final backgroundLuminance = background.computeLuminance();
    
    double contrast = (max(colorLuminance, backgroundLuminance) + 0.05) / 
                     (min(colorLuminance, backgroundLuminance) + 0.05);
    
    if (contrast < 4.5) {
      // Adjust color to meet minimum contrast
      final hsl = HSLColor.fromColor(color);
      final adjustedLightness = backgroundLuminance > 0.5 ? 0.2 : 0.8;
      return hsl.withLightness(adjustedLightness).toColor();
    }
    
    return color;
  }
}
```

## State Colors

### Interactive States
```dart
abstract class M3StateColors {
  // Hover states
  static Color hover(Color baseColor) => 
      Color.alphaBlend(
        Color(0x14000000), // 8% black overlay
        baseColor,
      );
  
  // Pressed states
  static Color pressed(Color baseColor) => 
      Color.alphaBlend(
        Color(0x1F000000), // 12% black overlay
        baseColor,
      );
  
  // Focus states
  static Color focused(Color baseColor) => 
      Color.alphaBlend(
        Color(0x1F000000), // 12% black overlay
        baseColor,
      );
  
  // Disabled states
  static Color disabled(Color baseColor) => 
      baseColor.withOpacity(0.38);
  
  // Drag states
  static Color dragged(Color baseColor) => 
      Color.alphaBlend(
        Color(0x29000000), // 16% black overlay
        baseColor,
      );
}
```

### Surface Variations
```dart
class M3SurfaceColors {
  static Color surface0(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }
  
  static Color surface1(BuildContext context) {
    return M3TonalColor.fromElevation(context, 1);
  }
  
  static Color surface2(BuildContext context) {
    return M3TonalColor.fromElevation(context, 3);
  }
  
  static Color surface3(BuildContext context) {
    return M3TonalColor.fromElevation(context, 6);
  }
  
  static Color surface4(BuildContext context) {
    return M3TonalColor.fromElevation(context, 8);
  }
  
  static Color surface5(BuildContext context) {
    return M3TonalColor.fromElevation(context, 12);
  }
}
```

## Color Utilities

### Color Manipulation
```dart
class M3ColorUtils {
  static Color blendColors(Color color1, Color color2, double ratio) {
    return Color.lerp(color1, color2, ratio) ?? color1;
  }
  
  static Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0)
    ).toColor();
  }
  
  static Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0)
    ).toColor();
  }
  
  static Color saturate(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withSaturation(
      (hsl.saturation + amount).clamp(0.0, 1.0)
    ).toColor();
  }
  
  static Color desaturate(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withSaturation(
      (hsl.saturation - amount).clamp(0.0, 1.0)
    ).toColor();
  }
}
```

### Contrast Checking
```dart
class M3ContrastUtils {
  static double calculateContrast(Color color1, Color color2) {
    final luminance1 = color1.computeLuminance();
    final luminance2 = color2.computeLuminance();
    
    final lighter = max(luminance1, luminance2);
    final darker = min(luminance1, luminance2);
    
    return (lighter + 0.05) / (darker + 0.05);
  }
  
  static bool meetsWCAGAA(Color foreground, Color background) {
    return calculateContrast(foreground, background) >= 4.5;
  }
  
  static bool meetsWCAGAAA(Color foreground, Color background) {
    return calculateContrast(foreground, background) >= 7.0;
  }
  
  static bool meetsLargeTextAA(Color foreground, Color background) {
    return calculateContrast(foreground, background) >= 3.0;
  }
}
```

## Theme Integration

### Color Scheme Builder
```dart
class M3ThemeBuilder {
  static ThemeData buildTheme({
    required M3ColorScheme colorScheme,
    TextTheme? textTheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme.toColorScheme(),
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      // ... other component themes
    );
  }
  
  static ThemeData buildDynamicTheme({
    Color? seedColor,
    Brightness? brightness,
  }) {
    final scheme = brightness == Brightness.dark 
        ? M3ColorScheme.dark(seedColor: seedColor)
        : M3ColorScheme.light(seedColor: seedColor);
        
    return buildTheme(colorScheme: scheme);
  }
}
```

## Testing Colors

### Color Testing Utilities
```dart
testWidgets('Color scheme meets accessibility standards', (tester) async {
  final colorScheme = M3ColorScheme.light();
  
  // Test primary color contrast
  expect(
    M3ContrastUtils.meetsWCAGAA(
      colorScheme.onPrimary, 
      colorScheme.primary
    ),
    isTrue,
  );
  
  // Test surface color contrast
  expect(
    M3ContrastUtils.meetsWCAGAA(
      colorScheme.onSurface, 
      colorScheme.surface
    ),
    isTrue,
  );
});
```

## Best Practices

1. **Accessibility First**: Always check color contrast ratios
2. **Semantic Usage**: Use color roles consistently across the app
3. **Brand Integration**: Customize seed colors to match brand
4. **Dynamic Support**: Implement Material You where available
5. **Testing**: Test color schemes in different lighting conditions

## Future Enhancements

1. **Advanced Color Harmonies**: Sophisticated color relationship algorithms
2. **AI Color Generation**: Machine learning-based color scheme generation
3. **Real-time Preview**: Live color scheme editing and preview
4. **Color Blindness Simulation**: Tools for testing color accessibility
5. **Platform Integration**: Deeper integration with system color APIs

## References
- [Material Design Color System](https://m3.material.io/styles/color/system)
- [Material Design Color Roles](https://m3.material.io/styles/color/roles)
- [Material You Dynamic Color](https://m3.material.io/styles/color/dynamic-color)
- [WCAG Color Contrast](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)