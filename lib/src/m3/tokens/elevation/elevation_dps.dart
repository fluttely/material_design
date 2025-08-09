part of '../../../../material_design.dart';

/// Material Design 3 elevation constants in logical pixels (dp).
abstract final class M3ElevationDps {
  // Private constructor to prevent instantiation.
  const M3ElevationDps._();

  /// The base level, with no elevation (0 dp). Used for default surfaces.
  static const double level0 = 0;

  /// A subtle elevation (1 dp), typically for resting-state components like
  /// [Card].
  static const double level1 = 1;

  /// A more distinct elevation (3 dp), often used for menus and dialogs.
  static const double level2 = 3;

  /// A prominent elevation (6 dp), used for components like
  /// [FloatingActionButton].
  static const double level3 = 6;

  /// A higher elevation (8 dp) for components that need to stand out
  /// significantly.
  static const double level4 = 8;

  /// The highest standard elevation (12 dp), reserved for critical temporary
  /// surfaces.
  static const double level5 = 12;

  /// The list of [M3BoxShadow]s that represent this elevation level.
  List<M3BoxShadow> shadows(double elevation) =>
      M3ElevationShadows.fromElevation(elevation);
}
