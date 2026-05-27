part of '../../../../../material_design.dart';

/// Adaptive design utilities for Material Design 3.
///
/// Provides responsive layouts, navigation patterns, and component adaptations
/// that work seamlessly across different screen sizes and device types.
@immutable
abstract interface class M3Adaptive {
  // --- Layout Utilities ---

  /// Returns the widget matching the current window size class, falling back
  /// to the nearest smaller variant when a specific size is not provided.
  static Widget responsiveLayout({
    required BuildContext context,
    required Widget compact,
    Widget? medium,
    Widget? expanded,
    Widget? large,
    Widget? extraLarge,
  }) {
    return switch (M3ScreenSize.of(context)) {
      M3ScreenSize.compact => compact,
      M3ScreenSize.medium => medium ?? compact,
      M3ScreenSize.expanded => expanded ?? medium ?? compact,
      M3ScreenSize.large => large ?? expanded ?? medium ?? compact,
      M3ScreenSize.extraLarge =>
        extraLarge ?? large ?? expanded ?? medium ?? compact,
    };
  }

  /// Returns the value matching the current window size class.
  static T responsiveValue<T>({
    required BuildContext context,
    required T compact,
    T? medium,
    T? expanded,
    T? large,
    T? extraLarge,
  }) {
    return switch (M3ScreenSize.of(context)) {
      M3ScreenSize.compact => compact,
      M3ScreenSize.medium => medium ?? compact,
      M3ScreenSize.expanded => expanded ?? medium ?? compact,
      M3ScreenSize.large => large ?? expanded ?? medium ?? compact,
      M3ScreenSize.extraLarge =>
        extraLarge ?? large ?? expanded ?? medium ?? compact,
    };
  }

  /// Returns page padding matching the current window size class.
  static EdgeInsetsGeometry adaptivePadding(BuildContext context) {
    return M3EdgeInsets.all(
      responsiveValue<M3SpacingValue>(
        context: context,
        compact: M3Margins.compactScreen,
        medium: M3Margins.mediumScreen,
        expanded: M3Margins.expandedScreen,
        large: M3Margins.largeScreen,
        extraLarge: M3Margins.extraLargeScreen,
      ),
    );
  }

  /// Returns horizontal page margin matching the current window size class.
  static EdgeInsetsGeometry adaptiveMargin(BuildContext context) {
    return M3EdgeInsets.symmetric(
      horizontal: responsiveValue<M3SpacingValue>(
        context: context,
        compact: M3Margins.compactScreen,
        medium: M3Margins.mediumScreen,
        expanded: M3Margins.expandedScreen,
        large: M3Margins.largeScreen,
        extraLarge: M3Margins.extraLargeScreen,
      ),
    );
  }

  // --- Navigation Adaptations ---

  /// Returns the M3-recommended navigation widget for the current screen size:
  /// compact → [NavigationBar], medium → [NavigationRail],
  /// expanded+ → [NavigationDrawer].
  static Widget adaptiveNavigation({
    required BuildContext context,
    required List<NavigationDestination> destinations,
    required int selectedIndex,
    required ValueChanged<int> onDestinationSelected,
    Widget? leading,
    Widget? trailing,
  }) {
    return switch (M3ScreenSize.of(context)) {
      M3ScreenSize.compact => NavigationBar(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
        ),
      M3ScreenSize.medium => NavigationRail(
          destinations: destinations
              .map(
                (d) => NavigationRailDestination(
                  icon: d.icon,
                  selectedIcon: d.selectedIcon,
                  label: Text(d.label),
                ),
              )
              .toList(),
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          leading: leading,
          trailing: trailing,
        ),
      _ => NavigationDrawer(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          children: [
            if (leading != null) leading,
            ...destinations.asMap().entries.map(
                  (entry) => NavigationDrawerDestination(
                    icon: entry.value.icon,
                    selectedIcon: entry.value.selectedIcon,
                    label: Text(entry.value.label),
                  ),
                ),
            if (trailing != null) trailing,
          ],
        ),
    };
  }

  /// Returns an [AppBar] that centers its title on compact screens.
  static PreferredSizeWidget adaptiveAppBar({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    Widget? leading,
    bool automaticallyImplyLeading = true,
  }) {
    final isCompact = M3ScreenSize.of(context) == M3ScreenSize.compact;
    return AppBar(
      title: Text(title),
      centerTitle: isCompact,
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: isCompact ? M3Elevation.level0.dp : M3Elevation.level1.dp,
    );
  }

  // --- Dialog Adaptations ---

  /// Shows a full-screen page on compact screens; a dialog on larger screens.
  static Future<T?> showAdaptiveDialog<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    final isCompact = M3ScreenSize.of(context) == M3ScreenSize.compact;

    if (isCompact) {
      return Navigator.of(context).push<T>(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(title),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: actions,
            ),
            body: SingleChildScrollView(
              padding: adaptivePadding(context),
              child: content,
            ),
          ),
        ),
      );
    }

    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content,
        actions: actions,
      ),
    );
  }

  /// Shows a bottom sheet on compact screens; a side panel on larger screens.
  static Future<T?> showAdaptiveSheet<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isDismissible = true,
  }) {
    final isCompact = M3ScreenSize.of(context) == M3ScreenSize.compact;

    if (isCompact) {
      return showModalBottomSheet<T>(
        context: context,
        isDismissible: isDismissible,
        isScrollControlled: true,
        shape: M3Shape.large,
        builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) => Column(
            children: [
              if (title != null) ...[
                M3Padding(
                  padding: const M3EdgeInsets.all(M3Spacings.s16),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const Divider(height: 1),
              ],
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: isDismissible,
      barrierLabel: '',
      pageBuilder: (context, animation, secondaryAnimation) => Align(
        alignment: Alignment.centerRight,
        child: Material(
          child: Container(
            width: 320,
            height: double.infinity,
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: M3Shape.large,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  M3Padding(
                    padding: const M3EdgeInsets.all(M3Spacings.s16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                ],
                Expanded(
                  child: SingleChildScrollView(
                    padding: adaptivePadding(context),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: M3MotionCurve.emphasizedDecelerate,
        )),
        child: child,
      ),
      transitionDuration: M3MotionDuration.long1,
    );
  }

  // --- Grid Adaptations ---

  /// Returns a [GridView] with a column count adapted to the screen size.
  static Widget adaptiveGrid({
    required BuildContext context,
    required List<Widget> children,
    double spacing = 16,
    double runSpacing = 16,
    double? childAspectRatio,
  }) {
    final columns = responsiveValue<int>(
      context: context,
      compact: 1,
      medium: 2,
      expanded: 3,
      large: 4,
      extraLarge: 5,
    );

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio ?? 1.0,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }

  /// Returns a constrained [Container] with adaptive max-width and padding.
  static Widget adaptiveContainer({
    required BuildContext context,
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
  }) {
    final maxWidth = M3ScreenSize.of(context).maxContentWidth;

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: padding ?? adaptivePadding(context),
      margin: margin ?? adaptiveMargin(context),
      decoration: decoration,
      child: child,
    );
  }

  // --- Component Adaptations ---

  /// Returns an [ElevatedButton] sized for the current input method.
  static Widget adaptiveButton({
    required BuildContext context,
    required Widget child,
    required VoidCallback? onPressed,
    ButtonStyle? style,
  }) {
    final minSize = _adaptiveButtonSize(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: (style ?? ElevatedButton.styleFrom()).copyWith(
        minimumSize: WidgetStateProperty.all(Size(minSize, minSize)),
      ),
      child: child,
    );
  }

  /// Returns an extended FAB on larger screens and a regular FAB on compact.
  static Widget adaptiveFAB({
    required BuildContext context,
    required VoidCallback? onPressed,
    required Widget child,
    bool isExtended = false,
    String? label,
  }) {
    final isCompact = M3ScreenSize.of(context) == M3ScreenSize.compact;
    if (isExtended && !isCompact) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: child,
        label: Text(label ?? ''),
      );
    }
    return FloatingActionButton(onPressed: onPressed, child: child);
  }

  // --- Platform Adaptations ---

  /// Returns whether the current platform primarily uses touch input.
  static InputMethodType inputMethodType(BuildContext context) {
    return switch (Theme.of(context).platform) {
      TargetPlatform.iOS ||
      TargetPlatform.android ||
      TargetPlatform.fuchsia =>
        InputMethodType.touch,
      _ => InputMethodType.mouse,
    };
  }

  // --- Private Helpers ---

  static double _adaptiveButtonSize(BuildContext context) {
    return inputMethodType(context) == InputMethodType.touch ? 48.0 : 32.0;
  }
}

/// The primary input method used on the current platform.
enum InputMethodType {
  /// Touch input (e.g. mobile device).
  touch,

  /// Mouse input (e.g. desktop/web browser).
  mouse,
}

/// An adaptive [Scaffold] that switches navigation patterns based on screen
/// size: compact uses a bottom bar, medium uses a rail, expanded+ uses a
/// drawer.
class M3AdaptiveScaffold extends StatelessWidget {
  /// Creates an adaptive scaffold.
  const M3AdaptiveScaffold({
    required this.body,
    super.key,
    this.destinations,
    this.selectedIndex = 0,
    this.onDestinationSelected,
    this.appBar,
    this.floatingActionButton,
    this.navigationLeading,
    this.navigationTrailing,
  });

  /// The main content of the scaffold.
  final Widget body;

  /// The list of navigation destinations to display.
  final List<NavigationDestination>? destinations;

  /// The index of the currently selected navigation destination.
  final int selectedIndex;

  /// Callback when a navigation destination is selected.
  final ValueChanged<int>? onDestinationSelected;

  /// Optional app bar to display at the top.
  final PreferredSizeWidget? appBar;

  /// Optional floating action button to display.
  final Widget? floatingActionButton;

  /// Optional leading widget for navigation rail/drawer.
  final Widget? navigationLeading;

  /// Optional trailing widget for navigation rail/drawer.
  final Widget? navigationTrailing;

  @override
  Widget build(BuildContext context) {
    final screenSize = M3ScreenSize.of(context);

    if (screenSize == M3ScreenSize.compact) {
      return Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: destinations != null
            ? NavigationBar(
                destinations: destinations!,
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
              )
            : null,
        floatingActionButton: floatingActionButton,
      );
    }

    if (screenSize == M3ScreenSize.medium) {
      return Scaffold(
        appBar: appBar,
        body: Row(
          children: [
            if (destinations != null)
              NavigationRail(
                destinations: destinations!
                    .map(
                      (d) => NavigationRailDestination(
                        icon: d.icon,
                        selectedIcon: d.selectedIcon,
                        label: Text(d.label),
                      ),
                    )
                    .toList(),
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                leading: navigationLeading,
                trailing: navigationTrailing,
              ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: body),
          ],
        ),
        floatingActionButton: floatingActionButton,
      );
    }

    return Scaffold(
      appBar: appBar,
      drawer: destinations != null
          ? NavigationDrawer(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              children: [
                if (navigationLeading != null) navigationLeading!,
                ...destinations!.asMap().entries.map(
                      (entry) => NavigationDrawerDestination(
                        icon: entry.value.icon,
                        selectedIcon: entry.value.selectedIcon,
                        label: Text(entry.value.label),
                      ),
                    ),
                if (navigationTrailing != null) navigationTrailing!,
              ],
            )
          : null,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
