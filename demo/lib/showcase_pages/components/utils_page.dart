import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Page demonstrating all enhanced M3 features in one comprehensive showcase.
class UtilsPage extends StatefulWidget {
  const UtilsPage({super.key});

  @override
  State<UtilsPage> createState() => _UtilsPageState();
}

class _UtilsPageState extends State<UtilsPage> {
  M3ElevationToken _elevation = M3ElevationToken.level2;
  bool _runAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M3 Utilities Showcase'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
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
          style: M3TextStyleToken.responsiveDisplay(context),
        ),
        SizedBox(height: M3SpacingToken.space8.value),
        Text(
          'This text has enhanced readability for better accessibility.',
          style: M3TextStyleToken.enhancedReadability(textTheme.bodyLarge!),
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildHighContrastShowcase(textTheme),
        SizedBox(height: M3SpacingToken.space16.value),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(M3SpacingToken.space12.value),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            shape: M3ShapeToken.small.value,
          ),
          child: Text(
            'function total(items) => items.reduce((a, b) => a + b.price, 0);',
            style: M3TextStyleToken.monoVariant(textTheme.bodyMedium!),
          ),
        ),
      ],
    );
  }

  Widget _buildTonalSurfaceShowcase() {
    return Row(
      children: [
        Expanded(child: _buildSurfaceCard('Surface', M3ElevationToken.level0)),
        SizedBox(width: M3SpacingToken.space8.value),
        Expanded(
            child: _buildSurfaceCard('Surface+1', M3ElevationToken.level1)),
        SizedBox(width: M3SpacingToken.space8.value),
        Expanded(
            child: _buildSurfaceCard('Surface+3', M3ElevationToken.level2)),
      ],
    );
  }

  Widget _buildInteractiveElevationShowcase() {
    return Column(
      children: [
        Text(
          'Elevation: ${_elevation.value.toStringAsFixed(0)}dp',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Slider(
          value: _elevation.value,
          min: M3ElevationToken.level0.value,
          max: M3ElevationToken.level5.value,
          divisions: 12,
          label: '${_elevation.value.round()}dp',
          onChanged: (newValue) {
            setState(() {
              _elevation = M3ElevationToken.fromValue(newValue);
            });
          },
        ),
        SizedBox(height: M3SpacingToken.space8.value),
        AnimatedContainer(
          duration: M3MotionDurationToken.medium2.value,
          curve: M3MotionEasingToken.standard.value,
          decoration: ShapeDecoration(
            color: _elevation.surfaceColor(context),
            shape: M3ShapeToken.large.value,
            shadows: _elevation.shadows,
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
    const animationDuration = M3MotionDurationToken.long1;
    final animationCurve = M3MotionEasingToken.emphasizedDecelerate;
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () => setState(() => _runAnimations = !_runAnimations),
          icon: Icon(_runAnimations ? Icons.visibility_off : Icons.visibility),
          label: Text(_runAnimations ? 'Hide' : 'Animate'),
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        AnimatedOpacity(
          opacity: _runAnimations ? 1.0 : 0.0,
          duration: animationDuration.value,
          curve: animationCurve.value,
          child: _buildMotionCard('Fade In', Icons.opacity),
        ),
        SizedBox(height: M3SpacingToken.space8.value),
        AnimatedSlide(
          offset: _runAnimations ? Offset.zero : const Offset(0, 0.5),
          duration: animationDuration.value,
          curve: animationCurve.value,
          child: AnimatedOpacity(
            opacity: _runAnimations ? 1.0 : 0.0,
            duration: animationDuration.value,
            curve: Curves.easeIn,
            child: _buildMotionCard('Slide Up', Icons.arrow_upward_rounded),
          ),
        ),
        SizedBox(height: M3SpacingToken.space8.value),
        AnimatedScale(
          scale: _runAnimations ? 1.0 : 0.8,
          duration: animationDuration.value,
          curve: animationCurve.value,
          child: AnimatedOpacity(
            opacity: _runAnimations ? 1.0 : 0.0,
            duration: M3MotionDurationToken.medium2.value,
            curve: Curves.easeIn,
            child: _buildMotionCard('Scale In', Icons.zoom_in_rounded),
          ),
        ),
      ],
    );
  }

  Widget _buildShapeShowcase() {
    return Wrap(
      spacing: M3SpacingToken.space8.value,
      runSpacing: M3SpacingToken.space8.value,
      alignment: WrapAlignment.center,
      children: [
        // TODO(kevin): enhance this feature
        _buildShapeExample('None', M3ShapeUtils.squared()),
        _buildShapeExample(
            'XS', M3ShapeUtils.rounded(M3RadiusToken.extraSmall.value.x)),
        _buildShapeExample(
            'Small', M3ShapeUtils.rounded(M3RadiusToken.small.value.x)),
        _buildShapeExample(
            'Medium', M3ShapeUtils.rounded(M3RadiusToken.medium.value.x)),
        _buildShapeExample(
            'Large', M3ShapeUtils.rounded(M3RadiusToken.large.value.x)),
        _buildShapeExample(
            'XL', M3ShapeUtils.rounded(M3RadiusToken.extraLarge.value.x)),
        _buildShapeExample(
            'Top', M3ShapeUtils.topRounded(M3RadiusToken.large.value.x)),
        _buildShapeExample(
            'Bottom', M3ShapeUtils.bottomRounded(M3RadiusToken.large.value.x)),
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
          style: M3TextStyleToken.highContrast(textTheme.titleMedium!),
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
      margin: EdgeInsets.only(bottom: M3SpacingToken.space16.value),
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: M3SpacingToken.space12.value),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            SizedBox(height: M3SpacingToken.space16.value),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildSurfaceCard(String label, M3ElevationToken elevation) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: elevation.surfaceColor(context),
        borderRadius: M3ShapeToken.medium.value.borderRadius,
        border: elevation.value == 0
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
      padding: EdgeInsets.symmetric(
        horizontal: M3SpacingToken.space16.value,
        vertical: M3SpacingToken.space12.value,
      ),
      decoration: ShapeDecoration(
        color: colorScheme.secondaryContainer,
        shape: M3ShapeToken.medium.value,
      ),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.onSecondaryContainer),
          SizedBox(width: M3SpacingToken.space12.value),
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
