part of 'm3_elevation_token.dart';

const Color _kM3ShadowColor = Color(0x26000000);
const List<BoxShadow> _kM3ShadowLevel0 = [];
const List<BoxShadow> _kM3ShadowLevel1 = [
  BoxShadow(
    color: _kM3ShadowColor,
    offset: Offset(0, 1),
    blurRadius: 2,
  ),
];
const List<BoxShadow> _kM3ShadowLevel2 = [
  BoxShadow(
    color: _kM3ShadowColor,
    offset: Offset(0, 1),
    blurRadius: 3,
  ),
  BoxShadow(
    color: _kM3ShadowColor,
    offset: Offset(0, 2),
    blurRadius: 6,
    spreadRadius: 2,
  ),
];
const List<BoxShadow> _kM3ShadowLevel3 = [
  BoxShadow(
    color: _kM3ShadowColor,
    offset: Offset(0, 2),
    blurRadius: 4,
  ),
  BoxShadow(
    color: _kM3ShadowColor,
    offset: Offset(0, 4),
    blurRadius: 8,
    spreadRadius: 3,
  ),
];
const List<BoxShadow> _kM3ShadowLevel4 = [
  BoxShadow(
    color: _kM3ShadowColor,
    offset: Offset(0, 2),
    blurRadius: 4,
  ),
  BoxShadow(
    color: _kM3ShadowColor,
    offset: Offset(0, 4),
    blurRadius: 10,
    spreadRadius: 3,
  ),
];
const List<BoxShadow> _kM3ShadowLevel5 = [
  BoxShadow(
    color: _kM3ShadowColor,
    offset: Offset(0, 2),
    blurRadius: 4,
  ),
  BoxShadow(
    color: _kM3ShadowColor,
    offset: Offset(0, 4),
    blurRadius: 12,
    spreadRadius: 3,
  ),
];

/// Provides pre-defined, Material 3-compliant shadow tokens.
///
/// These tokens are defined directly from the Material 3 specification and
/// are composed of one or two simple `BoxShadow` layers. They are designed
/// to be used with a `shadowColor`, which defaults to `Colors.black` in
/// most Material components.
///
/// Note: The primary indicator of elevation in M3 is the "Surface Tint",
/// with these shadows acting as a complementary element.
///
/// Reference: https://m3.material.io/styles/elevation/shadows
enum _M3ShadowToken implements IM3Token<List<BoxShadow>> {
  /// Level 0: No shadow.
  level0(_kM3ShadowLevel0),

  /// Level 1 (1dp): A single, subtle shadow.
  level1(_kM3ShadowLevel1),

  /// Level 2 (3dp): Two subtle shadows for added depth.
  level2(_kM3ShadowLevel2),

  /// Level 3 (6dp): Two slightly more pronounced shadows.
  level3(_kM3ShadowLevel3),

  /// Level 4 (8dp): Two distinct shadows for high elevation.
  level4(_kM3ShadowLevel4),

  /// Level 5 (12dp): The strongest shadows for maximum elevation.
  level5(_kM3ShadowLevel5);

  const _M3ShadowToken(this.value);

  /// The shadows for this elevation level.
  @override
  final List<BoxShadow> value;

  /// The color used for M3 shadows is black with 15% opacity.
  /// 0x26 = 38 in decimal = 15% of 255 = 38/255 ≈ 0.149 opacity
  Color get shadowColor => _kM3ShadowColor;

  /// Returns a shadow token for a given M3ElevationToken.
  /// This method now delegates the logic to [fromElevationValue].
  factory _M3ShadowToken.fromElevation(IM3ElevationToken elevation) =>
      _M3ShadowToken.fromElevationValue(elevation.value);

  /// Returns a shadow token for a given elevation value in dp.
  /// This method contains the core logic and is the single source of truth.
  factory _M3ShadowToken.fromElevationValue(double value) => switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };
}
