part of '../../../../../material_design.dart';

class M3Border extends Border {
  /// Creates a border with all sides using the same Material Design 3 token.
  ///
  /// This is the most common way to create a uniform border around a component.
  /// The width parameter must be a Material Design 3 border token to ensure
  /// consistent styling.
  ///
  /// The [side] parameter defines the border appearance for all sides.
  ///
  /// Example:
  /// ```dart
  /// final border = M3Border.all(
  ///   width: M3BorderWidthToken.thin,
  ///   color: Colors.grey,
  /// );
  /// ```
  M3Border.all(M3BorderSideToken? side)
      : super(
          top: side?.value ?? BorderSide.none,
          right: side?.value ?? BorderSide.none,
          bottom: side?.value ?? BorderSide.none,
          left: side?.value ?? BorderSide.none,
        );

  const M3Border.fromBorderSide(M3BorderSide? side)
      : super.fromBorderSide(side ?? M3BorderSide.none);
}
