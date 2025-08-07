import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart'; // Assuming this is your local package

class VisualDensityPage extends StatefulWidget {
  const VisualDensityPage({super.key});

  @override
  State<VisualDensityPage> createState() => _VisualDensityPageState();
}

class _VisualDensityPageState extends State<VisualDensityPage> {
  // Corrigido: usar o getter estático para adaptive density
  VisualDensity _selectedDensity = M3VisualDensity.adaptivePlatformDensity;

  // Corrigido: criar uma estrutura que funciona com a nova implementação
  static final List<({String label, VisualDensity density, IconData icon})>
      _densityOptions = [
    (
      label: 'Standard',
      density: M3VisualDensity.standard,
      icon: Icons.density_medium
    ),
    (
      label: 'Comfortable',
      density: M3VisualDensity.comfortable,
      icon: Icons.format_line_spacing
    ),
    (
      label: 'Compact',
      density: M3VisualDensity.compact,
      icon: Icons.density_small
    ),
    (
      label: 'Adaptive',
      density: M3VisualDensity.adaptivePlatformDensity,
      icon: Icons.tune
    ),
  ];

  /// Getter para determinar o nome do valor de densidade adaptativa na plataforma atual.
  String get _adaptiveDensityValueName {
    final platform = Theme.of(context).platform;
    final recommendedToken = M3VisualDensity.forPlatform(platform);

    return switch (recommendedToken) {
      M3VisualDensity.comfortable => 'Comfortable',
      M3VisualDensity.standard => 'Standard',
      M3VisualDensity.compact => 'Compact',
      _ => '???',
    };
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visual Density'),
      ),
      body: Padding(
        padding: M3EdgeInsets.symmetric(
          vertical: M3SpacingToken.space8,
          horizontal: M3SpacingToken.space16,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: LaunchURLText(label: 'M3VisualDensity'),
            ),
            _buildPlatformInfo(),
            _buildDensitySelector(),
            _buildDemoArea(),
          ],
        ),
      ),
    );
  }

  /// Constrói um card informativo sobre densidade adaptativa.
  Widget _buildPlatformInfo() {
    return Card(
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
    return M3Padding(
      padding: M3EdgeInsets.symmetric(
        vertical: M3SpacingToken.space8,
      ),
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
      padding: M3EdgeInsets.symmetric(vertical: M3SpacingToken.space16),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          child: M3Padding(
            padding: M3EdgeInsets.all(M3SpacingToken.space16),
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
