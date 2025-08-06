import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Page demonstrating the enhanced M3 theme system.
class EnhancedThemePage extends StatelessWidget {
  const EnhancedThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhanced M3Theme'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: M3EdgeInsets.all(M3SpacingToken.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3Theme Showcase',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const M3Gap(M3SpacingToken.space16),

            // Display styles
            _buildSection(
              context,
              'Typography Styles',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Display Large',
                      style: Theme.of(context).textTheme.displayLarge),
                  Text('Display Medium',
                      style: Theme.of(context).textTheme.displayMedium),
                  Text('Display Small',
                      style: Theme.of(context).textTheme.displaySmall),
                  Text('Headline Large',
                      style: Theme.of(context).textTheme.headlineLarge),
                  Text('Headline Medium',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text('Headline Small',
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text('Title Large',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('Title Medium',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('Title Small',
                      style: Theme.of(context).textTheme.titleSmall),
                  Text('Body Large',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text('Body Medium',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text('Body Small',
                      style: Theme.of(context).textTheme.bodySmall),
                  Text('Label Large',
                      style: Theme.of(context).textTheme.labelLarge),
                  Text('Label Medium',
                      style: Theme.of(context).textTheme.labelMedium),
                  Text('Label Small',
                      style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
            ),

            const M3Gap(M3SpacerToken.pane),

            // // Cards with different elevations
            // _buildSection(
            //   context,
            //   'Cards with Elevation',
            //   Column(
            //     children: [
            //       Card(
            //         elevation: M3ElevationToken.card,
            //         child: M3Padding(
            //           padding: const M3EdgeInsets.all(M3SpacingToken.space16),
            //           child: SizedBox(
            //             width: double.infinity,
            //             child: Text(
            //               'Standard Card (${M3ElevationToken.card}dp)',
            //               style: Theme.of(context).textTheme.titleMedium,
            //             ),
            //           ),
            //         ),
            //       ),
            //       const const M3Gap(M3SpacingToken.space8),
            //       Card(
            //         elevation: M3ElevationToken.appBar,
            //         child: M3Padding(
            //           padding: const M3EdgeInsets.all(M3SpacingToken.space16),
            //           child: SizedBox(
            //             width: double.infinity,
            //             child: Text(
            //               'Elevated appBar (${M3ElevationToken.appBar}dp)',
            //               style: Theme.of(context).textTheme.titleMedium,
            //             ),
            //           ),
            //         ),
            //       ),
            //       const const M3Gap(M3SpacingToken.space8),
            //       Card(
            //         elevation: M3ElevationToken.level5,
            //         child: M3Padding(
            //           padding: const M3EdgeInsets.all(M3SpacingToken.space16),
            //           child: SizedBox(
            //             width: double.infinity,
            //             child: Text(
            //               'High Elevation Card (${M3ElevationToken.level5}dp)',
            //               style: Theme.of(context).textTheme.titleMedium,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            const M3Gap(M3SpacerToken.pane),

            // Color roles showcase
            _buildSection(
              context,
              'Color Roles',
              Column(
                children: [
                  _buildColorRoleCard(
                    'Primary Container',
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  const M3Gap(M3SpacingToken.space8),
                  _buildColorRoleCard(
                    'Secondary Container',
                    Theme.of(context).colorScheme.secondaryContainer,
                    Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  const M3Gap(M3SpacingToken.space8),
                  _buildColorRoleCard(
                    'Tertiary Container',
                    Theme.of(context).colorScheme.tertiaryContainer,
                    Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const M3Gap(M3SpacingToken.space12),
        content,
      ],
    );
  }

  Widget _buildColorRoleCard(
      String label, Color backgroundColor, Color textColor) {
    return Container(
      width: double.infinity,
      padding: M3EdgeInsets.all(M3SpacingToken.space16),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: M3Shape.medium,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
