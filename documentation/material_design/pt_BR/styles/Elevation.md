# Elevação

Spec: https://m3.material.io/styles/elevation

## Escala

`M3ElevationDps` (como `M3ElevationDpValue`): `level0` 0 · `level1` 1 · `level2` 3 ·
`level3` 6 · `level4` 8 · `level5` 12 (+ `values`).

## `M3Elevation` — o enum composto

Cada nível emparelha `dp` com `shadows` pré-construídas:

```dart
M3Elevation.level2.dp;                    // 3.0
M3Elevation.level2.shadows;               // List<M3BoxShadow>
M3Elevation.level2.surfaceColor(context); // tint-blended surface
M3Elevation.fromValue(7.5);               // snaps to closest level
```

Extensão `M3ElevationComparison`: `isHigherThan`, `isLowerThan`, `differenceFrom`.

## Sombras

`M3ElevationShadows.level0…level5` — listas estáticas de sombras (cor da sombra 15%
de preto, `0x26000000`); `fromElevationToken(token)` e `fromElevation(dp)` (limiares
≥12/8/6/3/1). `M3BoxShadow` tem construtor privado: sombras só vêm da escala.

## Surface tint

A fórmula da spec e a variante de alto contraste vivem em `M3SurfaceTint` —
documentadas em [[Color#Surface tint|Cor]]. Chamada preferida:
`colorScheme.surfaceAtElevation(level)` ou `M3Elevation.levelN.surfaceColor(context)`.

Completo para a spec do M3; nenhum item de roadmap em aberto.

Relacionado: [[Styles|Estilos]] · [[Color|Cor]] · [[../maps/Token Map|Mapa de Tokens]]
