import 'package:flutter/material.dart';

/// Elevation values used for Material surfaces following the Material Design 3
/// specification.
///
/// Elevation is the relative distance between two surfaces along the z-axis.
/// The Material Design 3 elevation system uses 6 levels (0-5) with specific
/// dp values.
///
/// Reference: https://m3.material.io/styles/elevation/tokens
@immutable
abstract final class M3Elevation {
  /// No elevation (0dp) - Used for surfaces at the base level.
  static const double level0 = 0;

  /// Level 1 elevation (1dp) - Used for raised components like filled buttons.
  static const double level1 = 1;

  /// Level 2 elevation (3dp) - Used for elevated components like cards.
  static const double level2 = 3;

  /// Level 3 elevation (6dp) - Used for floating components like FABs.
  static const double level3 = 6;

  /// Level 4 elevation (8dp) - Used for navigation drawers.
  static const double level4 = 8;

  /// Level 5 elevation (12dp) - Used for modal components like dialogs.
  static const double level5 = 12;

  /// A list of all elevation levels for easy iteration.
  static const List<double> allLevels = [
    level0,
    level1,
    level2,
    level3,
    level4,
    level5,
  ];
}
