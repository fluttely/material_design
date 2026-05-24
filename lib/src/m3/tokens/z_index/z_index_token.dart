part of '../../../../material_design.dart';

/// Conventional z-index values for consistent component layering.
///
/// These are not formal M3 tokens but provide a standardized stacking
/// hierarchy for complex UIs.
abstract final class M3ZIndexes {
  /// Background layer (0).
  static const int background = 0;

  /// Default content layer (1).
  static const int content = 1;

  /// Floating components — FABs, hover cards (10).
  static const int floating = 10;

  /// Navigation drawers and side panels (100).
  static const int drawer = 100;

  /// Modal dialogs, bottom sheets (1000).
  static const int modal = 1000;

  /// Snackbars, system notifications (2000).
  static const int snackbar = 2000;

  /// Tooltips — always on top (9999).
  static const int tooltip = 9999;
}
