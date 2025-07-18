import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class DensityPage extends StatelessWidget {
  const DensityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final densities = [
      ('comfortable', MaterialDensity.comfortable),
      ('compact', MaterialDensity.compact),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Density Tokens')),
      body: ListView.separated(
        padding: const EdgeInsets.all(MaterialSpacing.space16),
        itemCount: densities.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: MaterialSpacing.space8),
        itemBuilder: (context, index) {
          final (label, density) = densities[index];
          return Row(
            children: [
              SizedBox(
                width: MaterialSpacing.space112,
                child: Text(
                  '$label:',
                  style: MaterialTypeScale.bodyMedium,
                ),
              ),
              const SizedBox(width: MaterialSpacing.space16),
              Expanded(
                child: Text(
                  density.toString(),
                  style: MaterialTypeScale.bodyMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}