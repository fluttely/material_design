part of '../../../../../material_design.dart';

enum M3SurfaceColorToken implements IM3ContextualToken<Color> {
  /// Surface color token for elevation level 0
  level0(M3ElevationToken.level0),

  /// Surface color token for elevation level 1
  level1(M3ElevationToken.level1),

  /// Surface color token for elevation level 2
  level2(M3ElevationToken.level2),

  /// Surface color token for elevation level 3
  level3(M3ElevationToken.level3),

  /// Surface color token for elevation level 4
  level4(M3ElevationToken.level4),

  /// Surface color token for elevation level 5
  level5(M3ElevationToken.level5);

  /// Creates a surface color token with the given elevation.
  const M3SurfaceColorToken(this._elevation);

  /// Creates a surface color token from an elevation token interface.
  factory M3SurfaceColorToken.fromElevation(IM3ElevationToken elevation) =>
      M3SurfaceColorToken.fromElevationValue(elevation.value);

  /// Creates a surface color token from an elevation value.
  factory M3SurfaceColorToken.fromElevationValue(double value) =>
      switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };

  /// The elevation token associated with this surface color
  final M3ElevationToken _elevation;

  /// Returns the surface color value for the given context
  @override
  Color Function(BuildContext) get value => _resolve;

  @override
  Color _resolve(BuildContext context) =>
      M3SurfaceTint.fromElevation(context, _elevation);
}
