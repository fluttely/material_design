# Mapa de Cobertura — área da spec × superfície de entrega

Uma linha por área da spec do M3. Uma linha só é ✅ quando **lib + testes + README +
example + demo** a cobrem por completo (a regra da tríade no `CLAUDE.md` — lib e
testes estão implícitos em "lançado"). Data da auditoria: 2026-08-15 (v1.7.0). As
linhas já entregues carregam a versão.

| Área M3 | lib | README | example | página da demo | Lacunas / notas |
| :--- | :-: | :-: | :-: | :-: | :--- |
| Spacing / grade de layout | ✅ | ✅ | ✅ | ✅ Spacing | — |
| Escala de forma | ✅ | ✅ | ✅ | ⚠️ Shape | a demo cita `M3Corners`/`M3Radius` em strings mas nunca renderiza a escala de cantos em si |
| Larguras de borda | ✅ | ✅ | ✅ | ⚠️ Border | a demo mostra apenas none/thin; adicionar thick/extraThick + construtores nomeados |
| Tipografia (15 de base) | ✅ | ✅ | ✅ | ✅ Typography | `M3TypeScale.values` adicionado na 1.6.0 |
| Tipografia (enfatizada) | ✅ 1.6.0 | ✅ | ✅ | ✅ Typography | os 15 pares mostrados com a prova numérica de que a troca não mexe no layout |
| Elevação | ✅ | ✅ | ✅ | ✅ Elevation | — |
| Cor: paletas tonais | ✅ | ✅ | ✅ | ✅ Tonal | `M3CorePalette` + `fromSeed` ainda fora da página Tonal |
| Cor: schemes/variantes/contraste | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | as nove variantes + os quatro níveis de contraste com razões medidas |
| Cor: harmonização | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | `harmonious` removido na 1.6.0; `harmonize` é o `Blend.harmonize` em HCT da spec |
| Cor: cores estendidas (custom) | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | `M3ExtendedColor(s)` como `ThemeExtension` |
| Opacidade / state layers | ✅ | ✅ | ✅ | ✅ Opacity + Interaction | — |
| Movimento (clássico) | ✅ | ✅ | ✅ | ⚠️ Motion | a demo usa apenas os aliases estáticos; valores do enum, escalas de duração/curva, `durationFor`/`curveFor` não são mostrados |
| Movimento (springs do Expressive) | ✅ 1.6.0 | ✅ | ✅ | ✅ Springs | tabela completa de tokens + demo de hand-off de velocidade |
| Estados de interação | ✅ | ✅ | ✅ | ✅ Interaction | — |
| Indicador de foco | ✅ | ✅ | ✅ | ✅ Interaction/A11y | — |
| Densidade visual | ✅ | ✅ | ✅ | ✅ Density | — |
| Classes de tamanho de janela | ✅ | ✅ | ✅ | ✅ Breakpoints | — |
| Widgets responsivos | ✅ | ✅ | ✅ | ✅ Responsive | página da demo adicionada na 1.0.1 |
| Helpers adaptativos (`M3Adaptive`) | ✅ | ⚠️ | ✅ | ✅ Adaptive | o README nomeia a família, mas não os estáticos individuais |
| Helpers de acessibilidade | ✅ | ✅ | ✅ | ✅ A11y | a página A11y chama `M3Accessibility` em vez de fazer tudo à mão (1.0.1) |
| Válvula de escape do contrato | ✅ | ✅ | ✅ | ✅ Utils | showcase de `M3Contract` adicionado na 1.0.1; `M3Contract.contrastLevel` entrou na 1.6.0 |
| Tamanhos de ícone | ✅ | ✅ | ✅ | ✅ Icons | — |
| Eixos de ícone (`wght`/`GRAD`/`FILL`/`opsz`) | ✅ 1.7.0 | ✅ | ✅ | ✅ Icons | `M3IconStyle` tipa um `IconTheme` inteiro; os eixos exigem a fonte variável |
| Z-index | ✅ | ✅ | ✅ | ✅ Z-Index | z-index é um extra pragmático, não um token da spec M3 |
| Expressive: biblioteca de formas | ✅ | ✅ | ✅ | ✅ Expressive | a prévia de morphing das 35 formas está habilitada (1.0.1); nomes prefixados `M3E*` (1.6.0) |
| Expressive: shape border / morph | ✅ 1.6.0 | ✅ | ✅ | ✅ Expressive | showcase de `M3EShapeBorder` + demo de morph; o `M3EShapeMorph` em si só é exercitado na demo |
| Expressive: loading indicator | ✅ | ✅ | ✅ | ✅ Expressive | overflow corrigido na 1.0.1 |
| Expressive: novos componentes (button groups, split button, FAB menu, toolbar) | ❌ | — | — | — | nunca sairá aqui — espera deliberada pelo Flutter, registrada como decisão na 1.6.0 (Roadmap 6.3) |
| Layouts canônicos / panes | ✅ 1.6.0 | ✅ 1.6.0 | ✅ 1.6.0 | ✅ 1.6.0 Layouts | os três layouts + `M3CanonicalLayout`/`M3PaneRole`/`M3PaneDisplayMode`; a página da demo roda os três ao vivo no tamanho de janela atual |
| Tokens de componente (camada comp) | ✅ 1.6.0 | ✅ | ✅ 1.6.0 | ✅ Component Tokens | lacuna pega por este mapa e fechada na 1.6.0: o `example/lib/main.dart` agora tem uma seção `8b. Component measurements`, que sinaliza as alturas abaixo do alvo de toque comparando com o `M3Accessibility.minTouchTargetMobile` de verdade, não com um 48 fixo no código |

Testes: **160 → 251** ao longo das releases 1.6.0–1.6.0.

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

Ainda em aberto:

- A demo continua lintando com `flutter_lints` enquanto o pacote usa `very_good_analysis`.
- A demo continua contornando partes do contrato que exibe (`BorderRadius.circular(…)`
  cru, alphas literais, tamanhos mágicos) — ela deveria modelar o princípio de "nada
  de primitivas cruas".
- Restam lacunas por página em Shape, Border, Motion e Tonal (ver a tabela acima).

Relacionado: [[Token Map|Mapa de Tokens]] · [[../Roadmap|Roadmap]]
