/// Defines conventional border width tokens for Material Design.
///
/// While Material Design 3 does not have a formal token scale for border
/// widths, it uses borders on several components (e.g., `OutlinedButton`,
/// `TextField`). A thin, 1dp border is the most common application.
///
/// This class provides a set of conventional widths to ensure consistency
/// when creating bordered components.
abstract final class MaterialBorder {
  /// The standard thin border width (1dp).
  ///
  /// This is the default for most components like `OutlinedButton`.
  static const double thin = 1;

  // /// A thicker border width (2dp) for emphasis or selected states.
  // static const double thick = 2;

  // /// An extra-thick border width (4dp) for special cases requiring
  // /// significant visual weight.
  // static const double extraThick = 4;
}
