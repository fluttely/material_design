import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Which half of a destination the shell is showing.
///
/// Every destination has two: the Visual page renders what a token family
/// *looks like*, the Code page shows what you *type* to get it. They are two
/// readings of one subject rather than two subjects, which is why the mode is
/// a property of the shell and not extra entries in the rail — the navigation
/// stays the same length, and switching never loses your place.
enum ShowcaseMode {
  /// The token families, rendered.
  visual(
    label: 'Visual',
    tooltip: 'See the tokens rendered',
    icon: Icons.visibility_outlined,
    selectedIcon: Icons.visibility,
  ),

  /// The same families, as the calls that produce them.
  code(
    label: 'Code',
    tooltip: 'See the Flutter code behind them',
    icon: Icons.code_outlined,
    selectedIcon: Icons.code,
  );

  const ShowcaseMode({
    required this.label,
    required this.tooltip,
    required this.icon,
    required this.selectedIcon,
  });

  /// Short label, shown beside the icon in both layouts.
  final String label;

  /// What choosing this mode gets you.
  final String tooltip;

  /// Icon for the unselected state.
  final IconData icon;

  /// Filled counterpart, for the selected state.
  final IconData selectedIcon;
}

/// The two-segment control that switches [ShowcaseMode].
///
/// One widget, two layouts, like `ThemeControls`: [Axis.vertical] for the
/// rail's 80dp column, [Axis.horizontal] for the drawer's full-width rows.
class ShowcaseModeSwitch extends StatelessWidget {
  const ShowcaseModeSwitch({
    required this.mode,
    required this.onModeSelected,
    required this.axis,
    super.key,
  });

  final ShowcaseMode mode;
  final ValueChanged<ShowcaseMode> onModeSelected;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        decoration: M3BoxDecoration(
          borderRadius: M3BorderRadius.full,
          border: M3Border.thin(colorScheme.outline),
        ),
        child: Flex(
          direction: axis,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final candidate in ShowcaseMode.values)
              _ModeSegment(
                mode: candidate,
                axis: axis,
                isSelected: candidate == mode,
                onTap: () => onModeSelected(candidate),
              ),
          ],
        ),
      ),
    );
  }
}

/// One segment of the switch, built to the M3 segmented-button roles: the
/// selected segment is filled with `secondaryContainer`, and the state layer
/// is painted *over* that fill so a selected segment gives the same hover
/// feedback an unselected one does.
class _ModeSegment extends StatelessWidget {
  const _ModeSegment({
    required this.mode,
    required this.axis,
    required this.isSelected,
    required this.onTap,
  });

  final ShowcaseMode mode;
  final Axis axis;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isVertical = axis == Axis.vertical;

    final foreground =
        isSelected ? colorScheme.onSecondaryContainer : colorScheme.onSurface;

    final label = Text(
      mode.label,
      textAlign: TextAlign.center,
      style: (isVertical ? M3TypeScale.labelSmall : M3TypeScale.labelLarge)
          .copyWith(color: foreground),
    );
    final icon = Icon(
      isSelected ? mode.selectedIcon : mode.icon,
      size: M3IconSizes.dense,
      color: foreground,
    );

    return Semantics(
      selected: isSelected,
      child: Tooltip(
        message: mode.tooltip,
        child: AnimatedContainer(
          duration: M3MotionDuration.short3,
          curve: M3MotionCurve.standard,
          decoration: ShapeDecoration(
            color: isSelected
                ? colorScheme.secondaryContainer
                : Colors.transparent,
            shape: const StadiumBorder(),
          ),
          child: M3StateLayer(
            overlayColor: foreground,
            borderRadius: M3BorderRadius.full,
            onTap: onTap,
            child: M3Padding(
              padding: M3EdgeInsets.symmetric(
                horizontal: isVertical ? M3Spacings.s8 : M3Spacings.s16,
                vertical: M3Spacings.s8,
              ),
              child: Flex(
                direction: axis,
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon,
                  M3Gap(isVertical ? M3Spacings.s4 : M3Spacings.s8),
                  label,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
