# M3 Expressive

Spec: https://m3.material.io/blog/building-with-m3-expressive (atualização de 2025).
Módulo do pacote: `lib/src/m3e/` (barrel `expressive` — standalone, sem dependência de tokens).

## Regra de escopo

Este pacote entrega **tokens e primitivas** do Expressive, e **widgets** do
Expressive **apenas enquanto o Flutter não tiver o equivalente nativo** (acompanhado
em flutter/flutter#168813). Cada widget provisório é removido quando o Flutter lança
o de verdade. Nunca duplique um componente que o Flutter já fornece.

## Nomenclatura e estabilidade (resolvidas na 1.6.0)

Tudo o que o módulo exporta carrega o prefixo `M3E`, que é o que mantém `Point`,
`Cubic` e `Morph` fora do seu namespace raiz — o pacote é reexportado por inteiro a
partir de `material_design.dart`. Qualquer coisa sem o prefixo é detalhe de
implementação e agora é privada à biblioteca: o módulo é uma única biblioteca montada
com arquivos `part`, então um underscore inicial esconde um nome do pacote inteiro
enquanto cada part continua podendo usá-lo.

O módulo inteiro é `@experimental`. O Material ainda está iterando o Expressive lá
em cima, então nomes, defaults e geometria de formas podem mudar em uma release minor.
Código que o usa precisa de `// ignore_for_file: experimental_member_use` ou de uma
opção equivalente no analyzer — um opt-in que o analyzer reporta, em vez de um nível
de estabilidade que o leitor precisa inferir.

## Engine de formas (port em Dart do `graphics-shapes` do AndroidX)

Primitivas: `M3EPoint`, `M3ECubic`, `M3ECornerRounding` (raio + suavização),
`M3EFeature` (`M3EEdgeFeature`, `M3ECornerFeature`), `M3ERoundedPolygon` (factories:
`fromVerticesNum`, `fromVertices`, `circle`, `rectangle`, `star`, `pill`, `pillStar`),
`M3EMorph(start, end)`.

Pontes para `Path`: as extensões `M3ERoundedPolygonToPath` e `M3EMorphToPath` —
`roundedPolygon.toPath()` e `morph.toPath(progress: t)`.

`M3EShapes` — a biblioteca oficial de 35 formas, todas normalizadas para o
espaço unitário: circle, square, slanted, arch, semiCircle, oval, pill, triangle,
arrow, fan, diamond, clamShell, pentagon, gem, sunny, verySunny,
cookie4/6/7/9/12Sided, clover4/8Leaf, burst, softBurst, boom, softBoom, flower,
puffy, puffyDiamond, ghostish, pixelCircle, pixelTriangle, bun, heart (+ `all`).

## Formas na árvore de widgets — `M3EShapeBorder` (1.6.0)

Até a 1.6.0 uma forma só conseguia produzir um `Path`, o que significava um
`CustomPainter` e nada de `Card`, `Material` ou ripple recortado. `M3EShapeBorder` é
um `OutlinedBorder` em volta de qualquer `M3ERoundedPolygon`, ajustado ao rect do
layout pelos seus próprios bounds:

```dart
Card(shape: M3EShapeBorder(M3EShapes.cookie7Sided));

Material(
  shape: M3EShapeBorder(M3EShapes.clover4Leaf),
  clipBehavior: Clip.antiAlias,
  child: InkWell(onTap: () {}, child: content), // o ripple também é recortado
);
```

**O morph vem de graça.** `lerpFrom`/`lerpTo` rodam o algoritmo `M3EMorph` de verdade
em vez de fazer crossfade de dois contornos, então qualquer animação implícita que
interpole a forma faz morph:

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 500),
  decoration: ShapeDecoration(
    color: color,
    shape: M3EShapeBorder(expanded ? M3EShapes.burst : M3EShapes.circle),
  ),
);
```

`M3EShapeMorph` é o wrapper para quando a forma é a única coisa animando
(`shape:`, `child:`, `color:`, `side:`, `duration:`, `curve:`, `clipBehavior:`).

Dois detalhes que vale conhecer: os frames intermediários do morph são ajustados à
**união** dos bounds dos dois extremos, e não aos bounds de cada frame — caso
contrário a forma respira enquanto o morph roda; e os extremos voltam a ser borders
comuns, para que uma animação terminada pare de pagar o setup do morph a cada paint.

## Loading indicator

`M3ELoadingIndicator` / `M3ELoadingIndicator.contained()` — indicador indeterminado
com morphing (container 48dp, indicador ativo 38dp). Opções: `indicatorPolygons`
(≥2), `activeIndicatorColor`, `containerColor`, `semanticsLabel`. Tematização:
`M3ELoadingIndicatorThemeData` + `M3ELoadingIndicatorTheme`.
Sequências de polígonos predefinidas: `indeterminateIndicatorPolygons`,
`determinateIndicatorPolygons`.

Pela spec: ele substitui a maioria dos usos do indicador de progresso circular
indeterminado para esperas abaixo de ~5s (ex.: pull-to-refresh).

## O Expressive em outras partes do pacote

Dois sistemas do Expressive vivem fora do `m3e`, porque estendem sistemas que o
pacote já tinha:

- **Springs** — `M3ESpring`, `M3MotionScheme`, `M3MotionSpeed`, `M3MotionSpringKind`
  na biblioteca de motion ([[../styles/Motion|Movimento]], 1.6.0).
- **Tipografia enfatizada** — `M3EmphasizedTypeScale` na biblioteca de tokens
  ([[../styles/Typography|Tipografia]], 1.6.0).

## Não vai sair — decidido, não pendente (1.6.0)

Os componentes do Expressive de 2025 — button groups, split button, FAB menu, toolbar
— são uma **espera deliberada** pelo Flutter e, desde a 1.6.0, isso é uma *decisão
registrada*, não uma questão em aberto rediscutida a cada release
([[../Roadmap|Roadmap Fase 6]], e o "What this package deliberately does not ship" do
README). O Flutter está ativamente entregando esses componentes
(flutter/flutter#168813); lançar os nossos entregaria a cada consumidor uma migração no
dia em que os do Flutter chegarem. A resposta é não até o Flutter lançar, e então a
resposta é "use o do Flutter".

Demos de FAB e de feedback de pressão baseados em `M3EShapeMorph` caem na mesma
decisão: pertencem à demo, nunca à lib — um FAB que faz morph é uma aplicação do
`M3EShapeBorder`, não um componente que o pacote deva a alguém.

> Nota histórica: até a 1.6.0 o `analysis_options.yaml` excluía `lib/src/m3e/**`,
> então este módulo nunca foi lintado. Foi assim que `M3EPoint.angleDegrees` saiu
> aplicando o fator de graus-para-radianos a um valor que já estava em radianos.
> Exclusão removida, bug corrigido, teste de regressão no lugar.

Relacionado: [[../styles/Shape|Forma]] · [[../Roadmap|Roadmap]]
