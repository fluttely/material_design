import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

class SpacingPage extends StatefulWidget {
  const SpacingPage({super.key});

  @override
  State<SpacingPage> createState() => _SpacingPageState();
}

class _SpacingPageState extends State<SpacingPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final spacings = [
      ('none', M3Spacings.none),
      ('infinity', M3Spacings.infinity),

      // --- Base Spacing Scale (4dp increments) ---
      // Ideal for padding within components and small layout gaps.
      ('s4', M3Spacings.s4),
      ('s8', M3Spacings.s8),
      ('s12', M3Spacings.s12),
      ('s16', M3Spacings.s16),
      ('s20', M3Spacings.s20),
      ('s24', M3Spacings.s24),
      ('s28', M3Spacings.s28),
      ('s32', M3Spacings.s32),
      ('s36', M3Spacings.s36),
      ('s40', M3Spacings.s40),
      ('s48', M3Spacings.s48),
      ('s56', M3Spacings.s56),
      ('s64', M3Spacings.s64),

      // --- Extended Spacing Scale ---
      // For larger layout spacing needs.
      ('s72', M3Spacings.s72),
      ('s80', M3Spacings.s80),
      ('s96', M3Spacings.s96),
      ('s128', M3Spacings.s128),
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
        title: const Text('Spacing'),
      ),
      body: SingleChildScrollView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LaunchURLText(
              label: 'M3Spacings (for Padding)',
              m3Url:
                  'https://m3.material.io/foundations/layout/understanding-layout/spacing',
            ),
            const M3Gap(M3Spacings.s8),
            Text(
              'Material Design uses a 4dp base unit for spacing. This creates visual rhythm and hierarchy.',
              style: textTheme.bodyMedium,
            ),
            const M3Gap(M3Spacings.s16),
            ...spacings.map((token) => _buildSpacingDemo(token.$1, token.$2)),
            const M3Gap(M3Spacings.s32),
            const LaunchURLText(
              label: 'M3Margins (by screen sizes)',
              m3Url:
                  'https://m3.material.io/foundations/layout/applying-layout/compact',
            ),
            const M3Gap(M3Spacings.s8),
            ...margins.map((margin) => _buildSpacingDemo(margin.$1, margin.$2)),
            const M3Gap(M3Spacings.s32),
            const LaunchURLText(
              label: 'M3Spacers (between two panes)',
              m3Url:
                  'https://m3.material.io/foundations/layout/understanding-layout/spacing',
            ),
            const M3Gap(M3Spacings.s8),
            ...spacers.map((spacer) => _buildSpacingDemo(spacer.$1, spacer.$2)),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacingDemo(String label, double spacing) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    // FIX: Check if the value is infinity to avoid calling .toInt() on it.
    final isInfinity = spacing == double.infinity;

    return M3Padding(
      padding: M3EdgeInsets.only(bottom: M3Spacings.s16),
      child: Row(
        children: [
          SizedBox(
            width: 128,
            child: Text(
              label,
              style: textTheme.labelLarge,
            ),
          ),
          SizedBox(
            width: 48,
            child: Text(
              // FIX: Display '∞' for infinity, otherwise display the integer value.
              isInfinity ? '∞' : '${spacing.toInt()}dp',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const M3Gap(M3Spacings.s16),
          // FIX: Conditionally render the container or a text label for infinity.
          if (isInfinity)
            Text(
              'Unbounded',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            )
          else
            Container(
              height: 24,
              width: spacing,
              color: colorScheme.primary,
            ),
        ],
      ),
    );
  }
}
