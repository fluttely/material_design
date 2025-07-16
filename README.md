# Material Design

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)

A comprehensive toolkit for implementing Material Design 3 in Flutter. Build beautiful and consistent UIs aligned with official metrics and guidelines using a powerful set of design tokens and ready-to-use helper widgets.

This package encapsulates the [Material 3](https://m3.material.io/) guidelines into easy-to-use tokens, allowing you to focus on your app logic while maintaining visual fidelity.

## Installation

Add this line to your project's `pubspec.yaml` file:

```yaml
dependencies:
  material_design: ^0.2.4
```

Then run `flutter pub get`.

## Usage

Import the package to start using the tokens:

```dart
import 'package:material_design/material_design.dart';
```

## Core Tokens

This package provides a comprehensive set of Material 3 design tokens, allowing you to build consistent and beautiful UIs.

### Color

The color system is based on a seed color, which generates a full `ColorScheme` for both light and dark modes.

- **`MaterialColorScheme.create({seedColor, brightness})`**: Generates a full M3 color scheme.

**Example:**

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: MaterialColorScheme.create(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  ),
  darkTheme: ThemeData(
    colorScheme: MaterialColorScheme.create(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  ),
)
```

- **`MaterialTonalColor.fromElevation(context, elevation)`**: Calculates the surface color with an elevation-based tint, crucial for M3's tonal elevation.

**Example:**

```dart
Container(
  color: MaterialTonalColor.fromElevation(context, MaterialElevation.level2),
)
```

### Typography

The full M3 type scale is available via the `MaterialTypeScale` class.

- **`MaterialTypeScale`**: Provides 15 `TextStyle` tokens, from `displayLarge` to `labelSmall`.

**Example:**

```dart
Text(
  'Display Large',
  style: MaterialTypeScale.displayLarge,
)
```

### Shape & Radius

Define corner shapes using radius and shape tokens.

- **`MaterialRadius`**: Provides radius values from `none` (0dp) to `extraLarge` (28dp) and `full`.
- **`MaterialShape`**: Provides `ShapeBorder` objects like `extraSmall`, `medium`, `large`, etc.

**Example:**

```dart
Container(
  decoration: ShapeDecoration(
    shape: MaterialShape.medium, // 12dp corner radius
  ),
)
```

### Elevation & Shadow

Use elevation tokens for surface depth and shadow tokens for casting shadows.

- **`MaterialElevation`**: Defines 6 elevation levels from `level0` (0dp) to `level5` (12dp).
- **`MaterialShadow`**: Provides `BoxShadow` lists for each elevation level (`level0` to `level5`).

**Example:**

```dart
Container(
  decoration: ShapeDecoration(
    shape: MaterialShape.medium,
    shadows: MaterialShadow.level2, // 3dp elevation shadow
  ),
)
```

### Spacing

A granular spacing scale for consistent layouts.

- **`MaterialSpacing`**: Provides spacing values from `none` to `space512`.

**Example:**

```dart
Padding(
  padding: const EdgeInsets.all(MaterialSpacing.space16), // 16dp padding
  child: Text('Hello, Material!'),
)
```

### Motion

Standardized duration and easing curves for animations.

- **`MaterialMotion`**: Provides `MotionToken` objects for `standard`, `emphasized`, and `linear` motion, including incoming and outgoing variations.

**Example:**

```dart
AnimatedContainer(
  duration: MaterialMotion.standard.duration,
  curve: MaterialMotion.standard.curve,
  // ...
)
```

### Other Tokens

The library also includes tokens for various other UI properties.

- **`MaterialBorder`**: Standard border widths.

  - `thin` (1dp)

  **Example:**

  ```dart
  Container(
    decoration: BoxDecoration(
      border: Border.all(width: MaterialBorder.thin),
    ),
  )
  ```

- **`MaterialOpacity`**: Opacity values for states and elements.

  - `hover` (0.08), `focus` (0.10), `pressed` (0.10), `dragged` (0.16)
  - `disabledContent` (0.38), `disabledContainer` (0.12)

  **Example:**

  ```dart
  Container(
    color: Colors.black.withOpacity(MaterialOpacity.hover),
  )
  ```

- **`MaterialBreakpoint`**: Breakpoints for responsive layouts.

  - `compact` (0), `medium` (600), `expanded` (840), `large` (1200), `extraLarge` (1600)

  **Example:**

  ```dart
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth >= MaterialBreakpoint.medium) {
    // Use a two-column layout
  }
  ```

- **`MaterialIconSize`**: Standard icon size.

  - `standard` (24dp)

  **Example:**

  ```dart
  Icon(
    Icons.favorite,
    size: MaterialIconSize.standard,
  )
  ```

- **`MaterialZIndex`**: Conventional z-index values for layering.

  - `content` (1), `floating` (10), `drawer` (100), `modal` (1000), `snackbar` (2000), `tooltip` (9999)

  **Example:**

  ```dart
  Stack(
    children: [
      Positioned(
        zIndex: MaterialZIndex.content,
        child: Text('Content'),
      ),
      Positioned(
        zIndex: MaterialZIndex.floating,
        child: FloatingActionButton(onPressed: () {}),
      ),
    ],
  )
  ```

## Example App

The included example app serves as a complete visual style guide, showcasing all tokens available in this package. Explore it to see the tokens in action.

### More content

[https://flutterweb-wasm.web.app/](https://flutterweb-wasm.web.app/)
