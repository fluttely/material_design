import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Showcase of the three Material Design 3 canonical layouts shipped by the
/// package — [M3ListDetailLayout], [M3SupportingPaneLayout] and
/// [M3FeedLayout] — together with the shared policy in [M3CanonicalLayout].
///
/// Resize the window to watch each demo cross the expanded (840dp) boundary:
/// the three collapse in three different ways.
class CanonicalLayoutsPage extends StatefulWidget {
  /// Creates the canonical layouts showcase page.
  const CanonicalLayoutsPage({super.key});

  @override
  State<CanonicalLayoutsPage> createState() => _CanonicalLayoutsPageState();
}

class _CanonicalLayoutsPageState extends State<CanonicalLayoutsPage> {
  /// Height of every miniature demo, so the page itself stays the scroller.
  static final double _demoHeight = M3Spacings.s128 * 2;

  /// Minimum height of a supporting-pane miniature when stacked.
  static final double _stackedPaneHeight = M3Spacings.s128;

  static const List<_Message> _messages = [
    _Message('Layout review', 'Panes, gutters, and margins for the new feed.'),
    _Message('Design tokens', 'Spacing scale locked; shape tokens next.'),
    _Message('Foldables', 'Dual pane at 840dp — check the hinge posture.'),
    _Message('Accessibility', 'Touch targets pass at 48dp on every pane.'),
    _Message('Release notes', 'Canonical layouts land in 1.6.0.'),
  ];

  int? _selectedMessage;
  bool _supportingFirst = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = M3ScreenSize.of(context);
    final mode = M3CanonicalLayout.displayModeOf(context);
    final isDual = mode == M3PaneDisplayMode.dual;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Canonical Layouts'),
      ),
      body: SingleChildScrollView(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The three canonical layouts of Material Design 3. Resize the '
              'window: each one crosses the expanded boundary (840dp) in its '
              'own way.',
              style: textTheme.bodyMedium,
            ),
            const M3Gap(M3Spacings.s16),
            _buildCard(
              context,
              title: 'M3CanonicalLayout — live readout',
              child: _buildStatusReadout(context, screenSize, mode),
            ),
            _buildCard(
              context,
              title: 'M3ListDetailLayout',
              child: _buildListDetailDemo(context, isDual: isDual),
            ),
            _buildCard(
              context,
              title: 'M3SupportingPaneLayout',
              child: _buildSupportingPaneDemo(context, isDual: isDual),
            ),
            _buildCard(
              context,
              title: 'M3FeedLayout',
              child: _buildFeedDemo(context, screenSize),
            ),
            _buildCard(
              context,
              title: 'Why the three collapse differently',
              child: _buildRationale(context),
            ),
          ],
        ),
      ),
    );
  }

  // --- Live readout -------------------------------------------------------

  Widget _buildStatusReadout(
    BuildContext context,
    M3ScreenSize screenSize,
    M3PaneDisplayMode mode,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final primaryWidth =
        M3CanonicalLayout.paneWidthFor(M3PaneRole.primary, screenSize);
    final secondaryWidth =
        M3CanonicalLayout.paneWidthFor(M3PaneRole.secondary, screenSize);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildReadoutRow(
          context,
          'M3ScreenSize.of',
          screenSize.name,
        ),
        _buildReadoutRow(
          context,
          'displayModeOf',
          mode.name,
        ),
        _buildReadoutRow(
          context,
          'paneWidthFor(primary)',
          _formatWidth(primaryWidth),
        ),
        _buildReadoutRow(
          context,
          'paneWidthFor(secondary)',
          _formatWidth(secondaryWidth),
        ),
        const M3Gap(M3Spacings.s8),
        Text(
          mode == M3PaneDisplayMode.dual
              ? 'Two panes fit. Narrow the window below 840dp to watch every '
                  'demo below collapse.'
              : 'Only one pane fits. Widen the window to 840dp or more to see '
                  'the dual-pane arrangements.',
          style: textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildReadoutRow(BuildContext context, String label, String value) {
    final textTheme = Theme.of(context).textTheme;
    return M3Padding(
      padding: M3EdgeInsets.only(bottom: M3Spacings.s4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: M3Spacings.s128 + M3Spacings.s48,
            child: Text(label, style: textTheme.labelLarge),
          ),
          Expanded(
            child: Text(value, style: textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  String _formatWidth(M3BreakpointValue value) =>
      value.isFinite ? '${value.toInt()}dp' : 'unbounded';

  // --- List-detail --------------------------------------------------------

  Widget _buildListDetailDemo(BuildContext context, {required bool isDual}) {
    final selected = _selectedMessage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _demoHeight,
          child: M3ListDetailLayout(
            list: _buildMessageList(context),
            detail: selected == null
                ? null
                : _buildMessageDetail(context, selected, showBack: !isDual),
            placeholder: _buildDetailPlaceholder(context),
            onNavigateBack: () => setState(() => _selectedMessage = null),
          ),
        ),
        const M3Gap(M3Spacings.s12),
        _buildCaption(context, _listDetailCaption(isDual: isDual)),
      ],
    );
  }

  String _listDetailCaption({required bool isDual}) {
    if (isDual) {
      return 'Dual: the list pane is pinned to its 360dp width and the detail '
          'takes the rest. With nothing selected the detail pane shows the '
          'placeholder instead of going blank.';
    }
    if (_selectedMessage == null) {
      return 'Single: only the list is on screen. Tap an item — the detail '
          'will replace the list, because on a phone a detail is a '
          'destination, not a second column.';
    }
    return 'Single: the detail replaced the list. Back calls '
        'onNavigateBack, which clears the selection; the layout also wires '
        'the system back gesture to it through PopScope.';
  }

  Widget _buildMessageList(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _buildPane(
      context,
      label: 'List pane',
      color: colorScheme.surfaceContainerHighest,
      onColor: colorScheme.onSurface,
      child: ListView.builder(
        padding: M3EdgeInsets.zero,
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          return ListTile(
            dense: true,
            contentPadding: M3EdgeInsets.symmetric(horizontal: M3Spacings.s8),
            shape: const RoundedRectangleBorder(
              borderRadius: M3BorderRadius.medium,
            ),
            selected: _selectedMessage == index,
            title: Text(message.title, maxLines: 1),
            subtitle: Text(message.body, maxLines: 1),
            onTap: () => setState(() => _selectedMessage = index),
          );
        },
      ),
    );
  }

  Widget _buildMessageDetail(
    BuildContext context,
    int index, {
    required bool showBack,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final message = _messages[index];

    return _buildPane(
      context,
      label: 'Detail pane',
      color: colorScheme.secondaryContainer,
      onColor: colorScheme.onSecondaryContainer,
      leading: showBack
          ? IconButton(
              tooltip: 'Back to list',
              visualDensity: VisualDensity.compact,
              onPressed: () => setState(() => _selectedMessage = null),
              icon: const Icon(Icons.arrow_back),
              color: colorScheme.onSecondaryContainer,
            )
          : null,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.title,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSecondaryContainer,
              ),
            ),
            const M3Gap(M3Spacings.s8),
            Text(
              message.body,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailPlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: M3BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: M3BorderRadius.medium,
      ),
      child: Center(
        child: M3Padding(
          padding: M3EdgeInsets.all(M3Spacings.s16),
          child: Text(
            'placeholder — select a message',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  // --- Supporting pane ----------------------------------------------------

  Widget _buildSupportingPaneDemo(
    BuildContext context, {
    required bool isDual,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          contentPadding: M3EdgeInsets.zero,
          title: Text('supportingFirst', style: textTheme.labelLarge),
          subtitle: Text(
            'Leads instead of trails when both panes fit.',
            style: textTheme.bodySmall,
          ),
          value: _supportingFirst,
          onChanged: (value) => setState(() => _supportingFirst = value),
        ),
        const M3Gap(M3Spacings.s8),
        SizedBox(
          height: _demoHeight,
          child: M3SupportingPaneLayout(
            supportingFirst: _supportingFirst,
            primary: _buildStackablePane(
              context,
              label: 'Primary pane',
              body: 'The main task. Takes every pixel the supporting pane '
                  'does not.',
              color: colorScheme.primaryContainer,
              onColor: colorScheme.onPrimaryContainer,
            ),
            supporting: _buildStackablePane(
              context,
              label: 'Supporting pane',
              body: 'Filters, properties, a summary — part of the same task, '
                  'fixed at 360dp.',
              color: colorScheme.tertiaryContainer,
              onColor: colorScheme.onTertiaryContainer,
            ),
          ),
        ),
        const M3Gap(M3Spacings.s12),
        _buildCaption(
          context,
          isDual
              ? 'Dual: the supporting pane keeps its 360dp width '
                  '${_supportingFirst ? 'ahead of' : 'after'} the primary '
                  'pane, which absorbs the remaining space.'
              : 'Single: the supporting pane is stacked below the primary '
                  'one, not hidden behind navigation. It supports the current '
                  'task, so taking it away would take away half the task.',
        ),
      ],
    );
  }

  // --- Feed ---------------------------------------------------------------

  Widget _buildFeedDemo(BuildContext context, M3ScreenSize screenSize) {
    final textTheme = Theme.of(context).textTheme;
    final columns = _defaultFeedColumns(screenSize);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Default progression — $columns '
          '${columns == 1 ? 'column' : 'columns'} at ${screenSize.name}, with '
          'a ${screenSize.gutterWidth.toInt()}dp gutter and a '
          '${screenSize.pageMargin.toInt()}dp page margin taken from the same '
          'window size class.',
          style: textTheme.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        M3FeedLayout(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 2,
          children: [
            for (var index = 0; index < 8; index++)
              _buildFeedTile(context, index),
          ],
        ),
        const M3Gap(M3Spacings.s16),
        Text(
          'itemColumns: {M3ScreenSize.compact: 2}',
          style: textTheme.titleSmall,
        ),
        const M3Gap(M3Spacings.s8),
        Text(
          'Overrides only the classes it names — compact becomes a two-up '
          'grid while every other class keeps the default.',
          style: textTheme.bodyMedium,
        ),
        const M3Gap(M3Spacings.s8),
        M3FeedLayout(
          itemColumns: const {M3ScreenSize.compact: 2},
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 2,
          children: [
            for (var index = 0; index < 4; index++)
              _buildFeedTile(context, index),
          ],
        ),
        const M3Gap(M3Spacings.s12),
        _buildCaption(
          context,
          'A feed never collapses to a single pane, because it has no second '
          'pane — it just reflows: 1 column compact, 2 medium, 3 expanded, '
          '4 large, 5 extra-large.',
        ),
      ],
    );
  }

  int _defaultFeedColumns(M3ScreenSize size) => switch (size) {
        M3ScreenSize.compact => 1,
        M3ScreenSize.medium => 2,
        M3ScreenSize.expanded => 3,
        M3ScreenSize.large => 4,
        M3ScreenSize.extraLarge => 5,
      };

  Widget _buildFeedTile(BuildContext context, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: M3BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: M3BorderRadius.medium,
      ),
      child: Center(
        child: Text(
          'Item ${index + 1}',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  // --- Rationale ----------------------------------------------------------

  Widget _buildRationale(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Widget point(String title, String body) {
      return M3Padding(
        padding: M3EdgeInsets.only(bottom: M3Spacings.s12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.titleSmall),
            const M3Gap(M3Spacings.s4),
            Text(body, style: textTheme.bodyMedium),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        point(
          'List-detail replaces',
          'The detail is a destination reached by selecting something, so on '
              'a single pane it takes over the screen and back returns to the '
              'list.',
        ),
        point(
          'Supporting pane stacks',
          'The supporting content is not a destination — it belongs to the '
              'task in progress. Hiding it behind navigation would split one '
              'task in two, so it moves below the primary pane instead.',
        ),
        point(
          'Feed reflows',
          'Every item carries equal weight, so there is nothing to hide or '
              'stack. Only the column count changes with the window size '
              'class.',
        ),
        Text(
          'Two panes need expanded (840dp) or wider. At medium a 360dp pane '
          'would leave the primary content narrower than a phone, which is '
          'why M3CanonicalLayout.displayModeFor reports single below 840dp.',
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }

  // --- Shared building blocks ---------------------------------------------

  /// A labelled pane that fills the bounded height it is given.
  Widget _buildPane(
    BuildContext context, {
    required String label,
    required Color color,
    required Color onColor,
    required Widget child,
    Widget? leading,
  }) {
    // A Material, not a DecoratedBox: the list pane inks its list tiles
    // against the nearest Material ancestor.
    return Material(
      color: color,
      borderRadius: M3BorderRadius.medium,
      clipBehavior: Clip.antiAlias,
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPaneLabel(context, label, onColor, leading),
            const M3Gap(M3Spacings.s8),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  /// A labelled pane that also works unbounded, i.e. when stacked.
  Widget _buildStackablePane(
    BuildContext context, {
    required String label,
    required String body,
    required Color color,
    required Color onColor,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: _stackedPaneHeight),
      child: DecoratedBox(
        decoration: M3BoxDecoration(
          color: color,
          borderRadius: M3BorderRadius.medium,
        ),
        child: M3Padding(
          padding: M3EdgeInsets.all(M3Spacings.s12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPaneLabel(context, label, onColor, null),
              const M3Gap(M3Spacings.s8),
              Text(
                body,
                style: textTheme.bodyMedium?.copyWith(color: onColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaneLabel(
    BuildContext context,
    String label,
    Color onColor,
    Widget? leading,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        if (leading != null) ...[
          leading,
          const M3Gap(M3Spacings.s4, orientation: Axis.horizontal),
        ],
        Expanded(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelLarge?.copyWith(color: onColor),
          ),
        ),
      ],
    );
  }

  Widget _buildCaption(BuildContext context, String text) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: M3BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: M3BorderRadius.medium,
      ),
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s12),
        child: Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Card(
      margin: M3EdgeInsets.only(bottom: M3Spacings.s16),
      child: M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const M3Gap(M3Spacings.s12),
            child,
          ],
        ),
      ),
    );
  }
}

/// One row of the list-detail miniature.
class _Message {
  const _Message(this.title, this.body);

  final String title;
  final String body;
}
