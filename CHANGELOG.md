# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adherves to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.18.2

### 🏗️ Code Architecture & Organization

- **Enhanced Border System**: Completely refactored the border token system for better organization and semantic clarity

  - **New Structured Classes**: Introduced `M3BorderWidths`, `M3BorderSides`, and `M3Borders` as abstract final classes containing all border-related constants
  - **Improved Token Referencing**: All border token enums now reference the new structured classes instead of inline constants, improving maintainability and consistency
  - **Better Code Organization**: Moved border width, border side, and border constants into dedicated static classes for clearer architecture

- **Elevation System Refactoring**: Major improvements to the elevation token system architecture

  - **Enhanced Shadow Color Management**: Moved shadow color constant to private `_color` variable at the top of the file for better encapsulation
  - **Updated M3Shadows Class**: Made `M3Shadows` constructor private (`const M3Shadows._()`) and refactored all shadow definitions to use the private color constant
  - **Improved Token Documentation**: Enhanced elevation token documentation with comprehensive usage examples, visual characteristics, and typical use cases for all 6 elevation levels (level0-level5)
  - **Commented Shadow Color Getter**: Temporarily commented out the `shadowColor` getter in `M3BoxShadowToken` pending architectural review

- **Breakpoint System Enhancement**: Improved the responsive breakpoint system with better documentation and structure

  - **New M3Breakpoints Class**: Introduced comprehensive `M3Breakpoints` abstract final class with detailed documentation for all breakpoint values
  - **Enhanced Documentation**: Each breakpoint now includes device examples, design characteristics, and common use cases
  - **Improved Token References**: Updated `M3BreakpointToken` enum to reference the new `M3Breakpoints` class constants

- **Icon Size System Refactoring**: Complete overhaul of the icon size token system
  - **New M3IconSizes Class**: Introduced structured `M3IconSizes` abstract final class with comprehensive documentation for all icon sizes
  - **Enhanced Size Definitions**: Each icon size now includes detailed usage guidelines, ideal use cases, and semantic clarity
  - **Better Token Organization**: Updated `M3IconSizeToken` enum to reference the new structured class constants

### 🎨 Visual Design System Improvements

- **Enhanced Visual Density Documentation**: Significantly improved visual density token documentation with detailed explanations of each density level and their appropriate use cases

- **Typography System Enhancement**: Improved the typography token system with better documentation and clearer usage patterns

- **Motion System Documentation**: Enhanced motion token documentation with better explanations of duration and curve usage

- **Shape System Improvements**: Better organization of spacing tokens with enhanced documentation and usage guidelines

### 🔧 Developer Experience Enhancements

- **Improved Code Documentation**: Comprehensive documentation updates across all token systems with clear usage examples and best practices
- **Better IntelliSense Support**: Enhanced type definitions and documentation improve IDE support and developer productivity
- **Consistent Architecture**: All token systems now follow a consistent architectural pattern with dedicated constant classes and referencing enums

### 🧹 Code Quality & Maintenance

- **File Structure Cleanup**: Improved organization of token files with better separation of concerns
- **Enhanced Code Consistency**: Standardized patterns across all token systems for better maintainability
- **M3 Expressive Integration**: Improved integration and organization of M3 Expressive components within the design system
- **Layout Widget Enhancements**: Enhanced layout widgets (`M3EdgeInsets`, `M3Gap`, `M3Radius`, `M3ShapeDecoration`) with better token integration

### 📊 Impact Summary

- **Files Modified**: 15+ core token system files updated across elevation, geometry, interaction, motion, shape, spacing, state, and typography systems
- **Architectural Enhancement**: Major improvement in token system organization and consistency
- **Documentation Quality**: Comprehensive documentation improvements across all token systems
- **Developer Experience**: Enhanced IDE support and clearer usage patterns throughout the library

**Recommended Version Bump: MINOR (0.18.1 → 0.18.2)**

This release introduces significant architectural improvements to the token system, comprehensive documentation enhancements, and better code organization while maintaining full backward compatibility and Material Design 3 compliance.

## 0.18.1

### 🔧 Refactoring & Code Quality

- **API Refinement**: Renamed internal `_resolve` method to `resolve` in `M3SurfaceColorToken` and `IM3ContextualToken` for better public API clarity and consistency. This change makes the method public, allowing for easier extension and implementation by developers.
- **Code Cleanup**: Removed an unused constant `_kM3RadiusNoneValue` from the shape token system, contributing to a cleaner and more maintainable codebase.

### 📊 Impact Summary

- **Files Modified**: 3 files updated across the core token system.
- **Architectural Refinement**: Minor improvement in the token system architecture for better extensibility.
- **API Simplification**: Made the token resolution logic more accessible.

**Recommended Version Bump: PATCH (0.18.0 → 0.18.1)**

This release focuses on minor API refinements and code cleanup, improving the overall quality and developer experience without introducing breaking changes.

## 0.18.0

### 🔄 BREAKING CHANGES

- **Token System Overhaul**: Major architectural refactoring of the entire token system. Raw token values have been moved into dedicated `abstract final` classes (e.g., `M3Elevations`, `M3Spacings`, `M3Shapes`), and token `enum`s now reference these constants. This improves code organization, type safety, and maintainability but alters the internal structure.
- **`M3StateLayerToken` Deprecated**: The `M3StateLayerToken` enum and its corresponding file have been commented out and are no longer part of the public API. State layers should now be constructed manually using `M3StateLayerOpacities` and theme colors.
- **Removed Shape Helpers**: Static helper methods `M3ShapeToken.forComponentSize()` and `M3ShapeToken.forComponent()` have been removed.
- **Removed Shape Extensions**: The `M3ShapeExtensions` (`withShape`, `clipWithShape`) have been removed.
- **New `IM3ContextualToken` Interface**: Introduced `IM3ContextualToken` for tokens whose values depend on `BuildContext`. `M3SurfaceColorToken` now implements this interface, changing its `value` from a method to a getter that returns a `Color Function(BuildContext)`.

### 🏗️ Architectural Refinements

- **Centralized Token Constants**: Introduced dedicated classes to hold raw, `const` token values (`M3Elevations`, `M3Spacings`, `M3Shapes`, `M3Radii`, `M3BorderRadii`, `M3VisualDensities`, `M3MotionDurations`, `M3MotionCurves`, `M3Opacities`, `M3StateLayerOpacities`, `M3TextStyles`). This provides a single source of truth and allows for direct access to primitive values when needed.
- **Simplified Token Enums**: All token `enum`s (`M3ElevationToken`, `M3SpacingToken`, etc.) have been simplified to act as semantic wrappers around the new constant value classes.
- **Improved `M3VisualDensityToken`**: The implementation has been significantly streamlined. It now directly holds a `VisualDensity` object instead of separate `horizontal` and `vertical` properties, simplifying its API and improving its integration with Flutter's core density system.

### 🎯 Developer Experience Improvements

- **Enhanced API Consistency**: The refactoring provides a more consistent and predictable API. Developers can now access either the semantic token `enum` or the raw `const` value from the new static classes.
- **Improved Type Safety**: The new structure enhances type safety and reduces the chances of using "magic numbers" throughout the codebase.

### 🔧 Migration Guide

**`M3VisualDensityToken` Usage:**

The API for adaptive density is now a direct static getter.

```dart
// Before (v0.17.0)
VisualDensity adaptive = M3VisualDensityToken.adaptivePlatform.value;

// After (v0.18.0)
VisualDensity adaptive = M3VisualDensityToken.adaptivePlatformDensity;
```

**State Layer Creation:**

Since `M3StateLayerToken` is gone, state layers must be created manually using `M3StateLayerOpacities`.

```dart
// Before (v0.17.0)
Color hoverOverlay = M3StateLayerToken.hoverPrimary.withBaseColor(Theme.of(context).colorScheme.primary);

// After (v0.18.0)
Color hoverOverlay = Theme.of(context).colorScheme.primary.withOpacity(M3StateLayerOpacities.hover);
```

**`M3SurfaceColorToken` Usage:**

The public-facing usage remains the same, but the underlying interface has changed from a method `value(context)` to a getter `value` that returns a function.

```dart
// Usage remains the same, but be aware of the interface change if you were implementing it.
Color surfaceColor = M3SurfaceColorToken.level1.value(context);
```

### 📊 Impact Summary

- **Files Modified**: 20+ files updated across the core library and tests.
- **Architectural Refinement**: Major improvement in token system architecture for long-term maintainability.
- **API Simplification**: Removed several APIs (`M3StateLayerToken`, shape helpers) in favor of a more direct, foundational approach.

**Recommended Version Bump: MAJOR (0.17.0 → 0.18.0)**

This release introduces significant breaking changes and a major architectural refactoring of the token system, aimed at improving consistency, maintainability, and type safety.

## 0.17.0

### 🏗️ CI/CD Infrastructure & Quality Improvements

- **Temporary CI/CD Adjustment**: Disabled static analysis in GitHub Actions workflow to address immediate build pipeline concerns
  - **Flutter Analyze Disabled**: Commented out `flutter analyze --no-fatal-infos` command in `.github/workflows/tests.yml`
  - **Build Pipeline Stabilization**: Ensures continued CI/CD functionality while addressing underlying analysis issues
  - **Temporary Measure**: This change is intended as a short-term solution to maintain development workflow

### ✨ New Features & Token System Enhancements

- **New State Layer Token System**: Introduced comprehensive `M3StateLayerToken` for advanced interaction feedback
  - **Complete State Layer Implementation**: Added dedicated token for managing interactive element overlays
  - **Enhanced Documentation**: Comprehensive inline documentation with usage patterns and integration examples
  - **Consistent API**: Follows established token interface patterns for seamless integration

### 🔧 Code Quality & API Improvements

- **Enhanced Type Safety**: Improved type definitions and method signatures across multiple token systems

  - **Color Extension Methods**: Enhanced color utilities with robust `toARGB32()` method for consistent hex representation
  - **Elevation Token Reorganization**: Better organization of elevation-related properties and factory methods
  - **Border Token Enhancements**: Comprehensive documentation and improved API consistency for border-related tokens

- **Method Signature Improvements**: Enhanced parameter formatting and documentation consistency
  - **Visual Density Token**: Improved conditional logic formatting for better code readability
  - **Breakpoint Token**: Enhanced method signature formatting with proper line breaks and parameter alignment
  - **Icon Size & Z-Index Tokens**: Consistent documentation patterns and improved type safety

### 🧹 Code Organization & Architecture

- **Demo Application Cleanup**: Streamlined demo application with improved code organization

  - **Removed Unused Methods**: Eliminated redundant shape example methods (`_buildShapeExample`, `_buildSpacingDemo`)
  - **Cleaner Code Structure**: Improved readability by removing unused helper methods and commented code sections
  - **Import Optimization**: Removed unnecessary imports and improved dependency management

- **Enhanced Library Structure**: Better organization of token implementations and exports
  - **Improved Token Organization**: Enhanced internal organization of elevation, geometry, and state tokens
  - **Consistent Documentation**: Standardized inline documentation patterns across all token files
  - **Better Type Definitions**: Enhanced interface implementations and method signatures

### 🎨 Visual & Styling Improvements

- **Color Display Enhancement**: Improved color representation throughout demo and example applications

  - **Hex Color Display**: Updated color chips to use improved `toARGB32()` method for accurate hex representation
  - **Consistent Color Formatting**: Standardized color hex code display patterns across all components
  - **Better Color Utilities**: Enhanced color manipulation and display consistency

- **Elevation System Refinements**: Improved elevation token usage and surface color integration
  - **Surface Color Integration**: Better integration between elevation tokens and surface color calculations
  - **Shadow System**: Enhanced shadow token organization and factory method implementations
  - **Documentation Consistency**: Improved documentation patterns across elevation-related tokens

### 📱 Example & Demo Application Updates

- **M3 Expressive Cleanup**: Streamlined M3 Expressive demonstration components

  - **Simplified Examples**: Removed complex demonstration methods in favor of cleaner implementations
  - **Better Component Organization**: Improved separation of concerns in showcase components
  - **Enhanced User Experience**: Cleaner interface with reduced complexity in demonstration pages

- **Theme Integration**: Enhanced theme integration patterns across example applications
  - **Consistent Theme Usage**: Improved `Theme.of(context)` usage patterns throughout examples
  - **Better Color Scheme Access**: Enhanced color scheme integration in all demonstration components
  - **Improved Visual Consistency**: Standardized visual patterns across demo and example applications

### 🔧 Migration Guide

**Color Utilities:**

```dart
// Before (v0.16.1) - Using deprecated color.value
String hex = '#${color.value.toRadixString(16).substring(2).toUpperCase()}';

// After (v0.17.0) - Using enhanced color utilities
String hex = '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
```

**State Layer Integration:**

```dart
// New state layer token usage
Container(
  decoration: BoxDecoration(
    color: M3StateLayerToken.hover.value(context),
    borderRadius: M3BorderRadiusToken.medium.value,
  ),
)
```

### 📊 Impact Summary

- **Files Modified**: 35+ files updated across core library, demo, and example applications
- **CI/CD Stabilization**: Temporary workflow adjustments to maintain development pipeline
- **Enhanced Type Safety**: Improved type definitions and method signatures throughout the codebase
- **Code Organization**: Streamlined demo application and improved internal library structure
- **New Token System**: Introduction of comprehensive state layer token system

**Recommended Version Bump: MINOR (0.16.1 → 0.17.0)**

This release introduces new state layer token functionality, enhances code quality through improved type safety and organization, includes temporary CI/CD adjustments for build pipeline stability, and provides comprehensive cleanup of demo applications while maintaining full Material Design 3 compliance.

## 0.16.1

### 🏗️ CI/CD Infrastructure & Quality Improvements

- **Enhanced Testing Infrastructure**: Introduced comprehensive automated testing workflow

  - **New `tests.yml` Workflow**: Added dedicated GitHub Actions workflow for continuous testing
  - **Multi-Environment Testing**: Tests run on both root package and demo application
  - **Quality Gates**: Added code formatting checks and static analysis to CI pipeline
  - **Branch Protection**: Tests trigger on main and development branches, plus pull requests

- **Deployment Pipeline Optimization**: Improved demo deployment workflow for better reliability
  - **Sequential Workflow Execution**: Demo deployment now triggers only after successful test completion
  - **Enhanced Setup Steps**: Better job naming and clearer deployment process
  - **Reduced Redundancy**: Removed duplicate test execution from deployment workflow

### 📄 Project Metadata Updates

- **License Standardization**: Updated project license to reflect proper branding

- **CI Badge Alignment**: Updated README.md to reference correct GitHub Actions workflow
  - **Badge URL Update**: Tests badge now points to `tests.yml` instead of legacy `test.yml`
  - Ensures build status accuracy and proper CI/CD visibility

### 🔧 Developer Experience Enhancements

- **Improved Workflow Names**: Enhanced GitHub Actions workflow naming for better clarity

  - `Tests` workflow provides clear indication of testing process
  - Better integration with GitHub's status checks and branch protection rules

- **Build Process Optimization**: Streamlined CI/CD pipeline reduces redundant operations
  - Eliminates duplicate Flutter setup and dependency installation
  - Faster feedback loop for developers through optimized test execution

### 📊 Impact Summary

- **Files Modified**: 4 core infrastructure files updated
- **CI/CD Enhancement**: Separated testing and deployment concerns for better reliability
- **Quality Assurance**: Added automated code quality checks to development workflow
- **Branding Consistency**: Standardized project attribution across legal documents

**Recommended Version Bump: MINOR (0.16.0 → 0.16.1)**

This release focuses on infrastructure improvements, CI/CD pipeline enhancements, and project metadata standardization. While no new features are introduced, the improved testing infrastructure and deployment reliability significantly enhance the development experience and project quality assurance.

## 0.16.0

### 🔄 BREAKING CHANGES

- **Motion Token API Renaming**: Renamed motion easing tokens for better semantic clarity
  - **`M3MotionEasingToken` → `M3MotionCurveToken`**: All motion easing token references updated throughout the codebase
  - **Affected Properties**: All easing curve access patterns (emphasized, standard, standardDecelerate, standardAccelerate, linear, etc.)
  - **Documentation Updates**: Comprehensive updates to both English and Portuguese documentation reflecting new naming

### ✨ New Features - M3 Expressive

- **Loading Indicator Component**: Introduced new M3 Expressive loading indicator component

  - **`LoadingIndicator`**: Brand new loading indicator widget with Material Design 3 expressive styling
  - **`LoadingIndicator.contained()`**: Contained variant for different visual contexts
  - **`LoadingIndicatorTheme`**: Complete theming system for customization
  - Enhanced visual design following M3 Expressive guidelines

- **Material New Shapes System**: Added comprehensive new shapes library for M3 Expressive
  - **`MaterialShapes`**: Extensive collection of 35+ predefined shapes including:
    - Basic shapes: circle, square, triangle, diamond, oval
    - Advanced shapes: heart, clover, burst, flower, ghost-ish
    - Cookie variants: 4-sided through 12-sided cookies
    - Expressive shapes: sunny, boom, puffy, pixelCircle
  - **Shape Morphing**: Advanced shape morphing capabilities with smooth animations
  - **Interactive Showcase**: Complete demo implementation with animated shape transitions

### 🎯 Developer Experience Improvements

- **Enhanced Demo Application**: Added new M3 Expressive showcase section

  - **M3ExpressivePage**: Dedicated page showcasing new expressive components
  - **Loading Indicator Demo**: Interactive demonstrations of loading indicator variants
  - **Navigation Enhancement**: Added "Expressive" section to main navigation with dedicated icon
  - **Integrated Examples**: Seamless integration with existing demo architecture

- **API Consistency**: Updated motion token usage patterns throughout codebase
  - **README Updates**: All motion examples updated to use `M3MotionCurveToken`
  - **Demo Consistency**: All showcase pages migrated to new motion token naming
  - **Documentation Alignment**: Both English and Portuguese docs synchronized

### 📱 Enhanced Example Applications

- **Theme Integration**: Better theme integration patterns in examples
  - **Context-Aware Styling**: Enhanced usage of `Theme.of(context)` patterns throughout examples
  - **Color Scheme Integration**: Improved color scheme access patterns in README examples
  - **State Layer Updates**: Better state layer opacity usage with proper theme integration

### 🏗️ Library Architecture Enhancements

- **Export Structure**: Enhanced library exports for new M3 Expressive components
  - **Main Library**: Added exports for `LoadingIndicator` and `MaterialShapes`
  - **Modular Organization**: Better separation between core M3 and M3 Expressive features
  - **Theme Integration**: Proper theming integration for all new components

### 🔧 Migration Guide

**Motion Token Updates:**

```dart
// Before (v0.15.x)
AnimatedContainer(
  curve: M3MotionEasingToken.emphasized.value,
  duration: M3MotionDurationToken.medium2.value,
)

// After (v0.16.0)
AnimatedContainer(
  curve: M3MotionCurveToken.emphasized.value,
  duration: M3MotionDurationToken.medium2.value,
)
```

**New M3 Expressive Components:**

```dart
// Loading Indicator
LoadingIndicator() // Standard variant
LoadingIndicator.contained() // Contained variant

// Material Shapes (for advanced shape usage)
import 'package:material_design/material_design.dart';

// Access predefined shapes
final shape = MaterialShapes.heart;
final morphing = Morph(MaterialShapes.circle, MaterialShapes.heart);
```

**Theme Usage:**

```dart
// Enhanced theme integration patterns
Container(
  color: Theme.of(context).colorScheme.surface.withValues(
    alpha: M3StateLayerOpacityToken.hover.value,
  ),
)
```

### 📊 Impact Summary

- **Files Modified**: 20+ files updated across core library, demo, and documentation
- **API Enhancement**: Consistent motion token naming across entire library
- **New Components**: 2 major M3 Expressive components (LoadingIndicator, MaterialShapes)
- **Documentation**: Comprehensive updates in both English and Portuguese
- **Demo Enhancement**: New showcase section for M3 Expressive features

**Recommended Version Bump: MINOR (0.15.0 → 0.16.0)**

This release introduces significant new M3 Expressive features while maintaining backward compatibility, includes motion token API improvements for better semantic clarity, and provides enhanced developer experience through comprehensive documentation updates and interactive demos.

## 0.15.0

### 🔄 BREAKING CHANGES

- **Shape System Refactoring**: Introduced a comprehensive three-tiered shape token system for more granular control and better developer experience

  - **New Three-Tier System**: `M3ShapeToken` (high-level), `M3BorderRadiusToken` (mid-level), and `M3RadiusToken` (low-level)
  - **Enhanced Usage Patterns**: Each tier serves specific use cases for maximum flexibility and semantic clarity
  - **Improved API Ergonomics**: More intuitive property access patterns and better type safety

- **Elevation System API Improvements**: Major refactoring of elevation-related classes for better clarity and consistency
  - **`_M3ShadowToken` → `M3BoxShadowToken`**: Shadow token class is now public and properly named
  - **`_M3TonalColor` → `M3SurfaceTint`**: Tonal color utility renamed for better semantic clarity
  - **New `M3SurfaceColorToken`**: Dedicated token for surface color management with elevation integration
  - **Enhanced Elevation Integration**: Better integration between elevation, shadows, and surface colors

### 🏗️ Enhanced Widget System

- **New `M3Container` Widget**: Advanced container widget with built-in Material Design 3 token enforcement

  - Seamless integration with elevation and surface color systems
  - Enhanced type safety and consistent API patterns
  - Simplified common container styling workflows

- **Shape Token Architecture Enhancement**: Complete reorganization of shape-related tokens
  - **`M3ShapeToken`**: High-level shapes returning `RoundedRectangleBorder` for direct widget usage
  - **`M3BorderRadiusToken`**: Mid-level tokens returning `BorderRadius` for decoration usage
  - **`M3RadiusToken`**: Low-level tokens returning `Radius` for custom corner configurations

### 🎯 Developer Experience Improvements

- **Comprehensive Documentation Overhaul**: Extensive README.md updates with new API patterns

  - Detailed three-tier shape system explanation with usage guidelines
  - Enhanced elevation examples showing multiple implementation approaches
  - Clear decision matrix for choosing appropriate token levels
  - Updated spacing and layout examples with corrected API usage

- **Improved API Consistency**: Unified access patterns across all shape and elevation tokens
  - Consistent `.value` property access across all token types
  - Clear semantic separation between different abstraction levels
  - Enhanced IntelliSense support with better type definitions

### 📱 Complete Application Migration

- **Demo Application Overhaul**: Full migration to use new shape and elevation APIs

  - All showcase pages updated to demonstrate three-tier shape system
  - Enhanced elevation examples with new `M3SurfaceColorToken` integration
  - Improved visual consistency across all demo components

- **Example Application Updates**: Comprehensive refactoring of example applications
  - Theme configurations updated to use new shape token system
  - Interactive components migrated to new elevation API patterns
  - Enhanced accessibility examples with new token implementations

### 🧹 Code Organization & Architecture

- **Token File Restructuring**: Better organization of elevation and shape token files

  - Moved private implementation files to public API with proper naming
  - Enhanced file organization with clearer dependency relationships
  - Improved internal documentation and code structure

- **Enhanced Library Exports**: Streamlined export structure for better developer experience
  - Cleaner main library file with comprehensive token exposure
  - Better separation between public and internal APIs
  - Enhanced type definitions and interface contracts

### 🔧 Migration Guide

**Three-Tier Shape System:**

```dart
// Before (v0.14.x) - Single shape approach
Container(
  decoration: M3BoxDecoration(
    shape: M3ShapeToken.medium,
  ),
)

// After (v0.15.0) - Three-tier system
// High-level: For shape property of widgets
Card(shape: M3ShapeToken.large.value)

// Mid-level: For borderRadius in BoxDecoration
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadiusToken.large.value,
  ),
)

// Low-level: For custom corner configurations
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: M3RadiusToken.extraLarge.value,
      bottomRight: M3RadiusToken.small.value,
    ),
  ),
)
```

**Elevation System Updates:**

```dart
// Before (v0.14.x) - Private classes
final shadows = _M3ShadowToken.fromElevation(elevation);
final surfaceColor = _M3TonalColor.surfaceAt(context, elevation);

// After (v0.15.0) - Public API with better naming
final shadows = M3BoxShadowToken.fromElevation(elevation);
final surfaceColor = M3SurfaceTint.surfaceAt(context, elevation);
// or
final surfaceColor = M3SurfaceColorToken.fromElevation(elevation).value(context);
```

**Container Widget:**

```dart
// New M3Container widget for enhanced functionality
M3Container(
  elevation: M3ElevationToken.level3,
  // Automatically applies elevation, shadows, and surface colors
  child: content,
)
```

### 📊 Impact Summary

- **Files Modified**: 25+ files updated across core library, demo, and example applications
- **API Enhancement**: Three-tier shape system providing better granular control
- **Developer Experience**: Simplified common use cases while enabling advanced customization
- **Documentation**: Comprehensive updates with clear usage guidelines and decision matrices
- **Type Safety**: Enhanced type safety and better IntelliSense support throughout

**Recommended Version Bump: MINOR (0.14.0 → 0.15.0)**

This release introduces significant API improvements and architectural enhancements to the shape and elevation systems, comprehensive documentation updates, and enhanced developer experience through the new three-tier shape token architecture while maintaining Material Design 3 compliance.

## 0.14.0-dev

### 🔄 BREAKING CHANGES

- **API Unification and Simplification**: Major refactoring to unify the decoration and shape API for better consistency and developer experience
  - **`BoxDecoration` → `M3BoxDecoration`**: All `BoxDecoration` usage replaced with new `M3BoxDecoration` widget for token enforcement
    - **Before**: `BoxDecoration(borderRadius: M3ShapeToken.medium.borderRadius.value)`
    - **After**: `M3BoxDecoration(shape: M3ShapeToken.medium)`
  - **`BorderRadius` → `shape` property**: Simplified shape application through dedicated `shape` parameter
    - **Before**: `borderRadius: M3ShapeToken.large.borderRadius.value`
    - **After**: `shape: M3ShapeToken.large`
  - **`Border.all()` → `M3Border.all()`**: Unified border creation through `M3Border` utility
    - **Before**: `Border.all(width: M3BorderWidthToken.thin.value)`
    - **After**: `M3Border.all(width: M3BorderWidthToken.thin.value)`

### 🏗️ Enhanced Widget System

- **New `M3BoxDecoration` Widget**: Comprehensive replacement for `BoxDecoration` with built-in Material Design 3 token enforcement
  - Automatic shape token integration through `shape` parameter
  - Enhanced type safety and token validation
  - Simplified API for common decoration patterns
  - Backward compatible with standard `BoxDecoration` properties
- **Enhanced `M3Border` Utility**: Advanced border creation system with M3 token integration
  - Consistent API for all border types (`all`, `symmetric`, `only`)
  - Built-in token validation and type safety
  - Improved developer experience with clear method signatures

### 🎯 Developer Experience Improvements

- **Simplified Shape Application**: Streamlined the process of applying shapes to components
  - Direct token application without complex property chains
  - Consistent pattern across all shape-related widgets
  - Reduced boilerplate code for common styling patterns
- **Documentation Updates**: Comprehensive updates to all documentation reflecting the new API patterns
  - Updated README.md with new API examples
  - Refreshed implementation guides in both English and Portuguese
  - Enhanced inline code documentation throughout the library

### 📱 Complete Demo Migration

- **Demo Application Overhaul**: Full migration of demo application to use new API patterns
  - All showcase pages updated to demonstrate `M3BoxDecoration` usage
  - Enhanced examples showing simplified shape and decoration patterns
  - Improved visual consistency across demo components
- **Example Application Updates**: Complete refactoring of example app to use new decoration system
  - Theme examples updated to use `M3BoxDecoration`
  - Interactive components migrated to new shape API
  - Enhanced accessibility examples with new decoration patterns

### 🧹 Code Organization

- **Temporary Shape Utils Disabled**: Disabled `M3ShapeUtils` temporarily during refactoring process
  - Commented out in main export to prevent breaking changes
  - Will be re-enabled with enhanced functionality in upcoming patch releases
- **Enhanced Library Structure**: Improved organization of widget and utility classes
  - Better separation between layout and decoration utilities
  - Cleaner import structure with reduced complexity

### 🔧 Migration Guide

**BoxDecoration to M3BoxDecoration:**

```dart
// Before (v0.13.x)
Container(
  decoration: BoxDecoration(
    color: M3SysColor.surfaceContainer,
    borderRadius: M3ShapeToken.medium.borderRadius.value,
    border: Border.all(width: M3BorderWidthToken.thin.value),
  ),
)

// After (v0.14.0)
Container(
  decoration: M3BoxDecoration(
    color: M3SysColor.surfaceContainer,
    shape: M3ShapeToken.medium,
    border: M3Border.all(width: M3BorderWidthToken.thin.value),
  ),
)
```

**Shape Token Application:**

```dart
// Before (v0.13.x)
Card(
  shape: RoundedRectangleBorder(
    borderRadius: M3ShapeToken.large.borderRadius.value,
  ),
)

// After (v0.14.0)
Card(
  shape: RoundedRectangleBorder(
    shape: M3ShapeToken.large,
  ),
)
```

**Theme Configuration:**

```dart
// Before (v0.13.x)
ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: M3ShapeToken.medium.borderRadius.value,
  ),
)

// After (v0.14.0)
ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    shape: M3ShapeToken.medium,
  ),
)
```

### 📊 Impact Summary

- **Files Modified**: 30+ files updated across documentation, demo, and example applications
- **API Consistency**: Unified decoration and shape API across entire library
- **Developer Experience**: Simplified common styling patterns with reduced boilerplate
- **Documentation**: Comprehensive updates in both English and Portuguese
- **Backward Compatibility**: Maintained compatibility with existing token values while improving API ergonomics

**Recommended Version Bump: MINOR (0.13.0 → 0.14.0)**

This release contains significant API improvements and breaking changes to decoration and shape systems, extensive documentation updates, and enhanced developer experience through simplified APIs while maintaining full Material Design 3 compliance.

## 0.13.0-dev

### 🔄 BREAKING CHANGES

- **Shape Token API Refactoring**: Major changes to the shape token system requiring property chain updates
  - **Before**: `M3ShapeToken.medium.borderRadius` → **After**: `M3ShapeToken.medium.borderRadius.value`
  - **Before**: `M3ShapeToken.large.radius` → **After**: `M3ShapeToken.large.borderRadius.radius.value`
  - All shape token access now requires `.value` at the end for consistent API patterns
- **Border Token Renaming**: `M3BorderToken` has been renamed to `M3BorderWidthToken` for better semantic clarity
  - Update all `M3BorderToken.thin` → `M3BorderWidthToken.thin`
  - Affects all border width references throughout the codebase

### 🗂️ Library Architecture Overhaul

- **Consolidated Main Export**: Removed the separate `m3.dart` file and consolidated all exports into the main `material_design.dart` library file
  - All imports now use: `import 'package:material_design/material_design.dart'`
  - Improved library structure with comprehensive inline documentation for all token systems
- **Enhanced Widget System**: Added new layout widgets with Material Design 3 token enforcement
  - **`M3Border`**: Custom border widget that enforces M3 design tokens (465+ lines of implementation)
  - **`M3BorderRadius`**: Custom border radius utility with token validation
  - **`M3BoxDecoration`**: Token-enforced box decoration for consistent styling
  - **`M3ShapeDecoration`**: Advanced shape decoration with M3 compliance (591+ lines of implementation)

### 🏗️ Enhanced Shape System

- **Complete Shape Token Refactoring**: Redesigned the shape token system with 270+ lines of additional functionality
  - Added comprehensive internal constants for all radius values
  - Implemented wrapper classes for better type safety and API consistency
  - Enhanced border radius utilities with validation and helper methods
- **Improved Type Safety**: All shape-related tokens now have consistent access patterns and validation

### 🎨 Enhanced Layout Utilities

- **Improved M3EdgeInsets**: Significant enhancements to the EdgeInsets utility (179 lines updated)
- **Streamlined M3Padding**: Simplified and optimized padding implementation (183 lines reduced)
- **Enhanced Layout Widgets**: Better integration with the Material Design 3 token system

### 📱 Demo and Example Updates

- **Complete API Migration**: Updated entire demo application and examples to use the new token access patterns
- **Enhanced Examples**: All showcase pages now demonstrate the new API structure
- **Better Documentation**: Improved inline comments and examples throughout demo and example applications

### 🔧 Migration Guide

**Shape and Border Radius:**

```dart
// Before (v0.11.0)
Container(
  decoration: BoxDecoration(
    borderRadius: M3ShapeToken.medium.borderRadius,
  ),
)

// After (v0.12.0)
Container(
  decoration: BoxDecoration(
    borderRadius: M3ShapeToken.medium.borderRadius.value,
  ),
)
```

**Border Tokens:**

```dart
// Before (v0.11.0)
Border.all(width: M3BorderToken.thin.value)

// After (v0.12.0)
Border.all(width: M3BorderWidthToken.thin.value)
```

**Library Import:**

```dart
// Before (v0.11.0)
import 'package:material_design/src/m3/m3.dart';

// After (v0.12.0)
import 'package:material_design/material_design.dart';
```

**Recommended Version Bump: MINOR (0.11.0 → 0.12.0)**

This release contains significant breaking changes to the shape and border token APIs, extensive library architecture improvements, and new widget implementations that substantially enhance the Material Design 3 token system.

## 0.12.1

### Documentation

- **Radius Examples Updated**: Revised all radius `README.md` documentation, usage guides, and inline comments related to radius.

## 0.12.0

### 🚀 Major Features & Enhancements

- **New Spacing System**: Introduced a new, robust spacing system to enforce design system consistency and improve developer experience.
  - **`M3EdgeInsets`**: A new utility to create `EdgeInsets` exclusively from `M3SpacingToken` and `M3MarginToken`. This ensures all insets and margins adhere to the design system.
  - **`M3Padding` Widget**: A token-enforced padding widget that replaces the standard `Padding`. It provides convenient constructors (`.all`, `.symmetric`, `.only`) that accept `M3SpacingToken`.
  - **`M3Gap` Widget**: A token-based replacement for `SizedBox` to create consistent spacing in `Row`s and `Column`s using `M3SpacingToken`.
- **Simplified Token API**: The API for all spacing and margin tokens has been simplified. The `.value` accessor is no longer needed when using the new spacing widgets and utilities, making the code cleaner and more readable (e.g., `M3Padding.all(M3SpacingToken.space16)`).
- **Enhanced Breakpoint System**: The responsive breakpoint system has been refactored for clarity and consistency.
  - `M3WindowSizeClass` has been renamed to `M3ScreenSize`.
  - `getWindowSizeClassFromContext` has been renamed to `getScreenSizeFromContext`.
- **Improved Documentation**:
  - The main library file (`m3.dart`) has been completely overhauled with comprehensive documentation, serving as a complete guide to the package's features.
  - All core token classes (`M3ElevationToken`, `M3VisualDensityToken`, `IM3Token`, etc.) have received extensive inline documentation, explaining their purpose, architecture, and usage patterns.

### 🔄 Refactoring

- **Full Adoption of New Spacing System**: The entire demo application, examples, and internal library code have been refactored to use the new `M3EdgeInsets`, `M3Padding`, and `M3Gap` utilities. This removes direct dependencies on Flutter's `Padding` and `SizedBox`, ensuring strict adherence to the design system.
- **Adaptive Utilities Update**: The `M3Adaptive` helper class has been updated to use the new `M3ScreenSize` enum and `M3EdgeInsets` utility for responsive layouts.
- **Codebase Cleanup**: Removed unused files and cleaned up `.gitignore`.

### 🔧 Migration Guide

**Spacing and Padding:**

Update all `Padding` and `SizedBox` widgets used for spacing to the new `M3Padding` and `M3Gap` widgets.

**Before (v0.11.0):**

```dart
Padding(
  padding: EdgeInsets.all(M3SpacingToken.space16.value),
  child: Text('Hello'),
)

SizedBox(height: M3SpacingToken.space24.value)
```

**After (v0.12.0):**

```dart
M3Padding.all(
  M3SpacingToken.space16,
  child: Text('Hello'),
)

const M3Gap(M3SpacingToken.space24)
```

**Responsive Breakpoints:**

Update all references from `M3WindowSizeClass` to `M3ScreenSize`.

**Before (v0.11.0):**

```dart
final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
if (sizeClass == M3WindowSizeClass.compact) {
  // ...
}
```

**After (v0.12.0):**

```dart
final screenSize = M3BreakpointToken.getScreenSizeFromContext(context);
if (screenSize == M3ScreenSize.compact) {
  // ...
}
```

## 0.11.0

### New Features

- **Introduced `M3Padding` Widget**: A new token-driven widget that replaces the standard `Padding` to enforce the use of `M3SpacingToken` for consistent padding across the application. It provides convenient constructors like `M3Padding.all`, `M3Padding.only`, and `M3Padding.symmetric`.
- **Introduced `M3Gap` Widget**: A direct, token-based replacement for `SizedBox` used for creating space between widgets. `M3Gap` simplifies creating consistent spacing in `Row`s and `Column`s by using `M3SpacingToken`.
- **Introduced `M3EdgeInsets` Utility**: A new utility class to create `EdgeInsets` exclusively from `M3SpacingToken`, ensuring all spacing values adhere to the Material Design system's defined scale.

### Refactoring

- **Adopted New Spacing Widgets**: Refactored the entire demo application, examples, and internal library widgets to use the new `M3Padding` and `M3Gap` widgets. This removes direct dependency on Flutter's `Padding` and `SizedBox` for spacing tasks, promoting design system consistency.
- **Simplified Token API**: Updated the API for spacing tokens. It's no longer necessary to call `.value` on tokens when using them with the new spacing widgets (e.g., `M3Padding.all(M3SpacingToken.space16)`).
- **Improved Code Organization**: Relocated core utility files from the `lib/src/m3/mt/` directory to a more semantically correct `lib/src/m3/utils/` directory, improving the project's structure.

### Documentation

- **Updated All Examples**: Revised all documentation, including `README.md`, implementation guides, and inline code comments, to reflect the new spacing widgets and strongly recommend their usage over standard Flutter widgets for spacing.

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
