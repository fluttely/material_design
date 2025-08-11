/// Material Design 3 easing curves system.
///
/// This file implements the Material Design 3 motion easing specifications
/// including standard curves for different types of animations and transitions.
///
/// Easing curves control the rate of change of an animation over time,
/// creating more natural and expressive motion.
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
library;

import 'package:flutter/animation.dart';

/// Material Design 3 easing curves.
///
/// Provides the four main easing curves used in Material Design 3:
/// - Standard: For most transitions
/// - Emphasized: For important or larger transitions
/// - Decelerated: For incoming elements
/// - Accelerated: For exiting elements
///
/// Reference: https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration
class MaterialEasing {
  MaterialEasing._();

  /// Standard easing curve (Emphasized Decelerate).
  ///
  /// Used for most transitions and animations.
  /// Creates smooth, natural motion that feels responsive.
  ///
  /// Cubic-bezier: (0.2, 0.0, 0.0, 1.0)
  ///
  /// Use cases:
  /// - View transitions
  /// - Component state changes
  /// - Most general animations
  static const Curve standard = Cubic(0.2, 0, 0, 1);

  /// Legacy standard curve (for backwards compatibility).
  ///
  /// The previous Material Design standard curve.
  /// Cubic-bezier: (0.4, 0.0, 0.2, 1.0)
  static const Curve standardLegacy = Cubic(0.4, 0, 0.2, 1);

  /// Emphasized easing curve.
  ///
  /// Used for large, expressive transitions that need extra attention.
  /// Creates more dramatic motion with stronger acceleration and deceleration.
  ///
  /// Cubic-bezier: (0.2, 0.0, 0.0, 1.0)
  /// Note: In M3, this is the same as standard
  ///
  /// Use cases:
  /// - Page transitions
  /// - Large panel movements
  /// - Hero animations
  /// - Morphing shapes
  static const Curve emphasized = Cubic(0.2, 0, 0, 1);

  /// Emphasized decelerate easing curve.
  ///
  /// Starts fast and slows down dramatically.
  /// Creates a sense of something arriving or settling into place.
  ///
  /// Cubic-bezier: (0.05, 0.7, 0.1, 1.0)
  ///
  /// Use cases:
  /// - Incoming elements
  /// - Opening animations
  /// - Expanding content
  static const Curve emphasizedDecelerate = Cubic(0.05, 0.7, 0.1, 1);

  /// Emphasized accelerate easing curve.
  ///
  /// Starts slowly and speeds up dramatically.
  /// Creates a sense of something departing quickly.
  ///
  /// Cubic-bezier: (0.3, 0.0, 0.8, 0.15)
  ///
  /// Use cases:
  /// - Exiting elements
  /// - Closing animations
  /// - Collapsing content
  static const Curve emphasizedAccelerate = Cubic(0.3, 0, 0.8, 0.15);

  /// Decelerated easing curve.
  ///
  /// Enters quickly and slows down.
  /// Used for elements entering the screen.
  ///
  /// Cubic-bezier: (0.0, 0.0, 0.0, 1.0)
  ///
  /// Use cases:
  /// - Fade in animations
  /// - Slide in from edge
  /// - Pop-up appearances
  static const Curve decelerated = Cubic(0, 0, 0, 1);

  /// Accelerated easing curve.
  ///
  /// Starts slowly and speeds up.
  /// Used for elements leaving the screen.
  ///
  /// Cubic-bezier: (0.3, 0.0, 1.0, 1.0)
  ///
  /// Use cases:
  /// - Fade out animations
  /// - Slide out to edge
  /// - Dismissal animations
  static const Curve accelerated = Cubic(0.3, 0, 1, 1);

  /// Linear easing (no easing).
  ///
  /// Constant rate of change.
  /// Use sparingly, as it appears mechanical.
  ///
  /// Use cases:
  /// - Progress indicators
  /// - Continuous rotations
  /// - When motion should be predictable
  static const Curve linear = Curves.linear;

  /// Gets the appropriate easing curve for a given animation type.
  static Curve getEasing(MotionType type) {
    switch (type) {
      case MotionType.incoming:
        return decelerated;
      case MotionType.outgoing:
        return accelerated;
      case MotionType.transition:
        return standard;
      case MotionType.persistent:
        return linear;
      case MotionType.emphasized:
        return emphasized;
    }
  }

  /// Returns the reverse of an easing curve.
  /// Useful for exit animations that mirror entrance animations.
  static Curve reverse(Curve curve) {
    if (curve == decelerated) return accelerated;
    if (curve == accelerated) return decelerated;
    if (curve == emphasizedDecelerate) return emphasizedAccelerate;
    if (curve == emphasizedAccelerate) return emphasizedDecelerate;
    return curve;
  }

  /// Creates a custom cubic bezier curve.
  ///
  /// Parameters should be between 0.0 and 1.0.
  static Curve custom(double x1, double y1, double x2, double y2) {
    return Cubic(x1, y1, x2, y2);
  }
}

/// Types of motion for selecting appropriate easing curves.
enum MotionType {
  /// Elements entering the view.
  incoming,

  /// Elements leaving the view.
  outgoing,

  /// Elements transitioning between states.
  transition,

  /// Continuous or looping animations.
  persistent,

  /// Large, important transitions.
  emphasized,
}

/// Extended easing curves for specific use cases.
class MaterialEasingExtended {
  MaterialEasingExtended._();

  // Symmetric transitions (same curve for both directions)

  /// Fast out, slow in (Android legacy).
  /// Cubic-bezier: (0.4, 0.0, 0.2, 1.0)
  static const Curve fastOutSlowIn = Cubic(0.4, 0, 0.2, 1);

  /// Fast out, linear in.
  /// Cubic-bezier: (0.4, 0.0, 1.0, 1.0)
  static const Curve fastOutLinearIn = Cubic(0.4, 0, 1, 1);

  /// Linear out, slow in.
  /// Cubic-bezier: (0.0, 0.0, 0.2, 1.0)
  static const Curve linearOutSlowIn = Cubic(0, 0, 0.2, 1);

  // Bounce curves for playful animations

  /// Bounce in curve.
  static const Curve bounceIn = Curves.bounceIn;

  /// Bounce out curve.
  static const Curve bounceOut = Curves.bounceOut;

  /// Bounce in and out curve.
  static const Curve bounceInOut = Curves.bounceInOut;

  // Elastic curves for spring-like animations

  /// Elastic in curve.
  static const Curve elasticIn = Curves.elasticIn;

  /// Elastic out curve.
  static const Curve elasticOut = Curves.elasticOut;

  /// Elastic in and out curve.
  static const Curve elasticInOut = Curves.elasticInOut;
}

/// Predefined animation curves for common Material Design 3 patterns.
class MaterialAnimationCurves {
  MaterialAnimationCurves._();

  /// Curve for expanding panels or cards.
  static const Curve expandPanel = MaterialEasing.emphasizedDecelerate;

  /// Curve for collapsing panels or cards.
  static const Curve collapsePanel = MaterialEasing.emphasizedAccelerate;

  /// Curve for showing FAB.
  static const Curve showFab = MaterialEasing.decelerated;

  /// Curve for hiding FAB.
  static const Curve hideFab = MaterialEasing.accelerated;

  /// Curve for opening bottom sheets.
  static const Curve openBottomSheet = MaterialEasing.emphasizedDecelerate;

  /// Curve for closing bottom sheets.
  static const Curve closeBottomSheet = MaterialEasing.accelerated;

  /// Curve for opening dialogs.
  static const Curve openDialog = MaterialEasing.decelerated;

  /// Curve for closing dialogs.
  static const Curve closeDialog = MaterialEasing.accelerated;

  /// Curve for navigation transitions.
  static const Curve navigation = MaterialEasing.emphasized;

  /// Curve for tab transitions.
  static const Curve tabTransition = MaterialEasing.standard;

  /// Curve for switch toggle.
  static const Curve switchToggle = MaterialEasing.standard;

  /// Curve for checkbox toggle.
  static const Curve checkboxToggle = MaterialEasing.standard;

  /// Curve for progress indicators.
  static const Curve progressIndicator = MaterialEasing.linear;

  /// Curve for ripple effects.
  static const Curve ripple = MaterialEasing.decelerated;

  /// Curve for hover effects.
  static const Curve hover = MaterialEasing.standard;

  /// Curve for focus effects.
  static const Curve focus = MaterialEasing.standard;
}

/// Utilities for working with easing curves.
class EasingUtils {
  EasingUtils._();

  /// Chains two curves together.
  /// The first curve is applied from 0.0 to [split],
  /// and the second from [split] to 1.0.
  static Curve chain(Curve first, Curve second, [double split = 0.5]) {
    return Interval(
      0,
      1,
      curve: TwoPartCurve(first, second, split),
    );
  }

  /// Creates a delayed curve that starts after a delay.
  static Curve delay(Curve curve, double delay) {
    assert(delay >= 0.0 && delay < 1.0);
    return Interval(delay, 1, curve: curve);
  }

  /// Creates a curve that ends early.
  static Curve cutoff(Curve curve, double cutoff) {
    assert(cutoff > 0.0 && cutoff <= 1.0);
    return Interval(0, cutoff, curve: curve);
  }

  /// Creates a staggered animation curve for list items.
  static Curve stagger(int index, int total, Curve baseCurve) {
    final delay = index / total * 0.5; // 50% of time for stagger
    return Interval(
      delay,
      delay + 0.5,
      curve: baseCurve,
    );
  }

  /// Converts a cubic-bezier string to a Curve.
  /// Format: "cubic-bezier(x1, y1, x2, y2)"
  static Curve? fromCubicBezier(String bezier) {
    final regex = RegExp(
      r'cubic-bezier\s*\(\s*([0-9.]+)\s*,\s*([0-9.]+)\s*,\s*([0-9.]+)\s*,\s*([0-9.]+)\s*\)',
    );
    final match = regex.firstMatch(bezier);

    if (match != null && match.groupCount == 4) {
      try {
        final x1 = double.parse(match.group(1)!);
        final y1 = double.parse(match.group(2)!);
        final x2 = double.parse(match.group(3)!);
        final y2 = double.parse(match.group(4)!);
        return Cubic(x1, y1, x2, y2);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Converts a Curve to a cubic-bezier string.
  static String? toCubicBezier(Curve curve) {
    if (curve is Cubic) {
      return 'cubic-bezier(${curve.a}, ${curve.b}, ${curve.c}, ${curve.d})';
    }
    return null;
  }
}

/// Custom curve that combines two curves at a split point.
class TwoPartCurve extends Curve {
  const TwoPartCurve(this.first, this.second, this.split);

  final Curve first;
  final Curve second;
  final double split;

  @override
  double transformInternal(double t) {
    if (t < split) {
      return first.transform(t / split) * split;
    } else {
      return split +
          second.transform((t - split) / (1.0 - split)) * (1.0 - split);
    }
  }
}
