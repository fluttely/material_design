part of '../../../../../material_design.dart';

/// Comprehensive adaptive design utilities for Material Design 3.
///
/// Provides responsive layouts, navigation patterns, and component adaptations
/// that work seamlessly across different screen sizes and device types.
@immutable
abstract interface class M3Adaptive {
  // --- Layout Utilities ---

  /// Creates a responsive layout that adapts to screen size.
  static Widget responsiveLayout({
    required BuildContext context,
    required Widget compact,
    Widget? medium,
    Widget? expanded,
    Widget? large,
    Widget? extraLarge,
  }) {
    final screenSize = M3Breakpoints.getScreenSizeFromContext(context);

    switch (screenSize) {
      case M3ScreenSize.compact:
        return compact;
      case M3ScreenSize.medium:
        return medium ?? compact;
      case M3ScreenSize.expanded:
        return expanded ?? medium ?? compact;
      case M3ScreenSize.large:
        return large ?? expanded ?? medium ?? compact;
      case M3ScreenSize.extraLarge:
        return extraLarge ?? large ?? expanded ?? medium ?? compact;
    }
  }

  /// Creates a responsive value based on screen size.
  static T responsiveValue<T>({
    required BuildContext context,
    required T compact,
    T? medium,
    T? expanded,
    T? large,
    T? extraLarge,
  }) {
    final screenSize = M3Breakpoints.getScreenSizeFromContext(context);

    switch (screenSize) {
      case M3ScreenSize.compact:
        return compact;
      case M3ScreenSize.medium:
        return medium ?? compact;
      case M3ScreenSize.expanded:
        return expanded ?? medium ?? compact;
      case M3ScreenSize.large:
        return large ?? expanded ?? medium ?? compact;
      case M3ScreenSize.extraLarge:
        return extraLarge ?? large ?? expanded ?? medium ?? compact;
    }
  }

  /// Creates adaptive padding based on screen size.
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

  /// Creates adaptive margins based on screen size.
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

  /// Creates adaptive navigation based on screen size.
  static Widget adaptiveNavigation({
    required BuildContext context,
    required List<NavigationDestination> destinations,
    required int selectedIndex,
    required ValueChanged<int> onDestinationSelected,
    Widget? leading,
    Widget? trailing,
  }) {
    final screenSize = M3Breakpoints.getScreenSizeFromContext(context);

    switch (screenSize) {
      case M3ScreenSize.compact:
        return NavigationBar(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
        );

      case M3ScreenSize.medium:
        return NavigationRail(
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
        );

      case M3ScreenSize.expanded:
      case M3ScreenSize.large:
      case M3ScreenSize.extraLarge:
        return NavigationDrawer(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          children: [
            if (leading != null) leading,
            ...destinations.asMap().entries.map((entry) {
              return NavigationDrawerDestination(
                icon: entry.value.icon,
                selectedIcon: entry.value.selectedIcon,
                label: Text(entry.value.label),
              );
            }),
            if (trailing != null) trailing,
          ],
        );
    }
  }

  /// Creates an adaptive app bar with responsive behavior.
  static PreferredSizeWidget adaptiveAppBar({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    Widget? leading,
    bool automaticallyImplyLeading = true,
  }) {
    final isCompact = M3Breakpoints.isCompact(context);

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

  /// Shows an adaptive dialog that becomes fullscreen on mobile.
  static Future<T?> showAdaptiveDialog<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    final isCompact = M3Breakpoints.isCompact(context);

    if (isCompact) {
      return Navigator.of(context).push<T>(
        MaterialPageRoute(
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
          fullscreenDialog: true,
        ),
      );
    } else {
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
  }

  /// Shows an adaptive bottom sheet.
  static Future<T?> showAdaptiveSheet<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isDismissible = true,
  }) {
    final isCompact = M3Breakpoints.isCompact(context);

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
          builder: (context, scrollController) {
            return Column(
              children: [
                if (title != null) ...[
                  M3Padding(
                    padding: M3EdgeInsets.all(M3Spacings.space16),
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
            );
          },
        ),
      );
    } else {
      return showGeneralDialog<T>(
        context: context,
        barrierDismissible: isDismissible,
        barrierLabel: '',
        pageBuilder: (context, animation, secondaryAnimation) {
          return Align(
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
                        padding: M3EdgeInsets.all(M3Spacings.space16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
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
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: M3MotionCurve.emphasizedDecelerate,
              ),
            ),
            child: child,
          );
        },
        transitionDuration: M3MotionDuration.long1,
      );
    }
  }

  // --- Grid Adaptations ---

  /// Creates a responsive grid with adaptive column count.
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

  /// Creates a responsive container with adaptive constraints.
  static Widget adaptiveContainer({
    required BuildContext context,
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
  }) {
    final maxWidth = M3Breakpoints.getMaxContentWidth(
      M3Breakpoints.getScreenSizeFromContext(context),
    );

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: padding ?? adaptivePadding(context),
      margin: margin ?? adaptiveMargin(context),
      decoration: decoration,
      child: child,
    );
  }

  // --- Component Adaptations ---

  /// Creates adaptive button sizing based on screen size and input method.
  static Widget adaptiveButton({
    required BuildContext context,
    required Widget child,
    required VoidCallback? onPressed,
    ButtonStyle? style,
  }) {
    final minSize = _getAdaptiveButtonSize(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: (style ?? ElevatedButton.styleFrom()).copyWith(
        minimumSize: WidgetStateProperty.all(Size(minSize, minSize)),
      ),
      child: child,
    );
  }

  /// Creates adaptive FAB with size based on screen size.
  static Widget adaptiveFAB({
    required BuildContext context,
    required VoidCallback? onPressed,
    required Widget child,
    bool isExtended = false,
    String? label,
  }) {
    final isCompact = M3Breakpoints.isCompact(context);

    if (isExtended && !isCompact) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: child,
        label: Text(label ?? ''),
      );
    } else {
      return FloatingActionButton(
        onPressed: onPressed,
        child: child,
      );
    }
  }

  // --- Platform Adaptations ---

  /// Detects the input method type for adaptive sizing.
  static InputMethodType getInputMethodType(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.android:
        return InputMethodType.touch;
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return InputMethodType.mouse;
      case TargetPlatform.fuchsia:
        return InputMethodType.touch;
    }
  }

  /// Creates platform-adaptive scrolling behavior.
  static ScrollBehavior adaptiveScrollBehavior(BuildContext context) {
    return const MaterialScrollBehavior();
  }

  // --- Private Helpers ---

  static double _getAdaptiveButtonSize(BuildContext context) {
    final inputType = getInputMethodType(context);
    switch (inputType) {
      case InputMethodType.touch:
        return 48;
      case InputMethodType.mouse:
        return 32;
    }
  }
}

/// Enumeration of input method types.
enum InputMethodType {
  touch,
  mouse,
}

/// Adaptive scaffold that provides responsive layout structure.
///
/// Automatically switches between navigation patterns based on screen size:
/// - Compact: Bottom navigation bar
/// - Medium: Navigation rail
/// - Large/Expanded: Navigation drawer
class M3AdaptiveScaffold extends StatelessWidget {
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

  final Widget body;
  final List<NavigationDestination>? destinations;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? navigationLeading;
  final Widget? navigationTrailing;

  @override
  Widget build(BuildContext context) {
    final screenSize = M3Breakpoints.getScreenSizeFromContext(context);

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
                ...destinations!.asMap().entries.map((entry) {
                  return NavigationDrawerDestination(
                    icon: entry.value.icon,
                    selectedIcon: entry.value.selectedIcon,
                    label: Text(entry.value.label),
                  );
                }),
                if (navigationTrailing != null) navigationTrailing!,
              ],
            )
          : null,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
