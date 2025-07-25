# Material Design 3 - Design Tokens

## Overview
Design tokens are the visual design atoms of the design system — specifically, they are named entities that store visual design attributes. We use them in place of hard-coded values (such as hex values for color or pixel values for spacing) in order to maintain a scalable and consistent visual system for UI development.

## Current Implementation Status

### ✅ Implemented Tokens

#### Animation Tokens
- **Motion Duration** (`m3_motion_duration.dart`)
  - Standard durations for Material Design animations
  - Supports emphasized, standard, and short durations

- **Motion Easing** (`m3_motion_easing.dart`)
  - Cubic bezier curves for Material Design animations
  - Provides standard, emphasized, and decelerated easing curves

#### Color Tokens
- **Tonal Color** (`m3_tonal_color.dart`)
  - Surface color calculations with elevation-based tint
  - Integrates with Flutter's ElevationOverlay system

#### Geometry Tokens
- **Breakpoints** (`m3_breakpoint.dart`)
  - Responsive design breakpoints for different screen sizes
  
- **Elevation** (`m3_elevation.dart`)
  - Standardized elevation levels for Material Design components
  
- **Icon Size** (`m3_icon_size.dart`)
  - Consistent icon sizing across the design system
  
- **Radius** (`m3_radius.dart`)
  - Border radius values for rounded corners
  
- **Shape** (`m3_shape.dart`)
  - Shape definitions and utilities
  
- **Spacing** (`m3_spacing.dart`)
  - Consistent spacing units for layouts
  
- **Visual Density** (`m3_visual_density.dart`)
  - Adaptive density for different platforms and contexts

#### Painting Tokens
- **Border** (`m3_border.dart`)
  - Border styles and properties
  
- **Shadow** (`m3_shadow.dart`)
  - Shadow definitions for elevation
  
- **State Layer Opacity** (`m3_state_layer_opacity.dart`)
  - Opacity values for interactive states (hover, pressed, etc.)
  
- **Z-Index** (`m3_z_index.dart`)
  - Layering system for UI elements

#### Typography Tokens
- **Type Scale** (`m3_type_scale.dart`)
  - Complete Material Design 3 typography scale
  - 15 standard text styles (Display, Headline, Title, Body, Label)
  - Proper font sizes, weights, and letter spacing

### 🔄 Missing/Incomplete Tokens

#### Color System Extensions
- **Color Schemes**: Full color palette definitions beyond tonal colors
- **Color Roles**: Semantic color roles (primary, secondary, tertiary, etc.)
- **Dynamic Color**: Support for Material You dynamic theming
- **Custom Color**: User-defined color integration

#### Typography Extensions
- **Font Families**: Roboto and other Material Design fonts
- **Font Weights**: Extended weight scale beyond current implementation
- **Responsive Typography**: Adaptive text sizes for different screen densities

#### State Tokens
- **Component States**: Hover, pressed, focused, disabled states
- **Interaction States**: Ripple effects and state animations

#### Layout Tokens
- **Grid System**: Material Design grid specifications
- **Container Tokens**: Standard container sizes and properties

## Design Token Categories

### Primitive Tokens
Base values that define the core visual properties:
- Colors (hex values, opacity)
- Typography (font families, sizes, weights)
- Spacing (base units, multipliers)
- Borders (widths, styles)
- Shadows (blur, spread, offsets)

### Semantic Tokens
Tokens that represent specific UI purposes:
- Primary colors
- Surface colors
- Text colors
- Interactive colors
- Status colors (success, warning, error)

### Component Tokens
Tokens specific to individual components:
- Button colors and spacing
- Card elevation and radius
- Input field borders and padding

## Implementation Guidelines

### Token Naming Convention
Follow the pattern: `category_element_modifier_state`
- `m3_color_primary_container`
- `m3_typography_headline_large`
- `m3_spacing_padding_medium`

### Token Structure
```dart
abstract class M3Tokens {
  // Color tokens
  static const Color colorPrimary = Color(0xFF6750A4);
  
  // Typography tokens
  static const TextStyle typographyDisplayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
  );
  
  // Spacing tokens
  static const double spacingXSmall = 4.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
}
```

### Usage in Components
```dart
Container(
  padding: EdgeInsets.all(M3Tokens.spacingMedium),
  decoration: BoxDecoration(
    color: M3Tokens.colorSurface,
    borderRadius: BorderRadius.circular(M3Tokens.radiusMedium),
    boxShadow: M3Tokens.elevationLevel2,
  ),
  child: Text(
    'Content',
    style: M3Tokens.typographyBodyLarge,
  ),
)
```

## Integration with Flutter

### ThemeData Integration
```dart
ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: M3Tokens.colorPrimary,
  ),
  textTheme: TextTheme(
    displayLarge: M3Tokens.typographyDisplayLarge,
    bodyLarge: M3Tokens.typographyBodyLarge,
  ),
  elevationOverlayColor: M3Tokens.colorSurfaceTint,
)
```

### Extension Methods
```dart
extension M3ThemeExtension on ThemeData {
  M3ColorScheme get m3ColorScheme => M3ColorScheme.fromColorScheme(colorScheme);
  M3Typography get m3Typography => M3Typography.fromTextTheme(textTheme);
}
```

## Future Enhancements

1. **Token Generation**: Automated token generation from design tools
2. **Theme Builder**: Visual theme customization interface
3. **Token Validation**: Runtime validation of token usage
4. **Documentation Generator**: Automated documentation from token definitions
5. **Platform Adaptation**: Platform-specific token variations

## References
- [Material Design 3 Design Tokens](https://m3.material.io/foundations/design-tokens)
- [Material Theme Builder](https://m3.material.io/theme-builder)
- [Flutter ThemeData Documentation](https://api.flutter.dev/flutter/material/ThemeData-class.html)