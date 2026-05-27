part of '../../../material_design.dart';

/// Material Design 3 motion duration tokens.
class M3MotionDuration extends Duration {
  const M3MotionDuration._({super.milliseconds});

  /// 50ms — ultra-fast micro-interactions.
  static const M3MotionDuration short1 = M3MotionDuration._(milliseconds: 50);

  /// 100ms — quick component transitions.
  static const M3MotionDuration short2 = M3MotionDuration._(milliseconds: 100);

  /// 150ms — enhanced component transitions.
  static const M3MotionDuration short3 = M3MotionDuration._(milliseconds: 150);

  /// 200ms — prominent short transitions.
  static const M3MotionDuration short4 = M3MotionDuration._(milliseconds: 200);

  /// 250ms — standard content transitions.
  static const M3MotionDuration medium1 = M3MotionDuration._(milliseconds: 250);

  /// 300ms — common transition duration.
  static const M3MotionDuration medium2 = M3MotionDuration._(milliseconds: 300);

  /// 350ms — enhanced medium transitions.
  static const M3MotionDuration medium3 = M3MotionDuration._(milliseconds: 350);

  /// 400ms — prominent medium transitions.
  static const M3MotionDuration medium4 = M3MotionDuration._(milliseconds: 400);

  /// 450ms — complex view transitions.
  static const M3MotionDuration long1 = M3MotionDuration._(milliseconds: 450);

  /// 500ms — standard long transitions.
  static const M3MotionDuration long2 = M3MotionDuration._(milliseconds: 500);

  /// 550ms — enhanced long transitions.
  static const M3MotionDuration long3 = M3MotionDuration._(milliseconds: 550);

  /// 600ms — prominent long transitions.
  static const M3MotionDuration long4 = M3MotionDuration._(milliseconds: 600);

  /// 700ms — major view changes.
  static const M3MotionDuration extraLong1 =
      M3MotionDuration._(milliseconds: 700);

  /// 800ms — complex layout changes.
  static const M3MotionDuration extraLong2 =
      M3MotionDuration._(milliseconds: 800);

  /// 900ms — large-scale transitions.
  static const M3MotionDuration extraLong3 =
      M3MotionDuration._(milliseconds: 900);

  /// 1000ms — maximum duration transitions.
  static const M3MotionDuration extraLong4 =
      M3MotionDuration._(milliseconds: 1000);
}

/// Material Design 3 motion curves.
class M3MotionCurve extends ThreePointCubic {
  const M3MotionCurve._(super.a1, super.b1, super.midpoint, super.a2, super.b2);

  /// Emphasized easing curve for prominent animations.
  static const M3MotionCurve emphasized = M3MotionCurve._(
    Offset(0.05, 0),
    Offset(0.133333, 0.06),
    Offset(0.166666, 0.4),
    Offset(0.208333, 0.82),
    Offset(0.25, 1),
  );

  /// Emphasized decelerate for incoming elements.
  static const M3MotionCurve emphasizedDecelerate = M3MotionCurve._(
    Offset.zero,
    Offset(0.05, 0.45),
    Offset(0.18, 0.76),
    Offset(0.47, 0.94),
    Offset(1, 1),
  );

  /// Emphasized accelerate for outgoing elements.
  static const M3MotionCurve emphasizedAccelerate = M3MotionCurve._(
    Offset.zero,
    Offset(0.21, 0.02),
    Offset(0.48, 0.09),
    Offset(0.74, 0.32),
    Offset(1, 1),
  );

  /// Standard easing for common transitions.
  static const M3MotionCurve standard = M3MotionCurve._(
    Offset.zero,
    Offset(0.11, 0.27),
    Offset(0.18, 0.63),
    Offset(0.34, 0.88),
    Offset(1, 1),
  );

  /// Standard decelerate for incoming content.
  static const M3MotionCurve standardDecelerate = M3MotionCurve._(
    Offset.zero,
    Offset(0.02, 0.42),
    Offset(0.13, 0.75),
    Offset(0.42, 0.95),
    Offset(1, 1),
  );

  /// Standard accelerate for outgoing content.
  static const M3MotionCurve standardAccelerate = M3MotionCurve._(
    Offset.zero,
    Offset(0.21, 0.16),
    Offset(0.48, 0.5),
    Offset(0.76, 0.84),
    Offset(1, 1),
  );

  /// Linear easing for mechanical animations.
  static const M3MotionCurve linear = M3MotionCurve._(
    Offset.zero,
    Offset(0.25, 0.25),
    Offset(0.5, 0.5),
    Offset(0.75, 0.75),
    Offset(1, 1),
  );
}

/// A Material Design 3 motion scheme, combining duration and easing.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
// ignore: use_enums
class M3Motion {
  /// Creates a motion scheme combining [duration] and [curve].
  const M3Motion._({
    required this.duration,
    required this.curve,
  });

  /// The duration of the motion transition.
  final M3MotionDuration duration;

  /// The easing curve of the motion transition.
  final M3MotionCurve curve;

  /// Creates an [Animatable] for this motion scheme.
  Animatable<T> asTween<T>({required T begin, required T end}) {
    return Tween<T>(begin: begin, end: end).chain(CurveTween(curve: curve));
  }

  // --- Emphasized Motion Tokens ---

  /// The duration for [emphasized] motion.
  static const M3MotionDuration emphasizedDuration = M3MotionDuration.long2;
  /// The curve for [emphasized] motion.
  static const M3MotionCurve emphasizedCurve = M3MotionCurve.emphasized;

  /// Emphasized motion for elements on-screen at start and end (500ms).
  static const M3Motion emphasized = M3Motion._(
    duration: emphasizedDuration,
    curve: emphasizedCurve,
  );

  /// The duration for [emphasizedIncoming] motion.
  static const M3MotionDuration emphasizedIncomingDuration =
      M3MotionDuration.long1;
  /// The curve for [emphasizedIncoming] motion.
  static const M3MotionCurve emphasizedIncomingCurve =
      M3MotionCurve.emphasizedDecelerate;
  
  /// Emphasized motion for elements entering the screen (450ms).
  static const M3Motion emphasizedIncoming = M3Motion._(
    duration: emphasizedIncomingDuration,
    curve: emphasizedIncomingCurve,
  );

  /// The duration for [emphasizedOutgoing] motion.
  static const M3MotionDuration emphasizedOutgoingDuration =
      M3MotionDuration.short3;
  /// The curve for [emphasizedOutgoing] motion.
  static const M3MotionCurve emphasizedOutgoingCurve =
      M3MotionCurve.emphasizedAccelerate;

  /// Emphasized motion for elements exiting the screen (150ms).
  static const M3Motion emphasizedOutgoing = M3Motion._(
    duration: emphasizedOutgoingDuration,
    curve: emphasizedOutgoingCurve,
  );

  // --- Standard Motion Tokens ---

  /// The duration for [standard] motion.
  static const M3MotionDuration standardDuration = M3MotionDuration.medium2;
  /// The curve for [standard] motion.
  static const M3MotionCurve standardCurve = M3MotionCurve.standard;

  /// Standard motion for elements on-screen at start and end (300ms).
  static const M3Motion standard = M3Motion._(
    duration: standardDuration,
    curve: standardCurve,
  );

  /// The duration for [standardIncoming] motion.
  static const M3MotionDuration standardIncomingDuration =
      M3MotionDuration.medium1;
  /// The curve for [standardIncoming] motion.
  static const M3MotionCurve standardIncomingCurve =
      M3MotionCurve.standardDecelerate;

  /// Standard motion for elements entering the screen (250ms).
  static const M3Motion standardIncoming = M3Motion._(
    duration: standardIncomingDuration,
    curve: standardIncomingCurve,
  );

  /// The duration for [standardOutgoing] motion.
  static const M3MotionDuration standardOutgoingDuration =
      M3MotionDuration.short4;
  /// The curve for [standardOutgoing] motion.
  static const M3MotionCurve standardOutgoingCurve =
      M3MotionCurve.standardAccelerate;

  /// Standard motion for elements exiting the screen (200ms).
  static const M3Motion standardOutgoing = M3Motion._(
    duration: standardOutgoingDuration,
    curve: standardOutgoingCurve,
  );

  /// The duration for [linear] motion.
  static const M3MotionDuration linearDuration = M3MotionDuration.short3;
  /// The curve for [linear] motion.
  static const M3MotionCurve linearCurve = M3MotionCurve.linear;

  /// Linear interpolation scheme (150ms).
  static const M3Motion linear = M3Motion._(
    duration: linearDuration,
    curve: linearCurve,
  );

  /// Gets an appropriate duration based on motion distance.
  static Duration getDurationByDistance(M3MotionDistance distance) {
    switch (distance) {
      case M3MotionDistance.short:
        return M3MotionDuration.short2;
      case M3MotionDistance.medium:
        return M3MotionDuration.medium2;
      case M3MotionDistance.long:
        return M3MotionDuration.long2;
      case M3MotionDistance.extraLong:
        return M3MotionDuration.extraLong2;
    }
  }

  /// Gets an appropriate easing curve based on motion type.
  static Curve getEasingByType(M3MotionType type) {
    switch (type) {
      case M3MotionType.incoming:
        return M3MotionCurve.emphasizedDecelerate;
      case M3MotionType.outgoing:
        return M3MotionCurve.emphasizedAccelerate;
      case M3MotionType.persistent:
        return M3MotionCurve.emphasized;
      case M3MotionType.standard:
        return M3MotionCurve.standard;
    }
  }
}

/// Motion distance categories for selecting appropriate durations.
enum M3MotionDistance {
  /// Short travel distance (usually inside a single component).
  short,

  /// Medium travel distance (transitions across sibling components).
  medium,

  /// Long travel distance (full screen transitions or dialog entries).
  long,

  /// Extra long travel distance (large screen layout changes).
  extraLong,
}

/// Motion types for selecting appropriate easing curves.
enum M3MotionType {
  /// Transition type for elements entering the screen.
  incoming,

  /// Transition type for elements exiting the screen.
  outgoing,

  /// Transition type for elements residing persistently on the screen.
  persistent,

  /// Transition type for generic animation behaviors.
  standard,
}
