import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class OtherTokensPage extends StatelessWidget {
  const OtherTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Other Tokens')),
      body: ListView(
        padding: const EdgeInsets.all(M3Spacing.space16),
        children: [
          _buildBorderSection(context),
          const SizedBox(height: M3Spacing.space32),
          _buildOpacitySection(context),
          const SizedBox(height: M3Spacing.space32),
          _buildBreakpointSection(context),
          const SizedBox(height: M3Spacing.space32),
          _buildIconSizeSection(context),
          const SizedBox(height: M3Spacing.space32),
          _buildZIndexSection(context),
        ],
      ),
    );
  }

  Widget _buildBreakpointSection(BuildContext context) {
    final breakpoints = [
      ('Compact', M3Breakpoint.compact),
      ('Medium', M3Breakpoint.medium),
      ('Expanded', M3Breakpoint.expanded),
      ('Large', M3Breakpoint.large),
      ('Extra Large', M3Breakpoint.extraLarge),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Breakpoints', style: M3TypeScale.titleLarge),
        const SizedBox(height: M3Spacing.space16),
        Wrap(
          spacing: M3Spacing.space16,
          runSpacing: M3Spacing.space16,
          children: breakpoints.map((breakpoint) {
            final (label, value) = breakpoint;
            return Chip(
              label: Text('$label (${value.toInt()}dp)'),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildIconSizeSection(BuildContext context) {
    final iconSizes = [
      ('Standard', M3IconSize.standard),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Icon Sizes', style: M3TypeScale.titleLarge),
        const SizedBox(height: M3Spacing.space16),
        Wrap(
          spacing: M3Spacing.space16,
          runSpacing: M3Spacing.space16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: iconSizes.map((iconSize) {
            final (label, value) = iconSize;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite, size: value),
                const SizedBox(width: M3Spacing.space8),
                Text('$label (${value.toInt()}dp)'),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildZIndexSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final zIndexes = [
      ('Content', M3ZIndex.content),
      ('Floating', M3ZIndex.floating),
      ('Drawer', M3ZIndex.drawer),
      ('Modal', M3ZIndex.modal),
      ('Snackbar', M3ZIndex.snackbar),
      ('Tooltip', M3ZIndex.tooltip),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Z-Index', style: M3TypeScale.titleLarge),
        const SizedBox(height: M3Spacing.space16),
        SizedBox(
          height: 150,
          child: Stack(
            children: zIndexes.map((zIndex) {
              final (label, value) = zIndex;
              final position = zIndexes.indexOf(zIndex) * 20.0;
              return Positioned(
                left: position,
                top: position,
                child: Container(
                  width: 100,
                  height: 100,
                  color: colorScheme.primary.withOpacity(0.8),
                  child: Center(
                    child: Text(
                      '$label\n(z: $value)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBorderSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final borders = [
      ('Thin', M3Border.thin),
      // ('Thick', M3Border.thick),
      // ('Extra Thick', M3Border.extraThick),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Borders', style: M3TypeScale.titleLarge),
        const SizedBox(height: M3Spacing.space16),
        Wrap(
          spacing: M3Spacing.space16,
          children: borders.map((border) {
            final (label, width) = border;
            return Container(
              padding: const EdgeInsets.all(M3Spacing.space16),
              decoration: BoxDecoration(
                border: Border.all(width: width, color: colorScheme.primary),
                borderRadius: BorderRadius.circular(M3Radius.small),
              ),
              child: Text('$label (${width}dp)'),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildOpacitySection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final opacities = [
      ('Hover', M3Opacity.hover),
      ('Focus', M3Opacity.focus),
      ('Pressed', M3Opacity.pressed),
      ('Dragged', M3Opacity.dragged),
      ('Disabled Content', M3Opacity.disabledContent),
      ('Disabled Container', M3Opacity.disabledContainer),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Opacities (State Layers)',
          style: M3TypeScale.titleLarge,
        ),
        const SizedBox(height: M3Spacing.space16),
        Wrap(
          spacing: M3Spacing.space16,
          runSpacing: M3Spacing.space16,
          children: opacities.map((opacity) {
            final (label, value) = opacity;
            return Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: value),
                borderRadius: BorderRadius.circular(M3Radius.small),
              ),
              child: Center(
                child: Text(
                  '$label\n($value)',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
