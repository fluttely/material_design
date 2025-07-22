import 'package:flutter/material.dart';

/// The set of durations in the Material specification.
///
/// See also:
///
/// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
/// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)

/// System motion duration tokens for Material Design 3.
///
/// These durations define the timing for different types of animations
/// and transitions throughout the interface.
///
/// Specification: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
@immutable
abstract class M3MotionDuration {
  /// The short1 duration (50ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.short1
  static const Duration short1 = Durations.short1;

  /// The short2 duration (100ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.short2
  static const Duration short2 = Durations.short2;

  /// The short3 duration (150ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.short3
  static const Duration short3 = Durations.short3;

  /// The short4 duration (200ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.short4
  static const Duration short4 = Durations.short4;

  /// The medium1 duration (250ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.medium1
  static const Duration medium1 = Durations.medium1;

  /// The medium2 duration (300ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.medium2
  static const Duration medium2 = Durations.medium2;

  /// The medium3 duration (350ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.medium3
  static const Duration medium3 = Durations.medium3;

  /// The medium4 duration (400ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.medium4
  static const Duration medium4 = Durations.medium4;

  /// The long1 duration (450ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.long1
  static const Duration long1 = Durations.long1;

  /// The long2 duration (500ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.long2
  static const Duration long2 = Durations.long2;

  /// The long3 duration (550ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.long3
  static const Duration long3 = Durations.long3;

  /// The long4 duration (600ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.long4
  static const Duration long4 = Durations.long4;

  /// The extralong1 duration (700ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.extra-long1
  static const Duration extralong1 = Durations.extralong1;

  /// The extralong2 duration (800ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.extra-long2
  static const Duration extralong2 = Durations.extralong2;

  /// The extralong3 duration (900ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.extra-long3
  static const Duration extralong3 = Durations.extralong3;

  /// The extralong4 duration (1000ms) in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.duration.extra-long4
  static const Duration extralong4 = Durations.extralong4;
}

/// The set of easing curves in the Material specification.
///
/// See also:
///
/// * [M3 guidelines: Easing tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
/// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
/// * [Curves], for a collection of non-Material animation easing curves.

/// System motion easing tokens for Material Design 3.
///
/// These curves define the acceleration and deceleration patterns
/// for animations and transitions.
///
/// Specification: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
@immutable
abstract class M3MotionEasing {
  /// The emphasizedDecelerate easing curve in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Easing tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.easing.emphasized
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;

  /// The emphasizedDecelerate easing curve in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Easing tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.easing.emphasized.decelerate
  static const Curve emphasizedDecelerate = Easing.emphasizedDecelerate;

  /// The emphasizedAccelerate easing curve in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Easing tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.easing.emphasized.accelerate
  static const Curve emphasizedAccelerate = Easing.emphasizedAccelerate;

  /// The standard easing curve in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Easing tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.easing.standard
  static const Curve standard = Easing.standard;

  /// The standardDecelerate easing curve in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Easing tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.easing.standard.decelerate
  static const Curve standardDecelerate = Easing.standardDecelerate;

  /// The standardAccelerate easing curve in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Easing tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.easing.standard.accelerate
  static const Curve standardAccelerate = Easing.standardAccelerate;

  /// The linear easing curve in the Material specification.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: Easing tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#433b1153-2ea3-4fe2-9748-803a47bc97ee)
  /// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
  /// Token: md.sys.motion.easing.linear
  static const Curve linear = Easing.linear;
}
