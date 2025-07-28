# Material Design 3 for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Tests](https://github.com/fluttely/material_design/actions/workflows/tests.yml/badge.svg)](https://github.com/fluttely/material_design/actions/workflows/tests.yml)
[![Deploy Demo](https://github.com/fluttely/material_design/actions/workflows/deploy-demo.yml/badge.svg)](https://github.com/fluttely/material_design/actions/workflows/deploy-demo.yml)
[![codecov](https://codecov.io/gh/fluttely/material_design/branch/master/graph/badge.svg)](https://codecov.io/gh/fluttely/material_design)

🎨 **The most complete Material Design 3 implementation for Flutter**

A comprehensive, type-safe toolkit that brings the full power of Material Design 3 to Flutter apps. Build pixel-perfect UIs with enhanced developer experience through enum-based design tokens, comprehensive documentation, and zero learning curve.

Transform your Flutter development with production-ready design tokens that eliminate guesswork and ensure consistency across your entire application.

## 🚀 Live Demo & Resources

**[🌟 View Interactive Demo](https://fluttely.github.io/material_design/)** - Explore all design tokens with live examples

**[📚 Material Design 3 Guidelines](https://m3.material.io/)** - Official documentation

## ✨ Features

- 🔐 **Type-Safe**: Enum-based tokens prevent errors at compile time
- 🚀 **Simple**: Intuitive `.value` pattern for all tokens
- 📱 **Responsive**: Built-in breakpoints and adaptive layouts
- 🌙 **Dark Mode**: Full theme support out of the box
- 📖 **Well Documented**: Every token has inline documentation

## 🚧 In Development

- 🎨 **Complete Token Coverage**: Implementing remaining Material Design 3 tokens
- 🛠️ **Widget Helpers**: Pre-built components following M3 specifications
- 📐 **Design System Framework**: Tools to build complete design systems using official M3 tokens

## Installation

```yaml
dependencies:
  material_design: ^last-version
```

## Quick Start

```dart
import 'package:material_design/material_design.dart';

// Use any token with .value
Container(
  padding: EdgeInsets.all(M3SpacingToken.space16.value),
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
    borderRadius: M3BorderRadiusToken.medium.value,
  ),
  child: Text(
    'Hello Material 3',
    style: Theme.of(context).textTheme.headlineMedium,
  ),
)
```

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

Consistent spacing based on 4dp grid:

```dart
// Spacing for padding/margins
Padding(
  padding: EdgeInsets.all(M3SpacingToken.space24.value), // 24dp
)

// Responsive margins
Container(
  margin: EdgeInsets.symmetric(
    horizontal: M3MarginToken.compactScreen.value, // 16dp on phones
  ),
)

// Layout gaps
Row(
  children: [
    Widget1(),
    const M3Gap(M3SpacerToken.pane), // 24dp gap
    Widget2(),
  ],
)
```

### 🎬 Motion

Standardized animations:

```dart
AnimatedContainer(
  duration: M3MotionDurationToken.medium2.value, // 300ms
  curve: M3MotionCurveToken.emphasized.value,    // Material easing
)
```

### 📏 Other Tokens

```dart
// Elevation with surface tint
Container(
  decoration: BoxDecoration(
    color: M3ElevationToken.level3.surfaceColor(context),
    boxShadow: M3ElevationToken.level3.shadows,
  ),
)

// Responsive breakpoints
if (M3BreakpointToken.isMedium(context)) {
  // Tablet layout
}

// Icon sizes
Icon(Icons.star, size: M3IconSizeToken.medium.value) // 32dp

// Border widths
Container(
  decoration: BoxDecoration(
    border: Border.all(width: M3BorderWidthToken.thin.value), // 1dp
  ),
)

// State layer opacities
final Color hoverOverlayColor = Theme.of(context).colorScheme.onSurface.withValues(alpha: M3StateLayerOpacityToken.hover.value);
return AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  color: _onHover ? Color.alphaBlend(hoverOverlayColor, colorScheme.surface) : colorScheme.surface,
  child: // Seu conteúdo aqui,
);
```

## Core Tokens

### 🎨 Color System

Generate complete Material 3 color schemes from a single seed color:

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  ),
)
```

### 📝 Typography

Access all 15 Material 3 text styles:

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: M3TextStyleToken.displayLarge.value,
      ...
      labelSmall: M3TextStyleToken.labelSmall.value,
    ),
  ),
)
```

## Example App

Run the example to see all tokens in action:

```bash
cd example
flutter run
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## 📄 License

BSD License - see the [LICENSE](/LICENSE) file for details.
