part of '../../resolvers.dart';

/// Provides convenience methods for creating border shapes using [RadiusTokens].

/// Builds Flutter shapes from [DesignBorderRadius] definitions.
class ShapeResolver extends Equatable {
  const ShapeResolver(this._radii);
  final RadiusTokens _radii;

  BoxShape get rectangleBoxShape => BoxShape.rectangle;
  BoxShape get circleBoxShape => BoxShape.circle;

  CircleBorder get circleBorder => const CircleBorder();
  StadiumBorder get stadiumBorder => const StadiumBorder();

  RoundedRectangleBorder roundedRectangleBorder({
    BorderSide borderSide = BorderSide.none,
    DesignBorderRadius borderRadius = DesignBorderRadius.none,
  }) => DesignRoundedRectangleBorder(
    borderSide: borderSide,
    borderRadius: borderRadius,
  ).toRoundedRectangleBorder(_radii);

  BeveledRectangleBorder beveledRectangleBorder({
    BorderSide borderSide = BorderSide.none,
    DesignBorderRadius borderRadius = DesignBorderRadius.none,
  }) => DesignBeveledRectangleBorder(
    borderSide: borderSide,
    borderRadius: borderRadius,
  ).toBeveledRectangleBorder(_radii);

  ContinuousRectangleBorder continuousRectangleBorder({
    BorderSide borderSide = BorderSide.none,
    DesignBorderRadius borderRadius = DesignBorderRadius.none,
  }) => DesignContinuousRectangleBorder(
    borderSide: borderSide,
    borderRadius: borderRadius,
  ).toContinuousRectangleBorder(_radii);

  @override
  List<Object?> get props => [
    _radii.tagged('_radii'),
  ];

  @override
  String toString() =>
      '''
    ShapeResolver(
      _radii: $_radii,
    )
  ''';
}
