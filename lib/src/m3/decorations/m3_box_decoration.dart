part of '../../../../material_design.dart';

/// Custom box decoration that enforces Material Design 3 tokens.
class M3BoxDecoration extends BoxDecoration {
  /// Creates a box decoration using Material Design 3 shape tokens.
  const M3BoxDecoration({
    M3BorderRadius? super.borderRadius,
    M3Border? super.border,
    List<M3BoxShadow>? super.boxShadow,
    super.color,
    super.image,
    super.gradient,
    super.backgroundBlendMode,
  });
}
