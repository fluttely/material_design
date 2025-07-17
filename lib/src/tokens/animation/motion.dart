// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/animation.dart';
import 'package:material_design/src/tokens/animation/curve.dart';
import 'package:material_design/src/tokens/animation/duration.dart';

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
/// from the granular [MotionDuration] and [MotionEasing] tokens.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration
abstract final class MaterialMotion {
  // --- Emphasized MaterialMotion ---
  // For transitions of large-scale elements and hero moments.

  /// Emphasized motion for elements that are on-screen at the start and end.
  /// Duration: `long2` (500ms). Curve: `emphasized`.
  static const MotionScheme emphasized = MotionScheme(
    MotionDuration.long2,
    MotionEasing.emphasized,
  );

  /// Emphasized motion for elements that are entering the screen.
  /// Duration: `long1` (450ms). Curve: `emphasizedDecelerate`.
  static const MotionScheme emphasizedIncoming = MotionScheme(
    MotionDuration.long1,
    MotionEasing.emphasizedDecelerate,
  );

  /// Emphasized motion for elements that are exiting the screen.
  /// Duration: `short3` (200ms). Curve: `emphasizedAccelerate`.
  static const MotionScheme emphasizedOutgoing = MotionScheme(
    MotionDuration.short3,
    MotionEasing.emphasizedAccelerate,
  );

  // --- Standard MaterialMotion ---
  // For standard, functional transitions of smaller components.

  /// Standard motion for elements that are on-screen at the start and end.
  /// Duration: `medium2` (300ms). Curve: `standard`.
  static const MotionScheme standard = MotionScheme(
    MotionDuration.medium2,
    MotionEasing.standard,
  );

  /// Standard motion for elements that are entering the screen.
  /// Duration: `medium1` (250ms). Curve: `standardDecelerate`.
  static const MotionScheme standardIncoming = MotionScheme(
    MotionDuration.medium1,
    MotionEasing.standardDecelerate,
  );

  /// Standard motion for elements that are exiting the screen.
  /// Duration: `short4` (150ms). Curve: `standardAccelerate`.
  static const MotionScheme standardOutgoing = MotionScheme(
    MotionDuration.short4,
    MotionEasing.standardAccelerate,
  );

  // --- Utility MaterialMotion ---

  /// A linear interpolation scheme. Not part of the core M3 token set, but
  /// useful for specific cases.
  /// Duration: `short3` (200ms). Curve: `linear`.
  static const MotionScheme linear = MotionScheme(
    MotionDuration.short3,
    MotionEasing.linear,
  );
}
