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

  static const M3BorderSide none = M3BorderSide(width: M3BorderWidthToken.none);
}
