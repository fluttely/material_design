import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// A page that visually demonstrates Material Design 3 responsive breakpoints.
class BreakpointTokensPage extends StatelessWidget {
  const BreakpointTokensPage({super.key});

  // A single, static source of truth for all breakpoint data.
  static const _breakpoints = [
    (
      label: 'Compact',
      min: M3BreakpointToken.compact,
      icon: Icons.phone_iphone_rounded
    ),
    (
      label: 'Medium',
      min: M3BreakpointToken.medium,
      icon: Icons.tablet_mac_rounded
    ),
    (
      label: 'Expanded',
      min: M3BreakpointToken.expanded,
      icon: Icons.laptop_mac_rounded
    ),
    (
      label: 'Large',
      min: M3BreakpointToken.large,
      icon: Icons.desktop_mac_rounded
    ),
    (
      label: 'Extra Large',
      min: M3BreakpointToken.extraLarge,
      icon: Icons.tv_rounded
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Get the current screen width once.
    final double currentWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('M3Breakpoints')),
      body: ListView(
        padding: M3EdgeInsets.all(M3SpacingToken.space16),
        children: [
          Card(
            child: M3Padding(
              padding: M3EdgeInsets.all(M3SpacingToken.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Live Breakpoint Demo',
                    style: textTheme.headlineSmall,
                  ),
                  const M3Gap(M3SpacingToken.space8),
                  Text(
                    'Your current screen width is ${currentWidth.toInt()}dp. The active breakpoint is highlighted below.',
                    style: textTheme.bodyMedium,
                  ),
                  const M3Gap(M3SpacingToken.space40),
                  _BreakpointVisualizer(
                    breakpoints: _breakpoints,
                    currentWidth: currentWidth,
                  ),
                  const M3Gap(M3SpacingToken.space16),
                  const Divider(),
                  const M3Gap(M3SpacingToken.space16),
                  // Generate the list of breakpoints from the single source of truth.
                  ..._buildBreakpointList(context, currentWidth),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Builds the list of breakpoint information rows.
  List<Widget> _buildBreakpointList(BuildContext context, double currentWidth) {
    return List.generate(_breakpoints.length, (index) {
      final current = _breakpoints[index];
      // Determine the max width by looking at the start of the next breakpoint.
      final double max = (index < _breakpoints.length - 1)
          ? _breakpoints[index + 1].min.value - 1
          : double.infinity;
      // Check if the current screen width falls into this breakpoint's range.
      final bool isActive = currentWidth >= current.min.value &&
          (max == double.infinity || currentWidth <= max);

      return _BreakpointInfoRow(
        label: current.label,
        icon: current.icon,
        min: current.min.value,
        max: max,
        isActive: isActive,
      );
    });
  }
}

/// A row widget to display information about a single breakpoint.
class _BreakpointInfoRow extends StatelessWidget {
  const _BreakpointInfoRow({
    required this.label,
    required this.icon,
    required this.min,
    required this.max,
    required this.isActive,
  });

  final String label;
  final IconData icon;
  final double min;
  final double max;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final rangeText = max == double.infinity
        ? '${min.toInt()}dp+'
        : '${min.toInt()}dp - ${max.toInt()}dp';

    return M3Padding(
      padding: M3EdgeInsets.symmetric(
        vertical: M3SpacingToken.space8,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isActive
                ? colorScheme.primary
                : colorScheme.surfaceContainerHighest,
          ),
          const M3Gap(M3SpacingToken.space16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textTheme.titleMedium?.copyWith(
                  color: isActive
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHighest,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Text(
                rangeText,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A widget that visually represents the breakpoint ranges and the current width.
class _BreakpointVisualizer extends StatelessWidget {
  const _BreakpointVisualizer({
    required this.breakpoints,
    required this.currentWidth,
  });

  final List<({String label, IconData icon, M3BreakpointToken min})>
      breakpoints;
  final double currentWidth;

  @override
  Widget build(BuildContext context) {
    // Define a practical max width for visualization purposes.
    const double visualizationMaxWidth = 1600.0;
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double barWidth = constraints.maxWidth;
        // Calculate the position of the marker on the bar.
        final double markerPosition =
            (currentWidth / visualizationMaxWidth).clamp(0.0, 1.0) * barWidth;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            // The main bar showing breakpoint ranges.
            Container(
              height: 32,
              decoration: ShapeDecoration(shape: M3Shape.full),
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: List.generate(breakpoints.length, (index) {
                  final current = breakpoints[index];
                  final nextMin = (index < breakpoints.length - 1)
                      ? breakpoints[index + 1].min.value
                      : visualizationMaxWidth;
                  final rangeWidth = nextMin - current.min.value;
                  final bool isActive = currentWidth >= current.min.value &&
                      currentWidth < nextMin;

                  return Expanded(
                    flex: rangeWidth.round(),
                    child: Container(
                      color: isActive
                          ? colorScheme.primary
                          : colorScheme.surfaceContainerHighest,
                      child: Center(
                        child: Text(
                          current.label,
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: isActive
                                        ? colorScheme.onPrimary
                                        : colorScheme.onSurfaceVariant,
                                  ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            // The marker indicating the current screen width.
            Positioned(
              top: -32,
              left: markerPosition - 12,
              child: Column(
                children: [
                  Text(
                    '${currentWidth.toInt()}dp',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Icon(Icons.arrow_drop_down, color: colorScheme.primary),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
