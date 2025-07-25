part of '../../resolvers.dart';

/// Creates input borders based on tokenized radii values.

/// Helper that builds [OutlineInputBorder] and [UnderlineInputBorder] using
/// [DesignBorderRadius] tokens.
class InputBorderResolver extends Equatable {
  const InputBorderResolver(this._radii);
  final RadiusTokens _radii;

  InputBorder get none => InputBorder.none;

  OutlineInputBorder outline({
    BorderSide borderSide = BorderSide.none,
    DesignBorderRadius borderRadius = DesignBorderRadius.none,
  }) => DesignOutlineInputBorder(
    borderSide: borderSide,
    borderRadius: borderRadius,
  ).toOutline(_radii);

  UnderlineInputBorder underline({
    BorderSide borderSide = BorderSide.none,
    DesignBorderRadius borderRadius = DesignBorderRadius.none,
  }) => DesignUnderlineInputBorder(
    borderSide: borderSide,
    borderRadius: borderRadius,
  ).toUnderline(_radii);

  @override
  List<Object?> get props => [
    _radii.tagged('_radii'),
  ];

  @override
  String toString() =>
      '''
    InputBorderResolver(
      _radii: $_radii,
    )
  ''';
}
