import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class DensityPage extends StatelessWidget {
  const DensityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final densities = [
      ('comfortable', M3Density.comfortable),
      ('compact', M3Density.compact),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Density Tokens')),
      body: ListView.separated(
        padding: const EdgeInsets.all(M3Spacing.space16),
        itemCount: densities.length,
        separatorBuilder: (_, __) => const SizedBox(height: M3Spacing.space8),
        itemBuilder: (context, index) {
          final (label, density) = densities[index];
          return Row(
            children: [
              SizedBox(
                width: M3Spacing.space112,
                child: Text(
                  '$label:',
                  style: M3TypeScale.bodyMedium,
                ),
              ),
              const SizedBox(width: M3Spacing.space16),
              Expanded(
                child: Text(
                  density.toString(),
                  style: M3TypeScale.bodyMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
