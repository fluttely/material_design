import 'package:flutter/material.dart';

/// Provides pre-defined, Material 3-compliant shadow tokens.
///
/// These tokens directly reference Flutter's internal `kElevationToShadow` map,
/// ensuring they are perfectly aligned with the shadows used by standard
/// Material components like [Card], [Dialog], and [ElevatedButton].
///
/// The shadows are designed to work with a specific [shadowColor], which
/// should typically be `Colors.black`.
///
/// Reference: https://m3.material.io/styles/elevation/shadows
abstract final class MaterialShadow {
  /// No shadow. An empty list of [BoxShadow].
  static const List<BoxShadow> level0 = [];

  /// The shadow configuration for elevation level 1 (1dp).
  ///
  /// Corresponds to `kElevationToShadow[1]`.
  static final List<BoxShadow> level1 = kElevationToShadow[1]!;

  /// The shadow configuration for elevation level 2 (3dp).
  ///
  /// Note: M3 elevation level 2 is 3dp, so this references `kElevationToShadow[3]`.
  static final List<BoxShadow> level2 = kElevationToShadow[3]!;

  /// The shadow configuration for elevation level 3 (6dp).
  ///
  /// Corresponds to `kElevationToShadow[6]`.
  static final List<BoxShadow> level3 = kElevationToShadow[6]!;

  /// The shadow configuration for elevation level 4 (8dp).
  ///
  /// Corresponds to `kElevationToShadow[8]`.
  static final List<BoxShadow> level4 = kElevationToShadow[8]!;

  /// The shadow configuration for elevation level 5 (12dp).
  ///
  /// Corresponds to `kElevationToShadow[12]`.
  static final List<BoxShadow> level5 = kElevationToShadow[12]!;
}
