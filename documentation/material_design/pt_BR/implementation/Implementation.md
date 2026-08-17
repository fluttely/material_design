# Implementação — consumindo o pacote

Como um app adota o contrato. A versão voltada ao consumidor disto é o README +
`example/lib/main.dart`; esta nota é o racional do mantenedor.

## Configuração do tema

```dart
MaterialApp(
  theme: M3TextTheme.applyToTheme(
    ThemeData(
      useMaterial3: true,
      colorScheme: M3ColorSchemes.fromSeed(seedColor: seed),
      visualDensity: M3VisualDensity.standard,
    ),
  ),
);
```

`applyToTheme` faz **merge** dos 15 estilos só-métricas sobre o text theme do tema —
nunca `copyWith(textTheme: M3TextTheme.toTextTheme())`, que descarta as cores
resolvidas por brilho (o bug da 1.0.0-dev.34).

## Caminho de adoção para um app existente

1. Adicione a dependência; nada quebra — todos os wrappers são subtipos drop-in do Flutter.
2. Substitua as primitivas mecanicamente: `EdgeInsets` → `M3EdgeInsets`, gaps de
   `SizedBox` → `M3Gap`, `BorderRadius.circular` → `M3BorderRadius`, listas de
   `BoxShadow` → `M3ElevationShadows`, `TextStyle(fontSize:)` → `M3TypeScale`,
   `Duration`/`Curve` ad hoc → `M3Motion`.
3. Valores que não cabem em um token: ou mova para o token mais próximo (geralmente
   o certo) ou torne o desvio explícito com `M3Contract.*`.
4. Guarde o contrato no CI:

```sh
# drift score — watch it fall during migration
grep -rn 'M3Contract\.' lib/ | wc -l
# zero-drift teams fail the build on any hit
! grep -rn 'M3Contract\.' lib/
```

## Padrões que valem copiar (todos compilados na suíte de testes / example)

- **Superfície interativa**: `M3FocusRing` > `M3StateLayer` > `AnimatedContainer` com
  `M3Motion.emphasized.duration/.curve` + `M3BoxDecoration` — o showcase do README.
- **Shell responsivo**: `M3ResponsiveScaffold` (ou `M3AdaptiveScaffold`) em vez de
  switches de breakpoint feitos à mão.
- **Valores por classe**: `M3ResponsiveValue<T>` / `M3Adaptive.responsiveValue<T>`
  em vez de cadeias de `if (width < 600)`.
- **Superfícies elevadas**: `colorScheme.surfaceAtElevation(M3Elevation.level2)` em
  vez de contas de tint manuais.

## O que não fazer

- Não desembrulhe tokens de volta para doubles para fazer aritmética e reinjetar
  (`s16 * 1.5` compila — o resultado é um `double` comum e não reentra nas APIs M3;
  isso é o contrato funcionando, não um bug).
- Não limite o escalonamento de texto globalmente; `M3TextUtils.clampedScaler` é
  por-`Text`, deliberado e último recurso.
- Não esqueça que o módulo expressive é `@experimental` — um arquivo que o toca
  precisa de `// ignore_for_file: experimental_member_use`. O antigo risco de colisão
  (`Point`, `lerp` vazando para o seu namespace) acabou: tudo é prefixado com `M3E*`
  desde a 1.6.0.

Relacionado: [[../Material Design 3|Página inicial do vault]] · [[../foundations/Design Tokens|Design Tokens]]
