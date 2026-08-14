# Material Design 3 for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.27.0-blue)](https://flutter.dev)

🎨 **A complete Material Design 3 design system contract for Flutter**

This library is a **design contract** rather than a repository of free-floating tokens. It enforces Material Design 3 guidelines system-wide by replacing standard Flutter primitives (`double`, `int`, `EdgeInsets`, etc.) with type-safe M3 equivalents. An application that consumes this library will, by construction, strictly adhere to the official Material Design 3 specifications.

## 🚀 Live Demo & Resources

**[🌟 Interactive Design System Explorer](https://fluttely.github.io/material_design/)** - Explore all tokens with live examples

**[📚 Material Design 3 Guidelines](https://m3.material.io/)** - Official specification

## 📦 Installation

Add `material_design` to your `pubspec.yaml`:

```yaml
dependencies:
  material_design: ^1.0.0
```

**Requirements:** Flutter `>=3.27.0`, Dart `>=3.6.0`. The package uses `Color.withValues` and `Color.a`, which landed in Flutter 3.27, and extension types, which landed in Dart 3.3.

---

## 📐 The Design Contract Philosophy (v1.0.0)

Version `1.0.0` moves the design system from documentation into the type system.

**1. Primitive replacement.** APIs accept M3 extension types — `M3SpacingValue`, `M3CornerValue`, `M3BorderWidthValue`, `M3OpacityValue`, `M3IconSizeValue`, `M3BreakpointValue`, `M3ElevationDpValue`, `M3ZIndexValue`, `M3ToneValue` — instead of bare `double` and `int`. Every scale in the package is covered; there is no family that quietly still takes a raw number.

**2. No scalar token enums.** The old `M3SpacingToken.space16.value` pattern is gone. It cost a `.value` unwrap at every call site and, worse, it broke `const`. Scalar tokens are now static constants you use directly.

This is *not* a ban on `enum`. Two kinds of type still are one, and should be:

| Kind | Example | Why an enum |
| :--- | :--- | :--- |
| **Composite tokens** | `M3Motion`, `M3Elevation` | You read `duration` **and** `curve` together, never unwrap to one number. Stays `const`, gains `values` and exhaustive `switch`. |
| **Selectors** | `M3ScreenSize`, `M3InteractionState`, `M3MotionDistance` | These name a situation, not a value. |

The rule is precise: **no token that must be unwrapped to be used.**

**3. Deviation is possible, deliberate, and greppable.**

Extension types are erased at runtime, so a cast will always defeat them:

```dart
const leaked = 17.3 as M3SpacingValue; // compiles. No Dart design prevents this.
```

Rather than claim a guarantee the language cannot give, the package routes every intentional deviation through one identifier — [`M3Contract`](#-when-you-must-break-the-contract):

```dart
M3EdgeInsets.all(M3Contract.spacing(18)) // off the 4dp grid, on purpose
```

Which means you can audit deviations with a single `grep`, and ban them in review. A contract you can measure compliance against beats one that merely claims to be airtight.

---

## 🧱 Package Architecture

The package is nine modules with a one-directional dependency graph:

```text
tokens ──┬─> shape ──┬─> interaction
         ├─> layout ─┤
         ├─> color ──┴─> adaptive
         └─> typography
motion  ─────────────────> interaction, adaptive
expressive (standalone)
```

`import 'package:material_design/material_design.dart'` gives you all of them.

The token layer is deliberately a single Dart library: the type-safe wrappers depend on library-private constructors to keep off-scale values out, and splitting them further would force those constructors public. Every other module is a real boundary — internals stay internal.

---

## ⚖️ Flutter Defaults vs. Material Design 3 Contract

| Concept | Standard Flutter (Error-Prone) | Material Design 3 Contract (Type-Safe) |
| :--- | :--- | :--- |
| **Padding** | `EdgeInsets.all(17.3)` (Arbitrary value) | `const M3EdgeInsets.all(M3Spacings.s16)` (Type-safe token) |
| **Spacing** | `SizedBox(width: 14)` (Unregulated spacing) | `M3Gap(M3Spacings.s12)` (Auto-detects layout direction) |
| **Corners** | `BorderRadius.circular(15)` (Violates shape scale) | `M3BorderRadius.medium` or `M3BorderRadius.all(M3Radius.medium)` (12dp) |
| **Borders** | `BorderSide(width: 1.5)` (Off-spec thickness) | `const M3BorderSide.thin(color)` (1dp) or `M3BorderSide.thick(color)` (2dp) |
| **Shadows** | `BoxShadow(blurRadius: 4)` (Manual shadow configuration) | `M3ElevationShadows.level2` or `M3Elevation.level2.shadows` |
| **Opacity** | `Opacity(opacity: 0.35)` (Arbitrary opacity) | `M3Opacities.disabledContent` (Strict 38% opacity) |
| **Typography** | `TextStyle(fontSize: 15)` (Non-standard size) | `M3TypeScale.bodyLarge` (Strict 16sp, height 24/16, weight 400) |
| **Focus Indicators** | Custom active border layout (High manual styling) | `M3FocusRing(child: ...)` (Official 3dp offset + 3dp thickness secondary ring) |

---

## 📖 How to Use the APIs

### 1. Spacing & Layout

#### Type-safe Spacing Values
Raw doubles are wrapped by the `M3SpacingValue` extension type. Static constants are organized in classes.
* `M3Spacings`: Spacing values on a 4dp grid scale: `none` (0dp), `s4`, `s8`, `s12`, `s16`, `s20`, `s24`, `s28`, `s32`, `s36`, `s40`, `s48`, `s56`, `s64`, `s72`, `s80`, `s96`, `s128`, and `infinity`.
* `M3Margins`: Margins tailored for responsive screen layouts: `compactScreen` (16dp), `mediumScreen` (24dp), `expandedScreen` (24dp), `largeScreen` (24dp), and `extraLargeScreen` (24dp).
* `M3Spacers`: Predefined spacing helper values such as `pane` (24dp).

#### Layout Wrappers
* `M3EdgeInsets`: Enforces `M3SpacingValue` tokens on all constructors:
  ```dart
  const M3EdgeInsets.all(M3Spacings.s16)
  const M3EdgeInsets.symmetric(horizontal: M3Margins.compactScreen, vertical: M3Spacings.s8)
  const M3EdgeInsets.only(top: M3Spacings.s24, bottom: M3Spacings.s12)
  ```
* `M3Padding`: A drop-in replacement for Flutter's `Padding` widget that accepts only `M3EdgeInsets`:
  ```dart
  M3Padding(
    padding: const M3EdgeInsets.all(M3Spacings.s16),
    child: child,
  )
  ```
* `M3Gap`: Auto-directional layout spacer. Placed inside a `Row`, `Column`, `Flex`, or `Wrap`, it automatically determines its orientation and renders the correct spacing size:
  ```dart
  Column(
    children: [
      Text('Header'),
      M3Gap(M3Spacings.s16), // Renders as vertical spacing
      Text('Body'),
    ],
  )
  ```
  *Extensions for rapid spacing declarations are available:* `M3Gap.small()`, `M3Gap.medium()`, and `M3Gap.large()`.

---

### 2. Shape & Borders

#### Strict M3 Shape Scale (Exactly 7 levels)
The design system defines exactly 7 shape corner-radius values:
1. `none` (0dp)
2. `extraSmall` (4dp)
3. `small` (8dp)
4. `medium` (12dp)
5. `large` (16dp)
6. `extraLarge` (28dp)
7. `full` (9999dp - pill/circular shapes)

#### Shape Wrappers
* `M3Radius`: Represents individual corner radius values corresponding to the M3 shape scale:
  ```dart
  const radius = M3Radius.medium; // 12dp circular corner
  ```
* `M3BorderRadius`: Standard collections of `M3Radius` values:
  ```dart
  const borderRadius = M3BorderRadius.medium; // 12dp uniform radius
  const customRadius = M3BorderRadius.only(topLeft: M3Radius.large, topRight: M3Radius.none);
  ```
* `M3Shape`: Implements `RoundedRectangleBorder` matching the M3 shape scale:
  ```dart
  Card(shape: M3Shape.medium)
  ```
* `M3BorderSide`: Enforces `M3BorderWidthValue` tokens (`M3BorderWidths.none`/`thin`/`thick`/`extraThick`):
  ```dart
  M3BorderSide(outlineColor: colorScheme.outline, width: M3BorderWidths.thin)
  // Or using named constructors:
  const M3BorderSide.thin(colorScheme.outline)
  const M3BorderSide.thick(colorScheme.outline)
  ```
* `M3Border`: A custom `Border` wrapper ensuring all sides utilize `M3BorderSide` configurations:
  ```dart
  M3Border.all(outlineColor: colorScheme.outline, width: M3BorderWidths.thin)
  M3Border.thin(colorScheme.outline)
  ```

---

### 3. Decorations & Shadows

* `M3BoxDecoration`: Ensures borders, border radii, and shadows utilize M3 design contract elements:
  ```dart
  Container(
    decoration: const M3BoxDecoration(
      color: Colors.blue,
      borderRadius: M3BorderRadius.medium,
      border: M3Border.thin(Colors.black),
    ),
  )
  ```
* `M3ShapeDecoration`: Enforces `M3Shape` parameters for shape-based background rendering:
  ```dart
  Container(
    decoration: const M3ShapeDecoration(
      color: Colors.blue,
      shape: M3Shape.large,
    ),
  )
  ```
* `M3Elevation`: Encapsulates elevation properties. Direct properties provide DP levels, pre-generated shadow parameters, and tinted overlay colors based on ambient context:
  * `M3Elevation.level0` to `level5` (covering 0dp, 1dp, 3dp, 6dp, 8dp, and 12dp respectively).
  * `.dp` - Accesses raw elevation double value.
  * `.shadows` - Returns list of `M3BoxShadow` definitions.
  * `.surfaceColor(context)` - Computes the correct M3 surface color blended with the surface tint at this elevation level.
* `M3ElevationShadows`: Offers static access to shadow lists:
  ```dart
  BoxDecoration(boxShadow: M3ElevationShadows.level2)
  ```

---

### 4. Interaction Widgets

These widgets implement core Material Design 3 interactive states without manually configuring state details:

* `M3StateLayer`: Wraps a child widget and automatically applies the standard semi-transparent state layer color (on hover, focus, press, or drag interaction) at official M3 state layer opacities:
  ```dart
  M3StateLayer(
    overlayColor: colorScheme.onSurface,
    borderRadius: M3BorderRadius.medium,
    onTap: () {},
    child: childWidget,
  )
  ```
* `M3FocusRing`: Draws the official M3 keyboard focus indicator — a `M3FocusIndicator.thickness` (3dp) ring set `M3FocusIndicator.offset` (3dp) away from the component:
  ```dart
  M3FocusRing(
    borderRadius: M3BorderRadius.full,
    child: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.star),
    ),
  )
  ```
  The ring's 6dp inset is reserved **whether or not the child is focused**. Adding it on focus would shift the control the instant a user tabs to it — a moving target for exactly the people who navigate by keyboard. The trade is a constant, predictable 6dp of padding.

  `M3FocusRing` observes focus; it never takes it. Its child must contain something focusable for the ring to appear.

---

### 5. Typography

All typography styles strictly match the 15 standard Material Design 3 type scale configurations, categorized into Display, Headline, Title, Body, and Label.

#### M3TypeScale
Use these static properties directly where `TextStyle` is expected:
```dart
Text('Section Title', style: M3TypeScale.headlineSmall)
Text('Body text description', style: M3TypeScale.bodyMedium)
```

#### M3TextTheme
Allows you to map these text styles directly to the standard Flutter `TextTheme`:
```dart
ThemeData(
  textTheme: M3TextTheme.toTextTheme(),
)
```

#### M3TextUtils
Utility class that decouples runtime manipulations from static style tokens:
* `M3TextUtils.clampedScaler(context, maxScaleFactor: ...)` - Returns the ambient `TextScaler` capped to a range, for the rare layout that genuinely cannot absorb unbounded text scaling:
  ```dart
  Text(
    label,
    style: M3TypeScale.labelLarge,
    textScaler: M3TextUtils.clampedScaler(context, maxScaleFactor: 1.5),
  )
  ```
  Clamping fights the user's accessibility setting — reach for it only after the layout itself has been made to flex. To clamp a whole subtree, prefer Flutter's `MediaQuery.withClampedTextScaling`.
* `M3TextUtils.responsiveDisplay(context)` - Resolves the optimal display typography variant (`displayLarge`/`Medium`/`Small`) based on the width of the display window.
* `M3TextUtils.dyslexiaFriendly(style)` - Alters font weight, spacing, and line height to make the text style easier to read.
* `M3TextUtils.mono(style)` - Returns a monospace variant matching system stacks.
* `M3TextUtils.highContrast(style)` - Safely boosts the font weight by one step.

---

### 6. Color & Opacity

* `M3ColorSchemeTokens`: Extends `ColorScheme` to expose state-layer colors, container disabled values, and accessibility helpers:
  ```dart
  final hovered = colorScheme.stateLayerColor(
    colorScheme.onSurface,
    M3InteractionState.hover,
  );
  final disabledText = colorScheme.disabledContent(colorScheme.onSurface);
  final elevatedSurface = colorScheme.surfaceAtElevation(M3Elevation.level2);
  final isAccessible = colorScheme.isAccessible(colorScheme.primary, colorScheme.surface);
  ```
* `M3TonalPalette` / `M3CorePalette`: Real tonal palette generation in HCT space — the same math Material Design itself uses, via `material_color_utilities`. A seed color's hue and chroma are held fixed while lightness sweeps the 13 `M3Tones` stops:
  ```dart
  final palette = M3TonalPalette.fromSeed(const Color(0xFF6750A4));
  palette[M3Tones.t40]; // light-scheme `primary`
  palette[M3Tones.t80]; // dark-scheme `primary`

  final core = M3CorePalette.fromSeed(seed);
  core.neutral[M3Tones.t99];  // light-scheme `surface`
  core.error[M3Tones.t40];    // fixed red, regardless of seed
  ```
* `M3Opacities` & `M3StateLayerOpacities`: Exposes type-safe opacities:
  * `M3Opacities.disabledContent` (38% opacity)
  * `M3Opacities.disabledContainer` (12% opacity)
  * `M3Opacities.divider` (12% opacity)
  * `M3StateLayerOpacities.hover` (8% opacity)
  * `M3StateLayerOpacities.focus` (10% opacity)
  * `M3StateLayerOpacities.pressed` (10% opacity)

---

### 7. Responsive Design

* `M3ScreenSize`: Represents standard M3 window size classes (`compact`, `medium`, `expanded`, `large`, `extraLarge`):
  ```dart
  final size = M3ScreenSize.of(context);
  if (size >= M3ScreenSize.medium) { ... }
  ```
* `M3ResponsiveBuilder`: Rebuilds widgets when the screen size changes:
  ```dart
  M3ResponsiveBuilder(
    builder: (context, screenSize) {
      if (screenSize <= M3ScreenSize.compact) return MobileLayout();
      return DesktopLayout();
    },
  )
  ```
* `M3ResponsiveValue<T>`: Picks the correct value based on the current window size class:
  ```dart
  final crossAxisCount = const M3ResponsiveValue<int>(
    compact: 2,
    medium: 4,
    expanded: 6,
  ).of(context);
  ```
* `M3ResponsiveVisibility`: Visually show/hide a widget under specific screen classes:
  ```dart
  M3ResponsiveVisibility(
    visibleOn: const [M3ScreenSize.expanded, M3ScreenSize.large],
    child: sidebarWidget,
  )
  ```
* `M3ResponsiveGrid`: Renders children in an adaptive M3 column grid layout.
* `M3ResponsiveScaffold`: Renders components using responsive navigation (switching between bottom navigation, navigation rails, and permanent drawers depending on screen space).

---

### 8. Motion & Animation

Pairs duration with curve characteristics according to official transition guidelines.

* `M3Motion`: Exposes predefined animation motion profiles:
  * `M3Motion.emphasized` (500ms, Emphasized Curve) - Main enter/exit transitions.
  * `M3Motion.emphasizedIncoming` (450ms, Emphasized Decelerate)
  * `M3Motion.emphasizedOutgoing` (150ms, Emphasized Accelerate)
  * `M3Motion.standard` (300ms, Standard Curve)
  * `M3Motion.standardIncoming` (250ms, Standard Decelerate)
  * `M3Motion.standardOutgoing` (200ms, Standard Accelerate)
  ```dart
  AnimatedContainer(
    duration: M3Motion.emphasized.duration,
    curve: M3Motion.emphasized.curve,
    // ...
  )
  ```
* `M3MotionDuration`: Offers standalone durations ranging from `short1` (50ms) to `extraLong4` (1000ms).
* `M3MotionCurve`: Exposes independent easing curve constants (e.g. `M3MotionCurve.emphasized`).
* `M3Motion.emphasizedDuration` / `M3Motion.emphasizedCurve` (and one pair per scheme): flat aliases for `const` contexts, where a field access such as `M3Motion.emphasized.duration` is not permitted.
* `M3Motion.durationFor(M3MotionDistance.long)` and `M3Motion.curveFor(M3MotionType.incoming)`: pick a token by intent. Both return M3 types, not bare `Duration`/`Curve`.

---

### 9. Expressive Layouts (M3 Expressive)

Includes experimental expressive elements:
* `M3ELoadingIndicator`: Dynamic morphing loading animations.
* `RoundedPolygon`: Tools in `e_shapes` to define custom rounded polygons, shapes, and morphing matrices.

---

## 🔓 When you must break the contract

Sometimes the design system is not the authority — a brand asset is genuinely 18dp, a third-party spec disagrees, an animation passes through values between two tokens. `M3Contract` is the one sanctioned way out:

```dart
M3Contract.spacing(18)      // → M3SpacingValue
M3Contract.corner(10)       // → M3CornerValue
M3Contract.borderWidth(1.5) // → M3BorderWidthValue
M3Contract.opacity(0.42)    // → M3OpacityValue  (asserts 0.0–1.0)
M3Contract.iconSize(18)     // → M3IconSizeValue
M3Contract.breakpoint(720)  // → M3BreakpointValue
M3Contract.elevationDp(2)   // → M3ElevationDpValue
M3Contract.zIndex(42)       // → M3ZIndexValue
```

Because every deviation names the same identifier, compliance becomes measurable:

```sh
# How far has this codebase drifted from Material Design 3?
grep -rn 'M3Contract\.' lib/ | wc -l
```

Teams that want zero drift can fail CI on any hit. Teams migrating an existing app can watch the number fall. Either way the deviations are visible, which is more than an "unbreakable" contract with a silent cast in it would give you.

---

## ⚡ Performance Advantages

By designing the system using **extension types** and **static const** references, the library enforces design limits at compile time with **zero runtime overhead**:

* **Tree Shaking:** Unused classes or utilities are completely removed from the compiled binary.
* **Const Constructors:** Wrapper configurations (`M3EdgeInsets`, `M3BorderRadius`, etc.) use standard Dart compile-time const allocation, keeping widget rebuild cycles fast.

---

## 🌟 Premium Code Showcase

Below is a complete implementation of a card displaying hover overlay actions, keyboard focus highlights, spacing limits, and motion transitions using the Material Design 3 design contract APIs. It is compiled and rendered by the test suite (`test/readme_showcase_test.dart`), so it cannot drift from the API:

```dart
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class PremiumCardShowcase extends StatelessWidget {
  const PremiumCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return M3FocusRing(
      borderRadius: M3BorderRadius.large,
      child: M3StateLayer(
        overlayColor: colorScheme.onSurface,
        borderRadius: M3BorderRadius.large,
        onTap: () {
          // Action handler
        },
        child: AnimatedContainer(
          duration: M3Motion.emphasized.duration,
          curve: M3Motion.emphasized.curve,
          padding: const M3EdgeInsets.all(M3Spacings.s24),
          decoration: M3BoxDecoration(
            color: colorScheme.surfaceAtElevation(M3Elevation.level1),
            borderRadius: M3BorderRadius.large,
            border: M3Border.all(
              outlineColor: colorScheme.outlineVariant,
              width: M3BorderWidths.thin,
            ),
            boxShadow: M3ElevationShadows.level1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'COMPILATION SAFE',
                style: M3TypeScale.labelMedium.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              const M3Gap(M3Spacings.s8),
              Text(
                'Material 3 Contract Design',
                style: M3TypeScale.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const M3Gap(M3Spacings.s16),
              Text(
                'Every spacing, border width, opacity, and text style here '
                'flows through an M3 token.',
                style: M3TypeScale.bodyMedium.copyWith(
                  color: colorScheme.disabledContent(colorScheme.onSurface),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 📄 License

BSD 3-Clause License - see [LICENSE](LICENSE) file

---

<p align="center">
  <strong>Enforce consistency, prevent visual drift, and build beautiful Flutter apps with Material Design 3.</strong>
</p>
