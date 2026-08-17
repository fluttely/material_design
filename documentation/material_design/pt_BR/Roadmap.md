# Roadmap — fechando a lacuna com o m3.material.io

**Status:** plano vivo. Última revisão completa: 2026-08-14, contra o `material_design` 1.6.0.

Este é o plano de ação para tornar o pacote um contrato Material Design 3 *completo*.
Ele é o resultado de uma auditoria de toda a spec oficial (https://m3.material.io/ —
Foundations, Styles, Components e a atualização M3 Expressive de 2025) contra a API
real exportada. Cada item declara o que a spec define, o que o pacote tem hoje e o
que construir.

As fases 0–5 foram lançadas como `1.6.0`–`1.6.0`; cada item concluído carrega a
versão que o entregou. A Fase 6 também está fechada, mas como uma **decisão
registrada**, não como código — ver abaixo.

Regras que governam todos os itens aqui:

- Mudanças breaking pós-1.0 são lançadas **sem deprecations** (decisão do owner,
  2026-08 — ainda não há usuários externos; ver `CLAUDE.md`). Renomeie de uma vez,
  documente na tabela de migração do changelog.
- Toda nova API chega com: testes, seção no README, cobertura em
  `example/lib/main.dart`, uma página na demo e uma atualização do
  [[maps/Token Map|Mapa de Tokens]] + [[maps/Coverage Map|Mapa de Cobertura]] em
  ambos os locales do vault.
- Novas escalas seguem o padrão da casa: `extension type M3XValue._(…)` +
  `abstract final class M3Xs` com membros `static const` e uma lista `values`, mais
  uma válvula de escape `M3Contract.x(…)` quando a escala é aberta.

Legenda: ✅ concluído · 🔨 planejado, nesta fase · 🔭 depois / precisa de decisão.

---

## Fase 0 — Higiene de API (breaking) — ✅ lançada na `1.6.0`

A auditoria da 1.0.0 revelou dívida de namespace e de consistência. Corrigi-la era
barato então e caro para sempre depois; foi quitada em uma única release breaking,
sem shims.

| # | Item | Por quê |
| :- | :--- | :--- |
| 0.1 ✅ `1.6.0` | **Parar de vazar geometria sem prefixo para o namespace raiz.** O engine inteiro está prefixado: `M3EPoint`, `M3ECubic`, `M3ECornerRounding`, `M3EFeature`, `M3EEdgeFeature`, `M3ECornerFeature`, `M3ERoundedPolygon`, `M3EMorph`, `M3EPointTransformer`, `M3ERoundedPolygonToPath`, `M3EMorphToPath`. Todo helper que ele exportava (`lerp`, `distance`, `square`, `convex`, `interpolate`, `Measurer`, `MeasuredPolygon`, `DoubleMapper`, `ProgressableFeature`, `twoPi`, `distanceEpsilon`, …) agora é privado à biblioteca. | Segurança de namespace |
| 0.2 ✅ `1.6.0` | **`MaterialShapes` → `M3EShapes`** — a última classe do tipo token sem prefixo `M3`. | Consistência de nomenclatura |
| 0.3 ✅ `1.6.0` | **`LoadingIndicatorTheme` → `M3ELoadingIndicatorTheme`**; `InputMethodType` → `M3InputMethodType`. | Regra de prefixo: `M3` spec / `M3E` expressive |
| 0.4 ✅ `1.6.0` | **Toda a superfície `m3e` é `@experimental`.** O consumidor opta de forma visível (`ignore_for_file: experimental_member_use`) em vez de inferir estabilidade a partir de um doc comment. | Sinaliza níveis de estabilidade |
| 0.5 ✅ `1.6.0` | Listas `values` adicionadas a `M3Margins`, `M3Spacers`, `M3Opacities`, `M3StateLayerOpacities`, `M3LayoutWidths`; `M3Border.none` é `const`. | Uniformidade das classes de escala |
| 0.6 ✅ `1.6.0` + `1.6.0` | Passada de doc-comments: URLs da spec nas classes de token (`1.6.0`) e, quando o `m3e` passou a ser analisado, 19 docs de API faltantes escritos (`1.6.0`). | Rastreabilidade da spec |

> **Decisão registrada:** prefixar venceu a alternativa de mover o engine para uma
> biblioteca opt-in `expressive_shapes.dart`, porque a própria API do
> `M3ELoadingIndicator` recebe um `M3ERoundedPolygon` — a separação forçaria dois
> imports para um widget. Os dois membros `@internal` (`Cubic.fromPoints`,
> `RoundedPolygon.fromFeatures`) passaram a ser genuinamente privados, em vez de
> apenas documentados como proibidos.

## Fase 1 — Conclusão do sistema de cores — ✅ lançada na `1.6.0`

Spec: https://m3.material.io/styles/color — o pacote tinha paletas tonais HCT reais
(`M3TonalPalette`, `M3CorePalette`, `M3Tones`) mas parava antes dos *schemes*.

| # | Item | Referência na spec |
| :- | :--- | :--- |
| 1.1 ✅ `1.6.0` | **`M3ColorSchemes`** — `fromSeed(seedColor:, variant:, brightness:, contrastLevel:)`, mais `light`, `dark` e `fromContext` (que lê o brilho da plataforma *e* a preferência de contraste do usuário). **`M3SchemeVariant`** carrega as nove variantes da spec e resolve para o `DynamicSchemeVariant` do Flutter. | Color / dynamic color schemes |
| 1.2 ✅ `1.6.0` | **`M3ContrastLevels`** — `reduced` (−1.0), `standard` (0.0), `medium` (0.5), `high` (1.0), como `M3ContrastLevelValue`, com `M3ContrastLevels.of(context)` e `M3Contract.contrastLevel` como válvula de escape. | Color / contrast |
| 1.3 ✅ `1.6.0` + `1.6.0` | **Harmonização de cores**: `harmonious()` (aritmética de roda HSL, cinco cores, uma operação que o Material não define) foi removido na `1.6.0`; `M3ColorUtils.harmonize(designColor, sourceColor)` — o `Blend.harmonize` em HCT da spec, um deslocamento de matiz limitado a ≤15° — o substituiu na `1.6.0`. | Color / custom & extended colors |
| 1.4 ✅ `1.6.0` | **Suporte a cores estendidas**: `M3ExtendedColor` (os quatro papéis da spec nas paradas de tom fixas por brilho, com uma factory `.harmonized`), levado pelo tema por `M3ExtendedColors`, uma `ThemeExtension`. | Color / extended colors |
| 1.5 🔭 | Cor dinâmica de plataforma (extração do wallpaper no Android 12+) permanece **fora de escopo** — esse é o trabalho do `dynamic_color`; documentar a integração em vez de encapsulá-la. | — |

> **Decisão registrada:** `M3ColorSchemes` deliberadamente **encapsula** o
> `ColorScheme.fromSeed` do Flutter em vez de reimplementar o pipeline do Material. O
> SDK já roda o `material_color_utilities` de ponta a ponta e é mantido em dia com a
> spec, então um segundo pipeline aqui só divergiria dele. A contribuição do pacote é
> o contrato tipado — um token de variante e um token de contraste no lugar de um
> `double` que aceita `2.7` em silêncio — não um segundo pipeline.

## Fase 2 — Sistema de física de movimento — ✅ lançada na `1.6.0`

Spec: https://m3.material.io/styles/motion — o M3 Expressive tornou os **springs** o
modelo primário de movimento ao lado dos pares duração+easing. O pacote tinha o
sistema clássico (`M3MotionDuration`, `M3MotionCurve`, `M3Motion`) e nada baseado em
física.

| # | Item | Notas |
| :- | :--- | :--- |
| 2.1 ✅ `1.6.0` | **`M3ESpring`** — os doze tokens publicados como um enum composto carregando `damping` e `stiffness`, com `description` → `SpringDescription` e `simulation(start:, end:, velocity:)` → `SpringSimulation`. Valores no [[maps/Token Map\|Mapa de Tokens]]. | Springs espaciais movem coisas; springs de efeito fazem fade/tint |
| 2.2 ✅ `1.6.0` | **`M3MotionScheme`** (`standard`/`expressive`) selecionando por intenção via `spatial(speed)`, `effects(speed)`, `spring(kind, speed)`, `springs`, com **`M3MotionSpeed`** (slow/standard/fast) e **`M3MotionSpringKind`** (spatial/effects) como seletores acompanhantes. | Espelho de `M3Motion.durationFor/curveFor` |
| 2.3 🔭 | **Presets de padrões de transição** construídos sobre os tokens: container transform, shared axis (x/y/z), fade through, fade — como `PageTransitionsBuilder`s / configurações de `AnimatedSwitcher`. | Motion / transitions |
| 2.4 🔭 | Integração com `M3Accessibility.shouldReduceMotion`: todo preset de movimento ganha um fallback de movimento reduzido (duração mais curta, sem bounce). | Acessibilidade × Movimento |

> **Decisões registradas:** os dois schemes entregam os *mesmos* springs de efeito
> (damping 1.0 com stiffness 800/1600/3800) — expressão pertence ao movimento, não à
> cor, e um teste garante isso. Dois efeitos colaterais da fase merecem memória: o
> `analysis_options.yaml` excluía `lib/src/m3e/**` desde que o módulo nasceu, então um
> terço do pacote nunca foi lintado — a exclusão sumiu; e foi exatamente esse ponto
> cego que deixou `M3EPoint.angleDegrees` calculando `angleRadians * pi / 180`, o
> fator de graus-para-radianos aplicado a um valor que já estava em radianos.
> Corrigido, com teste de regressão.

## Fase 3 — Conclusão da tipografia — ✅ lançada na `1.6.0`

Spec: https://m3.material.io/styles/typography — 15 estilos de base ✅ (`M3TypeScale`).

| # | Item | Notas |
| :- | :--- | :--- |
| 3.1 ✅ `1.6.0` | **`M3EmphasizedTypeScale`** — os 15 papéis um passo de peso acima, cada um mantendo o tamanho e a altura de linha da base, de modo que a troca nunca reflui o layout. `M3EmphasizedTypeScale.of(style)` mapeia um estilo de base para seu equivalente e devolve qualquer outra coisa inalterada. `M3TypeScale.values` chegou junto, alinhado por índice. | Tipografia expressiva |
| 3.2 🔭 | **Orientação sobre eixos de fontes variáveis**: documentar o uso de `wght`/`GRAD`/`wdth`/`ROND` com a Roboto Flex; um helper `M3FontAxes` apenas se conseguir se manter fiel à spec em Flutter puro. | Typography / fonts |

> **Fato da spec registrado:** `titleSmall` e `labelLarge` são metricamente idênticos
> (14sp / altura de linha 20 / tracking 0.1 / peso 500), então os 15 papéis colapsam
> em 14 valores distintos de `TextStyle`. Isso faz de `of()` uma busca **por valor, não
> por papel** — inofensivo, porque as formas enfatizadas do par também são idênticas,
> mas agora garantido por teste e documentado em vez de descoberto por quem esbarrar
> nele depois.

## Fase 4 — Tokens de forma e de componentes — ✅ lançada na `1.6.0`

Spec: https://m3.material.io/styles/shape + as tabelas de tokens por componente.

| # | Item | Notas |
| :- | :--- | :--- |
| 4.1 ✅ `1.6.0` | **`M3EShapeBorder`** — um `OutlinedBorder` em volta de qualquer `M3ERoundedPolygon`, para que a biblioteca de 35 formas se encaixe em `Card(shape:)`, `Material(shape:)`, `ShapeDecoration`, e recorte o ripple de um `InkWell`. O polígono é ajustado ao rect do layout pelos seus próprios bounds. | Biblioteca de formas do Expressive |
| 4.2 ✅ `1.6.0` | **O morph vem de graça**, e então **`M3EShapeMorph`** por cima: `lerpFrom`/`lerpTo` rodam o algoritmo `M3EMorph` de verdade em vez de fazer crossfade de dois contornos, então *qualquer* animação implícita que interpole a forma faz morph. `M3EShapeMorph` é o wrapper para quando a forma é a única coisa animando. | Morphing de formas |
| 4.3 ✅ `1.6.0` | **Camada de tokens de componente**: `M3ButtonHeights` (as cinco classes de tamanho do Expressive), `M3FabSizes`, `M3AppBarHeights`, `M3NavigationSizes`, `M3ListItemHeights` — todos `M3SpacingValue` tipados, todos verificados contra a grade de 4dp. Contrato apenas, *nenhuma implementação de widget*. | Components / specs |
| 4.4 ✅ `1.6.0` | Decidido e documentado na própria camada de tokens de componente: este pacote **não entrega componentes M3** (botões, menus, toolbars). *Widgets* do Expressive são a única exceção (`M3ELoadingIndicator` hoje) porque o Flutter ainda não os fornece; cada um é removido se/quando o Flutter lançar o de verdade (acompanhar flutter/flutter#168813). | Limite de escopo |

> **Ressalva registrada:** `M3ButtonHeights.extraSmall` (32dp) e `.small` (40dp) são
> alturas **visuais** abaixo do mínimo de toque de 48dp em mobile. Isso é a spec — um
> controle nessas alturas precisa expandir a *área de toque*, não a caixa (os botões
> do próprio Flutter fazem isso com `MaterialTapTargetSize.padded`). Está no doc
> comment e garantido por teste, para ninguém "corrigir" os números.
>
> Os frames intermediários do morph são ajustados à *união* dos bounds dos dois
> extremos, e não aos bounds de cada frame, o que faria a forma respirar enquanto o
> morph roda; um teste fixa isso. Os extremos voltam a ser borders comuns, para que
> uma animação terminada pare de pagar o setup do morph a cada paint.

## Fase 5 — Layouts adaptativos & canônicos — ✅ lançada na `1.6.0`

Spec: https://m3.material.io/foundations/layout — as classes de janela já estavam ✅;
os panes e os três layouts canônicos chegaram aqui.

| # | Item | Notas |
| :- | :--- | :--- |
| 5.1 ✅ `1.6.0` | **Scaffolds de layouts canônicos**: `M3ListDetailLayout` (lista + detalhe, `onNavigateBack`, `placeholder`), `M3SupportingPaneLayout` (`primary` + `supporting`, `supportingFirst`), `M3FeedLayout` (`itemColumns` por classe de janela, gutter e margem de página derivados da classe) — composições finas sobre as primitivas responsivas existentes. | Layout / canonical layouts |
| 5.2 ✅ `1.6.0` | **Modelo de panes**: `M3PaneRole` (primary/secondary), `M3PaneDisplayMode` (single/dual) e `M3CanonicalLayout` — `displayModeFor(size)`, `displayModeOf(context)`, `paneWidthFor(role, size)`. O secondary é fixo em `M3LayoutWidths.pane` (360dp); o primary é `unbounded` e fica com o que sobra. | Layout / panes |
| 5.3 ✅ `1.6.0` | `M3ResponsiveNavigation.getRailWidth` retorna um `M3SpacingValue` vindo de `M3NavigationSizes` em vez dos `80.0`/`256.0` embutidos — fechado antes da hora, porque a camada de tokens comp chegou na Fase 4. A largura estendida de 256dp foi verificada contra o default de `NavigationRail.minExtendedWidth` do Flutter, não tirada de memória. | |

> **Decisão registrada:** dois panes exigem **expanded (840dp) ou mais largo**, não
> medium — em medium um pane de apoio de 360dp deixa o conteúdo primário mais estreito
> que um celular, então a divisão custa mais do que rende.
>
> Os três layouts colapsam **de formas diferentes** em compact, deliberadamente, e é
> justamente por isso que são três widgets nomeados em vez de um: o list-detail
> **substitui** a lista pelo detalhe (com `onNavigateBack` ligado a um `PopScope`, para
> que o gesto de voltar do sistema funcione); o supporting pane **empilha** o apoio
> abaixo do conteúdo primário; o feed **reflui** para menos colunas. Esconder conteúdo
> de apoio atrás da navegação é o bug comum aqui — ele faz parte da mesma tarefa, não é
> um destino, e o usuário que precisa navegar para longe para alcançá-lo perde o
> contexto da tarefa.

## Fase 6 — Widgets de componentes Expressive — ✅ fechada como decisão registrada (`1.6.0`)

A Fase 6 foi fechada **escrevendo a decisão, não escrevendo código**. Conforme a regra
de escopo 4.4, o pacote **não entrega componentes M3**: a biblioteca Material do
Flutter é dona deles, e duplicar um cria dívida de migração no dia em que o Flutter
mudar o seu. A única exceção é um widget do Expressive que falta no Flutter, e cada um
deles é um paliativo marcado, removido quando o Flutter lançar o de verdade. Isso agora
está declarado no README do pacote, em "What this package deliberately does not ship".

| # | Decisão |
| :- | :--- |
| 6.1 ✅ | `M3ELoadingIndicator` (lançado) — a exceção que confirma a regra; continuar acompanhando o nativo do Flutter e deletar este quando ele chegar. |
| 6.2 ✅ `1.6.0` | FAB/feedback de pressão baseados em `M3EShapeMorph`: **decidido — só na demo**, nunca na lib. Desbloqueados por 4.1–4.2; um FAB que faz morph é uma aplicação do shape border, não um componente que o pacote deva a alguém. |
| 6.3 ✅ `1.6.0` | Button groups / split button / FAB menu / toolbar: **decidido — espera deliberada** pelo flutter/flutter#168813. Não é uma questão em aberto rediscutida a cada release: a resposta é não até o Flutter lançar, e então a resposta é "use o do Flutter". |

## Contínuo — documentação & portões de qualidade

- A regra da tríade (README ↔ example ↔ demo) do `CLAUDE.md` se aplica a todo item de fase.
- A demo ganha uma página por nova família de tokens; a linha do Mapa de Cobertura só
  vira ✅ quando lib + testes + README + example + demo estiverem todos prontos.
- Testes de propriedade para toda nova escala (aderência à grade, ordenação,
  completude de `values`).
- Manter `test/readme_showcase_test.dart` compilando o showcase do README ao pé da letra.
- Crescimento da suíte ao longo das seis releases: **160 → 251 testes** (182 depois da
  Fase 0, 182→199 na Fase 2, 199→210 na Fase 3, 210→238 na Fase 4, 238→251 na Fase 5).

## Trem de releases — o que realmente foi lançado

| Release | Conteúdo |
| :--- | :--- |
| `1.6.0` | Fase 0 inteira (breaking; tabela de migração no changelog) |
| `1.6.0` | Fase 1 — 1.1–1.4 |
| `1.6.0` | Fase 2 — 2.1–2.2, mais a exclusão do `m3e` na análise e a correção de `angleDegrees` |
| `1.6.0` | Fase 3 — 3.1 |
| `1.6.0` | Fase 4 — 4.1–4.4, mais o 5.3 fechado antes da hora |
| `1.6.0` | Fase 5 — 5.1–5.2 (layouts canônicos + modelo de panes); Fase 6 fechada como decisão registrada; a lacuna de tríade dos tokens de componente deixada pela 1.6.0 fechada em `example/lib/main.dart` |
| depois | 1.5 (documentação), 2.3–2.4, 3.2 |

> Nota sobre SemVer: o plano permitia uma `1.6.0` breaking sob a exceção documentada
> de "sem adotantes". Ela não foi usada — a Fase 0 saiu como uma `1.6.0` de verdade,
> com tabela de migração completa, que é justamente o que a cláusula de escape da nota
> pedia.

Relacionado: [[Material Design 3]] · [[maps/Coverage Map|Mapa de Cobertura]] · [[maps/Token Map|Mapa de Tokens]]
