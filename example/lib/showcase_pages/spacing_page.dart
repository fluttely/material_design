import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final spacings = [
      ('space4', M3Spacing.space4),
      ('space8', M3Spacing.space8),
      ('space12', M3Spacing.space12),
      ('space16', M3Spacing.space16),
      ('space24', M3Spacing.space24),
      ('space32', M3Spacing.space32),
      ('space40', M3Spacing.space40),
      ('space48', M3Spacing.space48),
      ('space64', M3Spacing.space64),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Spacing Tokens')),
      body: ListView.separated(
        padding: const EdgeInsets.all(M3Spacing.space16),
        itemCount: spacings.length,
        separatorBuilder: (_, __) => const SizedBox(height: M3Spacing.space8),
        itemBuilder: (context, index) {
          final (label, height) = spacings[index];
          return Row(
            children: [
              SizedBox(
                width: M3Spacing.space112,
                child: Text(
                  '$label (${height}dp):',
                  style: M3TypeScale.bodyMedium,
                ),
              ),
              const SizedBox(width: M3Spacing.space16),
              Expanded(
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(
                      M3Radius.extraSmall,
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
