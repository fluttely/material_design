import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase/showcase_destinations.dart';
import 'package:material_design_demo/showcase/showcase_mode.dart';
import 'package:material_design_demo/showcase/theme_controls.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';

/// The scrollable navigation rail used from the medium window size class up.
///
/// Flutter's `NavigationRail` does not scroll and has no section headings, so
/// the demo draws its own — from the package's own measurements
/// ([M3NavigationSizes]) and state-layer opacities ([M3InteractionState]), and
/// to the same specification the built-in rail follows. See [_RailDestination]
/// for the states.
///
/// The Visual/Code switch sits above the scroll area rather than inside it:
/// it applies to every destination, so it should not scroll away with any one
/// of them.
class ShowcaseRail extends StatelessWidget {
  const ShowcaseRail({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.mode,
    required this.onModeSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final ShowcaseMode mode;
  final ValueChanged<ShowcaseMode> onModeSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final captionStyle = Theme.of(context).textTheme.labelMedium;

    return ColoredBox(
      color: colorScheme.surface,
      child: SizedBox(
        width: M3NavigationSizes.railWidth,
        child: Column(
          children: [
            const ShowcaseLink(
              label: 'Lib',
              url: 'https://pub.dev/packages/material_design',
            ),
            M3Padding(
              padding: const M3EdgeInsets.only(bottom: M3Spacings.s8),
              child: ShowcaseModeSwitch(
                mode: mode,
                onModeSelected: onModeSelected,
                axis: Axis.vertical,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const _RailDivider(),
                    const ShowcaseLink(
                      label: 'M3',
                      url: 'https://m3.material.io/',
                    ),
                    for (final section in showcaseSections) ...[
                      const _RailDivider(),
                      ShowcaseLink(
                        label: section.title,
                        url: section.url,
                        style: captionStyle,
                      ),
                      for (final (index, destination)
                          in section.destinations.indexed)
                        _RailDestination(
                          destination: destination,
                          isSelected: selectedIndex ==
                              showcaseSectionOffset(section) + index,
                          onTap: () => onDestinationSelected(
                            showcaseSectionOffset(section) + index,
                          ),
                        ),
                    ],
                    const M3Gap(M3Spacings.s24),
                  ],
                ),
              ),
            ),
            M3Padding(
              padding: const M3EdgeInsets.symmetric(vertical: M3Spacings.s8),
              child: Column(
                children: [
                  const _RailDivider(),
                  const ThemeControls(axis: Axis.vertical),
                  const M3Gap(M3Spacings.s12),
                  ShowcaseLink(
                    label: 'Demo',
                    url: 'https://github.com/fluttely/material_design/'
                        'tree/main/demo',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const M3Gap(M3Spacings.s8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A rail destination, built to the same specification as Flutter's own
/// `NavigationRail` destination so the two are indistinguishable:
///
/// - the active indicator is a **56×32dp stadium** filled with
///   `secondaryContainer`, and the **state layer is confined to it** — hovering
///   a destination lights the pill around the icon, not an 80×56 block;
/// - hovering anywhere on the destination (icon *or* label) raises that layer,
///   because the whole item is one target;
/// - the layer is painted *over* the indicator rather than behind it, so a
///   selected destination gives the same feedback an unselected one does. The
///   base color follows the content role: `onSecondaryContainer` when selected,
///   `onSurface` otherwise, at the opacity `M3InteractionState` assigns;
/// - the label is `labelMedium` on `onSurface` in both states, and destinations
///   are 12dp apart — the M3 rail metrics.
///
/// Spec: https://m3.material.io/components/navigation-rail/specs
class _RailDestination extends StatefulWidget {
  const _RailDestination({
    required this.destination,
    required this.isSelected,
    required this.onTap,
  });

  final ShowcaseDestination destination;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_RailDestination> createState() => _RailDestinationState();
}

class _RailDestinationState extends State<_RailDestination> {
  bool _hovered = false;
  bool _focused = false;
  bool _pressed = false;

  /// The M3 interaction state this destination is in, by the spec's
  /// precedence: the strongest active state wins.
  M3InteractionState? get _state => switch (this) {
        _ when _pressed => M3InteractionState.pressed,
        _ when _focused => M3InteractionState.focus,
        _ when _hovered => M3InteractionState.hover,
        _ => null,
      };

  void _setPressed({required bool pressed}) {
    if (_pressed != pressed) setState(() => _pressed = pressed);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = _state;

    // The state layer takes the color of the content it sits under, which on a
    // selected destination is the indicator's own content color.
    final overlayBase = widget.isSelected
        ? colorScheme.onSecondaryContainer
        : colorScheme.onSurface;
    final overlay = state == null
        ? Colors.transparent
        : overlayBase.withValues(alpha: state.stateLayerOpacity);

    return Semantics(
      container: true,
      button: true,
      selected: widget.isSelected,
      child: Focus(
        onFocusChange: (focused) => setState(() => _focused = focused),
        onKeyEvent: (_, event) {
          // Enter and Space activate the focused destination, the way a
          // keyboard user expects of any navigation item.
          final activationKeys = {
            LogicalKeyboardKey.enter,
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.numpadEnter,
          };
          if (event is KeyDownEvent &&
              activationKeys.contains(event.logicalKey)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: GestureDetector(
            onTap: widget.onTap,
            onTapDown: (_) => _setPressed(pressed: true),
            onTapUp: (_) => _setPressed(pressed: false),
            onTapCancel: () => _setPressed(pressed: false),
            behavior: HitTestBehavior.opaque,
            child: M3Padding(
              padding: const M3EdgeInsets.only(bottom: M3Spacings.s12),
              child: SizedBox(
                height: M3NavigationSizes.railDestinationHeight,
                child: Column(
                  children: [
                    _ActiveIndicator(
                      isSelected: widget.isSelected,
                      overlay: overlay,
                      child: Icon(
                        widget.isSelected
                            ? widget.destination.selectedIcon
                            : widget.destination.icon,
                        size: M3IconSizes.standard,
                        color: widget.isSelected
                            ? colorScheme.onSecondaryContainer
                            : colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const M3Gap(M3Spacings.s4),
                    Text(
                      widget.destination.label,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The 56×32dp pill behind a destination's icon, with the state layer stacked
/// on top of its fill.
class _ActiveIndicator extends StatelessWidget {
  const _ActiveIndicator({
    required this.isSelected,
    required this.overlay,
    required this.child,
  });

  final bool isSelected;
  final Color overlay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: M3NavigationSizes.indicatorWidth,
      height: M3NavigationSizes.indicatorHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The indicator arrives and leaves by *scaling in X*, not by fading
          // its fill. A fill fading through 500ms of emphasized easing spends
          // that whole time as a translucent tint of `secondaryContainer` —
          // which is exactly what a hover state layer looks like, so
          // deselecting a destination read as a hover flash on it. The fill
          // therefore switches over 100ms, and the emphasized motion lives in
          // the scale, which is how `NavigationIndicator` does it.
          TweenAnimationBuilder<double>(
            tween: Tween<double>(end: isSelected ? 1 : 0),
            duration: M3Motion.emphasized.duration,
            curve: M3Motion.emphasized.curve,
            builder: (context, t, child) => Transform(
              alignment: Alignment.center,
              // Scale in X only: the pill never gets shorter, just narrower.
              // It starts at 40% the instant it appears, as the spec's
              // indicator does, rather than growing from nothing.
              transform:
                  Matrix4.diagonal3Values(t == 0 ? 0 : 0.4 + 0.6 * t, 1, 1),
              child: child,
            ),
            child: AnimatedContainer(
              duration: M3MotionDuration.short2,
              curve: M3MotionCurve.standard,
              decoration: ShapeDecoration(
                color: isSelected
                    ? colorScheme.secondaryContainer
                    : Colors.transparent,
                shape: const StadiumBorder(),
              ),
            ),
          ),
          // … while the state layer has to keep up with the pointer.
          AnimatedContainer(
            duration: M3MotionDuration.short3,
            curve: M3MotionCurve.standard,
            decoration: ShapeDecoration(
              color: overlay,
              shape: const StadiumBorder(),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

/// The inset divider that separates rail sections.
class _RailDivider extends StatelessWidget {
  const _RailDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: M3Spacings.s8,
      endIndent: M3Spacings.s8,
    );
  }
}
