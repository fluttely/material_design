# Acessibilidade

Spec: https://m3.material.io/foundations/accessible-design

## `M3Accessibility` (módulo adaptive)

Constantes: `minTouchTargetMobile` 48dp · `minTouchTargetDesktop` 32dp ·
`recommendedTouchTarget` 56dp · `minContrastNormal` 4.5 · `minContrastLarge` 3.0 ·
`enhancedContrast` 7.0.

⚠️ Alvo de toque ≠ altura visual. `M3ButtonHeights.extraSmall` (32) e `.small` (40)
são alturas **visuais** da spec, abaixo do mínimo de 48dp em mobile; um controle
nessas alturas expande a área de toque, não a caixa
(`MaterialTapTargetSize.padded`) — [[../styles/Shape|Forma]].

Contraste também é uma preferência do usuário, não apenas uma verificação: construa o
scheme no nível que a plataforma reporta, com `M3ContrastLevels.of(context)` ou
`M3ColorSchemes.fromContext(context, seedColor: …)` — [[../styles/Color|Cor]].

Helpers:

```dart
M3Accessibility.minTouchTarget(context);            // platform-aware target size
M3Accessibility.meetsContrastRequirement(
  foreground: fg, background: bg, isLargeText: false, useEnhanced: false);
M3Accessibility.makeAccessible(color: c, background: bg); // nudges until it passes
M3Accessibility.isHighContrastMode(context);
M3Accessibility.shouldReduceMotion(context);
M3Accessibility.adaptiveDuration(context: context, normal: d); // honors reduce-motion
M3Accessibility.highContrastColorScheme(base: scheme, isDark: true);
M3Accessibility.highContrastTextTheme(textTheme);
```

`M3AccessibilityConfig` agrupa as necessidades do usuário (`highContrast`,
`reducedMotion`, `largeText`, `dyslexiaFriendly`, `textScaleFactor`) — construa com
`.fromContext(context)` e aplique com `applyToTheme(theme)`.

## Matemática de cores WCAG (módulo color)

`M3ColorUtils.calculateContrast` (WCAG 2.1, 1–21), `meetsWCAGAA` (≥4.5),
`meetsWCAGAAA` (≥7.0), `meetsLargeTextAA` (≥3.0),
`adjustForAccessibility(color, background, minContrast: 4.5)`, e no `ColorScheme`:
`colorScheme.isAccessible(fg, bg)`.

## Foco por teclado (módulo interaction)

`M3FocusRing` desenha o indicador oficial: anel de `M3FocusIndicator.thickness` (3dp)
em `M3FocusIndicator.offset` (3dp). O recuo de 6dp fica reservado **com ou sem
foco** — navegar por tab até um controle nunca o desloca. O anel observa o foco,
nunca o toma. A espessura de 3dp vive deliberadamente em `M3FocusIndicator`, não em
`M3BorderWidths`, para que não possa vazar para contornos de componentes.

## Texto (módulo typography)

`M3TextUtils.clampedScaler(context, maxScaleFactor: …)` — último recurso para
layouts que não conseguem flexionar; ele briga com a configuração do usuário, então
prefira layouts flexíveis.
`M3TextUtils.dyslexiaFriendly(style)` · `M3TextUtils.highContrast(style)`.

## Dívida da demo

A página de Acessibilidade da demo atualmente faz verificações de contraste e
exemplos de alvo de toque à mão, sem usar `M3Accessibility`/`M3AccessibilityConfig` —
ela precisa demonstrar a API do pacote que existe para provar
([[../maps/Coverage Map|Mapa de Cobertura]]).

Relacionado: [[Foundations|Fundamentos]] · [[Interaction States|Estados de Interação]] · [[../styles/Typography|Tipografia]]
