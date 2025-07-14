/// Breakpoints defining responsive layout ranges.
abstract final class MaterialBreakpoint {
  /// The maximum width for a mobile layout.
  static const double mobile = 599;

  /// The maximum width for a tablet layout.
  static const double tablet = 1023;

  /// The maximum width for a desktop layout.
  static const double desktop = 1439;

  /// A breakpoint for screens wider than the desktop layout.
  static const double infinity = 1440;
}
