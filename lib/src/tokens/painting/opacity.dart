/// Opacity values used for state layers and other common UI elements,
/// following Material Design 3 guidelines.
///
/// State layers are semi-transparent overlays that indicate the state of an
/// interactive component (e.g., hovered, focused, pressed).
///
/// Reference: https://m3.material.io/styles/states/overview
abstract final class MaterialOpacity {
  // --- State Layer Opacities ---

  /// Opacity for a hovered state layer (+8%).
  static const double hover = 0.08;

  /// Opacity for a focused state layer (+10%).
  static const double focus = 0.10;

  /// Opacity for a pressed state layer (+10%).
  static const double pressed = 0.10;

  /// Opacity for a dragged state layer (+16%).
  static const double dragged = 0.16;

  // --- Disabled State Opacities ---

  /// Opacity for the content (e.g., text, icons) of a disabled component.
  /// This is applied directly to the content, not as a state layer.
  static const double disabledContent = 0.38;

  /// Opacity for the container of a disabled component.
  /// This is applied directly to the container, not as a state layer.
  static const double disabledContainer = 0.12;

  // --- Other Common Opacities ---

  /// Opacity for a scrim or backdrop, often used with dialogs or modals.
  /// Note: This is not a formal M3 token but a common practice.
  static const double backdrop = 0.5;

  /// Opacity for dividers.
  /// In M3, divider color is often specified directly, but an opacity-based
  /// approach on top of a base color is also common.
  static const double divider = 0.12;
}
