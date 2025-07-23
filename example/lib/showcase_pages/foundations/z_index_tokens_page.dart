import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class ZIndexTokensPage extends StatelessWidget {
  const ZIndexTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Z-Index System')), // TODO(Kevin): fix title
      body: ListView(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        children: [
          _buildZIndexSection(context),
        ],
      ),
    );
  }

  Widget _buildZIndexSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final zIndexLayers = [
      _ZIndexLayer(
        name: 'Content',
        zIndex: M3ZIndexToken.content.value,
        description: 'Base content layer',
        color: colorScheme.surface,
        borderColor: colorScheme.outline,
      ),
      _ZIndexLayer(
        name: 'Floating',
        zIndex: M3ZIndexToken.floating.value,
        description: 'FAB, chips, buttons',
        color: colorScheme.primaryContainer,
        borderColor: colorScheme.primary,
      ),
      _ZIndexLayer(
        name: 'Drawer',
        zIndex: M3ZIndexToken.drawer.value,
        description: 'Navigation drawer',
        color: colorScheme.secondaryContainer,
        borderColor: colorScheme.secondary,
      ),
      _ZIndexLayer(
        name: 'Modal',
        zIndex: M3ZIndexToken.modal.value,
        description: 'Dialogs, bottom sheets',
        color: colorScheme.tertiaryContainer,
        borderColor: colorScheme.tertiary,
      ),
      _ZIndexLayer(
        name: 'Snackbar',
        zIndex: M3ZIndexToken.snackbar.value,
        description: 'Snackbars, banners',
        color: colorScheme.errorContainer,
        borderColor: colorScheme.error,
      ),
      _ZIndexLayer(
        name: 'Tooltip',
        zIndex: M3ZIndexToken.tooltip.value,
        description: 'Tooltips, top layer',
        color: colorScheme.surface,
        borderColor: colorScheme.onSurface,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('M3ZIndex Tokens', style: textTheme.titleLarge),
        SizedBox(height: M3SpacingToken.space8.value),
        Text(
          'Stacking order from bottom to top (lower to higher z-index)',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        Container(
          height: 512,
          padding: EdgeInsets.all(M3SpacingToken.space16.value),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: M3BorderRadiusToken.medium.value,
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Stack(
            children: zIndexLayers.asMap().entries.map((entry) {
              final index = entry.key;
              final layer = entry.value;

              final offset = index * M3SpacingToken.space48.value;
              final scale = 1.0 - (index * 0.05);

              return Positioned(
                left: offset,
                top: offset * 1.5,
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 180,
                    height: 120,
                    decoration: BoxDecoration(
                      color: layer.color,
                      borderRadius: M3BorderRadiusToken.small.value,
                      border: Border.all(
                        color: layer.borderColor,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: Offset(0, index * 2.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(M3SpacingToken.space12.value),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            layer.name,
                            style: textTheme.titleSmall?.copyWith(
                              // color: _getTextColor(layer.color, colorScheme),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: M3SpacingToken.space4.value),
                          Text(
                            'z: ${layer.zIndex}',
                            style: textTheme.labelMedium?.copyWith(
                                // color: _getTextColor(layer.color, colorScheme),
                                ),
                          ),
                          SizedBox(height: M3SpacingToken.space4.value),
                          Text(
                            layer.description,
                            style: textTheme.bodySmall?.copyWith(
                                // color: _getTextColor(layer.color, colorScheme),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            borderRadius: M3BorderRadiusToken.medium.value,
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Column(
            children: zIndexLayers.map((layer) {
              return ListTile(
                leading: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: layer.color,
                    border: Border.all(color: layer.borderColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                title: Text(
                  layer.name,
                  style: textTheme.bodyLarge,
                ),
                subtitle: Text(
                  layer.description,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                trailing: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: M3SpacingToken.space8.value,
                    vertical: M3SpacingToken.space4.value,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: M3BorderRadiusToken.small.value,
                  ),
                  child: Text(
                    '${layer.zIndex}',
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
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
}

class _ZIndexLayer {
  const _ZIndexLayer({
    required this.name,
    required this.zIndex,
    required this.description,
    required this.color,
    required this.borderColor,
  });

  final String name;
  final int zIndex;
  final String description;
  final Color color;
  final Color borderColor;
}

// Color _getTextColor(Color backgroundColor, ColorScheme colorScheme) {
//   final luminance = backgroundColor.computeLuminance();
//   return luminance > 0.5 ? colorScheme.onSurface : colorScheme.onInverseSurface;
// }
