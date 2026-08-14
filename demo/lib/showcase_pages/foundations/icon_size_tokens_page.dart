import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

class IconSizeTokensPage extends StatelessWidget {
  const IconSizeTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Sizes')),
      body: ListView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        children: [
          _buildIconSizeSection(context),
        ],
      ),
    );
  }

  Widget _buildIconSizeSection(BuildContext context) {
    final iconSizes = [
      ('dense', M3IconSizes.dense),
      ('standard', M3IconSizes.standard),
      ('medium', M3IconSizes.medium),
      ('large', M3IconSizes.large),
      ('extraLarge', M3IconSizes.extraLarge),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LaunchURLText(label: 'M3IconSizes | M3IconSizeToken'),
        const M3Gap(M3Spacings.s16),
        Wrap(
          spacing: M3Spacings.s16,
          runSpacing: M3Spacings.s16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: iconSizes.map((iconSize) {
            final (label, value) = iconSize;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.directions_boat_filled, size: value),
                const M3Gap(M3Spacings.s8),
                Text('$label (${value.toInt()}dp)'),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
