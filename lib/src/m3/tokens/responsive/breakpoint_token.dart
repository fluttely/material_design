part of '../../../tokens.dart';

/// Type-safe wrapper for M3 breakpoint and layout width values.
///
/// Implements [double] so it can be compared directly against a raw screen
/// width, while preventing arbitrary raw doubles from being used in M3-typed
/// APIs.
///
/// See [M3Contract] for the escape hatch when you must step outside the scale.
extension type const M3BreakpointValue._(double dp) implements double {}

/// Material Design 3 breakpoint pixel values for the five window size classes.
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
abstract final class M3Breakpoints {
  /// Compact — 0dp to 599dp. Phones in portrait.
  static const M3BreakpointValue compact = M3BreakpointValue._(0);

  /// Medium — 600dp to 839dp. Phones in landscape, small tablets.
  static const M3BreakpointValue medium = M3BreakpointValue._(600);

  /// Expanded — 840dp to 1199dp. Large tablets, foldables.
  static const M3BreakpointValue expanded = M3BreakpointValue._(840);

  /// Large — 1200dp to 1599dp. Desktop screens.
  static const M3BreakpointValue large = M3BreakpointValue._(1200);

  /// Extra-large — 1600dp and above. Large monitors.
  static const M3BreakpointValue extraLarge = M3BreakpointValue._(1600);

  /// The five breakpoints, in ascending order.
  static const List<M3BreakpointValue> values = <M3BreakpointValue>[
    compact,
    medium,
    expanded,
    large,
    extraLarge,
  ];
}

/// Material Design 3 layout region widths.
///
/// These bound the content itself rather than marking a window size class
/// boundary — a wide monitor still reads best with a constrained body.
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/pane-layouts
abstract final class M3LayoutWidths {
  /// Maximum body width on large and extra-large screens (1040dp).
  static const M3BreakpointValue body = M3BreakpointValue._(1040);

  /// Standard side-pane width in multi-pane layouts (360dp).
  static const M3BreakpointValue pane = M3BreakpointValue._(360);

  /// Maximum outer content width on extra-large screens (1920dp).
  static const M3BreakpointValue ultraWide = M3BreakpointValue._(1920);

  /// Unbounded width — content fills the available space.
  static const M3BreakpointValue unbounded =
      M3BreakpointValue._(double.infinity);

  /// The finite layout widths, in ascending order.
  ///
  /// Excludes [unbounded], which is a layout directive rather than a width.
  static const List<M3BreakpointValue> values = <M3BreakpointValue>[
    pane,
    body,
    ultraWide,
  ];
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

  /// The lower bound of this size class.
  M3BreakpointValue get minWidth => switch (this) {
        M3ScreenSize.compact => M3Breakpoints.compact,
        M3ScreenSize.medium => M3Breakpoints.medium,
        M3ScreenSize.expanded => M3Breakpoints.expanded,
        M3ScreenSize.large => M3Breakpoints.large,
        M3ScreenSize.extraLarge => M3Breakpoints.extraLarge,
      };

  /// Recommended column count for this size class.
  int get columns => switch (this) {
        M3ScreenSize.compact => 4,
        M3ScreenSize.medium => 8,
        _ => 12,
      };

  /// Recommended gutter width for this size class.
  M3SpacingValue get gutterWidth => switch (this) {
        M3ScreenSize.compact => M3Spacings.s16,
        _ => M3Spacings.s24,
      };

  /// Recommended horizontal page margin for this size class.
  M3SpacingValue get pageMargin => switch (this) {
        M3ScreenSize.compact => M3Margins.compactScreen,
        M3ScreenSize.medium => M3Margins.mediumScreen,
        M3ScreenSize.expanded => M3Margins.expandedScreen,
        M3ScreenSize.large => M3Margins.largeScreen,
        M3ScreenSize.extraLarge => M3Margins.extraLargeScreen,
      };

  /// Maximum content body width, or null for full-width.
  M3BreakpointValue? get bodyWidth => switch (this) {
        M3ScreenSize.compact || M3ScreenSize.medium => null,
        M3ScreenSize.expanded => M3Breakpoints.expanded,
        _ => M3LayoutWidths.body,
      };

  /// Maximum outer content width.
  M3BreakpointValue get maxContentWidth => switch (this) {
        M3ScreenSize.compact => M3LayoutWidths.unbounded,
        M3ScreenSize.medium => M3Breakpoints.expanded,
        M3ScreenSize.expanded => M3Breakpoints.large,
        M3ScreenSize.large => M3Breakpoints.extraLarge,
        M3ScreenSize.extraLarge => M3LayoutWidths.ultraWide,
      };

  /// Standard side-pane width for multi-pane layouts.
  M3BreakpointValue get paneWidth => switch (this) {
        M3ScreenSize.compact => M3LayoutWidths.unbounded,
        _ => M3LayoutWidths.pane,
      };

  // --- Comparison helpers ---

  /// Whether this size class is at least [other].
  bool isAtLeast(M3ScreenSize other) => index >= other.index;

  /// Whether this size class is at most [other].
  bool isAtMost(M3ScreenSize other) => index <= other.index;

  /// Whether this size class represents a mobile screen.
  bool get isMobile =>
      this == M3ScreenSize.compact || this == M3ScreenSize.medium;

  /// Whether this size class represents a tablet screen.
  bool get isTablet => this == M3ScreenSize.expanded;

  /// Whether this size class represents a desktop screen.
  bool get isDesktop =>
      this == M3ScreenSize.large || this == M3ScreenSize.extraLarge;
}
