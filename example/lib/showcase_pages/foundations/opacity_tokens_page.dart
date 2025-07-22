import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart'; // Assuming this is your local package
import 'package:material_design_example/showcase_pages/widgets/launch_url_text.dart';
import 'package:material_design_example/showcase_pages/widgets/state_layer_opacity_button_example.dart';

/// A page that demonstrates the Material Design 3 opacity tokens.
class OpacityTokensPage extends StatelessWidget {
  const OpacityTokensPage({super.key});

  // Lists of tokens defined as constants for better performance and organization.
  static const _stateLayerOpacities = [
    (label: 'Hover', value: M3StateLayerOpacity.hover),
    (label: 'Focus', value: M3StateLayerOpacity.focus),
    (label: 'Pressed', value: M3StateLayerOpacity.pressed),
    (label: 'Dragged', value: M3StateLayerOpacity.dragged),
  ];

  static const _generalOpacities = [
    (label: 'Disabled Content', value: M3Opacity.disabledContent),
    (label: 'Disabled Container', value: M3Opacity.disabledContainer),
    (label: 'Divider', value: M3Opacity.divider),
    (label: 'Backdrop', value: M3Opacity.backdrop),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Opacity Tokens')),
      body: ListView(
        padding: const EdgeInsets.all(M3Spacing.space16),
        children: [
          // Section for state layer opacities.
          _buildSection(
            context: context,
            title: 'M3StateLayerOpacity Tokens',
            url:
                'https://m3.material.io/foundations/interaction/states/state-layers',
            tokens: _stateLayerOpacities,
            baseColor: colorScheme.primary,
          ),
          // Section for other common opacities.
          _buildSection(
            context: context,
            title: 'M3Opacity Tokens',
            // The official link for states, which covers the "disabled" state.
            url:
                'https://m3.material.io/foundations/interaction/states/overview',
            tokens: _generalOpacities,
            baseColor: colorScheme.onSurface,
          ),
          // Section with a practical example.
          Text(
            'Practical Example',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: M3Spacing.space12),
          const M3StateLayerOpacityButtonExample(),
        ],
      ),
    );
  }

  /// Builds a complete section with a title, link, and a grid of opacity tokens.
  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String url,
    required List<({String label, double value})> tokens,
    required Color baseColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LaunchURLText(label: title, m3Url: url),
        const SizedBox(height: M3Spacing.space16),
        Wrap(
          spacing: M3Spacing.space16,
          runSpacing: M3Spacing.space16,
          children: tokens.map((token) {
            return _buildOpacityTile(
              label: token.label,
              value: token.value,
              // Applies the opacity to the section's base color.
              color: baseColor.withOpacity(token.value),
              // The text color is the base color without opacity, to ensure contrast.
              textColor: baseColor,
            );
          }).toList(),
        ),
        const SizedBox(height: M3Spacing.space32),
      ],
    );
  }

  /// Builds a single tile that demonstrates an opacity value.
  Widget _buildOpacityTile({
    required String label,
    required double value,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      width: 130,
      height: 90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: M3BorderRadius.medium,
        border: Border.all(color: textColor.withOpacity(0.2)),
      ),
      child: Center(
        child: Text(
          '$label\n(${(value * 100).toStringAsFixed(0)}%)', // Displays as a percentage.
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
