part of '../../../tokens.dart';

/// Type-safe wrapper for M3 border width values.
///
/// Implements [double] so it can be passed to any Flutter API that accepts a
/// [double], while preventing arbitrary raw doubles from being used in
/// M3-typed APIs.
///
/// See [M3Contract] for the escape hatch when you must step outside the scale.
extension type const M3BorderWidthValue._(double dp) implements double {}

/// Material Design 3 border width tokens.
abstract final class M3BorderWidths {
  /// No border (0dp).
  static const M3BorderWidthValue none = M3BorderWidthValue._(0);

  /// Standard thin border (1dp).
  static const M3BorderWidthValue thin = M3BorderWidthValue._(1);

  /// Emphasis border for selected/focus states (2dp).
  static const M3BorderWidthValue thick = M3BorderWidthValue._(2);

  /// High-emphasis border for error/critical states (4dp).
  static const M3BorderWidthValue extraThick = M3BorderWidthValue._(4);

  /// The border width scale, in ascending order.
  static const List<M3BorderWidthValue> values = <M3BorderWidthValue>[
    none,
    thin,
    thick,
    extraThick,
  ];
}

/// Material Design 3 focus indicator tokens.
///
/// The focus indicator sits on its own scale: 3dp is deliberately *not* part
/// of [M3BorderWidths], because a focus ring is an accessibility affordance
/// rather than a component outline. Keeping it separate prevents 3dp from
/// leaking into ordinary borders.
///
/// Reference: https://m3.material.io/foundations/interaction/states/state-layers
abstract final class M3FocusIndicator {
  /// Focus ring thickness (3dp).
  static const M3BorderWidthValue thickness = M3BorderWidthValue._(3);

  /// Gap between the component boundary and the focus ring (3dp).
  static const M3SpacingValue offset = M3SpacingValue._(3);
}
