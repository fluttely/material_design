import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

/// Demonstrates M3StateLayer, M3FocusRing, and M3InteractionState.
class InteractionPage extends StatefulWidget {
  const InteractionPage({super.key});

  @override
  State<InteractionPage> createState() => _InteractionPageState();
}

class _InteractionPageState extends State<InteractionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interaction & Focus')),
      body: ListView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        children: [
          LaunchURLText(
            label: 'M3StateLayer | M3FocusRing | M3InteractionState',
            m3Url:
                'https://m3.material.io/foundations/interaction/states/overview',
          ),
          const M3Gap(M3Spacings.s16),
          _buildStateLayerSection(),
          const M3Gap(M3Spacings.s24),
          _buildFocusRingSection(),
          const M3Gap(M3Spacings.s24),
          _buildOpacityTokenSection(),
        ],
      ),
    );
  }

  Widget _buildStateLayerSection() {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('M3StateLayer', style: Theme.of(context).textTheme.titleLarge),
            const M3Gap(M3Spacings.s4),
            Text(
              'Semi-transparent overlay that communicates interaction state. '
              'Hover, focus, press, and drag each apply a different opacity.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s24),

            // Live interactive card
            _buildInteractiveCard(
              label: 'Tap or hover me',
              overlayColor: colorScheme.onPrimaryContainer,
              backgroundColor: colorScheme.primaryContainer,
              foregroundColor: colorScheme.onPrimaryContainer,
            ),
            const M3Gap(M3Spacings.s12),
            _buildInteractiveCard(
              label: 'Secondary surface',
              overlayColor: colorScheme.onSecondaryContainer,
              backgroundColor: colorScheme.secondaryContainer,
              foregroundColor: colorScheme.onSecondaryContainer,
            ),
            const M3Gap(M3Spacings.s12),
            _buildInteractiveCard(
              label: 'Disabled state',
              overlayColor: colorScheme.onSurface,
              backgroundColor: colorScheme.surface,
              foregroundColor: colorScheme.onSurface.withValues(
                alpha: M3Opacities.disabledContent,
              ),
              enabled: false,
            ),
            const M3Gap(M3Spacings.s24),

            // State opacity reference
            Text(
              'State layer opacities (M3StateLayerOpacities)',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const M3Gap(M3Spacings.s12),
            Wrap(
              spacing: M3Spacings.s8,
              runSpacing: M3Spacings.s8,
              children: [
                _buildOpacityChip(
                    'hover', M3StateLayerOpacities.hover, colorScheme),
                _buildOpacityChip(
                    'focus', M3StateLayerOpacities.focus, colorScheme),
                _buildOpacityChip(
                    'pressed', M3StateLayerOpacities.pressed, colorScheme),
                _buildOpacityChip(
                    'dragged', M3StateLayerOpacities.dragged, colorScheme),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveCard({
    required String label,
    required Color overlayColor,
    required Color backgroundColor,
    required Color foregroundColor,
    bool enabled = true,
  }) {
    return M3StateLayer(
      overlayColor: overlayColor,
      enabled: enabled,
      onTap: enabled ? () {} : null,
      borderRadius: M3BorderRadius.medium,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: M3BorderRadius.medium,
        ),
        padding: M3EdgeInsets.symmetric(horizontal: M3Spacings.s16),
        child: Row(
          children: [
            Icon(
              enabled ? Icons.touch_app_rounded : Icons.block_rounded,
              color: foregroundColor,
              size: M3IconSizes.medium,
            ),
            const M3Gap(M3Spacings.s12),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: foregroundColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpacityChip(String label, double opacity, ColorScheme cs) {
    return Container(
      padding: M3EdgeInsets.symmetric(
        horizontal: M3Spacings.s12,
        vertical: M3Spacings.s8,
      ),
      decoration: BoxDecoration(
        color: cs.primary.withValues(alpha: opacity),
        border: Border.all(color: cs.outline.withValues(alpha: 0.3)),
        borderRadius: M3BorderRadius.small,
      ),
      child: Text(
        '$label  ${(opacity * 100).toInt()}%',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: cs.onSurface,
            ),
      ),
    );
  }

  Widget _buildFocusRingSection() {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('M3FocusRing', style: Theme.of(context).textTheme.titleLarge),
            const M3Gap(M3Spacings.s4),
            Text(
              '3dp ring with 3dp gap around focused components. '
              'Tab through these elements to see the animated focus indicator.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s24),
            Wrap(
              spacing: M3Spacings.s16,
              runSpacing: M3Spacings.s16,
              children: [
                // Button-style focus ring
                M3FocusRing(
                  borderRadius: M3BorderRadius.full,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Filled Button'),
                  ),
                ),
                // Outlined-button focus ring
                M3FocusRing(
                  borderRadius: M3BorderRadius.full,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Outlined Button'),
                  ),
                ),
                // Icon button focus ring
                M3FocusRing(
                  borderRadius: BorderRadius.circular(24),
                  child: IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_rounded),
                  ),
                ),
                // Card-like focus ring
                M3FocusRing(
                  borderRadius: M3BorderRadius.medium,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: M3BorderRadius.medium,
                    child: Container(
                      padding: M3EdgeInsets.symmetric(
                        horizontal: M3Spacings.s16,
                        vertical: M3Spacings.s12,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        borderRadius: M3BorderRadius.medium,
                      ),
                      child: const Text('Card item'),
                    ),
                  ),
                ),
              ],
            ),
            const M3Gap(M3Spacings.s16),
            Container(
              padding: M3EdgeInsets.all(M3Spacings.s12),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer.withValues(alpha: 0.4),
                borderRadius: M3BorderRadius.small,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.keyboard_tab_rounded,
                    size: M3IconSizes.dense,
                    color: colorScheme.tertiary,
                  ),
                  const M3Gap(M3Spacings.s8),
                  Expanded(
                    child: Text(
                      'Press Tab to navigate between elements and see the focus ring animate in.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpacityTokenSection() {
    final colorScheme = Theme.of(context).colorScheme;
    final states = [
      (
        label: 'Hover',
        icon: Icons.mouse_outlined,
        state: M3InteractionState.hover,
        opacity: M3StateLayerOpacities.hover,
        description: 'Pointer enters the component bounds',
      ),
      (
        label: 'Focus',
        icon: Icons.center_focus_weak_rounded,
        state: M3InteractionState.focus,
        opacity: M3StateLayerOpacities.focus,
        description: 'Keyboard or programmatic focus',
      ),
      (
        label: 'Pressed',
        icon: Icons.touch_app_outlined,
        state: M3InteractionState.pressed,
        opacity: M3StateLayerOpacities.pressed,
        description: 'Active press gesture',
      ),
      (
        label: 'Dragged',
        icon: Icons.open_with_rounded,
        state: M3InteractionState.dragged,
        opacity: M3StateLayerOpacities.dragged,
        description: 'Active drag gesture (highest emphasis)',
      ),
    ];

    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3InteractionState',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'Each state applies a specific overlay opacity from M3StateLayerOpacities.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            ...states.map((s) => M3Padding(
                  padding: M3EdgeInsets.only(bottom: M3Spacings.s12),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color:
                              colorScheme.primary.withValues(alpha: s.opacity),
                          border: Border.all(
                            color: colorScheme.outline.withValues(alpha: 0.3),
                          ),
                          borderRadius: M3BorderRadius.medium,
                        ),
                        child: Icon(
                          s.icon,
                          size: M3IconSizes.medium,
                          color: colorScheme.primary,
                        ),
                      ),
                      const M3Gap(M3Spacings.s16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  s.label,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const M3Gap(M3Spacings.s8),
                                Container(
                                  padding: M3EdgeInsets.symmetric(
                                    horizontal: M3Spacings.s4,
                                    vertical: M3Spacings.s4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorScheme.secondaryContainer,
                                    borderRadius: M3BorderRadius.extraSmall,
                                  ),
                                  child: Text(
                                    '${(s.opacity * 100).toInt()}%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color:
                                              colorScheme.onSecondaryContainer,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              s.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
