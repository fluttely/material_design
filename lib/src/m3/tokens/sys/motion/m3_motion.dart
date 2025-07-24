import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// The set of durations in the Material specification.
///
/// See also:
///
/// * [M3 guidelines: Duration tokens](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#c009dec6-f29b-4503-b9f0-482af14a8bbd)
/// * [M3 guidelines: Applying easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)

/// Material Design 3 motion duration tokens for animation timing.
///
/// This enum defines standard duration values for animations and transitions
/// throughout the interface, ensuring consistent timing patterns that feel
/// natural and responsive. The duration system is carefully calibrated to
/// balance perceived performance with smooth, comprehensible motion.
///
/// ## Usage
///
/// ```dart
/// // Get standard short duration
/// Duration duration = M3MotionDurationToken.short2.value; // 100ms
///
/// // Use in animations
/// AnimationController(
///   duration: M3MotionDurationToken.medium2.value,
///   vsync: this,
/// );
/// ```
///
/// Specification: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
enum M3MotionDurationToken implements IM3Token<Duration> {
  /// Short1 duration (50ms) - Ultra-fast micro-interactions.
  short1(Durations.short1),

  /// Short2 duration (100ms) - Quick component transitions.
  short2(Durations.short2),

  /// Short3 duration (150ms) - Enhanced component transitions.
  short3(Durations.short3),

  /// Short4 duration (200ms) - Prominent short transitions.
  short4(Durations.short4),

  /// Medium1 duration (250ms) - Standard content transitions.
  medium1(Durations.medium1),

  /// Medium2 duration (300ms) - Common transition duration.
  medium2(Durations.medium2),

  /// Medium3 duration (350ms) - Enhanced medium transitions.
  medium3(Durations.medium3),

  /// Medium4 duration (400ms) - Prominent medium transitions.
  medium4(Durations.medium4),

  /// Long1 duration (450ms) - Complex view transitions.
  long1(Durations.long1),

  /// Long2 duration (500ms) - Standard long transitions.
  long2(Durations.long2),

  /// Long3 duration (550ms) - Enhanced long transitions.
  long3(Durations.long3),

  /// Long4 duration (600ms) - Prominent long transitions.
  long4(Durations.long4),

  /// Extra Long1 duration (700ms) - Major view changes.
  extraLong1(Durations.extralong1),

  /// Extra Long2 duration (800ms) - Complex layout changes.
  extraLong2(Durations.extralong2),

  /// Extra Long3 duration (900ms) - Large-scale transitions.
  extraLong3(Durations.extralong3),

  /// Extra Long4 duration (1000ms) - Maximum duration transitions.
  extraLong4(Durations.extralong4);

  /// Creates a motion duration token with the specified value.
  const M3MotionDurationToken(this.value);

  /// The duration value.
  @override
  final Duration value;

  /// Get appropriate duration based on distance or complexity
  static Duration getDuration(MotionDistance distance) {
    switch (distance) {
      case MotionDistance.short:
        return M3MotionDurationToken.short2.value;
      case MotionDistance.medium:
        return M3MotionDurationToken.medium2.value;
      case MotionDistance.long:
        return M3MotionDurationToken.long2.value;
      case MotionDistance.extraLong:
        return M3MotionDurationToken.extraLong2.value;
    }
  }
}

/// Motion distance categories for selecting appropriate durations
enum MotionDistance {
  short,
  medium,
  long,
  extraLong,
}

/// Material Design 3 motion easing tokens for animation curves.
///
/// This enum defines the acceleration and deceleration patterns
/// for animations and transitions, ensuring consistent motion
/// characteristics throughout the interface.
///
/// ## Usage
///
/// ```dart
/// // Get emphasized easing curve
/// Curve curve = M3MotionEasingToken.emphasized.value;
///
/// // Use in animations
/// AnimatedContainer(
///   curve: M3MotionEasingToken.standard.value,
///   duration: Duration(milliseconds: 300),
/// );
/// ```
///
/// Specification: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
enum M3MotionEasingToken implements IM3Token<Curve> {
  /// Emphasized easing curve for prominent animations.
  emphasized(Curves.easeInOutCubicEmphasized),

  /// Emphasized decelerate for incoming elements.
  emphasizedDecelerate(Easing.emphasizedDecelerate),

  /// Emphasized accelerate for outgoing elements.
  emphasizedAccelerate(Easing.emphasizedAccelerate),

  /// Standard easing for common transitions.
  standard(Easing.standard),

  /// Standard decelerate for incoming content.
  standardDecelerate(Easing.standardDecelerate),

  /// Standard accelerate for outgoing content.
  standardAccelerate(Easing.standardAccelerate),

  /// Linear easing for mechanical animations.
  linear(Easing.linear);

  /// Creates a motion easing token with the specified value.
  const M3MotionEasingToken(this.value);

  /// The easing curve value.
  @override
  final Curve value;

  /// Get appropriate easing based on motion type
  static Curve getEasing(MotionType type) {
    switch (type) {
      case MotionType.incoming:
        return M3MotionEasingToken.emphasizedDecelerate.value;
      case MotionType.outgoing:
        return M3MotionEasingToken.emphasizedAccelerate.value;
      case MotionType.persistent:
        return M3MotionEasingToken.emphasized.value;
      case MotionType.standard:
        return M3MotionEasingToken.standard.value;
    }
  }
}

/// Motion types for selecting appropriate easing curves
enum MotionType {
  incoming,
  outgoing,
  persistent,
  standard,
}
