# Final Implementation Blueprint: `material_toolkit`

This document outlines the definitive architectural and implementation plan for the `material_toolkit` library. It synthesizes the analysis of the library's initial state, the official Material Design 3 (M3) token system, and Flutter's native `ThemeData` engine to propose a final, unified approach.

## 1. Core Philosophy and Goal

The primary goal of the `material_toolkit` is to provide a powerful, semantic, and idiomatic way to **create a fully configured `ThemeData` object** that is strictly aligned with the Material Design 3 token system.

The library will **not** be a parallel theming engine. It will not provide its own widgets or non-standard methods for applying styles. Instead, it will serve as a **`ThemeData` configuration toolkit**, bridging the gap between raw design tokens and Flutter's native theming mechanism.

## 2. Proposed Architecture

The library will be restructured around a central `ThemeData` builder function and a set of token data classes. The "resolver" pattern will be deprecated in favor of direct `ThemeData` configuration.

### 2.1. The `ThemeData` Builder: `createMaterialToolkitTheme()`

This will be the main public API of the library.

- **Signature**:
  ```dart
  ThemeData createMaterialToolkitTheme({
    required Brightness brightness,
    required ColorTokens colors,
    required TypographyTokens typography,
    ShapeTokens? shapes,
    SpacingTokens? spacings,
    // ... other optional token sets
  })
  ```

- **Responsibility**:
  1.  Take semantic token objects as input (`ColorTokens`, `TypographyTokens`, etc.).
  2.  Generate a `ColorScheme` and `TextTheme` from the core tokens.
  3.  Use the tokens to configure all relevant component themes within `ThemeData` (e.g., `cardTheme`, `elevatedButtonTheme`, `inputDecorationTheme`).
  4.  Return a complete, ready-to-use `ThemeData` object.

### 2.2. Token Data Classes

These will be simple, immutable data classes that hold the design system values. They will be organized according to M3 principles.

- **`ColorTokens` (Required)**:
  - Will contain properties for all M3 color roles: `primary`, `onPrimary`, `primaryContainer`, `secondary`, `surface`, `error`, etc.
  - This class will be used to construct the `ColorScheme`.

- **`TypographyTokens` (Required)**:
  - Will contain `TextStyle` properties for all M3 type scale roles: `displayLarge`, `headlineMedium`, `bodyLarge`, `labelSmall`, etc.
  - It will also include a `fontFamily` property.
  - This class will be used to construct the `TextTheme`.

- **`ShapeTokens` (Optional)**:
  - Will define `BorderRadius` values for different shape categories: `small`, `medium`, `large`, `extraLarge`, `full`.
  - These will be mapped to the `shape` properties of component themes like `cardTheme`, `dialogTheme`, and `elevatedButtonTheme`.

- **`SpacingTokens` (Optional)**:
  - Will define `double` values for spacing: `small`, `medium`, `large`.
  - These will be used to configure the `padding` and `margin` properties within component themes (e.g., `elevatedButtonTheme.style.padding`).

### 2.3. Deprecation of the Old System

- **Resolvers**: The entire `resolver` system (`PaddingResolver`, `ShapeResolver`, etc.) will be removed. The responsibility of applying styles is deferred to Flutter's `ThemeData`.
- **`DesignTokens` Theme Extension**: The monolithic `DesignTokens` class will be removed. The library will no longer inject a large, custom object into the theme extensions. The only use for `ThemeExtension` would be for truly non-standard values that have no home in `ThemeData`, but this should be avoided in the core library.

## 3. Implementation Plan

The implementation will follow a clear, layered approach.

**Phase 1: The Foundation - Core Theme Generation**

1.  **Re-implement `ColorTokens` and `TypographyTokens`**: Create the data classes as described above.
2.  **Implement `createMaterialToolkitTheme()`**:
    - Create the initial version of the builder function.
    - Implement the logic to map `ColorTokens` to a `ColorScheme`.
    - Implement the logic to map `TypographyTokens` to a `TextTheme`.
    - Return a basic `ThemeData` object with the generated `colorScheme` and `textTheme`.

**Phase 2: Component Theme Mapping**

1.  **Implement `ShapeTokens` and `SpacingTokens`**: Create the data classes for shape and spacing.
2.  **Enhance `createMaterialToolkitTheme()`**:
    - Add the optional `shapes` and `spacings` parameters.
    - Systematically go through all relevant component themes in `ThemeData` and configure them using the provided tokens.
    - **Example Mappings**:
      - `shapes.medium` -> `cardTheme.shape`
      - `shapes.full` -> `elevatedButtonTheme.style.shape`
      - `spacings.medium` -> `inputDecorationTheme.contentPadding`
      - `colors.primary` -> `elevatedButtonTheme.style.backgroundColor`

**Phase 3: Documentation and Examples**

1.  **Update `README.md`**: Thoroughly document the new, simplified API. Emphasize that the library is a `ThemeData` builder, not a styling framework.
2.  **Create a Comprehensive Example**: The `example/` app should be a clear demonstration of how to use `createMaterialToolkitTheme()` to style an entire application. It should showcase a wide variety of Material widgets to prove that the generated theme is applied correctly and consistently.

## 4. Final Vision

The final `material_toolkit` will be a lightweight, intuitive, and powerful library that feels like a natural extension of the Flutter framework. It will empower developers to build beautiful, M3-compliant applications by providing a semantic and centralized way to define their design system, while fully embracing the idiomatic power of `ThemeData`.
