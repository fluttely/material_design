// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/animation.dart';

/// Represents a Material Design 3 motion token, combining duration and easing.
///
/// This class encapsulates the two core components of an M3 animation:
/// - [duration]: How long the animation runs.
/// - [curve]: The easing curve that defines the rate of change over time.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
class MotionToken {
  /// Creates a motion token with a specific duration and curve.
  const MotionToken(this.duration, this.curve);

  /// The total time the animation will take.
  final Duration duration;

  /// The easing curve for the animation.
  final Curve curve;

  /// Creates a [Tween] for this motion token, animating between [begin] and [end].
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
/// Instead of using fixed durations, M3 motion is defined by a combination of
/// duration and an easing curve, represented here by the [MotionToken] class.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration
abstract final class MaterialMotion {
  // --- Emphasized Easing ---
  // For transitions of large-scale elements and hero moments.

  /// Emphasized easing for elements that are on-screen at the start and end.
  /// Duration: 500ms. Curve: Emphasized.
  static const MotionToken emphasized = MotionToken(
    Duration(milliseconds: 500),
    Cubic(0.2, 0, 0, 1),
  );

  /// Emphasized easing for elements that are entering the screen.
  /// Duration: 450ms. Curve: Emphasized Decelerate.
  static const MotionToken emphasizedIncoming = MotionToken(
    Duration(milliseconds: 450),
    Cubic(0.05, 0.7, 0.1, 1),
  );

  /// Emphasized easing for elements that are exiting the screen.
  /// Duration: 200ms. Curve: Emphasized Accelerate.
  static const MotionToken emphasizedOutgoing = MotionToken(
    Duration(milliseconds: 200),
    Cubic(0.3, 0, 0.8, 0.15),
  );

  // --- Standard Easing ---
  // For standard, functional transitions of smaller components.

  /// Standard easing for elements that are on-screen at the start and end.
  /// Duration: 300ms. Curve: Standard.
  static const MotionToken standard = MotionToken(
    Duration(milliseconds: 300),
    Cubic(0.2, 0, 0, 1),
  );

  /// Standard easing for elements that are entering the screen.
  /// Duration: 250ms. Curve: Standard Decelerate.
  static const MotionToken standardIncoming = MotionToken(
    Duration(milliseconds: 250),
    Cubic(0, 0, 0, 1),
  );

  /// Standard easing for elements that are exiting the screen.
  /// Duration: 150ms. Curve: Standard Accelerate.
  static const MotionToken standardOutgoing = MotionToken(
    Duration(milliseconds: 150),
    Cubic(0.3, 0, 1, 1),
  );

  // --- Legacy Easing ---
  // For compatibility or specific cases where linear motion is needed.

  /// A linear interpolation curve.
  /// Duration: 200ms. Curve: Linear.
  static const MotionToken linear = MotionToken(
    Duration(milliseconds: 200),
    Curves.linear,
  );
}
