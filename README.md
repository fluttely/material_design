# Material Design 3 for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)

<!-- [![Tests](https://github.com/fluttely/material_design/actions/workflows/tests.yml/badge.svg)](https://github.com/fluttely/material_design/actions/workflows/tests.yml)
[![Deploy Demo](https://github.com/fluttely/material_design/actions/workflows/deploy-demo.yml/badge.svg)](https://github.com/fluttely/material_design/actions/workflows/deploy-demo.yml) -->

🎨 **The most complete Material Design 3 implementation for Flutter**

A comprehensive, type-safe toolkit that brings the full power of Material Design 3 to Flutter apps. Build pixel-perfect UIs with enhanced developer experience through enum-based design tokens, comprehensive documentation, and zero learning curve.

Transform your Flutter development with production-ready design tokens that eliminate guesswork and ensure consistency across your entire application.

## 🚀 Live Demo & Resources

**[🌟 View Interactive Demo](https://fluttely.github.io/material_design/)** - Explore all design tokens with live examples

**[📚 Material Design 3 Guidelines](https://m3.material.io/)** - Official documentation

## ✨ Features

- 🔐 **Type-Safe**: Enum-based tokens prevent errors at compile time
- 🚀 **Simple**: Intuitive API with multiple usage patterns
- 📱 **Responsive**: Built-in breakpoints and adaptive layouts
- 🌙 **Dark Mode**: Full theme support out of the box
- 🎯 **Flexible**: Choose from typed tokens, .value pattern, or constants
- 📖 **Well Documented**: Every token has inline documentation

## 🚧 In Development

- 🎨 **Complete Token Coverage**: Implementing remaining Material Design 3 tokens
- 🛠️ **Widget Helpers**: Pre-built components following M3 specifications
- 📐 **Design System Framework**: Tools to build complete design systems using official M3 tokens

## Installation

```yaml
dependencies:
  material_design: ^0.1.0 # Replace with actual version
```

## Quick Start

Choose the API style that best fits your needs:

### 🎯 Recommended: Typed Tokens (Most Convenient)

```dart
import 'package:material_design/material_design.dart';

Container(
  padding: M3EdgeInsets.all(M3SpacingToken.space16),
  decoration: M3BoxDecoration(
    color: Theme.of(context).colorScheme.surfaceContainer,
    borderRadius: M3BorderRadiusToken.medium,
    boxShadow: M3ShadowToken.fromElevation(M3ElevationToken.level3),
  ),
  child: Text(
    'Hello Material 3',
    style: Theme.of(context).textTheme.headlineMedium,
  ),
)
```

### ⚡ Alternative: .value Pattern (Flutter Standard)

```dart
Container(
  padding: EdgeInsets.all(M3SpacingToken.space16.value),
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.surfaceContainer,
    borderRadius: M3BorderRadiusToken.medium.value,
    boxShadow: M3ShadowToken.fromElevation(M3ElevationToken.level3).value,
  ),
  child: Text(
    'Hello Material 3',
    style: Theme.of(context).textTheme.headlineMedium,
  ),
)
```

### 🔧 Alternative: Constants (Performance Optimized)

```dart
Container(
  padding: EdgeInsets.all(M3Spacings.space16),
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.surfaceContainer,
    borderRadius: M3BorderRadii.medium,
    boxShadow: M3Shadows.level3,
  ),
  child: Text(
    'Hello Material 3',
    style: Theme.of(context).textTheme.headlineMedium,
  ),
)
```

> 💡 **Which approach to choose?**
>
> - **Typed tokens**: Best developer experience, compile-time safety
> - **.value pattern**: Familiar Flutter syntax, good for migration
> - **Constants**: Maximum performance, ideal for widgets rebuilt frequently

## Design Token Categories

### 🔲 Shape System

Three levels of shape tokens for maximum flexibility:

```dart
// High-level: Ready-to-use shapes
Card(
  shape: M3ShapeToken.medium.value, // RoundedRectangleBorder
)

// Mid-level: Border radius for decorations
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadiusToken.large.value, // BorderRadius
  ),
)

// Low-level: Individual radius values
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: M3RadiusToken.extraLarge.value, // Radius
    ),
  ),
)
```

### 📐 Spacing & Layout

Consistent spacing based on Material Design's 4dp grid system:

```dart
// Spacing for padding/margins
Padding(
  padding: M3EdgeInsets.all(M3SpacingToken.space24), // 24dp
)

// Responsive margins
Container(
  margin: EdgeInsets.symmetric(
    horizontal: M3MarginToken.compactScreen.value, // 16dp on phones
  ),
)

// Layout gaps between widgets
Row(
  children: [
    Widget1(),
    M3Gap(M3SpacerToken.pane), // 24dp gap
    Widget2(),
  ],
)
```

### 🎬 Motion & Animation

Standardized Material 3 motion patterns:

```dart
AnimatedContainer(
  duration: M3MotionDurationToken.medium2.value, // 300ms
  curve: M3MotionCurveToken.emphasized.value,    // Material easing curve
  // ... other properties
)
```

### 🎨 Elevation & Shadows

Material 3 elevation system with surface tinting:

```dart
Container(
  decoration: BoxDecoration(
    color: M3ElevationToken.level3.surfaceColor(context),
    boxShadow: M3ElevationToken.level3.shadows,
  ),
)
```

### 📱 Responsive Breakpoints

Built-in responsive design support:

```dart
Widget build(BuildContext context) {
  if (M3BreakpointToken.isCompact(context)) {
    return PhoneLayout();
  } else if (M3BreakpointToken.isMedium(context)) {
    return TabletLayout();
  } else {
    return DesktopLayout();
  }
}
```

### 🎯 Interactive States

Handle hover, focus, and pressed states:

```dart
final hoverOverlay = Theme.of(context)
    .colorScheme
    .onSurface
    .withValues(alpha: M3StateLayerOpacityToken.hover.value);

AnimatedContainer(
  duration: M3MotionDurationToken.short2.value,
  color: isHovered
      ? Color.alphaBlend(hoverOverlay, baseColor)
      : baseColor,
  child: YourWidget(),
)
```

## Core Material 3 Integration

### 🎨 Color System

Generate complete Material 3 color schemes from a single seed color:

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  ),
  // Your app
)
```

### 📝 Typography Scale

Access all 15 Material 3 text styles with proper type safety:

```dart
Text('Display Large', style: M3TextStyleToken.displayLarge.value)
Text('Headline Medium', style: M3TextStyleToken.headlineMedium.value)
Text('Body Large', style: M3TextStyleToken.bodyLarge.value)
Text('Label Small', style: M3TextStyleToken.labelSmall.value)
```

## Migration Guide

### From Flutter's Built-in Material

```dart
// Before
Container(
  padding: EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
  ),
)

// After
Container(
  padding: M3EdgeInsets.all(M3SpacingToken.space16),
  decoration: M3BoxDecoration(
    borderRadius: M3BorderRadiusToken.medium,
  ),
)
```

## Example App

Explore all design tokens in our comprehensive example:

```bash
git clone https://github.com/fluttely/material_design.git
cd material_design/example
flutter run
```

## API Reference

| Token Category  | Enum Class              | Constants Class | Description              |
| --------------- | ----------------------- | --------------- | ------------------------ |
| Spacing         | `M3SpacingToken`        | `M3Spacings`    | 4dp grid-based spacing   |
| Border Radius   | `M3BorderRadiusToken`   | `M3BorderRadii` | Corner radius values     |
| Elevation       | `M3ElevationToken`      | `M3Elevations`  | Surface elevation levels |
| Motion Duration | `M3MotionDurationToken` | `M3Durations`   | Animation timings        |
| Typography      | `M3TextStyleToken`      | `M3TextStyles`  | Text style definitions   |

## Contributing

We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) before submitting PRs.

### Development Setup

```bash
git clone https://github.com/fluttely/material_design.git
cd material_design
flutter pub get
flutter test
```

## License

This project is licensed under the BSD License - see the [LICENSE](LICENSE) file for details.

---

**Made with ❤️ by the Flutter community**
