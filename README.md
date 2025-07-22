# Material Design 3 Only

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)

A comprehensive toolkit for implementing Material Design 3 in Flutter. Build beautiful and consistent UIs aligned with official metrics and guidelines using a powerful set of design tokens and ready-to-use helper widgets.

This package encapsulates the [Material 3](https://m3.material.io/) guidelines into easy-to-use tokens, allowing you to focus on your app logic while maintaining visual fidelity.

## Installation

Add this line to your project's `pubspec.yaml` file:

```yaml
dependencies:
  material_design: ^0.6.2
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

- **`M3TonalColor.fromElevation(context, elevation)`**: Calculates the surface color with an elevation-based tint, crucial for M3's tonal elevation.

**Example:**

```dart
Container(
  color: M3TonalColor.fromElevation(context, M3Elevation.level2),
)
```

### Typography

The full M3 type scale is available via the `M3TypeScale` class.

- **`M3TypeScale`**: Provides 15 `TextStyle` tokens, from `displayLarge` to `labelSmall`.

**Example:**

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: M3TypeScale.displayLarge,
      displayMedium: M3TypeScale.displayMedium,
      displaySmall: M3TypeScale.displaySmall,
      ...
    ),
  ),
)
```

```dart
final textTheme = Theme.of(context).textTheme;
Text(
  'Display Large',
  style: textTheme.displayLarge,
)
```

### Shape & Corner Radius

Apply shapes and rounded corners to your widgets using a three-tiered token system: `M3Shape`, `M3BorderRadius`, and `M3Radius`. This structure provides everything from ready-to-use `RoundedRectangleBorder` objects to raw `Radius` values for advanced customizations.

---

### `M3Shape` (High-Level)

Use `M3Shape` for the most direct application of shapes. This class provides pre-defined `RoundedRectangleBorder` objects that can be used directly in the `shape` property of widgets like `Card`, `Material`, or `ShapeDecoration`.

**Available tokens:** `none`, `extraSmall`, `small`, `medium`, `large`, `largeIncreased`, `extraLarge`, `extraLargeIncreased`, `extraExtraLarge`, and `full` (`StadiumBorder`).

**When to use:** This is the ideal choice in most cases, whenever you need to apply a standard Material 3 shape to a widget.

**Example:**

Dart

```
Container(
  decoration: ShapeDecoration(
    shape: M3Shape.large, // 16dp circular RoundedRectangleBorder
  ),
)
```

---

### `M3BorderRadius` (Mid-Level)

Use `M3BorderRadius` when you need a `BorderRadius` object to apply the same radius to all corners. It's perfect for the `borderRadius` property of a `BoxDecoration` or for clipping widgets like `ClipRRect`.

**When to use:** In a `BoxDecoration` or to control the rounding of an `InkWell` splash effect or a `ClipRRect`.

**Example:**

Dart

```
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadius.large, // 16dp circular BorderRadius
  ),
)
```

---

### `M3Radius` (Low-Level)

`M3Radius` provides the raw `Radius` values. Use this class for custom scenarios where you need to define different radii for specific corners of a widget.

**When to use:** For creating complex or asymmetrical shapes using `BorderRadius.only()` or `BorderRadius.vertical()`/`horizontal()`.

**Example:**

Dart

```
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: M3Radius.extraLarge, // 28dp circular Radius
      bottomRight: M3Radius.extraLarge, // 28dp circular Radius
    ),
  ),
)
```

---

### Summary: Which One to Use?

| Class                | Returns                  | Primary Use Case                                                    |
| -------------------- | ------------------------ | ------------------------------------------------------------------- |
| **`M3Shape`**        | `RoundedRectangleBorder` | `shape` property of `Card`, `Material`, `ShapeDecoration`.          |
| **`M3BorderRadius`** | `BorderRadius`           | `borderRadius` property of `BoxDecoration`, `InkWell`, `ClipRRect`. |
| **`M3Radius`**       | `Radius`                 | For custom corner `radii`.                                          |

### Elevation

Use elevation tokens for surface depth and shadow tokens for casting shadows.

- **`M3Elevation`**: Defines 6 elevation levels from `level0` (0dp) to `level5` (12dp).
- **`M3Shadow`**: Provides `BoxShadow` lists for each elevation level (`level0` to `level5`).

**Example:**

```dart
final useShadow = true;
final elevation = M3Elevation.level5;
final elevationSurfaceColor = M3TonalColor.fromElevation(context, elevation);
final elevationShadows = useShadow ? M3Shadow.fromElevation(elevation) : <BoxShadow>[];
Container(
  decoration: ShapeDecoration(
    shape: M3Shape.small,
    color: elevationSurfaceColor,
    shadows: elevationShadows,
  ),
),
```

### Spacing & Layout

A granular scale for consistent spacing, margins, and layouts.

- **`M3Spacing`**: Provides spacing values from `none` to `space128` based on a 4dp grid. Ideal for padding and small gaps between UI elements.

**Example:**

```dart
Padding(
  padding: const EdgeInsets.all(M3Spacing.space16), // 16dp padding
  child: Text('Hello, Material!'),
)
```

- **`M3Margin`**: Provides semantic margin values for the outer edges of the screen layout.

  - screen (16dp) for compact/medium screens.

  - screenLarge (24dp) for large/extra-large screens.

**Example:**

```dart
Container(
  margin: const EdgeInsets.symmetric(horizontal: M3Margin.screen),
  child: Text('Content with screen margins'),
)
```

- **`M3Spacer`**: pane (24dp) for the gap between two content panes.

  - screen (16dp) for compact/medium screens.

  - screenLarge (24dp) for large/extra-large screens.

**Example:**

```dart
Row(
  children: [
    Expanded(child: ContentPane1()),
    const SizedBox(width: M3Spacer.pane),
    Expanded(child: ContentPane2()),
  ],
)
```

### Density

Adjust component density for different interaction models.

- **`M3Density`**: An enum with `comfortable` (default) and `compact` values.

**Example:**

```dart
// Use a switch to toggle between density settings
final density = isCompact ? M3Density.compact : M3Density.comfortable;

// This could be used to adjust layout constraints
final horizontalPadding = density == M3Density.compact
    ? M3Spacing.space8
    : M3Spacing.space16;
```

### Motion

Standardized duration and easing curves for animations.

- **`M3MotionDuration`**: Provides duration values from `short1` to `extralong4`.
- **`M3MotionEasing`**: Provides duration values from `emphasizedAccelerate` to `standardDecelerate`.

**Example:**

```dart
AnimatedContainer(
  duration: M3MotionDuration.long2,
  curve: M3MotionEasing.emphasizedAccelerate,
  // ...
)
```

### Other Tokens

The library also includes tokens for various other UI properties.

- **`M3Border`**: Standard border widths.

  - `thin` (1dp)

  **Example:**

  ```dart
  Container(
    decoration: BoxDecoration(
      border: Border.all(width: M3Border.thin),
    ),
  )
  ```

- **`M3StateLayerOpacity`**: Opacity values for states and elements.

  - `hover` (0.08), `focus` (0.10), `pressed` (0.10), `dragged` (0.16)
  - `disabledContent` (0.38), `disabledContainer` (0.12)

  **Example:**

```dart
// Apply a state layer overlay for interaction feedback
final isPressed = true;
final stateLayerOpacity = isPressed ? M3StateLayerOpacity.pressed : 0.0;

Stack(
  children: [
    // Main widget content
     Positioned.fill(
      child: AnimatedContainer(
        duration: M3MotionDuration.short3,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(stateLayerOpacity),
        ),
      ),
    ),
  ],
)
```

- **`M3Breakpoint`**: Breakpoints for responsive layouts.

- `compact` (0), `medium` (600), `expanded` (840), `large` (1200), `extraLarge` (1600)

**Example:**

```dart
final screenWidth = MediaQuery.of(context).size.width;
if (screenWidth >= M3Breakpoint.medium) {
  // Use a two-column layout
}
```

- **`M3IconSize`**: Standard icon size.

  - `standard` (24dp)

  **Example:**

  ```dart
  Icon(
    Icons.favorite,
    size: M3IconSize.standard,
  )
  ```

- **`M3ZIndex`**: Conventional z-index values for layering.

  - `content` (1), `floating` (10), `drawer` (100), `modal` (1000), `snackbar` (2000), `tooltip` (9999)

  **Example:**

  ```dart
  Stack(
    children: [
      Positioned(
        zIndex: M3ZIndex.content,
        child: Text('Content'),
      ),
      Positioned(
        zIndex: M3ZIndex.floating,
        child: FloatingActionButton(onPressed: () {}),
      ),
    ],
  )
  ```

## Example App

The included example app serves as a complete visual style guide, showcasing all tokens available in this package. Explore it to see the tokens in action.

### More content

[https://flutterweb-wasm.web.app/](https://flutterweb-wasm.web.app/)
