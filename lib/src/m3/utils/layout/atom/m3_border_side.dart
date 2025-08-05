part of '../../../../../../material_design.dart';

/// Custom BorderSide that enforces Material Design 3 tokens.
class M3BorderSide extends BorderSide {
  /// Creates a border side with Material Design 3 width tokens.
  const M3BorderSide({
    super.color,
    M3BorderWidthToken width = M3BorderWidthToken.thin,
    super.style,
  }) : super(
          width: width == M3BorderWidthToken.none
              ? M3BorderWidths.none
              : width == M3BorderWidthToken.thin
                  ? M3BorderWidths.thin
                  : width == M3BorderWidthToken.thick
                      ? M3BorderWidths.thick
                      : M3BorderWidths.extraThick,
        );

  /// No border side (0dp width).
  ///
  /// A completely transparent border side with zero width.
  /// Used when borders need to be removed or made invisible.
  static const M3BorderSide none = M3BorderSide(width: M3BorderWidthToken.none);

  /// Standard thin border side (1dp width).
  ///
  /// The default border side for most Material Design components.
  /// Provides subtle definition without visual intrusion.
  static const M3BorderSide thin = M3BorderSide();

  /// Thick border side (2dp width).
  ///
  /// Enhanced border side for emphasis and selected states.
  /// Creates clear visual hierarchy and attention.
  static const M3BorderSide thick =
      M3BorderSide(width: M3BorderWidthToken.thick);

  /// Extra thick border side (4dp width).
  ///
  /// High-emphasis border side for critical states and special cases. Maximum
  /// visual weight for important boundaries.
  static const M3BorderSide extraThick =
      M3BorderSide(width: M3BorderWidthToken.extraThick);
}
