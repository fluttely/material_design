# Material Toolkit Library Documentation

## 1. Overview

The `material_toolkit` library is a comprehensive design system framework for Flutter. It provides a structured set of tools to build custom, token-based design systems on top of Flutter's existing Material Design widgets. The core philosophy is to centralize design decisions—such as spacing, typography, colors, and shapes—into a single, overridable `DesignTokens` object.

This object is then made available throughout the widget tree via a `ThemeExtension`, allowing developers to build a consistent and maintainable UI that is decoupled from hard-coded magic numbers.

The library is organized into two main concepts:
- **Tokens**: Classes that hold raw, semantic design values (e.g., `SpacingTokens`, `RadiusTokens`).
- **Resolvers**: Classes that consume tokens and convert them into concrete Flutter objects (e.g., `EdgeInsetsResolver` creates `EdgeInsets` from `SpacingTokens`).

## 2. Core Concepts

### DesignTokens

This is the central class of the library, acting as a container for all other token sets. An instance of `DesignTokens` is injected into the `ThemeData` extensions for easy access anywhere in the app.

- **`DesignTokens`**: The main theme extension class.
  - `boxShadows`: `BoxShadowTokens`
  - `borderWidths`: `BorderWidthTokens`
  - `breakpoints`: `BreakpointTokens`
  - `durations`: `DurationTokens`
  - `elevations`: `ElevationTokens`
  - `iconSizes`: `IconSizeTokens`
  - `opacities`: `OpacityTokens`
  - `radii`: `RadiusTokens`
  - `spacings`: `SpacingTokens`
  - `textShadows`: `TextShadowTokens`
  - `zIndexes`: `ZIndexTokens`

It also provides convenient access to resolvers.

### Accessing Tokens

Tokens can be accessed via a `BuildContext` or `ThemeData` extension:
- `context.tokens`
- `Theme.of(context).tokens`

## 3. Public API and Architecture

The library is structured into logical directories: `tokens`, `resolvers`, and `helpers`.

### 3.1. Tokens

Tokens define the raw values of the design system.

- **`animation/`**
  - **`DurationTokens`**: Defines standard animation timings (e.g., `quick`, `regular`, `complex`). It aligns with Material Design's motion speed guidelines.

- **`geometry/`**
  - **`BorderWidthTokens`**: Defines stroke widths for borders (e.g., `hairline`, `thin`, `regular`).
  - **`BreakpointTokens`**: Defines responsive breakpoints (`mobile`, `tablet`, `desktop`).
  - **`ElevationTokens`**: Defines a 6-level elevation system (0-5) based on Material Design 3, with semantic names like `small`, `medium`, `large`.
  - **`IconSizeTokens`**: Defines a scale for icon sizes (e.g., `small`, `standard`, `large`, `hero`).
  - **`RadiusTokens`**: Defines a scale for corner radii (e.g., `extraSmall`, `medium`, `extraLarge`).
  - **`SpacingTokens`**: Defines a 4dp-based spacing scale for padding, margins, and gaps (e.g., `extraSmall`, `small`, `medium`).

- **`painting/`**
  - **`BoxShadowTokens`**: Predefined `BoxShadow` values for different elevation levels (`small`, `medium`, `large`).
  - **`OpacityTokens`**: Defines opacity values for interactive states like `disabled`, `hover`, `focus`, and `pressed`.
  - **`TextShadowTokens`**: Predefined `Shadow` values for text.
  - **`ZIndexTokens`**: Defines the stacking order for components (`background`, `content`, `modal`, `overlay`).

- **`core/`**
  - **`MaterialDimensions`**: A collection of raw `double` constants, mostly on a 4dp grid, used by other token classes.
  - **`MaterialTimings`**: Raw `int` constants for animation milliseconds.

### 3.2. Resolvers

Resolvers are helper classes that use the token values to create Flutter widgets and objects. They are accessed through the `DesignTokens` object (e.g., `context.tokens.padding`).

- **`borders/`**
  - **`BorderRadiusResolver`**: Creates `BorderRadius` objects from `RadiusTokens`.
  - **`InputBorderResolver`**: Creates `OutlineInputBorder` and `UnderlineInputBorder` objects.
  - **`RadiusResolver`**: Creates `Radius` objects.
  - **`ShapeResolver`**: Creates `ShapeBorder` objects like `RoundedRectangleBorder`.

- **`edge_insets/`**
  - **`EdgeInsetsResolver`**: Creates `EdgeInsets` from `SpacingTokens`.
  - **`PaddingResolver`**: A convenience wrapper around `EdgeInsetsResolver` that creates `Padding` widgets.

- **`GapResolver`**: Creates `Gap` widgets (from the `gap` package) using `SpacingTokens`.

- **`GoogleFontsResolver`**: A utility to fetch font styles from the `google_fonts` package.

### 3.3. Helpers and Widgets

- **`helpers/`**
  - **`TaggedValue`**: A simple class to associate a name with a value, used for debugging and equality checks.
  - **`DesignTokensAttributeError`**: Defines error messages for unsupported token attributes.

- **`widgets/`**
  - **`AdaptiveWidget`**: A base class for creating widgets that render differently based on the target platform (iOS, Android, Web, etc.).

## 4. How to Use

1.  **Initialization**: Create an instance of `DesignTokens`. You can use the default constructor or `DesignTokens.material()` which allows for overriding specific token sets with a `Map`.

2.  **Theme Integration**: Add the `DesignTokens` instance to your `ThemeData`'s `extensions` list.

    ```dart
    MaterialApp(
      theme: ThemeData(
        extensions: <ThemeExtension<dynamic>>[
          DesignTokens(),
        ],
      ),
      // ...
    );
    ```

3.  **Usage in Widgets**: Access the tokens and resolvers via the `context.tokens` extension.

    ```dart
    // Using a spacing token with a resolver
    Padding(
      padding: context.tokens.edgeInsets.all(MaterialSpacings.medium),
      child: Text('Hello'),
    );

    // Using a radius token with a resolver
    Container(
      decoration: BoxDecoration(
        borderRadius: context.tokens.borderRadius.all(MaterialRadius.large),
      ),
    );

    // Using a gap resolver
    Column(
      children: [
        Text('First'),
        context.tokens.gap.small, // Creates a Gap(8)
        Text('Second'),
      ],
    );
    ```
