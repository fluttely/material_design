import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final spacings = [
      ('space4', MaterialSpacing.space4),
      ('space8', MaterialSpacing.space8),
      ('space12', MaterialSpacing.space12),
      ('space16', MaterialSpacing.space16),
      ('space24', MaterialSpacing.space24),
      ('space32', MaterialSpacing.space32),
      ('space40', MaterialSpacing.space40),
      ('space48', MaterialSpacing.space48),
      ('space64', MaterialSpacing.space64),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Spacing Tokens')),
      body: ListView.separated(
        padding: const EdgeInsets.all(MaterialSpacing.space16),
        itemCount: spacings.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: MaterialSpacing.space8),
        itemBuilder: (context, index) {
          final (label, height) = spacings[index];
          return Row(
            children: [
              SizedBox(
                width: MaterialSpacing.space112,
                child: Text(
                  '$label (${height}dp):',
                  style: MaterialTypeScale.bodyMedium,
                ),
              ),
              const SizedBox(width: MaterialSpacing.space16),
              Expanded(
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(
                      MaterialRadius.extraSmall,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
