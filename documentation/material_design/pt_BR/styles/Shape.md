# Forma

Spec: https://m3.material.io/styles/shape

## A escala de cantos de 7 níveis

`M3Corners` (como `M3CornerValue`): `none` 0 · `extraSmall` 4 · `small` 8 · `medium` 12
· `large` 16 · `extraLarge` 28 · `full` 9999 (+ `values`). Exatamente sete — a escala
é fechada; qualquer outra coisa passa por `M3Contract.corner(…)`.

## A família de forma (cada tipo estende seu equivalente no Flutter)

| Tipo | Estende | Notas |
| :--- | :--- | :--- |
| `M3Radius` | `Radius` | `const M3Radius(M3CornerValue)` + os 7 estáticos |
| `M3BorderRadius` | `BorderRadius` | `.all/.vertical/.horizontal/.only` (parâmetros `M3Radius`) + 7 estáticos |
| `M3Shape` | `RoundedRectangleBorder` | `Card(shape: M3Shape.medium)`; 7 estáticos |
| `M3BorderSide` | `BorderSide` | `outlineColor` + `M3BorderWidthValue`; `.thin/.thick/.extraThick`, `none`; largura 0 ⇒ `BorderStyle.none` |
| `M3Border` | `Border` | `.fromBorderSide`, `.all(outlineColor:, width:)`, `.thin/.thick/.extraThick`; `none` é `const` desde a 1.6.0 |
| `M3BoxDecoration` | `BoxDecoration` | restringe `borderRadius`/`border`/`boxShadow` a tipos M3 |
| `M3ShapeDecoration` | `ShapeDecoration` | exige `M3Shape`; extensões `withM3Shape`/`addM3Shadows` |

## Larguras de borda

`M3BorderWidths`: `none` 0 · `thin` 1 · `thick` 2 · `extraThick` 4 (+ `values`).
O anel de foco de 3dp deliberadamente **não** está aqui — ele vive em
`M3FocusIndicator` ([[../foundations/Accessibility|Acessibilidade]]).

## Ícones

`M3IconSizes`: `dense` 20 · `standard` 24 · `medium` 32 · `large` 40 · `extraLarge`
48 (+ `values`).

Os quatro eixos variáveis do Material Symbols chegaram na **1.7.0**, cada um como
sua própria escala:

- `M3IconWeights` — `wght`: `thin` 100 · `extraLight` 200 · `light` 300 ·
  `regular` 400 · `medium` 500 · `semiBold` 600 · `bold` 700.
- `M3IconGrades` — `GRAD`: `onDark` -25 · `normal` 0 · `emphasis` 200. O grade muda
  a espessura do traço *sem* mudar a largura do ícone, e é por isso que ele é o eixo
  de correção óptica, não de reestilização.
- `M3IconFills` — `FILL`: `unfilled` 0 · `filled` 1. Fill é um **estado**: o M3 marca
  o destino selecionado andando pelo eixo, não trocando de glifo.
- `M3IconOpticalSizes` — `opsz`: espelha `M3IconSizes`, mais
  `forIconSize(size)`, que limita ao intervalo 20–48 em que o eixo é definido.

`M3IconStyle` é um `IconThemeData` construído apenas com esses tokens, com
`opticalSize` assumindo `size` por padrão (a regra da spec) e presets para
`standard`, `dense`, `selected`, `onDarkSurface` e `disabled`. É um contrato, não um
widget — o `Icon` do Flutter já renderiza os eixos.

Os três eixos que não são de tamanho exigem a **fonte variável Material Symbols**;
com a fonte `Icons` estática que vem no Flutter os valores são carregados, mas não
desenhados.

## Formas do Expressive

A biblioteca de 35 formas, `M3ERoundedPolygon`, morphing e os adaptadores
`M3EShapeBorder` / `M3EShapeMorph` (1.6.0) vivem em
[[../expressive/M3 Expressive|M3 Expressive]]. `M3EShapeBorder` é um
`OutlinedBorder`, então uma forma do Expressive vai a qualquer lugar que um `M3Shape`
vai:

```dart
Card(shape: M3EShapeBorder(M3EShapes.cookie7Sided));
```

## Medidas de componentes (1.6.0)

A camada de tokens `comp` fixa os tamanhos por componente que a spec publica:
`M3ButtonHeights` (32/40/56/96/136) · `M3FabSizes` (40/56/96) · `M3AppBarHeights`
(64/112/152, `bottom` 80) · `M3NavigationSizes` (barHeight 80, railWidth 80,
extendedRailWidth 256, drawerWidth 360, indicatorHeight 32) · `M3ListItemHeights`
(56/72/88). Todos `M3SpacingValue`, todos na grade de 4dp — tabela completa no
[[../maps/Token Map|Mapa de Tokens]].

```dart
SizedBox(height: M3ButtonHeights.medium, child: FilledButton(…));
```

⚠️ `M3ButtonHeights.extraSmall` (32) e `.small` (40) são alturas **visuais**, abaixo
do mínimo de toque de 48dp em mobile. Um controle nessas alturas expande a área de
toque, não a caixa (o Flutter faz isso com `MaterialTapTargetSize.padded`) —
[[../foundations/Accessibility|Acessibilidade]].

Relacionado: [[Styles|Estilos]] · [[Elevation|Elevação]] · [[../maps/Token Map|Mapa de Tokens]]
