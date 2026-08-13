part of '../../../tokens.dart';

const Color _m3ShadowColor = Color(0x26000000);

/// Pre-computed M3 shadow lists for each elevation level.
///
/// Reference: https://m3.material.io/styles/elevation/shadows
abstract final class M3ElevationShadows {
  /// Shadows for elevation level 0.
  static const List<M3BoxShadow> level0 = [];

  /// Shadows for elevation level 1.
  static const List<M3BoxShadow> level1 = [
    M3BoxShadow._(color: _m3ShadowColor, offset: Offset(0, 1), blurRadius: 2),
  ];

  /// Shadows for elevation level 2.
  static const List<M3BoxShadow> level2 = [
    M3BoxShadow._(color: _m3ShadowColor, offset: Offset(0, 1), blurRadius: 3),
    M3BoxShadow._(
        color: _m3ShadowColor,
        offset: Offset(0, 2),
        blurRadius: 6,
        spreadRadius: 2),
  ];

  /// Shadows for elevation level 3.
  static const List<M3BoxShadow> level3 = [
    M3BoxShadow._(color: _m3ShadowColor, offset: Offset(0, 2), blurRadius: 4),
    M3BoxShadow._(
        color: _m3ShadowColor,
        offset: Offset(0, 4),
        blurRadius: 8,
        spreadRadius: 3),
  ];

  /// Shadows for elevation level 4.
  static const List<M3BoxShadow> level4 = [
    M3BoxShadow._(color: _m3ShadowColor, offset: Offset(0, 2), blurRadius: 4),
    M3BoxShadow._(
        color: _m3ShadowColor,
        offset: Offset(0, 4),
        blurRadius: 10,
        spreadRadius: 3),
  ];

  /// Shadows for elevation level 5.
  static const List<M3BoxShadow> level5 = [
    M3BoxShadow._(color: _m3ShadowColor, offset: Offset(0, 2), blurRadius: 4),
    M3BoxShadow._(
        color: _m3ShadowColor,
        offset: Offset(0, 4),
        blurRadius: 12,
        spreadRadius: 3),
  ];

  /// Returns the shadow list corresponding to the given elevation token.
  static List<M3BoxShadow> fromElevationToken(M3Elevation elevation) =>
      fromElevation(elevation.dp);

  /// Returns the shadow list corresponding to the given dp value.
  static List<M3BoxShadow> fromElevation(double value) => switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };
}
