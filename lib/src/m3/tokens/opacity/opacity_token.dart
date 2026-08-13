part of '../../../tokens.dart';

/// Type-safe wrapper for M3 opacity values. Implements [double] so it can be
/// passed to any Flutter API that accepts opacity, while preventing arbitrary
/// values in M3-typed APIs.
extension type const M3OpacityValue._(double alpha) implements double {}

/// Material Design 3 general opacity tokens.
abstract final class M3Opacities {
  /// Disabled content opacity (38%).
  static const M3OpacityValue disabledContent = M3OpacityValue._(0.38);

  /// Disabled container opacity (12%).
  static const M3OpacityValue disabledContainer = M3OpacityValue._(0.12);

  /// Divider opacity (12%).
  static const M3OpacityValue divider = M3OpacityValue._(0.12);

  /// Backdrop / scrim opacity (50%).
  static const M3OpacityValue backdrop = M3OpacityValue._(0.5);
}
