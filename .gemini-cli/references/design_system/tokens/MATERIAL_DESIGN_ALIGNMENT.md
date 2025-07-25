# Material Toolkit - M3 Alignment and Gap Analysis

This document provides a comparative analysis between the current state of the `material_toolkit` library and the official Material Design 3 (M3) token system. Its purpose is to identify areas of alignment, note discrepancies, and suggest improvements to bring the library into closer compliance with the M3 standard.

## 1. Alignment

The `material_toolkit` library already aligns with the M3 token system in several key areas:

- **Token-Based Architecture**: The library's core philosophy of using a centralized `DesignTokens` object is perfectly in line with M3's token-based approach.
- **Semantic Naming**: Many of the token classes and their properties use semantic names that are conceptually similar to M3's system tokens (e.g., `SpacingTokens` with `small`, `medium`, `large`).
- **Categorization**: The organization of tokens into categories like `geometry`, `painting`, and `animation` mirrors the logical grouping found in the M3 system (Shape, Color, Motion).
- **Elevation System**: The `ElevationTokens` class implements a 6-level system that directly corresponds to the elevation levels specified in M3.
- **Spacing Scale**: The `SpacingTokens` are based on a 4dp grid, which is the standard for Material Design.

## 2. Discrepancies

Despite the conceptual alignment, there are significant architectural and naming discrepancies between the `material_toolkit` and the official M3 token system.

- **Missing Hierarchical Structure**: The library currently has a flat, two-level system (Token -> Resolver), whereas M3 uses a three-level hierarchy (Reference -> System -> Component). The `material_toolkit` is missing the concepts of **Reference Tokens** (the full palette of options) and **Component Tokens** (widget-specific overrides).
- **Lack of Color and Typography Tokens**: The current implementation, as analyzed from the `lib` directory, is missing dedicated tokens for Color and Typography, which are central to M3. The previous implementation had `ColorTokens` and `TypographyTokens`, but the current one does not.
- **`DesignTokens` as a "System Token" Bucket**: The `DesignTokens` class acts as a single, monolithic container for all token categories. In a true M3 system, this would be more akin to the collection of all **System Tokens**, but it isn't explicitly defined as such.
- **Resolvers vs. Component Tokens**: The library uses "Resolvers" (e.g., `PaddingResolver`) to apply tokens. In the M3 paradigm, this role would be filled by **Component Tokens**. For example, instead of `context.tokens.padding.all(MaterialSpacings.medium)`, the M3 approach would be to have a component style that references a system token like `md.sys.spacing.medium`.
- **Naming Conventions**: While semantic, the naming does not follow the `category.property.variant` structure of M3 (e.g., `md.sys.color.primary`). The library uses class and property names like `SpacingTokens.small`.
- **Hard-Coded Values**: The token classes are initialized with hard-coded default values (e.g., `SpacingTokens` defaults to `extraSmall: 4`). In a true M3 system, these would be considered **System Tokens** that are themselves derived from a set of **Reference Tokens**.

## 3. Improvement Suggestions

To better align the `material_toolkit` with the M3 standard, the following conceptual changes are recommended:

1.  **Introduce the Three-Level Hierarchy**:
    - **Create Reference Tokens**: Define a set of foundational, non-semantic tokens. For example, a `RefPalette` class for colors (`blue40`, `neutral90`) and a `RefSizing` class for raw numbers (`size4`, `size8`). These should not be exposed directly to the UI code.
    - **Refactor Current Tokens as System Tokens**: The existing token classes (`SpacingTokens`, `ElevationTokens`, etc.) should be refactored to be **System Tokens**. Their values should be derived from the new Reference Tokens. For example, `system.spacing.small` would be defined as `ref.sizing.size8`.
    - **Implement Component Tokens**: Introduce a new layer of tokens that are specific to widgets. For example, a `FilledButtonTokens` class could have a `containerColor` property that defaults to `system.color.primary` but can be overridden.

2.  **Integrate Color and Typography**:
    - Re-introduce `ColorTokens` and `TypographyTokens` as first-class citizens within the system token layer. These should be the primary way that color and text styles are defined, following the M3 roles (primary, onPrimary, headlineLarge, etc.).

3.  **Adopt M3 Naming Conventions**:
    - Restructure the token access to follow the `category.property` or `component.element.property` pattern. This might involve refactoring the `DesignTokens` class to provide accessors like `tokens.sys.color.primary` or `tokens.comp.button.containerColor`.

4.  **Decouple Resolvers from Core Tokens**:
    - The "Resolver" concept should be re-evaluated. The role of applying tokens to widgets should be handled by the Flutter `ThemeData` itself, configured by the Component Tokens. For example, the `ElevatedButtonThemeData` would be configured using `FilledButtonTokens`. The resolvers for creating primitive types like `EdgeInsets` or `BorderRadius` could be kept as internal utilities.

5.  **Create a Theme Builder**:
    - Develop a high-level "Theme Builder" function or class that takes a set of curated System Tokens (especially Color) and generates a complete, M3-compliant `ThemeData` object, including component themes configured with the appropriate Component Tokens. This would become the primary entry point for the library user.
