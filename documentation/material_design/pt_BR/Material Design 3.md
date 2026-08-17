# Material Design 3 — página inicial do vault

Este vault documenta o pacote Flutter `material_design`: um **contrato de design** que
expressa a spec do Material Design 3 (https://m3.material.io/) como tipos Dart. É
documentação de trabalho para mantenedores — a documentação voltada ao consumidor é o
README, o `example/` de arquivo único e a demo ao vivo
(https://fluttely.github.io/material_design/).

Tudo aqui descreve a **API 1.6.0**: extension types (`M3SpacingValue`) + classes de
constantes `abstract final` (`M3Spacings.s16`) + a válvula de escape `M3Contract`.
A API de enums pré-1.0 (`M3SpacingToken.space16.value`) não existe mais; se você
encontrar uma referência a ela neste vault, essa referência é um bug. O mesmo vale
para qualquer nome do Expressive sem prefixo (`Point`, `Morph`, `MaterialShapes`) ou
para `M3ColorUtils.harmonious` — todos foram renomeados ou removidos na 1.6.0.

## O contrato em um parágrafo

As APIs aceitam extension types M3 em vez de `double`/`int`, então valores fora da
escala falham em compilar. Tokens escalares são valores `static const` usados
diretamente — sem unwrap de `.value`, sem perda de `const`-ness. Enums ficam
reservados para tokens compostos (`M3Motion`, `M3Elevation`, `M3ESpring`) e seletores
(`M3ScreenSize`, `M3InteractionState`, `M3MotionScheme`, `M3SchemeVariant`). Como
extension types são apagados em runtime, desviar é possível — mas apenas através de um
único identificador greppável: `M3Contract.spacing(18)`.

O pacote agora modela as três camadas de tokens do M3: reference onde é obrigatório
(paletas HCT), system por toda parte e — desde a 1.6.0 — component, *apenas com
valores*. Ele continua não entregando componentes M3; a biblioteca Material do Flutter
é dona deles.

## Estrutura

### Fundamentos — [[foundations/Foundations|Fundamentos]]
- [[foundations/Design Tokens|Design Tokens]] — como a arquitetura de tokens realmente funciona
- [[foundations/Accessibility|Acessibilidade]] — contraste, alvos de toque, movimento reduzido
- [[foundations/Adaptive Design|Design Adaptativo]] — classes de tamanho de janela,
  widgets responsivos, layouts canônicos
- [[foundations/Interaction States|Estados de Interação]] — state layers, foco, densidade

### Estilos — [[styles/Styles|Estilos]]
- [[styles/Color|Cor]] — paletas tonais, schemes, contraste, custom colors ·
  [[styles/Typography|Tipografia]] — escalas de base e enfatizada ·
  [[styles/Shape|Forma]] — escala de cantos + as medidas de componente ·
  [[styles/Elevation|Elevação]] · [[styles/Motion|Movimento]] — durações, curvas, springs

### Expressive
- [[expressive/M3 Expressive|M3 Expressive]] — engine de formas, biblioteca de 35
  formas, `M3EShapeBorder`/`M3EShapeMorph`, loading indicator

### Mapas
- [[maps/Token Map|Mapa de Tokens]] — token da spec → símbolo do pacote, com valores exatos
- [[maps/Coverage Map|Mapa de Cobertura]] — área da spec → status em lib / testes / README / example / demo

### Implementação
- [[implementation/Implementation|Implementação]] — consumindo o pacote em um app

### Plano
- [[Roadmap]] — a análise de lacunas contra o m3.material.io e o plano de ação em fases

## Grafo de dependências dos módulos

```text
tokens ──┬─> shape ──┬─> interaction
         ├─> layout ─┤
         ├─> color ──┴─> adaptive
         └─> typography
motion  ─────────────────> interaction, adaptive
expressive (standalone)
```

## Convenções do vault

- `en_US/` é a fonte da verdade; `pt_BR/` a espelha arquivo por arquivo. Edite o
  inglês primeiro, depois porte a mudança.
- Wikilinks são relativos à pasta a partir da raiz do locale (`[[styles/Color|Cor]]`),
  então os dois locales nunca fazem link cruzado entre si.
- Os blocos de código devem compilar contra a `lib/` atual — quando uma API muda, o
  vault muda na mesma sessão de trabalho (ver `CLAUDE.md`).
- O vault é ignorado pelo git e pelo pub: notas de trabalho locais, nunca publicadas.
