part of '../../../../material_design.dart';

/// Material Design 3 [Border] that enforces M3 border tokens.
class M3Border extends Border {
  const M3Border({
    M3BorderSide top = M3BorderSide.none,
    M3BorderSide right = M3BorderSide.none,
    M3BorderSide bottom = M3BorderSide.none,
    M3BorderSide left = M3BorderSide.none,
  }) : super(top: top, right: right, bottom: bottom, left: left);

  const M3Border.fromBorderSide(M3BorderSide super.side)
      : super.fromBorderSide();

  /// All-sides border with an M3 width token (default: thin/1dp).
  M3Border.all({
    required Color outlineColor,
    M3BorderWidthValue width = M3BorderWidths.thin,
  }) : super.fromBorderSide(M3BorderSide(outlineColor: outlineColor, width: width));

  /// All-sides thin border (1dp).
  M3Border.thin(Color outlineColor)
      : super.fromBorderSide(M3BorderSide.thin(outlineColor));

  /// All-sides thick border (2dp).
  M3Border.thick(Color outlineColor)
      : super.fromBorderSide(M3BorderSide.thick(outlineColor));

  /// All-sides extra-thick border (4dp).
  M3Border.extraThick(Color outlineColor)
      : super.fromBorderSide(M3BorderSide.extraThick(outlineColor));

  /// No visible border.
  static M3Border none = const M3Border.fromBorderSide(M3BorderSide.none);
}
