import 'package:flutter/foundation.dart';

/// Material Design 3 motion duration tokens.
///
/// These tokens define standardized durations for animations, ensuring a
/// consistent pace across the application.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
@immutable
abstract final class M3MotionDuration {
  /// 50ms
  static const Duration short1 = Duration(milliseconds: 50);

  /// 100ms
  static const Duration short2 = Duration(milliseconds: 100);

  /// 150ms
  static const Duration short3 = Duration(milliseconds: 150);

  /// 200ms
  static const Duration short4 = Duration(milliseconds: 200);

  /// 250ms
  static const Duration medium1 = Duration(milliseconds: 250);

  /// 300ms
  static const Duration medium2 = Duration(milliseconds: 300);

  /// 350ms
  static const Duration medium3 = Duration(milliseconds: 350);

  /// 400ms
  static const Duration medium4 = Duration(milliseconds: 400);

  /// 450ms
  static const Duration long1 = Duration(milliseconds: 450);

  /// 500ms
  static const Duration long2 = Duration(milliseconds: 500);

  /// 550ms
  static const Duration long3 = Duration(milliseconds: 550);

  /// 600ms
  static const Duration long4 = Duration(milliseconds: 600);
}
