### Fase 3: System Tokens (sys)

#### Prompt 3.1 - Color System Tokens

```

Crie a estrutura de cores do sistema em lib/src/tokens/sys/color/:

Arquivos necessários:

1. md_sys_color_light.dart - tokens de cor para tema claro
2. md_sys_color_dark.dart - tokens de cor para tema escuro
3. md_sys_color.dart - classe abstrata base

Fonte: https://m3.material.io/styles/color/the-color-system/tokens#reference-palette

Requisitos:

- Use referências de \_M3RefPalette (importe ../ref/md_ref_palette.dart)
- Nomenclatura exata: primary, on-primary, primary-container, etc.
- Classes privadas: \_M3SysColorLight, \_M3SysColorDark
- Implemente TODOS os color roles do MD3

```

#### Prompt 3.2 - Typography System Tokens

```

Implemente o sistema de tipografia em lib/src/tokens/sys/typography/:

Arquivo: md_sys_typescale.dart

Fonte: https://m3.material.io/styles/typography/type-scale-tokens

Requisitos:

1. Crie \_M3SysTypescale com todos os text styles do MD3:
   - display (large, medium, small)
   - headline (large, medium, small)
   - title (large, medium, small)
   - body (large, medium, small)
   - label (large, medium, small)
2. Use valores exatos de: font-size, line-height, letter-spacing, font-weight
3. Reference \_M3RefTypeface para font-family e weights
4. Cada style deve retornar um TextStyle do Flutter

```

#### Prompt 3.3 - Shape System Tokens

```

Implemente shapes em lib/src/tokens/sys/shape/md_sys_shape.dart

Fonte: https://m3.material.io/styles/shape/shape-scale-tokens

Requisitos:

1. Classe \_M3SysShape com corner radius tokens
2. Valores: none (0), extra-small (4), small (8), medium (12), large (16), extra-large (28), full (circular)
3. Implemente como doubles constantes
4. Adicione método para converter em RoundedRectangleBorder

```

### Fase 4: API Pública (Camada de Abstração Flutter)

#### Prompt 4.1 - Color Tokens Públicos

```

Crie a API pública para cores em lib/src/styles/color/:

Arquivos:

1. m3_color_scheme.dart - classe pública M3ColorScheme
2. m3_color_extensions.dart - extensions úteis

Requisitos:

- M3ColorScheme deve wrappear \_M3SysColorLight/\_M3SysColorDark
- Propriedades com nomes Flutter-friendly: primary, onPrimary, primaryContainer
- Factory constructors: M3ColorScheme.light() e M3ColorScheme.dark()
- Método copyWith para customização
- Método lerp para animações

```

#### Prompt 4.2 - Typography Tokens Públicos

```

Crie a API pública para tipografia em lib/src/styles/typography/:

Arquivo: m3_text_style_tokens.dart

Requisitos:

1. Enum M3TextStyleToken com valores amigáveis:
   - displayLarge, displayMedium, displaySmall
   - headlineLarge, headlineMedium, headlineSmall
   - etc.
2. Extension M3TextStyleTokenExtension com:
   - getter textStyle que retorna o TextStyle correspondente
   - método copyWith para customização
3. Classe M3Typography que agrupa todos os styles

```

### Fase 5: Sistema de Tema

#### Prompt 5.1 - Theme Data

```

Implemente o sistema de tema em lib/src/theme/:

Arquivos:

1. m3_theme_data.dart - classe principal do tema
2. m3_theme.dart - InheritedWidget para o tema

M3ThemeData deve conter:

- M3ColorScheme colorScheme
- M3Typography typography
- M3ShapeTheme shapes
- M3MotionTheme motion (prepare estrutura)
- Factory constructors para light/dark
- Método copyWith completo

```

#### Prompt 5.2 - Theme Extensions

```

Crie extensions em lib/src/extensions/theme_extensions.dart:

Requisitos:

1. Extension on BuildContext:
   - M3ThemeData get m3Theme
   - M3ColorScheme get m3Colors
   - M3Typography get m3Typography
   - M3TextStyleToken helpers (ex: context.m3DisplayLarge)
2. Tratamento de erros quando tema não está presente
3. Documentação com exemplos de uso

```

### Fase 6: Widgets Utilitários

#### Prompt 6.1 - Layout Widgets

```

Implemente widgets de layout em lib/src/widgets/layout/:

1. m3_gap.dart - M3Gap usando M3SpacingToken
2. m3_padding.dart - M3Padding forçando uso de tokens
3. m3_edge_insets.dart - M3EdgeInsets com tokens

Requisitos:

- Detectar automaticamente orientação para M3Gap
- Métodos estáticos como M3Padding.all(), symmetric(), only()
- Documentação completa com exemplos

```

### Fase 7: Component Tokens

#### Prompt 7.1 - Button Component Tokens

```

Implemente tokens de botão em lib/src/tokens/comp/button/:

Arquivos para cada tipo de botão MD3:

1. \_m3_comp_filled_button.dart
2. \_m3_comp_outlined_button.dart
3. \_m3_comp_text_button.dart
4. \_m3_comp_elevated_button.dart

Fonte: https://m3.material.io/components/buttons/specs

Requisitos:

- Tokens para: container, label-text, icon, state-layer
- Reference sys tokens apropriados
- Estados: enabled, disabled, hovered, focused, pressed

```

### Fase 8: Documentação e Exemplos

#### Prompt 8.1 - Exemplo Completo

```

Crie um exemplo completo em example/lib/main.dart que demonstre:

1. Setup do M3Theme
2. Uso de cores via context
3. Uso de tipografia
4. Uso de M3Gap e M3Padding
5. Customização de tema
6. Switching entre light/dark theme

O exemplo deve ser didático e bem comentado.

```

#### Prompt 8.2 - Documentação API

```

Atualize a documentação:

1. README.md completo com:
   - Instalação
   - Quick start
   - Exemplos de cada feature
   - Roadmap
2. Documentação inline em TODOS os arquivos públicos
3. Arquivo CHANGELOG.md
4. Arquivo CONTRIBUTING.md

```

### Fase 9: Testes

#### Prompt 9.1 - Testes Unitários

```

Crie testes em test/ para:

1. Valores corretos dos tokens (comparar com spec MD3)
2. Theme data e suas operações
3. Widgets utilitários
4. Color scheme interpolation
5. Typography customization

Cobertura mínima: 80%

```

## 📋 Template de Contexto para Cada Prompt

Para manter contexto entre sessões, use este template:

```

## Contexto do Projeto

Desenvolvendo biblioteca material_design para Flutter que implementa Material Design 3 oficial.

## Status Atual

- Fase: [X de 9]
- Última implementação: [descrever]
- Próximo passo: [descrever]

## Estrutura Atual

[cole a estrutura de arquivos atual]

## Convenções Estabelecidas

- Classes internas: prefixo \_ (ex: \_M3RefPalette)
- Classes públicas: prefixo M3 (ex: M3ColorScheme)
- Seguir nomenclatura exata do MD3 internamente
- API pública com nomes Flutter-friendly

## Tarefa Atual

[cole o prompt específico]

```

Esta sequência garante desenvolvimento incremental, mantível e sempre alinhado com a documentação oficial do Material Design 3!

```

```
