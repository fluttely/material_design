part of '../../../../../material_design.dart';

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

  @override
  M3BorderRadius? get borderRadius {
    // 3. ADICIONAMOS um novo getter com um nome diferente.
    //    Ele acessa a propriedade `borderRadius` herdada e faz o cast seguro.
    //    O cast é seguro por causa da regra imposta no nosso construtor.
    return borderRadius;
  }
}
