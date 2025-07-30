import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart'; // Assuming this is your local package

class VisualDensityPage extends StatefulWidget {
  const VisualDensityPage({super.key});

  @override
  State<VisualDensityPage> createState() => _VisualDensityPageState();
}

class _VisualDensityPageState extends State<VisualDensityPage> {
  // Corrigido: usar o getter estático para adaptive density
  VisualDensity _selectedDensity = M3VisualDensityToken.adaptivePlatformDensity;

  // Corrigido: criar uma estrutura que funciona com a nova implementação
  static final List<({String label, VisualDensity density, IconData icon})>
      _densityOptions = [
    (
      label: 'Standard',
      density: M3VisualDensityToken.standard.value,
      icon: Icons.density_medium
    ),
    (
      label: 'Comfortable',
      density: M3VisualDensityToken.comfortable.value,
      icon: Icons.format_line_spacing
    ),
    (
      label: 'Compact',
      density: M3VisualDensityToken.compact.value,
      icon: Icons.density_small
    ),
    (
      label: 'Adaptive',
      density: M3VisualDensityToken.adaptivePlatformDensity,
      icon: Icons.tune
    ),
  ];

  /// Getter para determinar o nome do valor de densidade adaptativa na plataforma atual.
  String get _adaptiveDensityValueName {
    final platform = Theme.of(context).platform;
    final recommendedToken = M3VisualDensityToken.forPlatform(platform);

    switch (recommendedToken) {
      case M3VisualDensityToken.comfortable:
        return 'Comfortable';
      case M3VisualDensityToken.standard:
        return 'Standard';
      case M3VisualDensityToken.compact:
        return 'Compact';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M3VisualDensityToken'),
      ),
      body: Column(
        children: [
          _buildPlatformInfo(),
          _buildDensitySelector(),
          _buildDemoArea(),
        ],
      ),
    );
  }

  /// Constrói um card informativo sobre densidade adaptativa.
  Widget _buildPlatformInfo() {
    return Card(
      margin: M3EdgeInsets.symmetric(
        vertical: M3SpacingToken.space8,
        horizontal: M3SpacingToken.space16,
      ),
      child: ListTile(
        leading: const Icon(Icons.info_outline),
        title: const Text('Adaptive Density'),
        subtitle: Text(
          'On this platform, the adaptive value is "$_adaptiveDensityValueName".',
        ),
      ),
    );
  }

  /// Constrói o seletor de densidade com botões segmentados.
  Widget _buildDensitySelector() {
    return M3Padding.symmetric(
      vertical: M3SpacingToken.space8,
      child: SegmentedButton<VisualDensity>(
        segments: _densityOptions
            .map(
              (option) => ButtonSegment<VisualDensity>(
                value: option.density,
                label: Text(option.label),
                icon: Icon(option.icon),
              ),
            )
            .toList(),
        selected: {_selectedDensity},
        onSelectionChanged: (newSelection) {
          setState(() {
            _selectedDensity = newSelection.first;
          });
        },
      ),
    );
  }

  /// Constrói a área de demonstração que reage à mudança de densidade.
  Widget _buildDemoArea() {
    return Expanded(
      child: Theme(
        data: Theme.of(context).copyWith(
          visualDensity: _selectedDensity,
        ),
        child: Column(
          children: [
            const Divider(height: 1),
            Expanded(child: _buildDemoList()),
          ],
        ),
      ),
    );
  }

  /// Constrói a lista de exemplo para visualizar a densidade.
  Widget _buildDemoList() {
    return ListView.builder(
      padding: M3EdgeInsets.symmetric(
        horizontal: M3SpacingToken.space16,
        vertical: M3SpacingToken.space16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          child: M3Padding.all(
            M3SpacingToken.space16,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('List Item with Density'),
                  subtitle: const Text('Item subtitle'),
                  trailing: Switch(value: index.isEven, onChanged: (_) {}),
                ),
                const M3Gap(M3SpacingToken.space8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Action 1')),
                    const M3Gap(M3SpacingToken.space8),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Action 2')),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
