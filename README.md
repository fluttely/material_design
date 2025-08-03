# Material Design 3 for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/platform-flutter-blue)](https://flutter.dev)

🎨 **A complete Material Design 3 design system implementation for Flutter**

A comprehensive design system toolkit that brings Google's Material Design 3 specifications to Flutter through a carefully architected token system. This package provides production-ready design foundations, styles, and components following the official Material Design 3 guidelines.

## 🚀 Live Demo & Resources

**[🌟 Interactive Design System Explorer](https://fluttely.github.io/material_design/)** - Explore all tokens with live examples

**[📚 Material Design 3 Guidelines](https://m3.material.io/)** - Official specification

**[🎨 Design Tokens Spec](https://m3.material.io/foundations/design-tokens/overview)** - Understanding tokens

## ✨ Why Use This Package?

### For Design System Experts

- **Specification Compliance**: 100% aligned with Material Design 3 tokens
- **Token Architecture**: Properly structured design tokens hierarchy
- **System Consistency**: Enforced through compile-time constants
- **Design-Development Bridge**: Direct mapping from design tools to code

### For Flutter Developers

- **No Magic Numbers**: Replace `EdgeInsets.all(16)` with `M3Spacings.space16`
- **IntelliSense Support**: Discover available options as you type
- **Zero Learning Curve**: Uses familiar Flutter patterns
- **Maintainable Code**: Update design system values in one place

## 📦 Installation

```yaml
dependencies:
  material_design: ^0.20.2
```

```bash
flutter pub add material_design
```

## 🎯 Quick Start

```dart
import 'package:material_design/material_design.dart';

// Using design tokens in your widgets
Container(
  padding: const EdgeInsets.all(M3Spacings.space16),  // Spacing token
  decoration: const BoxDecoration(
    borderRadius: M3BorderRadii.medium,               // Shape style token
    boxShadow: M3Shadows.level3,                     // Elevation style
  ),
  child: const Text(
    'Hello Material 3',
    style: M3TextStyles.headlineMedium,              // Typography style
  ),
),
```

## 📐 Design Foundations

### Understanding Token Hierarchy

Material Design 3 organizes design decisions into a clear hierarchy:

#### 1. **Atomic Tokens** (Raw Values)

The smallest units of design decisions:

```dart
// Raw spacing values (4dp grid)
M3Spacings.space4   // 4.0
M3Spacings.space8   // 8.0
M3Spacings.space16  // 16.0

// Raw corner values
M3Corners.small   // 8.0
M3Corners.medium  // 12.0
M3Corners.large   // 16.0
```

#### 2. **Composite Tokens** (Applied Values)

Combinations of atomic tokens:

```dart
// Border radius (applies radius to all corners)
M3BorderRadii.medium  // BorderRadius.circular(12)

// Complete borders
M3Borders.thin  // Border with 1dp width
```

#### 3. **Style Tokens** (Design Decisions)

Higher-level design applications:

```dart
// Elevation creates both shadow and surface tint
M3Shadows.level3      // Elevation level 3 shadows
M3Elevations.level3   // Elevation level 3 value

// Motion combines duration and easing
M3Motions.emphasized  // 500ms with emphasized easing
```

### Spacing Foundation

Material Design 3 uses a **4dp grid system** for consistent spatial relationships:

```dart
// Spacing scale (multiples of 4dp)
Padding(
  padding: const EdgeInsets.all(M3Spacings.space16),    // 16dp
  child: Column(
    children: [
      Text('Title'),
      SizedBox(height: M3Spacings.space8),              // 8dp
      Text('Subtitle'),
    ],
  ),
)

// Responsive margins based on screen size
Container(
  margin: EdgeInsets.symmetric(
    horizontal: M3Margins.compactScreen,  // 16dp on mobile
  ),
)
```

### Shape System

The shape system provides three levels of abstraction:

```dart
// Level 1: Raw radius values (Radius objects)
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: M3Radii.large,
      topRight: M3Radii.large,
    ),
  ),
)

// Level 2: Border radius (all corners)
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadii.medium,
  ),
)

// Level 3: Complete shapes (for Material widgets)
Card(
  shape: M3Shapes.medium,
  child: content,
)
```

### Motion Foundation

Motion tokens ensure consistent animation behavior:

```dart
// Standard transitions
AnimatedContainer(
  duration: M3MotionDurations.medium,      // 300ms
  curve: M3MotionCurves.emphasized,       // Emphasized easing
  // ...
)

// Complete motion specifications
AnimatedOpacity(
  duration: M3Motions.standard.duration,  // 300ms
  curve: M3Motions.standard.curve,        // Standard easing
  opacity: isVisible ? 1.0 : 0.0,
)
```

### Elevation System

Elevation in Material Design 3 combines shadows and surface tint:

```dart
// Using elevation values
Material(
  elevation: M3Elevations.level2,  // 3.0dp elevation
  child: content,
)

// Using shadow tokens directly
Container(
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.surface,
    boxShadow: M3Shadows.level3,  // Level 3 shadow list
  ),
)
```

## 💻 Real-World Examples

### Building a Consistent Card Component

```dart
class DesignSystemCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const DesignSystemCard({
    required this.child,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // Shape style token
      borderRadius: M3BorderRadii.medium,
      // Elevation token
      elevation: M3Elevations.level1,
      child: InkWell(
        onTap: onTap,
        borderRadius: M3BorderRadii.medium,
        child: Padding(
          // Spacing foundation token
          padding: const EdgeInsets.all(M3Spacings.space16),
          child: child,
        ),
      ),
    );
  }
}
```

### Responsive Layout with Design Tokens

```dart
class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Use breakpoint tokens for responsive design
    final isCompact = screenWidth < M3Breakpoints.compact;
    final padding = isCompact
        ? M3Spacings.space16
        : M3Spacings.space24;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          spacing: M3Spacings.space16,  // Consistent spacing
          children: [
            // Header with typography scale
            Text(
              'Design System Demo',
              style: M3TextStyles.headlineLarge,
            ),
            // Content with proper margins
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: M3Margins.getMargin(context),
              ),
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🎨 Design Token Philosophy

### Why Design Tokens Matter

1. **Single Source of Truth**: Change a value once, update everywhere
2. **Design-Dev Alignment**: Same language between designers and developers
3. **Consistency**: Enforced through the type system
4. **Scalability**: Easy to maintain and extend
5. **Documentation**: Self-documenting code through meaningful names

### Token Naming Convention

Our tokens follow Material Design 3's semantic naming:

```
M3[Category][Subcategory].descriptor
```

Examples:

- `M3Spacings.space16` - 16dp from spacing category
- `M3BorderRadii.medium` - Medium border radius
- `M3Shadows.level3` - Level 3 elevation shadow

## ⚡ Performance Considerations

- **Compile-time Constants**: All tokens are const values
- **Tree-shaking**: Only included tokens are bundled
- **Zero Runtime Overhead**: No performance penalty
- **Hot Reload Compatible**: Instant design updates

## 🔄 Migration Guide

### From Magic Numbers

```dart
// Before: Magic numbers everywhere
Container(
  padding: const EdgeInsets.all(16.0),
  margin: const EdgeInsets.symmetric(horizontal: 24.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
  ),
)

// After: Self-documenting design tokens
Container(
  padding: const EdgeInsets.all(M3Spacings.space16),
  margin: const EdgeInsets.symmetric(horizontal: M3Spacings.space24),
  decoration: BoxDecoration(
    borderRadius: M3BorderRadii.medium,
  ),
)
```

### From Custom Design Systems

If you have an existing design system, map your values to Material Design 3 tokens:

```dart
// Your old system
class AppSpacing {
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
}

// Migration mapping
class AppSpacing {
  static const double small = M3Spacings.space8;
  static const double medium = M3Spacings.space16;
  static const double large = M3Spacings.space24;
}
```

## 📊 Complete Token Reference

### Foundation Tokens

| Category           | Constants Class     | Purpose                      | Example Values                    |
| ------------------ | ------------------- | ---------------------------- | --------------------------------- |
| **Spacing**        | `M3Spacings`        | 4dp grid system              | 0, 2, 4, 8, 12, 16, 24, 32, 48dp  |
| **Margin**         | `M3Margins`         | Responsive container margins | 16dp, 24dp, 32dp, 40dp, 48dp      |
| **Spacer**         | `M3Spacers`         | Pre-built spacer widgets     | horizontal/vertical spacers       |
| **Motion**         | `M3MotionDurations` | Animation timing             | 50ms, 100ms, 300ms, 500ms, 1000ms |
| **Motion Curve**   | `M3MotionCurves`    | Animation easing curves      | emphasized, standard, linear      |
| **Motion**         | `M3Motions`         | Combined duration + curve    | emphasized, standard, linear      |
| **Breakpoint**     | `M3Breakpoints`     | Responsive breakpoints       | 0, 600, 840, 1200, 1600dp         |
| **Opacity**        | `M3Opacities`       | General transparency values  | 0.04, 0.08, 0.12, 0.38, 0.87      |
| **Visual Density** | `M3VisualDensities` | UI density configurations    | -3, -2, -1, 0, comfortable        |
| **Z-Index**        | `M3ZIndexes`        | Stacking order values        | -1, 0, 10, 100, 1000, 9999        |

### Style Tokens

| Category          | Constants Class         | Purpose                        | Use Case                      |
| ----------------- | ----------------------- | ------------------------------ | ----------------------------- |
| **Radius**        | `M3Radii`               | Individual corner radius       | Corner rounding primitives    |
| **Border Radius** | `M3BorderRadii`         | Complete border radius         | Container corner rounding     |
| **Shape**         | `M3Shapes`              | Component border shapes        | Cards, buttons, dialogs       |
| **Border Width**  | `M3BorderWidths`        | Border thickness values        | 0dp, 1dp, 2dp, 4dp            |
| **Border Side**   | `M3BorderSides`         | Individual border sides        | Border configurations         |
| **Border**        | `M3Borders`             | Complete border specifications | Outlined components           |
| **Elevation**     | `M3Elevations`          | Surface elevation levels       | 0dp, 1dp, 3dp, 6dp, 8dp, 12dp |
| **Shadow**        | `M3Shadows`             | Box shadow configurations      | Elevated surface shadows      |
| **State Layer**   | `M3StateLayerOpacities` | Interactive state overlays     | Hover, focus, pressed states  |

### Typography Tokens

| Category       | Constants Class | Purpose                   | Example Scales                 |
| -------------- | --------------- | ------------------------- | ------------------------------ |
| **Text Style** | `M3TextStyles`  | Complete typography scale | Display, Headline, Body, Label |

### Component Support Tokens

| Category      | Constants Class | Purpose                      | Example Values               |
| ------------- | --------------- | ---------------------------- | ---------------------------- |
| **Icon Size** | `M3IconSizes`   | Standardized icon dimensions | 18dp, 24dp, 36dp, 40dp, 48dp |

### Utility Classes

| Category          | Class Name                | Purpose                       | Usage                          |
| ----------------- | ------------------------- | ----------------------------- | ------------------------------ |
| **EdgeInsets**    | `M3EdgeInsets`            | Type-safe padding/margin      | Enforces spacing tokens        |
| **EdgeInsets**    | `M3EdgeInsetsDirectional` | Directional padding/margin    | RTL-aware spacing              |
| **Padding**       | `M3Padding`               | Pre-configured padding widget | Consistent padding application |
| **Gap**           | `M3Gap`                   | Spacing between flex children | Row/Column spacing             |
| **Sliver**        | `M3Sliver`                | Sliver spacing utilities      | CustomScrollView spacing       |
| **BorderRadius**  | `M3BorderRadius`          | Type-safe border radius       | Enforces radius tokens         |
| **Border**        | `M3Border`                | Type-safe border creation     | Enforces border tokens         |
| **BoxDecoration** | `M3BoxDecoration`         | Type-safe box decoration      | Enforces all style tokens      |

### Dynamic Tokens

| Category         | Class Name        | Purpose                | Behavior                          |
| ---------------- | ----------------- | ---------------------- | --------------------------------- |
| **Surface Tint** | `M3SurfaceTint`\* | Dynamic surface colors | Calculated from theme + elevation |

\*Note: Surface tint values are calculated dynamically based on the current theme and elevation level.

### Responsive Utilities

| Category       | Class Name               | Purpose                      | Features                        |
| -------------- | ------------------------ | ---------------------------- | ------------------------------- |
| **Builder**    | `M3ResponsiveBuilder`    | Responsive widget builder    | Rebuilds on size class change   |
| **Value**      | `M3ResponsiveValue`      | Responsive value selection   | Different values per breakpoint |
| **Visibility** | `M3ResponsiveVisibility` | Conditional visibility       | Show/hide based on screen size  |
| **Grid**       | `M3ResponsiveGrid`       | Responsive grid layout       | Adaptive columns and spacing    |
| **Scaffold**   | `M3ResponsiveScaffold`   | Adaptive navigation scaffold | Bottom nav → Rail → Drawer      |

### Helper Classes

| Category        | Class Name               | Purpose                      | Usage                           |
| --------------- | ------------------------ | ---------------------------- | ------------------------------- |
| **Screen Size** | `M3ScreenSize`           | Window size classification   | Compact, Medium, Expanded, etc. |
| **Grid Config** | `M3ResponsiveGridConfig` | Grid layout configuration    | Columns, gutters, margins       |
| **Navigation**  | `M3ResponsiveNavigation` | Navigation pattern selection | Determines nav type by size     |

## 🎯 What is a Design System?

A **design system** is a collection of reusable standards and guidelines that ensure consistency across digital products. It includes:

- **Design Tokens**: The atomic values of your design system (colors, spacing, typography)
- **Foundations**: Core design principles (layout, motion, interaction patterns)
- **Styles**: Applied design decisions (elevation, shape, typography scales)
- **Components**: Reusable UI elements built from tokens and styles

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
- [Design Tokens W3C Spec](https://www.w3.org/community/design-tokens/)
- [Google's Design System Guide](https://design.google/library/design-system-governance/)

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
