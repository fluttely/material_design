import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class IconSizeTokensPage extends StatelessWidget {
  const IconSizeTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Sizes')),
      body: ListView(
        padding: const EdgeInsets.all(M3Spacing.space16),
        children: [
          _buildIconSizeSection(context),
        ],
      ),
    );
  }

  Widget _buildIconSizeSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final iconSizes = [
      ('dense', M3IconSize.dense),
      ('standard', M3IconSize.standard),
      ('medium', M3IconSize.medium),
      ('large', M3IconSize.large),
      ('extraLarge', M3IconSize.extraLarge),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('M3IconSize Tokens', style: textTheme.titleLarge),
        const SizedBox(height: M3Spacing.space16),
        Wrap(
          spacing: M3Spacing.space16,
          runSpacing: M3Spacing.space16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: iconSizes.map((iconSize) {
            final (label, value) = iconSize;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.directions_boat_filled, size: value),
                const SizedBox(width: M3Spacing.space8),
                Text('$label (${value.toInt()}dp)'),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
