# Material Design 3 Only

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)

A **comprehensive and enhanced** toolkit for implementing Material Design 3 in Flutter. Build beautiful, accessible, and responsive UIs aligned with official metrics and guidelines using a powerful set of design tokens, accessibility utilities, adaptive patterns, and ready-to-use helper widgets.

This package provides a **complete implementation** of [Material 3](https://m3.material.io/) guidelines with enhanced features including accessibility support, adaptive design patterns, comprehensive theme integration, and advanced animation utilities.

## Installation

Add this line to your project's `pubspec.yaml` file:

```yaml
dependencies:
  material_design: ^0.6.0
```

Then run `flutter pub get`.

## Usage

Import the package to start using the tokens:

```dart
import 'package:material_design/material_design.dart';
```

## 🌟 Enhanced Features

This library provides a complete, well-organized implementation of Material Design 3 following the official token structure:

### ✨ What's New in v0.6.0

- **📐 Official Token Structure** - Organized following M3's ref/sys/comp token hierarchy
- **🎨 Complete M3 Theme System** - Integrated theme builder with seamless Flutter integration
- **♿ Accessibility Features** - WCAG-compliant utilities and automatic configuration
- **📱 Adaptive Design** - Responsive layouts that work across all screen sizes
- **🎯 Advanced Tokens** - Enhanced typography, colors, elevation, motion, and shapes
- **🎬 Motion Patterns** - Advanced animation utilities with contextual behaviors
- **🎛️ Comprehensive Examples** - Reorganized showcase following M3 foundations/styles/components structure

### 🚀 Quick Start with Enhanced Features

```dart
import 'package:material_design/material_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enhanced Material Design 3',
      // Use the enhanced M3 theme system
      theme: M3Theme.light(seedColor: Colors.blue).toThemeData(),
      darkTheme: M3Theme.dark(seedColor: Colors.blue).toThemeData(),
      home: M3AdaptiveScaffold(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        ],
        selectedIndex: 0,
        onDestinationSelected: (index) {},
        body: const MyHomePage(),
      ),
    );
  }
}
```

## 📋 Token Architecture

This package follows the official Material Design 3 token structure for maximum consistency and scalability:

### 🏗️ Token Hierarchy

#### Reference Tokens (Ref)

Foundation tokens that define the basic design decisions:

- **Color Palettes**: 13-tone color palettes for all color families
- **Typography**: Base typeface definitions and font families
- **Motion**: Fundamental duration and easing curve values
- **Opacity**: Base opacity levels for interaction states

#### System Tokens (Sys)

Semantic tokens that map reference tokens to design intentions:

- **Color Roles**: Primary, secondary, tertiary, error, surface colors
- **Typography Scale**: 15 semantic text styles from display to label
- **Elevation System**: Tonal surface colors and shadow specifications
- **Motion Patterns**: Contextual animation specifications

#### Component Tokens (Comp)

Specific tokens for individual UI components:

- **Button Tokens**: Heights, paddings, radiuses, elevation states
- **Card Tokens**: Elevation levels, shape specifications
- **Dialog Tokens**: Sizing, spacing, and layout specifications
- **Navigation Tokens**: Sizes, spacing for different navigation types

### 🎯 Using the New Token Structure

#### Reference Tokens

```dart
// Access color palettes
final primaryColor = M3RefPalette.getColor(M3RefPalette.primary, 40);
final surfaceColor = M3RefPalette.getColor(M3RefPalette.neutral, 99);

// Typography foundations
final fontFamily = M3RefTypeface.brand; // 'Roboto'
final fontWeight = M3RefTypeface.labelWeight; // 500

// Base motion values
final shortDuration = M3RefDuration.short1; // 250ms
final standardCurve = M3MotionEasing.standard;
```

#### System Tokens

```dart
// Semantic color roles
Container(
  color: M3SysColor.primaryContainer,
  child: Text(
    'System color',
    style: TextStyle(color: M3SysColor.onPrimaryContainer),
  ),
)

// Dark theme colors
final darkScheme = M3SysColorDark.toColorScheme();
```

#### Component Tokens

```dart
// Button specifications
ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: Size.fromHeight(M3CompButton.heightMedium),
    padding: M3CompButton.paddingMedium,
    shape: RoundedRectangleBorder(
      borderRadius: M3CompButton.shapeMedium,
    ),
  ),
  onPressed: () {},
  child: const Text('Styled Button'),
)
```

### 🎯 Legacy Token Categories

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

### Shape & Radius

Define corner shapes using radius and shape tokens.

- **`M3Radius`**: Provides radius values from `none` (0dp) to `extraLarge` (28dp) and `full`.
- **`M3Shape`**: Provides `ShapeBorder` objects like `extraSmall`, `medium`, `large`, etc.

**Example:**

```dart
Container(
  decoration: ShapeDecoration(
    shape: M3Shape.medium, // 12dp corner radius
  ),
)
```

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

  - screen (16dp) for compact.

  - screenLarge (24dp) for medium/expanded/large/extra-large screens.

**Example:**

```dart
Container(
  margin: const EdgeInsets.symmetric(horizontal: M3Margin.mediumScreen),
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

## 🎨 Enhanced Material Design 3 Features

### 🎯 Complete Token System

#### Enhanced Typography

- **Responsive Scales**: Typography that adapts to screen size
- **Accessibility**: Support for high-contrast text and enhanced readability
- **Font Families**: Full support for Roboto and system fonts
- **Utilities**: Helper functions for manipulating text styles

```dart
// Responsive text that adapts to screen size
Text(
  'Responsive Title',
  style: M3TypeScale.responsiveDisplay(context),
)

// Text with enhanced readability for accessibility
Text(
  'Accessible Text',
  style: M3TypeScale.enhancedReadability(M3TypeScale.bodyLarge),
)

// Adaptive text that scales with user preferences
Text(
  'Adaptive Text',
  style: M3TypeScale.adaptive(
    baseStyle: M3TypeScale.bodyLarge,
    context: context,
  ),
)
```

#### Advanced Color System

- **Complete Color Roles**: Primary, Secondary, Tertiary, Error, Surface
- **Tonal Colors**: Complete system of surfaces with elevation
- **Color Utilities**: Manipulation, mixing, and contrast validation
- **Material You**: Support for dynamic color schemes

```dart
// Using pre-defined color roles
Container(
  color: M3ColorRoles.primaryContainer,
  child: Text(
    'Text in primary container',
    style: TextStyle(color: M3ColorRoles.onPrimaryContainer),
  ),
)

// Surface colors with elevation
Container(
  color: M3TonalColor.surface3(context), // 6dp elevation
  child: const Text('Elevated Surface'),
)

// Contrast check for accessibility
final hasGoodContrast = M3ColorUtils.meetsWCAGAA(
  foregroundColor,
  backgroundColor,
);
```

#### Advanced Elevation and Shadows

- **Contextual Elevation Levels**: Component-specific elevation
- **Interpolated Shadows**: Smooth transitions between levels
- **Interactive States**: Elevation for hover, pressed, focus
- **Elevation Animations**: Fluid transitions

```dart
// Contextual elevation by component
final cardElevation = M3Elevation.forComponent('card', state: 'hover');

// Interpolated shadows
final shadows = M3Shadow.fromElevation(4.5); // Interpolates between levels

// Container with animated elevation
AnimatedContainer(
  duration: M3MotionDuration.short4,
  decoration: BoxDecoration(
    color: M3TonalColor.surfaceAt(context, elevation),
    boxShadow: M3Shadow.fromElevation(elevation),
  ),
  child: child,
)
```

#### Motion and Animation System

- **Contextual Durations**: Appropriate duration by component type
- **Easing Curves**: Official M3 curves for different contexts
- **Animation Patterns**: Fade, slide, scale, and combined transitions
- **Motion Utilities**: Helpers for common animations

```dart
// Contextual duration
final duration = M3MotionUtils.durationForComponent('dialog', 'enter');

// Fade-in animation
M3MotionUtils.fadeIn(
  duration: M3MotionDuration.medium2,
  curve: M3MotionEasing.emphasizedDecelerate,
  child: myWidget,
)

// Combined slide and fade animation
M3MotionUtils.slideAndFade(
  slideOffset: const Offset(0, 30),
  child: myWidget,
)
```

### 🎛️ Integrated Theme System

#### Complete Theme Builder

- **Light/Dark Themes**: Full implementation with official M3 colors
- **High Contrast**: Automatic support for high contrast mode
- **Dynamic Themes**: Generation from a seed color
- **Flutter Integration**: Seamless conversion to ThemeData

```dart
// Light theme with a custom color
final lightTheme = M3Theme.light(
  seedColor: Colors.blue,
  visualDensity: VisualDensity.comfortable,
).toThemeData();

// High contrast theme
final highContrastTheme = M3Theme.light().toHighContrast().toThemeData();

// Usage in MaterialApp
MaterialApp(
  theme: lightTheme,
  darkTheme: M3Theme.dark().toThemeData(),
  home: MyApp(),
)
```

### ♿ Accessibility Features

#### Complete Accessibility Utilities

- **Minimum Touch Sizes**: Ensuring adequate targets
- **Color Contrast**: WCAG validation and automatic adjustment
- **Visible Focus**: Accessible focus indicators
- **Reduced Motion**: Support for motion preferences

```dart
// Accessible button with minimum target
M3Accessibility.accessibleButton(
  onPressed: () {},
  semanticLabel: 'Submit button',
  tooltip: 'Submits the form',
  child: const Text('Submit'),
)

// Accessible text field
M3Accessibility.accessibleTextField(
  label: 'Email',
  hint: 'Enter your email',
  required: true,
  keyboardType: TextInputType.emailAddress,
)

// Contrast check
final meetsStandards = M3Accessibility.meetsContrastRequirement(
  foreground: textColor,
  background: backgroundColor,
  useEnhanced: true, // WCAG AAA
);
```

### 📱 Adaptive Design

#### Responsive Layouts

- **M3 Breakpoints**: Official window class system
- **Adaptive Navigation**: Automatic navigation bar, rail, and drawer
- **Flexible Layouts**: Components that adapt to screen size
- **Input Detection**: Adaptation for touch vs. mouse

```dart
// Adaptive scaffold with automatic navigation
M3AdaptiveScaffold(
  destinations: navigationDestinations,
  selectedIndex: currentIndex,
  onDestinationSelected: onNavigation,
  body: content,
)

// Responsive layout
M3Adaptive.responsiveLayout(
  context: context,
  compact: mobileLayout,
  medium: tabletLayout,
  expanded: desktopLayout,
)

// Responsive values
final columns = M3Adaptive.responsiveValue<int>(
  context: context,
  compact: 1,
  medium: 2,
  expanded: 3,
);
```

#### Adaptive Dialogs and Sheets

- **Adaptive Dialogs**: Modal on desktop, fullscreen on mobile
- **Bottom/Side Sheets**: Automatic adaptation based on screen size
- **Contextual Animations**: Appropriate transitions for each platform

```dart
// Dialog that adapts to screen size
M3Adaptive.showAdaptiveDialog(
  context: context,
  title: 'Settings',
  content: settingsForm,
  actions: dialogActions,
);

// Adaptive sheet
M3Adaptive.showAdaptiveSheet(
  context: context,
  title: 'Options',
  child: optionsWidget,
);
```

## 📋 Implementation Status

### ✅ Fully Implemented Features

- **Typography**: Full scale + responsive and accessible utilities
- **Colors**: Complete role system + utilities + Material You
- **Elevation**: Contextual levels + interpolated shadows + animations
- **Motion**: Contextual durations + M3 curves + animation patterns
- **Shapes**: Full scale + families + responsive utilities
- **Spacing**: 4dp system + contextual margins + utilities
- **Breakpoints**: M3 window classes + responsive utilities
- **Borders**: Complete system + contextual utilities
- **Shadows**: Interpolated shadows + interactive states
- **Opacity**: Interaction states + utilities
- **Integrated Theme**: Complete M3Theme with conversion to ThemeData
- **Accessibility**: WCAG utilities + automatic configuration
- **Adaptive Design**: Responsive layouts + automatic navigation
- **Example Widgets**: Functional demonstrations of all features

## Example App

The included example app has been completely reorganized to follow Material Design 3's official structure:

### 📱 New Organized Structure

#### 🏗️ Foundations

- **Design Tokens**: Complete showcase of spacing, density, breakpoints, and other foundational tokens
- **Accessibility**: WCAG-compliant features, contrast validation, and touch targets
- **Adaptive Design**: Responsive breakpoints and adaptive navigation patterns

#### 🎨 Styles

- **Color System**: Full color roles, palettes, and tonal variations
- **Typography**: Complete type scale with responsive and accessible variations
- **Elevation**: Surface elevation with shadows and tonal colors
- **Shape**: Border radius system and shape families
- **Motion**: Animation patterns, durations, and easing curves

#### 🧩 Components

- **Component Showcase**: Buttons, cards, inputs, and navigation using M3 tokens
- **Enhanced Features**: Advanced implementations with accessibility and responsiveness

### 🎯 What You'll See

- **Token Organization**: Clear demonstration of ref/sys/comp token hierarchy
- **Practical Implementation**: Real components built with the new token structure
- **Interactive Examples**: Live demonstrations of all enhanced features
- **Responsive Design**: Adaptive layouts working across different screen sizes
- **Accessibility**: WCAG-compliant components in action

The example app now serves as both a comprehensive style guide and a practical implementation reference for Material Design 3.

### More Examples

[https://flutterweb-wasm.web.app/](https://flutterweb-wasm.web.app/)
