# Material Design

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)

Um kit de ferramentas abrangente para implementar o Material Design 3 no Flutter. Construa UIs bonitas e consistentes, alinhadas com as métricas e diretrizes oficiais, usando um poderoso conjunto de tokens de design e widgets auxiliares prontos para uso.

Este pacote encapsula as diretrizes do [Material 3](https://m3.material.io/) em tokens fáceis de usar, permitindo que você se concentre na lógica do seu aplicativo enquanto mantém a fidelidade visual.

## Funcionalidades

- 🎨 **Color**: Esquemas de cores claro e escuro completos (`ColorScheme`) gerados a partir de uma cor semente.
- ✒️ **Typography**: Escala de tipos completa do M3 com 15 estilos de texto (`TextStyle`).
- ✨ **Shape**: Tokens `ShapeBorder` para todos os níveis de raio de canto.
- 🔳 **Shadow**: Tokens `BoxShadow` para os 6 níveis de elevação do M3.
- 📏 **Spacing**: Escala de espaçamento granular para layouts consistentes.
- 📐 **Borders**: Tokens para larguras de borda padrão.
- 💨 **Motion**: Duração e curvas de easing para animações padrão e enfatizadas.
- 🔧 E mais: Tokens para **Breakpoint**, **Density**, **Opacity**, e **Icon Size**.

## Instalação

Adicione esta linha ao arquivo `pubspec.yaml` do seu projeto:

```yaml
dependencies:
  material_design: ^0.1.0
```

Em seguida, execute `flutter pub get`.

## Uso

Importe o pacote para começar a usar os tokens.

```dart
import 'package:material_design/material_design.dart';
```

### Configurando o Tema

Aplique facilmente os esquemas de cores do Material 3 ao seu `MaterialApp`.

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material 3 App',
      // Use o tema claro
      theme: ThemeData(
        colorScheme: MaterialColorSchemes.lightScheme,
        useMaterial3: true,
      ),
      // E o tema escuro
      darkTheme: ThemeData(
        colorScheme: MaterialColorSchemes.darkScheme,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
```

### Aplicando Tokens

Use os tokens em seus widgets para garantir consistência.

**Texto:**

```dart
Text(
  'Display Large',
  style: MaterialTypeScale.displayLarge,
)
```

**Formas e Sombras:**

```dart
Container(
  decoration: ShapeDecoration(
    color: Theme.of(context).colorScheme.surface,
    shape: MaterialShape.medium, // Raio de 12dp
    shadows: MaterialShadow.level2, // Sombra de elevação de 3dp
  ),
)
```

**Espaçamento:**

```dart
Padding(
  padding: const EdgeInsets.all(MaterialSpacing.space16), // Padding de 16dp
  child: Text('Hello, Material!'),
)
```

### Aplicativo de Exemplo

O aplicativo de exemplo incluído serve como um guia de estilo visual completo, demonstrando todos os tokens disponíveis neste pacote. Explore-o para ver os tokens em ação.
