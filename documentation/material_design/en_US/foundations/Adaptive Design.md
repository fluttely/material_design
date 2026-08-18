# Adaptive Design

Spec: https://m3.material.io/foundations/layout/understanding-layout

## Window size classes

`M3Breakpoints`: `compact` 0 · `medium` 600 · `expanded` 840 · `large` 1200 ·
`extraLarge` 1600 (all `M3BreakpointValue`, `values` list included).

`M3ScreenSize` (selector enum) is the primary API:

```dart
final size = M3ScreenSize.of(context); // or .fromWidth(width)
size.columns;      // 4 / 8 / 12
size.gutterWidth;  // s16 compact, s24 otherwise (M3SpacingValue)
size.pageMargin;   // M3Margins.* for the class
size.bodyWidth;    // null / null / 840 / 1040 / 1040
size.maxContentWidth; size.paneWidth; size.minWidth;
size.isAtLeast(M3ScreenSize.medium); size.isMobile; size.isTablet; size.isDesktop;
```

Supporting scales: `M3Margins` (16dp compact, 24dp elsewhere), `M3Spacers.pane`
(24dp), `M3LayoutWidths` (`body` 1040 · `pane` 360 · `ultraWide` 1920 · `unbounded`).

## Responsive widgets (adaptive module)

| Widget | Use |
| :--- | :--- |
| `M3ResponsiveBuilder` | rebuild on window class change: `builder: (context, screenSize) => …` |
| `M3ResponsiveValue<T>` | pick a value per class with nearest-fallback |
| `M3ResponsiveVisibility` | show/hide by class (`visibleOn: [...]`, `replacement:`) |
| `M3ResponsiveGrid` / `M3ResponsiveGridConfig` | spec column grid (4/8/12) with class-correct gutters/margins |
| `M3ResponsiveScaffold` | navigation switches bottom bar → rail → drawer |
| `M3AdaptiveScaffold` | same idea, drawer-slot variant |
| `M3ResponsiveNavigation` | the underlying policy: `getNavigationType`, `shouldExtendRail`, `getRailWidth({required extended})` → an `M3SpacingValue` from `M3NavigationSizes` (1.6.0; it used to inline `80.0`/`256.0`) |

## `M3Adaptive` statics

`responsiveLayout`, `responsiveValue<T>`, `adaptivePadding`/`adaptiveMargin`
(class-correct `M3Margins`), `adaptiveNavigation`, `adaptiveAppBar`,
`showAdaptiveDialog` (fullscreen on compact, `AlertDialog` otherwise),
`showAdaptiveSheet` (bottom sheet on compact, 320dp side panel otherwise, sliding with
`emphasizedDecelerate`/450ms), `adaptiveGrid` (1–5 columns), `adaptiveContainer`,
`adaptiveButton` (48dp touch / 32dp mouse), `adaptiveFAB`,
`inputMethodType(context)` → `M3InputMethodType.touch|mouse` (prefixed in 1.6.0).

## Navigation measurements (1.6.0)

`M3NavigationSizes` holds what the responsive helpers used to inline: `barHeight` 80 ·
`railWidth` 80 · `extendedRailWidth` 256 · `drawerWidth` 360 · `indicatorHeight` 32,
all `M3SpacingValue`.

```dart
final width = M3ResponsiveNavigation.getRailWidth(extended: true); // 256, typed
```

The 256dp extended width was verified against Flutter's own
`NavigationRail.minExtendedWidth` default, so a custom rail lines up with the
built-in one. Rest of the component layer: [[../styles/Shape|Shape]] and the
[[../maps/Token Map|Token Map]].

## Canonical layouts (1.6.0)

Spec: https://m3.material.io/foundations/layout/canonical-layouts/overview — three
ready-made layouts, each collapsing **differently** when only one pane fits. That
difference is the point: they are three named widgets, not one, because the compact
behaviour is what distinguishes them.

| Layout | Expanded and up | Compact / medium |
| :--- | :--- | :--- |
| `M3ListDetailLayout` | list (360dp) + detail side by side | detail **replaces** the list once something is selected |
| `M3SupportingPaneLayout` | primary + supporting (360dp) | supporting **stacks** below the primary content |
| `M3FeedLayout` | 3 / 4 / 5 columns | **reflows** to 1 (compact) or 2 (medium) columns |

```dart
// Detail replaces the list on a phone; PopScope wires the system back gesture.
M3ListDetailLayout(
  list: MailList(onSelect: (id) => setState(() => _selected = id)),
  detail: _selected == null ? null : MailDetail(_selected!),
  placeholder: const Center(child: Text('Select a message')),
  onNavigateBack: () => setState(() => _selected = null),
);

// The support stacks below — it is part of the same task, not a destination.
M3SupportingPaneLayout(primary: Editor(), supporting: PropertiesPanel());

// Columns, gutters and page margin all come from the window size class.
M3FeedLayout(
  children: cards,
  itemColumns: const {M3ScreenSize.compact: 2}, // override just this class
);
```

Hiding supporting content behind navigation is the bug these names exist to prevent.
A selection has a detail you navigate *to*; a filter panel or a properties inspector
does not — sending the user away to reach it costs them the context they were working
in. Only `M3ListDetailLayout` navigates.

`M3CanonicalLayout` is the shared policy, exposed for layouts the package does not
ship:

```dart
M3CanonicalLayout.displayModeOf(context);            // single | dual
M3CanonicalLayout.displayModeFor(M3ScreenSize.large); // dual
M3CanonicalLayout.paneWidthFor(M3PaneRole.secondary, size); // 360dp
```

Two panes need **expanded (840dp) or wider**, not medium: at medium a 360dp support
pane would leave the primary content narrower than a phone. `M3PaneRole.secondary` is
fixed at `M3LayoutWidths.pane` — supporting content should not grow just because the
window did — while `M3PaneRole.primary` is `unbounded` and takes what is left.

Related: [[Foundations]] · [[../maps/Token Map|Token Map]]
