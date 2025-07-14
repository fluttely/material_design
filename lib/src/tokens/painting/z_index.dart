/// Z-index values defining the stacking order of components.
abstract final class MaterialZIndex {
  /// The z-index for background elements.
  static const int background = 0;

  /// The z-index for content elements.
  static const int content = 1;

  /// The z-index for dropdowns.
  static const int dropdown = 10;

  /// The z-index for modals.
  static const int modal = 100;

  /// The z-index for tooltips.
  static const int tooltip = 1000;

  /// The z-index for overlays.
  static const int overlay = 9999;
}
