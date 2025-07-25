# Library vs. Flutter Framework Alignment Analysis

This document provides a comparative analysis between the `material_toolkit` library and Flutter's native `ThemeData` theming engine. The goal is to identify areas of alignment and discrepancy to inform a refactoring strategy that makes the library more idiomatic and powerful.

## 1. Alignment

- **Conceptual Goal**: Both the library and `ThemeData` aim to centralize design decisions for consistency and maintainability.
- **Use of `ThemeExtension`**: The library correctly uses `ThemeExtension<DesignTokens>` to inject its token set into the `ThemeData` object, which is the modern, recommended approach for adding custom data to Flutter's theme.
- **Focus on Semantics**: The library's use of semantic names for tokens (e.g., `SpacingTokens.medium`) aligns well with the semantic nature of `ThemeData`'s properties (e.g., `textTheme.bodyLarge`).

## 2. Discrepancies

The primary discrepancy is that the `material_toolkit` **builds a parallel, non-standard theming system** instead of **configuring the standard `ThemeData` system**.

1.  **Bypassing `ThemeData` for Component Styling**:
    - **Library's Approach**: The library encourages direct use of its own resolvers in the widget tree, for example: `Padding(padding: context.tokens.edgeInsets.all(MaterialSpacings.medium), ...)`.
    - **Flutter's Approach**: The idiomatic way is to configure the component themes within `ThemeData` (e.g., `elevatedButtonTheme`) and let the widgets draw their styles from that central configuration. The library does not use or populate these component theme properties.

2.  **Redundant Data Structures**:
    - **Library's Approach**: The library defines its own token classes for concepts that have direct equivalents in `ThemeData`, such as `RadiusTokens` and `SpacingTokens`.
    - **Flutter's Approach**: `ThemeData` already has properties to handle shape (`cardTheme.shape`, `inputDecorationTheme.border`) and spacing (`elevatedButtonTheme.style.padding`). The library's tokens are a separate source of truth that is not connected to the standard Flutter widgets' styling mechanisms.

3.  **The "Resolver" Pattern vs. Component Themes**:
    - **Library's Approach**: The "resolver" pattern (`context.tokens.padding`, `context.tokens.shape`) is a custom solution for applying token values.
    - **Flutter's Approach**: This is the exact problem that the component theme properties in `ThemeData` (like `cardTheme`, `dialogTheme`, etc.) are designed to solve. The library reinvents this mechanism.

4.  **Lack of `ColorScheme` and `TextTheme` Integration**:
    - **Library's Approach**: The current implementation of `DesignTokens` does not include tokens for `color` or `typography`, which are the two most critical parts of a design system.
    - **Flutter's Approach**: `ThemeData` is built around `colorScheme` and `textTheme`. Any theming solution must treat these as its foundation.

## 3. Improvement Suggestions

The overarching goal should be to refactor the library from a *parallel theming engine* into a **`ThemeData` configuration toolkit**. The library should not provide its own styling system, but rather a powerful and semantic way to **build a `ThemeData` object**.

1.  **Eliminate Direct-Use Resolvers**:
    - The resolvers that create widgets (`PaddingResolver`, `GapResolver`) or apply styles directly (`ShapeResolver`) should be deprecated and removed. The library's purpose is not to provide new ways to style widgets, but to configure the existing `ThemeData` system that does this automatically.

2.  **Focus on a `ThemeData` Builder**:
    - The primary public API of the library should be a single function or class, let's call it `createMaterialToolkitTheme()`.
    - This function would take the library's semantic tokens (`ColorTokens`, `TypographyTokens`, `ShapeTokens`, etc.) as input.
    - Its sole responsibility would be to consume these tokens and return a fully configured, idiomatic `ThemeData` object.

3.  **Map Tokens to `ThemeData` Properties**:
    - The logic inside the `createMaterialToolkitTheme()` builder should map the library's tokens to the corresponding `ThemeData` properties.
    - **Example**:
      - `ColorTokens` -> `ThemeData.colorScheme`
      - `TypographyTokens` -> `ThemeData.textTheme`
      - `ShapeTokens.medium` -> `ThemeData.cardTheme.shape`
      - `SpacingTokens.large` -> `ThemeData.elevatedButtonTheme.style.padding`

4.  **Embrace Component Themes**:
    - The library should provide a comprehensive mapping from its tokens to all relevant component themes within `ThemeData`. The goal is that when a user applies the generated theme, all standard Material widgets look correct "out of thebox" without needing further manual styling.

5.  **Retain `ThemeExtension` for Non-Standard Tokens**:
    - The `ThemeExtension` is still valuable for tokens that have no place in the standard `ThemeData` object. This could include things like `BreakpointTokens` or custom animation `DurationTokens`. The `DesignTokens` class should be slimmed down to only hold these non-standard values.
