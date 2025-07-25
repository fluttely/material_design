part of '../../resolvers.dart';

/// Utility class for converting [DesignRadius] values to Flutter [Radius] objects.

/// Resolves [DesignRadius] values using the provided [RadiusTokens].
class RadiusResolver extends Equatable {
  const RadiusResolver(this._radii);
  final RadiusTokens _radii;

  Radius get none => DesignRadius.none.toRadius(_radii);

  Radius circular(MaterialRadius radius) =>
      DesignRadius.circular(radius).toRadius(_radii);
  Radius elliptical(MaterialRadius x, MaterialRadius y) =>
      DesignRadius.elliptical(x, y).toRadius(_radii);

  @override
  List<Object?> get props => [
    _radii.tagged('_radii'),
  ];

  @override
  String toString() =>
      '''
    RadiusResolver(
      _radii: $_radii,
    )
  ''';
}
