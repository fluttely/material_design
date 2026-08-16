import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';
import 'package:material_design_demo/theme/theme_provider.dart';
import 'package:provider/provider.dart';

/// The brand colors used by the harmonization and extended color sections.
///
/// They are deliberately off-palette: a status green, a warning amber and an
/// info blue that no seed would produce on its own.
const _brandColors = <({String name, Color color})>[
  (name: 'success', color: Color(0xFF2E7D32)),
  (name: 'warning', color: Color(0xFFF9A825)),
  (name: 'info', color: Color(0xFF0277BD)),
];

/// Demonstrates M3ColorSchemes, M3SchemeVariant, M3ContrastLevels,
/// M3ColorUtils.harmonize and M3ExtendedColor.
class ColorSchemesPage extends StatefulWidget {
  const ColorSchemesPage({super.key});

  @override
  State<ColorSchemesPage> createState() => _ColorSchemesPageState();
}

class _ColorSchemesPageState extends State<ColorSchemesPage> {
  M3SchemeVariant _variant = M3SchemeVariant.tonalSpot;
  M3ContrastLevelValue _contrastLevel = M3ContrastLevels.standard;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final seedColor = Provider.of<ThemeProvider>(context).seedColor;

    return Scaffold(
      appBar: AppBar(title: const Text('Color Schemes')),
      body: ListView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        children: [
          ShowcaseLink(
            label: 'M3ColorSchemes | M3SchemeVariant | M3ContrastLevels',
            url:
                'https://m3.material.io/styles/color/system/how-the-system-works',
          ),
          _buildSeedSection(context, colorScheme, seedColor, brightness),
          const M3Gap(M3Spacings.s16),
          _buildVariantSection(context, colorScheme, seedColor, brightness),
          const M3Gap(M3Spacings.s24),
          _buildContrastSection(context, colorScheme, seedColor, brightness),
          const M3Gap(M3Spacings.s24),
          _buildHarmonizationSection(context, colorScheme),
          const M3Gap(M3Spacings.s24),
          _buildExtendedColorsSection(context, colorScheme, brightness),
          const M3Gap(M3Spacings.s24),
          _buildPlatformContrastSection(context, colorScheme),
        ],
      ),
    );
  }

  /// The seed the whole page derives from — the demo's own theme seed.
  Widget _buildSeedSection(
    BuildContext context,
    ColorScheme cs,
    Color seedColor,
    Brightness brightness,
  ) {
    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Row(
          children: [
            Container(
              width: M3Spacings.s48,
              height: M3Spacings.s48,
              decoration: M3BoxDecoration(
                color: seedColor,
                borderRadius: M3BorderRadius.medium,
                border: M3Border.thin(cs.outlineVariant),
              ),
            ),
            const M3Gap(M3Spacings.s16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seed color — ${_hex(seedColor)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Every scheme below is built from this seed at '
                    '${brightness.name} brightness. Change it from the '
                    'navigation panel.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
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

  Widget _buildVariantSection(
    BuildContext context,
    ColorScheme cs,
    Color seedColor,
    Brightness brightness,
  ) {
    final scheme = M3ColorSchemes.fromSeed(
      seedColor: seedColor,
      variant: _variant,
      brightness: brightness,
      contrastLevel: _contrastLevel,
    );

    final roles = <({String label, Color color, Color onColor})>[
      (label: 'primary', color: scheme.primary, onColor: scheme.onPrimary),
      (label: 'onPrimary', color: scheme.onPrimary, onColor: scheme.primary),
      (
        label: 'primaryContainer',
        color: scheme.primaryContainer,
        onColor: scheme.onPrimaryContainer,
      ),
      (
        label: 'onPrimaryContainer',
        color: scheme.onPrimaryContainer,
        onColor: scheme.primaryContainer,
      ),
      (
        label: 'secondary',
        color: scheme.secondary,
        onColor: scheme.onSecondary,
      ),
      (label: 'tertiary', color: scheme.tertiary, onColor: scheme.onTertiary),
      (label: 'error', color: scheme.error, onColor: scheme.onError),
      (label: 'surface', color: scheme.surface, onColor: scheme.onSurface),
      (
        label: 'surfaceContainerHigh',
        color: scheme.surfaceContainerHigh,
        onColor: scheme.onSurface,
      ),
      (label: 'outline', color: scheme.outline, onColor: scheme.surface),
    ];

    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3SchemeVariant — Scheme variants',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'A variant decides how the seed is spread across the six tonal '
              'palettes. Pick one, pick a contrast level, and the roles below '
              'are rebuilt with M3ColorSchemes.fromSeed.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            Text(
              'Variant',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const M3Gap(M3Spacings.s8),
            Wrap(
              spacing: M3Spacings.s8,
              runSpacing: M3Spacings.s8,
              children: M3SchemeVariant.values.map((variant) {
                return ChoiceChip(
                  label: Text(variant.name),
                  selected: _variant == variant,
                  onSelected: (_) => setState(() => _variant = variant),
                );
              }).toList(),
            ),
            const M3Gap(M3Spacings.s16),
            Text(
              'Contrast level',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const M3Gap(M3Spacings.s8),
            Wrap(
              spacing: M3Spacings.s8,
              runSpacing: M3Spacings.s8,
              children: M3ContrastLevels.values.map((level) {
                return ChoiceChip(
                  label: Text(
                    '${_contrastName(level)} (${_levelValue(level)})',
                  ),
                  selected: _contrastLevel == level,
                  onSelected: (_) => setState(() => _contrastLevel = level),
                );
              }).toList(),
            ),
            const M3Gap(M3Spacings.s16),
            Wrap(
              spacing: M3Spacings.s8,
              runSpacing: M3Spacings.s8,
              children: roles
                  .map(
                    (role) => _roleSwatch(
                      cs: cs,
                      label: role.label,
                      color: role.color,
                      onColor: role.onColor,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContrastSection(
    BuildContext context,
    ColorScheme cs,
    Color seedColor,
    Brightness brightness,
  ) {
    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3ContrastLevels — Contrast comparison',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'The same seed and variant at all four levels. The number is the '
              'measured onSurface / surface ratio from '
              'M3ColorUtils.calculateContrast — the effect is a number, not a '
              'vibe.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            Wrap(
              spacing: M3Spacings.s12,
              runSpacing: M3Spacings.s12,
              children: M3ContrastLevels.values.map((level) {
                final scheme = M3ColorSchemes.fromSeed(
                  seedColor: seedColor,
                  variant: _variant,
                  brightness: brightness,
                  contrastLevel: level,
                );
                final ratio = M3ColorUtils.calculateContrast(
                  scheme.onSurface,
                  scheme.surface,
                );

                return Container(
                  width: M3Spacings.s128,
                  padding: M3EdgeInsets.all(M3Spacings.s12),
                  decoration: M3BoxDecoration(
                    color: scheme.surface,
                    borderRadius: M3BorderRadius.medium,
                    border: M3Border.thin(scheme.outlineVariant),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _contrastName(level),
                        style: M3TypeScale.labelLarge.copyWith(
                          color: scheme.onSurface,
                        ),
                      ),
                      Text(
                        'level ${_levelValue(level)}',
                        style: M3TypeScale.labelSmall.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                      const M3Gap(M3Spacings.s12),
                      Row(
                        children: [
                          _miniSwatch(scheme.primary, scheme.outlineVariant),
                          const M3Gap(M3Spacings.s4),
                          _miniSwatch(scheme.secondary, scheme.outlineVariant),
                          const M3Gap(M3Spacings.s4),
                          _miniSwatch(scheme.tertiary, scheme.outlineVariant),
                          const M3Gap(M3Spacings.s4),
                          _miniSwatch(
                            scheme.surfaceContainerHigh,
                            scheme.outlineVariant,
                          ),
                        ],
                      ),
                      const M3Gap(M3Spacings.s12),
                      Text(
                        '${ratio.toStringAsFixed(2)}:1',
                        style: M3TypeScale.titleMedium.copyWith(
                          color: scheme.onSurface,
                        ),
                      ),
                      Text(
                        'onSurface / surface',
                        style: M3TypeScale.labelSmall.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHarmonizationSection(BuildContext context, ColorScheme cs) {
    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3ColorUtils.harmonize',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'Rotates a brand color toward the scheme primary in HCT space — '
              'at most 15°, so the color still reads as itself while it sits '
              'inside the theme.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            ..._brandColors.map((brand) {
              final harmonized = M3ColorUtils.harmonize(
                brand.color,
                cs.primary,
              );

              return M3Padding(
                padding: M3EdgeInsets.only(bottom: M3Spacings.s12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      brand.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const M3Gap(M3Spacings.s8),
                    Row(
                      children: [
                        Expanded(
                          child: _comparisonSwatch(
                            cs: cs,
                            label: 'raw',
                            color: brand.color,
                          ),
                        ),
                        M3Padding(
                          padding: M3EdgeInsets.symmetric(
                            horizontal: M3Spacings.s8,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: M3IconSizes.dense,
                            color: cs.onSurfaceVariant,
                          ),
                        ),
                        Expanded(
                          child: _comparisonSwatch(
                            cs: cs,
                            label: 'harmonized',
                            color: harmonized,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildExtendedColorsSection(
    BuildContext context,
    ColorScheme cs,
    Brightness brightness,
  ) {
    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3ExtendedColor — Custom colors',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'Each brand color harmonized against the scheme primary and '
              'expanded into its four roles at ${brightness.name} brightness. '
              'M3ExtendedColors carries the whole set through the theme as a '
              'ThemeExtension.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            ..._brandColors.map((brand) {
              final extended = M3ExtendedColor.harmonized(
                name: brand.name,
                source: brand.color,
                harmonizeWith: cs.primary,
                brightness: brightness,
              );

              return M3Padding(
                padding: M3EdgeInsets.only(bottom: M3Spacings.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      extended.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const M3Gap(M3Spacings.s8),
                    Row(
                      children: [
                        Expanded(
                          child: _rolePairTile(
                            cs: cs,
                            background: extended.color,
                            foreground: extended.onColor,
                            backgroundLabel: 'color',
                            foregroundLabel: 'onColor',
                          ),
                        ),
                        const M3Gap(M3Spacings.s8),
                        Expanded(
                          child: _rolePairTile(
                            cs: cs,
                            background: extended.colorContainer,
                            foreground: extended.onColorContainer,
                            backgroundLabel: 'colorContainer',
                            foregroundLabel: 'onColorContainer',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformContrastSection(BuildContext context, ColorScheme cs) {
    final level = M3ContrastLevels.of(context);
    final highContrast = MediaQuery.highContrastOf(context);

    return Card(
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'M3ContrastLevels.of(context)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const M3Gap(M3Spacings.s4),
            Text(
              'Contrast is a user preference, not a design choice. This is the '
              'level the platform reports right now — the value '
              'M3ColorSchemes.fromContext would build with.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
            const M3Gap(M3Spacings.s16),
            Container(
              width: double.infinity,
              padding: M3EdgeInsets.all(M3Spacings.s16),
              decoration: M3BoxDecoration(
                color: cs.surfaceContainerHigh,
                borderRadius: M3BorderRadius.medium,
                border: M3Border.thin(cs.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_contrastName(level)} — ${_levelValue(level)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const M3Gap(M3Spacings.s4),
                  Row(
                    children: [
                      Icon(
                        highContrast ? Icons.contrast : Icons.contrast_outlined,
                        size: M3IconSizes.dense,
                        color: cs.onSurfaceVariant,
                      ),
                      const M3Gap(M3Spacings.s8),
                      Expanded(
                        child: Text(
                          'MediaQuery.highContrastOf(context) is '
                          '$highContrast',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: cs.onSurfaceVariant,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// A named color role rendered as a labelled swatch with its hex value.
  Widget _roleSwatch({
    required ColorScheme cs,
    required String label,
    required Color color,
    required Color onColor,
  }) {
    return Container(
      width: M3Spacings.s128,
      padding: M3EdgeInsets.all(M3Spacings.s8),
      decoration: M3BoxDecoration(
        color: color,
        borderRadius: M3BorderRadius.small,
        border: M3Border.thin(cs.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: M3TypeScale.labelSmall.copyWith(color: onColor),
          ),
          const M3Gap(M3Spacings.s4),
          Text(
            _hex(color),
            style: M3TypeScale.labelSmall.copyWith(color: onColor),
          ),
        ],
      ),
    );
  }

  /// A small square used to preview a role inside a denser tile.
  Widget _miniSwatch(Color color, Color outlineColor) {
    return Container(
      width: M3Spacings.s20,
      height: M3Spacings.s20,
      decoration: M3BoxDecoration(
        color: color,
        borderRadius: M3BorderRadius.extraSmall,
        border: M3Border.thin(outlineColor),
      ),
    );
  }

  /// One half of the raw / harmonized comparison.
  Widget _comparisonSwatch({
    required ColorScheme cs,
    required String label,
    required Color color,
  }) {
    final onColor = M3ColorUtils.onColor(color);

    return Container(
      padding: M3EdgeInsets.all(M3Spacings.s12),
      decoration: M3BoxDecoration(
        color: color,
        borderRadius: M3BorderRadius.medium,
        border: M3Border.thin(cs.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: M3TypeScale.labelSmall.copyWith(color: onColor),
          ),
          const M3Gap(M3Spacings.s8),
          Text(
            _hex(color),
            style: M3TypeScale.labelMedium.copyWith(color: onColor),
          ),
        ],
      ),
    );
  }

  /// A container role and the content role drawn on top of it.
  Widget _rolePairTile({
    required ColorScheme cs,
    required Color background,
    required Color foreground,
    required String backgroundLabel,
    required String foregroundLabel,
  }) {
    return Container(
      padding: M3EdgeInsets.all(M3Spacings.s12),
      decoration: M3BoxDecoration(
        color: background,
        borderRadius: M3BorderRadius.medium,
        border: M3Border.thin(cs.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            backgroundLabel,
            style: M3TypeScale.labelMedium.copyWith(color: foreground),
          ),
          Text(
            _hex(background),
            style: M3TypeScale.labelSmall.copyWith(color: foreground),
          ),
          const M3Gap(M3Spacings.s8),
          Text(
            '$foregroundLabel ${_hex(foreground)}',
            style: M3TypeScale.labelSmall.copyWith(color: foreground),
          ),
        ],
      ),
    );
  }
}

/// Formats a color as an RGB hex string.
String _hex(Color color) =>
    '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';

/// The human-readable name of a contrast level token.
String _contrastName(M3ContrastLevelValue level) {
  if (level == M3ContrastLevels.reduced) return 'Reduced';
  if (level == M3ContrastLevels.medium) return 'Medium';
  if (level == M3ContrastLevels.high) return 'High';
  return 'Standard';
}

/// The numeric value carried by a contrast level token.
String _levelValue(M3ContrastLevelValue level) => level.toStringAsFixed(1);
