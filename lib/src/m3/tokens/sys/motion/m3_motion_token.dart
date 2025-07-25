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
}

// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Represents a Material Design 3 motion scheme, combining duration and easing.
///
/// This class encapsulates the two core components of an M3 animation:
/// - [duration]: How long the animation runs.
/// - [easing]: The easing easing that defines the rate of change over time.
///
/// While Material Design 3 specifies duration and easing tokens separately,
/// this class provides a convenient way to group them for direct use in
/// Flutter animations.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
class M3MotionScheme {
  /// Creates a motion scheme with a specific duration and easing.
  const M3MotionScheme(this.duration, this.easing);

  /// The total time the animation will take.
  final M3MotionDurationToken duration;

  /// The easing easing for the animation.
  final M3MotionEasingToken easing;

  /// Creates a [Tween] for this motion scheme, animating between [begin] and [end].
  ///
  /// This is a convenience method for creating a [CurveTween] that can be
  /// chained with another tween (like [Tween<double>]) and driven by an
  /// [AnimationController].
  ///
  /// Example:
  /// ```dart
  /// myAnimation = controller.drive(M3MotionToken.emphasized.asTween(begin: 0.0, end: 1.0));
  /// ```
  Animatable<T> asTween<T>({required T begin, required T end}) {
    return Tween<T>(begin: begin, end: end)
        .chain(CurveTween(curve: easing.value));
  }
}

/// Defines the standard motion tokens for Material Design 3.
///
/// These tokens provide standardized duration and easing values for creating
/// consistent and natural-feeling animations across the application.
///
/// This class provides pre-combined [M3MotionScheme]s for convenience, built
/// from the granular [M3MotionDurationToken].value and [M3MotionEasingToken] tokens.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration
enum M3MotionToken implements IM3Token<M3MotionScheme> {
  // --- Emphasized Motion Tokens ---
  // For transitions of large-scale elements and hero moments.

  /// Emphasized motion for elements that are on-screen at the start and end.
  /// Duration: `long2` (500ms). Curve: `emphasized`.
  emphasized(M3MotionScheme(
    M3MotionDurationToken.long2,
    M3MotionEasingToken.emphasized,
  )),

  /// Emphasized motion for elements that are entering the screen.
  /// Duration: `long1` (450ms). Curve: `emphasizedDecelerate`.
  emphasizedIncoming(M3MotionScheme(
    M3MotionDurationToken.long1,
    M3MotionEasingToken.emphasizedDecelerate,
  )),

  /// Emphasized motion for elements that are exiting the screen.
  /// Duration: `short3` (150ms). Curve: `emphasizedAccelerate`.
  emphasizedOutgoing(M3MotionScheme(
    M3MotionDurationToken.short3,
    M3MotionEasingToken.emphasizedAccelerate,
  )),

  // --- Standard Motion Tokens ---
  // For standard, functional transitions of smaller components.

  /// Standard motion for elements that are on-screen at the start and end.
  /// Duration: `medium2` (300ms). Curve: `standard`.
  standard(M3MotionScheme(
    M3MotionDurationToken.medium2,
    M3MotionEasingToken.standard,
  )),

  /// Standard motion for elements that are entering the screen.
  /// Duration: `medium1` (250ms). Curve: `standardDecelerate`.
  standardIncoming(M3MotionScheme(
    M3MotionDurationToken.medium1,
    M3MotionEasingToken.standardDecelerate,
  )),

  /// Standard motion for elements that are exiting the screen.
  /// Duration: `short4` (200ms). Curve: `standardAccelerate`.
  standardOutgoing(M3MotionScheme(
    M3MotionDurationToken.short4,
    M3MotionEasingToken.standardAccelerate,
  )),

  // --- Utility Motion Token ---

  /// A linear interpolation scheme. Not part of the core M3 token set, but
  /// useful for specific cases.
  /// Duration: `short3` (150ms). Curve: `linear`.
  linear(M3MotionScheme(
    M3MotionDurationToken.short3,
    M3MotionEasingToken.linear,
  ));

  /// Creates a motion token with the specified [M3MotionScheme].
  const M3MotionToken(this.value);

  /// The motion scheme value, containing both duration and easing curve.
  @override
  final M3MotionScheme value;

  /// Get appropriate duration based on distance or complexity.
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

  /// Get appropriate easing based on motion type.
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

/// Motion distance categories for selecting appropriate durations
enum MotionDistance {
  short,
  medium,
  long,
  extraLong,
}

/// Motion types for selecting appropriate easing curves
enum MotionType {
  incoming,
  outgoing,
  persistent,
  standard,
}
