part of '../../../../material_design.dart';

/// Material Design 3 breakpoint pixel values for the five window size classes.
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
abstract final class M3Breakpoints {
  /// Compact — 0dp to 599dp. Phones in portrait.
  static const double compact = 0;

  /// Medium — 600dp to 839dp. Phones in landscape, small tablets.
  static const double medium = 600;

  /// Expanded — 840dp to 1199dp. Large tablets, foldables.
  static const double expanded = 840;

  /// Large — 1200dp to 1599dp. Desktop screens.
  static const double large = 1200;

  /// Extra-large — 1600dp and above. Large monitors.
  static const double extraLarge = 1600;
}

/// The five Material Design 3 window size classes.
///
/// Use [M3ScreenSize.of] or [M3ScreenSize.fromWidth] to get the current class.
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum M3ScreenSize {
  /// 0–599dp — phones in portrait.
  compact,

  /// 600–839dp — phones in landscape, small tablets.
  medium,

  /// 840–1199dp — large tablets, foldables.
  expanded,

  /// 1200–1599dp — desktops, laptops.
  large,

  /// 1600dp+ — large monitors, ultra-wide displays.
  extraLarge;

  // --- Factory constructors ---

  /// Returns the window size class for the given screen [width].
  static M3ScreenSize fromWidth(double width) {
    if (width < M3Breakpoints.medium) return M3ScreenSize.compact;
    if (width < M3Breakpoints.expanded) return M3ScreenSize.medium;
    if (width < M3Breakpoints.large) return M3ScreenSize.expanded;
    if (width < M3Breakpoints.extraLarge) return M3ScreenSize.large;
    return M3ScreenSize.extraLarge;
  }

  /// Returns the window size class for the current [BuildContext].
  static M3ScreenSize of(BuildContext context) =>
      fromWidth(MediaQuery.of(context).size.width);

  // --- Responsive layout values ---

  /// Recommended column count for this size class.
  int get columns => switch (this) {
        M3ScreenSize.compact => 4,
        M3ScreenSize.medium => 8,
        _ => 12,
      };

  /// Recommended gutter width in dp for this size class.
  double get gutterWidth => switch (this) {
        M3ScreenSize.compact => M3Spacings.space16,
        _ => M3Spacings.space24,
      };

  /// Recommended horizontal page margin in dp for this size class.
  double get pageMargin => switch (this) {
        M3ScreenSize.compact => M3Margins.compactScreen,
        _ => M3Margins.mediumScreen,
      };

  /// Maximum content body width in dp, or null for full-width.
  double? get bodyWidth => switch (this) {
        M3ScreenSize.compact || M3ScreenSize.medium => null,
        M3ScreenSize.expanded => M3Breakpoints.expanded,
        _ => 1040,
      };

  /// Maximum outer content width in dp.
  double get maxContentWidth => switch (this) {
        M3ScreenSize.compact => double.infinity,
        M3ScreenSize.medium => M3Breakpoints.expanded,
        M3ScreenSize.expanded => M3Breakpoints.large,
        M3ScreenSize.large => M3Breakpoints.extraLarge,
        M3ScreenSize.extraLarge => 1920,
      };

  /// Standard side-pane width in dp for multi-pane layouts.
  double get paneWidth => switch (this) {
        M3ScreenSize.compact => double.infinity,
        _ => 360,
      };

  // --- Comparison helpers ---

  bool isAtLeast(M3ScreenSize other) => index >= other.index;
  bool isAtMost(M3ScreenSize other) => index <= other.index;

  bool get isMobile =>
      this == M3ScreenSize.compact || this == M3ScreenSize.medium;
  bool get isTablet => this == M3ScreenSize.expanded;
  bool get isDesktop =>
      this == M3ScreenSize.large || this == M3ScreenSize.extraLarge;
}
