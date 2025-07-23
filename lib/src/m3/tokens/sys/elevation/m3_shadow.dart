import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

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
@immutable
abstract class M3Shadow {
  // The color used for M3 shadows is black with a specific opacity.
  // We define it here for reuse.
  static final Color _shadowColor = Colors.black.withValues(alpha: 0.15);

  /// Level 0: No shadow.
  static const List<BoxShadow> level0 = [];

  /// Level 1 (1dp): A single, subtle shadow.
  static final List<BoxShadow> level1 = [
    BoxShadow(
      color: _shadowColor,
      offset: const Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  /// Level 2 (3dp): Two subtle shadows for added depth.
  static final List<BoxShadow> level2 = [
    BoxShadow(
      color: _shadowColor,
      offset: const Offset(0, 1),
      blurRadius: 3,
    ),
    BoxShadow(
      color: _shadowColor,
      offset: const Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 2,
    ),
  ];

  /// Level 3 (6dp): Two slightly more pronounced shadows.
  static final List<BoxShadow> level3 = [
    BoxShadow(
      color: _shadowColor,
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: _shadowColor,
      offset: const Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 3,
    ),
  ];

  /// Level 4 (8dp): Two distinct shadows for high elevation.
  static final List<BoxShadow> level4 = [
    BoxShadow(
      color: _shadowColor,
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: _shadowColor,
      offset: const Offset(0, 4),
      blurRadius: 10,
      spreadRadius: 3,
    ),
  ];

  /// Level 5 (12dp): The strongest shadows for maximum elevation.
  static final List<BoxShadow> level5 = [
    BoxShadow(
      color: _shadowColor,
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: _shadowColor,
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 3,
    ),
  ];

  static final Map<M3ElevationToken, List<BoxShadow>> _elevationMap = {
    M3ElevationToken.level0: level0,
    M3ElevationToken.level1: level1,
    M3ElevationToken.level2: level2,
    M3ElevationToken.level3: level3,
    M3ElevationToken.level4: level4,
    M3ElevationToken.level5: level5,
  };

  /// Generates a Material 3-compliant shadow list by interpolating between
  /// the official elevation levels.
  ///
  /// This method ensures that passing a standard elevation value (e.g., 6.0)
  /// returns the exact M3 shadow token, while intermediate values result in
  /// a smooth, linear transition between the two closest official levels.
  static List<BoxShadow> fromElevation(double elevation) {
    if (elevation <= 0) {
      return level0;
    }

    final elevations = _elevationMap.keys.toList();
    if (elevation >= elevations.last.value) {
      return _elevationMap[elevations.last]!;
    }

    final upperElevation = elevations.firstWhere((e) => e.value >= elevation);
    final lowerElevation = elevations[elevations.indexOf(upperElevation) - 1];

    final lowerShadows = _elevationMap[lowerElevation]!;
    final upperShadows = _elevationMap[upperElevation]!;

    final t = (elevation - lowerElevation.value) /
        (upperElevation.value - lowerElevation.value);

    final interpolatedShadows = <BoxShadow>[];
    final maxShadows = max(lowerShadows.length, upperShadows.length);

    for (var i = 0; i < maxShadows; i++) {
      final lower = i < lowerShadows.length ? lowerShadows[i] : null;
      final upper = i < upperShadows.length ? upperShadows[i] : null;
      final shadow = BoxShadow.lerp(lower, upper, t);
      if (shadow != null) {
        interpolatedShadows.add(shadow);
      }
    }
    return interpolatedShadows;
  }
}
