part of '../design_tokens.dart';

/// Standard icon sizes used across the toolkit following Material Design 3 specifications.
///
/// Material Design 3 uses a systematic approach to icon sizing with specific dp values
/// for different use cases and contexts.
///
/// Reference: https://m3.material.io/styles/icons/designing-icons

/// Semantic icon sizes for different use cases in Material Design 3.
enum MaterialIconSize {
  /// Small icons (16dp) - Used for dense layouts, small buttons, inline icons
  small,

  /// Medium icons (20dp) - Used for secondary actions, supporting content
  medium,

  /// Standard icons (24dp) - Default size for most UI elements
  standard,

  /// Large icons (32dp) - Used for prominent actions, navigation elements
  large,

  /// Extra large icons (48dp) - Used for app bars, major actions
  extraLarge,

  /// Hero icons (64dp) - Used for prominent displays, headers
  hero,

  /// Jumbo icons (96dp) - Used for onboarding, empty states
  jumbo,

  /// Giant icons (128dp) - Used for splash screens, major illustrations
  giant;

  /// Converts the icon size enum to its corresponding dp value.
  double toDouble(IconSizeTokens iconSizes) {
    return switch (this) {
      MaterialIconSize.small => iconSizes.small,
      MaterialIconSize.medium => iconSizes.medium,
      MaterialIconSize.standard => iconSizes.standard,
      MaterialIconSize.large => iconSizes.large,
      MaterialIconSize.extraLarge => iconSizes.extraLarge,
      MaterialIconSize.hero => iconSizes.hero,
      MaterialIconSize.jumbo => iconSizes.jumbo,
      MaterialIconSize.giant => iconSizes.giant,
    };
  }
}

/// Collection of icon size constants following Material Design 3 specifications.
///
/// Material Design 3 icon sizing follows these guidelines:
/// - Small (16dp): Dense UI, small buttons, inline content
/// - Medium (20dp): Secondary actions, supporting elements
/// - Standard (24dp): Default size for most icons
/// - Large (32dp): Prominent actions, navigation
/// - Extra Large (48dp): App bars, major CTAs
/// - Hero (64dp): Headers, prominent displays
/// - Jumbo (96dp): Onboarding, empty states
/// - Giant (128dp): Splash screens, major illustrations
class IconSizeTokens extends Equatable {
  const IconSizeTokens({
    double? small,
    double? medium,
    double? standard,
    double? large,
    double? extraLarge,
    double? hero,
    double? jumbo,
    double? giant,
  }) : small = small ?? MaterialDimensions.x16,
       medium = medium ?? MaterialDimensions.x20,
       standard = standard ?? MaterialDimensions.x24,
       large = large ?? MaterialDimensions.x32,
       extraLarge = extraLarge ?? MaterialDimensions.x48,
       hero = hero ?? MaterialDimensions.x64,
       jumbo = jumbo ?? MaterialDimensions.x96,
       giant = giant ?? MaterialDimensions.x128;

  /// Creates icon size tokens from a map configuration.
  factory IconSizeTokens.fromMap(Map<String, dynamic> map) {
    double? d(String key) => (map[key] as num?)?.toDouble();

    return IconSizeTokens(
      small: d('small'),
      medium: d('medium'),
      standard: d('standard'),
      large: d('large'),
      extraLarge: d('extraLarge'),
      hero: d('hero'),
      jumbo: d('jumbo'),
      giant: d('giant'),
    );
  }

  IconSizeTokens copyWith({
    double? small,
    double? medium,
    double? standard,
    double? large,
    double? extraLarge,
    double? hero,
    double? jumbo,
    double? giant,
  }) {
    return IconSizeTokens(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      standard: standard ?? this.standard,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      hero: hero ?? this.hero,
      jumbo: jumbo ?? this.jumbo,
      giant: giant ?? this.giant,
    );
  }

  /// Standard Material Design 3 icon size values.
  static const IconSizeTokens defaults = IconSizeTokens();

  /// Small icons (16dp) - Used for dense layouts, small buttons, inline icons
  /// Usage: Chips, dense lists, small action buttons, inline content
  final double small;

  /// Medium icons (20dp) - Used for secondary actions, supporting content
  /// Usage: Secondary buttons, menu items, supporting actions
  final double medium;

  /// Standard icons (24dp) - Default size for most UI elements
  /// Usage: Default buttons, toolbars, navigation, primary actions
  final double standard;

  /// Large icons (32dp) - Used for prominent actions, navigation elements
  /// Usage: Tab bars, bottom navigation, prominent buttons
  final double large;

  /// Extra large icons (48dp) - Used for app bars, major actions
  /// Usage: App bars, floating action buttons, major CTAs
  final double extraLarge;

  /// Hero icons (64dp) - Used for prominent displays, headers
  /// Usage: Headers, feature highlights, prominent displays
  final double hero;

  /// Jumbo icons (96dp) - Used for onboarding, empty states
  /// Usage: Onboarding screens, empty states, feature illustrations
  final double jumbo;

  /// Giant icons (128dp) - Used for splash screens, major illustrations
  /// Usage: Splash screens, major illustrations, brand elements
  final double giant;

  // Convenience getters for common Material Design contexts
  /// Icon size for buttons (24dp)
  static const double button = MaterialDimensions.x24;

  /// Icon size for app bars (24dp)
  static const double appBar = MaterialDimensions.x24;

  /// Icon size for navigation (24dp)
  static const double navigation = MaterialDimensions.x24;

  /// Icon size for FABs (24dp for icon inside 56dp container)
  static const double fab = MaterialDimensions.x24;

  /// Icon size for chips (18dp)
  static const double chip = ExtendedValues.x18;

  /// Icon size for text fields (24dp)
  static const double textField = MaterialDimensions.x24;

  /// Icon size for list items (24dp)
  static const double listItem = MaterialDimensions.x24;

  /// Icon size for tabs (24dp)
  static const double tab = MaterialDimensions.x24;

  // Additional specialized sizes
  /// Micro icon size (12dp) - For very dense layouts
  static const double micro = MaterialDimensions.x12;

  /// Tiny icon size (14dp) - For compact elements
  static const double tiny = ExtendedValues.x14;

  /// Avatar icon size (40dp) - For user avatars
  static const double avatar = MaterialDimensions.x40;

  /// Logo icon size (56dp) - For brand logos
  static const double logo = MaterialDimensions.x56;

  /// Returns the icon size value for a given semantic size.
  double sizeFor(MaterialIconSize iconSize) => iconSize.toDouble(this);

  @override
  List<Object?> get props => [
    small,
    medium,
    standard,
    large,
    extraLarge,
    hero,
    jumbo,
    giant,
  ];

  @override
  String toString() =>
      '''
IconSizeTokens(
  small: ${small}dp,
  medium: ${medium}dp,
  standard: ${standard}dp,
  large: ${large}dp,
  extraLarge: ${extraLarge}dp,
  hero: ${hero}dp,
  jumbo: ${jumbo}dp,
  giant: ${giant}dp,
)
''';
}
