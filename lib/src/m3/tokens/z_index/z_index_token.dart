part of '../../../tokens.dart';

/// Type-safe wrapper for stacking-order values.
///
/// Implements [int] so it can be compared and sorted like any integer, while
/// preventing arbitrary raw integers from being used in M3-typed APIs.
///
/// See [M3Contract] for the escape hatch when you must step outside the scale.
extension type const M3ZIndexValue._(int order) implements int {}

/// Conventional z-index values for consistent component layering.
///
/// These are not formal M3 tokens but provide a standardized stacking
/// hierarchy for complex UIs.
abstract final class M3ZIndexes {
  /// Background layer (0).
  static const M3ZIndexValue background = M3ZIndexValue._(0);

  /// Default content layer (1).
  static const M3ZIndexValue content = M3ZIndexValue._(1);

  /// Floating components — FABs, hover cards (10).
  static const M3ZIndexValue floating = M3ZIndexValue._(10);

  /// Navigation drawers and side panels (100).
  static const M3ZIndexValue drawer = M3ZIndexValue._(100);

  /// Modal dialogs, bottom sheets (1000).
  static const M3ZIndexValue modal = M3ZIndexValue._(1000);

  /// Snackbars, system notifications (2000).
  static const M3ZIndexValue snackbar = M3ZIndexValue._(2000);

  /// Tooltips — always on top (9999).
  static const M3ZIndexValue tooltip = M3ZIndexValue._(9999);

  /// The stacking hierarchy, from back to front.
  static const List<M3ZIndexValue> values = <M3ZIndexValue>[
    background,
    content,
    floating,
    drawer,
    modal,
    snackbar,
    tooltip,
  ];
}
