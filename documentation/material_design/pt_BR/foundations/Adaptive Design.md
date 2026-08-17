# Design Adaptativo

Spec: https://m3.material.io/foundations/layout/understanding-layout

## Classes de tamanho de janela

`M3Breakpoints`: `compact` 0 · `medium` 600 · `expanded` 840 · `large` 1200 ·
`extraLarge` 1600 (todos `M3BreakpointValue`, lista `values` incluída).

`M3ScreenSize` (enum seletor) é a API primária:

```dart
final size = M3ScreenSize.of(context); // or .fromWidth(width)
size.columns;      // 4 / 8 / 12
size.gutterWidth;  // s16 compact, s24 otherwise (M3SpacingValue)
size.pageMargin;   // M3Margins.* for the class
size.bodyWidth;    // null / null / 840 / 1040 / 1040
size.maxContentWidth; size.paneWidth; size.minWidth;
size.isAtLeast(M3ScreenSize.medium); size.isMobile; size.isTablet; size.isDesktop;
```

Escalas de apoio: `M3Margins` (16dp em compact, 24dp nas demais), `M3Spacers.pane`
(24dp), `M3LayoutWidths` (`body` 1040 · `pane` 360 · `ultraWide` 1920 · `unbounded`).

## Widgets responsivos (módulo adaptive)

| Widget | Uso |
| :--- | :--- |
| `M3ResponsiveBuilder` | reconstrói quando a classe de janela muda: `builder: (context, screenSize) => …` |
| `M3ResponsiveValue<T>` | escolhe um valor por classe com fallback para a mais próxima |
| `M3ResponsiveVisibility` | mostra/oculta por classe (`visibleOn: [...]`, `replacement:`) |
| `M3ResponsiveGrid` / `M3ResponsiveGridConfig` | grade de colunas da spec (4/8/12) com gutters/margens corretos por classe |
| `M3ResponsiveScaffold` | a navegação alterna bottom bar → rail → drawer |
| `M3AdaptiveScaffold` | mesma ideia, variante com slot de drawer |
| `M3ResponsiveNavigation` | a política subjacente: `getNavigationType`, `shouldExtendRail`, `getRailWidth({required extended})` → um `M3SpacingValue` de `M3NavigationSizes` (1.6.0; antes embutia `80.0`/`256.0`) |

## Estáticos de `M3Adaptive`

`responsiveLayout`, `responsiveValue<T>`, `adaptivePadding`/`adaptiveMargin`
(`M3Margins` corretos por classe), `adaptiveNavigation`, `adaptiveAppBar`,
`showAdaptiveDialog` (tela cheia em compact, `AlertDialog` nas demais),
`showAdaptiveSheet` (bottom sheet em compact, painel lateral de 320dp nas demais,
deslizando com `emphasizedDecelerate`/450ms), `adaptiveGrid` (1–5 colunas),
`adaptiveContainer`, `adaptiveButton` (48dp toque / 32dp mouse), `adaptiveFAB`,
`inputMethodType(context)` → `M3InputMethodType.touch|mouse` (prefixado na 1.6.0).

## Medidas de navegação (1.6.0)

`M3NavigationSizes` guarda o que os helpers responsivos embutiam: `barHeight` 80 ·
`railWidth` 80 · `extendedRailWidth` 256 · `drawerWidth` 360 · `indicatorHeight` 32,
todos `M3SpacingValue`.

```dart
final width = M3ResponsiveNavigation.getRailWidth(extended: true); // 256, tipado
```

A largura estendida de 256dp foi verificada contra o default do próprio
`NavigationRail.minExtendedWidth` do Flutter, então um rail customizado se alinha ao
nativo. O resto da camada de componentes: [[../styles/Shape|Forma]] e o
[[../maps/Token Map|Mapa de Tokens]].

## Layouts canônicos (1.6.0)

Spec: https://m3.material.io/foundations/layout/canonical-layouts/overview — três
layouts prontos, cada um colapsando **de um jeito diferente** quando só cabe um pane.
Essa diferença é o ponto: são três widgets nomeados, e não um, porque o comportamento
em compact é o que os distingue.

| Layout | De expanded para cima | Compact / medium |
| :--- | :--- | :--- |
| `M3ListDetailLayout` | lista (360dp) + detalhe lado a lado | o detalhe **substitui** a lista assim que algo é selecionado |
| `M3SupportingPaneLayout` | primary + supporting (360dp) | o apoio **empilha** abaixo do conteúdo primário |
| `M3FeedLayout` | 3 / 4 / 5 colunas | **reflui** para 1 (compact) ou 2 (medium) colunas |

```dart
// O detalhe substitui a lista no celular; o PopScope liga o gesto de voltar do sistema.
M3ListDetailLayout(
  list: MailList(onSelect: (id) => setState(() => _selected = id)),
  detail: _selected == null ? null : MailDetail(_selected!),
  placeholder: const Center(child: Text('Selecione uma mensagem')),
  onNavigateBack: () => setState(() => _selected = null),
);

// O apoio empilha abaixo — ele faz parte da mesma tarefa, não é um destino.
M3SupportingPaneLayout(primary: Editor(), supporting: PropertiesPanel());

// Colunas, gutters e margem de página vêm todos da classe de tamanho de janela.
M3FeedLayout(
  children: cards,
  itemColumns: const {M3ScreenSize.compact: 2}, // sobrescreve só esta classe
);
```

Esconder conteúdo de apoio atrás da navegação é o bug que estes nomes existem para
evitar. Uma seleção tem um detalhe para o qual você *navega*; um painel de filtros ou
um inspetor de propriedades não — mandar o usuário para longe para alcançá-lo custa a
ele o contexto em que estava trabalhando. Só o `M3ListDetailLayout` navega.

`M3CanonicalLayout` é a política compartilhada, exposta para layouts que o pacote não
entrega:

```dart
M3CanonicalLayout.displayModeOf(context);            // single | dual
M3CanonicalLayout.displayModeFor(M3ScreenSize.large); // dual
M3CanonicalLayout.paneWidthFor(M3PaneRole.secondary, size); // 360dp
```

Dois panes exigem **expanded (840dp) ou mais largo**, não medium: em medium um pane de
apoio de 360dp deixaria o conteúdo primário mais estreito que um celular. O
`M3PaneRole.secondary` é fixo em `M3LayoutWidths.pane` — conteúdo de apoio não deve
crescer só porque a janela cresceu — enquanto o `M3PaneRole.primary` é `unbounded` e
fica com o que sobra.

Relacionado: [[Foundations|Fundamentos]] · [[../maps/Token Map|Mapa de Tokens]]
