# Design Tokens — a arquitetura do contrato

Spec: https://m3.material.io/foundations/design-tokens

O M3 define três camadas de tokens: **reference** (paletas brutas), **system**
(papéis semânticos e escalas) e **component** (valores por componente). Este pacote
implementa a **camada system como tipos Dart**; a camada reference existe apenas onde
é obrigatória (paletas tonais HCT alimentando a cor); a **camada component chegou na
1.6.0**, apenas com valores — ver abaixo.

> Nota histórica: um plano pré-1.0 de espelhar as pastas `ref/sys/comp` do M3 como
> classes `M3Ref*`/`M3Sys*`/`M3Comp*` foi abandonado. A arquitetura 1.0 abaixo é a
> que foi lançada. Os documentos que descrevem o plano antigo vivem na pasta de arquivo.

## As três formas que um token pode assumir

### 1. Tokens escalares — extension type + classe de constantes

Toda escala emparelha um `extension type` (o *valor*, singular) com uma
`abstract final class` (a *escala*, plural):

```dart
extension type const M3SpacingValue._(double dp) implements double {}

abstract final class M3Spacings {
  static const M3SpacingValue s16 = M3SpacingValue._(16);
  // …
  static const List<M3SpacingValue> values = [/* ascending */];
}
```

Como o extension type `implements double`, a constante passa direto para qualquer
API do Flutter — mas as nossas APIs exigem o extension type, então um `17.3` cru não
consegue entrar. O construtor é privado à biblioteca: as únicas formas de obter um
`M3SpacingValue` são as constantes e o `M3Contract`.

Os dez tipos de valor: `M3SpacingValue`, `M3CornerValue`, `M3BorderWidthValue`,
`M3OpacityValue`, `M3IconSizeValue`, `M3BreakpointValue`, `M3ElevationDpValue`,
`M3ZIndexValue`, `M3ToneValue` e `M3ContrastLevelValue` (1.6.0). Valores completos no
[[../maps/Token Map|Mapa de Tokens]]. Toda escala carrega uma lista `values` — as
cinco últimas retardatárias ganharam a sua na 1.6.0.

### 2. Tokens compostos — enums

`M3Motion` (duração + curva), `M3Elevation` (dp + sombras) e `M3ESpring`
(damping + stiffness, 1.6.0) permanecem enums: seus campos são sempre lidos juntos e
nunca desembrulhados para um único número. Eles mantêm `const`, `values` e `switch`
exaustivo.

### 3. Seletores — enums que nomeiam uma situação

`M3ScreenSize`, `M3InteractionState`, `M3MotionDistance`, `M3MotionType`,
`M3NavigationType`, `M3InputMethodType` e — desde as 1.6.0/1.6.0 — `M3SchemeVariant`,
`M3MotionScheme`, `M3MotionSpeed`, `M3MotionSpringKind`. Eles resolvem *para* tokens
(`M3InteractionState.hover.stateLayerOpacity`,
`M3MotionScheme.expressive.spatial(M3MotionSpeed.fast)`).

**A regra precisa: nenhum token que precise ser desembrulhado para ser usado.**

## A válvula de escape — `M3Contract`

Extension types são apagados em runtime; `17.3 as M3SpacingValue` compila e sempre
compilará. Em vez de fingir o contrário, todo desvio deliberado passa por um único
identificador:

```dart
M3EdgeInsets.all(M3Contract.spacing(18)) // off the 4dp grid, on purpose
```

Factories: `spacing`, `corner`, `borderWidth`, `opacity` (assert de 0–1), `iconSize`,
`breakpoint`, `elevationDp`, `zIndex`, `contrastLevel` (1.6.0). A conformidade é
mensurável:

```sh
grep -rn 'M3Contract\.' lib/ | wc -l
```

O `M3Contract` é para **consumidores**. O próprio pacote nunca o usa — um valor fora
da escala dentro de `lib/` é um bug, não um desvio.

## Tipos wrapper levam o contrato para dentro do Flutter

`M3EdgeInsets`/`M3Padding`/`M3Gap` (layout), `M3Radius`/`M3BorderRadius`/`M3Shape`/
`M3BorderSide`/`M3Border` (forma), `M3BoxDecoration`/`M3ShapeDecoration`
(decorações) — cada um estende o tipo do Flutter que substitui e restringe seus
parâmetros a tipos M3. Drop-in, `const`, custo zero em runtime.

## A camada component (1.6.0) — valores, não widgets

`M3ButtonHeights`, `M3FabSizes`, `M3AppBarHeights`, `M3NavigationSizes`,
`M3ListItemHeights`: as medidas por componente que a spec fixa, expressas nos tipos de
token já existentes (todos `M3SpacingValue`, todos verificados contra a grade de 4dp),
para que os valores de componente fiquem dentro do mesmo contrato que o resto.

Deliberadamente **apenas** valores. A biblioteca Material do Flutter é dona de
`FilledButton`, `NavigationBar` e companhia; duplicar um deles aqui criaria dívida de
migração para todo consumidor no dia em que o Flutter mudasse o original. O que o
pacote pode utilmente possuir são os números, para que um controle customizado caia
nas mesmas medidas do nativo ao lado.

## Adicionando uma nova escala (checklist)

1. `extension type const M3XValue._(repr) implements repr` na biblioteca de tokens.
2. `abstract final class M3Xs` com membros `static const` + lista `values`.
3. Factory `M3Contract.x(…)` se a escala for aberta.
4. Testes: valores da spec, ordenação, completude de `values`, aderência à grade de
   4dp quando aplicável.
5. Doc comments citando a página do m3.material.io e as unidades.
6. Tríade + atualização dos mapas (ver `CLAUDE.md`).

Relacionado: [[Foundations|Fundamentos]] · [[../maps/Token Map|Mapa de Tokens]] · [[../Roadmap|Roadmap]]
