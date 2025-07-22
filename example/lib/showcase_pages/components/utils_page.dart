import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Page demonstrating all enhanced M3 features in one comprehensive showcase.
class UtilsPage extends StatefulWidget {
  const UtilsPage({super.key});

  @override
  State<UtilsPage> createState() => _UtilsPageState();
}

class _UtilsPageState extends State<UtilsPage> {
  double _elevation = 3.0;
  bool _runAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M3 Utilities Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(M3Spacing.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Enhanced Typography',
              icon: Icons.text_fields_rounded,
              content: _buildTypographyShowcase(),
            ),
            _buildSection(
              title: 'Tonal Surfaces',
              icon: Icons.invert_colors_on_rounded,
              content: _buildTonalSurfaceShowcase(),
            ),
            _buildSection(
              title: 'Interactive Elevation',
              icon: Icons.layers_rounded,
              content: _buildInteractiveElevationShowcase(),
            ),
            _buildSection(
              title: 'Motion Patterns',
              icon: Icons.animation_rounded,
              content: _buildMotionPatternsShowcase(),
            ),
            _buildSection(
              title: 'Shape System',
              icon: Icons.rounded_corner_rounded,
              content: _buildShapeShowcase(),
            ),
          ],
        ),
      ),
    );
  }

  // --- Main Section Widgets ---

  Widget _buildTypographyShowcase() {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Responsive Display Text',
          style: M3TypeScale.responsiveDisplay(context),
        ),
        const SizedBox(height: M3Spacing.space8),
        Text(
          'This text has enhanced readability for better accessibility.',
          style: M3TypeScale.enhancedReadability(textTheme.bodyLarge!),
        ),
        const SizedBox(height: M3Spacing.space16),
        _buildHighContrastShowcase(textTheme),
        const SizedBox(height: M3Spacing.space16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(M3Spacing.space12),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            shape: M3Shape.small,
          ),
          child: Text(
            'function total(items) => items.reduce((a, b) => a + b.price, 0);',
            style: M3TypeScale.monoVariant(textTheme.bodyMedium!),
          ),
        ),
      ],
    );
  }

  Widget _buildTonalSurfaceShowcase() {
    return Row(
      children: [
        Expanded(child: _buildSurfaceCard('Surface', 0)),
        const SizedBox(width: M3Spacing.space8),
        Expanded(child: _buildSurfaceCard('Surface+1', 1)),
        const SizedBox(width: M3Spacing.space8),
        Expanded(child: _buildSurfaceCard('Surface+3', 3)),
      ],
    );
  }

  Widget _buildInteractiveElevationShowcase() {
    return Column(
      children: [
        Text(
          'Elevation: ${_elevation.toStringAsFixed(0)}dp',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Slider(
          value: _elevation,
          min: 0,
          max: 24,
          divisions: 24,
          label: '${_elevation.round()}dp',
          onChanged: (value) => setState(() => _elevation = value),
        ),
        const SizedBox(height: M3Spacing.space8),
        AnimatedContainer(
          duration: M3MotionDuration.medium2,
          curve: M3MotionEasing.standard,
          decoration: ShapeDecoration(
            color: M3TonalColor.surfaceAt(context, _elevation),
            shape: M3Shape.large,
            shadows: M3Shadow.fromElevation(_elevation),
          ),
          child: ListTile(
            leading: const Icon(Icons.layers),
            title: const Text('Dynamic Elevation Card'),
            subtitle: Text('Surface tint and shadow change together.'),
          ),
        ),
      ],
    );
  }

  Widget _buildMotionPatternsShowcase() {
    const animationDuration = M3MotionDuration.long1;
    final animationCurve = M3MotionEasing.emphasizedDecelerate;
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () => setState(() => _runAnimations = !_runAnimations),
          icon: Icon(_runAnimations ? Icons.visibility_off : Icons.visibility),
          label: Text(_runAnimations ? 'Hide' : 'Animate'),
        ),
        const SizedBox(height: M3Spacing.space16),
        AnimatedOpacity(
          opacity: _runAnimations ? 1.0 : 0.0,
          duration: animationDuration,
          curve: animationCurve,
          child: _buildMotionCard('Fade In', Icons.opacity),
        ),
        const SizedBox(height: M3Spacing.space8),
        AnimatedSlide(
          offset: _runAnimations ? Offset.zero : const Offset(0, 0.5),
          duration: animationDuration,
          curve: animationCurve,
          child: AnimatedOpacity(
            opacity: _runAnimations ? 1.0 : 0.0,
            duration: animationDuration,
            curve: Curves.easeIn,
            child: _buildMotionCard('Slide Up', Icons.arrow_upward_rounded),
          ),
        ),
        const SizedBox(height: M3Spacing.space8),
        AnimatedScale(
          scale: _runAnimations ? 1.0 : 0.8,
          duration: animationDuration,
          curve: animationCurve,
          child: AnimatedOpacity(
            opacity: _runAnimations ? 1.0 : 0.0,
            duration: M3MotionDuration.medium2,
            curve: Curves.easeIn,
            child: _buildMotionCard('Scale In', Icons.zoom_in_rounded),
          ),
        ),
      ],
    );
  }

  Widget _buildShapeShowcase() {
    return Wrap(
      spacing: M3Spacing.space8,
      runSpacing: M3Spacing.space8,
      alignment: WrapAlignment.center,
      children: [
        // TODO(kevin): enhance this feature
        _buildShapeExample('None', M3ShapeUtils.squared()),
        _buildShapeExample('XS', M3ShapeUtils.rounded(M3Radius.extraSmall.x)),
        _buildShapeExample('Small', M3ShapeUtils.rounded(M3Radius.small.x)),
        _buildShapeExample('Medium', M3ShapeUtils.rounded(M3Radius.medium.x)),
        _buildShapeExample('Large', M3ShapeUtils.rounded(M3Radius.large.x)),
        _buildShapeExample('XL', M3ShapeUtils.rounded(M3Radius.extraLarge.x)),
        _buildShapeExample('Top', M3ShapeUtils.topRounded(M3Radius.large.x)),
        _buildShapeExample(
            'Bottom', M3ShapeUtils.bottomRounded(M3Radius.large.x)),
      ],
    );
  }

  // --- Helper Widgets ---

  Widget _buildHighContrastShowcase(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Standard Contrast',
          style: textTheme.titleMedium,
        ),
        Text(
          'High Contrast',
          style: M3TypeScale.highContrast(textTheme.titleMedium!),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget content,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: M3Spacing.space16),
      child: Padding(
        padding: const EdgeInsets.all(M3Spacing.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: M3Spacing.space12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: M3Spacing.space16),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildSurfaceCard(String label, double elevation) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: M3TonalColor.surfaceAt(context, elevation),
        borderRadius: M3BorderRadius.medium,
        border: elevation == 0
            ? Border.all(color: Theme.of(context).colorScheme.outlineVariant)
            : null,
      ),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  Widget _buildMotionCard(String label, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: M3Spacing.space16,
        vertical: M3Spacing.space12,
      ),
      decoration: ShapeDecoration(
        color: colorScheme.secondaryContainer,
        shape: M3Shape.medium,
      ),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.onSecondaryContainer),
          const SizedBox(width: M3Spacing.space12),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: colorScheme.onSecondaryContainer),
          ),
        ],
      ),
    );
  }

  Widget _buildShapeExample(String label, BorderRadius borderRadius) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiaryContainer),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
