part of '../../resolvers.dart';

/// Resolves [DesignBorderRadius] into Flutter [BorderRadius] values.

/// Converts [DesignBorderRadius] definitions to concrete [BorderRadius] objects.
class BorderRadiusResolver extends Equatable {
  const BorderRadiusResolver(this._radii);
  final RadiusTokens _radii;

  BorderRadius get none => DesignBorderRadius.none.toBorderRadius(_radii);

  BorderRadius all(DesignRadius radius) =>
      DesignBorderRadius.all(radius).toBorderRadius(_radii);

  BorderRadius circular(MaterialRadius radius) =>
      DesignBorderRadius.circular(radius).toBorderRadius(_radii);

  BorderRadius vertical({
    DesignRadius top = DesignRadius.none,
    DesignRadius bottom = DesignRadius.none,
  }) => DesignBorderRadius.vertical(
    top: top,
    bottom: bottom,
  ).toBorderRadius(_radii);

  BorderRadius horizontal({
    DesignRadius left = DesignRadius.none,
    DesignRadius right = DesignRadius.none,
  }) => DesignBorderRadius.horizontal(
    left: left,
    right: right,
  ).toBorderRadius(_radii);

  BorderRadius only({
    DesignRadius topLeft = DesignRadius.none,
    DesignRadius topRight = DesignRadius.none,
    DesignRadius bottomLeft = DesignRadius.none,
    DesignRadius bottomRight = DesignRadius.none,
  }) => DesignBorderRadius.only(
    topLeft: topLeft,
    topRight: topRight,
    bottomLeft: bottomLeft,
    bottomRight: bottomRight,
  ).toBorderRadius(_radii);

  @override
  List<Object?> get props => [
    _radii.tagged('_radii'),
  ];

  @override
  String toString() =>
      '''
    BorderRadiusResolver(
      _radii: $_radii,
    )
  ''';
}
