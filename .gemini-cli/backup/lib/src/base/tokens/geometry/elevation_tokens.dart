part of '../design_tokens.dart';

/// Elevation values used for Material surfaces following Material Design 3 specification.
///
/// Elevation is the relative distance between two surfaces along the z-axis.
/// The Material Design 3 elevation system uses 6 levels (0-5) with specific dp values.
///
/// Reference: https://m3.material.io/styles/elevation/tokens

/// Semantic elevation levels for Material Design 3.
enum MaterialElevation {
  /// No elevation (0dp) - Used for surfaces at the base level
  none,

  /// Level 1 elevation (1dp) - Used for raised components like filled buttons
  small,

  /// Level 2 elevation (3dp) - Used for elevated components like cards
  medium,

  /// Level 3 elevation (6dp) - Used for floating components like FABs
  large,

  /// Level 4 elevation (8dp) - Used for navigation drawers
  extraLarge,

  /// Level 5 elevation (12dp) - Used for modal components like dialogs
  maximum;

  /// Converts the elevation enum to its corresponding dp value.
  double toDouble(ElevationTokens elevations) {
    return switch (this) {
      MaterialElevation.none => elevations.none,
      MaterialElevation.small => elevations.small,
      MaterialElevation.medium => elevations.medium,
      MaterialElevation.large => elevations.large,
      MaterialElevation.extraLarge => elevations.extraLarge,
      MaterialElevation.maximum => elevations.maximum,
    };
  }
}

/// Collection of elevation constants following Material Design 3 specifications.
///
/// Material Design 3 uses a 6-level elevation system:
/// - Level 0: 0dp (no elevation)
/// - Level 1: 1dp (raised elements)
/// - Level 2: 3dp (elevated elements)
/// - Level 3: 6dp (floating elements)
/// - Level 4: 8dp (navigation elements)
/// - Level 5: 12dp (modal elements)
class ElevationTokens extends Equatable {
  const ElevationTokens({
    double? none,
    double? small,
    double? medium,
    double? large,
    double? extraLarge,
    double? maximum,
  }) : none = none ?? ElevationTokens.level0,
       small = small ?? ElevationTokens.level1,
       medium = medium ?? ElevationTokens.level2,
       large = large ?? ElevationTokens.level3,
       extraLarge = extraLarge ?? ElevationTokens.level4,
       maximum = maximum ?? ElevationTokens.level5;

  /// Creates elevation tokens from a map configuration.
  factory ElevationTokens.fromMap(Map<String, dynamic> map) {
    double? d(String key) => (map[key] as num?)?.toDouble();

    return ElevationTokens(
      none: d('none'),
      small: d('small'),
      medium: d('medium'),
      large: d('large'),
      extraLarge: d('extraLarge'),
      maximum: d('maximum'),
    );
  }

  ElevationTokens copyWith({
    double? none,
    double? small,
    double? medium,
    double? large,
    double? extraLarge,
    double? maximum,
  }) {
    return ElevationTokens(
      none: none ?? this.none,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      maximum: maximum ?? this.maximum,
    );
  }

  /// Standard Material Design 3 elevation values.
  static const ElevationTokens defaults = ElevationTokens();

  /// No elevation (0dp) - Base level surfaces
  /// Usage: App backgrounds, surface containers
  final double none;

  /// Level 1 elevation (1dp) - Raised elements
  /// Usage: Filled buttons, filled cards, filled text fields
  final double small;

  /// Level 2 elevation (3dp) - Elevated elements
  /// Usage: Elevated cards, elevated buttons, dropdowns
  final double medium;

  /// Level 3 elevation (6dp) - Floating elements
  /// Usage: FABs, date pickers, menus
  final double large;

  /// Level 4 elevation (8dp) - Navigation elements
  /// Usage: Navigation drawers, navigation bars
  final double extraLarge;

  /// Level 5 elevation (12dp) - Modal elements
  /// Usage: Dialogs, modal bottom sheets, modal side sheets
  final double maximum;

  // Convenience getters for direct access to standard values
  /// No elevation (0dp)
  static const double level0 = MaterialDimensions.zero;

  /// Level 1 elevation (1dp)
  static const double level1 = ExtendedValues.x1;

  /// Level 2 elevation (3dp)
  static const double level2 = ExtendedValues.x3;

  /// Level 3 elevation (6dp)
  static const double level3 = ExtendedValues.x6;

  /// Level 4 elevation (8dp)
  static const double level4 = MaterialDimensions.x8;

  /// Level 5 elevation (12dp)
  static const double level5 = MaterialDimensions.x12;

  /// Returns the elevation value for a given semantic level.
  double elevationFor(MaterialElevation elevation) => elevation.toDouble(this);

  @override
  List<Object?> get props => [
    none,
    small,
    medium,
    large,
    extraLarge,
    maximum,
  ];

  @override
  String toString() =>
      '''
ElevationTokens(
  none: ${none}dp,
  small: ${small}dp,
  medium: ${medium}dp,
  large: ${large}dp,
  extraLarge: ${extraLarge}dp,
  maximum: ${maximum}dp,
)
''';
}
