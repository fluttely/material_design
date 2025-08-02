# Material Design 3 for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/platform-flutter-blue)](https://flutter.dev)

🎨 **The most complete Material Design 3 implementation for Flutter**

A comprehensive, type-safe toolkit that brings the full power of Material Design 3 to Flutter apps. Build pixel-perfect UIs with enhanced developer experience through enum-based design tokens, comprehensive documentation, and zero learning curve.

Transform your Flutter development with production-ready design tokens that eliminate guesswork and ensure consistency across your entire application.

## 🚀 Live Demo & Resources

**[🌟 View Interactive Demo](https://fluttely.github.io/material_design/)** - Explore all design tokens with live examples

**[📚 Material Design 3 Guidelines](https://m3.material.io/)** - Official documentation

## ✨ Why material_design?

| Feature                  | Flutter Default    | material_design           |
| ------------------------ | ------------------ | ------------------------- |
| **Type Safety**          | ❌ Magic numbers   | ✅ Compile-time checks    |
| **Design Tokens**        | ❌ Manual values   | ✅ Official M3 tokens     |
| **Consistency**          | ❌ Prone to errors | ✅ Guaranteed consistency |
| **Developer Experience** | ❌ Look up values  | ✅ IntelliSense support   |
| **Performance**          | ✅ Good            | ✅ Zero runtime overhead  |

## 📦 Installation

```yaml
dependencies:
  material_design: ^0.20.0
```

```bash
flutter pub add material_design
```

## 🎯 Quick Start

Choose the API style that best fits your needs:

### Recommended: Use Constants (Flutter Standard)

```dart
import 'package:material_design/material_design.dart';

Container(
  padding: const EdgeInsets.all(M3Spacings.space16),
  decoration: const BoxDecoration(
    color: Colors.blue,
    borderRadius: M3BorderRadii.medium,
    boxShadow: M3Shadows.level5,
  ),
  child: const Text(
    'Hello Material 3',
    style: M3TextStyles.headlineMedium,
  ),
),
```

### Alternative: Typed Tokens (Enhanced Developer Experience)

```dart
final elevation = M3ElevationToken.level5;

Container(
  padding: M3EdgeInsets.all(M3SpacingToken.space16),
  decoration: M3BoxDecoration(
    color: elevation.surfaceColor(context),
    borderRadius: M3BorderRadiusToken.medium,
    boxShadow: M3ShadowToken.fromElevation(elevation),
  ),
  child: Text(
    'Hello Material 3',
    style: Theme.of(context).textTheme.headlineMedium,
  ),
),
```

> 💡 **Which approach to choose?**
>
> - **Constants**: Familiar Flutter syntax
> - **Typed tokens**: Best developer experience, compile-time safety

## 📐 Design Token System

### Shape System

Three levels of shape tokens for maximum flexibility:

```dart
// High-level: Ready-to-use shapes
Card(
  shape: M3Shapes.medium, // RoundedRectangleBorder
)

// Mid-level: Border radius for decorations
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadii.large, // BorderRadius
  ),
)

// Low-level: Individual radius values
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: M3Radii.extraLarge, // Radius
    ),
  ),
)
```

### Spacing & Layout

Consistent spacing based on Material Design's 4dp grid system:

```dart
// Spacing for padding/margins
Padding(
  padding: M3EdgeInsets.all(M3SpacingToken.space24),
)

// Responsive margins
Container(
  margin: EdgeInsets.symmetric(
    horizontal: M3Margins.compactScreen,
  ),
)

// Layout gaps
Row(
  children: [
    Widget1(),
    M3Gap(M3SpacingToken.space16),
    Widget2(),
  ],
)
```

### Motion & Animation

```dart
AnimatedContainer(
  duration: M3Motions.emphasized.duration,
  curve: M3Motions.emphasized.curve,
  // ... other properties
),
```

### Elevation & Shadows

```dart
final elevation = M3ElevationToken.level3;

Container(
  decoration: BoxDecoration(
    color: elevation.surfaceColor(context),
    boxShadow: elevation.shadows,
  ),
)
```

## 💻 Real-World Example

```dart
class M3Card extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const M3Card({
    required this.child,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final elevation = M3ElevationToken.level1;

    return InkWell(
      onTap: onTap,
      borderRadius: M3BorderRadii.medium,
      child: Container(
        padding: M3EdgeInsets.all(M3SpacingToken.space16),
        decoration: M3BoxDecoration(
          color: elevation.surfaceColor(context),
          borderRadius: M3BorderRadiusToken.medium,
          boxShadow: M3ShadowToken.fromElevation(elevation),
        ),
        child: child,
      ),
    );
  }
}
```

## 📊 Complete Token Reference

| Token Category  | Enum Class                 | Constants Class         | Description                |
| --------------- | -------------------------- | ----------------------- | -------------------------- |
| **Layout**      |
| Spacing         | `M3SpacingToken`           | `M3Spacings`            | 4dp grid-based spacing     |
| Margin          | `M3MarginToken`            | `M3Margins`             | Responsive margin values   |
| Spacer          | `M3SpacerToken`            | `M3Spacers`             | Spacer widget helpers      |
| **Shape**       |
| Radius          | `M3RadiusToken`            | `M3Radii`               | Individual radius values   |
| Border Radius   | `M3BorderRadiusToken`      | `M3BorderRadii`         | Corner radius values       |
| Shape           | `M3ShapeToken`             | `M3Shapes`              | Complete shape definitions |
| **Border**      |
| Border Width    | `M3BorderWidthToken`       | `M3BorderWidths`        | Border thickness values    |
| Border Side     | `M3BorderSideToken`        | `M3BorderSides`         | Individual border sides    |
| Border          | `M3BorderToken`            | `M3Borders`             | Complete border configs    |
| **Elevation**   |
| Elevation       | `M3ElevationToken`         | `M3Elevations`          | Surface elevation levels   |
| Shadow          | `M3ShadowToken`            | `M3Shadows`             | Box shadow configurations  |
| Surface Color   | `M3SurfaceColorToken`      | -                       | Dynamic surface colors\*   |
| **Motion**      |
| Duration        | `M3MotionDurationToken`    | `M3MotionDurations`     | Animation timings          |
| Curve           | `M3MotionCurveToken`       | `M3MotionCurves`        | Animation easing curves    |
| Motion          | `M3MotionToken`            | `M3Motions`             | Complete motion configs    |
| **Typography**  |
| Text Style      | `M3TextStyleToken`         | `M3TextStyles`          | Text style definitions     |
| **Interactive** |
| Opacity         | `M3OpacityToken`           | `M3Opacities`           | General opacity values     |
| State Layer     | `M3StateLayerOpacityToken` | `M3StateLayerOpacities` | Interactive state opacity  |
| **Responsive**  |
| Breakpoint      | `M3BreakpointToken`        | `M3Breakpoints`         | Responsive breakpoints     |
| **Other**       |
| Icon Size       | `M3IconSizeToken`          | `M3IconSizes`           | Standard icon dimensions   |
| Visual Density  | `M3VisualDensityToken`     | `M3VisualDensities`     | UI density configurations  |
| Z-Index         | `M3ZIndexToken`            | `M3ZIndexes`            | Stacking order values      |

\*Note: `M3SurfaceColorToken` values are calculated dynamically based on the current theme.

## ⚡ Performance

- **Zero runtime overhead**: Tokens compile to constants
- **Tree-shakeable**: Only includes what you use
- **Optimized for hot reload**: Instant design updates
- **Const constructors**: Maximum performance for rebuild-heavy widgets

## 🔄 Migration Guide

### From Flutter's Built-in Material

```dart
// Before
Container(
  padding: const EdgeInsets.all(16.0),
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  ),
)

// After
Container(
  padding: const EdgeInsets.all(M3Spacings.space16),
  decoration: const BoxDecoration(
    borderRadius: M3BorderRadii.medium,
    boxShadow: M3Shadows.level2,
  ),
)
```

## 🤝 Contributing

We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) before submitting PRs.

### Development Setup

```bash
git clone https://github.com/fluttely/material_design.git
cd material_design
flutter pub get
flutter test
```

## 📄 Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history and migration guides.

## 📜 License

This project is licensed under the BSD License - see the [LICENSE](LICENSE) file for details.

## 🙏 Credits

- Material Design team at Google for the M3 specification
- Flutter team for the excellent framework
- All our [contributors](https://github.com/fluttely/material_design/graphs/contributors)

---

<p align="center">
  <strong>Made with ❤️ by the Flutter community</strong>
</p>
