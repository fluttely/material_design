import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

/// Shows the component-layer measurements: the heights and sizes the M3 spec
/// fixes for buttons, FABs, app bars, navigation and list items.
///
/// The package ships the numbers, not the components — so each family is drawn
/// here at its real size rather than through a Flutter widget.
class ComponentTokensPage extends StatelessWidget {
  const ComponentTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Component Tokens')),
      body: ListView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        children: [
          Text(
            'The component token layer is deliberately only values. Every box '
            'below is drawn at the exact dp the spec fixes, typed as '
            'M3SpacingValue.',
            style: textTheme.bodyMedium,
          ),
          const M3Gap(M3Spacings.s16),
          _buildTouchTargetWarning(context),
          _buildButtonHeights(context),
          _buildFabSizes(context),
          _buildAppBarHeights(context),
          _buildNavigationSizes(context),
          _buildListItemHeights(context),
        ],
      ),
    );
  }

  /// The 32dp/40dp caveat, stated before the button heights it applies to.
  Widget _buildTouchTargetWarning(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: M3EdgeInsets.all(M3Spacings.s16),
      decoration: M3BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: M3BorderRadius.medium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: M3IconSizes.standard,
            color: colorScheme.onErrorContainer,
          ),
          const M3Gap(M3Spacings.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visual height is not touch target',
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onErrorContainer,
                  ),
                ),
                const M3Gap(M3Spacings.s4),
                Text(
                  'M3ButtonHeights.extraSmall (32dp) and .small (40dp) sit '
                  'below the '
                  '${M3Accessibility.minTouchTargetMobile.toInt()}dp mobile '
                  'minimum. A control at those heights must expand its tap '
                  'area, not its box — Flutter does this with '
                  'MaterialTapTargetSize.padded.',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onErrorContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonHeights(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    const labels = <String>[
      'extraSmall',
      'small',
      'medium',
      'large',
      'extraLarge',
    ];

    return _Section(
      tokenName: 'M3ButtonHeights',
      m3Url: 'https://m3.material.io/components/buttons/specs',
      description:
          'M3 Expressive replaced the single 40dp button with a five-step '
          'scale, so a button can match the density around it.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < M3ButtonHeights.values.length; i++)
            _MeasuredBar(
              label: labels[i],
              value: M3ButtonHeights.values[i],
              color: colorScheme.primaryContainer,
              foregroundColor: colorScheme.onPrimaryContainer,
              // Only the two heights the warning above calls out.
              flagged: M3ButtonHeights.values[i] <
                  M3Accessibility.minTouchTargetMobile,
              flagLabel: 'below 48dp',
            ),
        ],
      ),
    );
  }

  Widget _buildFabSizes(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    const labels = <String>['small', 'standard', 'large'];

    return _Section(
      tokenName: 'M3FabSizes',
      m3Url: 'https://m3.material.io/components/floating-action-button/specs',
      description: 'Container sizes for the floating action button, drawn '
          'square at their true dp.',
      child: Wrap(
        spacing: M3Spacings.s16,
        runSpacing: M3Spacings.s16,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          for (var i = 0; i < M3FabSizes.values.length; i++)
            SizedBox(
              width: M3Spacings.s96,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: M3FabSizes.values[i],
                    height: M3FabSizes.values[i],
                    decoration: M3BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                      borderRadius: M3BorderRadius.large,
                    ),
                    child: Icon(
                      Icons.add,
                      size: M3IconSizes.standard,
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
                  const M3Gap(M3Spacings.s8),
                  Text(
                    '${labels[i]}\n${M3FabSizes.values[i].toInt()}dp',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAppBarHeights(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    const labels = <String>['small', 'medium', 'large'];

    return _Section(
      tokenName: 'M3AppBarHeights',
      m3Url: 'https://m3.material.io/components/top-app-bar/specs',
      description: 'The three top app bar heights, plus the bottom app bar / '
          'docked toolbar, which values excludes because it is a different '
          'component.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < M3AppBarHeights.values.length; i++)
            _MeasuredBar(
              label: labels[i],
              value: M3AppBarHeights.values[i],
              color: colorScheme.secondaryContainer,
              foregroundColor: colorScheme.onSecondaryContainer,
            ),
          const M3Gap(M3Spacings.s8),
          Text('Not in values:', style: textTheme.labelMedium),
          const M3Gap(M3Spacings.s8),
          _MeasuredBar(
            label: 'bottom',
            value: M3AppBarHeights.bottom,
            color: colorScheme.surfaceContainerHighest,
            foregroundColor: colorScheme.onSurface,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationSizes(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    const widths = <(String, M3SpacingValue)>[
      ('railWidth', M3NavigationSizes.railWidth),
      ('extendedRailWidth', M3NavigationSizes.extendedRailWidth),
      ('drawerWidth', M3NavigationSizes.drawerWidth),
    ];

    return _Section(
      tokenName: 'M3NavigationSizes',
      m3Url: 'https://m3.material.io/components/navigation-rail/specs',
      description: 'Heights and widths for the navigation family. The widths '
          'are drawn at true scale, so scroll them sideways on a compact '
          'window — the 360dp drawer is wider than the window itself.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MeasuredBar(
            label: 'barHeight',
            value: M3NavigationSizes.barHeight,
            color: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimaryContainer,
          ),
          _MeasuredBar(
            label: 'indicatorHeight',
            value: M3NavigationSizes.indicatorHeight,
            color: colorScheme.secondaryContainer,
            foregroundColor: colorScheme.onSecondaryContainer,
          ),
          const M3Gap(M3Spacings.s8),
          Text('Widths, at true scale:', style: textTheme.labelMedium),
          const M3Gap(M3Spacings.s8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final (label, value) in widths)
                  M3Padding(
                    padding: M3EdgeInsets.only(bottom: M3Spacings.s12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$label · ${value.toInt()}dp',
                          style: textTheme.labelMedium,
                        ),
                        const M3Gap(M3Spacings.s4),
                        Container(
                          width: value,
                          height: M3Spacings.s24,
                          decoration: M3BoxDecoration(
                            color: colorScheme.tertiaryContainer,
                            borderRadius: M3BorderRadius.small,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItemHeights(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    const items = <(String, M3SpacingValue, int)>[
      ('oneLine', M3ListItemHeights.oneLine, 1),
      ('twoLine', M3ListItemHeights.twoLine, 2),
      ('threeLine', M3ListItemHeights.threeLine, 3),
    ];

    return _Section(
      tokenName: 'M3ListItemHeights',
      m3Url: 'https://m3.material.io/components/lists/specs',
      description: 'List item height follows the number of text lines the '
          'item carries.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (label, value, lines) in items)
            M3Padding(
              padding: M3EdgeInsets.only(bottom: M3Spacings.s12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$label · ${value.toInt()}dp',
                    style: textTheme.labelMedium,
                  ),
                  const M3Gap(M3Spacings.s4),
                  Container(
                    height: value,
                    padding: M3EdgeInsets.symmetric(
                      horizontal: M3Spacings.s16,
                    ),
                    decoration: M3BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: M3BorderRadius.medium,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: M3Spacings.s40,
                          height: M3Spacings.s40,
                          decoration: M3BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: M3BorderRadius.full,
                          ),
                          child: Icon(
                            Icons.person_outline,
                            size: M3IconSizes.dense,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const M3Gap(M3Spacings.s16),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Headline',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyLarge,
                              ),
                              if (lines > 1)
                                Text(
                                  lines == 2
                                      ? 'Supporting text'
                                      : 'Supporting text that runs on',
                                  maxLines: lines - 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// A token family: its name as a link, a sentence of context, and the visual.
class _Section extends StatelessWidget {
  const _Section({
    required this.tokenName,
    required this.m3Url,
    required this.description,
    required this.child,
  });

  final String tokenName;
  final String m3Url;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LaunchURLText(label: tokenName, url: m3Url),
        Text(description, style: textTheme.bodyMedium),
        const M3Gap(M3Spacings.s16),
        child,
        const M3Gap(M3Spacings.s24),
      ],
    );
  }
}

/// A full-width bar drawn at the token's exact height, labelled with its dp.
class _MeasuredBar extends StatelessWidget {
  const _MeasuredBar({
    required this.label,
    required this.value,
    required this.color,
    required this.foregroundColor,
    this.flagged = false,
    this.flagLabel,
  });

  final String label;
  final M3SpacingValue value;
  final Color color;
  final Color foregroundColor;

  /// Whether to mark this value as failing a guideline.
  final bool flagged;
  final String? flagLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return M3Padding(
      padding: M3EdgeInsets.only(bottom: M3Spacings.s12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(label, style: textTheme.labelMedium)),
              if (flagged && flagLabel != null)
                Container(
                  padding: M3EdgeInsets.symmetric(
                    horizontal: M3Spacings.s8,
                    vertical: M3Spacings.s4,
                  ),
                  decoration: M3BoxDecoration(
                    color: colorScheme.errorContainer,
                    borderRadius: M3BorderRadius.full,
                  ),
                  child: Text(
                    flagLabel!,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                ),
            ],
          ),
          const M3Gap(M3Spacings.s4),
          Container(
            height: value,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: M3EdgeInsets.symmetric(horizontal: M3Spacings.s12),
            decoration: M3BoxDecoration(
              color: color,
              borderRadius: M3BorderRadius.small,
              border: flagged
                  ? M3Border.thick(colorScheme.error)
                  : const M3Border(),
            ),
            child: Text(
              '${value.toInt()}dp',
              style: textTheme.labelLarge?.copyWith(color: foregroundColor),
            ),
          ),
        ],
      ),
    );
  }
}
