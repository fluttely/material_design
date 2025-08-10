# Material Design 3 (2025) for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue)](https://flutter.dev)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

The fastest path to consistent Material Design UIs in Flutter. Build beautiful apps aligned with official metrics and guidelines using a powerful set of ready-to-use design tokens and helper widgets.

This package provides a comprehensive toolkit for implementing Material Design 3 in Flutter. It includes a complete design token system and utilities that align with the official Material Design 3 specification, making it easier to build beautiful and consistent user interfaces.

## 🚀 Features

- **Design Token System**: A complete implementation of the Material Design 3 token hierarchy, including reference, system, and component tokens.
- **Adaptive Design**: Utilities for creating adaptive layouts that respond to different screen sizes and platforms.
- **Material Design 3 Compliance**: Built to align with the official Material Design 3 guidelines.

## 📦 Getting Started

To use this package, add `material_design` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  material_design: ^0.31.0-dev
```

Then, import the library in your Dart code:

```dart
import 'package:material_design/material_design.dart';
```

## 🎨 Usage

### Design Tokens

The library provides a flexible system for defining and using design tokens.

```dart
// Create reference tokens
const primaryRef = ReferenceToken<Color>(
  Color(0xFF6750A4),
  'purple.40'
);

// Create system tokens
const primaryColor = SystemToken<Color>(
  Color(0xFF6750A4),
  'color.primary',
  referenceToken: primaryRef,
);

// Create component tokens
const buttonBackground = ComponentToken<Color>(
  Color(0xFF6750A4),
  'button.filled.background',
  systemToken: primaryColor,
  component: 'Button',
);
```

---

### How to Use `AdaptiveConfig`

Here is a basic example of how to use `AdaptiveConfig` within a Flutter widget. This `StatelessWidget` gets the screen dimensions and uses the configuration to display a different layout based on the current `WindowSizeClass`.

#### Example Code

```dart
import 'package.flutter/material.dart';
// Certifique-se de importar sua biblioteca. O caminho pode variar.
import 'package:your_project_name/material_adaptive.dart';

/// Uma tela que combina uma estrutura clara com lógica adaptativa avançada.
class BestResponsiveScreen extends StatelessWidget {
  const BestResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Obter a configuração adaptativa a partir do tamanho da tela.
    final Size screenSize = MediaQuery.of(context).size;
    final AdaptiveConfig config = AdaptiveConfig.fromDimensions(
      width: screenSize.width,
      height: screenSize.height,
    );

    // 2. Usar a estrutura limpa do 'switch' para lidar com os layouts.
    // Esta é a principal vantagem do segundo código: clareza e escalabilidade.
    switch (config.sizeClass) {
      case WindowSizeClass.compact:
        return _buildCompactLayout(config);
      case WindowSizeClass.medium:
        return _buildMediumLayout(config);
      case WindowSizeClass.expanded:
      case WindowSizeClass.large:
      case WindowSizeClass.extraLarge:
        // 3. Chamar um método de layout 'expanded' que agora possui a lógica
        // inteligente do primeiro código.
        return _buildSmartExpandedLayout(config);
    }
  }

  /// Layout para telas compactas: simples e direto.
  Widget _buildCompactLayout(AdaptiveConfig config) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compact Layout')),
      body: Center(
        child: Text('Painel único para celular\nLargura: ${config.width.toInt()}px'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
      ),
    );
  }

  /// Layout para telas médias: usa Navigation Rail para melhor uso do espaço.
  Widget _buildMediumLayout(AdaptiveConfig config) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medium Layout')),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: 0,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.article), label: Text('Feed')),
              NavigationRailDestination(icon: Icon(Icons.chat), label: Text('Chat')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: Text(
                'Layout de dois painéis (List-Detail)\nLargura: ${config.width.toInt()}px',
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// O "melhor dos dois mundos" para telas grandes.
  /// Usa a lógica detalhada do primeiro código dentro da estrutura limpa do segundo.
  Widget _buildSmartExpandedLayout(AdaptiveConfig config) {
    return Scaffold(
      body: Row(
        children: [
          // LÓGICA DO CÓDIGO 1: Escolhe dinamicamente entre Rail e Drawer.
          // Para telas 'Large' ou maiores, usa um Drawer permanente.
          // Para 'Expanded', pode usar um Rail para economizar espaço.
          if (AdaptiveUtils.shouldUsePermanentDrawer(config.sizeClass))
            NavigationDrawer(
              selectedIndex: 0,
              children: const [
                Padding(padding: EdgeInsets.all(28), child: Text('Header')),
                NavigationDrawerDestination(icon: Icon(Icons.article), label: Text('Feed')),
                NavigationDrawerDestination(icon: Icon(Icons.chat), label: Text('Chat')),
              ],
            )
          else
            NavigationRail(
              selectedIndex: 0,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.article), label: Text('Feed')),
                NavigationRailDestination(icon: Icon(Icons.chat), label: Text('Chat')),
              ],
            ),
          const VerticalDivider(thickness: 1, width: 1),

          // LÓGICA DO CÓDIGO 1: Centraliza e limita a largura do conteúdo principal
          // para melhor legibilidade em telas muito largas.
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: config.maxContentWidth),
                child: Container(
                  color: Colors.blue.shade50,
                  child: Center(
                    child: Text(
                      'Conteúdo Principal\n(Largura máxima: ${config.maxContentWidth.toInt()}px)',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // LÓGICA DO CÓDIGO 1: Adiciona um painel de apoio (terceiro painel)
          // apenas se houver espaço suficiente (telas Large/ExtraLarge).
          if (config.supportsThreePane) ...[
            const VerticalDivider(thickness: 1, width: 1),
            SizedBox(
              width: AdaptiveUtils.getSupportingPaneWidth(
                totalWidth: config.width,
                sizeClass: config.sizeClass,
              ),
              child: Container(
                color: Colors.green.shade50,
                child: const Center(child: Text('Painel de Apoio')),
              ),
            ),
          ]
        ],
      ),
    );
  }
}

// Stubs para os widgets de navegação para o código compilar.
// No seu projeto real, você usaria seus próprios widgets.
class NavigationDrawer extends StatelessWidget {
  final int selectedIndex;
  final List<Widget> children;
  const NavigationDrawer({super.key, required this.selectedIndex, required this.children});
  @override
  Widget build(BuildContext context) => SizedBox(width: 250, child: Column(children: children));
}
```

---

### Accessibility Tools for Flutter

A collection of widgets and utilities to simplify the implementation of accessibility features in Flutter applications. This library provides a centralized `AccessibilityProvider` to manage configurations like dynamic text scaling, high-contrast themes, and touch target sizing.

### Integrated usage example

```dart
class AccessibleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccessibilityProvider(
      config: AccessibilityConfig.fromPlatform(context),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: context.isHighContrast
              ? HighContrastTheme.createHighContrastScheme(ColorScheme.light())
              : ColorScheme.light(),
        ),
        home: AccessibleScreen(),
      ),
    );
  }
}

class AccessibleButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final config = context.accessibility;

    return AccessibleTouchTarget(
      minSize: config.touchTargetSize,
      semanticLabel: ScreenReaderUtils.buttonLabel(
        text: label,
        isEnabled: true,
      ),
      onTap: () {
        onTap();
        AccessibilityAnnouncer.announcePolite(
          context,
          '$label activated',
        );
      },
      child: AnimatedContainer(
        duration: config.getAnimationDuration(Duration(milliseconds: 200)),
        curve: config.getAnimationCurve(Curves.easeInOut),
        child: Text(
          label,
          style: config.applyToTextStyle(
            Theme.of(context).textTheme.labelLarge!,
          ),
        ),
      ),
    );
  }
}
```

---

## 🙏 Contributing

Contributions are welcome! Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for more information.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
