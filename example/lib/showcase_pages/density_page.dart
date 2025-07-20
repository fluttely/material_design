import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class DensityPage extends StatefulWidget {
  const DensityPage({super.key});

  @override
  State<DensityPage> createState() => _DensityPageState();
}

class _DensityPageState extends State<DensityPage> {
  VisualDensity _selectedDensity = M3VisualDensity.comfortable;

  @override
  Widget build(BuildContext context) {
    final densityOptions = <(String, VisualDensity)>[
      ('Comfortable', M3VisualDensity.comfortable),
      ('Compact', M3VisualDensity.compact),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('M3VisualDensity Tokens'),
        // LaunchURLText(
        //   label: 'ColorScheme Tokens',
        //   m3Url: 'https://m3.material.io/styles/color/roles',
        // ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: M3Spacing.space16),
            child: SegmentedButton<VisualDensity>(
              segments: densityOptions
                  .map(
                    (option) => ButtonSegment<VisualDensity>(
                      value: option.$2,
                      label: Text(option.$1),
                      icon: option.$1 == 'Comfortable'
                          ? const Icon(Icons.format_line_spacing)
                          : const Icon(Icons.density_small),
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
          ),
          const Divider(height: 1),
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                visualDensity: _selectedDensity,
              ),
              child: _buildDemoList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: M3Spacing.space8,
        vertical: M3Spacing.space16,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text('U${index + 1}'),
            ),
            title: Text('List Item #${index + 1}'),
            subtitle: const Text('Subtitle text here'),
            trailing: const Icon(Icons.more_vert),
            onTap: () {},
          ),
        );
      },
    );
  }
}
