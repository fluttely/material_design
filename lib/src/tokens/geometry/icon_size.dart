/// Standard icon sizes used across the Design following Material Design 3 specifications.
///
/// Material Design 3 primarily uses a standard icon size, but other sizes can be
/// used depending on the context and container. The default and most common size is 24dp.
///
/// Reference: https://m3.material.io/styles/icons/applying-icons
library;

/// Semantic icon sizes for different use cases in Material Design 3.
abstract final class MaterialIconSize {
  /// Standard icon size (24dp) - The default size for most UI elements.
  static const double standard = 24;

  // While Material 3 uses a default size of 24dp, other sizes can be used
  // contextually. For example, an icon in a dense component might be 20dp.
  // Developers should choose sizes based on visual balance and clarity for
  // the specific use case rather than adhering to a fixed set of named tokens.
}
