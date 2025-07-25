# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adherves to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.10.0

### 💥 BREAKING CHANGES

- **Major Token System Refactor**: The token system has been significantly refactored to improve consistency, remove redundancy, and align more closely with a unified design system architecture.
  - **Unified Shape Tokens**: `M3BorderRadiusToken` and `M3RadiusToken` are now internal (`_M3BorderRadiusToken`, `_M3RadiusToken`). All shape properties should be accessed directly through `M3ShapeToken`.
    - **Before**: `M3BorderRadiusToken.medium.value`
    - **After**: `M3ShapeToken.medium.borderRadius`
  - **Screen Size Enum Renamed**: `M3WindowSizeClass` has been renamed to `M3ScreenSize` for better clarity and to avoid conflicts with Flutter's own window size classes.
  - **Private Component/State Tokens**: `M3ComponentElevationToken` and `M3StateElevationToken` have been made private (`_M3ComponentElevationToken`, `_M3StateElevationToken`) as they are intended for internal use within the system.
  - **Simplified Motion API**: `M3MotionToken` now includes `duration` and `easing` getters, simplifying animation definitions.

### ✨ Enhancements

- **Improved API Consistency**: The token API is now more consistent and predictable. Accessing related values (like radius from a shape) is more intuitive.
- **Streamlined Architecture**: By removing redundant and reference-level tokens, the public API is smaller, cleaner, and easier to learn.
- **Enhanced Readability**: The new patterns (`M3ShapeToken.medium.borderRadius`) make the code more declarative and easier to read.

### 🗑️ Deprecations & Removals

- **Removed Reference Tokens**: The `M3Ref...` token files (`M3RefPalette`, `M3RefOpacity`, `M3RefTypeface`) have been removed from the public API. Their values are now integrated directly into the system tokens where needed.
- **Removed Component-Specific Button Tokens**: `M3CompButton` has been removed. Use standard Flutter `ButtonStyle` with system tokens for customization.
- **Removed `M3ColorSchemeToken`**: This has been removed as part of the color system simplification. Use `Theme.of(context).colorScheme` for semantic color access.
- **Removed Demo Component Showcase**: The `components_showcase_page.dart` file has been deleted from the demo application as part of a broader demo simplification effort.

### 🔧 Migration Guide

**Shape and Radius:**

Update all references to `M3BorderRadiusToken` to use the new `M3ShapeToken` accessors.

**Before (v0.9.2):**
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadiusToken.medium.value,
  ),
)
```

**After (v0.10.0):**
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: M3ShapeToken.medium.borderRadius,
  ),
)
```

**Adaptive Layouts:**

Update all references from `M3WindowSizeClass` to the new `M3ScreenSize`.

**Before (v0.9.2):**
```dart
final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
if (sizeClass == M3WindowSizeClass.compact) {
  // ...
}
```

**After (v0.10.0):**
```dart
final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
if (sizeClass == M3ScreenSize.compact) {
  // ...
}
```

## 0.9.2

### 🔄 BREAKING CHANGES

- **Typography Token Naming**: Renamed `M3TypeScaleToken` to `M3TextStyleToken` throughout the entire codebase for better semantic clarity and consistency with Material Design 3 nomenclature
  - All references to `M3TypeScaleToken` in code, documentation, and examples have been updated to `M3TextStyleToken`
  - The class provides the same 15 `TextStyle` tokens (displayLarge to labelSmall) with identical functionality
  - Enhanced README examples showing `copyWith()` usage for customizing text styles

### ✨ Enhancements

- **Improved API Semantics**: The new `M3TextStyleToken` name better reflects that these are complete text style definitions rather than just type scale values
- **Enhanced Documentation**: Updated all documentation files (English and Portuguese) to use the new token naming convention
- **Better Code Examples**: Improved README with more comprehensive typography examples showing real-world usage patterns
- **Consistent Token Interface**: All typography-related utility methods (responsiveDisplay, enhancedReadability, monoVariant, highContrast) maintained under the new class name

### 📚 Documentation Updates

- **Comprehensive Naming Updates**: Updated all documentation files in both English (`en_US`) and Portuguese (`pt_BR`) directories
- **Implementation Guide Updates**: Refreshed implementation examples and component mappings with new token references
- **README Enhancement**: Added better typography examples showing advanced usage with `copyWith()` method
- **Demo Application Updates**: Updated showcase pages to demonstrate the new `M3TextStyleToken` API

### 🎯 Demo & Example Applications

- **Complete Demo Update**: All demo showcase pages updated to use `M3TextStyleToken`
- **Theme Integration**: Updated theme provider to use new typography token naming
- **Interactive Examples**: Enhanced typography page and utility examples with new token references

### 🔧 Migration Guide

**Before (v0.9.1):**
```dart
Text('Title', style: M3TypeScaleToken.headlineMedium.value)
textTheme: TextTheme(
  displayLarge: M3TypeScaleToken.displayLarge.value,
  bodyMedium: M3TypeScaleToken.bodyMedium.value,
)
```

**After (v0.9.2):**
```dart
Text('Title', style: M3TextStyleToken.headlineMedium.value)
textTheme: TextTheme(
  displayLarge: M3TextStyleToken.displayLarge.value,
  bodyMedium: M3TextStyleToken.bodyMedium.value,
)
```

### 🐛 Compatibility Notes

- **No Functional Changes**: All text style values and functionality remain identical - only the class name has changed
- **Same API Structure**: All properties (.value, .responsiveDisplay, .enhancedReadability, etc.) maintain the same interface
- **Import Structure Unchanged**: Main package imports continue to work as before

### Recommended Version Bump: **MINOR** (0.9.1 → 0.9.2)

This release contains a breaking change in class naming but maintains API compatibility and adds semantic improvements to the typography system.

## 0.9.1

### 🐛 Bug Fixes

- **Visual Density Token**: Fixed critical StackOverflowError in `M3VisualDensityToken.adaptivePlatform` by removing recursive call and directly returning `VisualDensity.adaptivePlatformDensity`
- **Motion Tokens API**: Updated motion showcase to use direct token properties instead of `.value` accessor for better consistency
- **Shape Token References**: Updated all documentation and demo references from `M3Shape` to `M3ShapeToken` for consistency

### ✨ Enhancements

- **Enhanced Visual Density Documentation**: Improved inline documentation with clearer property descriptions and usage examples
- **Better Type Safety**: Enhanced visual density token implementation with proper typing and clearer API contracts
- **Motion Token Consistency**: Standardized motion token usage pattern across demo application

### 📚 Documentation Updates

- **Token Reference Updates**: Updated all documentation files to reflect correct `M3ShapeToken` naming
- **API Documentation**: Enhanced visual density token documentation with detailed property descriptions
- **Usage Examples**: Updated code examples throughout documentation to use correct token references

### 🔧 Code Quality

- **Gitignore Cleanup**: Updated `.gitignore` to use more generic trash directory pattern (`lib/src/trash` instead of `lib/src/m3/trash`)
- **Code Organization**: Improved visual density token file structure and removed redundant utility methods
- **Better Error Handling**: Eliminated potential runtime errors through proper token implementation

### Recommended Version Bump: **PATCH** (0.9.0 → 0.9.1)

This release contains bug fixes and documentation improvements without breaking changes to the public API.

## 0.9.0

### 🔄 BREAKING CHANGES

- **Token System Standardization**: Massive refactoring to standardize all token class names with "Token" suffix for better consistency and clarity

  - **Renamed Core Token Classes**:

    - `M3Spacing` → `M3SpacingToken`
    - `M3Elevation` → `M3ElevationToken`
    - `M3Shape` → `M3ShapeToken`
    - `M3Motion` → `M3MotionToken`
    - `M3MotionDuration` → `M3MotionDurationToken`
    - `M3MotionEasing` → `M3MotionEasingToken`
    - `M3Border` → `M3BorderToken`
    - `M3Breakpoint` → `M3BreakpointToken`
    - `M3IconSize` → `M3IconSizeToken`
    - `M3ZIndex` → `M3ZIndexToken`
    - `M3VisualDensity` → `M3VisualDensityToken`
    - `M3StateLayerOpacity` → `M3StateLayerOpacityToken`
    - `M3Opacity` → `M3OpacityToken`
    - `M3TypeScale` → `M3TypeScaleToken`

  - **Removed Legacy System Classes**:
    - `M3SysColor` → Replaced with `M3ColorSchemeToken`
    - `M3TypeScale` → Consolidated into `M3TypeScaleToken`
    - `M3VisualDensity` → Renamed to `M3VisualDensityToken`

### ✨ Enhanced Token Architecture

- **Improved Token Consistency**: All token classes now follow a unified naming convention with "Token" suffix
- **Better API Clarity**: The "Token" suffix makes it clear that these are design token classes rather than utility classes
- **Streamlined Color System**: Introduced `M3ColorSchemeToken` as a more organized approach to color tokens
- **Enhanced State System**: Added `M3OpacityToken` for general opacity values alongside the existing state layer opacities

### 📚 Documentation Updates

- **Comprehensive Documentation Refresh**: Updated all documentation files (both English and Portuguese) to reflect new token naming
- **Implementation Guide Updates**: All implementation examples now use the new token class names
- **Component Map Updates**: Updated component mapping documentation with new token references
- **README Updates**: Main README.md updated with new API examples and migration guidance

### 🎯 Demo & Example Applications

- **Complete Demo Application Update**: All demo showcase pages updated to use new token naming conventions
- **Enhanced Theme Integration**: Theme examples updated to demonstrate proper usage of renamed tokens
- **Interactive Examples**: All interactive widgets and examples updated with new token class names
- **Comprehensive Showcases**: Typography, spacing, motion, shape, and component showcases all updated

### 🔧 Migration Guide

**Before (v0.8.1):**

```dart
// Old token naming
Card(elevation: M3Elevation.level2.value)
Padding(padding: EdgeInsets.all(M3Spacing.space16.value))
AnimatedContainer(duration: M3MotionDuration.short2.value)
Text('Title', style: M3TypeScale.headlineMedium)
```

**After (v0.9.0):**

```dart
// New standardized naming with "Token" suffix
Card(elevation: M3ElevationToken.level2.value)
Padding(padding: EdgeInsets.all(M3SpacingToken.space16.value))
AnimatedContainer(duration: M3MotionDurationToken.short2.value)
Text('Title', style: M3TypeScaleToken.headlineMedium)
```

### 🏗️ File Structure Improvements

- **Token File Reorganization**: All token implementation files renamed to include "\_token" suffix for better organization
- **Cleaner Export Structure**: Main library exports updated to expose new token class names
- **Consistent Internal Structure**: Internal token files follow consistent naming patterns

### 🐛 Compatibility Notes

- **No Functional Changes**: All token values and functionality remain identical - only class names have changed
- **Import Structure Unchanged**: Main package imports (`import 'package:material_design/material_design.dart'`) remain the same
- **Enum Values Preserved**: All enum values and properties maintain their existing names and functionality

## 0.8.1

### 📚 Major Documentation System

- **Comprehensive Documentation Portal**: Added complete Obsidian-based documentation system with bilingual support (English/Portuguese)
  - **Structured Documentation**: Organized into Foundations, Styles, Components, and Implementation sections
  - **Interactive Navigation**: Component maps, token maps, and implementation guides with cross-references
  - **Bilingual Support**: Full documentation available in both English (`en_US`) and Portuguese (`pt_BR`)
  - **Visual Documentation**: Mermaid diagrams and structured navigation for better understanding

### 🗂️ Documentation Architecture

- **Foundations Section**:
  - Design Tokens hierarchical system (ref/sys/comp)
  - Accessibility guidelines and WCAG compliance
  - Adaptive design patterns and responsive utilities
- **Styles Section**:
  - Typography system (complete 15-level type scale)
  - Elevation system (6 levels with shadows)
  - Motion system (durations and easing curves)
  - Shape system (complete corner radius system)
- **Implementation Section**:
  - Flutter integration guides
  - Token structure documentation
  - Theme system implementation
  - Best practices and usage examples

### ✨ Enhanced Developer Experience

- **Interactive Maps**: Component map, token map, and implementation map for visual navigation
- **Status Indicators**: Clear marking of implemented vs. planned features
- **External Links**: Comprehensive links to official Material Design 3 resources
- **Code Examples**: Practical implementation examples throughout documentation

### 🧹 Code Organization

- **Cleaned Documentation**: Removed `ENHANCED_FEATURES.md` file to consolidate documentation structure
- **Updated README**: Restructured README.md with better organization and clearer API migration guides
- **Gitignore Updates**: Removed documentation folder from gitignore to include new documentation system

### 🔧 Configuration Updates

- **Obsidian Integration**: Added complete Obsidian vault configuration for seamless documentation editing
- **Workspace Setup**: Pre-configured workspace with proper graph view and navigation settings
- **Core Plugins**: Enabled essential plugins for documentation workflow (file explorer, search, graph, backlinks)

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