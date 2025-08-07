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

## ✨ Why Use This Package?

### For Design System Experts

- **Specification Compliance**: 100% aligned with Material Design 3 tokens
- **Token Architecture**: Properly structured design tokens hierarchy
- **System Consistency**: Enforced through compile-time constants
- **Design-Development Bridge**: Direct mapping from design tools to code

### For Flutter Developers

- **No Magic Numbers**: Replace `EdgeInsets.all(16)` with `EdgeInsets.all(M3Spacings.space16)`
- **IntelliSense Support**: Discover available options as you type
- **Zero Learning Curve**: Uses familiar Flutter patterns
- **Maintainable Code**: Update design system values in one place

## 📦 Installation

```yaml
dependencies:
  material_design: ^0.26.1
```

```bash
flutter pub add material_design
```

## 🎯 Quick Start

```dart
import 'package:material_design/material_design.dart';

// Using design tokens in your widgets
Container(
  padding: const EdgeInsets.all(M3Spacings.space16), // Spacing token
  decoration: const BoxDecoration(
    borderRadius: M3BorderRadius.medium, // Shape style token
    boxShadow: M3Shadows.level5, // Elevation style
  ),
  child: const Text(
    'Hello Material 3',
    style: M3TextStyle.headlineMedium, // Typography style
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
const M3Spacings.space4   // 4dp
const M3Spacings.space8   // 8dp
const M3Spacings.space12  // 12dp
// OR
M3SpacingToken.space12.value // 12dp (not const)

// Raw corner values
const M3Corners.small   // 8dp
const M3Corners.medium  // 12dp
const M3Corners.large   // 16dp
// OR
M3CornerToken.large.value // 16dp (not const)
```

#### 2. **Composite Tokens** (Applied Values)

Combinations of atomic tokens:

```dart
// Complete border radius logic (applies radius to all corners)
const M3Shape(borderRadius: M3BorderRadius.all(M3Radius.circular(M3CornerToken.medium)))
// OR
const M3Shape(borderRadius: M3BorderRadius.all(M3Radius.medium))
// OR
const M3Shape(borderRadius: M3BorderRadius.medium)
// OR
const M3Shape.medium

// Complete borders
final outlineColor = Theme.of(context).colorScheme.outline;
// OR
M3Border.fromBorderSide(M3BorderSide(outlineColor: outlineColor, width: M3BorderWidthToken.thin))
// OR
M3Border.fromBorderSide(M3BorderSide.thin(outlineColor))
// OR
M3Border.all(outlineColor: outlineColor, width: M3BorderWidthToken.thin)
// OR
M3Border.thin(outlineColor)
```

#### 3. **Style Tokens** (Design Decisions)

Higher-level design applications:

```dart
// Elevation creates both shadow and surface tint
const M3Elevations.level3 // Elevation level 3 dp
const M3Shadows.level3 // Elevation level 3 List<M3BoxShadow>
const M3SurfaceTint.fromElevation(context, M3Elevations.level3), // Elevation level 3 surface tint color
// OR
M3ElevationToken.level3.dp // Elevation level 3 dp (not const)
M3ElevationToken.level3.shadows // Elevation level 3 List<M3BoxShadow> (not const)
M3ElevationToken.level3.surfaceColor(context) // Elevation level 3 surface tint color (not const)

// Motion duration and easing curve
const M3MotionDuration.long2,   // 500ms
const M3MotionCurve.emphasized, // emphasized easing
// OR
M3Motion.emphasized.duration // 500ms (not const)
M3Motion.emphasized.curve // emphasized easing (not const)
```

### Spacing Foundation

Material Design 3 uses a **4dp grid system** for consistent spatial relationships:

```dart
// Spacing scale (multiples of 4dp)
Padding(
  padding: const EdgeInsets.all(M3Spacings.space16), // 16dp
  child: Column(
    children: [
      Text('Title'),
      SizedBox(height: M3Spacings.space8), // 8dp
      Text('Subtitle'),
    ],
  ),
)

// Responsive margins based on screen size
Container(
  margin: EdgeInsets.symmetric(
    horizontal: M3Margins.compactScreen, // 16dp on mobile
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
      topLeft: M3Radius.large,
      topRight: M3Radius.large,
    ),
  ),
)

// Level 2: Border radius (all corners)
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadius.medium,
  ),
)

// Level 3: Complete shapes (for Material widgets)
Card(
  shape: M3Shape.medium,
  child: ...,
)
```

### Motion Foundation

Motion tokens ensure consistent animation behavior:

```dart
// Emphasized transitions
AnimatedContainer(
  duration: M3MotionDuration.long2,      // 500ms
  curve: M3MotionCurve.emphasized,       // Emphasized easing
)

// Complete motion specifications
AnimatedOpacity(
  duration: M3Motion.emphasized.duration,  // 500ms
  curve: M3Motion.emphasized.curve,        // Emphasized easing
)
```

### Elevation System

Elevation in Material Design 3 combines shadows and surface tint:

```dart
final elevation = M3Elevations.level5;

// Using Material Widget
Material(
  elevation: elevation,  // 12dp elevation
  child: ...,
)

// Using fromElevation values
Container(
  decoration: BoxDecoration(
    color: M3SurfaceTint.fromElevation(context, elevation), // colorScheme.surface with 12dp elevation
    boxShadow: M3Shadows.fromElevation(elevation),  // Level 5 shadow list (12dp elevation)
  ),
)

// Using colorScheme and shadow tokens directly
Container(
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.surface, // (12dp elevation)
    boxShadow: M3Shadows.level5,  // Level 5 shadow list (12dp elevation)
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
      borderRadius: M3BorderRadius.medium,
      // Elevation token
      elevation: M3Elevations.level3,
      child: InkWell(
        onTap: onTap,
        borderRadius: M3BorderRadius.medium,
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
              style: M3TextStyle.headlineLarge,
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
- `M3BorderRadius.medium` - Medium border radius
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
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
)

// After: Self-documenting design tokens
Container(
  padding: const EdgeInsets.all(M3Spacings.space16),
  margin: const EdgeInsets.symmetric(horizontal: M3Margins.mediumScreen),
  decoration: BoxDecoration(borderRadius: M3BorderRadius.medium),
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

Of course! Your intention to categorize was correct, but the execution in Markdown could be improved. I've organized your information into two main tables, **Design Tokens** and **Utility Classes**, using a 'Group' column for the categorization you wanted. This makes the reference much clearer and more professional.

---

## 📊 Complete Token and Utility Reference

### Design Tokens

These are constant values that form the foundation of your design system, ensuring consistency across spacing, colors, typography, and more.

| Group                  | Token           | Class (const)           | Enum (not const)           | Purpose                                 | Example Values                                                                                                   |
| :--------------------- | :-------------- | :---------------------- | :------------------------- | :-------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| **Layout & Spacing**   | Spacing         | `M3Spacings`            | `M3SpacingToken`           | 4dp grid system for consistent spacing. | `0`, `2`, `4`, `8`, `12`, `16`, `24`, `32`, `48dp`                                                               |
|                        | Margin          | `M3Margins`             | `M3MarginToken`            | Responsive container margins.           | `16dp`, `24dp`, `32dp`, `40dp`, `48dp`                                                                           |
|                        | Spacer          | `M3Spacers`             | `M3SpacerToken`            | Pre-built spacer widgets.               | horizontal/vertical spacers                                                                                      |
|                        | Icon Size       | `M3IconSizes`           | `M3IconSizeToken`          | Standardized icon dimensions.           | `18dp`, `24dp`, `36dp`, `40dp`, `48dp`                                                                           |
|                        | Visual Density  | `M3VisualDensity`       |                            | UI density configurations.              | `-3`, `-2`, `-1`, `0`, `comfortable`                                                                             |
|                        | Z-Index         | `M3ZIndexes`            | `M3ZIndexToken`            | Values for layer stacking order.        | `-1`, `0`, `10`, `100`, `1000`, `9999`                                                                           |
| **Responsive**         | Breakpoint      | `M3Breakpoints`         | `M3BreakpointToken`        | Breakpoints for responsive design.      | `0`, `600`, `840`, `1200`, `1600dp`                                                                              |
| **Motion & Animation** | Motion Duration | `M3MotionDuration`      |                            | Duration and timing for animations.     | `50ms`, `100ms`, `300ms`, `500ms`, `1000ms`                                                                      |
|                        | Motion Curve    | `M3MotionCurve`         |                            | Easing curves for animations.           | `emphasized`, `standard`, `linear`                                                                               |
|                        | Motion          | `M3Motion`              |                            | Combined duration + curve settings.     | `emphasized` `emphasizedIncoming` `emphasizedOutgoing` `standard` `standardIncoming` `standardOutgoing` `linear` |
| **Color & Opacity**    | Opacity         | `M3Opacities`           | `M3OpacityToken`           | General transparency values.            | `0.04`, `0.08`, `0.12`, `0.38`, `0.87`                                                                           |
|                        | State Layer     | `M3StateLayerOpacities` | `M3StateLayerOpacityToken` | Overlays for interactive states.        | Hover, focus, pressed states                                                                                     |
|                        | Surface Tint    | `M3SurfaceTint`         |                            | Dynamic surface colors.                 | Calculated from theme and elevation                                                                              |
| **Shape & Border**     | Corner          | `M3Corners`             | `M3CornerToken`            | Individual corner values.               | Corner rounding primitives                                                                                       |
|                        | Radius          | `M3Radius`              |                            | Individual corner radius values.        | Corner rounding primitives                                                                                       |
|                        | Border Radius   | `M3BorderRadius`        |                            | Complete border radius for containers.  | Container corner rounding                                                                                        |
|                        | Shape           | `M3Shape`               |                            | Border shapes for components.           | Cards, buttons, dialogs                                                                                          |
|                        | Border Width    | `M3BorderWidths`        | `M3BorderWidthToken `      | Border thickness values.                | `0dp`, `1dp`, `2dp`, `4dp`                                                                                       |
|                        | Border Side     | `M3BorderSide`          |                            | Individual border sides.                | Border configurations                                                                                            |
|                        | Border          | `M3Border`              |                            | Complete border specifications.         | Outlined components                                                                                              |
| **Elevation & Shadow** | Elevation       | `M3Elevations`          | `M3ElevationToken`         | Surface elevation levels.               | `0dp`, `1dp`, `3dp`, `6dp`, `8dp`, `12dp`                                                                        |
|                        | Shadow          | `M3Shadows`             |                            | Box shadow configurations.              | Shadows for elevated surfaces                                                                                    |
| **Typography**         | Text Style      | `M3TextStyle`           |                            | Complete typography scale.              | Display, Headline, Body, Label                                                                                   |

---

### Utility & Helper Classes

These are classes that help apply design tokens in a type-safe and responsive way.

| Group                   | Utility / Class          | Purpose                                     | Common Use Case                         |
| :---------------------- | :----------------------- | :------------------------------------------ | :-------------------------------------- |
| **Layout Helpers**      | `M3EdgeInsets`           | Type-safe padding/margin.                   | Enforces use of spacing tokens          |
|                         | `M3Padding`              | Pre-configured padding widget.              | Consistent padding application          |
|                         | `M3Gap`                  | Spacing between flex children (Row/Column). | `Row`/`Column` spacing                  |
| **Decoration Helpers**  | `M3BoxDecoration`        | Type-safe box decoration.                   | Enforces use of all style tokens        |
|                         | `M3ShapeDecoration`      | Type-safe shape decoration.                 | Enforces use of all style tokens        |
| **Responsive Builders** | `M3ResponsiveBuilder`    | Responsive widget builder.                  | Rebuilds on screen size class change    |
|                         | `M3ResponsiveValue`      | Responsive value selection.                 | Defines different values per breakpoint |
|                         | `M3ResponsiveVisibility` | Conditional visibility.                     | Shows/hides based on screen size        |
|                         | `M3ResponsiveGrid`       | Responsive grid layout.                     | Adaptive columns and spacing            |
|                         | `M3ResponsiveScaffold`   | Adaptive navigation scaffold.               | Bottom nav → Rail → Drawer              |
| **Responsive Logic**    | `M3ScreenSize`           | Window size classification.                 | Compact, Medium, Expanded, etc.         |
|                         | `M3ResponsiveGridConfig` | Grid layout configuration.                  | Columns, gutters, margins               |
|                         | `M3ResponsiveNavigation` | Navigation pattern selection.               | Determines nav type by size             |

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

## 📚 Further Reading & More

- [Material Design 3 Specification](https://m3.material.io/)
- [Google's Design System Guide](https://design.google/)
- [Flex Color Scheme](https://pub.dev/packages/flex_color_scheme)

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
