import 'package:flutter/foundation.dart';

/// Opacity values used for state layers and other common UI elements,
/// following Material Design 3 guidelines.
///
/// State layers are semi-transparent overlays that indicate the state of an
/// interactive component (e.g., hovered, focused, pressed).
///
/// Reference: https://m3.material.io/foundations/interaction/states/state-layers
@immutable
abstract class M3StateLayerOpacity {
  /// Opacity for a hovered state layer (+8%).
  static const double hover = 0.08;

  /// Opacity for a focused state layer (+10%).
  static const double focus = 0.10;

  /// Opacity for a pressed state layer (+10%).
  static const double pressed = 0.10;

  /// Opacity for a dragged state layer (+16%).
  static const double dragged = 0.16;
}

/// General-purpose opacity values for UI elements like disabled components,
/// dividers, and backdrops, following Material Design 3 guidelines.
///
/// These opacities are typically applied directly to the element's color,
/// unlike state layers which are overlays.
@immutable
abstract class M3Opacity {
  /// Opacity for the content (e.g., text, icons) of a disabled component (38%).
  static const double disabledContent = 0.38;

  /// Opacity for the container of a disabled component (12%).
  static const double disabledContainer = 0.12;

  /// Opacity for dividers (12%).
  static const double divider = 0.12;

  /// Opacity for a scrim or backdrop, often used with dialogs or modals.
  /// Note: This is not a formal M3 token but a common practice.
  static const double backdrop = 0.5;
}
