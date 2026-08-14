part of '../../../adaptive.dart';

/// The role a pane plays in a canonical layout.
///
/// Spec: https://m3.material.io/foundations/layout/understanding-layout/parts-of-layout
enum M3PaneRole {
  /// The pane carrying the primary task. Gets the space when only one fits.
  primary,

  /// The supporting pane — detail, filters, related content.
  ///
  /// Fixed-width by default ([M3LayoutWidths.pane], 360dp): supporting content
  /// should not grow just because the window did.
  secondary,
}

/// How a canonical layout resolved itself for the current window.
enum M3PaneDisplayMode {
  /// One pane at a time; the other is reached by navigation.
  single,

  /// Both panes side by side.
  dual,
}

/// List-detail — a browsable list beside the detail of the selected item.
///
/// The most common canonical layout: mail, settings, contacts. On compact
/// windows only one pane fits, so the widget shows the list until something is
/// selected and the detail after that, and reports back through
/// [onNavigateBack] when the user should return to the list.
///
/// ```dart
/// M3ListDetailLayout(
///   list: MailList(onSelect: (id) => setState(() => _selected = id)),
///   detail: _selected == null ? null : MailDetail(_selected!),
///   onNavigateBack: () => setState(() => _selected = null),
/// )
/// ```
///
/// The list pane is the fixed-width one here — the detail is what benefits
/// from extra space.
///
/// Spec: https://m3.material.io/foundations/layout/canonical-layouts/list-detail
class M3ListDetailLayout extends StatelessWidget {
  /// Creates a list-detail layout.
  const M3ListDetailLayout({
    required this.list,
    required this.detail,
    super.key,
    this.placeholder,
    this.onNavigateBack,
    this.listPaneWidth = M3LayoutWidths.pane,
  });

  /// The browsable pane.
  final Widget list;

  /// The detail of the current selection, or null when nothing is selected.
  final Widget? detail;

  /// Shown in the detail pane when [detail] is null and both panes fit.
  ///
  /// Defaults to empty space. An "select an item" hint belongs here.
  final Widget? placeholder;

  /// Called when a compact window should return from detail to list.
  ///
  /// Wired to a back button in the detail pane. When null, no back affordance
  /// is added — supply your own, or the user is stranded.
  final VoidCallback? onNavigateBack;

  /// Width of the list pane when both panes are shown.
  final M3BreakpointValue listPaneWidth;

  @override
  Widget build(BuildContext context) {
    final mode = M3CanonicalLayout.displayModeOf(context);

    if (mode == M3PaneDisplayMode.single) {
      if (detail == null) return list;
      return PopScope(
        canPop: onNavigateBack == null,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) onNavigateBack?.call();
        },
        child: detail!,
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(width: listPaneWidth, child: list),
        const M3Gap(M3Spacers.pane, orientation: Axis.horizontal),
        Expanded(child: detail ?? placeholder ?? const SizedBox.shrink()),
      ],
    );
  }
}

/// Supporting pane — a primary task with secondary content alongside it.
///
/// Unlike list-detail, the supporting content is not a selection: it is a
/// tool bar, a summary, a set of filters. When only one pane fits, the support
/// is stacked beneath the primary content rather than being navigated to,
/// because it is not a separate destination.
///
/// ```dart
/// M3SupportingPaneLayout(
///   primary: Editor(),
///   supporting: PropertiesPanel(),
/// )
/// ```
///
/// Spec: https://m3.material.io/foundations/layout/canonical-layouts/supporting-pane
class M3SupportingPaneLayout extends StatelessWidget {
  /// Creates a supporting-pane layout.
  const M3SupportingPaneLayout({
    required this.primary,
    required this.supporting,
    super.key,
    this.supportingPaneWidth = M3LayoutWidths.pane,
    this.supportingFirst = false,
  });

  /// The pane carrying the main task.
  final Widget primary;

  /// The supporting content.
  final Widget supporting;

  /// Width of the supporting pane when both fit.
  final M3BreakpointValue supportingPaneWidth;

  /// Whether the supporting pane leads instead of trails.
  final bool supportingFirst;

  @override
  Widget build(BuildContext context) {
    final mode = M3CanonicalLayout.displayModeOf(context);

    if (mode == M3PaneDisplayMode.single) {
      // Stacked, not hidden: the support is part of the same task.
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (supportingFirst) ...[
              supporting,
              const M3Gap(M3Spacers.pane),
              primary,
            ] else ...[
              primary,
              const M3Gap(M3Spacers.pane),
              supporting,
            ],
          ],
        ),
      );
    }

    final supportingPane =
        SizedBox(width: supportingPaneWidth, child: supporting);
    final primaryPane = Expanded(child: primary);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (supportingFirst) supportingPane else primaryPane,
        const M3Gap(M3Spacers.pane, orientation: Axis.horizontal),
        if (supportingFirst) primaryPane else supportingPane,
      ],
    );
  }
}

/// Feed — a grid of equal-weight items that reflows with the window.
///
/// Column count follows the window size class rather than a fixed number, and
/// the gutter and page margin come from the same class, so a feed is spaced
/// like every other M3 surface without being told the numbers.
///
/// ```dart
/// M3FeedLayout(
///   children: [for (final story in stories) StoryCard(story)],
/// )
/// ```
///
/// Spec: https://m3.material.io/foundations/layout/canonical-layouts/feed
class M3FeedLayout extends StatelessWidget {
  /// Creates a feed layout.
  const M3FeedLayout({
    required this.children,
    super.key,
    this.itemColumns,
    this.childAspectRatio = 1.0,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
  });

  /// The feed items.
  final List<Widget> children;

  /// Columns per window size class, overriding the defaults for the classes
  /// you name.
  ///
  /// Defaults to a spec-shaped progression: 1 column compact, 2 medium,
  /// 3 expanded, 4 large, 5 extra-large. The grid column count
  /// ([M3ScreenSize.columns], 4/8/12) describes the underlying layout grid,
  /// not how many cards should sit across it.
  ///
  /// ```dart
  /// M3FeedLayout(
  ///   itemColumns: const {M3ScreenSize.compact: 2}, // denser phone grid
  ///   children: cards,
  /// )
  /// ```
  final Map<M3ScreenSize, int>? itemColumns;

  /// Aspect ratio of each item.
  final double childAspectRatio;

  /// Overrides the class-derived page margin.
  final M3EdgeInsets? padding;

  /// Whether the grid should size itself to its content.
  final bool shrinkWrap;

  /// Scroll physics for the grid.
  final ScrollPhysics? physics;

  static const _defaultColumns = <M3ScreenSize, int>{
    M3ScreenSize.compact: 1,
    M3ScreenSize.medium: 2,
    M3ScreenSize.expanded: 3,
    M3ScreenSize.large: 4,
    M3ScreenSize.extraLarge: 5,
  };

  @override
  Widget build(BuildContext context) {
    final size = M3ScreenSize.of(context);
    final columns = itemColumns?[size] ?? _defaultColumns[size]!;
    final gutter = size.gutterWidth;

    return GridView.builder(
      padding: padding ?? M3EdgeInsets.all(size.pageMargin),
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: gutter,
        mainAxisSpacing: gutter,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

/// Shared policy behind the canonical layouts.
///
/// Exposed so an app can make the same decision for a layout this package
/// does not ship.
///
/// Spec: https://m3.material.io/foundations/layout/canonical-layouts/overview
abstract final class M3CanonicalLayout {
  /// Whether two panes fit at [size].
  ///
  /// Two panes need expanded (840dp) or wider — at medium a 360dp support pane
  /// would leave the primary content narrower than a phone.
  static M3PaneDisplayMode displayModeFor(M3ScreenSize size) =>
      size.isAtLeast(M3ScreenSize.expanded)
          ? M3PaneDisplayMode.dual
          : M3PaneDisplayMode.single;

  /// Whether two panes fit in the current window.
  static M3PaneDisplayMode displayModeOf(BuildContext context) =>
      displayModeFor(M3ScreenSize.of(context));

  /// The width a pane in [role] should take at [size].
  ///
  /// [M3PaneRole.secondary] is fixed; [M3PaneRole.primary] is unbounded and
  /// takes the remaining space.
  static M3BreakpointValue paneWidthFor(M3PaneRole role, M3ScreenSize size) =>
      switch (role) {
        M3PaneRole.primary => M3LayoutWidths.unbounded,
        M3PaneRole.secondary => size.paneWidth,
      };
}
