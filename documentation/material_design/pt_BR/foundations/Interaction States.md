# Estados de Interação

Spec: https://m3.material.io/foundations/interaction/states

## State layers

`M3StateLayerOpacities`: `hover` 8% · `focus` 10% · `pressed` 10% · `dragged` 16%.

`M3InteractionState` (enum seletor) carrega sua própria opacidade:
`M3InteractionState.hover.stateLayerOpacity == 0.08`.

A resolução de cor vive em um único lugar, no `ColorScheme`:

```dart
final hovered = colorScheme.stateLayerColor(colorScheme.onSurface, M3InteractionState.hover);
```

`M3StateLayer` aplica o sistema inteiro como um widget — cor de overlay na opacidade
correta para hover/focus/press/drag, com a precedência do M3 (dragged > pressed >
focused > hovered):

```dart
M3StateLayer(
  overlayColor: colorScheme.onSurface,
  borderRadius: M3BorderRadius.medium,
  onTap: () {},
  child: card,
)
```

Também: `onLongPress`, `onHover`, `focusNode`, `enabled` (conteúdo desabilitado =
38%, container desabilitado = 12% via `M3Opacities` / `colorScheme.disabledContent`).

## Foco

Ver [[Accessibility|Acessibilidade]] — `M3FocusRing` + `M3FocusIndicator` (3dp/3dp, recuo reservado).

## Densidade visual

`M3VisualDensity extends VisualDensity`: `standard` (0,0) · `comfortable` (−1,−1) ·
`compact` (−2,−2) · `adaptivePlatformDensity` · `forPlatform(platform)` ·
`forScreenSize(size)`.

Extensões: `M3VisualDensityUtils` (`isMoreCompactThan`, `adjustBy`, `lerpTo`,
`isTouchFriendly` ≥ −1, `isDesktopOptimized` ≤ 0) e `M3VisualDensityContext` no
`BuildContext` (`visualDensity`, `recommendedDensity`, `prefersCompactDensity`,
`withVisualDensity`).

Relacionado: [[Foundations|Fundamentos]] · [[../styles/Motion|Movimento]] · [[../styles/Color|Cor]]
