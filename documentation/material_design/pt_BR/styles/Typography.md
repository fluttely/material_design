# Tipografia

Spec: https://m3.material.io/styles/typography

## `M3TypeScale` — os 15 estilos de base

| Estilo | tamanho | altura de linha | tracking | peso |
| :--- | --: | --: | --: | --: |
| displayLarge | 57 | 64 | −0.25 | 400 |
| displayMedium | 45 | 52 | 0 | 400 |
| displaySmall | 36 | 44 | 0 | 400 |
| headlineLarge | 32 | 40 | 0 | 400 |
| headlineMedium | 28 | 36 | 0 | 400 |
| headlineSmall | 24 | 32 | 0 | 400 |
| titleLarge | 22 | 28 | 0 | 400 |
| titleMedium | 16 | 24 | 0.15 | 500 |
| titleSmall | 14 | 20 | 0.1 | 500 |
| bodyLarge | 16 | 24 | 0.5 | 400 |
| bodyMedium | 14 | 20 | 0.25 | 400 |
| bodySmall | 12 | 16 | 0.4 | 400 |
| labelLarge | 14 | 20 | 0.1 | 500 |
| labelMedium | 12 | 16 | 0.5 | 500 |
| labelSmall | 11 | 16 | 0.5 | 500 |

Todos `TextStyle`s `const` carregando apenas métricas — sem cor, então fazem merge
limpo em qualquer tema. `M3TypeScale.values` (1.6.0) os lista na ordem acima.

## `M3EmphasizedTypeScale` — a escala enfatizada (1.6.0) ⚗️

O M3 Expressive tornou a ênfase parte do sistema tipográfico em vez de algo que cada
call site improvisa com `copyWith(fontWeight: FontWeight.bold)` — que é como uma
codebase acaba com quatro ideias diferentes do que é "negrito".

Os mesmos 15 papéis, um passo de peso acima, cada um mantendo o **tamanho e a altura
de linha** da sua base, de modo que a troca nunca reflui o layout. Duas relações da
spec: papéis que são regular (400) viram medium (500); papéis que já são medium — os
titles e labels — viram bold (700). O tracking muda apenas onde a spec ajusta (os
papéis display e headline normalizam para 0; `bodyLarge` fecha de 0.5 para 0.15).

```dart
Text('Saldo', style: M3TypeScale.titleMedium),
Text(r'R$ 12.480', style: M3EmphasizedTypeScale.headlineLarge),

// Seguro em um estilo já customizado — o que não for reconhecido volta inalterado.
final style = isSelected
    ? M3EmphasizedTypeScale.of(M3TypeScale.bodyLarge)
    : M3TypeScale.bodyLarge;
```

`values` é alinhado por índice com `M3TypeScale.values`.

⚠️ Os 15 papéis produzem **14** estilos distintos: `titleSmall` e `labelLarge` são
metricamente idênticos (14/20/0.1/w500), então `of()` é uma busca **por valor, não por
papel**. Inofensivo — as formas enfatizadas do par também são idênticas — mas fixado
por um teste, para ser um fato documentado e não uma surpresa.

## `M3TextTheme`

`toTextTheme()` constrói um `TextTheme` do Flutter; `applyToTheme(theme)` faz
**merge** sobre o text theme existente do tema, de modo que as cores resolvidas por
brilho e o `fontFamily` sobrevivem (a lição da 1.0.0-dev.34: `copyWith(textTheme:)`
apagava todas as cores de texto).

## `M3TextUtils`

- `clampedScaler(context, minScaleFactor:, maxScaleFactor:)` — `TextScaler` limitado;
  uma troca deliberada de acessibilidade, use depois que o layout já tiver sido
  flexibilizado.
- `responsiveDisplay(context)` — displaySmall < 600dp, displayMedium < 1200dp, senão
  displayLarge.
- `dyslexiaFriendly(style)` — +0.12 de letterSpacing, height ≥ 1.6, um passo de peso acima.
- `mono(style)` — Roboto Mono + stack mono do sistema, tracking 0.
- `highContrast(style)` — um passo de peso mais forte.
- `withFontFamily(base:, fontFamily:, fallback:)` — família customizada sobre a stack
  sans-serif do sistema.

## Ainda planejado

Orientação sobre eixos de fontes variáveis (wght/GRAD/wdth/ROND com a Roboto Flex) —
[[../Roadmap|Roadmap 3.2]].

Relacionado: [[Styles|Estilos]] · [[../foundations/Accessibility|Acessibilidade]]
