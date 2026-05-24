part of '../../../../material_design.dart';

/// Type-safe wrapper for M3 border width values.
extension type const M3BorderWidthValue(double _) implements double {}

/// Material Design 3 border width tokens.
abstract final class M3BorderWidths {
  /// No border (0dp).
  static const M3BorderWidthValue none = M3BorderWidthValue(0);

  /// Standard thin border (1dp).
  static const M3BorderWidthValue thin = M3BorderWidthValue(1);

  /// Emphasis border for selected/focus states (2dp).
  static const M3BorderWidthValue thick = M3BorderWidthValue(2);

  /// High-emphasis border for error/critical states (4dp).
  static const M3BorderWidthValue extraThick = M3BorderWidthValue(4);
}
