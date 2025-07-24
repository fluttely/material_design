# Material Design 3 - Complete Library Structure

## Directory Structure

```
lib/
├── material_design.dart              # Main entry point
└── src/
    ├── ref/                          # Reference tokens (raw values)
    │   ├── ref.dart                  # Exports for ref layer
    │   └── palette/
    │       ├── tonal_palette.dart    # TonalPalette class
    │       └── ref_palette.dart      # RefPalette with color definitions
    │
    ├── sys/                          # System tokens (systematic application)
    │   ├── sys.dart                  # Exports for sys layer
    │   ├── color/
    │   │   ├── sys_color_scheme.dart # SysColorScheme with color roles
    │   │   ├── sys_surface_colors.dart # SysSurfaceColors extension
    │   │   └── sys_color_theme.dart  # Helper for color theme creation
    │   ├── typography/
    │   │   └── sys_type_scale.dart   # SysTypeScale with text styles
    │   ├── elevation/
    │   │   └── sys_elevation.dart    # SysElevation enum
    │   ├── shape/
    │   │   └── sys_radius.dart       # SysRadius enum
    │   ├── spacing/
    │   │   └── sys_spacing.dart      # SysSpacing enum
    │   ├── motion/
    │   │   └── sys_motion.dart       # SysMotion specifications
    │   └── theme/
    │       └── sys_theme.dart        # SysTheme - main theme builder
    │
    └── comp/                         # Component tokens (future expansion)
        └── comp.dart                 # Exports for comp layer
```

## Key Classes and Their Responsibilities

### Reference Layer (ref/)

- **TonalPalette**: Base class for managing color tones with interpolation
- **RefPalette**: Static color palette definitions (primary, secondary, etc.)

### System Layer (sys/)

- **SysColorScheme**: Semantic color roles mapping (surface, primary, etc.)
- **SysSurfaceColors**: Theme extension for M3-specific surface colors
- **SysTypeScale**: Typography definitions following M3 type scale
- **SysElevation**: Elevation levels (0-5)
- **SysRadius**: Shape radius tokens (extraSmall to full)
- **SysSpacing**: Spacing tokens for consistent layout
- **SysMotion**: Animation durations and easing curves
- **SysTheme**: Main theme builder that combines all tokens

### Component Layer (comp/)

- Reserved for future component-specific tokens

## Integration with Existing M3Theme

The original `M3Theme` class has been refactored to `SysTheme` with these improvements:

1. **Better Integration**: Uses `SysColorScheme` instead of Flutter's ColorScheme
2. **Complete Token System**: Includes all M3 tokens (elevation, spacing, motion)
3. **Theme Extensions**: Properly exposes M3-specific properties
4. **Flexible Creation**: Supports custom tonal palettes
5. **Accessibility**: Built-in high contrast mode

## Usage Examples

### Basic Usage

```dart
import 'package:material_design/material_design.dart';

// Use default M3 theme
final app = MaterialApp(
  theme: SysTheme.light().toThemeData(),
  darkTheme: SysTheme.dark().toThemeData(),
);
```

### Custom Colors

```dart
// Create custom primary palette
final customPrimary = TonalPalette({
  0: Color(0xFF000000),
  10: Color(0xFF001F2A),
  // ... other tones
});

// Apply to theme
final theme = SysTheme.light(
  primary: customPrimary,
).toThemeData();
```

### Accessing M3 Tokens

```dart
// In widgets
final surfaces = Theme.of(context).extension<SysSurfaceColors>()!;
final motion = Theme.of(context).extension<SysMotion>()!;

Container(
  color: surfaces.surfaceContainerHigh,
  padding: EdgeInsets.all(SysSpacing.medium.value),
  child: AnimatedContainer(
    duration: motion.medium2,
    curve: motion.emphasizedDecelerate,
    // ...
  ),
);
```

## Benefits of This Architecture

1. **Spec Compliance**: Follows M3's 3-layer architecture exactly
2. **Type Safety**: Strongly typed tokens prevent errors
3. **Flexibility**: Easy to customize any aspect of the theme
4. **Performance**: Efficient token access and interpolation
5. **Maintainability**: Clear separation of concerns
6. **Extensibility**: Easy to add new tokens or components
7. **Developer Experience**: Intuitive APIs with good documentation

## Migration from Original M3Theme

```dart
// Before
M3Theme.light()

// After
SysTheme.light()

// The API remains similar, but now you get:
// - Access to all M3 tokens
// - Better type safety
// - More customization options
```

## Future Enhancements

1. **Component Tokens**: Add component-specific tokens in comp/ layer
2. **Dynamic Color**: Implement Material You color extraction
3. **Adaptive Layouts**: Add responsive design tokens
4. **State Layers**: Implement M3 state layer system
5. **Custom Properties**: Allow apps to add their own design tokens
