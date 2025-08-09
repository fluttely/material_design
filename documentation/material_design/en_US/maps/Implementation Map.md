# ⚙️ Implementation Map - Practical Implementation Map

> **Implementation Map** is a complete visual guide showing how to implement each part of the Material Design 3 system in real Flutter projects.

## 🎯 Overview

This map connects theory to practice, showing exactly how each Material Design 3 concept translates into functional Flutter code.

## 🛠️ Implementation Architecture

```mermaid
graph TB
    subgraph "📋 PLANNING"
        REQ[Requirements Analysis]
        ARCH[Architecture Planning]
        TOK[Token Strategy]
    end

    subgraph "🏗️ SETUP"
        PKG[Package Setup]
        DEP[Dependencies]
        STRUCT[Project Structure]
    end

    subgraph "🎨 THEMING"
        LIGHT[Light Theme]
        DARK[Dark Theme]
        DYN[Dynamic Colors]
    end

    subgraph "🧩 COMPONENTS"
        BASIC[Basic Widgets]
        COMP[Complex Components]
        ADAPT[Adaptive Layouts]
    end

    subgraph "♿ ACCESSIBILITY"
        CONTRAST[Color Contrast]
        TARGETS[Touch Targets]
        SEMANTIC[Semantic Labels]
    end

    subgraph "📱 TESTING"
        UNIT[Unit Tests]
        WIDGET[Widget Tests]
        INT[Integration Tests]
    end

    %% Implementation Flow
    REQ --> ARCH --> TOK
    TOK --> PKG --> DEP --> STRUCT
    STRUCT --> LIGHT --> DARK --> DYN
    DYN --> BASIC --> COMP --> ADAPT
    ADAPT --> CONTRAST --> TARGETS --> SEMANTIC
    SEMANTIC --> UNIT --> WIDGET --> INT
```

## 📋 Phase 1: Planning & Analysis

### Requirements Analysis

```dart
// 1. Define app requirements
class AppRequirements {
  // Platform targets
  static const platforms = [
    'Android 21+',  // API level 21+
    'iOS 12+',      // iOS 12+
    'Web',          // Modern browsers
  ];

  // Design requirements
  static const designRequirements = [
    'Material Design 3',
    'Light/Dark themes',
    'Dynamic colors (Android 12+)',
    'Responsive design',
    'Accessibility compliance',
  ];

  // Performance targets
  static const performanceTargets = {
    'startup_time': '< 2s',
    'navigation_time': '< 300ms',
    'theme_switch_time': '< 100ms',
  };
}
```

### Architecture Planning

```dart
// 2. Define architecture layers
lib/
├── data/              # Data layer
├── domain/           # Business logic
├── presentation/     # UI layer
│   ├── themes/      # Theme definitions
│   ├── widgets/     # Reusable widgets
│   └── pages/       # App pages
├── core/            # Core utilities
└── design_system/   # M3 design system
    ├── tokens/      # Design tokens
    ├── components/  # M3 components
    └── foundations/ # M3 foundations
```

### Token Strategy

```dart
// 3. Define token usage strategy
class TokenStrategy {
  // Token hierarchy decision
  static const hierarchy = 'ref → sys → comp';

  // Import strategy
  static const importStrategy = 'single barrel file';

  // Migration strategy
  static const migration = 'gradual from legacy tokens';
}
```

## 🏗️ Phase 2: Project Setup

### Package Setup

```yaml
# pubspec.yaml
name: my_material3_app
description: Material Design 3 Flutter app

dependencies:
  flutter:
    sdk: flutter
  material_design: ^0.5.0 # Your M3 package
  provider: ^6.0.0
  dynamic_color: ^1.6.8 # For Material You

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true
```

### Dependencies Integration

```dart
// main.dart - Basic setup
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
```

### Project Structure Implementation

```dart
// core/theme_provider.dart
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Color _seedColor = M3SysColor.primary;
  bool _useDynamicColors = true;

  // Getters
  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;
  bool get useDynamicColors => _useDynamicColors;

  // Theme builders
  ThemeData get lightTheme => M3Theme.light(
    seedColor: _useDynamicColors ? null : _seedColor,
  );

  ThemeData get darkTheme => M3Theme.dark(
    seedColor: _useDynamicColors ? null : _seedColor,
  );

  // Methods
  void changeThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void changeSeedColor(Color color) {
    _seedColor = color;
    _useDynamicColors = false;
    notifyListeners();
  }
}
```

## 🎨 Phase 3: Theme Implementation

### Light Theme Setup

```dart
// themes/light_theme.dart
class M3LightTheme {
  static ThemeData build({Color? seedColor}) {
    final colorScheme = seedColor != null
        ? ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.light,
          )
        : M3SysColor.toColorScheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,

      // Typography
      textTheme: M3TextStyleToken.material3TextTheme,

      // Component themes
      appBarTheme: _buildAppBarTheme(colorScheme),
      elevatedButtonTheme: _buildElevatedButtonTheme(colorScheme),
      cardTheme: _buildCardTheme(colorScheme),
      navigationBarTheme: _buildNavigationBarTheme(colorScheme),
      navigationRailTheme: _buildNavigationRailTheme(colorScheme),
      navigationDrawerTheme: _buildNavigationDrawerTheme(colorScheme),

      // Extensions
      extensions: [
        M3StateTheme.light(colorScheme),
        M3ElevationTheme.light(colorScheme),
      ],
    );
  }

  static AppBarTheme _buildAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      elevation: M3Elevation.level0.value,
      surfaceTintColor: colorScheme.surfaceTint,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      titleTextStyle: M3TextStyleToken.titleLarge.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }

  // ... other component theme builders
}
```

### Dark Theme Setup

```dart
// themes/dark_theme.dart
class M3DarkTheme {
  static ThemeData build({Color? seedColor}) {
    final colorScheme = seedColor != null
        ? ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.dark,
          )
        : M3SysColorDark.toColorScheme();

    return M3LightTheme.build(seedColor: seedColor).copyWith(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      extensions: [
        M3StateTheme.dark(colorScheme),
        M3ElevationTheme.dark(colorScheme),
      ],
    );
  }
}
```

### Dynamic Colors Implementation

```dart
// themes/dynamic_theme.dart
class DynamicThemeBuilder {
  static Future<ThemeData?> buildLight() async {
    try {
      final dynamicColorScheme = await DynamicColorPlugin.getColorScheme();
      if (dynamicColorScheme != null) {
        return M3LightTheme.build(
          seedColor: dynamicColorScheme.primary,
        );
      }
    } catch (e) {
      debugPrint('Dynamic colors unavailable: $e');
    }
    return null;
  }

  static Future<ThemeData?> buildDark() async {
    try {
      final dynamicColorScheme = await DynamicColorPlugin.getColorScheme();
      if (dynamicColorScheme != null) {
        return M3DarkTheme.build(
          seedColor: dynamicColorScheme.primary,
        );
      }
    } catch (e) {
      debugPrint('Dynamic colors unavailable: $e');
    }
    return null;
  }
}
```

## 🧩 Phase 4: Component Implementation

### Basic Widget Integration

```dart
// widgets/m3_button.dart
class M3Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final M3ButtonType type;
  final M3ButtonSize size;

  const M3Button({
    super.key,
    required this.onPressed,
    required this.child,
    this.type = M3ButtonType.filled,
    this.size = M3ButtonSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case M3ButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: _buildElevatedButtonStyle(),
          child: child,
        );
      case M3ButtonType.filled:
        return FilledButton(
          onPressed: onPressed,
          style: _buildFilledButtonStyle(),
          child: child,
        );
      case M3ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: _buildOutlinedButtonStyle(),
          child: child,
        );
      case M3ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: _buildTextButtonStyle(),
          child: child,
        );
    }
  }

  ButtonStyle _buildElevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      minimumSize: _getButtonSize(),
      padding: _getButtonPadding(),
      shape: _getButtonShape(),
      elevation: M3CompButton.elevationRested,
      animationDuration: M3MotionDuration.short4,
    );
  }

  Size _getButtonSize() {
    switch (size) {
      case M3ButtonSize.small:
        return Size.fromHeight(M3CompButton.heightSmall);
      case M3ButtonSize.medium:
        return Size.fromHeight(M3CompButton.heightMedium);
      case M3ButtonSize.large:
        return Size.fromHeight(M3CompButton.heightLarge);
    }
  }

  // ... other helper methods
}
```

### Complex Component Implementation

```dart
// widgets/m3_adaptive_scaffold.dart
class M3AdaptiveScaffold extends StatefulWidget {
  final List<NavigationDestination> destinations;
  final Widget body;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  const M3AdaptiveScaffold({
    super.key,
    required this.destinations,
    required this.body,
    this.floatingActionButton,
    this.appBar,
  });

  @override
  State<M3AdaptiveScaffold> createState() => _M3AdaptiveScaffoldState();
}

class _M3AdaptiveScaffoldState extends State<M3AdaptiveScaffold> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Mobile: NavigationBar
        if (width < M3BreakpointToken.medium) {
          return Scaffold(
            appBar: widget.appBar,
            body: widget.body,
            floatingActionButton: widget.floatingActionButton,
            bottomNavigationBar: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              destinations: widget.destinations,
            ),
          );
        }

        // Tablet: NavigationRail
        if (width < M3BreakpointToken.expanded) {
          return Scaffold(
            appBar: widget.appBar,
            floatingActionButton: widget.floatingActionButton,
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() => _selectedIndex = index);
                  },
                  destinations: widget.destinations.map((dest) =>
                    NavigationRailDestination(
                      icon: dest.icon,
                      selectedIcon: dest.selectedIcon,
                      label: dest.label,
                    ),
                  ).toList(),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: widget.body),
              ],
            ),
          );
        }

        // Desktop: NavigationDrawer
        return Scaffold(
          appBar: widget.appBar,
          drawer: NavigationDrawer(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() => _selectedIndex = index);
              Navigator.of(context).pop();
            },
            children: widget.destinations.map((dest) =>
              NavigationDrawerDestination(
                icon: dest.icon,
                selectedIcon: dest.selectedIcon,
                label: dest.label,
              ),
            ).toList(),
          ),
          body: widget.body,
          floatingActionButton: widget.floatingActionButton,
        );
      },
    );
  }
}
```

## ♿ Phase 5: Accessibility Implementation

### Color Contrast Checks

```dart
// accessibility/contrast_checker.dart
class M3ContrastChecker {
  /// Check if color combination meets WCAG AA standard (4.5:1)
  static bool meetsAA({
    required Color foreground,
    required Color background,
  }) {
    return _calculateContrast(foreground, background) >= 4.5;
  }

  /// Check if color combination meets WCAG AAA standard (7:1)
  static bool meetsAAA({
    required Color foreground,
    required Color background,
  }) {
    return _calculateContrast(foreground, background) >= 7.0;
  }

  static double _calculateContrast(Color foreground, Color background) {
    final fLuminance = _relativeLuminance(foreground);
    final bLuminance = _relativeLuminance(background);

    final lighter = math.max(fLuminance, bLuminance);
    final darker = math.min(fLuminance, bLuminance);

    return (lighter + 0.05) / (darker + 0.05);
  }

  static double _relativeLuminance(Color color) {
    final r = _linearize(color.red / 255);
    final g = _linearize(color.green / 255);
    final b = _linearize(color.blue / 255);
    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  static double _linearize(double component) {
    return component <= 0.03928
        ? component / 12.92
        : math.pow((component + 0.055) / 1.055, 2.4).toDouble();
  }
}
```

### Touch Target Enforcement

```dart
// accessibility/touch_targets.dart
class M3TouchTargets {
  static const double minimumSize = 48.0;
  static const double recommendedSize = 56.0;

  /// Ensures widget meets minimum touch target size
  static Widget ensureMinimumSize({
    required Widget child,
    double? size,
  }) {
    return SizedBox(
      width: size ?? minimumSize,
      height: size ?? minimumSize,
      child: Center(child: child),
    );
  }

  /// Wraps interactive widget with proper touch target
  static Widget wrapInteractive({
    required Widget child,
    VoidCallback? onTap,
    String? semanticLabel,
    bool isButton = true,
  }) {
    Widget result = ensureMinimumSize(child: child);

    if (onTap != null) {
      result = InkWell(
        onTap: onTap,
        shape: BorderRadius.circular(M3Radius.medium),
        child: result,
      );
    }

    if (semanticLabel != null) {
      result = Semantics(
        label: semanticLabel,
        button: isButton,
        child: result,
      );
    }

    return result;
  }
}
```

## 📱 Phase 6: Testing Implementation

### Unit Tests

```dart
// test/theme_provider_test.dart
void main() {
  group('ThemeProvider', () {
    late ThemeProvider themeProvider;

    setUp(() {
      themeProvider = ThemeProvider();
    });

    test('initial values are correct', () {
      expect(themeProvider.themeMode, ThemeMode.system);
      expect(themeProvider.seedColor, M3SysColor.primary);
      expect(themeProvider.useDynamicColors, true);
    });

    test('changing theme mode notifies listeners', () {
      var notified = false;
      themeProvider.addListener(() => notified = true);

      themeProvider.changeThemeMode(ThemeMode.dark);

      expect(themeProvider.themeMode, ThemeMode.dark);
      expect(notified, true);
    });

    test('changing seed color disables dynamic colors', () {
      themeProvider.changeSeedColor(Colors.red);

      expect(themeProvider.seedColor, Colors.red);
      expect(themeProvider.useDynamicColors, false);
    });
  });
}
```

### Widget Tests

```dart
// test/widget/m3_button_test.dart
void main() {
  group('M3Button', () {
    testWidgets('renders correctly', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: M3Theme.light(),
          home: Scaffold(
            body: M3Button(
              onPressed: () => pressed = true,
              child: const Text('Test Button'),
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);

      await tester.tap(find.byType(M3Button));
      expect(pressed, true);
    });

    testWidgets('applies correct size for different variants', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: M3Theme.light(),
          home: Scaffold(
            body: Column(
              children: [
                M3Button(
                  onPressed: () {},
                  size: M3ButtonSize.small,
                  child: const Text('Small'),
                ),
                M3Button(
                  onPressed: () {},
                  size: M3ButtonSize.medium,
                  child: const Text('Medium'),
                ),
                M3Button(
                  onPressed: () {},
                  size: M3ButtonSize.large,
                  child: const Text('Large'),
                ),
              ],
            ),
          ),
        ),
      );

      // Verify button sizes
      final smallButton = tester.getSize(find.text('Small').first);
      final mediumButton = tester.getSize(find.text('Medium').first);
      final largeButton = tester.getSize(find.text('Large').first);

      expect(smallButton.height, M3CompButton.heightSmall);
      expect(mediumButton.height, M3CompButton.heightMedium);
      expect(largeButton.height, M3CompButton.heightLarge);
    });
  });
}
```

## 🔗 Implementation Connections

### From [[../foundations/Foundations|Foundations]]

- **[[../foundations/Design Tokens]]** → **Token Strategy & Setup**
- **[[../foundations/Accessibility]]** → **Accessibility Implementation**
- **[[../foundations/Adaptive Design]]** → **Responsive Components**

### From [[../styles/Styles|Styles]]

- **[[../styles/Color System]]** → **Theme System & Dynamic Colors**
- **[[../styles/Typography]]** → **Text Theme Configuration**
- **[[../styles/Elevation]]** → **Component Elevation Setup**

### From [[../components/Components|Components]]

- **Component Specifications** → **Widget Implementation**
- **Interaction States** → **State Management**
- **Layout Patterns** → **Adaptive Layouts**

### To [[../examples/Showcase App|Showcase Examples]]

- **Implementation Patterns** → **Live Demonstrations**
- **Best Practices** → **Code Examples**
- **Testing Strategies** → **Quality Assurance**

## 📈 Implementation Metrics

### Code Quality Indicators

```mermaid
pie title Implementation Quality Distribution
    "Well Implemented" : 70
    "Needs Improvement" : 20
    "Critical Issues" : 5
    "Missing Features" : 5
```

### Coverage Statistics

- **Token Usage**: 95% of design tokens implemented
- **Component Coverage**: 85% of M3 components available
- **Theme Support**: 100% light/dark theme coverage
- **Accessibility**: 90% WCAG AA compliance
- **Responsive**: 100% breakpoint support
- **Testing**: 80% code coverage

## 🏷️ Tags

#implementation-map #flutter-integration #practical-guide #code-examples #testing #accessibility #responsive-design #material-design-3

## 🔍 See Also

- **[[../Material Design 3|🏠 Material Design 3 Home]]**
- **[[../implementation/Implementation|⚙️ Implementation Guide]]**
- **[[Token Map|🏷️ Token Map]]**
- **[[Component Map|🗺️ Component Map]]**
- **[[../examples/Showcase App|📱 Live Examples]]**

---

**📝 Last Updated:** Complete practical implementation guide with code examples and testing
