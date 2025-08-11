# Material Design 3 (2025) for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue)](https://flutter.dev)

Build beautiful Flutter apps aligned with Material Design 3 guidelines using ready-to-use design tokens and helper widgets.

## 🚀 Features

- **Design Token System** - Complete Material Design 3 token hierarchy
- **Adaptive Layouts** - Responsive design for all screen sizes
- **Motion System** - Standardized durations and easing curves
- **Accessibility Tools** - Built-in support for inclusive design
- **Shape System** - Consistent corner radii and shape definitions

## 📦 Installation

```yaml
dependencies:
  material_design: ^0.33.0-dev
```

```dart
import 'package:material_design/material_design.dart';
```

## 🎨 Quick Start

### Design Tokens

```dart
// Define your color system
const primaryColor = SystemToken<Color>(
  Color(0xFF6750A4),
  'color.primary',
);

// Use in components
Container(
  color: primaryColor.value,
  child: Text('Hello Material Design 3'),
);
```

### Motion System (Duration & Easing)

Material Design 3 motion creates meaningful transitions with standardized timing and easing.

```dart
// Simple fade animation with Material timing
class FadeCard extends StatelessWidget {
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: MaterialDuration.medium2,        // 300ms
      curve: MaterialEasing.standard,            // Natural motion
      child: Card(child: Text('Smooth fade')),
    );
  }
}

// Page transition with emphasized easing
class ExpandingPanel extends StatelessWidget {
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: MaterialDuration.long2,          // 500ms for larger movements
      curve: MaterialEasing.emphasizedDecelerate, // Dramatic deceleration
      height: isExpanded ? 400 : 100,
      child: content,
    );
  }
}

// Component-specific animations
IconButton(
  onPressed: () => setState(() => isLiked = !isLiked),
  icon: AnimatedSwitcher(
    duration: ComponentDurations.buttonPress,    // 100ms for quick feedback
    switchInCurve: MaterialEasing.decelerated,
    child: Icon(
      isLiked ? Icons.favorite : Icons.favorite_border,
      key: ValueKey(isLiked),
    ),
  ),
);

// Staggered list animation
ListView.builder(
  itemBuilder: (context, index) {
    return AnimatedContainer(
      duration: ComponentDurations.listItemSlide,
      curve: MaterialAnimationCurves.expandPanel,
      // Calculate stagger delay
      delay: DurationUtils.staggerDelay(index),
      child: ListTile(title: Text('Item $index')),
    );
  },
);

// Using motion type to select appropriate curve
final motionCurve = MaterialEasing.getEasing(MotionType.incoming);
final reverseCurve = MaterialEasing.reverse(motionCurve);
```

### Adaptive Layouts

```dart
class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AdaptiveConfig.fromContext(context);

    // Automatically adjust layout based on screen size
    return switch (config.sizeClass) {
      WindowSizeClass.compact => MobileLayout(),
      WindowSizeClass.medium => TabletLayout(),
      _ => DesktopLayout(),
    };
  }
}
```

### Accessibility

```dart
class AccessibleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccessibilityProvider(
      config: AccessibilityConfig.fromPlatform(context),
      child: MaterialApp(
        home: AccessibleButton(
          label: 'Continue',
          onTap: () => navigateNext(),
        ),
      ),
    );
  }
}

class AccessibleButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final config = context.accessibility;

    return AccessibleTouchTarget(
      minSize: config.touchTargetSize,  // Ensures 48x48 minimum
      semanticLabel: label,
      onTap: onTap,
      child: AnimatedContainer(
        duration: config.reduceMotion
          ? Duration.zero
          : MotionTokens.durationMedium,
        child: Text(label),
      ),
    );
  }
}
```

### Shape System

```dart
// Quick shape application
ShapeContainer(
  radius: ShapeScale.medium,
  color: Colors.blue,
  child: Text('Rounded content'),
);

// Custom shape with different corners
Container(
  decoration: ShapeDecoration(
    shape: MaterialShapes.roundedWith(
      CornerShape(
        topLeft: ShapeScale.large,
        topRight: ShapeScale.large,
        bottomLeft: ShapeScale.none,
        bottomRight: ShapeScale.none,
      ),
    ),
  ),
  child: content,
);

// Theme integration
MaterialApp(
  theme: ThemeData(
    extensions: [
      ShapeTheme(
        scheme: ShapeScheme.rounded,
        cardShape: MaterialShapes.rounded(ShapeScale.medium),
      ),
    ],
  ),
);
```

## 🎯 Common Patterns

### Staggered List Animation

```dart
class StaggeredList extends StatelessWidget {
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;

        return AnimatedContainer(
          duration: MotionTokens.durationMedium,
          curve: MotionTokens.easingEmphasized,
          // Stagger delay based on index
          delay: Duration(milliseconds: 50 * index),
          child: ListTile(title: Text(item)),
        );
      }).toList(),
    );
  }
}
```

### Responsive Grid

```dart
class ResponsiveGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AdaptiveConfig.fromContext(context);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: config.columns,
        childAspectRatio: config.sizeClass == WindowSizeClass.compact
          ? 1.0
          : 1.5,
      ),
      itemBuilder: (context, index) => Card(
        shape: context.shapeTheme.cardShape,
        child: Center(child: Text('Item $index')),
      ),
    );
  }
}
```

### High Contrast Support

```dart
class ContrastAwareWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isHighContrast = context.accessibility.highContrast;

    return Container(
      decoration: BoxDecoration(
        border: isHighContrast
          ? Border.all(width: 2)
          : null,
        color: isHighContrast
          ? Colors.black
          : Theme.of(context).colorScheme.surface,
      ),
      child: Text(
        'Adaptive contrast',
        style: TextStyle(
          color: isHighContrast
            ? Colors.white
            : null,
        ),
      ),
    );
  }
}
```

## 📚 Resources

- [Material Design 3 Guidelines](https://m3.material.io)
- [API Documentation](https://pub.dev/documentation/material_design/latest/)
- [Example App](https://github.com/yourusername/material_design/tree/main/example)

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.
