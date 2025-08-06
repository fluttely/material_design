part of '../../../../material_design.dart';

/// A responsive builder widget that rebuilds when the window size class
/// changes.
///
/// This widget provides an easy way to build adaptive layouts that respond
/// to changes in window size class.
///
/// Example:
/// ```dart
/// M3ResponsiveBuilder(
///   builder: (context, screenSize) {
///     if (screenSize.isDesktop) {
///       return DesktopLayout();
///     } else if (screenSize.isTablet) {
///       return TabletLayout();
///     } else {
///       return MobileLayout();
///     }
///   },
/// )
/// ```
class M3ResponsiveBuilder extends StatelessWidget {
  /// Creates a responsive builder widget.
  const M3ResponsiveBuilder({
    required this.builder,
    super.key,
  });

  /// The builder function that receives the current window size class.
  final Widget Function(BuildContext context, M3ScreenSize screenSize) builder;

  @override
  Widget build(BuildContext context) {
    final screenSize = M3BreakpointToken.getScreenSizeFromContext(context);
    return builder(context, screenSize);
  }
}
