part of '../../../../material_design.dart';

/// A widget that conditionally displays content based on window size class.
///
/// This widget provides an easy way to show/hide content based on the current
/// window size class.
///
/// Example:
/// ```dart
/// M3ResponsiveVisibility(
///   visibleOn: [M3ScreenSize.large, M3ScreenSize.extraLarge],
///   child: Sidebar(),
/// )
/// ```
class M3ResponsiveVisibility extends StatelessWidget {
  /// Creates a responsive visibility widget.
  const M3ResponsiveVisibility({
    required this.visibleOn,
    required this.child,
    super.key,
    this.replacement = const SizedBox.shrink(),
  });

  /// List of window size classes where the child should be visible.
  final List<M3ScreenSize> visibleOn;

  /// The widget to display when visible.
  final Widget child;

  /// The widget to display when not visible (defaults to empty space).
  final Widget replacement;

  @override
  Widget build(BuildContext context) {
    final screenSize = M3BreakpointToken.getScreenSizeFromContext(context);
    return visibleOn.contains(screenSize) ? child : replacement;
  }
}
