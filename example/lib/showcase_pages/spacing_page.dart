import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_example/showcase_pages/widgets/launch_url_text.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  Widget _buildSpacingRow(
    BuildContext context,
    String label,
    double value,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final isInfinity = value == double.infinity;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label (${isInfinity ? "∞" : value.toInt()}dp):',
              style: textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: M3Spacing.space16),
          Expanded(
            child: isInfinity
                ? Text(
                    'Represents unbounded space',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                : Container(
                    height: value,
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(M3Radius.extraSmall),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final spacings = [
      ('none', M3Spacing.none),
      ('infinity', M3Spacing.infinity),

      // --- Base Spacing Scale (4dp increments) ---
      // Ideal for padding within components and small layout gaps.
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
      ('space48', M3Spacing.space48),
      ('space56', M3Spacing.space56),
      ('space64', M3Spacing.space64),

      // --- Extended Spacing Scale ---
      // For larger layout spacing needs.
      ('space72', M3Spacing.space72),
      ('space80', M3Spacing.space80),
      ('space96', M3Spacing.space96),
      ('space128', M3Spacing.space128),
    ];

    final margins = [
      ('compactScreen', M3Margins.compactScreen),
      ('mediumScreen', M3Margins.mediumScreen),
      ('expandedScreen', M3Margins.expandedScreen),
      ('largeScreen', M3Margins.largeScreen),
      ('extraLargeScreen', M3Margins.extraLargeScreen),
    ];

    final spacers = [
      ('pane', M3Spacers.pane),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Spacing'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(M3Spacing.space16),
        children: [
          LaunchURLText(
            label: 'Spacing Tokens (for Padding)',
            m3Url:
                'https://m3.material.io/foundations/layout/understanding-layout/spacing',
          ),
          const SizedBox(height: M3Spacing.space8),
          ...spacings.map((s) => _buildSpacingRow(context, s.$1, s.$2)),
          const SizedBox(height: M3Spacing.space32),
          LaunchURLText(
            label: 'Margin Tokens (by screen sizes)',
            m3Url:
                'https://m3.material.io/foundations/layout/applying-layout/compact',
          ),
          const SizedBox(height: M3Spacing.space8),
          ...margins.map((m) => _buildSpacingRow(context, m.$1, m.$2)),
          const SizedBox(height: M3Spacing.space32),
          LaunchURLText(
            label: 'Spacer Tokens (between two panes)',
            m3Url:
                'https://m3.material.io/foundations/layout/understanding-layout/spacing',
          ),
          const SizedBox(height: M3Spacing.space8),
          ...spacers.map((s) => _buildSpacingRow(context, s.$1, s.$2)),
        ],
      ),
    );
  }
}
