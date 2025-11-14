# Material Design 3 - Documentação de Referência para Implementação Flutter

## 📋 Visão Geral do Projeto

### Objetivo

Criar um package Flutter chamado `material_design` que fornece todas as especificações, tokens e métricas do Material Design 3 (https://m3.material.io/), permitindo que desenvolvedores construam componentes customizados seguindo as diretrizes oficiais.

### Filosofia

- **Não fornece componentes prontos** (isso já existe em `material.dart`)
- **Fornece especificações e tokens** para criar componentes customizados
- **100% alinhado com Material Design 3** oficial
- **Segue padrões Flutter** e convenções da framework
- **Developer-friendly** com APIs intuitivas e type-safe

### Diferencial

```dart
// Em vez disso (material.dart):
ElevatedButton(onPressed: () {}, child: Text('Click'))

// Nossa lib permite isso:
CustomButton(
  padding: MaterialButtonSpec.padding,
  elevation: MaterialElevation.level1,
  shape: MaterialShape.medium,
  // ... desenvolver cria seu próprio componente
)
```

---

## 🏗️ Arquitetura do Material Design 3

### 1. Foundations (Fundações)

Base do sistema de design que define os princípios fundamentais.

#### 1.1 Design Tokens

- **Definição**: Valores nomeados que armazenam atributos de design
- **Categorias**: Reference tokens → System tokens → Component tokens
- **Implementação Flutter**: `ThemeExtension<T>` com valores const

#### 1.2 Adaptive Design

- **Window Size Classes**: Compact (0-599dp), Medium (600-839dp), Expanded (840dp+)
- **Canonical Layouts**: List-detail, Supporting pane, Feed
- **Implementação Flutter**: `MediaQuery`, `LayoutBuilder`, enums

#### 1.3 Accessibility

- **Touch Targets**: Mínimo 48x48dp
- **Contrast Ratios**: AA (4.5:1), AAA (7:1)
- **Implementação Flutter**: Semantic widgets, valores const

### 2. Styles (Estilos)

Decisões visuais aplicadas ao sistema.

#### 2.1 Color System

- **Esquema**:
  - Primary (P): P0, P10, P20... P100
  - Secondary (S): S0-S100
  - Tertiary (T): T0-T100
  - Neutral (N): N0-N100
  - Neutral Variant (NV): NV0-NV100
  - Error (E): E0-E100
- **Surfaces**: surface, surfaceVariant, surfaceContainerLowest até Highest
- **Implementação Flutter**: Classes com valores Color const

#### 2.2 Typography

- **Type Scale**:
  - Display: Large, Medium, Small
  - Headline: Large, Medium, Small
  - Title: Large, Medium, Small
  - Body: Large, Medium, Small
  - Label: Large, Medium, Small
- **Implementação Flutter**: Classes com TextStyle const

#### 2.3 Shape

- **Corner Families**: Rounded, Cut
- **Sizes**: None (0), Extra Small (4), Small (8), Medium (12), Large (16), Extra Large (28), Full
- **Implementação Flutter**: ShapeBorder, RoundedRectangleBorder

#### 2.4 Motion

- **Easing**: Standard (cubic-bezier), Emphasized, Decelerated, Accelerated
- **Duration**: Short (50-200ms), Medium (250-400ms), Long (450-700ms), Extra Long (>700ms)
- **Implementação Flutter**: Curves, Duration const

#### 2.5 Elevation

- **Levels**: 0, 1, 2, 3, 4, 5
- **Tonal Surface Tints**: Baseado no nível
- **Shadow Values**: Específicos por nível
- **Implementação Flutter**: BoxShadow lists, valores double

### 3. Components (Componentes)

Especificações detalhadas de cada componente UI.

#### 3.1 Actions

- **Common Buttons**: Elevated, Filled, Filled Tonal, Outlined, Text
- **FAB**: Small, Regular, Large, Extended
- **Icon Buttons**: Standard, Filled, Filled Tonal, Outlined
- **Segmented Buttons**: Single select, Multi-select

#### 3.2 Communication

- **Badges**: Small (6dp), Large (16dp)
- **Progress Indicators**: Linear, Circular
- **Snackbar**: Single line, Two lines, With action
- **Tooltips**: Plain, Rich

#### 3.3 Containment

- **Bottom Sheets**: Standard, Modal
- **Cards**: Elevated, Filled, Outlined
- **Carousel**: Hero, Multi-browse
- **Dialogs**: Basic, Full-screen
- **Dividers**: Full width, Inset, Middle inset
- **Lists**: One-line, Two-line, Three-line

#### 3.4 Navigation

- **App Bars**: Top (center, small, medium, large), Bottom
- **Navigation Bar**: 3-5 destinations
- **Navigation Drawer**: Modal, Standard, Dismissible
- **Navigation Rail**: 3-7 destinations
- **Tabs**: Primary, Secondary

#### 3.5 Selection

- **Checkbox**: Unchecked, Checked, Indeterminate
- **Chips**: Assist, Filter, Input, Suggestion
- **Date Pickers**: Modal, Docked
- **Menus**: Dropdown, Exposed dropdown
- **Radio Button**: Unselected, Selected
- **Sliders**: Continuous, Discrete
- **Switch**: Unselected, Selected
- **Time Pickers**: Dial, Input

#### 3.6 Text Inputs

- **Text Fields**: Filled, Outlined
- **Search**: Search bar, Search view

---

## 📐 Especificações Técnicas Detalhadas

### Color Specifications

#### Tonal Palettes

```
Primary: 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 95, 99, 100
Each tone = specific lightness value
Tone 40 = typically used for primary color in light theme
Tone 80 = typically used for primary color in dark theme
```

#### Surface Colors

```
Light Theme:
- surface: N99
- surfaceVariant: NV90
- surfaceContainerLowest: N100
- surfaceContainerLow: N96
- surfaceContainer: N94
- surfaceContainerHigh: N92
- surfaceContainerHighest: N90

Dark Theme:
- surface: N10
- surfaceVariant: NV30
- surfaceContainerLowest: N4
- surfaceContainerLow: N10
- surfaceContainer: N12
- surfaceContainerHigh: N17
- surfaceContainerHighest: N22
```

### Typography Specifications

#### Type Scale Values

```
Display Large: 57/64 (size/line-height)
Display Medium: 45/52
Display Small: 36/44
Headline Large: 32/40
Headline Medium: 28/36
Headline Small: 24/32
Title Large: 22/28
Title Medium: 16/24
Title Small: 14/20
Body Large: 16/24
Body Medium: 14/20
Body Small: 12/16
Label Large: 14/20
Label Medium: 12/16
Label Small: 11/16
```

### Spacing Specifications

#### Grid System

```
Base unit: 4dp
Standard spacings: 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 48, 56, 64, 72, 80
Touch target minimum: 48x48dp
Minimum spacing between targets: 8dp
```

#### Component Spacing

```
Icon-to-text: 8dp
List item padding: 16dp horizontal, 8dp vertical
Card padding: 16dp
Dialog padding: 24dp
Section spacing: 24-32dp
```

### Elevation Specifications

#### Shadow Values

```
Level 0: No shadow
Level 1: 0dp 1dp 2dp 0dp rgba(0,0,0,0.3), 0dp 1dp 3dp 1dp rgba(0,0,0,0.15)
Level 2: 0dp 1dp 2dp 0dp rgba(0,0,0,0.3), 0dp 2dp 6dp 2dp rgba(0,0,0,0.15)
Level 3: 0dp 1dp 3dp 0dp rgba(0,0,0,0.3), 0dp 4dp 8dp 3dp rgba(0,0,0,0.15)
Level 4: 0dp 2dp 3dp 0dp rgba(0,0,0,0.3), 0dp 6dp 10dp 4dp rgba(0,0,0,0.15)
Level 5: 0dp 4dp 4dp 0dp rgba(0,0,0,0.3), 0dp 8dp 12dp 6dp rgba(0,0,0,0.15)
```

#### Tonal Elevation (Dark Theme)

```
Level 0: 0% primary opacity
Level 1: 5% primary opacity
Level 2: 8% primary opacity
Level 3: 11% primary opacity
Level 4: 12% primary opacity
Level 5: 14% primary opacity
```

### Motion Specifications

#### Easing Curves

```
Standard: cubic-bezier(0.2, 0.0, 0, 1.0) - Most transitions
Emphasized: cubic-bezier(0.2, 0.0, 0, 1.0) - Important transitions
Decelerated: cubic-bezier(0.0, 0.0, 0, 1.0) - Incoming elements
Accelerated: cubic-bezier(0.3, 0.0, 1.0, 1.0) - Exiting elements
```

#### Duration Tokens

```
short1: 50ms
short2: 100ms
short3: 150ms
short4: 200ms
medium1: 250ms
medium2: 300ms
medium3: 350ms
medium4: 400ms
long1: 450ms
long2: 500ms
long3: 550ms
long4: 600ms
extraLong1: 700ms
extraLong2: 800ms
extraLong3: 900ms
extraLong4: 1000ms
```

### Component Specifications

#### Button Specifications

```
Common Buttons:
- Height: 40dp
- Min width: 64dp
- Horizontal padding: 24dp (with icon: 16dp left, 24dp right)
- Icon size: 18dp
- Icon-to-label spacing: 8dp
- Corner radius: 20dp (full)
- Text style: Label Large

FAB:
- Small: 40x40dp, icon 24dp
- Regular: 56x56dp, icon 24dp
- Large: 96x96dp, icon 36dp
- Extended: Height 56dp, padding 16dp
```

#### Card Specifications

```
Elevated Card:
- Elevation: Level 1
- Corner radius: 12dp
- Min height: No minimum
- Padding: User defined (typically 16dp)

Filled Card:
- Elevation: Level 0
- Background: surfaceVariant
- Corner radius: 12dp

Outlined Card:
- Elevation: Level 0
- Border: 1dp outline
- Corner radius: 12dp
```

#### Navigation Specifications

```
Navigation Bar:
- Height: 80dp
- Icon size: 24dp
- Active indicator: 64x32dp pill
- Destinations: 3-5

Navigation Rail:
- Width: 80dp (extended: 256dp)
- Icon size: 24dp
- Active indicator: 56x32dp (or 56x56dp)
- Destinations: 3-7

Navigation Drawer:
- Width: 360dp (max)
- Item height: 56dp
- Horizontal padding: 12dp
- Active indicator: Full width - 24dp
```

---

## 🛠️ Padrões de Implementação Flutter

### Estrutura de Classes

#### 1. Classes de Constantes (similar a Colors, Icons)

```dart
class MaterialColors {
  MaterialColors._();

  static const Color primary40 = Color(0xFF...);
  // ...
}
```

#### 2. Theme Extensions

```dart
@immutable
class ComponentSpec extends ThemeExtension<ComponentSpec> {
  final double padding;
  final double elevation;

  const ComponentSpec({...});

  @override
  ComponentSpec copyWith({...}) {...}

  @override
  ComponentSpec lerp(covariant ComponentSpec? other, double t) {...}
}
```

#### 3. Enums para Variantes

```dart
enum ButtonVariant {
  elevated,
  filled,
  filledTonal,
  outlined,
  text,
}
```

#### 4. Data Classes para Especificações

```dart
@immutable
class ButtonSpec {
  final EdgeInsets padding;
  final double height;
  final double minWidth;
  final ShapeBorder shape;
  final TextStyle textStyle;

  const ButtonSpec({...});
}
```

### Convenções de Nomenclatura

#### Prefixos

- `Material` - para classes principais (MaterialColors, MaterialTypography)
- Sem prefixo - para specs de componentes (ButtonSpec, CardSpec)

#### Sufixos

- `Spec` - para especificações de componentes
- `Theme` - para theme extensions
- `Config` - para configurações
- `Utils` - para utilitários

### Organização de Arquivos

```
lib/
├── src/
│   ├── foundations/
│   │   ├── design_tokens.dart
│   │   ├── adaptive.dart
│   │   └── accessibility.dart
│   ├── styles/
│   │   ├── color/
│   │   │   ├── color_system.dart
│   │   │   ├── color_scheme.dart
│   │   │   └── tonal_palette.dart
│   │   ├── typography/
│   │   │   ├── type_scale.dart
│   │   │   └── text_theme.dart
│   │   ├── shape/
│   │   │   └── shape_system.dart
│   │   ├── motion/
│   │   │   ├── easing.dart
│   │   │   └── duration.dart
│   │   └── elevation/
│   │       └── elevation_system.dart
│   └── components/
│       ├── actions/
│       │   ├── button_spec.dart
│       │   ├── fab_spec.dart
│       │   └── icon_button_spec.dart
│       ├── communication/
│       │   ├── badge_spec.dart
│       │   ├── snackbar_spec.dart
│       │   └── tooltip_spec.dart
│       ├── containment/
│       │   ├── card_spec.dart
│       │   ├── dialog_spec.dart
│       │   └── bottom_sheet_spec.dart
│       ├── navigation/
│       │   ├── app_bar_spec.dart
│       │   ├── navigation_bar_spec.dart
│       │   └── navigation_rail_spec.dart
│       └── selection/
│           ├── checkbox_spec.dart
│           ├── chip_spec.dart
│           └── switch_spec.dart
└── material_design.dart  # Exports públicos
```

---

## 📝 Prompts para Desenvolvimento (Etapas)

### FASE 1: FOUNDATIONS (Base do Sistema)

#### Prompt 1.1 - Design Tokens Base

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Implemente o sistema de design tokens base do Material Design 3 seguindo a documentação de referência. Crie:

1. O arquivo lib/src/foundations/design_tokens.dart com:
   - Classe abstrata DesignToken<T>
   - Classes ReferenceToken, SystemToken, ComponentToken
   - Sistema de herança de tokens

2. Sistema de resolução de tokens que permite:
   - Tokens de referência (valores raw)
   - Tokens de sistema (derivados de referência)
   - Tokens de componente (específicos por componente)

Use padrões Flutter: classes imutáveis, const quando possível, factory constructors.
Siga a estrutura: Reference → System → Component tokens.
```

#### Prompt 1.2 - Adaptive Design System

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Implemente o sistema adaptativo do Material Design 3 em lib/src/foundations/adaptive.dart:

1. WindowSizeClass enum com valores corretos (compact: 0-599, medium: 600-839, expanded: 840+)
2. CanonicalLayout enum (listDetail, supportingPane, feed)
3. Classe AdaptiveConfig com:
   - Detecção automática de WindowSizeClass
   - Número de colunas por size class (4, 8, 12)
   - Margens e gutters adaptativos

4. Extension methods no BuildContext para acesso fácil
5. Widget AdaptiveBuilder para layouts responsivos

Garanta compatibilidade com MediaQuery e LayoutBuilder do Flutter.
```

#### Prompt 1.3 - Accessibility Foundation

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie o sistema de acessibilidade em lib/src/foundations/accessibility.dart:

1. TouchTargetSpec com tamanho mínimo 48x48dp
2. ContrastRatio enum e validadores
3. Classe AccessibilityConfig com:
   - Touch target sizes
   - Contrast requirements
   - Focus indicators specs

4. Utilities para validação de acessibilidade
5. Integration com Semantics do Flutter

Todos valores devem ser const e seguir WCAG guidelines.
```

### FASE 2: STYLES (Sistema Visual)

#### Prompt 2.1 - Color System Complete

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Implemente o sistema completo de cores M3 em lib/src/styles/color/:

1. color_system.dart:
   - TonalPalette class com todos os 13 tons (0, 10, 20...100)
   - CorePalette com primary, secondary, tertiary, neutral, error

2. color_scheme.dart:
   - MaterialColorScheme com todas as color roles
   - Superfícies (surface, surfaceVariant, containers)
   - On-colors para contraste

3. tonal_palette.dart:
   - Geração de paletas a partir de cor seed
   - Algoritmo de harmonização

4. dynamic_color.dart:
   - Sistema de cores dinâmicas
   - Material You integration

Use Color class do Flutter, valores hexadecimais const.
```

#### Prompt 2.2 - Typography System

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie o sistema tipográfico completo em lib/src/styles/typography/:

1. type_scale.dart com os 15 text styles:
   - Display (Large: 57/64, Medium: 45/52, Small: 36/44)
   - Headline (Large: 32/40, Medium: 28/36, Small: 24/32)
   - Title (Large: 22/28, Medium: 16/24, Small: 14/20)
   - Body (Large: 16/24, Medium: 14/20, Small: 12/16)
   - Label (Large: 14/20, Medium: 12/16, Small: 11/16)

2. text_theme.dart:
   - MaterialTextTheme class
   - Integração com TextStyle do Flutter
   - Font weight e letter spacing corretos

Todos TextStyles devem ser const com valores exatos do M3.
```

#### Prompt 2.3 - Shape System

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Implemente o sistema de formas em lib/src/styles/shape/shape_system.dart:

1. ShapeScale com todos os corner radius:
   - None: 0dp
   - ExtraSmall: 4dp
   - Small: 8dp
   - Medium: 12dp
   - Large: 16dp
   - ExtraLarge: 28dp
   - Full: circular

2. ShapeScheme para corner families (rounded, cut)
3. Factory methods para ShapeBorder do Flutter
4. Integração com RoundedRectangleBorder e ContinuousRectangleBorder

Forneça conversores para widgets Flutter.
```

#### Prompt 2.4 - Motion System

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie o sistema de movimento em lib/src/styles/motion/:

1. easing.dart:
   - MaterialEasing com cubic-bezier values
   - Standard, Emphasized, Decelerated, Accelerated
   - Conversão para Curves do Flutter

2. duration.dart:
   - MaterialDuration com todos os tokens
   - short (50-200ms), medium (250-400ms), long (450-700ms)
   - Duration objects const

Mapeie para Animation APIs do Flutter.
```

#### Prompt 2.5 - Elevation System

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Implemente elevação em lib/src/styles/elevation/elevation_system.dart:

1. MaterialElevation com levels 0-5
2. Shadow values específicos por level
3. Tonal elevation para dark theme
4. Overlay colors com opacidades corretas
5. BoxShadow lists prontas para uso

Valores devem corresponder exatamente ao M3.
```

### FASE 3: COMPONENT SPECIFICATIONS

#### Prompt 3.1 - Button Specifications

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie especificações completas de botões em lib/src/components/actions/:

1. button_spec.dart:
   - ButtonSpec base class
   - ElevatedButtonSpec (height: 40dp, padding: 24dp, radius: 20dp)
   - FilledButtonSpec
   - FilledTonalButtonSpec
   - OutlinedButtonSpec
   - TextButtonSpec

2. fab_spec.dart:
   - FABSize enum (small: 40dp, regular: 56dp, large: 96dp)
   - FABSpec com sizing e padding
   - ExtendedFABSpec

3. icon_button_spec.dart:
   - Sizes e toggle states
   - Filled, tonal, outlined variants

Inclua TODOS os valores de spacing, sizing, typography.
```

#### Prompt 3.2 - Card Specifications

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Implemente cards em lib/src/components/containment/card_spec.dart:

1. CardVariant enum (elevated, filled, outlined)
2. CardSpec com:
   - Elevation por variant
   - Corner radius: 12dp
   - Padding recommendations
   - Background colors

3. Helpers para diferentes card layouts
4. Integração com elevation e shape systems

Especifique comportamentos de estado (hover, pressed, dragged).
```

#### Prompt 3.3 - Navigation Components

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie specs de navegação em lib/src/components/navigation/:

1. app_bar_spec.dart:
   - TopAppBarSpec (center, small, medium, large)
   - Heights (64dp, scrolling behaviors)
   - Title positioning e scaling

2. navigation_bar_spec.dart:
   - Height: 80dp
   - Destination specs (3-5 items)
   - Active indicator: 64x32dp pill

3. navigation_rail_spec.dart:
   - Width: 80dp (extended: 256dp)
   - Destination layout
   - Alignment options

Inclua todas as métricas de spacing e sizing.
```

#### Prompt 3.4 - Input Components

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Implemente inputs em lib/src/components/selection/ e text_inputs/:

1. text_field_spec.dart:
   - FilledTextFieldSpec
   - OutlinedTextFieldSpec
   - Heights, padding, label behavior

2. checkbox_spec.dart, switch_spec.dart, radio_spec.dart:
   - Sizes (18dp checkbox, 20dp radio)
   - State colors e opacities
   - Touch target areas

3. chip_spec.dart:
   - Assist, Filter, Input, Suggestion variants
   - Height: 32dp
   - Icon sizes e spacing

Especifique TODOS os estados (enabled, disabled, hover, focused, pressed).
```

### FASE 4: INTEGRATION & UTILITIES

#### Prompt 4.1 - Theme Integration

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie o sistema de integração com Flutter themes:

1. lib/src/integration/theme_builder.dart:
   - MaterialThemeBuilder que gera ThemeData
   - Conversores de specs para theme components

2. lib/src/integration/theme_extensions.dart:
   - Todas as ThemeExtensions necessárias
   - Métodos copyWith e lerp

3. Context extensions para acesso fácil:
   - context.materialColors
   - context.materialTypography
   - context.buttonSpecs

Garanta type safety e imutabilidade.
```

#### Prompt 4.2 - Public API

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Organize a API pública em lib/material_design.dart:

1. Estruture os exports por categoria:
   - Foundations (tokens, adaptive, accessibility)
   - Styles (color, typography, shape, motion, elevation)
   - Components (organizados por categoria)
   - Utilities e helpers

2. Crie aliases convenientes
3. Documente cada export
4. Garanta que apenas APIs públicas sejam expostas

Use part/part of se necessário para organização interna.
```

### FASE 5: DOCUMENTATION WEBSITE

#### Prompt 5.1 - Documentation Site Structure

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie a estrutura do site de documentação em doc_site/:

1. Replique a estrutura do m3.material.io:
   - Home com overview
   - Foundations section
   - Styles section
   - Components section

2. Para cada página, crie:
   - Descrição do conceito
   - Especificações técnicas
   - Código exemplo usando a lib
   - Preview interativo

3. Use Flutter Web com navegação
4. Mantenha simples como docs.flutter.dev

Foque em clareza e exemplos práticos.
```

#### Prompt 5.2 - Interactive Examples

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie exemplos interativos para cada especificação:

1. Widget galleries mostrando variações
2. Playgrounds com parâmetros ajustáveis
3. Code snippets com syntax highlighting
4. Copy-to-clipboard functionality
5. Side-by-side spec vs implementation

Use packages como flutter_highlight para code display.
```

### FASE 6: EXAMPLES

#### Prompt 6.1 - Complete Example App

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie uma app exemplo completa em example/:

1. Showcase de TODOS os componentes
2. Organizados por categoria (como Material Gallery)
3. Demonstre:
   - Uso de specs para criar componentes custom
   - Adaptive layouts
   - Theming
   - Accessibility

4. Inclua casos de uso reais
5. Performance best practices

A app deve servir como referência completa.
```

#### Prompt 6.2 - Custom Component Examples

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie exemplos de componentes customizados usando a lib:

1. CustomButton usando ButtonSpec
2. CustomCard usando CardSpec
3. CustomNavigationBar usando NavigationBarSpec
4. CustomTextField usando TextFieldSpec
5. Componente completamente novo seguindo M3 specs

Mostre a flexibilidade da abordagem de specs.
```

### FASE 7: TESTING & QUALITY

#### Prompt 7.1 - Unit Tests

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Implemente testes unitários completos:

1. Teste todos os valores const contra specs oficiais
2. Teste conversões e utilities
3. Teste theme extensions (copyWith, lerp)
4. Valide adaptive breakpoints
5. Teste color generation algorithms

Use flutter_test, golden tests onde apropriado.
Coverage mínimo: 90%.
```

#### Prompt 7.2 - Integration Tests

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Crie testes de integração:

1. Teste integração com ThemeData
2. Teste adaptive layouts em diferentes screen sizes
3. Teste performance de theme switching
4. Valide acessibilidade com flutter_test accessibility checks

Garanta que a lib funciona em produção.
```

### FASE 8: PACKAGE PUBLISHING

#### Prompt 8.1 - Package Preparation

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Prepare o package para publicação:

1. pubspec.yaml completo:
   - Descrição clara
   - Topics relevantes
   - Homepage, repository, issue_tracker
   - Dependencies mínimas

2. README.md profissional:
   - Badges (pub version, popularity, likes)
   - Quick start
   - Features
   - Exemplos

3. CHANGELOG.md
4. LICENSE (BSD-3)
5. CONTRIBUTING.md

Siga as best practices do pub.dev.
```

#### Prompt 8.2 - Documentation

```
Utilize como referência, ou seja, leia todo o material presente no arquivo CLAUDE.md antes de qualquer coisa!

Ao final da resposta me envie um exemplo de utilização para eu anexar ao meu README, o exemplo deve estar 100% em inglês!

Finalize a documentação:

1. Documente TODAS as APIs públicas com dartdoc
2. Inclua exemplos nos doc comments
3. Crie tutoriais no README
4. API reference completa
5. Migration guide do material.dart

Use /// comments, {@tool snippet}, {@youtube}.
Score mínimo no pub.dev: 130/140 pontos.
```

---

## 🎯 Critérios de Sucesso

### Funcionalidade

- [ ] 100% das specs do M3 implementadas
- [ ] Compatível com Flutter stable
- [ ] Zero breaking changes após v1.0.0
- [ ] Performance otimizada (const everywhere)

### Qualidade

- [ ] Score pub.dev ≥ 130/140
- [ ] Test coverage ≥ 90%
- [ ] Zero warnings do analyzer
- [ ] Documentação completa

### Developer Experience

- [ ] API intuitiva e consistente
- [ ] IntelliSense/autocomplete friendly
- [ ] Exemplos para cada feature
- [ ] Migração fácil do material.dart

### Manutenibilidade

- [ ] Código modular e extensível
- [ ] Fácil atualização quando M3 mudar
- [ ] CI/CD configurado
- [ ] Versioning semântico

---

## 🚀 Cronograma Estimado

### Semana 1: Foundations & Styles

- Dias 1-2: Design tokens, adaptive, accessibility
- Dias 3-4: Color system completo
- Dias 5-6: Typography, shape, motion, elevation
- Dia 7: Integração e testes

### Semana 2: Components Specifications

- Dias 8-9: Action components (buttons, FABs)
- Dias 10-11: Containment (cards, dialogs, sheets)
- Dias 12-13: Navigation components
- Dia 14: Selection & input components

### Semana 3: Documentation & Examples

- Dias 15-16: Documentation website
- Dias 17-18: Example app completa
- Dias 19-20: Testes e refinamentos
- Dia 21: Package preparation e publishing

---

## 📚 Referências Essenciais

### Material Design 3 Official

- Specs: https://m3.material.io/
- Design Kit: https://www.figma.com/community/file/1035203688168086460
- Blog: https://material.io/blog

### Flutter Resources

- ThemeData: https://api.flutter.dev/flutter/material/ThemeData-class.html
- ThemeExtensions: https://api.flutter.dev/flutter/material/ThemeExtension-class.html
- Material Library: https://api.flutter.dev/flutter/material/material-library.html
- Package Publishing: https://dart.dev/tools/pub/publishing

### Padrões de Código Flutter

- Effective Dart: https://dart.dev/guides/language/effective-dart
- Flutter Style Guide: https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo
- Package Layout: https://dart.dev/tools/pub/package-layout

---

## 🔄 Fluxo de Desenvolvimento Detalhado

### Preparação Inicial

```bash
# Criar estrutura do projeto
flutter create --template=package material_design
cd material_design

# Estrutura de diretórios
mkdir -p lib/src/{foundations,styles,components,integration,utils}
mkdir -p lib/src/styles/{color,typography,shape,motion,elevation}
mkdir -p lib/src/components/{actions,communication,containment,navigation,selection,text_inputs}
mkdir -p example/lib/{screens,widgets}
mkdir -p test/{foundations,styles,components,integration}
mkdir -p doc_site/lib/{pages,widgets,data}
```

### Workflow de Desenvolvimento

#### 1. Para cada componente/sistema:

````dart
// 1. Criar especificação baseada no M3
class ComponentSpec {
  // Valores exatos do Material Design 3
  static const double height = 40.0; // dp
  static const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 24.0);
}

// 2. Criar theme extension quando necessário
@immutable
class ComponentTheme extends ThemeExtension<ComponentTheme> {
  // Implementação com copyWith e lerp
}

// 3. Criar builders/helpers
class ComponentBuilder {
  static Widget build(ComponentSpec spec) {
    // Lógica de construção
  }
}

// 4. Documentar com exemplos
/// Material Design 3 button specifications.
///
/// Example:
/// ```dart
/// Container(
///   height: ButtonSpec.height,
///   padding: ButtonSpec.padding,
///   child: Text('Button'),
/// )
/// ```
````

#### 2. Padrão de Testes:

```dart
// test/component_spec_test.dart
void main() {
  group('ComponentSpec', () {
    test('should have correct M3 values', () {
      expect(ComponentSpec.height, 40.0);
      expect(ComponentSpec.padding, EdgeInsets.symmetric(horizontal: 24.0));
    });

    test('should match Material Design 3 documentation', () {
      // Validar contra valores oficiais
    });
  });
}
```

---

## 📋 Checklists de Implementação

### Para Cada Sistema de Style

#### ✅ Color System Checklist

- [ ] Todas as 5 paletas tonais (primary, secondary, tertiary, neutral, error)
- [ ] 13 tons para cada paleta (0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 95, 99, 100)
- [ ] Surface colors (6 níveis de container)
- [ ] On-colors para contraste
- [ ] Algoritmo de geração de paleta tonal
- [ ] Harmonização de cores
- [ ] Suporte a Material You/Dynamic Color
- [ ] Testes de contraste WCAG AA/AAA

#### ✅ Typography Checklist

- [ ] 15 text styles (5 categorias × 3 tamanhos)
- [ ] Font sizes exatos em dp
- [ ] Line heights corretas
- [ ] Letter spacing apropriado
- [ ] Font weights (regular, medium)
- [ ] Integração com Google Fonts
- [ ] Responsive typography
- [ ] Testes de legibilidade

#### ✅ Shape Checklist

- [ ] 7 corner radius tokens
- [ ] Corner families (rounded, cut)
- [ ] Component-specific shapes
- [ ] Shape inheritance system
- [ ] Conversão para ShapeBorder
- [ ] Suporte a custom shapes
- [ ] Animated shape transitions

#### ✅ Motion Checklist

- [ ] 4 easing curves com cubic-bezier
- [ ] 16 duration tokens (4 por categoria)
- [ ] Conversão para Flutter Curves
- [ ] Stagger animations specs
- [ ] Page transitions specs
- [ ] Micro-interactions timing
- [ ] Performance guidelines

#### ✅ Elevation Checklist

- [ ] 6 níveis de elevação (0-5)
- [ ] Shadow values por nível
- [ ] Tonal elevation (dark theme)
- [ ] Surface tint colors
- [ ] Overlay percentages
- [ ] Estado hover/pressed elevations
- [ ] Animated elevation changes

### Para Cada Componente

#### ✅ Component Implementation Checklist

- [ ] Todas as variantes do componente
- [ ] Especificações de sizing
- [ ] Padding e margins
- [ ] Estados (enabled, disabled, hover, focused, pressed, selected)
- [ ] Cores por estado
- [ ] Animações e transições
- [ ] Touch targets accessibility
- [ ] Keyboard navigation specs
- [ ] Screen reader labels
- [ ] RTL support specs
- [ ] Responsive behavior
- [ ] Integration com outros sistemas (color, type, shape)

---

## 🎨 Exemplos de Implementação Detalhados

### Exemplo 1: Color System Implementation

```dart
// lib/src/styles/color/tonal_palette.dart

import 'package:flutter/material.dart';

/// A tonal palette consists of 13 tones of a single color.
@immutable
class TonalPalette {
  final Color tone0;   // Black
  final Color tone10;  // Darkest
  final Color tone20;
  final Color tone30;
  final Color tone40;  // Primary in light theme
  final Color tone50;  // Middle
  final Color tone60;
  final Color tone70;
  final Color tone80;  // Primary in dark theme
  final Color tone90;
  final Color tone95;
  final Color tone99;  // Nearly white
  final Color tone100; // White

  const TonalPalette({
    required this.tone0,
    required this.tone10,
    required this.tone20,
    required this.tone30,
    required this.tone40,
    required this.tone50,
    required this.tone60,
    required this.tone70,
    required this.tone80,
    required this.tone90,
    required this.tone95,
    required this.tone99,
    required this.tone100,
  });

  /// Generate a tonal palette from a seed color
  factory TonalPalette.fromSeed(Color seed) {
    // Implementation of Material You color algorithm
    // This is simplified - real implementation uses HCT color space
    final hsl = HSLColor.fromColor(seed);

    return TonalPalette(
      tone0: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.0).toColor(),
      tone10: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.10).toColor(),
      tone20: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.20).toColor(),
      tone30: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.30).toColor(),
      tone40: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.40).toColor(),
      tone50: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.50).toColor(),
      tone60: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.60).toColor(),
      tone70: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.70).toColor(),
      tone80: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.80).toColor(),
      tone90: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.90).toColor(),
      tone95: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.95).toColor(),
      tone99: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 0.99).toColor(),
      tone100: HSLColor.fromAHSL(1.0, hsl.hue, hsl.saturation, 1.0).toColor(),
    );
  }

  /// Get tone by value (0-100)
  Color? operator [](int tone) {
    switch (tone) {
      case 0: return tone0;
      case 10: return tone10;
      case 20: return tone20;
      case 30: return tone30;
      case 40: return tone40;
      case 50: return tone50;
      case 60: return tone60;
      case 70: return tone70;
      case 80: return tone80;
      case 90: return tone90;
      case 95: return tone95;
      case 99: return tone99;
      case 100: return tone100;
      default: return null;
    }
  }
}
```

### Exemplo 2: Button Specification Implementation

```dart
// lib/src/components/actions/button_spec.dart

import 'package:flutter/material.dart';
import '../../styles/styles.dart';

/// Material Design 3 button specifications.
@immutable
class ButtonSpec {
  final double height;
  final EdgeInsets padding;
  final double minWidth;
  final double iconSize;
  final double iconSpacing;
  final ShapeBorder shape;
  final TextStyle textStyle;
  final Duration animationDuration;
  final Curve animationCurve;

  const ButtonSpec({
    required this.height,
    required this.padding,
    required this.minWidth,
    required this.iconSize,
    required this.iconSpacing,
    required this.shape,
    required this.textStyle,
    required this.animationDuration,
    required this.animationCurve,
  });
}

/// Material Design 3 button specifications by variant.
class MaterialButtonSpec {
  MaterialButtonSpec._();

  /// Elevated button specification
  static const ButtonSpec elevated = ButtonSpec(
    height: 40.0,
    padding: EdgeInsets.symmetric(horizontal: 24.0),
    minWidth: 64.0,
    iconSize: 18.0,
    iconSpacing: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    textStyle: MaterialTypography.labelLarge,
    animationDuration: MaterialDuration.medium2,
    animationCurve: MaterialEasing.emphasized,
  );

  /// Filled button specification
  static const ButtonSpec filled = ButtonSpec(
    height: 40.0,
    padding: EdgeInsets.symmetric(horizontal: 24.0),
    minWidth: 64.0,
    iconSize: 18.0,
    iconSpacing: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    textStyle: MaterialTypography.labelLarge,
    animationDuration: MaterialDuration.medium2,
    animationCurve: MaterialEasing.emphasized,
  );

  /// Get padding with icon
  static EdgeInsets paddingWithIcon(ButtonSpec spec) {
    return EdgeInsets.only(
      left: 16.0,
      right: spec.padding.right,
    );
  }

  /// Calculate button width with text
  static double calculateWidth(String text, ButtonSpec spec) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: spec.textStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return math.max(
      spec.minWidth,
      textPainter.width + spec.padding.horizontal,
    );
  }
}

/// State layer opacities for buttons
class ButtonStateLayer {
  ButtonStateLayer._();

  static const double hover = 0.08;
  static const double focus = 0.12;
  static const double pressed = 0.12;
  static const double dragged = 0.16;
  static const double disabled = 0.12;
}
```

### Exemplo 3: Adaptive Layout Implementation

```dart
// lib/src/foundations/adaptive.dart

import 'package:flutter/material.dart';

/// Material Design 3 window size classes.
enum WindowSizeClass {
  /// 0-599dp width (phones in portrait)
  compact(minWidth: 0, maxWidth: 599),

  /// 600-839dp width (tablets, foldables)
  medium(minWidth: 600, maxWidth: 839),

  /// 840+dp width (tablets landscape, desktops)
  expanded(minWidth: 840, maxWidth: double.infinity);

  final double minWidth;
  final double maxWidth;

  const WindowSizeClass({
    required this.minWidth,
    required this.maxWidth,
  });

  /// Get window size class from width
  static WindowSizeClass fromWidth(double width) {
    if (width < 600) return WindowSizeClass.compact;
    if (width < 840) return WindowSizeClass.medium;
    return WindowSizeClass.expanded;
  }
}

/// Material Design 3 canonical layouts.
enum CanonicalLayout {
  /// Single pane layout
  singlePane,

  /// List-detail layout (list + detail side by side)
  listDetail,

  /// Supporting pane (main + supporting content)
  supportingPane,

  /// Feed layout (grid of cards)
  feed,
}

/// Adaptive layout configuration.
@immutable
class AdaptiveConfig {
  final WindowSizeClass sizeClass;
  final int columns;
  final double margin;
  final double gutter;
  final CanonicalLayout recommendedLayout;

  const AdaptiveConfig({
    required this.sizeClass,
    required this.columns,
    required this.margin,
    required this.gutter,
    required this.recommendedLayout,
  });

  /// Compact configuration
  factory AdaptiveConfig.compact() {
    return const AdaptiveConfig(
      sizeClass: WindowSizeClass.compact,
      columns: 4,
      margin: 16.0,
      gutter: 16.0,
      recommendedLayout: CanonicalLayout.singlePane,
    );
  }

  /// Medium configuration
  factory AdaptiveConfig.medium() {
    return const AdaptiveConfig(
      sizeClass: WindowSizeClass.medium,
      columns: 8,
      margin: 24.0,
      gutter: 24.0,
      recommendedLayout: CanonicalLayout.listDetail,
    );
  }

  /// Expanded configuration
  factory AdaptiveConfig.expanded() {
    return const AdaptiveConfig(
      sizeClass: WindowSizeClass.expanded,
      columns: 12,
      margin: 24.0,
      gutter: 24.0,
      recommendedLayout: CanonicalLayout.supportingPane,
    );
  }

  /// Create adaptive config from context
  factory AdaptiveConfig.fromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final sizeClass = WindowSizeClass.fromWidth(width);

    switch (sizeClass) {
      case WindowSizeClass.compact:
        return AdaptiveConfig.compact();
      case WindowSizeClass.medium:
        return AdaptiveConfig.medium();
      case WindowSizeClass.expanded:
        return AdaptiveConfig.expanded();
    }
  }
}

/// Extension for easy access to adaptive configuration.
extension AdaptiveContext on BuildContext {
  /// Get current window size class
  WindowSizeClass get windowSizeClass {
    final width = MediaQuery.of(this).size.width;
    return WindowSizeClass.fromWidth(width);
  }

  /// Get adaptive configuration
  AdaptiveConfig get adaptiveConfig {
    return AdaptiveConfig.fromContext(this);
  }

  /// Check if current layout is compact
  bool get isCompact => windowSizeClass == WindowSizeClass.compact;

  /// Check if current layout is medium
  bool get isMedium => windowSizeClass == WindowSizeClass.medium;

  /// Check if current layout is expanded
  bool get isExpanded => windowSizeClass == WindowSizeClass.expanded;
}

/// Adaptive layout builder widget.
class AdaptiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext, AdaptiveConfig) builder;

  const AdaptiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final config = AdaptiveConfig.fromContext(context);
        return builder(context, config);
      },
    );
  }
}
```

---

## 🧪 Estratégia de Testes

### Unit Tests Structure

```dart
// test/styles/color/tonal_palette_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('TonalPalette', () {
    test('should generate correct tones from seed', () {
      final palette = TonalPalette.fromSeed(Colors.blue);

      expect(palette.tone0, isNotNull);
      expect(palette.tone40, isNotNull);
      expect(palette.tone80, isNotNull);
      expect(palette.tone100, isNotNull);
    });

    test('should access tones by index', () {
      final palette = TonalPalette.fromSeed(Colors.blue);

      expect(palette[0], equals(palette.tone0));
      expect(palette[40], equals(palette.tone40));
      expect(palette[101], isNull); // Invalid tone
    });

    test('should match Material Design 3 specifications', () {
      // Validate against official M3 values
      // This would compare with known M3 color values
    });
  });
}
```

### Integration Tests

```dart
// test/integration/theme_integration_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  testWidgets('Theme integration works correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: [
            MaterialColorScheme.fromSeed(Colors.blue),
            MaterialTypographyTheme.standard(),
            MaterialShapeTheme.medium(),
          ],
        ),
        home: Builder(
          builder: (context) {
            final colors = context.materialColors;
            final typography = context.materialTypography;

            return Container(
              color: colors.surface,
              child: Text(
                'Test',
                style: typography.bodyLarge,
              ),
            );
          },
        ),
      ),
    );

    expect(find.text('Test'), findsOneWidget);
  });
}
```

---

## 📦 Package Structure Final

```
material_design/
├── .github/
│   └── workflows/
│       ├── ci.yml              # Continuous Integration
│       └── publish.yml         # Auto-publish on release
├── lib/
│   ├── src/                    # Implementation (private)
│   │   ├── foundations/
│   │   ├── styles/
│   │   ├── components/
│   │   ├── integration/
│   │   └── utils/
│   └── material_design.dart    # Public API
├── example/
│   ├── lib/
│   │   ├── main.dart          # Example app entry
│   │   ├── screens/           # Demo screens
│   │   └── widgets/           # Custom widgets examples
│   └── pubspec.yaml
├── doc_site/                   # Documentation website
│   ├── lib/
│   ├── web/
│   └── pubspec.yaml
├── test/
│   ├── foundations/
│   ├── styles/
│   ├── components/
│   └── integration/
├── tool/                       # Development tools
│   ├── generate_tokens.dart   # Token generation from M3
│   └── validate_specs.dart    # Validate against M3 docs
├── .gitignore
├── analysis_options.yaml       # Linter rules
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
├── pubspec.yaml
└── README.md
```

---

## 🚦 Próximos Passos Imediatos

### 1. Setup Inicial (Copie e execute):

```bash
# Criar o projeto
flutter create --template=package material_design
cd material_design

# Configurar Git
git init
git add .
git commit -m "Initial commit: Material Design 3 package setup"

# Criar estrutura de diretórios
mkdir -p lib/src/{foundations,styles/{color,typography,shape,motion,elevation},components/{actions,communication,containment,navigation,selection,text_inputs},integration,utils}
mkdir -p test/{foundations,styles,components,integration}
mkdir -p example/lib/{screens,widgets}
mkdir -p tool

# Criar arquivo principal
echo "library material_design;" > lib/material_design.dart
```

### 2. Primeiro Prompt para Começar:

```
Usando a documentação de referência fornecida, implemente a FASE 1.1 (Design Tokens Base) criando o sistema foundation completo. Comece com lib/src/foundations/design_tokens.dart implementando a hierarquia de tokens (Reference → System → Component). Use classes imutáveis, const constructors, e siga os padrões Flutter. Inclua documentação dartdoc completa e exemplos de uso.
```

### 3. Validação Contínua:

Após cada implementação, valide com:

- [ ] Valores correspondem ao M3 oficial?
- [ ] Segue padrões Flutter?
- [ ] Tem testes unitários?
- [ ] Documentação está completa?
- [ ] API é intuitiva?

---

## 🎯 Meta Final

Criar a biblioteca Material Design 3 mais completa e bem documentada para Flutter, que se torne a referência padrão para desenvolvedores que querem implementar Material Design 3 com precisão e flexibilidade.
