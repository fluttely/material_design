# Movimento

Spec: https://m3.material.io/styles/motion

## Durações

`M3MotionDuration extends Duration` (utilizável em qualquer lugar que aceite um
`Duration`): `short1–4` 50/100/150/200 · `medium1–4` 250/300/350/400 · `long1–4`
450/500/550/600 · `extraLong1–4` 700/800/900/1000 (ms).

## Curvas

`M3MotionCurve extends ThreePointCubic`: `emphasized`, `emphasizedDecelerate`,
`emphasizedAccelerate`, `standard`, `standardDecelerate`, `standardAccelerate`,
`linear` — os pontos de controle cúbicos oficiais, utilizáveis em qualquer lugar que
aceite uma `Curve`.

## `M3Motion` — enum composto de scheme

| Valor | duration | curve |
| :--- | :--- | :--- |
| `emphasized` | long2 500ms | emphasized |
| `emphasizedIncoming` | long1 450ms | emphasizedDecelerate |
| `emphasizedOutgoing` | short3 150ms | emphasizedAccelerate |
| `standard` | medium2 300ms | standard |
| `standardIncoming` | medium1 250ms | standardDecelerate |
| `standardOutgoing` | short4 200ms | standardAccelerate |
| `linear` | short3 150ms | linear |

Extras: `asTween(begin:, end:)`; aliases estáticos planos para contextos `const`
(`M3Motion.emphasizedDuration`, `M3Motion.emphasizedCurve`, … um par por valor);
seletores por intenção `M3Motion.durationFor(M3MotionDistance.long)` e
`M3Motion.curveFor(M3MotionType.incoming)` — ambos retornam tipos M3, nunca
`Duration`/`Curve` crus.

Seletores: `M3MotionDistance` (`short`/`medium`/`long`/`extraLong` →
short2/medium2/long2/extraLong2) · `M3MotionType`
(`incoming`/`outgoing`/`persistent`/`standard`).

## O sistema de física do Expressive (1.6.0) ⚗️

O M3 Expressive (2025) tornou os **springs** o modelo primário de movimento. Uma
duração anima um valor por um tempo fixo, não importa o que o usuário fez; um spring é
interrompível e sensível à velocidade, então um gesto entregue no meio do voo continua
em vez de recomeçar.

Selecione pelo scheme, não nomeando um token:

```dart
const scheme = M3MotionScheme.expressive; // escolha uma vez, no topo do app

controller.animateWith(
  scheme.spatial(M3MotionSpeed.fast).simulation(
        start: controller.value,
        end: 1,
        velocity: flingVelocity, // o motivo de usar um spring, para começo de conversa
      ),
);
```

`M3MotionScheme` (`standard` / `expressive`) resolve por intenção:
`spatial(speed)`, `effects(speed)`, `spring(kind, speed)` e `springs` (os seis).
Seletores: `M3MotionSpeed` (`slow`/`standard`/`fast`) e `M3MotionSpringKind`
(`spatial`/`effects`).

### `M3ESpring` — 12 tokens compostos

| Scheme | Tipo | slow | standard | fast |
| :--- | :--- | :--- | :--- | :--- |
| standard | spatial | 0.9 / 300 | 0.9 / 700 | 0.9 / 1400 |
| standard | effects | 1.0 / 800 | 1.0 / 1600 | 1.0 / 3800 |
| expressive | spatial | 0.8 / 200 | 0.8 / 380 | 0.6 / 800 |
| expressive | effects | 1.0 / 800 | 1.0 / 1600 | 1.0 / 3800 |

(damping / stiffness). Membros: `damping`, `stiffness`, `isBouncy`, `description` →
`SpringDescription`, `simulation(start:, end:, velocity:)` → `SpringSimulation`.

A separação importa: springs **spatial** movem coisas e podem passar do alvo; springs
**effects** mudam cor, opacidade e tint e são criticamente amortecidos, porque uma
forma que passa do alvo parece viva enquanto uma cor que passa do alvo parece bug. Os
dois schemes entregam os *mesmos* springs de efeito — expressão pertence ao movimento,
não à cor.

`expressiveSpatialFast` (damping 0.6) é o token mais saltitante que o Material publica.

## Ainda planejado

Presets de padrões de transição (container transform, shared axis, fade through) e
fallbacks de movimento reduzido via `M3Accessibility.shouldReduceMotion` —
[[../Roadmap|Roadmap 2.3–2.4]].

Relacionado: [[Styles|Estilos]] · [[../foundations/Interaction States|Estados de Interação]]
