# Implementation - Practical Material Design 3 Implementation

> **Implementation** provides practical guides and concrete examples of how to integrate the entire Material Design 3 system into real Flutter projects.

## 🎯 Overview

This section covers all practical implementation aspects:

- **🔧 Flutter Integration** - How to use with Flutter/Material
- **🏗️ Token Structure** - Practical token organization
- **🎨 Theme System** - Theme creation and application
- **📋 Best Practices** - Recommended patterns and conventions

## 🏗️ Implementation Structure

```mermaid
graph TD
    I[Implementation] --> FI[Flutter Integration]
    I --> TS[Token Structure]
    I --> TH[Theme System]
    I --> BP[Best Practices]

    FI --> FI1[MaterialApp Setup]
    FI --> FI2[Widget Integration]
    FI --> FI3[Theme Configuration]

    TS --> TS1[Ref/Sys/Comp Organization]
    TS --> TS2[Barrel Files]
    TS --> TS3[Export Structure]

    TH --> TH1[Light/Dark Themes]
    TH --> TH2[Dynamic Colors]
    TH --> TH3[Custom Themes]

    BP --> BP1[Code Organization]
    BP --> BP2[Performance]
    BP --> BP3[Accessibility]
```

## 🔧 [[Flutter Integration|Flutter Integration]]

### Basic MaterialApp Setup

```dart
import 'package:material_design/material_design.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design 3 App',
      // Enabling Material 3
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: M3SysColor.toColorScheme(),
      textTheme: M3TextStyleToken.material3TextTheme,
      // Automatic component configurations
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(M3CompButton.heightMedium),
          shape: RoundedRectangleBorder(
            shape: M3CompButton.shapeMedium,
          ),
        ),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: M3SysColorDark.toColorScheme(),
      textTheme: M3TextStyleToken.material3TextTheme,
    );
  }
}
```

### Using Tokens in Widgets

```dart
class ExampleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Using component tokens directly
      padding: M3CompCard.padding,
      margin: M3CompCard.margin,
      decoration: M3BoxDecoration(
        // Using system colors
        color: M3SysColor.surfaceContainer,
        shape: M3CompCard.shape,
        // Using elevation system
        boxShadow: M3ElevationShadows.fromElevation(M3Elevation.level1.dp),
      ),
      child: Column(
        children: [
          // Using typography scale
          Text(
            'Card Title',
            style: M3TextStyleToken.titleMedium.copyWith(
              color: M3SysColor.onSurface,
            ),
          ),
          // Using spacing tokens
          const M3Gap(M3SpacingToken.space8),
          Text(
            'Card description text',
            style: M3TextStyleToken.bodyMedium.copyWith(
              color: M3SysColor.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
```

## 🏗️ [[Token Structure|Token Structure]]

### File Organization

```
lib/src/m3/
├── tokens/
│   ├── ref/                    # Reference Tokens
│   │   ├── ref.dart           # Barrel file
│   │   ├── color/
│   │   │   ├── m3_ref_palette.dart
│   │   │   └── m3_ref_opacity.dart
│   │   ├── typography/
│   │   │   └── m3_ref_typeface.dart
│   │   └── motion/
│   │       └── m3_ref_duration.dart
│   │
│   ├── sys/                    # System Tokens
│   │   ├── sys.dart           # Barrel file
│   │   └── color/
│   │       └── m3_sys_color.dart
│   │
│   ├── comp/                   # Component Tokens
│   │   ├── comp.dart          # Barrel file
│   │   ├── button/
│   │   │   └── m3_comp_button.dart
│   │   └── card/
│   │       └── m3_comp_card.dart
│   │
│   └── tokens.dart            # Main barrel file
│
├── foundations/               # Foundation classes
├── theme/                    # Theme builders
└── m3.dart                   # Main barrel
```

### Barrel Files Strategy

```dart
// tokens/tokens.dart - Exports everything
export 'ref/ref.dart';
export 'sys/sys.dart';
export 'comp/comp.dart';
// Legacy tokens for compatibility
export 'color/m3_tonal_color.dart';
export 'typography/m3_type_scale.dart';

// ref/ref.dart - Reference tokens
export 'color/m3_ref_palette.dart';
export 'color/m3_ref_opacity.dart';
export 'typography/m3_ref_typeface.dart';
export 'motion/m3_ref_duration.dart';

// sys/sys.dart - System tokens
export 'color/m3_sys_color.dart';

// comp/comp.dart - Component tokens
export 'button/m3_comp_button.dart';
export 'card/m3_comp_card.dart';
```

### Import Strategy

```dart
// For end users - single import
import 'package:material_design/material_design.dart';

// For internal development - specific imports
import 'package:material_design/src/m3/tokens/ref/ref.dart';
import 'package:material_design/src/m3/tokens/sys/sys.dart';
import 'package:material_design/src/m3/tokens/comp/comp.dart';
```

## 🎨 [[Theme System|Theme System]]

### M3Theme Builder

```dart
class M3Theme {
  /// Builds light theme with optional seed color
  static ThemeData light({
    Color? seedColor,
    M3VisualDensity? visualDensity,
  }) {
    final colorScheme = seedColor != null
        ? ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light)
        : M3SysColor.toColorScheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      visualDensity: visualDensity ?? M3VisualDensity.adaptivePlatformDensity.value,

      // Typography
      textTheme: M3TextStyleToken.material3TextTheme,

      // Components
      elevatedButtonTheme: _buildElevatedButtonTheme(colorScheme),
      cardTheme: _buildCardTheme(colorScheme),
      appBarTheme: _buildAppBarTheme(colorScheme),
    );
  }

  /// Builds dark theme
  static ThemeData dark({Color? seedColor}) {
    final colorScheme = seedColor != null
        ? ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark)
        : M3SysColorDark.toColorScheme();

    return light(seedColor: seedColor).copyWith(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
    );
  }

  /// High contrast theme
  static ThemeData highContrast() {
    return light().copyWith(
      // Enhanced contrast adjustments
      textTheme: M3TextStyleToken.material3TextTheme.apply(
        displayColor: Colors.black,
        bodyColor: Colors.black,
      ),
    );
  }
}

// Helper methods
ElevatedButtonThemeData _buildElevatedButtonTheme(ColorScheme colorScheme) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(M3CompButton.heightMedium),
      padding: M3CompButton.paddingMedium,
      shape: RoundedRectangleBorder(
        shape: M3CompButton.shapeMedium,
      ),
      elevation: M3CompButton.elevationRested,
      animationDuration: M3MotionDuration.short4,
    ),
  );
}
```

### Dynamic Colors (Material You)

```dart
class DynamicTheme extends StatefulWidget {
  final Widget child;

  const DynamicTheme({Key? key, required this.child}) : super(key: key);

  @override
  State<DynamicTheme> createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  ColorScheme? _dynamicColorScheme;

  @override
  void initState() {
    super.initState();
    _loadDynamicColors();
  }

  Future<void> _loadDynamicColors() async {
    try {
      final corePalette = await DynamicColorPlugin.getCorePalette();
      if (corePalette != null && mounted) {
        setState(() {
          _dynamicColorScheme = corePalette.toColorScheme();
        });
      }
    } catch (e) {
      // Fallback to static colors
      debugPrint('Dynamic colors not available: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: M3Theme.light(
        seedColor: _dynamicColorScheme?.primary,
      ),
      darkTheme: M3Theme.dark(
        seedColor: _dynamicColorScheme?.primary,
      ),
      child: widget.child,
    );
  }
}
```

## 📋 [[Best Practices|Best Practices]]

### 1. Code Organization

```dart
// ✅ Good - Use semantic tokens
Container(
  padding: M3EdgeInsets.all(M3SpacingToken.space16),
  decoration: M3BoxDecoration(
    color: M3SysColor.primaryContainer,
    shape: BorderRadius.circular(M3Radius.medium),
  ),
)

// ❌ Bad - Hard-coded values
Container(
  padding: M3EdgeInsets.all(16.0),
  decoration: M3BoxDecoration(
    color: Color(0xFFEADDFF),
    shape: BorderRadius.circular(12.0),
  ),
)

// ✅ Good - Use component tokens for components
ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: Size.fromHeight(M3CompButton.heightMedium),
    shape: RoundedRectangleBorder(
      shape: M3CompButton.shapeMedium,
    ),
  ),
  child: Text('Button'),
)
```

### 2. Performance

```dart
// ✅ Good - Cache theme data
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: colorScheme.primaryContainer,
      child: Text('Text', style: textTheme.titleMedium),
    );
  }
}

// ❌ Bad - Repeated theme access
class BadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Text(
        'Text',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
```

### 3. Accessibility

```dart
// ✅ Good - Use M3Accessibility utilities
Widget accessibleButton = M3Accessibility.ensureMinimumTouchTarget(
  child: IconButton(
    onPressed: onPressed,
    tooltip: 'Accessible button',
    icon: Icon(Icons.add),
  ),
);

// ✅ Good - Check contrast
final hasGoodContrast = M3Accessibility.meetsContrastRequirement(
  foreground: textColor,
  background: backgroundColor,
);

// ✅ Good - Use semantic labels
Semantics(
  label: 'Primary action button',
  button: true,
  child: ElevatedButton(
    onPressed: onPressed,
    child: Text('Submit'),
  ),
)
```

## 🛠️ Practical Examples

### [[../examples/Complete App Example|Complete App]]

See complete implementation in **[[../examples/Showcase App|example/lib/main.dart]]**:

```dart
// main.dart - Reorganized main app
class TokenShowcaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Material Design 3',
      theme: M3Theme.light(seedColor: themeProvider.seedColor),
      darkTheme: M3Theme.dark(seedColor: themeProvider.seedColor),
      themeMode: themeProvider.themeMode,
      home: M3AdaptiveScaffold(
        destinations: navigationDestinations,
        body: PageView(children: showcasePages),
      ),
    );
  }
}
```

### [[../examples/Design Tokens Page|Design Tokens Page]]

Page demonstrating tokens in action:

```dart
// Spacing demonstration
_buildSpacingDemo('M3SpacingToken.space16', M3SpacingToken.space16);

// Density demonstration
_buildDensityDemo('Standard', M3VisualDensity.standard);

// Breakpoints demonstration
_buildBreakpointDemo('M3BreakpointToken.medium', M3BreakpointToken.medium);
```

## 🔗 Connections

### To [[../foundations/Foundations|Foundations]]

- **[[../foundations/Design Tokens]]** → **Token Structure**
- **[[../foundations/Accessibility]]** → **Best Practices**

### To [[../styles/Styles|Styles]]

- **[[../styles/Color System]]** → **Theme System**
- **[[../styles/Typography]]** → **Flutter Integration**

### To [[../components/Components|Components]]

- **Component Tokens** → **Widget Integration**
- **Theme Configuration** → **Component Styling**

## 🏷️ Tags

#implementation #flutter-integration #theme-system #token-structure #best-practices #material-design-3

## 🔍 See Also

- **[[../Material Design 3|🏠 Material Design 3 Home]]**
- **[[../examples/Showcase App|📱 Showcase App]]**
- **[[../maps/Implementation Map|🗺️ Implementation Map]]**

---

**📝 Last Updated:** Practical guides updated with new token structure
