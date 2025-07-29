import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class IconSizeTokensPage extends StatelessWidget {
  const IconSizeTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Sizes')),
      body: ListView(
        padding: M3EdgeInsets.all(M3SpacingToken.space16),
        children: [
          _buildIconSizeSection(context),
        ],
      ),
    );
  }

  Widget _buildIconSizeSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final iconSizes = [
      ('dense', M3IconSizeToken.dense.value),
      ('standard', M3IconSizeToken.standard.value),
      ('medium', M3IconSizeToken.medium.value),
      ('large', M3IconSizeToken.large.value),
      ('extraLarge', M3IconSizeToken.extraLarge.value),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('M3IconSize Tokens', style: textTheme.titleLarge),
        const M3Gap(M3SpacingToken.space16),
        Wrap(
          spacing: M3SpacingToken.space16.value,
          runSpacing: M3SpacingToken.space16.value,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: iconSizes.map((iconSize) {
            final (label, value) = iconSize;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.directions_boat_filled, size: value),
                const M3Gap(M3SpacingToken.space8),
                Text('$label (${value.toInt()}dp)'),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
