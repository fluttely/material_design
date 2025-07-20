# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.5.0

- **BREAKING**: Token classes are now `abstract class` instead of `abstract final class` to allow for extension.
- **BREAKING**: Change dart version from `3.8.1` to `>=2.17.0 <4.0.0` to allow for extension.
- **BREAKING**: The `equatable` dependency has been removed.
- **FEAT**: Added `M3Margins` and `M3Spacers` classes for more semantic layout spacing.
- **FEAT**: Added new radius and shape tokens (`largeIncreased`, `extraLargeIncreased`, `extraExtraLarge`).
- **FEAT**: The example app has been revamped to better demonstrate the updated tokens, including a new `LaunchURLText` widget.
- **CHORE**: Lowered the minimum Dart SDK requirement from `3.8.1` to `2.17.0` for wider project compatibility.
- **CHORE**: As restrições do SDK do Flutter e do Dart foram atualizadas.
- **CHORE**: `very_good_analysis` has been commented out in `analysis_options.yaml`.
- **DOCS**: `README.md` has been updated with the latest changes.

## 0.4.1

- **BREAKING**: Renamed `M3Opacity` to `M3StateLayerOpacity` to better reflect its purpose.
- **feat**: Added `LaunchURLText` widget to the example app for styled URL links.
- **feat**: Added `M3StateLayerOpacityButtonExample` to demonstrate state layer opacity on a custom button.
- **refactor**: Updated the example app to consistently use `Theme.of(context).textTheme` for typography.
- **docs**: Updated `README.md` with the latest changes and examples.

## 0.4.0

- **BREAKING**: `M3Motion` has been refactored into `M3MotionDuration` and `M3MotionEasing` to better align with the Material Design 3 specifications.
- **BREAKING**: `M3Density` has been removed and replaced with `M3VisualDensity`, which uses Flutter's native `VisualDensity` class.
- **FEAT**: Added new icon sizes: `dense`, `medium`, `large`, and `extraLarge` to `M3IconSize`.
- **FEAT**: The `M3Shadow` implementation has been revised, including a new `fromElevation` method.
- **FEAT**: Added the `url_launcher` dependency for opening URLs.
- **FIX**: The Z-Index section on the example page has been reworked for a better visual demonstration.
- **CHORE**: Various formatting and code cleanup improvements in the example app.

## 0.3.0

- **Breaking Change:** Renamed all tokens from `Material*` to `M3*` (e.g., `MaterialTonalColor` to `M3TonalColor`) to align with Material Design 3 naming conventions and avoid conflicts with Flutter's `Material` class.
- **Breaking Change:** Reorganized the file structure by moving all token files to `lib/src/m3/tokens/` and renaming them with the `m3_` prefix (e.g., `motion.dart` to `m3_motion.dart`). This improves clarity and consistency.
- **Feat:** Implemented a responsive layout in the example app using `NavigationRail` and `NavigationDrawer` to showcase the `M3Breakpoint` token.
- **Fix:** Updated the copyright year in the `LICENSE` file.
- **Chore:** Updated `pubspec.yaml` by removing the `homepage` field and adding `issue_tracker`.

## 0.2.6

- **Feat:** Added `MaterialDensity` token to control UI density.
- **Refactor:** Replaced `MaterialColorScheme.create` with `ColorScheme.fromSeed` to align with Flutter's core API.
- **Refactor:** Refined motion tokens by separating them into `MotionEasing` and `MotionDuration` for more granular control.
- **Example:** Added a new `DensityPage` to the example app to showcase the `MaterialDensity` token.
- **Example:** Updated the example app to use the new motion tokens and `ColorScheme.fromSeed`.

## 0.2.5

- **Refactor:** The `MaterialMotionToken` has been renamed to `MotionScheme` to better align with the Material Design 3 specifications.
- **Feature:** Introduced `MotionDurations` and `MotionEasings` classes to provide more granular control over animation durations and easing curves.
- **Example:** Simplified the elevation page logic and updated the motion page to use the new `MotionScheme`.

## 0.2.4

- **Refactor:** Renamed `MaterialSurface` to `MaterialTonalColor` and its method `getTintedColor` to `fromElevation` for better alignment with Material Design 3 terminology, where tonal colors are applied based on surface elevation.
- **Refactor:** Renamed `MaterialColorSchemes` to `MaterialColorScheme` to maintain consistency with Flutter's `ColorScheme`.
- **Feat:** Added detailed comments to `MaterialBreakpoint` explaining the different breakpoint values based on the Material Design 3 guidelines.
- **Feat:** Added `allLevels` to `MaterialElevation`, providing a convenient list of all elevation levels.
- **Fix:** Ignored `.vscode/` and `.env` files in `.gitignore` to avoid committing editor-specific settings and environment variables.
- **Example:** Updated the example app to use `MaterialTonalColor.fromElevation` and other related changes.

## 0.2.3

- **Docs:** Added detailed examples to `README.md` for `MaterialBorder`, `MaterialOpacity`, `MaterialBreakpoint`, `MaterialIconSize`, and `MaterialZIndex`.
- **Example:** Added a new `MotionPage` to the example app to showcase all `MaterialMotion` tokens.
- **Example:** Updated the `OtherTokensPage` in the example app to include showcases for `MaterialBreakpoint`, `MaterialIconSize`, and `MaterialZIndex`.
- **Refactor:** Renamed `MotionToken` to `MaterialMotionToken` for better clarity and consistency.
- **Fix:** Removed `MaterialBorder.none` as it was redundant (equivalent to `0`).

## 0.2.2

### Changed

- **Docs** `README.md` with clearer instructions and updated usage examples.

## 0.2.1

### Changed

- **Renamed** `MaterialColorSchemes` to `MaterialColorScheme`.
- **Removed** static schemes `lightScheme` and `darkScheme`; use the `create()` method instead.

## 0.2.0

### Added

- **`MaterialSurface` Utility**: Introduced a new utility class with a `getTintedColor()` method to easily apply Material 3 surface tint based on elevation. This encapsulates the `ElevationOverlay` logic into a clean, reusable token.

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
