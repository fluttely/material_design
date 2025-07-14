/// Standard icon sizes used across the Design following Material Design 3 specifications.
///
/// Material Design 3 uses a systematic approach to icon sizing with specific dp values
/// for different use cases and contexts.
///
/// Reference: https://m3.material.io/styles/icons/designing-icons
library;

/// Semantic icon sizes for different use cases in Material Design 3.
abstract final class MaterialIconSize {
  /// Small icons (16dp) - Used for dense layouts, small buttons, inline icons
  static const double small = 16;

  /// Medium icons (20dp) - Used for secondary actions, supporting content
  static const double medium = 20;

  /// Standard icons (24dp) - Default size for most UI elements
  static const double standard = 24;

  /// Large icons (32dp) - Used for prominent actions, navigation elements
  static const double large = 32;

  /// Extra large icons (48dp) - Used for app bars, major actions
  static const double extraLarge = 48;

  /// Hero icons (64dp) - Used for prominent displays, headers
  static const double hero = 64;

  /// Jumbo icons (96dp) - Used for onboarding, empty states
  static const double jumbo = 96;

  /// Giant icons (128dp) - Used for splash screens, major illustrations
  static const double giant = 128;

  // Convenience getters for common Material Design contexts
  /// Icon size for buttons (24dp)
  static const double button = standard;

  /// Icon size for app bars (24dp)
  static const double appBar = standard;

  /// Icon size for navigation (24dp)
  static const double navigation = standard;

  /// Icon size for FABs (24dp for icon inside 56dp container)
  static const double fab = standard;

  /// Icon size for chips (18dp)
  static const double chip = 18;

  /// Icon size for text fields (24dp)
  static const double textField = standard;

  /// Icon size for list items (24dp)
  static const double listItem = standard;

  /// Icon size for tabs (24dp)
  static const double tab = standard;

  // Additional specialized sizes
  /// Micro icon size (12dp) - For very dense layouts
  static const double micro = 12;

  /// Tiny icon size (14dp) - For compact elements
  static const double tiny = 14;

  /// Avatar icon size (40dp) - For user avatars
  static const double avatar = 40;

  /// Logo icon size (56dp) - For brand logos
  static const double logo = 56;
}
