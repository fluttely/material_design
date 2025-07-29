import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class BorderTokensPage extends StatelessWidget {
  const BorderTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Borders')),
      body: ListView(
        padding: M3EdgeInsets.all(M3SpacingToken.space16),
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
      ('Thin', M3BorderWidthToken.thin),
      ('Thick', M3BorderWidthToken.thick),
      ('Extra Thick', M3BorderWidthToken.extraThick),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('M3Border Tokens', style: textTheme.titleLarge),
        const M3Gap(M3SpacingToken.space16),
        Wrap(
          spacing: M3SpacingToken.space16.value,
          children: borders.map((border) {
            final (label, width) = border;
            return Container(
              padding: M3EdgeInsets.all(M3SpacingToken.space16),
              decoration: BoxDecoration(
                border:
                    Border.all(width: width.value, color: colorScheme.primary),
                borderRadius: M3BorderRadiusToken.small.value,
              ),
              child: Text('$label (${width.value}dp)'),
            );
          }).toList(),
        ),
      ],
    );
  }
}
