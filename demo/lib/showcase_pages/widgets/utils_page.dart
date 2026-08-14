import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Page demonstrating all enhanced M3 features in one comprehensive showcase.
class UtilsPage extends StatefulWidget {
  const UtilsPage({super.key});

  @override
  State<UtilsPage> createState() => _UtilsPageState();
}

class _UtilsPageState extends State<UtilsPage> {
  M3Elevation _elevation = M3Elevation.level2;
  bool _runAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M3 Utilities Showcase'),
      ),
      body: SingleChildScrollView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
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
              title: 'M3Contract — the escape hatch',
              icon: Icons.gavel_rounded,
              content: _buildContractShowcase(),
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
          style: M3TextUtils.responsiveDisplay(context),
        ),
        const M3Gap(M3Spacings.s8),
        Text(
          'This text has enhanced readability for better accessibility.',
          style: M3TextUtils.dyslexiaFriendly(textTheme.bodyLarge!),
        ),
        const M3Gap(M3Spacings.s16),
        _buildHighContrastShowcase(textTheme),
        const M3Gap(M3Spacings.s16),
        Container(
          width: double.infinity,
          padding: M3EdgeInsets.all(M3Spacings.s12),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            shape: M3Shape.small,
          ),
          child: Text(
            'function total(items) => items.reduce((a, b) => a + b.price, 0);',
            style: M3TextUtils.mono(textTheme.bodyMedium!),
          ),
        ),
      ],
    );
  }

  Widget _buildTonalSurfaceShowcase() {
    return Row(
      children: [
        Expanded(child: _buildSurfaceCard('Surface', M3Elevation.level0)),
        const M3Gap(M3Spacings.s8),
        Expanded(child: _buildSurfaceCard('Surface+1', M3Elevation.level1)),
        const M3Gap(M3Spacings.s8),
        Expanded(child: _buildSurfaceCard('Surface+3', M3Elevation.level2)),
      ],
    );
  }

  Widget _buildInteractiveElevationShowcase() {
    return Column(
      children: [
        Text(
          'Elevation: ${_elevation.dp.toStringAsFixed(0)}dp',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Slider(
          value: _elevation.dp,
          min: M3ElevationDps.level0,
          max: M3ElevationDps.level5,
          divisions: 12,
          label: '${_elevation.dp.round()}dp',
          onChanged: (newValue) {
            setState(() {
              _elevation = M3Elevation.fromValue(newValue);
            });
          },
        ),
        const M3Gap(M3Spacings.s8),
        AnimatedContainer(
          curve: M3Motion.standardCurve,
          duration: M3Motion.standardDuration,
          decoration: ShapeDecoration(
            color: _elevation.surfaceColor(context),
            shape: M3Shape.large,
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
    const animationCurve = M3Motion.emphasizedIncomingCurve;
    const animationDuration = M3Motion.emphasizedIncomingDuration;
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () => setState(() => _runAnimations = !_runAnimations),
          icon: Icon(_runAnimations ? Icons.visibility_off : Icons.visibility),
          label: Text(_runAnimations ? 'Hide' : 'Animate'),
        ),
        const M3Gap(M3Spacings.s16),
        AnimatedOpacity(
          opacity: _runAnimations ? 1.0 : 0.0,
          duration: animationDuration,
          curve: animationCurve,
          child: _buildMotionCard('Fade In', Icons.opacity),
        ),
        const M3Gap(M3Spacings.s8),
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
        const M3Gap(M3Spacings.s8),
        AnimatedScale(
          scale: _runAnimations ? 1.0 : 0.8,
          duration: animationDuration,
          curve: animationCurve,
          child: AnimatedOpacity(
            opacity: _runAnimations ? 1.0 : 0.0,
            duration: M3Motion.standardDuration,
            curve: Curves.easeIn,
            child: _buildMotionCard('Scale In', Icons.zoom_in_rounded),
          ),
        ),
      ],
    );
  }

  Widget _buildContractShowcase() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Every deliberate off-scale value routes through M3Contract, so a '
          'single grep audits all deviations from the Material Design 3 '
          'scales in your codebase:',
          style: textTheme.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        Container(
          width: double.infinity,
          padding: M3EdgeInsets.all(M3Spacings.s12),
          decoration: ShapeDecoration(
            color: colorScheme.surfaceContainer,
            shape: M3Shape.small,
          ),
          child: Text(
            r"grep -rn 'M3Contract\.' lib/",
            style: M3TextUtils.mono(M3TypeScale.bodySmall),
          ),
        ),
        const M3Gap(M3Spacings.s16),
        Container(
          padding: M3EdgeInsets.all(M3Contract.spacing(18)),
          decoration: ShapeDecoration(
            color: colorScheme.tertiaryContainer,
            shape: M3Shape.medium,
          ),
          child: Text(
            'This container uses M3EdgeInsets.all(M3Contract.spacing(18)) — '
            'an intentionally off-scale 18dp padding, made explicit and '
            'greppable.',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onTertiaryContainer,
            ),
          ),
        ),
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
          style: M3TextUtils.highContrast(textTheme.titleMedium!),
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
      margin: M3EdgeInsets.only(
        bottom: M3Spacings.s16,
      ),
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const M3Gap(M3Spacings.s12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const M3Gap(M3Spacings.s16),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildSurfaceCard(String label, M3Elevation elevation) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: elevation.surfaceColor(context),
        borderRadius: M3BorderRadius.medium,
        border: elevation == M3Elevation.level0
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
      padding: M3EdgeInsets.symmetric(
        horizontal: M3Spacings.s16,
        vertical: M3Spacings.s12,
      ),
      decoration: ShapeDecoration(
        color: colorScheme.secondaryContainer,
        shape: M3Shape.medium,
      ),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.onSecondaryContainer),
          const M3Gap(M3Spacings.s12),
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
}
