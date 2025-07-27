import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart'; // Assuming this is your local package
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';
import 'package:material_design_demo/showcase_pages/widgets/state_layer_opacity_button_example.dart';

/// A page that demonstrates the Material Design 3 opacity tokens.
class OpacityTokensPage extends StatelessWidget {
  const OpacityTokensPage({super.key});

  // Lists of tokens defined as constants for better performance and organization.
  static const _stateLayerOpacities = [
    (label: 'Hover', token: M3StateLayerOpacityToken.hover),
    (label: 'Focus', token: M3StateLayerOpacityToken.focus),
    (label: 'Pressed', token: M3StateLayerOpacityToken.pressed),
    (label: 'Dragged', token: M3StateLayerOpacityToken.dragged),
  ];

  static const _generalOpacities = [
    (label: 'Disabled Content', token: M3OpacityToken.disabledContent),
    (label: 'Disabled Container', token: M3OpacityToken.disabledContainer),
    (label: 'Divider', token: M3OpacityToken.divider),
    (label: 'Backdrop', token: M3OpacityToken.backdrop),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('M3 Opacity')),
      body: ListView(
        padding: M3EdgeInsets.all(M3SpacingToken.space16),
        children: [
          // Section for state layer opacities.
          _buildSection(
            context: context,
            title: 'M3StateLayerOpacityToken',
            url:
                'https://m3.material.io/foundations/interaction/states/state-layers',
            tokens: _stateLayerOpacities,
            baseColor: colorScheme.primary,
          ),
          // Section for other common opacities.
          _buildSection(
            context: context,
            title: 'M3OpacityToken',
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
          const M3Gap(M3SpacingToken.space12),
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
    required List<({String label, IM3Token token})> tokens,
    required Color baseColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LaunchURLText(label: title, m3Url: url),
        const M3Gap(M3SpacingToken.space16),
        Wrap(
          spacing: M3SpacingToken.space16.value,
          runSpacing: M3SpacingToken.space16.value,
          children: tokens.map((token) {
            return _buildOpacityTile(
              label: token.label,
              value: token.token.value,
              // Applies the opacity to the section's base color.
              color: baseColor.withValues(alpha: token.token.value),
              // The text color is the base color without opacity, to ensure contrast.
              textColor: baseColor,
            );
          }).toList(),
        ),
        const M3Gap(M3SpacingToken.space32),
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
        borderRadius: M3ShapeToken.medium.borderRadius.value,
        border: Border.all(color: textColor.withValues(alpha: 0.2)),
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
