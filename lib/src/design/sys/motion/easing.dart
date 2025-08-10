/// Easing curves based on Material Design 3 specification.
///
/// Reference: https://m3.material.io/styles/motion/easing-and-duration
library;

import 'package:flutter/animation.dart';

/// Material 3 easing curves for smooth, natural motion.
/// 
/// These curves are designed to create motion that feels natural and 
/// provides appropriate emphasis for different types of transitions.
abstract class M3Easing {
  /// Standard easing - used for most transitions.
  /// Creates smooth, natural motion that doesn't draw attention to itself.
  static const Curve standard = Cubic(0.2, 0.0, 0.0, 1.0);

  /// Emphasized easing - used for important transitions.
  /// Creates motion that draws attention and feels more dynamic.
  static const Curve emphasized = Cubic(0.2, 0.0, 0.0, 1.0);

  /// Emphasized decelerate - starts quickly and slows down.
  /// Used when elements are entering the screen or appearing.
  static const Curve emphasizedDecelerate = Cubic(0.05, 0.7, 0.1, 1.0);

  /// Emphasized accelerate - starts slowly and speeds up.
  /// Used when elements are exiting the screen or disappearing.
  static const Curve emphasizedAccelerate = Cubic(0.3, 0.0, 0.8, 0.15);

  /// Legacy easing - matches Material 2 behavior.
  /// Used for backward compatibility with existing animations.
  static const Curve legacy = Cubic(0.4, 0.0, 0.2, 1.0);

  /// Linear easing - constant speed throughout.
  /// Used for simple, mechanical transitions.
  static const Curve linear = Curves.linear;

  /// Legacy accelerate - Material 2 accelerate curve.
  static const Curve legacyAccelerate = Cubic(0.4, 0.0, 1.0, 1.0);

  /// Legacy decelerate - Material 2 decelerate curve.
  static const Curve legacyDecelerate = Cubic(0.0, 0.0, 0.2, 1.0);
}

/// Duration tokens for different types of transitions.
abstract class M3EasingDuration {
  /// Extra short duration for micro-interactions.
  static const Duration extraShort1 = Duration(milliseconds: 50);
  static const Duration extraShort2 = Duration(milliseconds: 100);
  static const Duration extraShort3 = Duration(milliseconds: 150);
  static const Duration extraShort4 = Duration(milliseconds: 200);

  /// Short duration for small component transitions.
  static const Duration short1 = Duration(milliseconds: 250);
  static const Duration short2 = Duration(milliseconds: 300);
  static const Duration short3 = Duration(milliseconds: 350);
  static const Duration short4 = Duration(milliseconds: 400);

  /// Medium duration for page transitions and larger movements.
  static const Duration medium1 = Duration(milliseconds: 450);
  static const Duration medium2 = Duration(milliseconds: 500);
  static const Duration medium3 = Duration(milliseconds: 550);
  static const Duration medium4 = Duration(milliseconds: 600);

  /// Long duration for complex transitions and large-scale changes.
  static const Duration long1 = Duration(milliseconds: 700);
  static const Duration long2 = Duration(milliseconds: 800);
  static const Duration long3 = Duration(milliseconds: 900);
  static const Duration long4 = Duration(milliseconds: 1000);

  /// Extra long duration for very complex or important transitions.
  static const Duration extraLong1 = Duration(milliseconds: 1200);
  static const Duration extraLong2 = Duration(milliseconds: 1500);
  static const Duration extraLong3 = Duration(milliseconds: 2000);
  static const Duration extraLong4 = Duration(milliseconds: 3000);
}

/// Recommended duration pairings for common transition patterns.
abstract class M3EasingPatterns {
  /// Pattern for simple fade transitions.
  static const M3EasingPattern fade = M3EasingPattern(
    curve: M3Easing.standard,
    duration: M3EasingDuration.short2,
  );

  /// Pattern for slide transitions.
  static const M3EasingPattern slide = M3EasingPattern(
    curve: M3Easing.emphasizedDecelerate,
    duration: M3EasingDuration.medium2,
  );

  /// Pattern for scale transitions.
  static const M3EasingPattern scale = M3EasingPattern(
    curve: M3Easing.emphasized,
    duration: M3EasingDuration.short3,
  );

  /// Pattern for rotation transitions.
  static const M3EasingPattern rotation = M3EasingPattern(
    curve: M3Easing.standard,
    duration: M3EasingDuration.medium1,
  );

  /// Pattern for entering elements.
  static const M3EasingPattern enter = M3EasingPattern(
    curve: M3Easing.emphasizedDecelerate,
    duration: M3EasingDuration.medium2,
  );

  /// Pattern for exiting elements.
  static const M3EasingPattern exit = M3EasingPattern(
    curve: M3Easing.emphasizedAccelerate,
    duration: M3EasingDuration.short4,
  );
}

/// Represents a pairing of an easing curve and duration.
class M3EasingPattern {
  const M3EasingPattern({
    required this.curve,
    required this.duration,
  });

  /// The easing curve for this pattern.
  final Curve curve;

  /// The duration for this pattern.
  final Duration duration;

  @override
  String toString() {
    return 'M3EasingPattern(curve: $curve, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is M3EasingPattern &&
        other.curve == curve &&
        other.duration == duration;
  }

  @override
  int get hashCode => Object.hash(curve, duration);
}