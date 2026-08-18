# Material Design 3 for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.27.0-blue)](https://flutter.dev)

**A Material Design 3 design contract for Flutter.** Instead of documenting the M3
spec and hoping everyone follows it, this package expresses the spec as Dart types:
APIs take `M3SpacingValue` instead of `double`, so an off-scale value is a compile
error, not a design-review comment.

- 🌟 **[Live demo](https://fluttely.github.io/material_design/)** — every token,
  interactive
- 📋 **[example/lib/main.dart](example/lib/main.dart)** — the whole API in one
  copy-pasteable file
- 📚 **[Official M3 guidelines](https://m3.material.io/)**

## Why

| Plain Flutter (anything compiles) | With the contract (only M3 compiles) |
| :--- | :--- |
| `EdgeInsets.all(17.3)` | `const M3EdgeInsets.all(M3Spacings.s16)` |
| `SizedBox(height: 14)` | `const M3Gap(M3Spacings.s12)` |
| `BorderRadius.circular(15)` | `M3BorderRadius.medium` — 12dp |
| `BoxShadow(blurRadius: 4)` | `M3ElevationShadows.level2` |
| `Opacity(opacity: 0.35)` | `M3Opacities.disabledContent` — 38% |
| `TextStyle(fontSize: 15)` | `M3TypeScale.bodyLarge` — 16sp, 24 height |
| `Duration(milliseconds: 280)` + guessed curve | `M3Motion.standard` — 300ms + standard easing |
| hand-built focus border | `M3FocusRing(child: …)` — official 3dp ring, 3dp offset |

Everything is `const`, extension types are erased at compile time, and unused code
tree-shakes away — the contract costs nothing at runtime.

## Install

```yaml
dependencies:
  material_design: ^1.8.0
```

Requires Flutter `>=3.27.0` / Dart `>=3.6.0` (uses `Color.withValues` and extension
types).

## Quick start

```dart
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

MaterialApp(
  // Merges the M3 type scale into your theme without losing its colors.
  theme: M3TextTheme.applyToTheme(
    ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
    ),
  ),
  home: const HomePage(),
);
```

Then build with tokens instead of numbers:

```dart
Card(
  shape: M3Shape.medium, // 12dp corners
  child: M3Padding(
    padding: const M3EdgeInsets.all(M3Spacings.s16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Title', style: M3TypeScale.titleMedium),
        const M3Gap(M3Spacings.s8), // knows it's inside a Column
        Text('Body', style: M3TypeScale.bodyMedium),
      ],
    ),
  ),
);
```

---

## API tour

Each family below has a page in the [live demo](https://fluttely.github.io/material_design/)
and a section in [example/lib/main.dart](example/lib/main.dart), in this same order.

### 1. Spacing & layout

- **`M3Spacings`** — the 4dp grid: `none`, `s4` … `s128`, `infinity`, plus
  `M3Spacings.values` for galleries.
- **`M3Margins`** (16dp compact / 24dp elsewhere) and **`M3Spacers.pane`** (24dp).
- **`M3EdgeInsets`** — `all`, `symmetric`, `only`, `fromLTRB`, every parameter an
  `M3SpacingValue`. **`M3EdgeInsetsPatterns`** ships common recipes (`card`,
  `dialog`, `listItem`, `compactPage`, `expandedPage`).
- **`M3Padding`** — `Padding` that only accepts `M3EdgeInsets`.
- **`M3Gap`** — a spacer that detects whether it sits in a `Row`, `Column`, `Wrap`,
  or scrollable and orients itself. `M3GapUtils.addGaps(children, M3Spacings.s8)`
  interleaves gaps into an existing list.

```dart
Column(
  children: [
    const Text('Header'),
    const M3Gap(M3Spacings.s16), // vertical here, horizontal in a Row
    const Text('Body'),
  ],
);
```

### 2. Shape & borders

The M3 shape scale has exactly seven stops — **`M3Corners`**: `none` 0 ·
`extraSmall` 4 · `small` 8 · `medium` 12 · `large` 16 · `extraLarge` 28 · `full`
(pill). Each shape type extends its Flutter counterpart, so they drop in anywhere:

```dart
Card(shape: M3Shape.medium);                       // RoundedRectangleBorder
Container(
  decoration: M3BoxDecoration(
    borderRadius: M3BorderRadius.large,            // BorderRadius
    border: M3Border.thin(colorScheme.outline),    // Border, 1dp
  ),
);
const M3BorderRadius.only(topLeft: M3Radius.large, topRight: M3Radius.none);
```

Border widths are their own scale — `M3BorderWidths`: `none` 0, `thin` 1, `thick` 2,
`extraThick` 4 — with named constructors `M3BorderSide.thin/thick/extraThick(color)`.

### 3. Elevation & surfaces

`M3Elevation` is a composite token: each level carries its dp **and** its shadows.

```dart
M3Elevation.level2.dp;                    // 3.0
M3Elevation.level2.shadows;               // ready-made shadow list
M3Elevation.level2.surfaceColor(context); // surface blended with tint at 3dp
colorScheme.surfaceAtElevation(M3Elevation.level2); // same, from the scheme
```

Levels: 0, 1, 3, 6, 8, 12 dp — the bare dps are **`M3ElevationDps.level0…5`** when
you need the number without the shadows. Static shadow lists:
`M3ElevationShadows.level0…5`. `M3ShapeDecoration` pairs an `M3Shape` with those
shadows for `Container.decoration`.

Stacking order is a scale too — **`M3ZIndexes`**: `background` 0 · `content` 1 ·
`floating` 10 · `drawer` 100 · `modal` 1000 · `snackbar` 2000 · `tooltip` 9999, so
a `Stack` orders its children by name instead of by invented integers.

### 4. Typography

The 15 M3 styles as `const TextStyle`s with exact spec metrics:

```dart
Text('Section', style: M3TypeScale.headlineSmall);
Text('Body', style: M3TypeScale.bodyMedium);
```

**Emphasis is part of the scale, not a `copyWith`** (M3 Expressive, experimental).
Each role has an emphasized counterpart at the same font size and line height, so
swapping it in never changes the vertical rhythm. Weight goes one step up (400→500,
or 500→700 for titles and labels); tracking moves only on the roles the spec adjusts,
so a line can end up marginally wider:

```dart
Text('Balance', style: M3TypeScale.titleMedium),
Text(r'R$ 12.480', style: M3EmphasizedTypeScale.headlineLarge),

// Or map any baseline style to its counterpart:
style: isSelected
    ? M3EmphasizedTypeScale.of(M3TypeScale.bodyLarge)
    : M3TypeScale.bodyLarge,
```

`M3TextTheme.applyToTheme(theme)` merges them into a `ThemeData` (see Quick start).
`M3TextUtils` covers the runtime cases: `clampedScaler` (bounded text scaling —
last resort, it fights the user's accessibility setting), `responsiveDisplay`,
`dyslexiaFriendly`, `mono`, `highContrast`, `withFontFamily`.

### 4b. Icons

Material Symbols is a variable font with four axes, and Flutter exposes all four
as bare doubles. Each one has its scale here:

- **`M3IconSizes`** — 20 · 24 · 32 · 40 · 48dp.
- **`M3IconWeights`** — `thin` 100 … `regular` 400 … `bold` 700, matching the
  text weight beside the icon.
- **`M3IconGrades`** — `onDark` -25, `normal` 0, `emphasis` 200. Grade adjusts
  stroke thickness *without* changing the icon's width, which is what makes it
  the axis for optical correction rather than restyling.
- **`M3IconFills`** — `unfilled` 0 / `filled` 1. Fill is a **state**: M3 marks
  the selected destination by moving along this axis, not by swapping glyphs.
- **`M3IconOpticalSizes`** — tracks the rendered size so stroke weight stays
  perceptually constant; `forIconSize(size)` clamps into the 20–48 axis.

`M3IconStyle` is an `IconThemeData` whose every axis is a token, so it drops into
any Flutter icon slot:

```dart
MaterialApp(
  theme: ThemeData(iconTheme: M3IconStyle(color: colorScheme.onSurface)),
);

IconTheme.merge(                    // merge: keeps the inherited color
  data: const M3IconStyle(
    size: M3IconSizes.dense,
    weight: M3IconWeights.medium,
  ),
  child: const Icon(Icons.star),
);

// Or per icon — the axes are typed wherever they are passed.
Icon(Icons.star, size: M3IconSizes.large, fill: M3IconFills.filled);
```

Presets: `M3IconStyle.standard`, `.dense`, `.selected` (filled), `.onDarkSurface`
(grade -25), `.disabled` (38%). `opticalSize` defaults to `size` — the spec
behaviour — so you only pass it to deviate.

`color` is not defaulted: icon color is a color-scheme role, not an icon token.
Mind the Flutter behaviour behind that — an `IconThemeData` with a null color puts
`Icon` on its black fallback, so replacing `ThemeData.iconTheme` wholesale needs a
`color`, and restyling a subtree wants `IconTheme.merge` rather than `IconTheme`.

The three non-size axes are rendered by the **Material Symbols variable font**;
Flutter's bundled `Icons` font is static, so with it the values are carried but
not drawn. The tokens are the same either way — what changes is the font you
ship.

### 5. Color

Real HCT tonal palettes — the same math Material uses, via
`material_color_utilities`:

```dart
final palette = M3TonalPalette.fromSeed(const Color(0xFF6750A4));
palette[M3Tones.t40];                  // light-scheme primary
palette[M3Tones.t80];                  // dark-scheme primary

final core = M3CorePalette.fromSeed(seed);
core.neutral[M3Tones.t99];             // light surface
core.error[M3Tones.t40];               // spec red, independent of seed
```

On `ColorScheme`: `stateLayerColor(base, M3InteractionState.hover)`,
`disabledContent(base)` (38%), `disabledContainer(base)` (12%),
`surfaceAtElevation(level)`, `isAccessible(fg, bg)`.
`M3ColorUtils` adds WCAG contrast math (`calculateContrast`, `meetsWCAGAA/AAA`,
`adjustForAccessibility`) and color manipulation.
Opacity tokens: `M3Opacities` (38/12/12/50%) and `M3StateLayerOpacities`
(hover 8%, focus 10%, pressed 10%, dragged 16%).

### 5b. Schemes, variants & contrast

Build a scheme with the variant and contrast level as tokens rather than raw values:

```dart
final scheme = M3ColorSchemes.fromSeed(
  seedColor: brandPurple,
  variant: M3SchemeVariant.expressive,   // 9 spec variants
  contrastLevel: M3ContrastLevels.high,  // reduced / standard / medium / high
);

// Better: follow the user's own contrast and brightness settings.
final scheme = M3ColorSchemes.fromContext(context, seedColor: brandPurple);
```

Brand colors that must survive inside a seeded scheme get harmonized — a bounded hue
shift in HCT, the spec algorithm, not an HSL approximation:

```dart
final green = M3ColorUtils.harmonize(brandGreen, scheme.primary);

// Or as the four M3 custom-color roles, carried through the theme:
ThemeData(extensions: [
  M3ExtendedColors.of(
    {'success': brandGreen, 'warning': brandAmber},
    harmonizeWith: scheme.primary,
    brightness: Brightness.light,
  ),
]);
final success = M3ExtendedColors.from(context)['success']!;
Text('Saved', style: TextStyle(color: success.onColorContainer));
```

### 6. Interaction states & focus

```dart
M3StateLayer(                       // hover/focus/press/drag overlays, M3 precedence
  overlayColor: colorScheme.onSurface,
  borderRadius: M3BorderRadius.medium,
  onTap: () {},
  child: content,
);

M3FocusRing(                        // official 3dp ring at 3dp offset
  borderRadius: M3BorderRadius.full,
  child: IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
);
```

`M3FocusRing` reserves its 6dp inset even when unfocused, so tabbing never shifts
the control; it observes focus and never takes it.
`M3VisualDensity` provides `standard`/`comfortable`/`compact`,
`forPlatform(platform)` and `forScreenSize(size)`.

### 7. Motion

Duration and curve travel together — you never pair them by hand:

```dart
AnimatedContainer(
  duration: M3Motion.emphasized.duration, // 500ms
  curve: M3Motion.emphasized.curve,       // emphasized easing
);
```

**Springs (M3 Expressive, experimental).** M3 Expressive added a physics model
alongside durations: springs are interruptible and velocity-aware, so a gesture handed
off mid-flight continues instead of restarting.

```dart
// Pick a scheme once; select by intent, never by number.
final spring = M3MotionScheme.expressive.spatial(M3MotionSpeed.fast);

controller.animateWith(
  spring.simulation(start: controller.value, end: 1, velocity: flingVelocity),
);
AnimatedContainer(/* … */); // or hand `spring.description` to a physics widget
```

`spatial()` springs move things and may overshoot; `effects()` springs change color
and opacity and never do. Schemes: `M3MotionScheme.expressive` (Material's default)
and `.standard` (utilitarian, minimal bounce). Speeds: `slow`, `standard`, `fast`.

Schemes: `emphasized`, `emphasizedIncoming`, `emphasizedOutgoing`, `standard`,
`standardIncoming`, `standardOutgoing`, `linear`. For `const` contexts use the flat
aliases (`M3Motion.emphasizedDuration`). Pick by intent with
`M3Motion.durationFor(M3MotionDistance.long)` /
`M3Motion.curveFor(M3MotionType.incoming)`. Raw scales: `M3MotionDuration.short1…extraLong4`
(50–1000ms), `M3MotionCurve.*` (the official cubics).

### 8. Adaptive & responsive

`M3ScreenSize` is the M3 window-size-class selector, and everything else keys off it:

```dart
final size = M3ScreenSize.of(context);   // compact / medium / expanded / large / extraLarge
size.columns;                            // 4 / 8 / 12
size.isAtLeast(M3ScreenSize.medium);

M3ResponsiveValue<int>(compact: 2, medium: 4, expanded: 6,
  builder: (context, cols) => grid(cols));
M3ResponsiveVisibility(visibleOn: const [M3ScreenSize.expanded], child: sidebar);
M3ResponsiveScaffold(destinations: …);   // bottom bar → rail → drawer, automatically
```

**The three canonical layouts** are ready-made, and each handles the compact case the
way the spec says — which is not the same way for all three:

```dart
// List-detail: on a phone the detail *replaces* the list, and back returns.
M3ListDetailLayout(
  list: MailList(onSelect: (id) => setState(() => _selected = id)),
  detail: _selected == null ? null : MailDetail(_selected!),
  onNavigateBack: () => setState(() => _selected = null),
);

// Supporting pane: on a phone the support *stacks below* — it is part of the
// same task, not a destination you navigate to.
M3SupportingPaneLayout(primary: Editor(), supporting: PropertiesPanel());

// Feed: columns, gutters and margins all follow the window size class.
M3FeedLayout(children: cards);
```

`M3CanonicalLayout` exposes the shared policy (`displayModeOf`, `paneWidthFor`) if you
need to make the same decision for a layout the package doesn't ship.

Breakpoints (`M3Breakpoints`: 0/600/840/1200/1600) are tokens too, and so are the
widths a layout is measured *against* — **`M3LayoutWidths`**: `pane` 360dp,
`body` 1040dp (the maximum readable body width), `ultraWide` 1920dp, and
`unbounded` for content that fills its space. `M3Adaptive` bundles static helpers: `responsiveLayout`, `adaptivePadding`, `adaptiveNavigation`,
`showAdaptiveDialog` (fullscreen on phones, dialog on desktop), `showAdaptiveSheet`
(bottom sheet ↔ side panel), `adaptiveButton` (48dp touch / 32dp mouse targets).

### 8b. Component measurements

The spec's per-component numbers, so a custom control lands on the same
measurements as the built-in one beside it. **Values only** — this package does not
ship M3 components; Flutter's Material library owns those.

```dart
M3ButtonHeights.medium;              // 56dp — the five Expressive size classes
M3FabSizes.standard;                 // 56dp
M3AppBarHeights.large;               // 152dp
M3NavigationSizes.extendedRailWidth; // 256dp
M3ListItemHeights.twoLine;           // 72dp
```

Note that `M3ButtonHeights.extraSmall` (32dp) and `.small` (40dp) are *visual*
heights below the 48dp touch minimum — expand the tap area, not the box.

### 9. Accessibility

```dart
M3Accessibility.minTouchTarget(context);           // 48dp touch, 32dp desktop
M3Accessibility.meetsContrastRequirement(foreground: fg, background: bg);
M3Accessibility.shouldReduceMotion(context);
M3Accessibility.adaptiveDuration(context: context, normal: d); // honors reduce-motion
```

`M3AccessibilityConfig.fromContext(context).applyToTheme(theme)` adapts a whole
theme to the user's contrast/motion/text-size settings.

### 10. M3 Expressive (experimental)

The 2025 M3 Expressive primitives, in the `m3e` module. Every symbol is prefixed
`M3E` and annotated `@experimental`: Material is still iterating on this upstream, so
the analyzer will tell you when you opt in.

- **`M3ELoadingIndicator`** (+ `.contained()`) — the morphing loading indicator that
  replaces most indeterminate spinners.
- **`M3EShapes`** — the official 35-shape library (`circle` … `heart`) as
  `M3ERoundedPolygon`s, plus `M3EMorph` for shape-to-shape animation and `toPath()`
  to draw them.

- **`M3EShapeBorder`** — puts those shapes anywhere Flutter takes a `ShapeBorder`,
  and **morphs for free**: lerping two of them runs the real morph algorithm rather
  than crossfading outlines, so any implicit animation morphs.

```dart
// ignore_for_file: experimental_member_use
Card(shape: M3EShapeBorder(M3EShapes.cookie7Sided));

AnimatedContainer(
  duration: M3Motion.emphasized.duration,
  decoration: ShapeDecoration(
    color: color,
    shape: M3EShapeBorder(expanded ? M3EShapes.burst : M3EShapes.circle),
  ),
);
```

---

## 11. Breaking the contract, deliberately

Sometimes the design system is not the authority — a brand asset really is 18dp.
`M3Contract` is the one sanctioned way out:

```dart
M3EdgeInsets.all(M3Contract.spacing(18)) // off the 4dp grid, on purpose
```

Factories exist for every scale: `spacing`, `corner`, `borderWidth`, `opacity`,
`iconSize`, `breakpoint`, `elevationDp`, `zIndex`. Because every deviation names the
same identifier, compliance is measurable:

```sh
grep -rn 'M3Contract\.' lib/ | wc -l   # how far has this app drifted from M3?
```

Zero-drift teams fail CI on any hit; migrating teams watch the number fall. Either
way deviations are visible — which beats an "unbreakable" contract with a silent
`as`-cast in it. (Extension types are erased at runtime, so a cast always compiles;
the package is honest about that instead of pretending otherwise.)

## The rules behind the API

1. **Primitive replacement.** Every scale is an extension type
   (`M3SpacingValue`, `M3CornerValue`, …) with a library-private constructor. No
   family quietly still takes a raw `double`.
2. **No token that must be unwrapped.** Scalar tokens are `static const` values used
   directly — the old `M3SpacingToken.space16.value` pattern is gone; it cost
   `const`-ness at every call site. Enums remain only where they're right:
   composite tokens (`M3Motion`, `M3Elevation` — two fields read together) and
   selectors (`M3ScreenSize`, `M3InteractionState` — they name a situation).
3. **Deviation is explicit and greppable** — `M3Contract`, above.

### What this package deliberately does not ship

**M3 components.** No buttons, menus, toolbars, split buttons, or FAB menus. Flutter's
Material library owns those, and a second `FilledButton` here would become migration
debt for every consumer the day Flutter changes its own. What the package ships
instead is the *contract* those components are built from — including their
measurements, in `M3ButtonHeights` and friends, so a control you build by hand lands
on the same numbers as the built-in one beside it.

The one exception is M3 Expressive widgets Flutter does not have yet
(`M3ELoadingIndicator` today). Each is a stopgap, marked `@experimental`, and gets
removed when Flutter ships the real thing — the 2025 Expressive components are
tracked in [flutter/flutter#168813](https://github.com/flutter/flutter/issues/168813)
and are deliberately *not* reimplemented here while that work is in flight.

### Architecture

Nine modules, one-directional dependencies; `import 'package:material_design/material_design.dart'`
gives you all of them:

```text
tokens ──┬─> shape ──┬─> interaction
         ├─> layout ─┤
         ├─> color ──┴─> adaptive
         └─> typography
motion  ─────────────────> interaction, adaptive
expressive (standalone)
```

## Showcase

A card with hover overlays, keyboard focus, tokenized spacing and motion — compiled
and rendered by `test/readme_showcase_test.dart`, so this snippet cannot drift from
the API:

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

## Versioning

`1.0.x` is young and has no deprecation baggage: API corrections ship as renames
with a migration table in the [CHANGELOG](CHANGELOG.md). Upcoming work (Expressive
spring motion tokens, color scheme variants, emphasized type scale) follows the
same contract rules.

## License

BSD 3-Clause — see [LICENSE](LICENSE).
