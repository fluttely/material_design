import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class BorderTokensPage extends StatelessWidget {
  const BorderTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Borders')),
      body: ListView(
        padding: const EdgeInsets.all(M3Spacing.space16),
        children: [
          _buildBorderSection(context),
        ],
      ),
    );
  }

  Widget _buildBorderSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final borders = [
      ('Thin', M3Border.thin),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('M3Border Tokens', style: textTheme.titleLarge),
        const SizedBox(height: M3Spacing.space16),
        Wrap(
          spacing: M3Spacing.space16,
          children: borders.map((border) {
            final (label, width) = border;
            return Container(
              padding: const EdgeInsets.all(M3Spacing.space16),
              decoration: BoxDecoration(
                border: Border.all(width: width, color: colorScheme.primary),
                borderRadius: BorderRadius.circular(M3Radius.small),
              ),
              child: Text('$label (${width}dp)'),
            );
          }).toList(),
        ),
      ],
    );
  }
}
