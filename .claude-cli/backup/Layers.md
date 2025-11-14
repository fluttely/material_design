## 🏗️ Architecture Overview

This package implements Material Design 3's complete token architecture:

```
┌─────────────────────────────────────────────────────────────────────┐
│                          COMPONENTS LAYER                           │
│                  Pre-built widgets and utilities                    │
├─────────────────────────────────────────────────────────────────────┤
│ • M3BoxDecoration, M3BorderRadius, M3Border                         │
│ • M3Gap, M3EdgeInsets, M3Padding                                    │
└────────────────────────────────┬────────────────────────────────────┘
                                 │ Uses
┌────────────────────────────────┴────────────────────────────────────┐
│                           STYLES LAYER                              │
│                    Applied design decisions                         │
├─────────────────────────────────────────────────────────────────────┤
│ Constant-Based Tokens:                                              │
│ (Direct const access)                                               │
│ • M3Shapes                                                          │
│   • M3BorderRadii                                                   │
│     • M3Radii                                                       │
│ • M3Borders                                                         │
│   • M3BorderSides                                                   │
│ • M3Elevations                                                      │
│ • M3Shadows                                                         │
│ • M3TextStyles                                                      │
│ • M3StateLayerOpacities                                             │
└────────────────────────────────┬────────────────────────────────────┘
                                 │ Built from
┌────────────────────────────────┴────────────────────────────────────┐
│                         FOUNDATIONS LAYER                           │
│                 Core systems and layout primitives                  │
├─────────────────────────────────────────────────────────────────────┤
│ Constant-Based Tokens:                                              │
│ (Direct const access)                                               │
│ • M3Spacings                                                        │
│ • M3Margins                                                         │
│ • M3Spacers                                                         │
│ • M3Motions                                                         │
│   • M3MotionDurations                                               │
│   • M3MotionCurves                                                  │
│ • M3Breakpoints                                                     │
│ • M3Opacities                                                       │
│ • M3IconSizes                                                       │
│ • M3VisualDensities                                                 │
│ • M3ZIndexes                                                        │
└────────────────────────────────┬────────────────────────────────────┘
                                 │ References
┌────────────────────────────────┴────────────────────────────────────┐
│                        ATOMIC VALUES LAYER                          │
│                    Raw primitive constants                          │
├─────────────────────────────────────────────────────────────────────┤
│ • M3RadiusValues (0, 4, 8, 12, 16, 20, 28, 32, 48, 9999)            │
│ • M3BorderWidths (0, 1, 2, 4)                                       │
│ • Spacing values: 0, 2, 4, 8, 12, 16, 20, 24, 32, 40, 48...         │
│ • Duration values: 50ms, 100ms, 150ms, 200ms, 300ms, 500ms...       │
│ • Opacity values: 0.04, 0.08, 0.12, 0.16, 0.38, 0.87, 1.0           │
│ • Icon sizes: 18.0, 24.0, 36.0, 40.0, 48.0                          │
│ • Breakpoint values: 0, 600, 840, 1200, 1600                        │
│ • Z-index values: -1, 0, 10, 100, 1000, 9999                        │
└─────────────────────────────────────────────────────────────────────┘
```

## Layer Descriptions

### 🧩 **Components Layer** (Top)

Pre-built widgets and utilities that developers directly use in their applications. These combine multiple design tokens to create complete UI elements.

**Characteristics:**

- Ready-to-use widgets
- Combine multiple tokens from lower layers
- Provide convenience and consistency
- Examples: `M3Card`, `M3BoxDecoration`, `M3Gap`

### 🎨 **Styles Layer**

Applied design decisions that define visual characteristics. These tokens represent how things look and feel.

**Characteristics:**

- Visual properties (shape, elevation, typography)
- Built from foundation values
- Define component appearance
- Examples: `M3Shapes`, `M3ElevationToken`, `M3TextStyles`

### 🏗️ **Foundations Layer**

Core systems that define spatial relationships, motion, and responsive behavior. These are the building blocks of the design system.

**Characteristics:**

- Layout and spacing systems
- Motion and animation patterns
- Responsive breakpoints
- Examples: `M3Spacings`, `M3MotionToken`, `M3Breakpoints`

### ⚛️ **Atomic Values Layer** (Bottom)

The raw, indivisible values that everything else is built upon. These are the smallest units in the design system.

**Characteristics:**

- Primitive constants (numbers, durations)
- No dependencies on other layers
- Direct numeric values
- Examples: `4.0`, `100ms`, `0.87`

## Token vs Constant Pattern

Throughout the architecture, we maintain a consistent pattern:

```dart
// Enum-Based Token - Type-safe design abstraction
enum M3SpacingToken implements IM3Token<double> {
  space16(M3Spacings.space16), // References constant token
}

// Constant-Based Token - Direct const access
abstract final class M3Spacings {
  static const double space16 = 16.0; // Compile-time constant
}
```

This dual-token approach provides:

- **Type safety** through enum-based tokens
- **Direct const access** through constant-based tokens
- **Flexibility** for different use cases
- **Performance** with compile-time constants
- **Developer choice** based on preference
