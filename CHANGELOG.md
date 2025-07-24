# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.8.0

### 🔄 BREAKING CHANGES

- **Elevation System Overhaul**: Complete refactor of the elevation token system with improved type safety and API consistency
  - **Removed `M3TonalColor` class**: Replaced with internal `_M3TonalColor` implementation accessed through elevation tokens
  - **Removed `M3Shadow` class**: Replaced with internal `_M3ShadowToken` implementation accessed through elevation tokens
  - **New Unified API**: All elevation-related functionality now accessed through `M3ElevationToken.levelX.shadows` and `M3ElevationToken.levelX.surfaceColor(context)`

### ✨ Major Features

- **New Token Interface System**: Introduced `IM3Token<T>` interface for consistent token architecture across the library
- **Enhanced Elevation Tokens**:
  - Added `M3ElevationToken` enum with 6 predefined levels (level0-level5)
  - Added `M3ComponentElevationToken` enum for component-specific elevations (card, button, fab, appBar, etc.)
  - Added `M3StateElevationToken` enum for interactive state elevations (hover, pressed, focus, etc.)
- **Improved Type Safety**: All elevation tokens now implement `IM3ElevationToken` interface with consistent `value` and `hasShadow` properties
- **Advanced Extension Methods**: Added `IM3ElevationTokenVisuals` and `IM3ElevationTokenComparison` extensions for enhanced functionality

### 🎯 Enhanced Developer Experience

- **Simplified API**: Unified access pattern for shadows and surface colors through elevation tokens
- **Better Documentation**: Comprehensive inline documentation with Material 3 specification references
- **Component-Specific Tokens**: Predefined elevation values for all major Material 3 components
- **State-Aware Elevations**: Built-in support for interactive states (hover, pressed, focus, drag)

### 🏗️ Architectural Improvements

- **Modular Design**: Elevation system split into focused modules (`_m3_shadow_token.dart`, `_m3_tonal_color.dart`)
- **Consistent Naming**: All elevation-related classes follow unified naming conventions
- **Better Abstraction**: Internal implementation details hidden behind clean public APIs
- **Enhanced Performance**: Optimized shadow and surface color calculations

### 🐛 Bug Fixes

- **Demo Application**: Fixed incorrect elevation token usage in demo surface cards
- **Documentation**: Corrected widget references and improved code examples
- **Code Quality**: Updated analysis configuration to use `very_good_analysis` for stricter linting

### 📚 Documentation Updates

- **README.md**: Updated examples to use new elevation token API
- **ENHANCED_FEATURES.md**: Refreshed elevation examples with current API patterns
- **Inline Documentation**: Added comprehensive documentation throughout the elevation system
- **Example Applications**: Updated demo and example apps to showcase new elevation capabilities

### 🔧 Migration Guide

**Before (v0.7.5):**

```dart
// Old API - no longer available
Container(
  decoration: BoxDecoration(
    color: M3TonalColor.surface3(context),
    boxShadow: M3ShadowToken.fromElevation(4.5),
  ),
)
```

**After (v0.8.0):**

```dart
// New unified API
Container(
  decoration: BoxDecoration(
    color: M3ElevationToken.level3.surfaceColor(context),
    boxShadow: M3ElevationToken.level3.shadows,
  ),
)

// Or for custom elevation values
final elevation = M3ElevationToken.fromValue(4.5);
Container(
  decoration: BoxDecoration(
    color: elevation.surfaceColor(context),
    boxShadow: elevation.shadows,
  ),
)
```

### 🎨 Component Usage Examples

```dart
// Component-specific elevations
Card(
  elevation: M3ComponentElevationToken.card.value,
  surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
)

// State-aware elevations
AnimatedContainer(
  decoration: BoxDecoration(
    color: isHovered
      ? M3StateElevationToken.cardHover.surfaceColor(context)
      : M3ComponentElevationToken.card.surfaceColor(context),
    boxShadow: isHovered
      ? M3StateElevationToken.cardHover.shadows
      : M3ComponentElevationToken.card.shadows,
  ),
)
```

## 0.7.5

### Enhanced Demo Experience

- **Live Demo Integration**: Added prominent live demo section to README.md with direct link to interactive showcase
  - Featured interactive demo at `https://fluttely.github.io/material_design/` with comprehensive token visualization
  - Reorganized README structure with dedicated demo section for better user onboarding
  - Added links to additional resources including Material Design 3 guidelines and Flutter M3 documentation

### Major Demo Application Improvements

- **Comprehensive Documentation**: Added extensive inline documentation throughout the demo application

  - Complete component and class documentation with detailed feature descriptions
  - Enhanced code comments explaining Material Design 3 implementation patterns
  - Improved developer experience with clear architectural explanations

- **Enhanced Navigation Experience**:

  - Custom NavigationRail implementation with Material Design 3 hover animations and state layer effects
  - Improved mobile navigation with floating hamburger menu and proper M3 specifications
  - Better visual hierarchy with organized Foundation, Styles, and Components sections
  - Fixed bottom controls layout with proper spacing and alignment

- **Material Design 3 Compliance**:
  - Updated `WindowSizeClass` references to use `M3WindowSizeClass` for proper M3 alignment
  - Enhanced theme implementation with proper Material 3 color schemes and component theming
  - Added `useMaterial3: true` flag to theme configurations for full M3 compliance
  - Improved adaptive layouts following M3 responsive navigation patterns

### Example Application Enhancements

- **Advanced Theme System**: Enhanced example application with sophisticated theming capabilities

  - Added smooth theme transition animations with AnimationController
  - Comprehensive Material 3 component theme implementations for both light and dark modes
  - Enhanced AppBar, Card, and Button theming with proper M3 specifications
  - Improved color scheme generation with dynamic seed color support

- **Better Code Organization**: Restructured example application with improved architecture
  - Enhanced documentation with detailed class and method descriptions
  - Better separation of concerns with dedicated theme building methods
  - Improved code readability and maintenance

### User Experience Improvements

- **Updated Application Titles**: Changed demo app title to "Material Design 3 Token Showcase" for better clarity
- **Enhanced Visual Design**: Improved navigation item styling with proper M3 indicators and hover effects
- **Better Resource Links**: Updated and reorganized links to Material Design documentation and resources
- **Improved Accessibility**: Enhanced touch targets and navigation patterns following M3 accessibility guidelines

### Development Experience

- **Code Quality**: Extensive code documentation and architectural improvements
- **Better Examples**: Enhanced example implementations demonstrating proper M3 patterns
- **Maintainability**: Improved code organization and separation of concerns

## 0.7.4

### CI/CD & Deployment

- **GitHub Actions Workflow**: Added automated deployment workflow for demo application
  - Introduced `.github/workflows/deploy-demo.yml` with GitHub Pages deployment
  - Supports both push-to-main and manual workflow dispatch triggers
  - Automated Flutter web build with proper base href configuration
- **Custom Domain Setup**: Added CNAME file for custom domain deployment at `material-design.fluttely.com`
- **Local Deployment Script**: Created `demo/deploy.sh` script for manual deployment workflows
- **Deploy Status Badge**: Added GitHub Actions deploy status badge to README.md

### Bug Fixes

- **Color Display Enhancement**: Fixed color picker button styling in example application
  - Added outline border to color circles for better visibility
  - Improved color hex code display with robust string formatting
  - Replaced dynamic spacing token with fixed spacing value for stability

### Documentation

- **README Updates**: Updated package version references from `0.7.3` to `0.7.4` across documentation
- **Version Consistency**: Synchronized version numbers across all package files and dependencies

### Development

- **Dependency Updates**: Updated pubspec.lock files in both demo and example applications
- **Version Alignment**: Maintained consistent versioning across the project structure

## 0.7.3

### Features

- **New Simplified Demo Application**: Added a complete new `demo/` directory containing a streamlined, single-file demonstration of the Material Design library
  - Consolidated all key library features into one scrollable page for easier user onboarding
  - Features comprehensive showcase of foundations (spacing, visual density, opacity, borders), styles (colors, typography, shapes, elevation), and components (buttons, cards, chips)
  - Interactive theme controls with dark/light mode toggle and seed color picker with 8 preset colors
  - Live breakpoint detection and adaptive layout behavior
  - Fully localized in English for global accessibility
  - Cross-platform support (Android, iOS, Web, Windows, macOS, Linux)

### Enhanced Developer Experience

- **Improved Example Navigation**: The original complex example application has been refined with better navigation structure
- **Better Library Accessibility**: Users now have two options:
  - `demo/` - Simple, single-file showcase for quick library evaluation and testing
  - `example/` - Comprehensive, detailed showcase for in-depth exploration of advanced features
- **Reduced Complexity**: New developers can now easily understand and test the library features without navigating through complex multi-page structures

### Documentation

- **Updated README.md**: Enhanced documentation to reflect the new demo structure and improved library presentation
- **Analysis Configuration**: Updated `analysis_options.yaml` for better code quality and consistency

### Migration Guide

For users upgrading from v0.7.2:

- No breaking changes to the core library APIs
- The original `example/` app remains fully functional with all existing features
- The new `demo/` app provides an alternative, simplified entry point for library evaluation
- All existing code using the library tokens and utilities will continue to work without modification

### Development

- **Multi-Platform Support**: Both demo and example applications support all Flutter target platforms
- **Dependency Management**: Proper dependency isolation between demo and example applications
- **Build Configuration**: Complete build configurations for all supported platforms in the new demo app

## 0.7.2

### Features

- **Enhanced Documentation**: Completely revamped README.md with improved structure, clearer value proposition, and comprehensive feature highlights
- **Professional Presentation**: Added visual emoji indicators, popularity badge, and enhanced package description for better discoverability
- **Better Developer Experience**: Improved code examples with proper formatting, better context, and clearer inline documentation
- **Resource Organization**: Added dedicated sections for additional resources, contributing guidelines, and license information
- **Elevation System Enhancement**: Improved elevation token interface with clearer property naming and better shadow interpolation

### Refactor

- **Token Organization**: Major reorganization of the token system for better structure and maintainability:
  - Moved button component tokens to `lib/src/m3/tokens/comp/button/` for better component organization
  - Relocated shadow tokens to `lib/src/m3/tokens/sys/elevation/` to align with elevation system
  - Moved geometry tokens (`border`, `breakpoint`, `icon_size`, `z_index`) to `lib/src/m3/tokens/sys/geometry/` for better categorization
  - Relocated visual density token to `lib/src/m3/tokens/sys/interaction/` to align with interaction patterns
- **Import Structure**: Updated main export file (`m3.dart`) to reflect new token organization and maintain backward compatibility
- **Elevation Token Improvements**:
  - Renamed `dp` property to `value` across all elevation tokens for consistency with other token patterns
  - Enhanced shadow interpolation algorithm for smoother transitions between elevation levels
  - Improved elevation interface documentation and method signatures

### Documentation

- **README Improvements**:
  - Added compelling tagline and clear value proposition
  - Introduced comprehensive "Key Features" section highlighting type safety, completeness, and production readiness
  - Enhanced code examples with better formatting and clearer explanations
  - Fixed inconsistent example formatting and corrected token usage patterns
  - Added proper installation instructions and usage examples
  - Included dedicated sections for additional resources and community contributions
  - Updated migration guide with more comprehensive examples showing the evolution from v0.6.1 to v0.7.0+

### Fix

- **Example App Updates**:
  - Fixed elevation token usage throughout example app to use new `.value` property
  - Updated accessibility showcase to use correct elevation values
  - Improved code formatting and consistency across showcase pages
  - Removed obsolete commented code and examples for cleaner codebase

### Chore

- **Example Dependencies**: Updated example app's pubspec.lock to reflect new version
- **Code Cleanup**: Removed unused example code and improved formatting consistency

## 0.7.1

### Fix

- Corrected state layer opacity values to align with the latest Material Design 3 guidelines.
- Adjusted border token values for better consistency.

### Docs

- Updated `README.md` with minor corrections.

### Chore

- Removed duplicated and unused files from the example application.

## 0.7.0

### BREAKING CHANGES

- **Tokens:** The Material 3 token system has been completely refactored for better organization and clarity.
  - System tokens are now organized under `lib/src/m3/tokens/sys/`. This includes `Color`, `Elevation`, `Motion`, `Shape`, `Spacing`, and `Typography`.
  - Many token files have been moved, renamed, or consolidated. Please refer to the updated documentation for the new token structure.
  - The `M3Theme` class has been removed as part of this refactoring.

### Features

- **Components:** Added a new Material 3 Button component (`M3CompButton`).
- **Tokens:** Introduced new system tokens for `Elevation`, `Motion`, `Shape`, `Spacing`, and `StateLayerOpacity`.

### Refactor

- Refactored the entire token system to align more closely with the official Material Design 3 specifications.
- Renamed and moved several internal utilities and classes to a new `mt` (Material Toolkit) namespace for better internal structure.
- Updated the example application to reflect all the latest changes and new APIs.
- Renamed the "Density" showcase page to "Visual Density" for clarity.

### Chores

- Updated `.gitignore` to exclude new generated files.
- Updated `README.md` with the latest information.

## 0.6.2

### Major Refactoring: Token System Overhaul

- **Shape System**: Replaced `BoxDecoration` with `ShapeDecoration` across the example app for better semantics. Introduced `M3BorderRadius` and converted `M3Radius` from `double` to `Radius` constants, providing a more robust and type-safe way to define shapes.
- **Motion Tokens**: Consolidated motion-related tokens. `M3MotionDuration` and `M3MotionEasing` have been merged into a single, more organized `m3_motion.dart` file under the `sys` directory, improving clarity and discoverability.
- **File Structure**: Reorganized the token file structure to better align with the Material Design 3 system. Legacy and unused token files like `M3ColorRoles`, `m3_radius.dart` (the old `double` based one), and `m3_examples.dart` have been removed to streamline the package.

### Breaking Changes

- **Removed `M3ColorRoles`**: The static `M3ColorRoles` class has been removed. Please use the color scheme provided by the `M3Theme` or `Theme.of(context).colorScheme` for semantic color access.
- **Removed `M3Radius` (as `double`)**: The `M3Radius` class that provided `double` values has been replaced by `M3BorderRadius` (which provides `BorderRadius` objects) and a new `M3Radius` class that provides `Radius` objects.
- **Consolidated Motion Tokens**: `M3MotionDuration` and `M3MotionEasing` are no longer separate files. Import `package:material_design/material_design.dart` and use the `M3MotionDuration` and `M3MotionEasing` classes directly.

### Enhancements & Fixes

- **Code Cleanup**: Performed a general code cleanup, removing obsolete files and refactoring the example app for better readability and consistency.
- **Shape Implementation**: Consistently replaced `BorderRadius.circular()` with the new `M3BorderRadius` constants throughout the example app.
- **New `md` Module**: Introduced a new `md` module for future development, starting with a new barrel file `md.dart`.

## 0.6.1

### Refinements and Internationalization

- **Refactored README**: Simplified the documentation to focus on core features and improve clarity.
- **Internationalized Example App**: All user-facing strings in the accessibility showcase are now in English, making the example more accessible to a global audience.
- **Code Cleanup**: Minor code cleanup and refactoring in the example app for better readability and maintenance.

## 0.6.0

### New Features

- **Complete M3 Theme System**: Introduced `M3Theme`, an integrated theme builder that generates a complete `ThemeData` from a seed color, with full support for light, dark, and high-contrast modes.
- **Comprehensive Accessibility Utilities**: Added the `M3Accessibility` class, providing a suite of tools for building WCAG-compliant UIs, including accessible form fields, focus indicators, contrast checking, and touch target enforcement.
- **Adaptive Design System**: Implemented the `M3Adaptive` class with helpers for responsive layouts (`M3Adaptive.responsiveLayout`), adaptive navigation (`M3AdaptiveScaffold`), and adaptive components that adjust to different screen sizes and platforms.
- **Advanced Token Utilities**: Added new utility classes for enhanced token functionality:
  - `M3TypeScale`: Responsive and accessible typography helpers.
  - `M3ColorUtils`: Color manipulation and contrast validation.
  - `M3ShapeUtils`: Responsive and brand-specific shape generation.
  - `M3MotionUtils`: Contextual animation patterns (fade, slide, scale).

### Breaking Changes

- **Token Architecture Refactor**: The entire token system has been restructured to follow the official Material Design 3 hierarchy:
  - **Reference Tokens (Ref)**: Foundational values (e.g., `M3RefPalette`, `M3RefDuration`).
  - **System Tokens (Sys)**: Semantic roles (e.g., `M3SysColor`).
  - **Component Tokens (Comp)**: Component-specific values (e.g., `M3CompButton`).
- The old token structure is now considered legacy and will be deprecated in a future version.

### Enhancements & Fixes

- **Example App Overhaul**: The example app has been completely reorganized into `Foundations`, `Styles`, and `Components` sections to provide a comprehensive showcase of all new features and the new token architecture.
- **Documentation**: Massively updated `README.md` and added `ENHANCED_FEATURES.md` to document the new capabilities.
- **Code Quality**: Refactored numerous widgets and classes for better organization, consistency, and adherence to M3 specifications.

## 0.5.1

- **BREAKING**: Renamed `M3Margins` to `M3Margin` and `M3Spacers` to `M3Spacer` for better naming consistency.
- **DOCS**: Updated `README.md` to reflect the new class names and provide clearer examples.
- **CHORE**: Updated the example app to use the new `M3Margin` and `M3Spacer` classes.

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
