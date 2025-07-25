import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class IconSizeTokensPage extends StatelessWidget {
  const IconSizeTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Sizes')),
      body: ListView(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
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
        SizedBox(height: M3SpacingToken.space16.value),
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
                SizedBox(width: M3SpacingToken.space8.value),
                Text('$label (${value.toInt()}dp)'),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
