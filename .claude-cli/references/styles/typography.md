# Material Design 3 - Typography

## Overview
Material Design 3 typography provides a clear, readable text hierarchy that balances usability, accessibility, and expression. The type scale includes 15 standard styles designed for optimal readability across different contexts.

## Current Implementation Status

### ✅ Implemented Features

#### Type Scale
- **Complete Type Scale** (`m3_type_scale.dart`)
  - 15 standard Material Design 3 text styles
  - Display: Large, Medium, Small (3 styles)
  - Headline: Large, Medium, Small (3 styles)
  - Title: Large, Medium, Small (3 styles)
  - Body: Large, Medium, Small (3 styles)
  - Label: Large, Medium, Small (3 styles)
  - Proper font sizes, weights, and letter spacing
  - Calculated line heights for optimal readability

### 🔄 Missing/Incomplete Features

#### Font Family System
- **Roboto Integration**: Default Material Design font family
- **Google Fonts Support**: Extended font family options
- **Custom Font Loading**: Brand-specific font integration
- **Font Fallbacks**: Proper fallback font stacks

#### Responsive Typography
- **Dynamic Type**: Support for system text size preferences
- **Viewport-Based Scaling**: Typography that adapts to screen size
- **Density-Aware Typography**: Text sizing based on visual density

#### Advanced Typography Features
- **Typography Themes**: Pre-built typography combinations
- **Localization Support**: Typography for different languages and scripts
- **Typography Utilities**: Helper functions for text styling

## Typography Scale Implementation

### Current Type Scale
Based on the existing implementation in `m3_type_scale.dart`:

```dart
abstract class M3TypeScale {
  // Display styles - for large, prominent text
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 64 / 57, // 1.12
  );
  
  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 52 / 45, // 1.16
  );
  
  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 44 / 36, // 1.22
  );
  
  // Headline styles - for high-emphasis text
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 40 / 32, // 1.25
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 36 / 28, // 1.29
  );
  
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 32 / 24, // 1.33
  );
  
  // Title styles - for medium-emphasis text
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 28 / 22, // 1.27
  );
  
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 24 / 16, // 1.5
  );
  
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 20 / 14, // 1.43
  );
  
  // Body styles - for reading and content
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 24 / 16, // 1.5
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 20 / 14, // 1.43
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 16 / 12, // 1.33
  );
  
  // Label styles - for UI elements and captions
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 20 / 14, // 1.43
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 16 / 12, // 1.33
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 16 / 11, // 1.45
  );
}
```

## Extended Typography System

### Font Family Implementation
```dart
abstract class M3FontFamilies {
  // Primary Material Design font
  static const String roboto = 'Roboto';
  
  // Alternative system fonts
  static const String systemSans = '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif';
  static const String systemMono = 'SFMono-Regular, Monaco, Consolas, "Liberation Mono", "Courier New", monospace';
  
  // Google Fonts integration
  static const String notoSans = 'Noto Sans';
  static const String openSans = 'Open Sans';
  static const String lato = 'Lato';
  
  // Font stacks with fallbacks
  static const List<String> primaryStack = [
    'Roboto',
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];
  
  static const List<String> monoStack = [
    'Roboto Mono',
    'SFMono-Regular',
    'Monaco',
    'Consolas',
    'Liberation Mono',
    'Courier New',
    'monospace',
  ];
}
```

### Enhanced Type Scale with Font Families
```dart
class M3EnhancedTypeScale {
  static TextStyle _baseStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required double letterSpacing,
    required double height,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? M3FontFamilies.roboto,
      fontFamilyFallback: M3FontFamilies.primaryStack,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
  
  // Display styles with font family
  static TextStyle get displayLarge => _baseStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 64 / 57,
  );
  
  // ... (other styles following the same pattern)
  
  // Monospace variant for code
  static TextStyle get codeLarge => _baseStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 24 / 16,
    fontFamily: 'Roboto Mono',
  );
}
```

## Responsive Typography

### Dynamic Type Support
```dart
class M3ResponsiveTypography {
  static TextStyle adaptiveTextStyle({
    required TextStyle baseStyle,
    required BuildContext context,
    double? minFontSize,
    double? maxFontSize,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final textScaleFactor = mediaQuery.textScaleFactor;
    final devicePixelRatio = mediaQuery.devicePixelRatio;
    
    // Calculate adaptive font size
    double adaptiveFontSize = baseStyle.fontSize! * textScaleFactor;
    
    // Apply constraints
    if (minFontSize != null) {
      adaptiveFontSize = math.max(adaptiveFontSize, minFontSize);
    }
    if (maxFontSize != null) {
      adaptiveFontSize = math.min(adaptiveFontSize, maxFontSize);
    }
    
    // Adjust line height for scaled text
    double? adaptiveHeight;
    if (baseStyle.height != null) {
      adaptiveHeight = baseStyle.height! * (baseStyle.fontSize! / adaptiveFontSize);
    }
    
    return baseStyle.copyWith(
      fontSize: adaptiveFontSize,
      height: adaptiveHeight,
    );
  }
  
  static TextStyle responsiveDisplay({
    required BuildContext context,
    TextStyle? mobileStyle,
    TextStyle? tabletStyle,
    TextStyle? desktopStyle,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth < 600) {
      return mobileStyle ?? M3TypeScale.displaySmall;
    } else if (screenWidth < 1200) {
      return tabletStyle ?? M3TypeScale.displayMedium;
    } else {
      return desktopStyle ?? M3TypeScale.displayLarge;
    }
  }
}
```

### Viewport-Based Typography
```dart
class M3ViewportTypography {
  static double viewportWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  
  static double viewportHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  
  // Fluid typography that scales with viewport
  static double fluidFontSize({
    required BuildContext context,
    required double minSize,
    required double maxSize,
    double minViewport = 320,
    double maxViewport = 1200,
  }) {
    final vw = viewportWidth(context);
    final clampedVw = vw.clamp(minViewport, maxViewport);
    final scale = (clampedVw - minViewport) / (maxViewport - minViewport);
    return minSize + (maxSize - minSize) * scale;
  }
  
  static TextStyle fluidTextStyle({
    required BuildContext context,
    required TextStyle baseStyle,
    required double minFontSize,
    required double maxFontSize,
  }) {
    final fluidSize = fluidFontSize(
      context: context,
      minSize: minFontSize,
      maxSize: maxFontSize,
    );
    
    return baseStyle.copyWith(fontSize: fluidSize);
  }
}
```

## Typography Themes

### Predefined Typography Themes
```dart
class M3TypographyThemes {
  // Default Material Design typography
  static TextTheme get material => TextTheme(
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
  );
  
  // Dense typography for information-heavy interfaces
  static TextTheme get dense => material.copyWith(
    headlineLarge: M3TypeScale.headlineMedium,
    headlineMedium: M3TypeScale.headlineSmall,
    titleLarge: M3TypeScale.titleMedium,
    titleMedium: M3TypeScale.titleSmall,
    bodyLarge: M3TypeScale.bodyMedium,
    bodyMedium: M3TypeScale.bodySmall,
  );
  
  // Comfortable typography for reading-focused interfaces
  static TextTheme get comfortable => material.copyWith(
    bodyLarge: M3TypeScale.bodyLarge.copyWith(height: 1.8),
    bodyMedium: M3TypeScale.bodyMedium.copyWith(height: 1.8),
    bodySmall: M3TypeScale.bodySmall.copyWith(height: 1.8),
  );
  
  // Brand typography example
  static TextTheme brand({
    required String fontFamily,
    Color? color,
  }) {
    return material.apply(
      fontFamily: fontFamily,
      color: color,
    );
  }
}
```

### Typography Builder
```dart
class M3TypographyBuilder {
  late TextTheme _textTheme;
  
  M3TypographyBuilder() {
    _textTheme = M3TypographyThemes.material;
  }
  
  M3TypographyBuilder withFontFamily(String fontFamily) {
    _textTheme = _textTheme.apply(fontFamily: fontFamily);
    return this;
  }
  
  M3TypographyBuilder withColor(Color color) {
    _textTheme = _textTheme.apply(color: color);
    return this;
  }
  
  M3TypographyBuilder withScale(double scale) {
    _textTheme = _textTheme.apply(fontSizeFactor: scale);
    return this;
  }
  
  M3TypographyBuilder withStyle(TextStyle Function(TextStyle) modifier) {
    _textTheme = _textTheme.copyWith(
      displayLarge: modifier(_textTheme.displayLarge!),
      displayMedium: modifier(_textTheme.displayMedium!),
      displaySmall: modifier(_textTheme.displaySmall!),
      // ... apply to all styles
    );
    return this;
  }
  
  TextTheme build() => _textTheme;
}
```

## Accessibility Features

### High Contrast Typography
```dart
class M3AccessibleTypography {
  static TextTheme highContrast(TextTheme base) {
    return base.copyWith(
      // Increase font weights for better contrast
      displayLarge: base.displayLarge?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      // ... apply to other styles
    );
  }
  
  static TextTheme dyslexiaFriendly(TextTheme base) {
    return base.copyWith(
      // Increase letter spacing and line height
      bodyLarge: base.bodyLarge?.copyWith(
        letterSpacing: 0.12,
        height: 1.8,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        letterSpacing: 0.12,
        height: 1.8,
      ),
      bodySmall: base.bodySmall?.copyWith(
        letterSpacing: 0.12,
        height: 1.8,
      ),
    );
  }
  
  static TextTheme largeText(TextTheme base, {double scaleFactor = 1.3}) {
    return base.apply(fontSizeFactor: scaleFactor);
  }
}
```

## Typography Utilities

### Text Measurement
```dart
class M3TypographyUtils {
  static Size measureText({
    required String text,
    required TextStyle style,
    required BuildContext context,
    int? maxLines,
    double? maxWidth,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: Directionality.of(context),
      maxLines: maxLines,
    );
    
    textPainter.layout(maxWidth: maxWidth ?? double.infinity);
    return textPainter.size;
  }
  
  static bool doesTextFit({
    required String text,
    required TextStyle style,
    required BuildContext context,
    required Size constraints,
    int? maxLines,
  }) {
    final size = measureText(
      text: text,
      style: style,
      context: context,
      maxLines: maxLines,
      maxWidth: constraints.width,
    );
    
    return size.width <= constraints.width && 
           size.height <= constraints.height;
  }
  
  static TextStyle scaleToFit({
    required String text,
    required TextStyle baseStyle,
    required BuildContext context,
    required Size constraints,
    double minScale = 0.5,
    double maxScale = 2.0,
  }) {
    double scale = 1.0;
    
    // Binary search for optimal scale
    double minS = minScale;
    double maxS = maxScale;
    
    while (maxS - minS > 0.01) {
      scale = (minS + maxS) / 2;
      final scaledStyle = baseStyle.copyWith(
        fontSize: baseStyle.fontSize! * scale,
      );
      
      if (doesTextFit(
        text: text,
        style: scaledStyle,
        context: context,
        constraints: constraints,
      )) {
        minS = scale;
      } else {
        maxS = scale;
      }
    }
    
    return baseStyle.copyWith(fontSize: baseStyle.fontSize! * scale);
  }
}
```

### Text Styling Helpers
```dart
extension M3TextStyleExtensions on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle withSpacing(double spacing) => copyWith(letterSpacing: spacing);
  TextStyle withHeight(double height) => copyWith(height: height);
  
  TextStyle scale(double factor) => copyWith(fontSize: fontSize! * factor);
  
  TextStyle responsive(BuildContext context) {
    return M3ResponsiveTypography.adaptiveTextStyle(
      baseStyle: this,
      context: context,
    );
  }
}
```

## Localization Support

### Multi-Script Typography
```dart
class M3LocalizedTypography {
  static TextTheme forLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'ja': // Japanese
        return M3TypographyThemes.material.apply(
          fontFamily: 'Noto Sans CJK JP',
        );
      case 'ko': // Korean
        return M3TypographyThemes.material.apply(
          fontFamily: 'Noto Sans CJK KR',
        );
      case 'zh': // Chinese
        return M3TypographyThemes.material.apply(
          fontFamily: 'Noto Sans CJK SC',
        );
      case 'ar': // Arabic
        return M3TypographyThemes.material.apply(
          fontFamily: 'Noto Sans Arabic',
        ).copyWith(
          // Adjust for RTL text
          bodyLarge: M3TypeScale.bodyLarge.copyWith(height: 1.8),
        );
      default:
        return M3TypographyThemes.material;
    }
  }
  
  static bool isRTL(Locale locale) {
    const rtlLanguages = ['ar', 'he', 'fa', 'ur'];
    return rtlLanguages.contains(locale.languageCode);
  }
}
```

## Integration with Flutter Theme

### Theme Integration
```dart
class M3TypographyTheme {
  static ThemeData buildTheme({
    required TextTheme textTheme,
    required ColorScheme colorScheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      
      // Apply typography to component themes
      appBarTheme: AppBarTheme(
        titleTextStyle: textTheme.titleLarge,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: textTheme.bodyLarge,
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
```

## Testing Typography

### Typography Tests
```dart
testWidgets('Typography scales correctly', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(textTheme: M3TypographyThemes.material),
      home: Builder(
        builder: (context) {
          return Text(
            'Test',
            style: M3TypeScale.displayLarge.responsive(context),
          );
        },
      ),
    ),
  );
  
  final textWidget = tester.widget<Text>(find.byType(Text));
  expect(textWidget.style?.fontSize, equals(57));
});
```

## Best Practices

1. **Hierarchy**: Use the type scale to create clear information hierarchy
2. **Consistency**: Apply typography systematically across the application
3. **Accessibility**: Support dynamic type and high contrast modes
4. **Performance**: Cache font assets and use appropriate font loading strategies
5. **Localization**: Consider typography needs for different languages and scripts

## Future Enhancements

1. **Variable Fonts**: Support for variable font technology
2. **Advanced Typography**: Optical sizing and grade adjustments
3. **Typography Animations**: Smooth transitions between text styles
4. **AI Typography**: Intelligent typography selection based on content
5. **Advanced Measurement**: More sophisticated text measurement tools

## References
- [Material Design Typography](https://m3.material.io/styles/typography/overview)
- [Material Design Type Scale](https://m3.material.io/styles/typography/type-scale-tokens)
- [Flutter Typography](https://docs.flutter.dev/cookbook/design/fonts)
- [Google Fonts](https://fonts.google.com/)