## 0.1.0

### Added

- **Complete Material 3 Token System**:

  - `MaterialColorSchemes`: Light and dark color schemes generated from a seed color.
  - `MaterialTypeScale`: Full set of 15 M3 text styles (Display, Headline, Title, Body, Label).
  - `MaterialShape`: `ShapeBorder` tokens for all M3 corner radius levels.
  - `MaterialShadow`: `BoxShadow` tokens aligned with the 6 elevation levels of M3.
  - `MaterialBorder`: Tokens for border widths.

- **Style Guide Example**: The example app was completely rewritten to serve as a visual style guide for all tokens.
- **Barrel Files**: Added barrel files for easy token import by category (`color`, `typography`, `geometry`, etc.).

### Changed

- **Refactored `MaterialOpacity`**: Aligned with M3 state layer values (Hover, Focus, Press, Drag) and disabled opacities.
- **Refactored `MaterialRadius`**: Values adjusted to match the M3 corner radius token scale.
- **Refactored `MaterialIconSize`**: Simplified to focus on the default 24dp size, with guidance for contextual usage.
- **Refactored `motion.dart`**: Fixed `asTween` return type to `Animatable<T>` to ensure proper typing.

## 0.0.1

### Added

- Introduced `MaterialElevation` tokens for consistent elevation styling.
