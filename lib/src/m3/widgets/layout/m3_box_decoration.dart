part of '../../../../../material_design.dart';

/// Custom box decoration that enforces Material Design 3 tokens.
class M3BoxDecoration extends BoxDecoration {
  /// Creates a box decoration using Material Design 3 shape tokens.
  M3BoxDecoration({
    M3ShapeToken? shape,
    // M3BorderWidthToken? borderWidth,
    M3Border? border,
    M3ElevationToken? elevation,
    super.color,
    super.image,
    super.gradient,
    super.backgroundBlendMode,
  }) : super(
          borderRadius: shape?.borderRadius.value,
          shape:
              shape == M3ShapeToken.full ? BoxShape.circle : BoxShape.rectangle,
          // border: M3Border.all(borderWidth),
          border: border,
          boxShadow: elevation?.shadows,
        );
}
