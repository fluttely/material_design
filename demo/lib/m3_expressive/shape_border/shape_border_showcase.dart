// M3EShapeBorder, M3EShapeMorph, M3EShapes and M3ERoundedPolygon are
// @experimental; a showcase of the shape engine necessarily opts in.
// ignore_for_file: experimental_member_use

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Demonstrates [M3EShapeBorder]: the Expressive shape library exposed as an
/// [OutlinedBorder], so any Flutter API that takes a shape can draw one.
class ShapeBorderShowcase extends StatefulWidget {
  const ShapeBorderShowcase({super.key});

  @override
  State<ShapeBorderShowcase> createState() => _ShapeBorderShowcaseState();
}

class _ShapeBorderShowcaseState extends State<ShapeBorderShowcase> {
  /// `M3EShapes` members are `static final`, so this list cannot be `const`.
  static final List<({M3ERoundedPolygon shape, String label})> _tiles = [
    (shape: M3EShapes.clover4Leaf, label: '4-leaf clover'),
    (shape: M3EShapes.cookie7Sided, label: '7-sided cookie'),
    (shape: M3EShapes.sunny, label: 'Sunny'),
    (shape: M3EShapes.burst, label: 'Burst'),
    (shape: M3EShapes.pill, label: 'Pill'),
    (shape: M3EShapes.arch, label: 'Arch'),
    (shape: M3EShapes.heart, label: 'Heart'),
  ];

  /// Which end of the morph the two demos are resting on.
  bool _morphed = false;

  /// Taps on the clipped-ripple surface, proving the `InkWell` is live.
  int _rippleTaps = 0;

  void _toggleMorph() => setState(() => _morphed = !_morphed);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shapes as a ShapeBorder', style: textTheme.titleMedium),
        const M3Gap(M3Spacings.s8),
        Text(
          'Every tile below is a plain Material with '
          'shape: M3EShapeBorder(...). No CustomPainter, no clipper — the '
          'polygon is the border, so Card, Material, ShapeDecoration and '
          'InkWell all accept it.',
          style: textTheme.bodyMedium,
        ),
        const M3Gap(M3Spacings.s16),
        _buildShapeGrid(context),
        const M3Gap(M3Spacings.s32),
        Text('Ripples clip to the shape', style: textTheme.titleMedium),
        const M3Gap(M3Spacings.s8),
        Text(
          'Because the shape is a real border, Material can clip to it. '
          'Tap the clover: the ink splash stops at the petals.',
          style: textTheme.bodyMedium,
        ),
        const M3Gap(M3Spacings.s16),
        _buildRippleDemo(context),
        const M3Gap(M3Spacings.s32),
        Text('Morphing for free', style: textTheme.titleMedium),
        const M3Gap(M3Spacings.s8),
        Text(
          'Tap either shape. The left one is an AnimatedContainer whose '
          'ShapeDecoration.shape is an M3EShapeBorder; the right one is '
          'M3EShapeMorph, the ready-made wrapper around the same idea.',
          style: textTheme.bodyMedium,
        ),
        const M3Gap(M3Spacings.s16),
        _buildMorphDemos(context),
        const M3Gap(M3Spacings.s12),
        _buildMorphCaption(context),
      ],
    );
  }

  /// Eight shapes drawn with nothing but `Material(shape:)`, the last one
  /// carrying a visible outline through `side:`.
  Widget _buildShapeGrid(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: M3Spacings.s16,
      runSpacing: M3Spacings.s16,
      children: [
        for (final tile in _tiles)
          _ShapeTile(
            shape: tile.shape,
            label: tile.label,
            color: colorScheme.primaryContainer,
          ),
        // The outline comes from `side:` on the border itself, which strokes
        // the polygon rather than a rounded rectangle around it.
        _ShapeTile(
          shape: M3EShapes.gem,
          label: 'Gem (side:)',
          color: colorScheme.surfaceContainerLowest,
          side: M3BorderSide.thick(colorScheme.primary),
        ),
      ],
    );
  }

  Widget _buildRippleDemo(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      spacing: M3Spacings.s16,
      runSpacing: M3Spacings.s16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Material(
          color: colorScheme.secondaryContainer,
          shape: M3EShapeBorder(M3EShapes.clover4Leaf),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => setState(() => _rippleTaps++),
            child: SizedBox(
              width: M3Spacings.s128,
              height: M3Spacings.s128,
              child: Center(
                child: Text(
                  'Tap',
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          _rippleTaps == 0
              ? 'clipBehavior: Clip.antiAlias'
              : 'Splashes: $_rippleTaps',
          style: textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildMorphDemos(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      spacing: M3Spacings.s16,
      runSpacing: M3Spacings.s16,
      children: [
        // Implicit animation: only the decoration changes, and the shape
        // lerp does the morph.
        GestureDetector(
          onTap: _toggleMorph,
          child: AnimatedContainer(
            duration: M3Motion.emphasized.duration,
            curve: M3Motion.emphasized.curve,
            width: M3Spacings.s128,
            height: M3Spacings.s128,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: _morphed
                  ? colorScheme.tertiaryContainer
                  : colorScheme.primaryContainer,
              shape: M3EShapeBorder(
                _morphed ? M3EShapes.burst : M3EShapes.circle,
              ),
            ),
            child: Text(
              _morphed ? 'Burst' : 'Circle',
              style: textTheme.labelLarge?.copyWith(
                color: _morphed
                    ? colorScheme.onTertiaryContainer
                    : colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
        // The same morph, packaged.
        GestureDetector(
          onTap: _toggleMorph,
          child: SizedBox(
            width: M3Spacings.s128,
            height: M3Spacings.s128,
            child: M3EShapeMorph(
              shape: _morphed ? M3EShapes.pill : M3EShapes.cookie9Sided,
              color: colorScheme.secondaryContainer,
              duration: M3Motion.emphasized.duration,
              curve: M3Motion.emphasized.curve,
              child: Center(
                child: Text(
                  _morphed ? 'Pill' : 'Cookie',
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMorphCaption(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: M3EdgeInsets.all(M3Spacings.s12),
      decoration: M3BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: M3BorderRadius.medium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.auto_awesome_outlined,
            size: M3IconSizes.dense,
            color: colorScheme.onSurfaceVariant,
          ),
          const M3Gap(M3Spacings.s12),
          Expanded(
            child: Text(
              'The in-between frames are not a crossfade. Lerping two '
              'M3EShapeBorder instances runs the real M3EMorph algorithm on the '
              'polygons, so the outline itself travels from one shape to the '
              'other — which is why an ordinary implicit animation is enough.',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A single shape rendered as `Material(shape: M3EShapeBorder(...))`.
class _ShapeTile extends StatelessWidget {
  const _ShapeTile({
    required this.shape,
    required this.label,
    required this.color,
    this.side = BorderSide.none,
  });

  final M3ERoundedPolygon shape;
  final String label;
  final Color color;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: M3Spacings.s96,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: color,
            shape: M3EShapeBorder(shape, side: side),
            child: SizedBox.square(dimension: M3Spacings.s80),
          ),
          const M3Gap(M3Spacings.s8),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
