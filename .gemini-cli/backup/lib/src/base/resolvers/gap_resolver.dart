part of 'resolvers.dart';

/// Creates [Gap] widgets based on spacing tokens with extended functionality.
///
/// Provides both semantic (extraSmall, large) and direct pixel value access.
class GapResolver extends Equatable {
  const GapResolver(this._spacings);

  final SpacingTokens _spacings;

  /// Semantic gap getters
  Gap get none => Gap(_spacings.none);
  Gap get extraSmall => Gap(_spacings.extraSmall);
  Gap get small => Gap(_spacings.small);
  Gap get medium => Gap(_spacings.medium);
  Gap get large => Gap(_spacings.large);
  Gap get extraLarge => Gap(_spacings.extraLarge);

  /// Creates a gap with custom width and height
  Gap custom(double size) => Gap(size);

  @override
  List<Object?> get props => [
    _spacings.tagged('_spacings'),
  ];

  @override
  String toString() =>
      '''GapResolver(
  $_spacings)
  ''';
}
