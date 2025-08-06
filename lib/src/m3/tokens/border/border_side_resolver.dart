part of '../../../../../material_design.dart';

/// Custom BorderSide that enforces Material Design 3 tokens.
class M3BorderSide extends BorderSide {
  /// Creates a border side with Material Design 3 width tokens.
  const M3BorderSide({
    required Color outlineColor,
    M3BorderWidthToken width = M3BorderWidthToken.thin,
  }) : super(
          color: outlineColor,
          width: width == M3BorderWidthToken.none
              ? M3BorderWidths.none
              : width == M3BorderWidthToken.thin
                  ? M3BorderWidths.thin
                  : width == M3BorderWidthToken.thick
                      ? M3BorderWidths.thick
                      : width == M3BorderWidthToken.extraThick
                          ? M3BorderWidths.extraThick
                          : M3BorderWidths.none,
        );

  /// Standard thin border side (1dp width).
  ///
  /// The default border side for most Material Design components.
  /// Provides subtle definition without visual intrusion.
  const M3BorderSide.thin(Color outlineColor)
      : super(
          color: outlineColor,
          width: M3BorderWidths.thin,
        );

  /// Thick border side (2dp width).
  ///
  /// Enhanced border side for emphasis and selected states.
  /// Creates clear visual hierarchy and attention.
  const M3BorderSide.thick(Color outlineColor)
      : super(
          color: outlineColor,
          width: M3BorderWidths.thick,
        );

  /// Extra thick border side (4dp width).
  ///
  /// High-emphasis border side for critical states and special cases. Maximum
  /// visual weight for important boundaries.
  const M3BorderSide.extraThick(Color outlineColor)
      : super(
          color: outlineColor,
          width: M3BorderWidths.extraThick,
        );

  /// No border side (0dp width).
  ///
  /// A completely transparent border side with zero width.
  /// Used when borders need to be removed or made invisible.
  static const M3BorderSide none =
      M3BorderSide(outlineColor: Colors.transparent);
}
