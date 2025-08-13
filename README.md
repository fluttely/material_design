# Material Design 3 for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue)](https://flutter.dev)

🎨 **A complete Material Design 3 design system implementation for Flutter**

A comprehensive design system toolkit that brings Google's Material Design 3 specifications to Flutter through a carefully architected token system.

## 🚀 Live Demo & Resources

**[🌟 Interactive Design System Explorer](https://fluttely.github.io/material_design/)** - Explore all tokens with live examples

**[📚 Material Design 3 Guidelines](https://m3.material.io/)** - Official specification

## 📦 Installation

```yaml
dependencies:
  material_design: ^0.28.1
```

## 🎯 Three Ways to Use This Library

### ✅ The Right Way: Material Design 3 Compliant

**Use M3 wrapper classes that enforce design system rules while maintaining const performance.**

```dart
// Best approach - follows M3 specs with const performance
// Motion example - impossible to mismatch
return AnimatedContainer(
  duration: M3Motion.emphasized.duration, // Always correct pairing   (non-const)
  curve: M3Motion.emphasized.curve,       // Follows M3 specs exactly (non-const)
   // M3EdgeInsets enforces token usage + const
  padding: const M3EdgeInsets.all(M3SpacingToken.space16), // (const)

  // M3ShapeDecoration ensures all properties follow M3
  decoration: M3ShapeDecoration(
    shape: M3Shape.medium,                                         // (const)
    boxShadow: M3Elevation.level3.shadows,                         // (non-const)
    color: M3Elevation.level3.surfaceColor(context),               // (non-const)
  ),

  child: const Text(
    'Perfect M3 Implementation',
    style: Theme.of(context).textTheme.headlineMedium,             // (non-const)
  ),
);
```

**Why this is best:**

- ✅ Forces Material Design 3 compliance
- ✅ Type-safe token usage
- ✅ Const performance where possible
- ✅ Impossible to break design system rules

---

### ⚠️ The Flexible Way: Trading Compliance for Freedom

**Use const tokens directly with Flutter widgets. More flexible but can break M3 guidelines.**

```dart
// Intermediate approach - flexible but can violate M3
AnimatedContainer(
  duration: M3MotionDuration.long2, // ⚠️ Is this the right duration? (const)
  curve: M3MotionCurve.standard,    // ⚠️ Wrong curve for long2!      (const)
  // Using const tokens but might mix incorrectly
  padding: const EdgeInsets.all(M3Spacings.space16), // (const)

  decoration: ShapeDecoration(
    borderRadius: M3Shape.medium,                    // (const)
    boxShadow: M3ElevationShadows.level3,            // (const)
    color: M3Elevation.level3.surfaceColor(context), // (non-const)
  ),

  child: const Text(
    'Partial M3 Implementation',
    style: M3TextStyle.headlineMedium,               // (const)
  ),
);
```

**Trade-offs:**

- ⚠️ Can mix incompatible tokens
- ⚠️ May violate M3 specifications
- ✅ More flexibility for custom designs
- ✅ Still has const performance

---

### ❌ The Wrong Way: Worst of Both Worlds

**Using token enums with `.value` - loses const performance AND design system benefits.**

```dart
// DON'T DO THIS - no benefits, only drawbacks
Container(
  // ❌ Lost const performance
  padding: EdgeInsets.all(M3SpacingToken.space16.value), // (non-const)

  decoration: BoxDecoration(
    // ❌ Still not const
    borderRadius: BorderRadius.circular(M3CornerToken.medium.value), // (non-const)

    // ❌ Can still break M3 rules
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 2),  // ❌ Random shadow values
        blurRadius: M3SpacingToken.space4.value,  // ❌ Why use spacing for blur?
      ),
    ],
    color: Colors.purple, // ❌ Missing surface tint. Not M3 surface color! (const)
  ),

  child: Text(
    'Worst Implementation',
    // ❌ Mixing approaches inconsistently
    style: TextStyle(fontSize: 17),
  ),
);
```

**Why this is wrong:**

- ❌ No const performance (using `.value`)
- ❌ No design system enforcement
- ❌ Verbose without benefits
- ❌ Easy to misuse tokens

## 📖 How to Use Each Class

### ✅ 🎯 Design System Classes (Use These First - M3 Compliant)

#### Typography & Text

| Class         | Purpose                                            | Example                                            |
| :------------ | :------------------------------------------------- | :------------------------------------------------- |
| `M3TextStyle` | Complete typography scale                          | `Text('Hello', style: M3TextStyle.headlineMedium)` |
|               | `displayLarge`, `displayMedium`, `displaySmall`    | Display text styles                                |
|               | `headlineLarge`, `headlineMedium`, `headlineSmall` | Headline text styles                               |
|               | `titleLarge`, `titleMedium`, `titleSmall`          | Title text styles                                  |
|               | `bodyLarge`, `bodyMedium`, `bodySmall`             | Body text styles                                   |
|               | `labelLarge`, `labelMedium`, `labelSmall`          | Label text styles                                  |

#### Spacing & Layout

| Class          | Purpose                                     | Example                                                               |
| :------------- | :------------------------------------------ | :-------------------------------------------------------------------- |
| `M3EdgeInsets` | Type-safe padding/margin with const         | `const M3EdgeInsets.all(M3SpacingToken.space16)`                      |
|                | `.all()`, `.symmetric()`, `.only()`         | Different padding patterns                                            |
|                | `.fromLTRB()`                               | Custom directional padding                                            |
| `M3Padding`    | Pre-configured padding widget               | `M3Padding.all(token: M3SpacingToken.space16, child: widget)`         |
|                | `.symmetric()`, `.only()`                   | Directional padding widgets                                           |
| `M3Gap`        | Auto-directional spacing in Flex            | `Column(children: [widget1, M3Gap(M3SpacingToken.space16), widget2])` |
|                | Automatically switches between width/height | Based on parent Row/Column                                            |
|                | `horizontal4` to `horizontal48`             | Horizontal spacers                                                    |
|                | `vertical4` to `vertical48`                 | Vertical spacers                                                      |

#### Shape & Borders

| Class            | Purpose                                       | Example                                                                          |
| :--------------- | :-------------------------------------------- | :------------------------------------------------------------------------------- |
| `M3Shape`        | RoundedRectangleBorder shapes                 | `Card(shape: M3Shape.medium)`                                                    |
|                  | `none`, `extraSmall`, `small`                 | 0dp, 4dp, 8dp corners                                                            |
|                  | `medium`, `large`, `extraLarge`               | 12dp, 16dp, 28dp corners                                                         |
|                  | `full`                                        | Circular/stadium shape                                                           |
| `M3BorderRadius` | BorderRadius for containers                   | `Container(decoration: BoxDecoration(borderRadius: M3BorderRadius.medium))`      |
|                  | `none`, `extraSmall`, `small`                 | 0dp, 4dp, 8dp radius                                                             |
|                  | `medium`, `large`, `extraLarge`               | 12dp, 16dp, 28dp radius                                                          |
|                  | `full`                                        | Circular radius                                                                  |
| `M3Radius`       | Individual Radius values                      | `ClipRRect(borderRadius: BorderRadius.all(M3Radius.medium))`                     |
|                  | Same variants as BorderRadius                 | For individual corner control                                                    |
| `M3BorderSide`   | Border side configurations                    | `Border(top: M3BorderSide.thin(color: Colors.grey))`                             |
|                  | `.none()`, `.thin()`, `.medium()`, `.thick()` | 0dp, 1dp, 2dp, 4dp widths                                                        |
| `M3Border`       | Complete border specifications                | `Container(decoration: BoxDecoration(border: M3Border.all(color: Colors.grey)))` |
|                  | `.all()`, `.symmetric()`                      | Full and partial borders                                                         |

#### Decorations

| Class               | Purpose                          | Example                                                                    |
| :------------------ | :------------------------------- | :------------------------------------------------------------------------- |
| `M3ShapeDecoration` | Shape-based decoration           | `M3ShapeDecoration(shape: M3Shape.medium, color: Colors.blue)`             |
|                     | Enforces M3 shape tokens         | With elevation and shadows                                                 |
| `M3BoxDecoration`   | Box-based decoration             | `M3BoxDecoration(borderRadius: M3BorderRadius.medium, color: Colors.blue)` |
|                     | Enforces M3 border radius tokens | With elevation and shadows                                                 |

#### Elevation & Shadows

| Class         | Purpose                         | Example                       |
| :------------ | :------------------------------ | :---------------------------- |
| `M3Elevation` | Complete elevation system       | `M3Elevation.level3`          |
|               | `.dp` property                  | Access elevation dp value     |
|               | `.shadows` property             | Access shadow list            |
|               | `.surfaceColor(context)` method | Get tinted surface color      |
|               | `level0` to `level5`            | 0dp, 1dp, 3dp, 6dp, 8dp, 12dp |

#### Motion & Animation

| Class      | Purpose                 | Example                                                                                       |
| :--------- | :---------------------- | :-------------------------------------------------------------------------------------------- |
| `M3Motion` | Paired duration + curve | `AnimatedContainer(duration: M3Motion.emphasized.duration, curve: M3Motion.emphasized.curve)` |
|            | `emphasized`            | 500ms with emphasized curve                                                                   |
|            | `emphasizedIncoming`    | 400ms with decelerate curve                                                                   |
|            | `emphasizedOutgoing`    | 200ms with accelerate curve                                                                   |
|            | `standard`              | 300ms with standard curve                                                                     |
|            | `standardIncoming`      | 250ms with decelerate curve                                                                   |
|            | `standardOutgoing`      | 200ms with accelerate curve                                                                   |
|            | `linear`                | 200ms with linear curve                                                                       |

#### Responsive Layout

| Class                    | Purpose                  | Example                                                                     |
| :----------------------- | :----------------------- | :-------------------------------------------------------------------------- |
| `M3ResponsiveBuilder`    | Rebuilds on size change  | `M3ResponsiveBuilder(builder: (context, screenSize) => ...)`                |
| `M3ResponsiveValue<T>`   | Returns value by size    | `M3ResponsiveValue(compact: 2, medium: 3, expanded: 4).get(context)`        |
| `M3ResponsiveVisibility` | Show/hide by screen size | `M3ResponsiveVisibility(visibleOn: [M3ScreenSize.expanded], child: widget)` |
| `M3ResponsiveGrid`       | Adaptive grid layout     | `M3ResponsiveGrid(children: widgets, maxCrossAxisExtent: 200)`              |
| `M3ResponsiveScaffold`   | Adaptive navigation      | `M3ResponsiveScaffold(destinations: [...], body: widget)`                   |
| `M3ResponsiveGridConfig` | Grid configuration       | `M3ResponsiveGridConfig.fromScreenSize(screenSize)`                         |
| `M3ResponsiveNavigation` | Navigation type selector | `M3ResponsiveNavigation.getNavigationType(screenSize)`                      |

#### Available Token Enums (Use wrapper classes instead)

| Enum                       | Wrapper Class Alternative               | Best Practice                |
| :------------------------- | :-------------------------------------- | :--------------------------- |
| `M3SpacingToken`           | `M3EdgeInsets`, `M3Padding`, `M3Gap`    | Use wrappers for type safety |
| `M3CornerToken`            | `M3Shape`, `M3BorderRadius`, `M3Radius` | Use shape classes            |
| `M3OpacityToken`           | Direct `M3Opacities` values             | Use const values             |
| `M3IconSizeToken`          | Direct `M3IconSizes` values             | Use const values             |
| `M3MarginToken`            | `M3Margins.getMargin(context)`          | Use responsive method        |
| `M3BorderWidthToken`       | `M3BorderSide`, `M3Border`              | Use border classes           |
| `M3StateLayerOpacityToken` | Direct `M3StateLayerOpacities` values   | Use const values             |
| `M3BreakpointToken`        | `M3ResponsiveBuilder`, `M3ScreenSize`   | Use responsive utilities     |
| `M3ZIndexToken`            | Direct `M3ZIndexes` values              | Use const values             |

### 🔧 Helper Functions & Utilities

| Utility                         | Purpose                                | Example                                                              |
| :------------------------------ | :------------------------------------- | :------------------------------------------------------------------- |
| `M3ScreenSize`                  | Get current screen size classification | `final size = M3ScreenSize.fromContext(context)`                     |
| `M3SurfaceTint.fromElevation()` | Calculate tinted surface color         | `color: M3SurfaceTint.fromElevation(context, M3ElevationDps.level3)` |
| `M3Margins.getMargin()`         | Get responsive margin                  | `padding: EdgeInsets.all(M3Margins.getMargin(context))`              |
| Extension methods               | Various Flutter widget extensions      | Applied automatically when imported                                  |

### ✅ ⚠️ For Maximum Flexibility: Using const Tokens Directly

#### Spacing & Layout Tokens

| Token Class       | Values                                                                                                                  | Usage                                                                              |
| :---------------- | :---------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| `M3Spacings`      | `space0`, `space2`, `space4`, `space8`, `space12`, `space16`, `space24`, `space32`, `space48`                           | `const EdgeInsets.all(M3Spacings.space16)`                                         |
| `M3Margins`       | `compactScreen` (16dp), `mediumScreen` (24dp), `expandedScreen` (32dp), `largeScreen` (40dp), `extraLargeScreen` (48dp) | `EdgeInsets.symmetric(horizontal: M3Margins.compactScreen)`                        |
| `M3Spacers`       | Pre-built spacer widgets                                                                                                | `M3Spacers.horizontal16`                                                           |
| `M3IconSizes`     | `extraSmall` (18dp), `small` (20dp), `medium` (24dp), `large` (36dp), `extraLarge` (40dp), `huge` (48dp)                | `Icon(Icons.star, size: M3IconSizes.medium)`                                       |
| `M3VisualDensity` | `minimumDensity` (-3), `compactDensity` (-2), `standardDensity` (0), `comfortableDensity` (0)                           | `Theme(visualDensity: VisualDensity(horizontal: M3VisualDensity.standardDensity))` |
| `M3ZIndexes`      | `behind` (-1), `base` (0), `dropdown` (10), `sticky` (100), `modal` (1000), `tooltip` (9999)                            | `Stack(children: [Positioned(z: M3ZIndexes.modal, child: widget)])`                |

#### Shape & Border Tokens

| Token Class      | Values                                                                                                                   | Usage                                    |
| :--------------- | :----------------------------------------------------------------------------------------------------------------------- | :--------------------------------------- |
| `M3Corners`      | `none` (0dp), `extraSmall` (4dp), `small` (8dp), `medium` (12dp), `large` (16dp), `extraLarge` (28dp), `full` (circular) | `Radius.circular(M3Corners.medium)`      |
| `M3BorderWidths` | `none` (0dp), `thin` (1dp), `medium` (2dp), `thick` (4dp)                                                                | `Border.all(width: M3BorderWidths.thin)` |

#### Motion Tokens

| Token Class        | Values                                                                                                                         | Usage                                                   |
| :----------------- | :----------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------ |
| `M3MotionDuration` | `short1-4` (50-200ms), `medium1-4` (250-400ms), `long1-4` (450-600ms), `extraLong1-4` (700-1000ms)                             | `AnimatedContainer(duration: M3MotionDuration.medium2)` |
| `M3MotionCurve`    | `emphasized`, `emphasizedAccelerate`, `emphasizedDecelerate`, `standard`, `standardAccelerate`, `standardDecelerate`, `linear` | `AnimatedContainer(curve: M3MotionCurve.emphasized)`    |

#### Visual Effect Tokens

| Token Class             | Values                                                                                                                                   | Usage                                                              |
| :---------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------- |
| `M3Opacities`           | `opacity4` (0.04), `opacity8` (0.08), `opacity12` (0.12), `opacity16` (0.16), `opacity38` (0.38), `opacity54` (0.54), `opacity87` (0.87) | `Opacity(opacity: M3Opacities.opacity38)`                          |
| `M3StateLayerOpacities` | `hover` (0.08), `focus` (0.12), `pressed` (0.12), `dragged` (0.16)                                                                       | `Container(color: color.withOpacity(M3StateLayerOpacities.hover))` |
| `M3ElevationDps`        | `level0` (0dp), `level1` (1dp), `level2` (3dp), `level3` (6dp), `level4` (8dp), `level5` (12dp)                                          | `Material(elevation: M3ElevationDps.level3)`                       |
| `M3ElevationShadows`    | `level0`, `level1`, `level2`, `level3`, `level4`, `level5`                                                                               | `BoxDecoration(boxShadow: M3ElevationShadows.level3)`              |

#### Responsive Tokens

| Token Class     | Values                                                                                         | Usage                                   |
| :-------------- | :--------------------------------------------------------------------------------------------- | :-------------------------------------- |
| `M3Breakpoints` | `compact` (0dp), `medium` (600dp), `expanded` (840dp), `large` (1200dp), `extraLarge` (1600dp) | `if (width > M3Breakpoints.medium) ...` |

### ⚠️ Token Enums (Avoid Using .value Directly)

#### ❌ Why to Avoid

| ❌ Don't Do This                    | ⚠️ Problem                | ✅ Do This Instead                                                 |
| :---------------------------------- | :------------------------ | :----------------------------------------------------------------- |
| `M3SpacingToken.space16.value`      | Loses const performance   | `M3Spacings.space16` or `M3EdgeInsets.all(M3SpacingToken.space16)` |
| `M3CornerToken.medium.value`        | No design system benefit  | `M3Corners.medium` or `M3Shape.medium`                             |
| `M3OpacityToken.opacity38.value`    | Verbose without advantage | `M3Opacities.opacity38`                                            |
| `M3IconSizeToken.medium.value`      | Not const                 | `M3IconSizes.medium`                                               |
| `M3MarginToken.compactScreen.value` | Runtime calculation       | `M3Margins.compactScreen` or `M3Margins.getMargin(context)`        |
| `M3BorderWidthToken.thin.value`     | No type safety            | `M3BorderWidths.thin` or `M3BorderSide.thin()`                     |

## 🎯 Summary

### Choose Your Approach

1. **Need Material Design 3 compliance?** → Use M3 wrapper classes
2. **Need flexibility with good performance?** → Use const tokens directly
3. **Never do this** → Don't use `.value` on token enums

### Performance vs Compliance Matrix

| Approach     | M3 Compliance | Performance             | Flexibility | Recommendation  |
| :----------- | :------------ | :---------------------- | :---------- | :-------------- |
| M3 Classes   | ✅ Perfect    | ✅ Const where possible | ⚠️ Limited  | **Use this**    |
| Const Tokens | ⚠️ Manual     | ✅ Full const           | ✅ High     | Use when needed |
| Token.value  | ❌ None       | ❌ No const             | ⚠️ Medium   | **Avoid**       |

## 📊 Complete Token and Utility Reference

### Design Tokens

These are constant values that form the foundation of your design system, ensuring consistency across spacing, colors, typography, and more.

#### 🟢 CONST Design Tokens

Use these with `const` keyword for best performance:

| Group                  | Token           | Class (const)           | Purpose                                | Example Values                                                                                                                                                                                                                                                                                                 | How to Use                                                         |
| :--------------------- | :-------------- | :---------------------- | :------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------- |
| **Layout & Spacing**   | Spacing         | `M3Spacings`            | 4dp grid system for consistent spacing | `space0` (0dp), `space2` (2dp), `space4` (4dp), `space8` (8dp), `space12` (12dp), `space16` (16dp), `space24` (24dp), `space32` (32dp), `space48` (48dp)                                                                                                                                                       | `const EdgeInsets.all(M3Spacings.space16)`                         |
|                        | Margin          | `M3Margins`             | Responsive container margins           | `compactScreen` (16dp), `mediumScreen` (24dp), `expandedScreen` (32dp), `largeScreen` (40dp), `extraLargeScreen` (48dp)                                                                                                                                                                                        | `const EdgeInsets.symmetric(horizontal: M3Margins.compactScreen)`  |
|                        | Spacer          | `M3Spacers`             | Pre-built spacer widgets               | `horizontal4`, `horizontal8`, `horizontal16`, `vertical4`, `vertical8`, `vertical16`, etc.                                                                                                                                                                                                                     | `M3Spacers.horizontal16`                                           |
|                        | Icon Size       | `M3IconSizes`           | Standardized icon dimensions           | `extraSmall` (18dp), `small` (20dp), `medium` (24dp), `large` (36dp), `extraLarge` (40dp), `huge` (48dp)                                                                                                                                                                                                       | `Icon(Icons.star, size: M3IconSizes.medium)`                       |
|                        | Visual Density  | `M3VisualDensity`       | UI density configurations              | `minimumDensity` (-3), `compactDensity` (-2), `standardDensity` (0), `comfortableDensity` (0)                                                                                                                                                                                                                  | `VisualDensity(horizontal: M3VisualDensity.standardDensity)`       |
|                        | Z-Index         | `M3ZIndexes`            | Values for layer stacking order        | `behind` (-1), `base` (0), `dropdown` (10), `sticky` (100), `modal` (1000), `tooltip` (9999)                                                                                                                                                                                                                   | `Positioned(child: widget, zIndex: M3ZIndexes.modal)`              |
| **Responsive**         | Breakpoint      | `M3Breakpoints`         | Breakpoints for responsive design      | `compact` (0dp), `medium` (600dp), `expanded` (840dp), `large` (1200dp), `extraLarge` (1600dp)                                                                                                                                                                                                                 | `if (width > M3Breakpoints.medium) ...`                            |
| **Motion & Animation** | Motion Duration | `M3MotionDuration`      | Duration for animations                | `short1` (50ms), `short2` (100ms), `short3` (150ms), `short4` (200ms), `medium1` (250ms), `medium2` (300ms), `medium3` (350ms), `medium4` (400ms), `long1` (450ms), `long2` (500ms), `long3` (550ms), `long4` (600ms), `extraLong1` (700ms), `extraLong2` (800ms), `extraLong3` (900ms), `extraLong4` (1000ms) | `AnimatedContainer(duration: M3MotionDuration.medium1)`            |
|                        | Motion Curve    | `M3MotionCurve`         | Easing curves for animations           | `emphasized`, `emphasizedAccelerate`, `emphasizedDecelerate`, `standard`, `standardAccelerate`, `standardDecelerate`, `linear`                                                                                                                                                                                 | `AnimatedContainer(curve: M3MotionCurve.emphasized)`               |
|                        | Motion          | `M3Motion`              | Combined duration + curve settings     | `emphasized`, `emphasizedIncoming`, `emphasizedOutgoing`, `standard`, `standardIncoming`, `standardOutgoing`, `linear`                                                                                                                                                                                         | See non-const section                                              |
| **Color & Opacity**    | Opacity         | `M3Opacities`           | General transparency values            | `opacity4` (0.04), `opacity8` (0.08), `opacity12` (0.12), `opacity16` (0.16), `opacity38` (0.38), `opacity54` (0.54), `opacity87` (0.87)                                                                                                                                                                       | `Opacity(opacity: M3Opacities.opacity38)`                          |
|                        | State Layer     | `M3StateLayerOpacities` | Overlays for interactive states        | `hover` (0.08), `focus` (0.12), `pressed` (0.12), `dragged` (0.16)                                                                                                                                                                                                                                             | `Container(color: color.withOpacity(M3StateLayerOpacities.hover))` |
| **Shape & Border**     | Corner          | `M3Corners`             | Individual corner values               | `none` (0dp), `extraSmall` (4dp), `small` (8dp), `medium` (12dp), `large` (16dp), `extraLarge` (28dp), `full` (circular)                                                                                                                                                                                       | `Radius.circular(M3Corners.medium)`                                |
|                        | Radius          | `M3Radius`              | Individual corner radius values        | `none`, `extraSmall`, `small`, `medium`, `large`, `extraLarge`, `circular`                                                                                                                                                                                                                                     | `M3Radius.medium`                                                  |
|                        | Border Radius   | `M3BorderRadius`        | Complete border radius for containers  | `none`, `extraSmall`, `small`, `medium`, `large`, `extraLarge`, `full`                                                                                                                                                                                                                                         | `BoxDecoration(borderRadius: M3BorderRadius.medium)`               |
|                        | Shape           | `M3Shape`               | Border shapes for components           | `none`, `extraSmall`, `small`, `medium`, `large`, `extraLarge`, `full`                                                                                                                                                                                                                                         | `Card(shape: M3Shape.medium)`                                      |
|                        | Border Width    | `M3BorderWidths`        | Border thickness values                | `none` (0dp), `thin` (1dp), `medium` (2dp), `thick` (4dp)                                                                                                                                                                                                                                                      | `Border.all(width: M3BorderWidths.thin)`                           |
|                        | Border Side     | `M3BorderSide`          | Individual border sides                | Pre-configured border side configurations                                                                                                                                                                                                                                                                      | `M3BorderSide.thin(color)`                                         |
|                        | Border          | `M3Border`              | Complete border specifications         | Pre-configured borders                                                                                                                                                                                                                                                                                         | `M3Border.all(color: Colors.grey)`                                 |
| **Elevation & Shadow** | Elevation DP    | `M3ElevationDps`        | Surface elevation values in dp         | `level0` (0dp), `level1` (1dp), `level2` (3dp), `level3` (6dp), `level4` (8dp), `level5` (12dp)                                                                                                                                                                                                                | `Material(elevation: M3ElevationDps.level3)`                       |
|                        | Shadow          | `M3ElevationShadows`    | Box shadow configurations              | `level0`, `level1`, `level2`, `level3`, `level4`, `level5`                                                                                                                                                                                                                                                     | `BoxDecoration(boxShadow: M3ElevationShadows.level3)`              |
|                        | Elevation       | `M3Elevation`           | Complete elevation (dp + shadows)      | `level0`, `level1`, `level2`, `level3`, `level4`, `level5` - each contains both dp value and shadow list                                                                                                                                                                                                       | `M3Elevation.level3` (access `.dp` and `.shadows` properties)      |
| **Typography**         | Text Style      | `M3TextStyle`           | Complete typography scale              | `displayLarge`, `displayMedium`, `displaySmall`, `headlineLarge`, `headlineMedium`, `headlineSmall`, `titleLarge`, `titleMedium`, `titleSmall`, `bodyLarge`, `bodyMedium`, `bodySmall`, `labelLarge`, `labelMedium`, `labelSmall`                                                                              | `Text('Hello', style: M3TextStyle.bodyLarge)`                      |

#### 🔵 NON-CONST Tokens (Enums and Functions)

Use these WITHOUT `const` keyword - values calculated at runtime:

| Group                  | Token           | Enum/Function                                                             | Why it's not const                   | How to Use                                                                                                                                               |
| :--------------------- | :-------------- | :------------------------------------------------------------------------ | :----------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Layout & Spacing**   | Spacing         | `M3SpacingToken`                                                          | Enum returns value via getter        | `final space = M3SpacingToken.space16.value;`                                                                                                            |
|                        | Margin          | `M3MarginToken`                                                           | Enum returns value via getter        | `final margin = M3MarginToken.compactScreen.value;`                                                                                                      |
|                        | Spacer          | `M3SpacerToken`                                                           | Enum returns widget via getter       | `M3SpacerToken.horizontal16.spacer`                                                                                                                      |
|                        | Icon Size       | `M3IconSizeToken`                                                         | Enum returns value via getter        | `final size = M3IconSizeToken.medium.value;`                                                                                                             |
|                        | Z-Index         | `M3ZIndexToken`                                                           | Enum returns value via getter        | `final zIndex = M3ZIndexToken.modal.value;`                                                                                                              |
| **Responsive**         | Breakpoint      | `M3BreakpointToken`                                                       | Enum returns value via getter        | `final breakpoint = M3BreakpointToken.medium.value;`                                                                                                     |
|                        | Margin (method) | `M3Margins.getMargin()`                                                   | Varies with screen size              | `final margin = M3Margins.getMargin(context);`                                                                                                           |
| **Motion & Animation** | Motion          | ` M3Motion.x.duration` `M3Motion.x.curve`                                 | Object with duration and curve props | `final motion = M3Motion.emphasized;`<br>`duration: motion.duration,`<br>`curve: motion.curve,`                                                          |
| **Color & Opacity**    | Opacity         | `M3OpacityToken`                                                          | Enum returns value via getter        | `final opacity = M3OpacityToken.opacity38.value;`                                                                                                        |
|                        | State Layer     | `M3StateLayerOpacityToken`                                                | Enum returns value via getter        | `final opacity = M3StateLayerOpacityToken.hover.value;`                                                                                                  |
|                        | Surface Tint    | `M3SurfaceTint.fromElevation()`                                           | Depends on theme/context             | `final color = M3SurfaceTint.fromElevation(context, M3ElevationDps.level3);`                                                                             |
| **Shape & Border**     | Corner          | `M3CornerToken`                                                           | Enum returns value via getter        | `final corner = M3CornerToken.medium.value;`                                                                                                             |
|                        | Border Width    | `M3BorderWidthToken`                                                      | Enum returns value via getter        | `final width = M3BorderWidthToken.thin.value;`                                                                                                           |
| **Elevation & Shadow** | Elevation       | `M3Elevation.x.dp` `M3Elevation.x.shadows` `M3Elevation.x.surfaceColor()` | Enum with multiple getters           | `final elev = M3Elevation.level3.value;`<br>`final shadows = M3Elevation.level3.shadows;`<br>`final surface = M3Elevation.level3.surfaceColor(context);` |

### Utility & Helper Classes

These are classes that help apply design tokens in a type-safe and responsive way.

| Group                   | Utility / Class          | Purpose                                    | Common Use Case                         |
| :---------------------- | :----------------------- | :----------------------------------------- | :-------------------------------------- |
| **Layout Helpers**      | `M3EdgeInsets`           | Type-safe padding/margin                   | Enforces use of spacing tokens          |
|                         | `M3Padding`              | Pre-configured padding widget              | Consistent padding application          |
|                         | `M3Gap`                  | Spacing between flex children (Row/Column) | `Row`/`Column` spacing                  |
| **Decoration Helpers**  | `M3BoxDecoration`        | Type-safe box decoration                   | Enforces use of all style tokens        |
|                         | `M3ShapeDecoration`      | Type-safe shape decoration                 | Enforces use of all style tokens        |
| **Responsive Builders** | `M3ResponsiveBuilder`    | Responsive widget builder                  | Rebuilds on screen size class change    |
|                         | `M3ResponsiveValue`      | Responsive value selection                 | Defines different values per breakpoint |
|                         | `M3ResponsiveVisibility` | Conditional visibility                     | Shows/hides based on screen size        |
|                         | `M3ResponsiveGrid`       | Responsive grid layout                     | Adaptive columns and spacing            |
|                         | `M3ResponsiveScaffold`   | Adaptive navigation scaffold               | Bottom nav → Rail → Drawer              |
| **Responsive Logic**    | `M3ScreenSize`           | Window size classification                 | Compact, Medium, Expanded, etc.         |
|                         | `M3ResponsiveGridConfig` | Grid layout configuration                  | Columns, gutters, margins               |
|                         | `M3ResponsiveNavigation` | Navigation pattern selection               | Determines nav type by size             |

## 📚 Further Reading

- [Material Design 3 Specification](https://m3.material.io/)
- [Full API Documentation](https://pub.dev/documentation/material_design/latest/)

## 📄 License

BSD License - see [LICENSE](LICENSE) file

---

<p align="center">
  <strong>Building consistent, beautiful Flutter apps with Material Design 3</strong>
</p>
