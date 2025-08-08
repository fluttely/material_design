# Material Design 3 for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue)](https://flutter.dev)

🎨 **A complete Material Design 3 design system implementation for Flutter**

A comprehensive design system toolkit that brings Google's Material Design 3 specifications to Flutter through a carefully architected token system. This package provides production-ready design foundations, styles, and components following the official Material Design 3 guidelines.

## 🚀 Live Demo & Resources

**[🌟 Interactive Design System Explorer](https://fluttely.github.io/material_design/)** - Explore all tokens with live examples

**[📚 Material Design 3 Guidelines](https://m3.material.io/)** - Official specification

**[🎨 Design Tokens Spec](https://m3.material.io/foundations/design-tokens/overview)** - Understanding tokens

## ⚡ Why Use This Package?

### Key Benefits

✅ **No magic numbers** - Replace `padding: 16.0` with `padding: M3Spacings.space16`  
✅ **IntelliSense support** - IDE suggests options as you type  
✅ **100% const when possible** - Best performance  
✅ **Easy maintenance** - Update values in one place  
✅ **Self-documenting code** - Descriptive names explain intent

## 📦 Installation

```yaml
dependencies:
  material_design: ^0.27.0
```

```bash
flutter pub add material_design
```

## 🎯 Quick Start

```dart
import 'package:material_design/material_design.dart';

// Simple example using const tokens
Container(
  padding: const EdgeInsets.all(M3Spacings.space16),  // ✅ CONST - 16dp
  decoration: const BoxDecoration(
    borderRadius: M3BorderRadius.medium,              // ✅ CONST - medium radius
    boxShadow: M3ElevationShadows.level3,                      // ✅ CONST - level 3 shadow
  ),
  child: const Text(
    'Hello Material 3',
    style: M3TextStyle.headlineMedium,                // ✅ CONST - headline style
  ),
),
```

## 📐 Understanding Const vs Non-Const

### 🟢 CONST Tokens (Compile-time)

Fixed values that are defined at compile time. **Use these whenever possible for best performance!**

```dart
// ✅ All of these are CONST and can be used with 'const' keyword:
const spacing = M3Spacings.space16;         // 16dp
const radius = M3BorderRadius.medium;       // Medium BorderRadius
const shadow = M3ElevationShadows.level3;            // Shadow list
const textStyle = M3TextStyle.bodyLarge;    // Text style
const duration = M3MotionDuration.medium1;  // 300ms
const curve = M3MotionCurve.emphasized;     // Animation curve
```

### 🔵 NON-CONST Tokens (Runtime)

Values that depend on context or are calculated at runtime.

```dart
// ❌ These are NOT const:

// Enums return values at runtime
final spacing = M3SpacingToken.space16.value;       // 16dp (via enum)
final elevation = M3Elevation.level3.dp;    // 6dp (via enum)

// Values that depend on context/theme
final surfaceColor = M3SurfaceTint.fromElevation(
  context,                                          // Needs context
  M3ElevationDps.level3,
);

// Responsive values that change with screen size
final margin = M3Margins.getMargin(context);        // Varies: 16dp | 24dp
```

## 📊 Complete Token and Utility Reference

### Design Tokens

These are constant values that form the foundation of your design system, ensuring consistency across spacing, colors, typography, and more.

#### 🟢 CONST Design Tokens

Use these with `const` keyword for best performance:

| Group                  | Token           | Class (const)           | Purpose                                | Example Values                                                                                                                                                                                                                                                                                                 | How to Use                                                         |
| :--------------------- | :-------------- | :---------------------- | :------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------- |
| **Layout & Spacing**   | Spacing         | `M3Spacings`            | 4dp grid system for consistent spacing | `space0` (0dp), `space2` (2dp), `space4` (4dp), `space8` (8dp), `space12` (12dp), `space16` (16dp), `space24` (24dp), `space32` (32dp), `space48` (48dp)                                                                                                                                                       | `const EdgeInsets.all(M3Spacings.space16)`                         |
|                        | Margin          | `M3Margins`             | Responsive container margins           | `compactScreen` (16dp), `mediumScreen` (24dp), `expandedScreen` (32dp), `largeScreen` (40dp), `extraLargeScreen` (48dp)                                                                                                                                                                                        | `const EdgeInsets.symmetric(horizontal: M3Margins.compactScreen)`  |
|                        | Spacer          | `M3Spacers`             | Pre-built spacer widgets               | `horizontal4`, `horizontal8`, `horizontal16`, `vertical4`, `vertical8`, `vertical16`, etc.                                                                                                                                                                                                                     | `M3Spacers.horizontal16`                                           |
|                        | Icon Size       | `M3IconSizes`           | Standardized icon dimensions           | `extraSmall` (18dp), `small` (20dp), `medium` (24dp), `large` (36dp), `extraLarge` (40dp), `huge` (48dp)                                                                                                                                                                                                       | `Icon(Icons.star, size: M3IconSizes.medium)`                       |
|                        | Visual Density  | `M3VisualDensity`       | UI density configurations              | `minimumDensity` (-3), `compactDensity` (-2), `standardDensity` (0), `comfortableDensity` (0)                                                                                                                                                                                                                  | `VisualDensity(horizontal: M3VisualDensity.standardDensity)`       |
|                        | Z-Index         | `M3ZIndexes`            | Values for layer stacking order        | `behind` (-1), `base` (0), `dropdown` (10), `sticky` (100), `modal` (1000), `tooltip` (9999)                                                                                                                                                                                                                   | `Positioned(child: widget, zIndex: M3ZIndexes.modal)`              |
| **Responsive**         | Breakpoint      | `M3Breakpoints`         | Breakpoints for responsive design      | `compact` (0dp), `medium` (600dp), `expanded` (840dp), `large` (1200dp), `extraLarge` (1600dp)                                                                                                                                                                                                                 | `if (width > M3Breakpoints.medium) ...`                            |
| **Motion & Animation** | Motion Duration | `M3MotionDuration`      | Duration for animations                | `short1` (50ms), `short2` (100ms), `short3` (150ms), `short4` (200ms), `medium1` (250ms), `medium2` (300ms), `medium3` (350ms), `medium4` (400ms), `long1` (450ms), `long2` (500ms), `long3` (550ms), `long4` (600ms), `extraLong1` (700ms), `extraLong2` (800ms), `extraLong3` (900ms), `extraLong4` (1000ms) | `AnimatedContainer(duration: M3MotionDuration.medium1)`            |
|                        | Motion Curve    | `M3MotionCurve`         | Easing curves for animations           | `emphasized`, `emphasizedAccelerate`, `emphasizedDecelerate`, `standard`, `standardAccelerate`, `standardDecelerate`, `linear`                                                                                                                                                                                 | `AnimatedContainer(curve: M3MotionCurve.emphasized)`               |
|                        | Motion          | `M3Motion`              | Combined duration + curve settings     | `emphasized`, `emphasizedIncoming`, `emphasizedOutgoing`, `standard`, `standardIncoming`, `standardOutgoing`, `linear`                                                                                                                                                                                         | See non-const section                                              |
| **Color & Opacity**    | Opacity         | `M3Opacities`           | General transparency values            | `opacity4` (0.04), `opacity8` (0.08), `opacity12` (0.12), `opacity16` (0.16), `opacity38` (0.38), `opacity54` (0.54), `opacity87` (0.87)                                                                                                                                                                       | `Opacity(opacity: M3Opacities.opacity38)`                          |
|                        | State Layer     | `M3StateLayerOpacities` | Overlays for interactive states        | `hover` (0.08), `focus` (0.12), `pressed` (0.12), `dragged` (0.16)                                                                                                                                                                                                                                             | `Container(color: color.withOpacity(M3StateLayerOpacities.hover))` |
| **Shape & Border**     | Corner          | `M3Corners`             | Individual corner values               | `none` (0dp), `extraSmall` (4dp), `small` (8dp), `medium` (12dp), `large` (16dp), `extraLarge` (28dp), `full` (circular)                                                                                                                                                                                       | `Radius.circular(M3Corners.medium)`                                |
|                        | Radius          | `M3Radius`              | Individual corner radius values        | `none`, `extraSmall`, `small`, `medium`, `large`, `extraLarge`, `circular`                                                                                                                                                                                                                                     | `M3Radius.medium`                                                  |
|                        | Border Radius   | `M3BorderRadius`        | Complete border radius for containers  | `none`, `extraSmall`, `small`, `medium`, `large`, `extraLarge`, `full`                                                                                                                                                                                                                                         | `BoxDecoration(borderRadius: M3BorderRadius.medium)`               |
|                        | Shape           | `M3Shape`               | Border shapes for components           | `none`, `extraSmall`, `small`, `medium`, `large`, `extraLarge`, `full`                                                                                                                                                                                                                                         | `Card(shape: M3Shape.medium)`                                      |
|                        | Border Width    | `M3BorderWidths`        | Border thickness values                | `none` (0dp), `thin` (1dp), `medium` (2dp), `thick` (4dp)                                                                                                                                                                                                                                                      | `Border.all(width: M3BorderWidths.thin)`                           |
|                        | Border Side     | `M3BorderSide`          | Individual border sides                | Pre-configured border side configurations                                                                                                                                                                                                                                                                      | `M3BorderSide.thin(color)`                                         |
|                        | Border          | `M3Border`              | Complete border specifications         | Pre-configured borders                                                                                                                                                                                                                                                                                         | `M3Border.all(color: Colors.grey)`                                 |
| **Elevation & Shadow** | Elevation DP    | `M3ElevationDps`        | Surface elevation values in dp         | `level0` (0dp), `level1` (1dp), `level2` (3dp), `level3` (6dp), `level4` (8dp), `level5` (12dp)                                                                                                                                                                                                                | `Material(elevation: M3ElevationDps.level3)`                       |
|                        | Shadow          | `M3ElevationShadows`    | Box shadow configurations              | `level0`, `level1`, `level2`, `level3`, `level4`, `level5`                                                                                                                                                                                                                                                     | `BoxDecoration(boxShadow: M3ElevationShadows.level3)`              |
|                        | Elevation       | `M3Elevation`           | Complete elevation (dp + shadows)      | `level0`, `level1`, `level2`, `level3`, `level4`, `level5` - each contains both dp value and shadow list                                                                                                                                                                                                       | `M3Elevation.level3` (access `.dp` and `.shadows` properties)      |
| **Typography**         | Text Style      | `M3TextStyle`           | Complete typography scale              | `displayLarge`, `displayMedium`, `displaySmall`, `headlineLarge`, `headlineMedium`, `headlineSmall`, `titleLarge`, `titleMedium`, `titleSmall`, `bodyLarge`, `bodyMedium`, `bodySmall`, `labelLarge`, `labelMedium`, `labelSmall`                                                                              | `Text('Hello', style: M3TextStyle.bodyLarge)`                      |

#### 🔵 NON-CONST Tokens (Enums and Functions)

Use these WITHOUT `const` keyword - values calculated at runtime:

| Group                  | Token           | Enum/Function                                                             | Why it's not const                   | How to Use                                                                                                                                               |
| :--------------------- | :-------------- | :------------------------------------------------------------------------ | :----------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Layout & Spacing**   | Spacing         | `M3SpacingToken`                                                          | Enum returns value via getter        | `final space = M3SpacingToken.space16.value;`                                                                                                            |
|                        | Margin          | `M3MarginToken`                                                           | Enum returns value via getter        | `final margin = M3MarginToken.compactScreen.value;`                                                                                                      |
|                        | Spacer          | `M3SpacerToken`                                                           | Enum returns widget via getter       | `M3SpacerToken.horizontal16.spacer`                                                                                                                      |
|                        | Icon Size       | `M3IconSizeToken`                                                         | Enum returns value via getter        | `final size = M3IconSizeToken.medium.value;`                                                                                                             |
|                        | Z-Index         | `M3ZIndexToken`                                                           | Enum returns value via getter        | `final zIndex = M3ZIndexToken.modal.value;`                                                                                                              |
| **Responsive**         | Breakpoint      | `M3BreakpointToken`                                                       | Enum returns value via getter        | `final breakpoint = M3BreakpointToken.medium.value;`                                                                                                     |
|                        | Margin (method) | `M3Margins.getMargin()`                                                   | Varies with screen size              | `final margin = M3Margins.getMargin(context);`                                                                                                           |
| **Motion & Animation** | Motion          | ` M3Motion.x.duration` `M3Motion.x.curve`                                 | Object with duration and curve props | `final motion = M3Motion.emphasized;`<br>`duration: motion.duration,`<br>`curve: motion.curve,`                                                          |
| **Color & Opacity**    | Opacity         | `M3OpacityToken`                                                          | Enum returns value via getter        | `final opacity = M3OpacityToken.opacity38.value;`                                                                                                        |
|                        | State Layer     | `M3StateLayerOpacityToken`                                                | Enum returns value via getter        | `final opacity = M3StateLayerOpacityToken.hover.value;`                                                                                                  |
|                        | Surface Tint    | `M3SurfaceTint.fromElevation()`                                           | Depends on theme/context             | `final color = M3SurfaceTint.fromElevation(context, M3ElevationDps.level3);`                                                                             |
| **Shape & Border**     | Corner          | `M3CornerToken`                                                           | Enum returns value via getter        | `final corner = M3CornerToken.medium.value;`                                                                                                             |
|                        | Border Width    | `M3BorderWidthToken`                                                      | Enum returns value via getter        | `final width = M3BorderWidthToken.thin.value;`                                                                                                           |
| **Elevation & Shadow** | Elevation       | `M3Elevation.x.dp` `M3Elevation.x.shadows` `M3Elevation.x.surfaceColor()` | Enum with multiple getters           | `final elev = M3Elevation.level3.value;`<br>`final shadows = M3Elevation.level3.shadows;`<br>`final surface = M3Elevation.level3.surfaceColor(context);` |

### Utility & Helper Classes

These are classes that help apply design tokens in a type-safe and responsive way.

| Group                   | Utility / Class          | Purpose                                    | Common Use Case                         |
| :---------------------- | :----------------------- | :----------------------------------------- | :-------------------------------------- |
| **Layout Helpers**      | `M3EdgeInsets`           | Type-safe padding/margin                   | Enforces use of spacing tokens          |
|                         | `M3Padding`              | Pre-configured padding widget              | Consistent padding application          |
|                         | `M3Gap`                  | Spacing between flex children (Row/Column) | `Row`/`Column` spacing                  |
| **Decoration Helpers**  | `M3BoxDecoration`        | Type-safe box decoration                   | Enforces use of all style tokens        |
|                         | `M3ShapeDecoration`      | Type-safe shape decoration                 | Enforces use of all style tokens        |
| **Responsive Builders** | `M3ResponsiveBuilder`    | Responsive widget builder                  | Rebuilds on screen size class change    |
|                         | `M3ResponsiveValue`      | Responsive value selection                 | Defines different values per breakpoint |
|                         | `M3ResponsiveVisibility` | Conditional visibility                     | Shows/hides based on screen size        |
|                         | `M3ResponsiveGrid`       | Responsive grid layout                     | Adaptive columns and spacing            |
|                         | `M3ResponsiveScaffold`   | Adaptive navigation scaffold               | Bottom nav → Rail → Drawer              |
| **Responsive Logic**    | `M3ScreenSize`           | Window size classification                 | Compact, Medium, Expanded, etc.         |
|                         | `M3ResponsiveGridConfig` | Grid layout configuration                  | Columns, gutters, margins               |
|                         | `M3ResponsiveNavigation` | Navigation pattern selection               | Determines nav type by size             |

## 💡 Practical Examples

### ✅ CORRECT Example - Using const when possible

```dart
class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ✅ Everything here is CONST - great performance!
      padding: const EdgeInsets.all(M3Spacings.space16),
      margin: const EdgeInsets.symmetric(
        horizontal: M3Margins.compactScreen,
      ),
      decoration: const BoxDecoration(
        borderRadius: M3BorderRadius.medium,
        boxShadow: M3ElevationShadows.level3,
      ),
      child: const Text(
        'Card with const tokens',
        style: M3TextStyle.bodyLarge,
      ),
    );
  }
}
```

### ❌ INCORRECT Example - Trying to use const with runtime values

```dart
class MyWrongCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ❌ ERROR! M3SpacingToken.space16.value is not const
      padding: const EdgeInsets.all(M3SpacingToken.space16.value),

      decoration: BoxDecoration(
        // ❌ ERROR! fromElevation needs context, can't be const
        color: const M3SurfaceTint.fromElevation(context, M3ElevationDps.level3),
      ),
    );
  }
}
```

### 🔄 Mixed Example - Const and Runtime together

```dart
class ResponsiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 🔵 Runtime - responsive value based on screen size
    final margin = M3Margins.getMargin(context);

    // 🔵 Runtime - color that depends on theme
    final surfaceColor = M3SurfaceTint.fromElevation(
      context,
      M3ElevationDps.level2,
    );

    return Container(
      // 🔵 Runtime - uses calculated variable
      margin: EdgeInsets.symmetric(horizontal: margin),

      // 🟢 Const - fixed values
      padding: const EdgeInsets.all(M3Spacings.space16),

      decoration: BoxDecoration(
        // 🔵 Runtime - theme color
        color: surfaceColor,

        // 🟢 Const - fixed values
        borderRadius: M3BorderRadius.medium,
        boxShadow: M3ElevationShadows.level2,
      ),

      // 🟢 Const - fixed widget and style
      child: const Text(
        'Responsive Card',
        style: M3TextStyle.headlineSmall,
      ),
    );
  }
}
```

## 🎯 What is a Design System?

A **design system** is a collection of reusable standards and guidelines that ensure consistency across digital products. It includes:

- **Design Tokens**: The atomic values of your design system (colors, spacing, typography)
- **Foundations**: Core design principles (layout, motion, interaction patterns)
- **Styles**: Applied design decisions (elevation, shape, typography scales)
- **Components**: Reusable UI elements built from tokens and styles

## 🎯 Token Hierarchy

### 1️⃣ Atomic Tokens (Raw Values)

The smallest building blocks:

```dart
// 🟢 CONST - Spacing values (4dp grid)
const space = M3Spacings.space12;  // 12dp

// 🔵 NON-CONST - Via enum
final space = M3SpacingToken.space12.value;  // 12dp
```

### 2️⃣ Composite Tokens (Applied Values)

Combinations of atomic tokens:

```dart
// 🟢 CONST - Complete BorderRadius
const radius = M3BorderRadius.medium;  // Applies 12dp to all corners

// 🟢 CONST - Complete Shape for Material widgets
const shape = M3Shape.medium;  // RoundedRectangleBorder with medium radius
```

### 3️⃣ Style Tokens (Design Decisions)

High-level applications:

```dart
// 🟢 CONST - Elevation creates shadow and tint
const elevation = M3ElevationDps.level3;  // 6dp
const shadows = M3ElevationShadows.level3;       // Shadow list for 6dp

// 🔵 NON-CONST - Color calculated based on theme
final tintColor = M3SurfaceTint.fromElevation(context, elevation);
```

## 🎨 Design Token Philosophy

### Why Design Tokens Matter

1. **Single source of truth** - Change once, update everywhere
2. **No magic numbers** - `space16` is clearer than `16.0`
3. **Consistency guaranteed** - Type system enforces correct usage
4. **Easy maintenance** - Global adjustments in one place
5. **Self-documenting code** - Names explain intent

### Token Naming Convention

Our tokens follow Material Design 3's semantic naming:

```
M3[Category][Subcategory].descriptor
```

Examples:

- `M3Spacings.space16` - 16dp from spacing category
- `M3BorderRadius.medium` - Medium border radius
- `M3ElevationShadows.level3` - Level 3 elevation shadow

## 🚀 Performance Considerations

- **Compile-time Constants**: All tokens are const values when possible
- **Tree-shaking**: Only included tokens are bundled
- **Zero Runtime Overhead**: No performance penalty for const tokens
- **Hot Reload Compatible**: Instant design updates

### Advantages of using CONST

```dart
// ✅ BETTER - Const widget, recreated only when necessary
const Padding(
  padding: EdgeInsets.all(M3Spacings.space16),
  child: Text('Text'),
);

// ❌ WORSE - Widget recreated on every build
Padding(
  padding: EdgeInsets.all(16.0),  // Magic number
  child: Text('Text'),
);
```

## 🔄 Migration Guide

### From Magic Numbers

```dart
// Before: Magic numbers everywhere
Container(
  padding: const EdgeInsets.all(16.0),
  margin: const EdgeInsets.symmetric(horizontal: 24.0),
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
)

// After: Self-documenting design tokens
Container(
  padding: const EdgeInsets.all(M3Spacings.space16),
  margin: const EdgeInsets.symmetric(horizontal: M3Margins.mediumScreen),
  decoration: const BoxDecoration(borderRadius: M3BorderRadius.medium),
)
```

### From Custom Design Systems

If you have an existing design system, map your values to Material Design 3 tokens:

```dart
// Your old system
class AppSpacings {
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
}

// Migration mapping
class AppSpacings {
  static const double small = M3Spacings.space8;
  static const double medium = M3Spacings.space16;
  static const double large = M3Spacings.space24;
}
```

## 🤝 Contributing

We welcome contributions from both design system experts and Flutter developers!

### Areas for Contribution

- Additional composite tokens
- Component implementations
- Documentation improvements
- Example applications
- Design tool integrations

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📚 Further Reading

- [Material Design 3 Specification](https://m3.material.io/)
- [Google's Design System Guide](https://design.google/)
- [Design Tokens Community Group](https://www.designtokens.org/)

## 📄 License

This project is licensed under the BSD License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Google Material Design Team for the M3 specification
- Flutter Team for the excellent framework
- Design Tokens Community Group for standardization efforts
- All our [contributors](https://github.com/fluttely/material_design/graphs/contributors)

---

<p align="center">
  <strong>Building consistent, beautiful Flutter apps with Material Design 3</strong>
</p>
