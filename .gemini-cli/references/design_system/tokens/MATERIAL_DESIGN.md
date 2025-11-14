# Material Design 3 Token System

## 1. Overview

Design tokens are the atomic, reusable design decisions that constitute a design system's visual style. In Material Design 3 (M3), they function as the single source of truth, replacing static, hard-coded values (like hex codes) with a system of named references. This token-based architecture is fundamental to M3's flexibility, enabling features like dynamic color and simplifying the process of theming.

## 2. Token Hierarchy

The M3 token system is organized into a three-level hierarchy, which allows for a clear separation of concerns from foundational values to component-specific applications.

### 2.1. Reference Tokens

**Role**: These tokens represent the entire palette of possible design values. They are the most primitive level of the system and are not meant to be used directly in component styling. Their purpose is to establish the full set of available style options.

**Naming Convention**: Reference tokens follow a structured path-based naming convention, typically including the category, scale, and value.
- **Example**: `md.ref.palette.secondary90` refers to a specific color shade (#E8DEF8) within the secondary color palette.

### 2.2. System Tokens

**Role**: System tokens are derived from reference tokens and define the overall character and identity of a specific theme. They represent the curated set of design choices for key visual attributes like color, typography, elevation, and shape. These are the tokens that developers and designers should primarily interact with when theming an application at a global level.

**Naming Convention**: System tokens have semantic names that describe their role in the UI, making them self-explanatory.
- **Example**: `md.sys.color.primary` defines the primary color for the current theme. Changing this one token would update the primary color across the entire application.

### 2.3. Component Tokens

**Role**: Component tokens are the most specific level of the hierarchy. They are assigned to individual elements within a component, defining their specific styling. These tokens are derived from system tokens and allow for fine-grained control over the appearance of each component.

**Naming Convention**: Component tokens are named based on the component, its state, and the element being styled.
- **Example**: `md.comp.filled-button.container.color` defines the background color of a filled button. By default, this would likely map to the `md.sys.color.primary` system token, but it can be overridden for specific button styles.

## 3. Key Token Categories

The M3 token system covers a wide range of visual attributes:

- **Color**: Defines the color scheme, including primary, secondary, tertiary, error, surface, and on-surface colors.
- **Typography**: Defines the type scale, including font families, weights, and sizes for different text styles like `display`, `headline`, `title`, `body`, and `label`.
- **Elevation**: Defines the z-axis depth for surfaces, creating a sense of hierarchy and focus.
- **Shape**: Defines corner radii for components, from small to extra-large.
- **Spacing**: Although less explicitly defined in the top-level documentation, spacing tokens are used for margins, padding, and layout grids.
- **Motion**: Defines animation timings and easing curves for transitions.

## 4. Theming and Development

The token system is designed to bridge the gap between design and development. Tools like the Material Theme Builder allow designers to export token definitions directly into code for various platforms, including Flutter, ensuring that the design intent is accurately implemented. This creates a shared language and a more efficient workflow.
