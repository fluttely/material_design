# Interaction States

Spec: https://m3.material.io/foundations/interaction/states

## State layers

`M3StateLayerOpacities`: `hover` 8% · `focus` 10% · `pressed` 10% · `dragged` 16%.

`M3InteractionState` (selector enum) carries its own opacity:
`M3InteractionState.hover.stateLayerOpacity == 0.08`.

Color resolution lives once, on `ColorScheme`:

```dart
final hovered = colorScheme.stateLayerColor(colorScheme.onSurface, M3InteractionState.hover);
```

`M3StateLayer` applies the whole system as a widget — overlay color at the correct
opacity for hover/focus/press/drag, with M3 precedence (dragged > pressed > focused >
hovered):

```dart
M3StateLayer(
  overlayColor: colorScheme.onSurface,
  borderRadius: M3BorderRadius.medium,
  onTap: () {},
  child: card,
)
```

Also: `onLongPress`, `onHover`, `focusNode`, `enabled` (disabled content = 38%,
disabled container = 12% via `M3Opacities` / `colorScheme.disabledContent`).

## Focus

See [[Accessibility]] — `M3FocusRing` + `M3FocusIndicator` (3dp/3dp, reserved inset).

## Visual density

`M3VisualDensity extends VisualDensity`: `standard` (0,0) · `comfortable` (−1,−1) ·
`compact` (−2,−2) · `adaptivePlatformDensity` · `forPlatform(platform)` ·
`forScreenSize(size)`.

Extensions: `M3VisualDensityUtils` (`isMoreCompactThan`, `adjustBy`, `lerpTo`,
`isTouchFriendly` ≥ −1, `isDesktopOptimized` ≤ 0) and `M3VisualDensityContext` on
`BuildContext` (`visualDensity`, `recommendedDensity`, `prefersCompactDensity`,
`withVisualDensity`).

Related: [[Foundations]] · [[../styles/Motion|Motion]] · [[../styles/Color|Color]]
