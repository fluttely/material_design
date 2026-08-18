# Cor

Spec: https://m3.material.io/styles/color

## Tones — a camada reference

`M3Tones`: as 13 paradas de tom HCT como `M3ToneValue` — `t0` 0, `t10`, `t20`, `t30`,
`t40`, `t50`, `t60`, `t70`, `t80`, `t90`, `t95`, `t99`, `t100` (+ `values`).

## Paletas tonais (HCT de verdade, via `material_color_utilities`)

```dart
final palette = M3TonalPalette.fromSeed(const Color(0xFF6750A4));
palette[M3Tones.t40]; // light-scheme primary
palette[M3Tones.t80]; // dark-scheme primary

final core = M3CorePalette.fromSeed(seed); // primary, secondary, tertiary,
core.neutral[M3Tones.t99];                 // neutral, neutralVariant, error
```

Construtores: `fromSeed` (o pipeline de key colors do Material — reproduz a baseline
exatamente, verificado em testes), `fromColor` (matiz+croma exatos), `.of(hue:, chroma:)`.
Membros: `tone(int)`, `operator []`, `tones` (amostrada em todas as paradas).

## Helpers no nível de scheme (no `ColorScheme`)

Extensão `M3ColorSchemeTokens`: `stateLayerColor(base, state)`,
`disabledContent(base)` 38%, `disabledContainer(base)` 12%,
`surfaceAtElevation(M3Elevation)`, `isAccessible(fg, bg)`.

## Surface tint

`M3SurfaceTint.calculateSurfaceColor(surface:, surfaceTint:, elevation:)` implementa
a fórmula da spec `opacity = 0.12 × (1 − e^(−dp/8))`, com teto em 0.12 (≥24dp);
`highContrastSurface` usa um multiplicador de 1.5× com teto em 0.20. No enum:
`M3Elevation.level2.surfaceColor(context)`.

## Utilitários — `M3ColorUtils`

Manipulação (`blend`, `lighten`, `darken`, `saturate`, `desaturate`), cores de estado
(`hover`, `pressed`, `focused`, `disabled`, `dragged`), matemática WCAG (ver
[[../foundations/Accessibility|Acessibilidade]]), `isLight`, `onColor`.

`harmonize(designColor, sourceColor)` — o blend em HCT da spec
(`Blend.harmonize` do `material_color_utilities`): a matiz da cor de design gira no
máximo 15° em direção à cor de origem, croma e tom sobrevivem, então uma cor de marca
fixa entra em um scheme gerado por seed sem virar outra cor.

```dart
final brandGreen = M3ColorUtils.harmonize(
  const Color(0xFF2E7D32),
  colorScheme.primary,
);
```

O `harmonious(base)` pré-2.0 — aritmética de roda HSL (±30°/±120°/180°) devolvendo
cinco cores — foi **removido** na 1.6.0. Era uma operação que o Material não define.

## Opacidades

`M3Opacities`: `disabledContent` 0.38 · `disabledContainer` 0.12 · `divider` 0.12 ·
`backdrop` 0.5. State layers: ver
[[../foundations/Interaction States|Estados de Interação]].

## Schemes — `M3ColorSchemes` (1.6.0)

```dart
final scheme = M3ColorSchemes.fromSeed(
  seedColor: brandPurple,
  variant: M3SchemeVariant.expressive,
  contrastLevel: M3ContrastLevels.high,
);

// Segue o brilho da plataforma *e* a preferência de contraste do usuário:
final scheme = M3ColorSchemes.fromContext(context, seedColor: brandPurple);
```

Também `light(seedColor:, …)` e `dark(seedColor:, …)`. O `M3SchemeVariant` carrega as
nove variantes da spec — `tonalSpot` (o default do Material You), `fidelity`,
`monochrome`, `neutral`, `vibrant`, `expressive`, `content`, `rainbow`, `fruitSalad` —
e resolve para o `DynamicSchemeVariant` do Flutter.

> **Por que isso encapsula o Flutter em vez de reimplementá-lo.** O
> `ColorScheme.fromSeed` já roda o pipeline Material inteiro
> (`material_color_utilities` → as nove variantes → 45 papéis) e o SDK o mantém em dia
> com a spec. Um segundo pipeline aqui só divergiria dele. O que o pacote acrescenta é
> o **contrato**: um token de variante e um token de contraste no lugar de um `double`
> que aceita `2.7` em silêncio. Cor dinâmica de plataforma continua delegada ao
> `dynamic_color` (documentada, não encapsulada).

## Contraste — `M3ContrastLevels` (1.6.0)

`M3ContrastLevelValue`: `reduced` −1.0 · `standard` 0.0 · `medium` 0.5 · `high` 1.0
(+ `values`). Válvula de escape: `M3Contract.contrastLevel(…)`.

`M3ContrastLevels.of(context)` devolve `high` quando a plataforma reporta a
configuração de acessibilidade de alto contraste, e `standard` caso contrário.
Contraste é uma *preferência do usuário*, e fixá-lo em standard é o bug de
acessibilidade mais comum em um tema gerado por seed.

## Custom colors — `M3ExtendedColor` (1.6.0)

Uma cor de marca expandida nos quatro papéis do M3, nas paradas de tom que a spec fixa
por brilho (claro: 40/100/90/10 — escuro: 80/20/30/90):

```dart
final success = M3ExtendedColor.harmonized(
  name: 'success',
  source: const Color(0xFF2E7D32),
  harmonizeWith: colorScheme.primary,
  brightness: Theme.of(context).brightness,
);
success.color; success.onColor; success.colorContainer; success.onColorContainer;
```

`M3ExtendedColors` leva um conjunto nomeado pelo tema como uma `ThemeExtension`:

```dart
ThemeData(extensions: [
  M3ExtendedColors.of(
    {'success': const Color(0xFF2E7D32)},
    harmonizeWith: scheme.primary,
    brightness: Brightness.light,
  ),
]);

M3ExtendedColors.from(context)['success']; // conjunto vazio, não exceção, se ausente
```

Relacionado: [[Styles|Estilos]] · [[Elevation|Elevação]] · [[../maps/Token Map|Mapa de Tokens]]
