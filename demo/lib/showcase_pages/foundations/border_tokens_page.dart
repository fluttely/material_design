import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

class BorderTokensPage extends StatelessWidget {
  const BorderTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Border')),
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

    final borders = [
      ('None', M3BorderWidthToken.none),
      ('Thin', M3BorderWidthToken.thin),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LaunchURLText(label: 'M3BorderWidths | M3BorderWidthToken'),
        Icon(Icons.keyboard_arrow_down_rounded),
        LaunchURLText(label: 'M3BorderSide'),
        Icon(Icons.keyboard_arrow_down_rounded),
        LaunchURLText(label: 'M3Border'),
        LaunchURLText(
            label:
                'outlineColor: Theme.of(context).colorScheme.outline;\noutlineColor: Theme.of(context).colorScheme.outlineVariant;'),
        const M3Gap(M3SpacingToken.space16),
        Wrap(
          spacing: M3SpacingToken.space16.value,
          children: borders.map((border) {
            final (label, width) = border;
            return Container(
              padding: M3EdgeInsets.all(M3SpacingToken.space16),
              decoration: BoxDecoration(
                border: M3Border.fromBorderSide(
                  M3BorderSide(
                    outlineColor: colorScheme.outline,
                    width: width,
                  ),
                ),
                borderRadius: M3BorderRadius.small,
              ),
              child: Text('$label (${width.value}dp)'),
            );
          }).toList(),
        ),
      ],
    );
  }
}
