/// Defines a conventional z-index scale for managing the stacking order of UI components.
///
/// While Material Design 3 focuses on an elevation system (tonal and shadow elevation)
/// to express depth, it does not provide explicit z-index tokens. This class
/// offers a practical and conventional scale for managing stacking contexts,
/// which is a common requirement in complex UIs.
///
/// These values are not official M3 tokens but are provided as a utility for
/// developers to ensure consistent layering.
abstract final class MaterialZIndex {
  /// The z-index for elements that should be in the background, behind all other content.
  static const int background = 0;

  /// The default z-index for base content elements.
  static const int content = 1;

  /// The z-index for floating components that sit above content, such as a
  /// floating action button (FAB).
  static const int floating = 10;

  /// The z-index for temporary, overlaying UI like navigation drawers or menus
  /// that appear above floating elements.
  static const int drawer = 100;

  /// The z-index for modal components like dialogs or bottom sheets that must
  /// appear above all other app content, including drawers.
  static const int modal = 1000;

  /// The z-index for the most critical, top-level elements like snackbars or
  /// banners that must be visible above modals.
  static const int snackbar = 2000;

  /// The z-index for tooltips, which should appear above everything else to
  /// avoid being obscured.
  static const int tooltip = 9999;
}
