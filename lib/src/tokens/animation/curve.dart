import 'package:flutter/animation.dart';

/// Material Design 3 motion easing curve tokens.
///
/// Easing curves control the rate of change in an animation, giving it a
/// more natural and physically plausible feel.
///
/// See: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
abstract final class MotionEasing {
  // --- Emphasized Easing ---

  /// A more expressive curve for hero moments and large-scale transitions.
  /// `path(M 0,0 C 0.05, 0, 0.133333, 0.06, 0.166666, 0.4 C 0.208333, 0.82, 0.25, 1, 1, 1)`
  static const Curve emphasized = PathCubic(
    0.05,
    0,
    0.133333,
    0.06,
    0.166666,
    0.4,
    0.208333,
    0.82,
    0.25,
    1,
    1,
    1,
  );

  /// Decelerate curve for emphasized elements entering the screen.
  /// `cubic-bezier(0.05, 0.7, 0.1, 1.0)`
  static const Curve emphasizedDecelerate = Cubic(0.05, 0.7, 0.1, 1);

  /// Accelerate curve for emphasized elements exiting the screen.
  /// `cubic-bezier(0.3, 0.0, 0.8, 0.15)`
  static const Curve emphasizedAccelerate = Cubic(0.3, 0, 0.8, 0.15);

  // --- Standard Easing ---

  /// The default easing curve, used for most standard transitions.
  /// `cubic-bezier(0.2, 0.0, 0.0, 1.0)`
  static const Curve standard = Cubic(0.2, 0, 0, 1);

  /// Decelerate curve for elements entering the screen.
  /// `cubic-bezier(0.0, 0.0, 0.0, 1.0)`
  static const Curve standardDecelerate = Cubic(0, 0, 0, 1);

  /// Accelerate curve for elements exiting the screen.
  /// `cubic-bezier(0.3, 0.0, 1.0, 1.0)`
  static const Curve standardAccelerate = Cubic(0.3, 0, 1, 1);

  // --- Legacy Easing ---

  /// The legacy easing curve for Material 2 transitions.
  /// `cubic-bezier(0.4, 0.0, 0.2, 1.0)`
  static const Curve legacy = Cubic(0.4, 0, 0.2, 1);

  /// The legacy decelerate curve.
  /// `cubic-bezier(0.0, 0.0, 0.2, 1.0)`
  static const Curve legacyDecelerate = Cubic(0, 0, 0.2, 1);

  /// The legacy accelerate curve.
  /// `cubic-bezier(0.4, 0.0, 1.0, 1.0)`
  static const Curve legacyAccelerate = Cubic(0.4, 0, 1, 1);

  // --- Utility Easing ---

  /// A linear interpolation curve. Not part of the M3 token set but can be
  /// useful for specific scenarios like progress indicators.
  static const Curve linear = Curves.linear;
}

class PathCubic extends Curve {
  const PathCubic(
    this.x1,
    this.y1,
    this.x2,
    this.y2,
    this.x3,
    this.y3,
    this.x4,
    this.y4,
    this.x5,
    this.y5,
    this.x6,
    this.y6,
  );

  final double x1;
  final double y1;
  final double x2;
  final double y2;
  final double x3;
  final double y3;
  final double x4;
  final double y4;
  final double x5;
  final double y5;
  final double x6;
  final double y6;

  @override
  double transformInternal(double t) {
    final cubic1 = Cubic(x1, y1, x2, y2);
    final cubic2 = Cubic(x3, y3, x4, y4);
    final cubic3 = Cubic(x5, y5, x6, y6);

    if (t < 0.4) {
      return cubic1.transform(t / 0.4);
    } else if (t < 0.82) {
      return cubic2.transform((t - 0.4) / 0.42);
    } else {
      return cubic3.transform((t - 0.82) / 0.18);
    }
  }
}
