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
      ('none', M3SpacingToken.none),
      ('infinity', M3SpacingToken.infinity),

      // --- Base Spacing Scale (4dp increments) ---
      // Ideal for padding within components and small layout gaps.
      ('space4', M3SpacingToken.space4),
      ('space8', M3SpacingToken.space8),
      ('space12', M3SpacingToken.space12),
      ('space16', M3SpacingToken.space16),
      ('space20', M3SpacingToken.space20),
      ('space24', M3SpacingToken.space24),
      ('space28', M3SpacingToken.space28),
      ('space32', M3SpacingToken.space32),
      ('space36', M3SpacingToken.space36),
      ('space40', M3SpacingToken.space40),
      ('space48', M3SpacingToken.space48),
      ('space56', M3SpacingToken.space56),
      ('space64', M3SpacingToken.space64),

      // --- Extended Spacing Scale ---
      // For larger layout spacing needs.
      ('space72', M3SpacingToken.space72),
      ('space80', M3SpacingToken.space80),
      ('space96', M3SpacingToken.space96),
      ('space128', M3SpacingToken.space128),
    ];

    final margins = [
      ('compactScreen', M3MarginToken.compactScreen),
      ('mediumScreen', M3MarginToken.mediumScreen),
      ('expandedScreen', M3MarginToken.expandedScreen),
      ('largeScreen', M3MarginToken.largeScreen),
      ('extraLargeScreen', M3MarginToken.extraLargeScreen),
    ];

    final spacers = [
      ('pane', M3SpacerToken.pane),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Spacing System'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LaunchURLText(
              label: 'M3Spacing Tokens (for Padding)',
              m3Url:
                  'https://m3.material.io/foundations/layout/understanding-layout/spacing',
            ),
            SizedBox(height: M3SpacingToken.space8.value),
            Text(
              'Material Design uses a 4dp base unit for spacing. This creates visual rhythm and hierarchy.',
              style: textTheme.bodyMedium,
            ),
            SizedBox(height: M3SpacingToken.space16.value),
            ...spacings.map((token) => _buildSpacingDemo(token.$1, token.$2)),
            SizedBox(height: M3SpacingToken.space32.value),
            const LaunchURLText(
              label: 'M3Margin Tokens (by screen sizes)',
              m3Url:
                  'https://m3.material.io/foundations/layout/applying-layout/compact',
            ),
            SizedBox(height: M3SpacingToken.space8.value),
            ...margins.map((margin) => _buildSpacingDemo(margin.$1, margin.$2)),
            SizedBox(height: M3SpacingToken.space32.value),
            const LaunchURLText(
              label: 'M3Spacer Tokens (between two panes)',
              m3Url:
                  'https://m3.material.io/foundations/layout/understanding-layout/spacing',
            ),
            SizedBox(height: M3SpacingToken.space8.value),
            ...spacers.map((spacer) => _buildSpacingDemo(spacer.$1, spacer.$2)),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacingDemo(String label, IM3SpacingToken token) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    // FIX: Check if the value is infinity to avoid calling .toInt() on it.
    final isInfinity = token.value == double.infinity;

    return Padding(
      padding: EdgeInsets.only(bottom: M3SpacingToken.space16.value),
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
              isInfinity ? '∞' : '${token.value.toInt()}dp',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          SizedBox(width: M3SpacingToken.space16.value),
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
              width: token.value,
              color: colorScheme.primary,
            ),
        ],
      ),
    );
  }

  // // This original method is kept as it's used by other lists.
  // Widget _buildSpacingRow(
  //   BuildContext context,
  //   String label,
  //   double value,
  // ) {
  //   final textTheme = Theme.of(context).textTheme;
  //   final colorScheme = Theme.of(context).colorScheme;

  //   final isInfinity = value == double.infinity;

  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4.0),
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 120,
  //           child: Text(
  //             '$label (${isInfinity ? "∞" : value.toInt()}dp):',
  //             style: textTheme.bodyMedium,
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //         const SizedBox(width: M3Spacing.space16),
  //         Expanded(
  //           child: isInfinity
  //               ? Text(
  //                   'Represents unbounded space',
  //                   style: textTheme.bodySmall?.copyWith(
  //                     color: colorScheme.onSurfaceVariant,
  //                     fontStyle: FontStyle.italic,
  //                   ),
  //                 )
  //               : Container(
  //                   height: value,
  //                   decoration: ShapeDecoration(
  //                     color: colorScheme.secondaryContainer,
  //                     shape: M3Shape.extraSmall,
  //                   ),
  //                 ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
