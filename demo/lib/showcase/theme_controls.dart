import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/theme/theme_provider.dart';
import 'package:material_design_demo/widgets/color_picker.dart';
import 'package:provider/provider.dart';

/// The two controls that drive the whole demo's theme: brightness and seed
/// colour.
///
/// One widget, two layouts — the rail stacks them under 10sp captions, the
/// drawer lays them out as labelled rows. Both used to be written twice.
class ThemeControls extends StatelessWidget {
  const ThemeControls({required this.axis, super.key});

  /// [Axis.vertical] for the rail's narrow footer, [Axis.horizontal] for the
  /// drawer's full-width rows.
  final Axis axis;

  Future<void> _pickSeedColor(BuildContext context) async {
    final theme = context.read<ThemeProvider>();
    final newColor = await showColorPickerDialog(context);
    if (newColor != null) theme.changeSeedColor(newColor);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final isDark = theme.themeMode == ThemeMode.dark;

    void toggleBrightness({required bool dark}) => theme.changeThemeMode(
          dark ? ThemeMode.dark : ThemeMode.light,
        );

    final brightnessSwitch = Switch(
      value: isDark,
      onChanged: (value) => toggleBrightness(dark: value),
    );
    final seedButton = IconButton(
      tooltip: 'Pick a seed color',
      icon: Icon(Icons.color_lens, color: theme.seedColor),
      onPressed: () => _pickSeedColor(context),
    );

    if (axis == Axis.horizontal) {
      return Column(
        children: [
          _ControlRow(label: 'Dark Mode', control: brightnessSwitch),
          _ControlRow(label: 'Seed Color', control: seedButton),
        ],
      );
    }

    return Column(
      children: [
        _StackedControl(label: 'Dark Mode', control: brightnessSwitch),
        const M3Gap(M3Spacings.s12),
        _StackedControl(label: 'Color', control: seedButton),
      ],
    );
  }
}

/// A control with its label beside it — the drawer layout.
class _ControlRow extends StatelessWidget {
  const _ControlRow({required this.label, required this.control});

  final String label;
  final Widget control;

  @override
  Widget build(BuildContext context) {
    return M3Padding(
      padding: const M3EdgeInsets.symmetric(horizontal: M3Spacings.s16),
      child: Row(
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          const Spacer(),
          control,
        ],
      ),
    );
  }
}

/// A control with its label beneath it — the rail layout.
class _StackedControl extends StatelessWidget {
  const _StackedControl({required this.label, required this.control});

  final String label;
  final Widget control;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        control,
        const M3Gap(M3Spacings.s4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
