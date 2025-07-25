import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart'; // Assuming this is your local package

class VisualDensityPage extends StatefulWidget {
  const VisualDensityPage({super.key});

  @override
  State<VisualDensityPage> createState() => _VisualDensityPageState();
}

class _VisualDensityPageState extends State<VisualDensityPage> {
  // The initial state now uses a value from our constants list.
  VisualDensity _selectedDensity =
      M3VisualDensityToken.adaptivePlatformDensity.value;

  // The list of options is defined as a static constant for better performance.
  // We added an icon for each option, making the configuration more centralized.
  static final List<
          ({String label, M3VisualDensityToken density, IconData icon})>
      _densityOptions = [
    (
      label: 'Standard',
      density: M3VisualDensityToken.standard,
      icon: Icons.density_medium
    ),
    (
      label: 'Comfortable',
      density: M3VisualDensityToken.comfortable,
      icon: Icons.format_line_spacing
    ),
    (
      label: 'Compact',
      density: M3VisualDensityToken.compact,
      icon: Icons.density_small
    ),
    (
      label: 'Adaptive',
      density: M3VisualDensityToken.adaptivePlatformDensity,
      icon: Icons.tune
    ),
  ];

  /// Getter to determine the name of the adaptive density value on the current platform.
  String get _adaptiveDensityValueName {
    // Logic based on the known implementation of `adaptivePlatformDensity`.
    final isCompact = defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows;
    return isCompact ? 'Compact' : 'Standard';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M3VisualDensityToken'),
      ),
      // The body is now composed of methods that build each part of the UI.
      body: Column(
        children: [
          _buildPlatformInfo(),
          _buildDensitySelector(),
          _buildDemoArea(),
        ],
      ),
    );
  }

  /// Builds an informative card about adaptive density.
  Widget _buildPlatformInfo() {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: M3SpacingToken.space8.value,
        horizontal: M3SpacingToken.space16.value,
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

  /// Builds the density selector with segmented buttons.
  Widget _buildDensitySelector() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: M3SpacingToken.space8.value),
      child: SegmentedButton<VisualDensity>(
        segments: _densityOptions
            .map(
              (option) => ButtonSegment<VisualDensity>(
                value: option.density.value,
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

  /// Builds the demo area that reacts to the density change.
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

  /// Builds the example list to visualize the density.
  Widget _buildDemoList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: M3SpacingToken.space16.value,
        vertical: M3SpacingToken.space16.value,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(M3SpacingToken.space16.value),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('List Item with Density'),
                  subtitle: const Text('Item subtitle'),
                  trailing: Switch(value: index.isEven, onChanged: (_) {}),
                ),
                SizedBox(height: M3SpacingToken.space8.value),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Action 1')),
                    SizedBox(width: M3SpacingToken.space8.value),
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
