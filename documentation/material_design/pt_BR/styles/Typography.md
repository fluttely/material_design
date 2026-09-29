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
- `withWeightAxis(style)` / `textThemeWithWeightAxis(theme)` — o próprio `fontWeight`
  do estilo, aplicado no eixo `wght` (Unreleased). Ver abaixo.

`highContrast` e `dyslexiaFriendly` sobem para o próximo peso *nomeado* por valor.
Antes procuravam o peso em `FontWeight.values`, e desde o Flutter 3.41 um peso como
`FontWeight(450)` (o que `FontWeight.lerp` produz no meio de uma animação) não está em
lista nenhuma — a busca falhava e caía em `w100`, deixando o texto "mais forte" mais
fino. Corrigido, com um teste de regressão que falhava contra o código antigo.

## Fontes variáveis (Roboto Flex) — Roadmap 3.2

**Para o que a spec dá um valor:** só o peso. A escala tipográfica fixa um peso por
papel (e a escala enfatizada, um passo acima). Ela não define grade, largura,
arredondamento nem tamanho óptico para texto — ao contrário dos ícones, onde o `GRAD`
tem paradas publicadas (`M3IconGrades`). Então o pacote codifica o eixo de peso e nada
mais; inventar grades de texto seria exatamente o tipo de número que este pacote
existe para barrar.

**Por que o peso precisa de ajuda:** até o **Flutter 3.41** um `FontWeight` não
chegava ao eixo `wght` de uma fonte variável
([flutter/flutter#148026](https://github.com/flutter/flutter/issues/148026), commit
de engine `e090117`, primeiro stable 3.41.0). O piso do pacote é 3.27, então de 3.27 a
3.38 um app que embarca a Roboto Flex desenha todos os papéis no peso padrão da fonte,
e a `M3EmphasizedTypeScale` renderiza idêntica à base. `withWeightAxis` aplica
`FontVariation('wght', fontWeight.value)` — um número que o estilo já carrega.

- **Inofensivo nos outros casos**: uma fonte estática não tem eixo `wght` e o ignora;
  no 3.41+ ele repete o que o `FontWeight` já define.
- **Aplique por último**: um `wght` explícito *sobrepõe* o `FontWeight`, então um
  `copyWith(fontWeight:)` posterior desenha o peso antigo numa fonte variável.
  `highContrast` e `dyslexiaFriendly` ressincronizam um eixo existente; nunca adicionam
  um.
- **Mapeie a ênfase antes**: `M3EmphasizedTypeScale.of` busca por valor, então um
  estilo que já tem variações volta inalterado.
- **Bônus de animação**: dois estilos com os mesmos eixos na mesma ordem interpolam o
  eixo continuamente, então uma transição base → enfatizada é suave em vez de saltar.

**Deixados para quem chama, de propósito:** `GRAD`, `wdth`, `ROND`, `slnt`. O `opsz`
também: o Flutter documenta `FontVariation.opticalSize` como normalmente derivado do
tamanho da fonte, e OpenType (pontos) e CSS (px) discordam da unidade, então defini-lo
explicitamente seria um chute. Revisitar se a spec publicar valores de eixo para texto.

Quando o piso do pacote chegar ao Flutter 3.41, `withWeightAxis` fica redundante e pode
ser removido.

Relacionado: [[Styles|Estilos]] · [[../foundations/Accessibility|Acessibilidade]]
