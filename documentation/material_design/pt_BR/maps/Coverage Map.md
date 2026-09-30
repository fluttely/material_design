# Mapa de Cobertura — área da spec × superfície de entrega

Uma linha por área da spec do M3. Uma linha só é ✅ quando **lib + testes + README +
example + demo** a cobrem por completo (a regra da tríade no `CLAUDE.md` — lib e
testes estão implícitos em "lançado"). Data da auditoria: 2026-09-29 (v1.8.1 mais o `Unreleased`). As
linhas já entregues carregam a versão; `Unreleased` marca o que ainda não está no pub.dev. Toda página da demo tem uma metade Code desde a
1.8.0; a coluna conta as duas.

| Área M3 | lib | README | example | página da demo | Lacunas / notas |
| :--- | :-: | :-: | :-: | :-: | :--- |
| Spacing / grade de layout | ✅ | ✅ | ✅ | ✅ Spacing | — |
| Escala de forma | ✅ | ✅ | ✅ | ✅ Shape | os dez níveis, incluindo as adições de 2025 `largeIncreased` 20 / `extraLargeIncreased` 32 / `extraExtraLarge` 48; cada um mostra seu raio de `M3Corners`, lido do token (Unreleased) |
| Larguras de borda | ✅ | ✅ | ✅ | ✅ Border | as quatro larguras mais `M3Border.all`/`.fromBorderSide` (fechado pela 1.8.0) |
| Tipografia (15 de base) | ✅ | ✅ | ✅ | ✅ Typography | `M3TypeScale.values` adicionado na 1.6.0 |
| Tipografia (enfatizada) | ✅ 1.6.0 | ✅ | ✅ | ✅ Typography | os 15 pares mostrados com a prova numérica de que a troca não mexe no layout |
| Tipografia: fontes variáveis (`wght`) | ✅ Unreleased | ✅ | ✅ | ✅ Typography (Code) | `withWeightAxis` / `textThemeWithWeightAxis`; só o peso tem valor na spec — `GRAD`/`wdth`/`ROND`/`opsz` documentados, não codificados (Roadmap 3.2). Só na página de código: o demo roda no Flutter 3.41+, onde a página visual não mostraria diferença |
| Elevação | ✅ | ✅ | ✅ | ✅ Elevation | — |
| Cor: paletas tonais | ✅ | ✅ | ✅ | ✅ Tonal | `M3CorePalette.fromSeed` renderizado como suas seis paletas-chave (Unreleased) |
| Cor: schemes/variantes/contraste | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | as nove variantes + os quatro níveis de contraste com razões medidas |
| Cor: harmonização | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | `harmonious` removido na 1.6.0; `harmonize` é o `Blend.harmonize` em HCT da spec |
| Cor: cores estendidas (custom) | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | `M3ExtendedColor(s)` como `ThemeExtension` |
| Opacidade / state layers | ✅ | ✅ | ✅ | ✅ Opacity + Interaction | — |
| Movimento (clássico) | ✅ | ✅ | ✅ | ✅ Motion | a escala completa de durações a partir de `M3MotionDuration.values`, e o que `durationFor`/`curveFor` resolvem (Unreleased) |
| Movimento (springs do Expressive) | ✅ 1.6.0 | ✅ | ✅ | ✅ Springs | tabela completa de tokens + demo de hand-off de velocidade; o `reduced` de cada token (Unreleased) |
| Movimento: movimento reduzido | ✅ Unreleased | ✅ | ✅ | ✅ Springs + A11y | `M3ESpring.reduced` / `M3Accessibility.adaptiveSpring`; a spec muda o tipo de movimento, então não há helper de duração |
| Movimento: padrões de transição | — | ✅ Unreleased | — | — | decidido: o `package:animations` os entrega; o README mostra a ligação (Roadmap 7.4) |
| Estados de interação | ✅ | ✅ | ✅ | ✅ Interaction | — |
| Indicador de foco | ✅ | ✅ | ✅ | ✅ Interaction/A11y | — |
| Densidade visual | ✅ | ✅ | ✅ | ✅ Density | — |
| Classes de tamanho de janela | ✅ | ✅ | ✅ | ✅ Breakpoints | — |
| Widgets responsivos | ✅ | ✅ | ✅ | ✅ Responsive | página da demo adicionada na 1.0.1 |
| Helpers adaptativos (`M3Adaptive`) | ✅ | ✅ | ✅ | ✅ Adaptive | o README nomeia os estáticos principais (layout, padding, navegação, dialog, sheet, botão) |
| Helpers de acessibilidade | ✅ | ✅ | ✅ | ✅ A11y | a página A11y chama `M3Accessibility` em vez de fazer tudo à mão (1.0.1) |
| Válvula de escape do contrato | ✅ | ✅ | ✅ | ✅ Utils | showcase de `M3Contract` adicionado na 1.0.1; `M3Contract.contrastLevel` entrou na 1.6.0 |
| Tamanhos de ícone | ✅ | ✅ | ✅ | ✅ Icons | — |
| Eixos de ícone (`wght`/`GRAD`/`FILL`/`opsz`) | ✅ 1.7.0 | ✅ | ✅ | ✅ Icons | `M3IconStyle` tipa um `IconTheme` inteiro; os eixos exigem a fonte variável |
| Z-index | ✅ | ✅ | ✅ | ✅ Z-Index | z-index é um extra pragmático, não um token da spec M3 |
| Expressive: biblioteca de formas | ✅ | ✅ | ✅ | ✅ Expressive | a prévia de morphing das 35 formas está habilitada (1.0.1); nomes prefixados `M3E*` (1.6.0) |
| Expressive: shape border / morph | ✅ 1.6.0 | ✅ | ✅ | ✅ Expressive | showcase de `M3EShapeBorder` + demo de morph; o `M3EShapeMorph` em si só é exercitado na demo |
| Expressive: loading indicator | ✅ | ✅ | ✅ | ✅ Expressive | overflow corrigido na 1.0.1 |
| Expressive: novos componentes (button groups, split button, FAB menu, toolbar) | ❌ | — | — | — | nunca sairá aqui — são do Flutter, que agora os entrega no `material_ui` (Roadmap 6.3, 7.5) |
| Convivendo com o `material_ui` | — | ✅ Unreleased | — | — | o que compila sem mudança num app com `material_ui` e o que precisa de contorno, verificado contra a 1.5.0 (Roadmap 7.2) |
| Layouts canônicos / panes | ✅ 1.6.0 | ✅ 1.6.0 | ✅ 1.6.0 | ✅ 1.6.0 Layouts | os três layouts + `M3CanonicalLayout`/`M3PaneRole`/`M3PaneDisplayMode`; a página da demo roda os três ao vivo no tamanho de janela atual |
| Tokens de componente (camada comp) | ✅ 1.6.0 | ✅ | ✅ 1.6.0 | ✅ Component Tokens | lacuna pega por este mapa e fechada na 1.6.0: o `example/lib/main.dart` agora tem uma seção `8b. Component measurements`, que sinaliza as alturas abaixo do alvo de toque comparando com o `M3Accessibility.minTouchTargetMobile` de verdade, não com um 48 fixo no código |

Testes: **160 → 251** ao longo dos seis marcos que viraram a 1.6.0; **290** testes do pacote nesta auditoria (282 antes do Roadmap 3.2).

## Dívida específica da demo

A maior parte da dívida de demo da auditoria de 2026-08-13 foi quitada na **1.0.1**:

- ✅ Strings de título com `M3*Token` obsoletos removidas das oito páginas que
  anunciavam tipos enum já deletados.
- ✅ Código morto deletado: `enhanced_theme_page.dart`, o
  `m3_expressive/new_shapes/main.dart` totalmente comentado e os blocos comentados
  que referenciavam APIs removidas nas páginas de elevação, utils e expressive.
- ✅ `demo/README.md`, `web/index.html` e o piso do pubspec (Dart ≥3.6 /
  Flutter ≥3.27, igual ao do pacote) agora são de verdade; o `deploy.sh` quebrado
  sumiu — os deploys passam por `.github/workflows/deploy-demo.yml`.
- ✅ A página do Expressive foi reconstruída: os loading indicators não estouram mais
  o layout e a prévia de morphing das 35 formas está habilitada e tematizada com o
  color scheme ambiente.
- ✅ Páginas novas desde então: **Responsive**, **Accessibility** e **M3Contract**
  (1.0.1), **Schemes** (1.6.0), **Springs** (1.6.0), **Component Tokens** (1.6.0),
  **Layouts** (1.6.0, dentro de Foundations).

Fechado desde então:

- ✅ Primitivas cruas fora da demo (1.7.0) — os desvios restantes passam pelo
  `M3Contract`, à vista.
- ✅ A demo linta com `very_good_analysis`, como o pacote (Unreleased).
- ✅ Lacunas por página em Shape, Border, Motion e Tonal (1.8.0 em diante).

Nada nesta lista está em aberto.

Relacionado: [[Token Map|Mapa de Tokens]] · [[../Roadmap|Roadmap]]
