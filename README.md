# Material Design 3

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)

🎨 **The most complete Material Design 3 implementation for Flutter**

A comprehensive, type-safe toolkit that brings the full power of Material Design 3 to Flutter apps. Build pixel-perfect UIs with enhanced developer experience through enum-based design tokens, comprehensive documentation, and zero learning curve.

Transform your Flutter development with production-ready design tokens that eliminate guesswork and ensure consistency across your entire application.

## 🚀 Live Demo & Examples

**[🌟 View Interactive Demo](https://fluttely.github.io/material_design/)** - Explore all design tokens and components in action with live, interactive examples.

The demo showcases:

- All design tokens with visual examples
- Interactive components and their usage
- Real-time theme switching (light/dark mode)
- Responsive design patterns
- Complete implementation examples

## 📚 Additional Resources

- **Additional Live Demo**: [Material Design 3 Flutter Showcase](https://flutterweb-wasm.web.app/)
- **Material Design 3 Guidelines**: [Official M3 Documentation](https://m3.material.io/)
- **Flutter Material 3**: [Flutter's M3 Support](https://docs.flutter.dev/ui/design/material)

## Installation

Add this line to your project's `pubspec.yaml` file:

```yaml
dependencies:
  material_design: ^0.9.0
```

Then run `flutter pub get`.

## ✨ Key Features

- 🔐 **Type-Safe Design Tokens**: Enum-based architecture prevents errors and improves IntelliSense
- 🎨 **Complete M3 Implementation**: All official Material Design 3 tokens and guidelines
- 🚀 **Zero Learning Curve**: Intuitive `.value` pattern across all tokens
- 📱 **Responsive Ready**: Built-in breakpoints and adaptive layouts
- 🌙 **Dark Mode Native**: Full light/dark theme support out of the box
- 🎯 **Production Ready**: Used in real-world applications with comprehensive testing
- 📖 **Comprehensive Docs**: Inline documentation for every token and method

## Usage

Import the package to start using the tokens:

```dart
import 'package:material_design/material_design.dart';
```

## Core Tokens

This package provides a comprehensive set of Material 3 design tokens using modern enum-based architecture, allowing you to build consistent and beautiful UIs with enhanced type safety.

### Color

The color system is based on a seed color, which generates a full `ColorScheme` for both light and dark modes.

- **`ColorScheme.fromSeed({seedColor, brightness})`**: Generates a full M3 color scheme.

**Example:**

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
  ),
  darkTheme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
  ),
)
```

### Typography

The full M3 type scale is available via the `M3TypeScaleToken` enum.

- **`M3TypeScaleToken`**: Provides 15 `TextStyle` tokens, from `displayLarge` to `labelSmall`. Each token contains a `.value` property that returns the `TextStyle`.

**Example:**

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: M3TypeScaleToken.displayLarge.value,
      displayMedium: M3TypeScaleToken.displayMedium.value,
      displaySmall: M3TypeScaleToken.displaySmall.value,
      ...
    ),
  ),
)
```

### Shape & Corner Radius

Apply shapes and rounded corners to your widgets using a three-tiered token system: `M3ShapeToken`, `M3BorderRadiusToken`, and `M3RadiusToken`. This structure provides everything from ready-to-use `RoundedRectangleBorder` objects to raw `Radius` values for advanced customizations.

---

### `M3ShapeToken` (High-Level)

Use `M3ShapeToken` for the most direct application of shapes. This class provides pre-defined `RoundedRectangleBorder` objects that can be used directly in the `shape` property of widgets like `Card`, `Material`, or `ShapeDecoration`.

**Available tokens:** `none`, `extraSmall`, `small`, `medium`, `large`, `largeIncreased`, `extraLarge`, `extraLargeIncreased`, `extraExtraLarge`, and `full` (`StadiumBorder`).

**When to use:** This is the ideal choice in most cases, whenever you need to apply a standard Material 3 shape to a widget.

**Example:**

```dart
Container(
  decoration: ShapeDecoration(
    shape: M3ShapeToken.extraLarge.value, // 16dp circular RoundedRectangleBorder
  ),
)
```

---

### `M3BorderRadiusToken` (Mid-Level)

Use `M3BorderRadiusToken` when you need a `BorderRadius` object to apply the same radius to all corners. It's perfect for the `borderRadius` property of a `BoxDecoration` or for clipping widgets like `ClipRRect`.

**When to use:** In a `BoxDecoration` or to control the rounding of an `InkWell` splash effect or a `ClipRRect`.

**Example:**

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadiusToken.large.value, // 16dp circular BorderRadius
  ),
)
```

---

### `M3RadiusToken` (Low-Level)

`M3RadiusToken` provides the raw `Radius` values. Use this class for custom scenarios where you need to define different radii for specific corners of a widget.

**When to use:** For creating complex or asymmetrical shapes using `BorderRadius.only()` or `BorderRadius.vertical()`/`horizontal()`.

**Example:**

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: M3RadiusToken.extraLarge.value, // 28dp circular Radius
      bottomRight: M3RadiusToken.small.value, // 28dp circular Radius
    ),
  ),
)
```

---

### Summary: Which One to Use?

| Class                     | Returns                  | Primary Use Case                                                    |
| ------------------------- | ------------------------ | ------------------------------------------------------------------- |
| **`M3ShapeToken`**        | `RoundedRectangleBorder` | `shape` property of `Card`, `Material`, `ShapeDecoration`.          |
| **`M3BorderRadiusToken`** | `BorderRadius`           | `borderRadius` property of `BoxDecoration`, `InkWell`, `ClipRRect`. |
| **`M3RadiusToken`**       | `Radius`                 | For custom corner `radii`.                                          |

### Elevation

Use elevation tokens for surface depth and shadow tokens for casting shadows.

- **`M3ElevationToken`**: Defines 6 elevation levels from `level0` (0dp) to `level5` (12dp).

**Example:**

```dart
final elevation = M3ElevationToken.level5;
Container(
  decoration: ShapeDecoration(
    shape: M3ShapeToken.small.value,
    color: elevation.surfaceColor(context),
    shadows: elevation.shadows,
  ),
),
```

### Spacing & Layout

A granular scale for consistent spacing, margins, and layouts using enum-based tokens.

- **`M3SpacingToken`**: Provides spacing values from `none` to `space128` based on a 4dp grid. Ideal for padding and small gaps between UI elements. Use `.value` to access the spacing value.

**Example:**

```dart
Padding(
  padding: EdgeInsets.all(M3SpacingToken.space16.value), // 16dp padding
  child: Text('Hello, Material!'),
)
```

- **`M3MarginToken`**: Provides semantic margin values for different screen sizes:

  - `compactScreen` (16dp) for compact screens
  - `mediumScreen` (24dp) for medium screens
  - `expandedScreen` (24dp) for expanded screens
  - `largeScreen` (24dp) for large screens
  - `extraLargeScreen` (24dp) for extra-large screens

**Example:**

```dart
Container(
  margin: EdgeInsets.symmetric(horizontal: M3MarginToken.compactScreen.value),
  child: Text('Content with responsive margins'),
)
```

- **`M3SpacerToken`**: Provides standardized spacing for layout pane separation.

  - `pane` (24dp) for the gap between two content panes

**Example:**

```dart
Row(
  children: [
    Expanded(child: ContentPane1()),
    SizedBox(width: M3SpacerToken.pane.value),
    Expanded(child: ContentPane2()),
  ],
)
```

### Visual Density

Adjust component density for different interaction models.

- **`M3VisualDensityToken`**: An enum with `standard`, `comfortable`, `compact` and `adaptivePlatformDensity` values.

**Example:**

```dart
// In your State class
VisualDensity _density = M3VisualDensityToken.standard.value;

return Theme(
  data: Theme.of(context).copyWith(visualDensity: _density),
  child: Scaffold(
    appBar: AppBar(
      title: const Text('Density Example'),
      actions: [
        TextButton(
          onPressed: () => setState(() => _density = _density == M3VisualDensityToken.standard.value
              ? M3VisualDensityToken.compact.value
              : M3VisualDensityToken.standard.value),
          child: const Text('Toggle', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
    body: const Center(
      child: Card(child: ListTile(title: Text('List Item'))),
    ),
  ),
);
```

### Motion

Standardized duration and easing curves for animations using enum-based tokens.

- **`M3MotionDurationToken`**: Provides duration values from `short1` to `extraLong4`. Use `.value` to access the `Duration`.
- **`M3MotionEasingToken`**: Provides easing curves from `emphasizedAccelerate` to `standardDecelerate`. Use `.value` to access the `Curve`.

**Example:**

```dart
AnimatedContainer(
  duration: M3MotionDurationToken.long2.value,
  curve: M3MotionEasingToken.emphasizedAccelerate.value,
  // ...
)
```

### Other Tokens

The library also includes enum-based tokens for various other UI properties. All tokens use the `.value` property to access their underlying values.

- **`M3BorderToken`**: Standard border widths with utility methods.

  - `none` (0dp), `thin` (1dp), `thick` (2dp), `extraThick` (4dp)

**Example:**

```dart
Container(
  decoration: BoxDecoration(
    border: Border.all(width: M3BorderToken.thin.value),
  ),
)
```

- **`M3StateLayerOpacityToken`** & **`M3OpacityToken`**: Opacity values for interactive states and UI elements.

**State Layer Opacities:**

- `hover` (0.08), `focus` (0.10), `pressed` (0.10), `dragged` (0.16)

**General Opacities:**

- `disabledContent` (0.38), `disabledContainer` (0.12), `divider` (0.12), `backdrop` (0.5)

**Example:**

```dart
// Apply a state layer overlay for interaction feedback
final isPressed = true;
final stateLayerOpacity = isPressed
    ? M3StateLayerOpacityToken.pressed.value
    : 0.0;

Stack(
  children: [
    // Your main widget content here
    Positioned.fill(
      child: AnimatedContainer(
        duration: M3MotionDurationToken.short3.value,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(
            alpha: stateLayerOpacity,
          ),
        ),
      ),
    ),
  ],
)
```

- **`M3BreakpointToken`**: Breakpoints for responsive layouts with utility methods.

- `compact` (0), `medium` (600), `expanded` (840), `large` (1200), `extraLarge` (1600)

**Example:**

```dart
final screenWidth = MediaQuery.of(context).size.width;
if (screenWidth >= M3BreakpointToken.medium.value) {
  // Use a two-column layout
}

// Or use utility methods:
if (M3BreakpointToken.isLarge(context)) {
  // Desktop layout
}
```

- **`M3IconSizeToken`**: Standard icon sizes.

  - `dense` (20dp), `standard` (24dp), `medium` (32dp), `large` (40dp), `extraLarge` (48dp)

**Example:**

```dart
Icon(
  Icons.favorite,
  size: M3IconSizeToken.standard.value,
)
```

- **`M3ZIndexToken`**: Conventional z-index values for layering.

  - `background` (0), `content` (1), `floating` (10), `drawer` (100), `modal` (1000), `snackbar` (2000), `tooltip` (9999)

**Example:**

```dart
// Note: Flutter doesn't have direct z-index support, but you can use these values
// for ordering in Stack widgets or for custom implementations
final modalZIndex = M3ZIndexToken.modal.value; // 1000
```

## Example App

The included example app serves as a complete visual style guide, showcasing all tokens available in this package. Run the example to see the tokens in action and understand how to implement them in your own projects.

```bash
cd example
flutter run
```

## ⚡ API Changes (v0.7.0+)

Starting from version 0.7.0, all design tokens have been converted from static classes to **enums with `.value` properties** for improved type safety, better IntelliSense, and enhanced developer experience.

### 🔧 Migration Guide

**Before (v0.6.1 and earlier):**

```dart
// Old API - Direct access
Card(elevation: M3ElevationToken.level5)
Padding(padding: EdgeInsets.all(M3SpacingToken.space16))
AnimatedContainer(duration: M3MotionDurationToken.short2)
Icon(Icons.directions_boat_filled, size: M3IconSize.dense),
```

**After (v0.7.0+):**

```dart
// New API - Access via .value property
Card(elevation: M3ElevationToken.level5.value)
Padding(padding: EdgeInsets.all(M3SpacingToken.space16.value))
AnimatedContainer(duration: M3MotionDurationToken.short2.value)
Icon(Icons.directions_boat_filled, size: M3IconSizeToken.dense.value),
```

**Before (v0.7.5):**

```dart
// Old API - no longer available
Container(
  decoration: BoxDecoration(
    color: M3TonalColor.surface3(context),
    boxShadow: M3ShadowToken.fromElevation(4.5),
  ),
)
```

**After (v0.8.0):**

```dart
// New unified API
final elevation = M3ElevationToken.fromValue(4.5);
Container(
  decoration: BoxDecoration(
    color: elevation.surfaceColor(context),
    boxShadow: elevation.shadows,
  ),
)
```

### Benefits of the New API

- ✅ **Better Type Safety**: Enums prevent invalid token usage
- ✅ **Enhanced IntelliSense**: Improved autocomplete and documentation
- ✅ **Consistent Pattern**: All tokens follow the same `.value` pattern
- ✅ **Professional Documentation**: Comprehensive inline docs for each token
- ✅ **Interface Contracts**: Tokens implement interfaces for extensibility

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## 📄 License

This project is licensed under the BSD License - see the [LICENSE](/LICENSE) file for details.

![Deploy Status](https://github.com/seu-usuario/repo/actions/workflows/deploy-demo.yml/badge.svg)
