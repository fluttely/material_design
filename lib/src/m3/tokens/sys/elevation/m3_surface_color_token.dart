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
  level0(_kM3SurfaceLevel0),
  level1(_kM3SurfaceLevel1),
  level2(_kM3SurfaceLevel2),
  level3(_kM3SurfaceLevel3),
  level4(_kM3SurfaceLevel4),
  level5(_kM3SurfaceLevel5);

  final M3ElevationToken _elevation;

  const M3SurfaceColorToken(this._elevation);

  /// Factory method que retorna um wrapper com o valor
  Color value(BuildContext context) =>
      M3SurfaceTint.fromElevation(context, _elevation);

  factory M3SurfaceColorToken.fromElevation(IM3ElevationToken elevation) =>
      M3SurfaceColorToken.fromElevationValue(elevation.value);

  factory M3SurfaceColorToken.fromElevationValue(double value) =>
      switch (value) {
        >= 12 => level5,
        >= 8 => level4,
        >= 6 => level3,
        >= 3 => level2,
        >= 1 => level1,
        _ => level0,
      };
}
