import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final spacings = [
      /// Material Design 3 spacing scale
      ('none', M3Spacing.none),

      // Base spacing scale (4dp increments)
      ('space4', M3Spacing.space4),
      ('space8', M3Spacing.space8),
      ('space12', M3Spacing.space12),
      ('space16', M3Spacing.space16),
      ('space20', M3Spacing.space20),
      ('space24', M3Spacing.space24),
      ('space28', M3Spacing.space28),
      ('space32', M3Spacing.space32),
      ('space36', M3Spacing.space36),
      ('space40', M3Spacing.space40),
      ('space44', M3Spacing.space44),
      ('space48', M3Spacing.space48),
      ('space52', M3Spacing.space52),
      ('space56', M3Spacing.space56),
      ('space60', M3Spacing.space60),
      ('space64', M3Spacing.space64),

      // Extended spacing scale (8dp increments for larger spacing)
      ('space72', M3Spacing.space72),
      ('space80', M3Spacing.space80),
      ('space88', M3Spacing.space88),
      ('space96', M3Spacing.space96),
      ('space104', M3Spacing.space104),
      ('space112', M3Spacing.space112),
      ('space120', M3Spacing.space120),
      ('space128', M3Spacing.space128),

      // Large spacing scale (16dp increments)
      ('space144', M3Spacing.space144),
      ('space160', M3Spacing.space160),
      ('space176', M3Spacing.space176),
      ('space192', M3Spacing.space192),
      ('space208', M3Spacing.space208),
      ('space224', M3Spacing.space224),
      ('space240', M3Spacing.space240),
      ('space256', M3Spacing.space256),

      // Extra large spacing for special cases
      ('space320', M3Spacing.space320),
      ('space384', M3Spacing.space384),
      ('space448', M3Spacing.space448),
      ('space512', M3Spacing.space512),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('M3Spacing Tokens')),
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
