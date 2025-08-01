part of '../../../../../material_design.dart';

/// Custom box decoration that enforces Material Design 3 tokens.
class M3BoxDecoration extends BoxDecoration {
  /// Creates a box decoration using Material Design 3 shape tokens.
  M3BoxDecoration({
    M3BorderRadiusToken? borderRadius,
    M3Border? border,
    M3ShadowToken? boxShadow,
    super.color,
    super.image,
    super.gradient,
    super.backgroundBlendMode,
  }) : super(
          borderRadius: borderRadius?.value,
          shape: borderRadius == M3BorderRadiusToken.full
              ? BoxShape.circle
              : BoxShape.rectangle,
          border: border,
          boxShadow: boxShadow?.value,
        );
}
