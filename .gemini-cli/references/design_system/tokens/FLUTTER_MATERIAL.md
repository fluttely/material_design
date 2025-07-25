# Flutter `ThemeData` Documentation

## 1. Overview

The `ThemeData` class is the cornerstone of Flutter's Material Design theming system. It is an immutable class that holds the complete visual configuration for a `MaterialApp` or a widget subtree. Its primary purpose is to centralize design decisions, ensuring a consistent and maintainable look and feel across an entire application.

Widgets within the tree can access the current theme's configuration by calling `Theme.of(context)`, which efficiently looks up the nearest ancestor `Theme` widget.

## 2. Core Properties

While `ThemeData` has a vast number of properties, the most critical ones that form the foundation of a theme are:

- **`colorScheme`**: A `ColorScheme` object that defines a set of 27 colors based on the Material 3 specification. This is the preferred way to define colors, as it ensures accessibility and coherence. It includes roles like `primary`, `secondary`, `surface`, `error`, and their corresponding `on-` colors (e.g., `onPrimary`) for text and icons.
- **`textTheme`**: A `TextTheme` object that defines the typographic scale for the application. It includes styles for different text roles, such as `displayLarge`, `headlineMedium`, `bodySmall`, and `labelLarge`.
- **`brightness`**: An enum (`Brightness.light` or `Brightness.dark`) that determines the overall brightness of the theme, affecting default colors and component styles.
- **`useMaterial3`**: A boolean flag to opt-in to the latest Material Design 3 visual language. When `true`, components will adopt their M3 appearance.

## 3. Component-Specific Themes

Beyond the core properties, `ThemeData` provides a rich set of component-specific theme objects that allow for fine-grained control over the appearance of individual widgets. This is the standard, idiomatic way to style components in Flutter.

- **`appBarTheme`**: Customizes `AppBar`s (color, elevation, text styles).
- **`cardTheme`**: Customizes `Card`s (color, shape, elevation, margin).
- **`elevatedButtonTheme`**: Customizes `ElevatedButton`s (colors, shape, text style, padding).
- **`textButtonTheme`**: Customizes `TextButton`s.
- **`outlinedButtonTheme`**: Customizes `OutlinedButton`s.
- **`filledButtonTheme`**: Customizes `FilledButton`s (an M3 component).
- **`inputDecorationTheme`**: Defines the default appearance for `TextField` and `TextFormField` decorations (borders, colors, label styles, padding).
- **`floatingActionButtonTheme`**: Customizes `FloatingActionButton`s (color, shape, elevation).
- **`dialogTheme`**: Customizes `Dialog`s (background color, shape, elevation, text styles).
- **`bottomSheetTheme`**: Customizes modal and persistent bottom sheets.
- **`bottomNavigationBarTheme`**: Customizes `BottomNavigationBar`s.
- **`navigationBarTheme`**: Customizes the M3 `NavigationBar`.
- **`chipTheme`**: Customizes `Chip`s (colors, shape, padding, text style).
- **`sliderTheme`**: Customizes `Slider`s.
- **`tabBarTheme`**: Customizes `TabBar`s.
- **`tooltipTheme`**: Customizes `Tooltip`s.
- **`dividerTheme`**: Customizes `Divider`s.
- **`iconTheme`**: Defines a default `IconThemeData` for icons.
- **`listTileTheme`**: Customizes `ListTile`s.
- **`switchTheme`**: Customizes `Switch`s.
- **`checkboxTheme`**: Customizes `Checkbox`s.
- **`radioTheme`**: Customizes `Radio`s.

## 4. Creating and Using `ThemeData`

### Initialization

A `ThemeData` object is typically created and passed to the `theme` property of the `MaterialApp` widget. The recommended modern approach is to use the `ThemeData.from()` constructor with a `ColorScheme`.

```dart
MaterialApp(
  theme: ThemeData.from(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  ),
  // ...
);
```

### Overriding Component Styles

To customize a specific component, you provide its corresponding theme property in the `ThemeData` constructor.

```dart
ThemeData(
  colorScheme: myColorScheme,
  textTheme: myTextTheme,
  // Override the default style for all ElevatedButtons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: myColorScheme.primary,
      foregroundColor: myColorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
```

### Accessing Theme Properties in Widgets

Inside a widget's `build` method, you can get the `ThemeData` and use its properties to style your UI.

```dart
// Get the current theme
final theme = Theme.of(context);

// Use properties from the theme
Container(
  color: theme.colorScheme.surface,
  child: Text(
    'Hello, World!',
    style: theme.textTheme.bodyLarge,
  ),
);
```

This approach ensures that if the theme ever changes (e.g., from light to dark mode), the widget will automatically rebuild with the correct styles.
