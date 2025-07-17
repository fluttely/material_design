// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/animation.dart';

/// Represents a Material Design 3 motion scheme, combining duration and easing.
///
/// This class encapsulates the two core components of an M3 animation:
/// - [duration]: How long the animation runs.
/// - [curve]: The easing curve that defines the rate of change over time.
///
/// While Material Design 3 specifies duration and easing tokens separately,
/// this class provides a convenient way to group them for direct use in
/// Flutter animations.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
class MotionScheme {
  /// Creates a motion scheme with a specific duration and curve.
  const MotionScheme(this.duration, this.curve);

  /// The total time the animation will take.
  final Duration duration;

  /// The easing curve for the animation.
  final Curve curve;

  /// Creates a [Tween] for this motion scheme, animating between [begin] and [end].
  ///
  /// This is a convenience method for creating a [CurveTween] that can be
  /// chained with another tween (like [Tween<double>]) and driven by an
  /// [AnimationController].
  ///
  /// Example:
  /// ```dart
  /// myAnimation = controller.drive(MaterialMotion.emphasized.asTween(begin: 0.0, end: 1.0));
  /// ```
  Animatable<T> asTween<T>({required T begin, required T end}) {
    return Tween<T>(begin: begin, end: end).chain(CurveTween(curve: curve));
  }
}

/// Defines the standard motion tokens for Material Design 3.
///
/// These tokens provide standardized duration and easing values for creating
/// consistent and natural-feeling animations across the application.
///
/// This class provides pre-combined [MotionScheme]s for convenience, built
/// from the granular [MotionDurations] and [MotionEasings] tokens.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration
abstract final class MaterialMotion {
  // --- Emphasized MaterialMotion ---
  // For transitions of large-scale elements and hero moments.

  /// Emphasized motion for elements that are on-screen at the start and end.
  /// Duration: `long2` (500ms). Curve: `emphasized`.
  static const MotionScheme emphasized = MotionScheme(
    MotionDurations.long2,
    MotionEasings.emphasized,
  );

  /// Emphasized motion for elements that are entering the screen.
  /// Duration: `long1` (450ms). Curve: `emphasizedDecelerate`.
  static const MotionScheme emphasizedIncoming = MotionScheme(
    MotionDurations.long1,
    MotionEasings.emphasizedDecelerate,
  );

  /// Emphasized motion for elements that are exiting the screen.
  /// Duration: `short3` (200ms). Curve: `emphasizedAccelerate`.
  static const MotionScheme emphasizedOutgoing = MotionScheme(
    MotionDurations.short3,
    MotionEasings.emphasizedAccelerate,
  );

  // --- Standard MaterialMotion ---
  // For standard, functional transitions of smaller components.

  /// Standard motion for elements that are on-screen at the start and end.
  /// Duration: `medium2` (300ms). Curve: `standard`.
  static const MotionScheme standard = MotionScheme(
    MotionDurations.medium2,
    MotionEasings.standard,
  );

  /// Standard motion for elements that are entering the screen.
  /// Duration: `medium1` (250ms). Curve: `standardDecelerate`.
  static const MotionScheme standardIncoming = MotionScheme(
    MotionDurations.medium1,
    MotionEasings.standardDecelerate,
  );

  /// Standard motion for elements that are exiting the screen.
  /// Duration: `short4` (150ms). Curve: `standardAccelerate`.
  static const MotionScheme standardOutgoing = MotionScheme(
    MotionDurations.short4,
    MotionEasings.standardAccelerate,
  );

  // --- Utility MaterialMotion ---

  /// A linear interpolation scheme. Not part of the core M3 token set, but
  /// useful for specific cases.
  /// Duration: `short3` (200ms). Curve: `linear`.
  static const MotionScheme linear = MotionScheme(
    MotionDurations.short3,
    MotionEasings.linear,
  );
}

/// Material Design 3 motion duration tokens.
///
/// These tokens define standardized durations for animations, ensuring a
/// consistent pace across the application.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
abstract final class MotionDurations {
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

/// Material Design 3 motion easing curve tokens.
///
/// Easing curves control the rate of change in an animation, giving it a
/// more natural and physically plausible feel.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
abstract final class MotionEasings {
  // --- Standard Easing ---

  /// The default easing curve, used for most standard transitions.
  /// Also known as "Emphasized" in the M3 spec.
  /// `cubic-bezier(0.2, 0.0, 0.0, 1.0)`
  static const Curve standard = Cubic(0.2, 0, 0, 1);

  /// Decelerate curve for elements entering the screen.
  /// `cubic-bezier(0.0, 0.0, 0.0, 1.0)`
  static const Curve standardDecelerate = Cubic(0, 0, 0, 1);

  /// Accelerate curve for elements exiting the screen.
  /// `cubic-bezier(0.3, 0.0, 1.0, 1.0)`
  static const Curve standardAccelerate = Cubic(0.3, 0, 1, 1);

  // --- Emphasized Easing ---

  /// A more expressive curve for hero moments and large-scale transitions.
  /// Note: This is the same as the `standard` curve.
  /// `cubic-bezier(0.2, 0.0, 0.0, 1.0)`
  static const Curve emphasized = Cubic(0.2, 0, 0, 1);

  /// Decelerate curve for emphasized elements entering the screen.
  /// `cubic-bezier(0.05, 0.7, 0.1, 1.0)`
  static const Curve emphasizedDecelerate = Cubic(0.05, 0.7, 0.1, 1);

  /// Accelerate curve for emphasized elements exiting the screen.
  /// `cubic-bezier(0.3, 0.0, 0.8, 0.15)`
  static const Curve emphasizedAccelerate = Cubic(0.3, 0, 0.8, 0.15);

  // --- Legacy Easing ---

  /// A linear interpolation curve. Not part of the M3 token set but can be
  /// useful for specific scenarios like progress indicators.
  static const Curve linear = Curves.linear;
}
