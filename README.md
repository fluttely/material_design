# Material Design

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)

A comprehensive toolkit for implementing Material Design 3 in Flutter. Build beautiful and consistent UIs aligned with official metrics and guidelines using a powerful set of design tokens and ready-to-use helper widgets.

This package encapsulates the [Material 3](https://m3.material.io/) guidelines into easy-to-use tokens, allowing you to focus on your app logic while maintaining visual fidelity.

## Features

- 🎨 **Color**: Full light and dark color schemes (`ColorScheme`) generated from a seed color.
- ✒️ **Typography**: Full M3 type scale with 15 text styles (`TextStyle`).
- ✨ **Shape**: `ShapeBorder` tokens for all corner radius levels.
- 🔳 **Shadow**: `BoxShadow` tokens for the 6 M3 elevation levels.
- 📏 **Spacing**: Granular spacing scale for consistent layouts.
- 📐 **Borders**: Tokens for standard border widths.
- 💨 **Motion**: Duration and easing curves for standard and emphasized animations.
- 🔧 And more: Tokens for **Breakpoint**, **Density**, **Opacity**, and **Icon Size**.

## Installation

Add this line to your project's `pubspec.yaml` file:

```yaml
dependencies:
  material_design: ^0.2.1
```

Then run `flutter pub get`.

## Usage

Import the package to start using the tokens:

```dart
import 'package:material_design/material_design.dart';
```

### Configuring the Theme

Easily apply Material 3 color schemes to your `MaterialApp`:

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material 3 App',
      // Use the light theme
      theme: ThemeData(
        colorScheme: MaterialColorScheme.create(
          seedColor: _seedColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      // And the dark theme
      darkTheme: ThemeData(
          colorScheme: MaterialColorScheme.create(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
```

### Applying Tokens

Use tokens in your widgets to ensure consistency.

**Text:**

```dart
Text(
  'Display Large',
  style: MaterialTypeScale.displayLarge,
)
```

**Shapes and Shadows:**

```dart
Container(
  decoration: ShapeDecoration(
    shape: MaterialShape.medium, // 12dp corner radius
    shadows: MaterialShadow.level2, // 3dp elevation shadow
  ),
)
```

**Spacing:**

```dart
Padding(
  padding: const EdgeInsets.all(MaterialSpacing.space16), // 16dp padding
  child: Text('Hello, Material!'),
)
```

### Example App

The included example app serves as a complete visual style guide, showcasing all tokens available in this package. Explore it to see the tokens in action.

### More content

[https://flutterweb-wasm.web.app/](https://flutterweb-wasm.web.app/)
