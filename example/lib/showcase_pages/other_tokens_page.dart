import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class OtherTokensPage extends StatelessWidget {
  const OtherTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Other Tokens')),
      body: ListView(
        padding: const EdgeInsets.all(MaterialSpacing.space16),
        children: [
          _buildBorderSection(context),
          const SizedBox(height: MaterialSpacing.space32),
          _buildOpacitySection(context),
        ],
      ),
    );
  }

  Widget _buildBorderSection(BuildContext context) {
    final borders = [
      ('Thin', MaterialBorder.thin),
      // ('Thick', MaterialBorder.thick),
      // ('Extra Thick', MaterialBorder.extraThick),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Borders', style: MaterialTypeScale.titleLarge),
        const SizedBox(height: MaterialSpacing.space16),
        Wrap(
          spacing: MaterialSpacing.space16,
          children: borders.map((border) {
            final (label, width) = border;
            return Container(
              padding: const EdgeInsets.all(MaterialSpacing.space16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: width,
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(MaterialRadius.small),
              ),
              child: Text('$label (${width}dp)'),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildOpacitySection(BuildContext context) {
    final opacities = [
      ('Hover', MaterialOpacity.hover),
      ('Focus', MaterialOpacity.focus),
      ('Pressed', MaterialOpacity.pressed),
      ('Dragged', MaterialOpacity.dragged),
      ('Disabled Content', MaterialOpacity.disabledContent),
      ('Disabled Container', MaterialOpacity.disabledContainer),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Opacities (State Layers)', style: MaterialTypeScale.titleLarge),
        const SizedBox(height: MaterialSpacing.space16),
        Wrap(
          spacing: MaterialSpacing.space16,
          runSpacing: MaterialSpacing.space16,
          children: opacities.map((opacity) {
            final (label, value) = opacity;
            return Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(value),
                borderRadius: BorderRadius.circular(MaterialRadius.small),
              ),
              child: Center(
                child: Text(
                  '$label\n($value)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
