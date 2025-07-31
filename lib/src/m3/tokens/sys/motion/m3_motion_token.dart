part of '../../../../../material_design.dart';

abstract final class M3MotionDurations {
  const M3MotionDurations._();

  /// Short1 duration (50ms) - Ultra-fast micro-interactions.
  static const Duration short1 = Durations.short1;

  /// Short2 duration (100ms) - Quick component transitions.
  static const Duration short2 = Durations.short2;

  /// Short3 duration (150ms) - Enhanced component transitions.
  static const Duration short3 = Durations.short3;

  /// Short4 duration (200ms) - Prominent short transitions.
  static const Duration short4 = Durations.short4;

  /// Medium1 duration (250ms) - Standard content transitions.
  static const Duration medium1 = Durations.medium1;

  /// Medium2 duration (300ms) - Common transition duration.
  static const Duration medium2 = Durations.medium2;

  /// Medium3 duration (350ms) - Enhanced medium transitions.
  static const Duration medium3 = Durations.medium3;

  /// Medium4 duration (400ms) - Prominent medium transitions.
  static const Duration medium4 = Durations.medium4;

  /// Long1 duration (450ms) - Complex view transitions.
  static const Duration long1 = Durations.long1;

  /// Long2 duration (500ms) - Standard long transitions.
  static const Duration long2 = Durations.long2;

  /// Long3 duration (550ms) - Enhanced long transitions.
  static const Duration long3 = Durations.long3;

  /// Long4 duration (600ms) - Prominent long transitions.
  static const Duration long4 = Durations.long4;

  /// Extra Long1 duration (700ms) - Major view changes.
  static const Duration extraLong1 = Durations.extralong1;

  /// Extra Long2 duration (800ms) - Complex layout changes.
  static const Duration extraLong2 = Durations.extralong2;

  /// Extra Long3 duration (900ms) - Large-scale transitions.
  static const Duration extraLong3 = Durations.extralong3;

  /// Extra Long4 duration (1000ms) - Maximum duration transitions.
  static const Duration extraLong4 = Durations.extralong4;
}

abstract final class M3MotionCurves {
  const M3MotionCurves._();

  /// Emphasized easing curve for prominent animations.
  static const ThreePointCubic emphasized = Curves.easeInOutCubicEmphasized;

  /// Emphasized decelerate for incoming elements.
  static const Curve emphasizedDecelerate = Easing.emphasizedDecelerate;

  /// Emphasized accelerate for outgoing elements.
  static const Curve emphasizedAccelerate = Easing.emphasizedAccelerate;

  /// Standard easing for common transitions.
  static const Curve standard = Easing.standard;

  /// Standard decelerate for incoming content.
  static const Curve standardDecelerate = Easing.standardDecelerate;

  /// Standard accelerate for outgoing content.
  static const Curve standardAccelerate = Easing.standardAccelerate;

  /// Linear easing for mechanical animations.
  static const Curve linear = Easing.linear;
}

// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Represents a Material Design 3 motion scheme, combining duration and easing.
///
/// This class encapsulates the two core components of an M3 animation:
/// - [duration]: How long the animation runs.
/// - [curve]: The easing easing that defines the rate of change over time.
///
/// While Material Design 3 specifies duration and easing tokens separately,
/// this class provides a convenient way to group them for direct use in
/// Flutter animations.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
class M3MotionScheme {
  /// Creates a motion scheme with a specific duration and easing.
  const M3MotionScheme(this.duration, this.curve);

  /// The total time the animation will take.
  final Duration duration;

  /// The easing easing for the animation.
  final Curve curve;

  /// Creates a [Tween] for this motion scheme, animating between [begin] and
  /// [end].
  ///
  /// This is a convenience method for creating a [CurveTween] that can be
  /// chained with another tween (like [Tween<double>]) and driven by an
  /// [AnimationController].
  ///
  /// Example:
  /// ```dart
  /// myAnimation = controller.drive(
  ///   M3MotionToken.emphasized.asTween(begin: 0.0, end: 1.0),
  /// );
  /// ```
  Animatable<T> asTween<T>({required T begin, required T end}) {
    return Tween<T>(begin: begin, end: end).chain(CurveTween(curve: curve));
  }
}

abstract final class M3Motions {
  // --- Emphasized Motion Tokens ---
  // For transitions of large-scale elements and hero moments.

  /// Emphasized motion for elements that are on-screen at the start and end.
  /// Duration: `long2` (500ms). Curve: `emphasized`.
  static const emphasized = M3MotionScheme(
    M3MotionDurations.long2,
    M3MotionCurves.emphasized,
  );

  /// Emphasized motion for elements that are entering the screen.
  /// Duration: `long1` (450ms). Curve: `emphasizedDecelerate`.
  static const emphasizedIncoming = M3MotionScheme(
    M3MotionDurations.long1,
    M3MotionCurves.emphasizedDecelerate,
  );

  /// Emphasized motion for elements that are exiting the screen.
  /// Duration: `short3` (150ms). Curve: `emphasizedAccelerate`.
  static const emphasizedOutgoing = M3MotionScheme(
    M3MotionDurations.short3,
    M3MotionCurves.emphasizedAccelerate,
  );

  // --- Standard Motion Tokens ---
  // For standard, functional transitions of smaller components.

  /// Standard motion for elements that are on-screen at the start and end.
  /// Duration: `medium2` (300ms). Curve: `standard`.
  static const standard = M3MotionScheme(
    M3MotionDurations.medium2,
    M3MotionCurves.standard,
  );

  /// Standard motion for elements that are entering the screen.
  /// Duration: `medium1` (250ms). Curve: `standardDecelerate`.
  static const standardIncoming = M3MotionScheme(
    M3MotionDurations.medium1,
    M3MotionCurves.standardDecelerate,
  );

  /// Standard motion for elements that are exiting the screen.
  /// Duration: `short4` (200ms). Curve: `standardAccelerate`.
  static const standardOutgoing = M3MotionScheme(
    M3MotionDurations.short4,
    M3MotionCurves.standardAccelerate,
  );

  // --- Utility Motion Token ---

  /// A linear interpolation scheme. Not part of the core M3 token set, but
  /// useful for specific cases.
  /// Duration: `short3` (150ms). Curve: `linear`.
  static const linear = M3MotionScheme(
    M3MotionDurations.short3,
    M3MotionCurves.linear,
  );
}

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
  short1(M3MotionDurations.short1),

  /// Short2 duration (100ms) - Quick component transitions.
  short2(M3MotionDurations.short2),

  /// Short3 duration (150ms) - Enhanced component transitions.
  short3(M3MotionDurations.short3),

  /// Short4 duration (200ms) - Prominent short transitions.
  short4(M3MotionDurations.short4),

  /// Medium1 duration (250ms) - Standard content transitions.
  medium1(M3MotionDurations.medium1),

  /// Medium2 duration (300ms) - Common transition duration.
  medium2(M3MotionDurations.medium2),

  /// Medium3 duration (350ms) - Enhanced medium transitions.
  medium3(M3MotionDurations.medium3),

  /// Medium4 duration (400ms) - Prominent medium transitions.
  medium4(M3MotionDurations.medium4),

  /// Long1 duration (450ms) - Complex view transitions.
  long1(M3MotionDurations.long1),

  /// Long2 duration (500ms) - Standard long transitions.
  long2(M3MotionDurations.long2),

  /// Long3 duration (550ms) - Enhanced long transitions.
  long3(M3MotionDurations.long3),

  /// Long4 duration (600ms) - Prominent long transitions.
  long4(M3MotionDurations.long4),

  /// Extra Long1 duration (700ms) - Major view changes.
  extraLong1(M3MotionDurations.extraLong1),

  /// Extra Long2 duration (800ms) - Complex layout changes.
  extraLong2(M3MotionDurations.extraLong2),

  /// Extra Long3 duration (900ms) - Large-scale transitions.
  extraLong3(M3MotionDurations.extraLong3),

  /// Extra Long4 duration (1000ms) - Maximum duration transitions.
  extraLong4(M3MotionDurations.extraLong4);

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
/// Curve curve = M3MotionCurveToken.emphasized.value;
///
/// // Use in animations
/// AnimatedContainer(
///   curve: M3MotionCurveToken.standard.value,
///   duration: Duration(milliseconds: 300),
/// );
/// ```
///
/// Specification: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
enum M3MotionCurveToken implements IM3Token<Curve> {
  /// Emphasized easing curve for prominent animations.
  emphasized(M3MotionCurves.emphasized),

  /// Emphasized decelerate for incoming elements.
  emphasizedDecelerate(M3MotionCurves.emphasizedDecelerate),

  /// Emphasized accelerate for outgoing elements.
  emphasizedAccelerate(M3MotionCurves.emphasizedAccelerate),

  /// Standard easing for common transitions.
  standard(M3MotionCurves.standard),

  /// Standard decelerate for incoming content.
  standardDecelerate(M3MotionCurves.standardDecelerate),

  /// Standard accelerate for outgoing content.
  standardAccelerate(M3MotionCurves.standardAccelerate),

  /// Linear easing for mechanical animations.
  linear(M3MotionCurves.linear);

  /// Creates a motion easing token with the specified value.
  const M3MotionCurveToken(this.value);

  /// The easing curve value.
  @override
  final Curve value;
}

/// Defines the standard motion tokens for Material Design 3.
///
/// These tokens provide standardized duration and easing values for creating
/// consistent and natural-feeling animations across the application.
///
/// This class provides pre-combined [M3MotionScheme]s for convenience, built
/// from the granular [M3MotionDurationToken].value and [M3MotionCurveToken]
/// tokens.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration
enum M3MotionToken implements IM3Token<M3MotionScheme> {
  // --- Emphasized Motion Tokens ---
  // For transitions of large-scale elements and hero moments.

  /// Emphasized motion for elements that are on-screen at the start and end.
  /// Duration: `long2` (500ms). Curve: `emphasized`.
  emphasized(M3Motions.emphasized),

  /// Emphasized motion for elements that are entering the screen.
  /// Duration: `long1` (450ms). Curve: `emphasizedDecelerate`.
  emphasizedIncoming(M3Motions.emphasizedIncoming),

  /// Emphasized motion for elements that are exiting the screen.
  /// Duration: `short3` (150ms). Curve: `emphasizedAccelerate`.
  emphasizedOutgoing(M3Motions.emphasizedOutgoing),

  // --- Standard Motion Tokens ---
  // For standard, functional transitions of smaller components.

  /// Standard motion for elements that are on-screen at the start and end.
  /// Duration: `medium2` (300ms). Curve: `standard`.
  standard(M3Motions.standard),

  /// Standard motion for elements that are entering the screen.
  /// Duration: `medium1` (250ms). Curve: `standardDecelerate`.
  standardIncoming(M3Motions.standardIncoming),

  /// Standard motion for elements that are exiting the screen.
  /// Duration: `short4` (200ms). Curve: `standardAccelerate`.
  standardOutgoing(M3Motions.standardOutgoing),

  // --- Utility Motion Token ---

  /// A linear interpolation scheme. Not part of the core M3 token set, but
  /// useful for specific cases.
  /// Duration: `short3` (150ms). Curve: `linear`.
  linear(M3Motions.linear);

  /// Creates a motion token with the specified [M3MotionScheme].
  const M3MotionToken(this.value);

  /// The motion scheme value, containing both duration and easing curve.
  @override
  final M3MotionScheme value;

  /// Gets the duration component of this motion token.
  Duration get duration {
    return switch (this) {
      M3MotionToken.emphasized => M3MotionDurationToken.long2.value,
      M3MotionToken.emphasizedIncoming => M3MotionDurationToken.long1.value,
      M3MotionToken.emphasizedOutgoing => M3MotionDurationToken.short3.value,
      M3MotionToken.standard => M3MotionDurationToken.medium2.value,
      M3MotionToken.standardIncoming => M3MotionDurationToken.medium1.value,
      M3MotionToken.standardOutgoing => M3MotionDurationToken.short4.value,
      M3MotionToken.linear => M3MotionDurationToken.short3.value,
    };
  }

  /// Gets the easing curve component of this motion token.
  Curve get easing {
    return switch (this) {
      M3MotionToken.emphasized => M3MotionCurveToken.emphasized.value,
      M3MotionToken.emphasizedIncoming =>
        M3MotionCurveToken.emphasizedDecelerate.value,
      M3MotionToken.emphasizedOutgoing =>
        M3MotionCurveToken.emphasizedAccelerate.value,
      M3MotionToken.standard => M3MotionCurveToken.standard.value,
      M3MotionToken.standardIncoming =>
        M3MotionCurveToken.standardDecelerate.value,
      M3MotionToken.standardOutgoing =>
        M3MotionCurveToken.standardAccelerate.value,
      M3MotionToken.linear => M3MotionCurveToken.linear.value,
    };
  }

  /// Get appropriate duration based on distance or complexity.
  static Duration getDurationByDistance(MotionDistance distance) {
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
  static Curve getEasingByType(MotionType type) {
    switch (type) {
      case MotionType.incoming:
        return M3MotionCurveToken.emphasizedDecelerate.value;
      case MotionType.outgoing:
        return M3MotionCurveToken.emphasizedAccelerate.value;
      case MotionType.persistent:
        return M3MotionCurveToken.emphasized.value;
      case MotionType.standard:
        return M3MotionCurveToken.standard.value;
    }
  }
}

/// Motion distance categories for selecting appropriate durations.
enum MotionDistance {
  /// Short distance animations.
  short,

  /// Medium distance animations.
  medium,

  /// Long distance animations.
  long,

  /// Extra long distance animations.
  extraLong,
}

/// Motion types for selecting appropriate easing curves.
enum MotionType {
  /// Elements entering the screen.
  incoming,

  /// Elements exiting the screen.
  outgoing,

  /// Elements that persist on screen.
  persistent,

  /// Standard motion type.
  standard,
}
