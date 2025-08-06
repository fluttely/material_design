part of '../../../../material_design.dart';

/// A widget that provides responsive values based on the current window size
/// class.
///
/// This widget allows you to specify different values for different
/// breakpoints
/// and automatically selects the appropriate value based on the current screen
/// size.
///
/// Example:
/// ```dart
/// M3ResponsiveValue<double>(
///   compact: 16.0,
///   medium: 24.0,
///   expanded: 32.0,
///   large: 40.0,
///   extraLarge: 48.0,
///   builder: (context, value) {
///     return M3Padding(
///       padding: M3EdgeInsets.all(value),
///       child: Text('Responsive padding'),
///     );
///   },
/// )
/// ```
class M3ResponsiveValue<T> extends StatelessWidget {
  /// Creates a responsive value widget.
  const M3ResponsiveValue({
    required this.builder,
    super.key,
    this.compact,
    this.medium,
    this.expanded,
    this.large,
    this.extraLarge,
  });

  /// Value for compact window size class.
  final T? compact;

  /// Value for medium window size class.
  final T? medium;

  /// Value for expanded window size class.
  final T? expanded;

  /// Value for large window size class.
  final T? large;

  /// Value for extra large window size class.
  final T? extraLarge;

  /// Builder function that receives the selected value.
  final Widget Function(BuildContext context, T value) builder;

  /// Gets the value for the current window size class.
  T _getValue(M3ScreenSize screenSize) {
    switch (screenSize) {
      case M3ScreenSize.compact:
        return compact ?? medium ?? expanded ?? large ?? extraLarge!;
      case M3ScreenSize.medium:
        return medium ?? expanded ?? large ?? extraLarge ?? compact!;
      case M3ScreenSize.expanded:
        return expanded ?? large ?? extraLarge ?? medium ?? compact!;
      case M3ScreenSize.large:
        return large ?? extraLarge ?? expanded ?? medium ?? compact!;
      case M3ScreenSize.extraLarge:
        return extraLarge ?? large ?? expanded ?? medium ?? compact!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = M3BreakpointToken.getScreenSizeFromContext(context);
    final value = _getValue(screenSize);
    return builder(context, value);
  }
}
