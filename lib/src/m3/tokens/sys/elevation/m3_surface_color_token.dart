part of '../../../../../material_design.dart';

/// Constants >>>
const M3ElevationToken _kM3SurfaceLevel0 = M3ElevationToken.level0;
const M3ElevationToken _kM3SurfaceLevel1 = M3ElevationToken.level1;
const M3ElevationToken _kM3SurfaceLevel2 = M3ElevationToken.level2;
const M3ElevationToken _kM3SurfaceLevel3 = M3ElevationToken.level3;
const M3ElevationToken _kM3SurfaceLevel4 = M3ElevationToken.level4;
const M3ElevationToken _kM3SurfaceLevel5 = M3ElevationToken.level5;

/// <<< Constants

// /// Token de cor de superfície com valor imutável
// class M3SurfaceColorToken implements IM3Token<Color> {
//   /// Construtores nomeados para cada nível
//   M3SurfaceColorToken.level0(BuildContext context)
//       : value = M3SurfaceTint.fromElevation(context, _kM3SurfaceLevel0);

//   M3SurfaceColorToken.level1(BuildContext context)
//       : value = M3SurfaceTint.fromElevation(context, _kM3SurfaceLevel1);

//   M3SurfaceColorToken.level2(BuildContext context)
//       : value = M3SurfaceTint.fromElevation(context, _kM3SurfaceLevel2);

//   M3SurfaceColorToken.level3(BuildContext context)
//       : value = M3SurfaceTint.fromElevation(context, _kM3SurfaceLevel3);

//   M3SurfaceColorToken.level4(BuildContext context)
//       : value = M3SurfaceTint.fromElevation(context, _kM3SurfaceLevel4);

//   M3SurfaceColorToken.level5(BuildContext context)
//       : value = M3SurfaceTint.fromElevation(context, _kM3SurfaceLevel5);
//   @override
//   final Color value;
// }

enum M3SurfaceColorToken {
  /// Surface color token for elevation level 0
  level0(_kM3SurfaceLevel0),

  /// Surface color token for elevation level 1
  level1(_kM3SurfaceLevel1),

  /// Surface color token for elevation level 2
  level2(_kM3SurfaceLevel2),

  /// Surface color token for elevation level 3
  level3(_kM3SurfaceLevel3),

  /// Surface color token for elevation level 4
  level4(_kM3SurfaceLevel4),

  /// Surface color token for elevation level 5
  level5(_kM3SurfaceLevel5);

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
  Color value(BuildContext context) =>
      M3SurfaceTint.fromElevation(context, _elevation);
}
