part of '../resolvers.dart';

/// Converts [MaterialSpacings] values into Flutter [EdgeInsets].

/// Helper that maps spacing tokens to [EdgeInsets] instances.
class EdgeInsetsResolver extends Equatable {
  const EdgeInsetsResolver(this._spacings);
  final SpacingTokens _spacings;

  EdgeInsets get none => EdgeInsets.all(_spacings.none);

  EdgeInsets all(final MaterialSpacings value) =>
      EdgeInsets.all(value.toDouble(_spacings));

  EdgeInsets symmetric({
    final MaterialSpacings? vertical,
    final MaterialSpacings? horizontal,
  }) => EdgeInsets.symmetric(
    horizontal: (horizontal ?? MaterialSpacings.none).toDouble(_spacings),
    vertical: (vertical ?? MaterialSpacings.none).toDouble(_spacings),
  );

  EdgeInsets only({
    final MaterialSpacings? left,
    final MaterialSpacings? top,
    final MaterialSpacings? right,
    final MaterialSpacings? bottom,
  }) => EdgeInsets.only(
    left: (left ?? MaterialSpacings.none).toDouble(_spacings),
    top: (top ?? MaterialSpacings.none).toDouble(_spacings),
    right: (right ?? MaterialSpacings.none).toDouble(_spacings),
    bottom: (bottom ?? MaterialSpacings.none).toDouble(_spacings),
  );

  // EdgeInsets get allExtraSmall => EdgeInsets.all(_spacings.extraSmall);
  // EdgeInsets get allSmall => EdgeInsets.all(_spacings.small);
  // EdgeInsets get allSemiSmall => EdgeInsets.all(_spacings.semiSmall);
  // EdgeInsets get allMedium => EdgeInsets.all(_spacings.medium);
  // EdgeInsets get allSemiLarge => EdgeInsets.all(_spacings.semiLarge);
  // EdgeInsets get allLarge => EdgeInsets.all(_spacings.large);
  // EdgeInsets get allExtraLarge => EdgeInsets.all(_spacings.extraLarge);
  // EdgeInsets get allSuperLarge => EdgeInsets.all(_spacings.superLarge);

  // EdgeInsets get verticalExtraSmall =>
  //     EdgeInsets.symmetric(vertical: _spacings.extraSmall);
  // EdgeInsets get verticalSmall => EdgeInsets.symmetric(vertical: _spacings.small);
  // EdgeInsets get verticalSemiSmall =>
  //     EdgeInsets.symmetric(vertical: _spacings.semiSmall);
  // EdgeInsets get verticalMedium =>
  //     EdgeInsets.symmetric(vertical: _spacings.medium);
  // EdgeInsets get verticalSemiLarge =>
  //     EdgeInsets.symmetric(vertical: _spacings.semiLarge);
  // EdgeInsets get verticalLarge => EdgeInsets.symmetric(vertical: _spacings.large);
  // EdgeInsets get verticalExtraLarge =>
  //     EdgeInsets.symmetric(vertical: _spacings.extraLarge);
  // EdgeInsets get verticalSuperLarge =>
  //     EdgeInsets.symmetric(vertical: _spacings.superLarge);

  // EdgeInsets get horizontalExtraSmall =>
  //     EdgeInsets.symmetric(horizontal: _spacings.extraSmall);
  // EdgeInsets get horizontalSmall =>
  //     EdgeInsets.symmetric(horizontal: _spacings.small);
  // EdgeInsets get horizontalSemiSmall =>
  //     EdgeInsets.symmetric(horizontal: _spacings.semiSmall);
  // EdgeInsets get horizontalMedium =>
  //     EdgeInsets.symmetric(horizontal: _spacings.medium);
  // EdgeInsets get horizontalSemiLarge =>
  //     EdgeInsets.symmetric(horizontal: _spacings.semiLarge);
  // EdgeInsets get horizontalLarge =>
  //     EdgeInsets.symmetric(horizontal: _spacings.large);
  // EdgeInsets get horizontalExtraLarge =>
  //     EdgeInsets.symmetric(horizontal: _spacings.extraLarge);
  // EdgeInsets get horizontalSuperLarge =>
  //     EdgeInsets.symmetric(horizontal: _spacings.superLarge);

  @override
  List<Object?> get props => [
    _spacings.tagged('_spacings'),
  ];

  @override
  String toString() =>
      '''
    EdgeInsetsResolver(
      _spacings: $_spacings,
    )
  ''';
}
