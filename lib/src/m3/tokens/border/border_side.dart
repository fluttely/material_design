part of '../../../../../material_design.dart';

/// Material Design 3 [BorderSide] that enforces border-width tokens.
///
/// All width parameters must be [M3BorderWidthValue] from [M3BorderWidths],
/// preventing arbitrary border widths that break the design system.
class M3BorderSide extends BorderSide {
  /// Creates a border side using an M3 border-width token.
  const M3BorderSide({
    required Color outlineColor,
    M3BorderWidthValue width = M3BorderWidths.thin,
  }) : super(
          color: outlineColor,
          width: width,
          style: width == M3BorderWidths.none
              ? BorderStyle.none
              : BorderStyle.solid,
        );

  /// Standard thin border (1dp).
  const M3BorderSide.thin(Color outlineColor)
      : super(color: outlineColor, width: M3BorderWidths.thin);

  /// Emphasis border for focus / selected states (2dp).
  const M3BorderSide.thick(Color outlineColor)
      : super(color: outlineColor, width: M3BorderWidths.thick);

  /// High-emphasis border for error / critical states (4dp).
  const M3BorderSide.extraThick(Color outlineColor)
      : super(color: outlineColor, width: M3BorderWidths.extraThick);

  /// Invisible borderless side.
  static const M3BorderSide none = M3BorderSide(
    outlineColor: Colors.transparent,
    width: M3BorderWidths.none,
  );
}
