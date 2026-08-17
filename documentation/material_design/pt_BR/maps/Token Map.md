# Mapa de Tokens — token da spec → símbolo do pacote

Lista autoritativa de todas as escalas, com valores exatos. Se esta tabela e a `lib/`
discordarem, o código vence e este arquivo é corrigido na mesma sessão.
Atualizado contra a 1.6.0.

## Convenção de nomenclatura

`M3*` é a superfície da spec. `M3E*` é o Material Expressive — o módulo `m3e` inteiro
é `@experimental`, e o prefixo é o que mantém nomes genéricos de geometria (`Point`,
`Cubic`, `Morph`) fora do seu namespace raiz. Dois tokens do Expressive vivem fora do
módulo porque pertencem aos sistemas que estendem: `M3ESpring` fica na biblioteca de
motion e `M3EmphasizedTypeScale` na de tokens (sem `E` — é uma escala tipográfica,
não geometria).

## Escalas escalares (extension type + classe de constantes)

| Escala | Tipo de valor | Constantes (dp, salvo indicação) | `values`? | Válvula de escape |
| :--- | :--- | :--- | :-: | :--- |
| Spacing | `M3SpacingValue` | `M3Spacings`: none 0, s4, s8, s12, s16, s20, s24, s28, s32, s36, s40, s48, s56, s64, s72, s80, s96, s128, infinity | ✅ (18 finitos; `infinity` é uma diretiva de layout, não um valor) | `M3Contract.spacing` |
| Margens | `M3SpacingValue` | `M3Margins`: compactScreen 16, medium/expanded/large/extraLargeScreen 24 | ✅ (alinhada por índice com `M3ScreenSize.values`) | — |
| Spacers | `M3SpacingValue` | `M3Spacers`: pane 24 | ✅ | — |
| Cantos | `M3CornerValue` | `M3Corners`: none 0, extraSmall 4, small 8, medium 12, large 16, extraLarge 28, full 9999 | ✅ | `M3Contract.corner` |
| Larguras de borda | `M3BorderWidthValue` | `M3BorderWidths`: none 0, thin 1, thick 2, extraThick 4 | ✅ | `M3Contract.borderWidth` |
| Indicador de foco | — | `M3FocusIndicator`: thickness 3 (largura de borda), offset 3 (espaçamento) | — | — |
| Opacidades | `M3OpacityValue` | `M3Opacities`: disabledContent .38, disabledContainer .12, divider .12, backdrop .50 | ✅ | `M3Contract.opacity` |
| State layers | `M3OpacityValue` | `M3StateLayerOpacities`: hover .08, focus .10, pressed .10, dragged .16 | ✅ | — |
| Tamanhos de ícone | `M3IconSizeValue` | `M3IconSizes`: dense 20, standard 24, medium 32, large 40, extraLarge 48 | ✅ | `M3Contract.iconSize` |
| Peso do ícone (`wght`) | `M3IconWeightValue` | `M3IconWeights`: thin 100 … regular 400 … bold 700 | ✅ | — |
| Grade do ícone (`GRAD`) | `M3IconGradeValue` | `M3IconGrades`: onDark −25, normal 0, emphasis 200 | ✅ | — |
| Fill do ícone (`FILL`) | `M3IconFillValue` | `M3IconFills`: unfilled 0, filled 1 | ✅ | — |
| Optical size do ícone (`opsz`) | `M3IconOpticalSizeValue` | `M3IconOpticalSizes`: 20, 24, 32, 40, 48 (+ `forIconSize`, limitado a 20–48) | ✅ | — |
| Z-index | `M3ZIndexValue` (int) | `M3ZIndexes`: background 0, content 1, floating 10, drawer 100, modal 1000, snackbar 2000, tooltip 9999 | ✅ | `M3Contract.zIndex` |
| Breakpoints | `M3BreakpointValue` | `M3Breakpoints`: compact 0, medium 600, expanded 840, large 1200, extraLarge 1600 | ✅ | `M3Contract.breakpoint` |
| Larguras de layout | `M3BreakpointValue` | `M3LayoutWidths`: pane 360, body 1040, ultraWide 1920, unbounded ∞ | ✅ (omite `unbounded`) | — |
| Elevação em dp | `M3ElevationDpValue` | `M3ElevationDps`: level0 0, level1 1, level2 3, level3 6, level4 8, level5 12 | ✅ | `M3Contract.elevationDp` |
| Tones | `M3ToneValue` (int) | `M3Tones`: t0, t10, t20, t30, t40, t50, t60, t70, t80, t90, t95, t99, t100 | ✅ | — |
| Níveis de contraste | `M3ContrastLevelValue` | `M3ContrastLevels`: reduced −1.0, standard 0.0, medium 0.5, high 1.0 (+ `.of(context)` → high quando a plataforma reporta alto contraste) | ✅ | `M3Contract.contrastLevel` |

## Tokens de componente (1.6.0 — a camada `comp`)

Apenas valores: o pacote não entrega componentes M3, entrega os números para que um
controle customizado caia nas mesmas medidas do componente nativo ao lado. Todos são
`M3SpacingValue` na grade de 4dp.

| Classe | Constantes | `values`? |
| :--- | :--- | :-: |
| `M3ButtonHeights` | extraSmall 32, small 40, medium 56, large 96, extraLarge 136 | ✅ |
| `M3FabSizes` | small 40, standard 56, large 96 | ✅ |
| `M3AppBarHeights` | small 64, medium 112, large 152, bottom 80 | ✅ (as três alturas de topo; `bottom` é outro componente) |
| `M3NavigationSizes` | barHeight 80, railWidth 80, extendedRailWidth 256, drawerWidth 360, indicatorHeight 32 | — (não é uma escala — são cinco medidas diferentes) |
| `M3ListItemHeights` | oneLine 56, twoLine 72, threeLine 88 | ✅ |

⚠️ `M3ButtonHeights.extraSmall` (32) e `.small` (40) são alturas **visuais** abaixo do
mínimo de toque de 48dp em mobile. Expanda a área de toque, não a caixa —
[[../foundations/Accessibility|Acessibilidade]].

## Tokens compostos (enums)

| Token | Campos | Valores |
| :--- | :--- | :--- |
| `M3Elevation` | `dp`, `shadows` | level0–level5 (0/1/3/6/8/12 dp) + `fromValue` |
| `M3Motion` | `duration`, `curve` | emphasized 500, emphasizedIncoming 450, emphasizedOutgoing 150, standard 300, standardIncoming 250, standardOutgoing 200, linear 150 (ms) |
| `M3ESpring` ⚗️ | `damping`, `stiffness` | 12 tokens, tabela abaixo. `description` → `SpringDescription`, `simulation(start:, end:, velocity:)` → `SpringSimulation`, `isBouncy` |

### `M3ESpring` — os 12 tokens de spring

| Token | damping | stiffness |
| :--- | --: | --: |
| `standardSpatialSlow` | 0.9 | 300 |
| `standardSpatialDefault` | 0.9 | 700 |
| `standardSpatialFast` | 0.9 | 1400 |
| `standardEffectsSlow` | 1.0 | 800 |
| `standardEffectsDefault` | 1.0 | 1600 |
| `standardEffectsFast` | 1.0 | 3800 |
| `expressiveSpatialSlow` | 0.8 | 200 |
| `expressiveSpatialDefault` | 0.8 | 380 |
| `expressiveSpatialFast` | 0.6 | 800 |
| `expressiveEffectsSlow` | 1.0 | 800 |
| `expressiveEffectsDefault` | 1.0 | 1600 |
| `expressiveEffectsFast` | 1.0 | 3800 |

Os springs de efeito são **idênticos nos dois schemes** e todos criticamente
amortecidos (1.0): expressão pertence ao movimento, não à cor.

## Seletores (enums)

| Seletor | Valores | Resolve para |
| :--- | :--- | :--- |
| `M3ScreenSize` | compact/medium/expanded/large/extraLarge | colunas, gutters, margens, larguras |
| `M3InteractionState` | hover/focus/pressed/dragged | `stateLayerOpacity` |
| `M3MotionDistance` | short/medium/long/extraLong | short2/medium2/long2/extraLong2 |
| `M3MotionType` | incoming/outgoing/persistent/standard | curvas |
| `M3MotionScheme` ⚗️ | standard/expressive | `spatial(speed)`, `effects(speed)`, `spring(kind, speed)`, `springs` → `M3ESpring` |
| `M3MotionSpeed` | slow/standard/fast | o eixo de velocidade da busca no scheme |
| `M3MotionSpringKind` | spatial/effects | o eixo de tipo da busca no scheme |
| `M3SchemeVariant` | tonalSpot, fidelity, monochrome, neutral, vibrant, expressive, content, rainbow, fruitSalad | `DynamicSchemeVariant` (via `dynamicSchemeVariant`) |
| `M3NavigationType` | bottom/rail/drawer | padrão de navegação |
| `M3InputMethodType` | touch/mouse | dimensionamento de alvo de toque |
| `M3PaneRole` | primary/secondary | largura do pane — `secondary` é fixo em `M3LayoutWidths.pane`, `primary` é `unbounded` |
| `M3PaneDisplayMode` | single/dual | se dois panes cabem (`dual` de expanded para cima) |

⚗️ = `@experimental`.

## Constantes de estilo (não são escalas)

- `M3TypeScale` — 15 `TextStyle`s + `values` (ver a tabela em [[../styles/Typography|Tipografia]]).
- `M3EmphasizedTypeScale` ⚗️ — os mesmos 15 papéis um passo de peso acima, mesmo
  tamanho e altura de linha, + `values` (alinhado por índice) e `of(style)`. Os 15
  papéis produzem 14 estilos distintos: `titleSmall` e `labelLarge` são metricamente
  idênticos, então `of()` é uma busca por valor, não por papel.
- `M3MotionDuration` — short1…extraLong4 (50…1000ms). `M3MotionCurve` — 7 cúbicas.
- `M3ElevationShadows` — listas de sombras level0…level5.
- `M3EdgeInsetsPatterns` — card 16, dialog 24, listItem 16/8, compactPage h16,
  expandedPage h24.
- `M3VisualDensity` — standard (0,0), comfortable (−1,−1), compact (−2,−2).
- `M3EShapes` ⚗️ — 35 `M3ERoundedPolygon`s (+ `all`).
- `M3ColorSchemes` — `fromSeed`/`light`/`dark`/`fromContext`, retornando um
  `ColorScheme` do Flutter construído a partir de `M3SchemeVariant` +
  `M3ContrastLevelValue`.
- `M3ExtendedColor` / `M3ExtendedColors` — as custom colors do M3 (`color`, `onColor`,
  `colorContainer`, `onColorContainer`) como uma `ThemeExtension`.
- `M3CanonicalLayout` (1.6.0) — a política de panes por trás dos layouts canônicos:
  `displayModeFor(M3ScreenSize)`, `displayModeOf(BuildContext)`,
  `paneWidthFor(M3PaneRole, M3ScreenSize)`. Não é uma escala — é uma decisão, exposta
  para que um app tome a mesma para um layout que o pacote não entrega.

Relacionado: [[Coverage Map|Mapa de Cobertura]] · [[../foundations/Design Tokens|Design Tokens]]
