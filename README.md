# Material Design 3 for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue)](https://flutter.dev)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

A comprehensive Flutter package implementing Material Design 3 specifications through a professional token-based design system. Build beautiful, consistent, and accessible applications with enterprise-grade architecture.

## ✨ Why This Package?

Unlike the standard `material.dart` library, this package provides:

- **Complete Token System**: Reference → System → Component token hierarchy
- **Design Specifications**: Access to all Material Design 3 values and metrics
- **Enterprise Architecture**: Scalable, maintainable, and testable design system
- **Type Safety**: Strongly typed tokens with full IDE support
- **Self-Documenting**: Every token includes metadata and descriptions

## 🚀 Features

### Core Systems

- 🎨 **Design Token System** - Three-tier token hierarchy (Reference → System → Component)
- 📐 **Elevation System** - Token-based elevation with automatic theme integration
- ⏱️ **Motion System** - Duration and easing tokens for consistent animations
- 🎭 **Shape System** - Consistent corner radii and shape definitions
- 📱 **Adaptive Layouts** - Responsive design for all screen sizes
- ♿ **Accessibility Tools** - Built-in support for inclusive design

## 📦 Installation

```yaml
dependencies:
  material_design: ^0.35.0-dev
```

```dart
import 'package:material_design/material_design.dart';
```

## 🎯 Quick Start

### Basic Setup

```dart
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design 3 App',
      theme: ThemeData(
        useMaterial3: true,
        extensions: [
          ElevationTheme.material3(),
          ShapeTheme.rounded(),
          // Add more theme extensions as needed
        ],
      ),
      home: const HomePage(),
    );
  }
}
```

## 🏗️ Design Token System

Our token system provides a scalable architecture for managing design decisions:

### Token Hierarchy

```
Reference Tokens (Raw values)
    ↓
System Tokens (Semantic meanings)
    ↓
Component Tokens (Component-specific)
```

### Example: Complete Token Usage

```dart
// 1. Reference Token - Raw value
static const dp1 = ReferenceToken<double>(
  1.0,
  'elevation.dp1',
  description: '1dp elevation',
);

// 2. System Token - Semantic meaning
static final level1 = SystemToken<double>.fromReference(
  ElevationReferenceTokens.dp1,
  systemName: 'elevation.level1',
  description: 'Low elevation for cards and buttons',
);

// 3. Component Token - Component specific
static final elevated = ComponentToken<double>.fromSystem(
  ElevationSystemTokens.level1,
  component: 'Card',
  tokenName: 'elevation',
  variant: 'elevated',
  description: 'Elevated card default elevation',
);

// Usage in your app
ElevatedSurface(
  elevationToken: CardElevationTokens.elevated,
  child: YourContent(),
);
```

## 📊 Elevation System

### Basic Usage

```dart
// Using elevation tokens
ElevatedSurface(
  elevationToken: CardElevationTokens.elevated,
  borderRadius: BorderRadius.circular(12),
  child: CardContent(),
);

// With state management
class InteractiveCard extends StatefulWidget {
  @override
  _InteractiveCardState createState() => _InteractiveCardState();
}

class _InteractiveCardState extends State<InteractiveCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final elevation = MaterialElevation.getStateElevation(
      idle: CardElevationTokens.elevated,
      hover: CardElevationTokens.elevatedHover,
      pressed: CardElevationTokens.elevatedDragged,
      isHovered: _isHovered,
      isPressed: _isPressed,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: ElevatedSurface(
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Interactive Card'),
          ),
        ),
      ),
    );
  }
}
```

### Context Extensions

```dart
// Access tokens via context
final cardElevation = context.cardElevation.elevated;
final buttonElevation = context.buttonElevation.elevated;
final fabElevation = context.fabElevation.default_;
```

## ⏱️ Motion System

### Duration Tokens

```dart
// Using duration tokens
AnimatedContainer(
  duration: ButtonDurationTokens.press.value,  // 100ms
  // or via MaterialDuration
  duration: MaterialDuration.medium2,          // 300ms
  curve: MaterialEasing.emphasizedDecelerate,
  child: YourWidget(),
);

// Component-specific durations via context
AnimatedOpacity(
  duration: context.cardDuration.expand.value,
  opacity: isVisible ? 1.0 : 0.0,
  child: CardContent(),
);
```

### Easing Curves

```dart
// Using easing tokens
AnimatedContainer(
  curve: FABEasingTokens.show.value,
  // or via MaterialEasing
  curve: MaterialEasing.emphasizedDecelerate,
  duration: MaterialDuration.medium2,
  child: YourWidget(),
);

// Select curve by motion type
final curve = MaterialEasing.getEasing(MotionType.incoming);
final reverseCurve = MaterialEasing.reverse(curve);
```

### Choreographed Animations

```dart
// Create animation sequence with tokens
final sequence = MotionChoreographer.sequence()
  .add(
    name: 'fadeIn',
    durationToken: ShortDurationSystemTokens.short3,
    curve: MaterialEasing.decelerated,
  )
  .add(
    name: 'expand',
    durationToken: MediumDurationSystemTokens.medium2,
    delayToken: ShortDurationSystemTokens.short1,
    curve: MaterialEasing.emphasizedDecelerate,
  );

// Staggered list animations
ListView.builder(
  itemBuilder: (context, index) {
    final delay = DurationUtils.staggerDelay(
      index,
      baseDelayToken: ListDurationTokens.stagger,
    );

    return AnimatedContainer(
      duration: context.listDuration.itemSlide.value,
      curve: context.panelEasing.expand.value,
      delay: delay,
      child: ListTile(title: Text('Item $index')),
    );
  },
);
```

## 📱 Adaptive Layouts

```dart
class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AdaptiveConfig.fromContext(context);

    // Use window size class for layout decisions
    return switch (config.sizeClass) {
      WindowSizeClass.compact => CompactLayout(
        columns: 4,
        margin: 16,
      ),
      WindowSizeClass.medium => MediumLayout(
        columns: 8,
        margin: 24,
      ),
      WindowSizeClass.expanded => ExpandedLayout(
        columns: 12,
        margin: 24,
      ),
    };
  }
}

// Using adaptive builder
AdaptiveBuilder(
  builder: (context, config) {
    return Container(
      padding: EdgeInsets.all(config.margin),
      child: GridView.count(
        crossAxisCount: config.columns,
        children: items,
      ),
    );
  },
);
```

## ♿ Accessibility

```dart
class AccessibleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccessibilityProvider(
      config: AccessibilityConfig.fromPlatform(context),
      child: MaterialApp(
        theme: _buildAccessibleTheme(context),
        home: const HomePage(),
      ),
    );
  }

  ThemeData _buildAccessibleTheme(BuildContext context) {
    final config = context.accessibility;

    return ThemeData(
      useMaterial3: true,
      colorScheme: config.highContrast
          ? HighContrastTheme.createHighContrastScheme()
          : ColorScheme.fromSeed(seedColor: Colors.blue),
    );
  }
}

// Accessible components
class AccessibleButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AccessibleButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final config = context.accessibility;

    return AccessibleTouchTarget(
      minSize: config.touchTargetSize,  // 48x48 minimum
      semanticLabel: label,
      onTap: () {
        onTap();
        AccessibilityAnnouncer.announcePolite(context, '$label activated');
      },
      child: AnimatedContainer(
        duration: config.reduceMotion
            ? Duration.zero
            : context.buttonDuration.press.value,
        curve: context.feedbackEasing.hover.value,
        child: Text(
          label,
          style: config.applyToTextStyle(
            Theme.of(context).textTheme.labelLarge!,
          ),
        ),
      ),
    );
  }
}
```

## 🎨 Shape System

```dart
// Basic shape usage
ShapeContainer(
  radius: ShapeScale.medium,
  color: Theme.of(context).colorScheme.surface,
  elevation: context.cardElevation.elevated.value,
  child: Content(),
);

// Custom corner shapes
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
    color: Theme.of(context).colorScheme.primaryContainer,
  ),
  child: YourContent(),
);

// Shape theme integration
MaterialApp(
  theme: ThemeData(
    extensions: [
      ShapeTheme(
        scheme: ShapeScheme.rounded,
        cardShape: MaterialShapes.rounded(ShapeScale.medium),
        buttonShape: MaterialShapes.rounded(ShapeScale.full),
      ),
    ],
  ),
);
```

## 🔧 Advanced Usage

### Custom Theme Extension

```dart
@immutable
class AppDesignTokens extends ThemeExtension<AppDesignTokens> {
  final DesignToken<double> cardElevation;
  final DesignToken<Duration> animationDuration;
  final DesignToken<Curve> animationCurve;

  const AppDesignTokens({
    required this.cardElevation,
    required this.animationDuration,
    required this.animationCurve,
  });

  factory AppDesignTokens.material3() {
    return AppDesignTokens(
      cardElevation: CardElevationTokens.elevated,
      animationDuration: MediumDurationSystemTokens.medium2,
      animationCurve: EasingSystemTokens.emphasized,
    );
  }

  @override
  ThemeExtension<AppDesignTokens> copyWith({
    DesignToken<double>? cardElevation,
    DesignToken<Duration>? animationDuration,
    DesignToken<Curve>? animationCurve,
  }) {
    return AppDesignTokens(
      cardElevation: cardElevation ?? this.cardElevation,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
    );
  }

  @override
  ThemeExtension<AppDesignTokens> lerp(
    covariant ThemeExtension<AppDesignTokens>? other,
    double t,
  ) {
    if (other is! AppDesignTokens) return this;
    // Tokens don't interpolate, use step function
    return t < 0.5 ? this : other;
  }
}
```

### Token Debugging

```dart
// Debug token information
void debugToken(DesignToken token) {
  print(token.toDebugString());

  // Validate hierarchy
  if (token is ComponentToken) {
    final isValid = TokenResolver.validateHierarchy(token);
    print('Hierarchy valid: $isValid');

    // Trace to source
    final reference = TokenResolver.findReference(token);
    print('Reference token: ${reference?.name}');
  }
}

// Create token map for efficient lookups
final elevationTokens = TokenResolver.createTokenMap([
  CardElevationTokens.elevated,
  CardElevationTokens.elevatedHover,
  ButtonElevationTokens.elevated,
  FABElevationTokens.default_,
]);

// Access by name
final token = elevationTokens['card.elevated.elevation'];
```

## 📊 Token Reference

### Available Token Categories

| Category      | Tokens                                                                 | Description                                      |
| ------------- | ---------------------------------------------------------------------- | ------------------------------------------------ |
| **Elevation** | `level0` - `level5`                                                    | Elevation levels with shadows and tonal overlays |
| **Duration**  | `short1-4`, `medium1-4`, `long1-4`, `extraLong1-4`                     | Animation durations from 50ms to 1000ms          |
| **Easing**    | `standard`, `emphasized`, `decelerated`, `accelerated`                 | Motion curves for animations                     |
| **Shape**     | `none`, `extraSmall`, `small`, `medium`, `large`, `extraLarge`, `full` | Corner radius scales                             |

### Component-Specific Tokens

Each component has dedicated tokens for:

- Elevation states (idle, hover, pressed, dragged, disabled)
- Animation durations (open, close, transform, expand, collapse)
- Easing curves (show, hide, transition)

Access via context extensions:

```dart
context.cardElevation      // Card elevation tokens
context.buttonDuration     // Button duration tokens
context.fabEasing         // FAB easing tokens
context.navigationDuration // Navigation duration tokens
// ... and more
```

## 🧪 Testing

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('Token Validation', () {
    test('elevation tokens match M3 specs', () {
      expect(ElevationSystemTokens.level1.value, 1.0);
      expect(ElevationSystemTokens.level2.value, 3.0);
      expect(ElevationSystemTokens.level3.value, 6.0);
    });

    test('duration tokens are correct', () {
      expect(MaterialDuration.short1.inMilliseconds, 50);
      expect(MaterialDuration.medium2.inMilliseconds, 300);
      expect(MaterialDuration.long2.inMilliseconds, 500);
    });

    test('token hierarchy is valid', () {
      final token = CardElevationTokens.elevated;
      final isValid = TokenResolver.validateHierarchy(token);
      expect(isValid, true);
    });
  });
}
```

## 📚 Resources

- [Material Design 3 Guidelines](https://m3.material.io)
- [API Documentation](https://pub.dev/documentation/material_design/latest/)
- [Example App](https://github.com/yourusername/material_design/tree/main/example)
- [Design Token Specification](https://m3.material.io/foundations/design-tokens)
- [Flutter ThemeExtensions](https://api.flutter.dev/flutter/material/ThemeExtension-class.html)

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for:

- Code style guidelines
- Commit message format
- Pull request process
- Token naming conventions

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

---

<p align="center">
  Built with 💙 for the Flutter community<br>
  Following Material Design 3 specifications
</p>

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
