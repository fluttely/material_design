import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Utility functions for applying Material Design 3 motion patterns.
///
/// Provides context-aware duration and easing selection, as well as
/// helper methods for common animation scenarios.
@immutable
abstract class M3MotionUtils {
  // --- Context-Aware Duration Selection ---

  /// Gets the appropriate duration for a component animation.
  static Duration durationForComponent(
    String componentType,
    String animationType,
  ) {
    switch (componentType.toLowerCase()) {
      case 'button':
        switch (animationType.toLowerCase()) {
          case 'press':
            return M3MotionDurationToken.short1.value;
          case 'hover':
            return M3MotionDurationToken.short2.value;
          case 'focus':
            return M3MotionDurationToken.short2.value;
          default:
            return M3MotionDurationToken.short4.value;
        }

      case 'card':
        switch (animationType.toLowerCase()) {
          case 'elevation':
            return M3MotionDurationToken.short4.value;
          case 'expand':
            return M3MotionDurationToken.medium2.value;
          case 'collapse':
            return M3MotionDurationToken.medium1.value;
          default:
            return M3MotionDurationToken.medium1.value;
        }

      case 'dialog':
        switch (animationType.toLowerCase()) {
          case 'enter':
            return M3MotionDurationToken.medium3.value;
          case 'exit':
            return M3MotionDurationToken.medium1.value;
          default:
            return M3MotionDurationToken.medium2.value;
        }

      case 'bottomsheet':
        switch (animationType.toLowerCase()) {
          case 'enter':
            return M3MotionDurationToken.long1.value;
          case 'exit':
            return M3MotionDurationToken.medium2.value;
          case 'drag':
            return M3MotionDurationToken.short1.value;
          default:
            return M3MotionDurationToken.long2.value;
        }

      case 'navigation':
        switch (animationType.toLowerCase()) {
          case 'page':
            return M3MotionDurationToken.medium4.value;
          case 'tab':
            return M3MotionDurationToken.medium1.value;
          case 'drawer':
            return M3MotionDurationToken.long1.value;
          default:
            return M3MotionDurationToken.medium2.value;
        }

      default:
        return M3MotionDurationToken.medium1.value;
    }
  }

  /// Gets duration based on travel distance (for spatial animations).
  static Duration durationForDistance(double distance) {
    if (distance < 100) return M3MotionDurationToken.short2.value;
    if (distance < 300) return M3MotionDurationToken.medium1.value;
    if (distance < 500) return M3MotionDurationToken.medium3.value;
    return M3MotionDurationToken.long2.value;
  }

  /// Gets duration based on complexity (number of animated elements).
  static Duration durationForComplexity(int elementCount) {
    if (elementCount <= 1) return M3MotionDurationToken.short4.value;
    if (elementCount <= 3) return M3MotionDurationToken.medium2.value;
    if (elementCount <= 5) return M3MotionDurationToken.medium4.value;
    return M3MotionDurationToken.long2.value;
  }

  // --- Context-Aware Easing Selection ---

  /// Gets the appropriate easing curve for entering elements.
  static Curve easingForEntering(String elementType) {
    switch (elementType.toLowerCase()) {
      case 'dialog':
      case 'bottomsheet':
        return M3MotionEasingToken.emphasizedDecelerate.value;
      case 'button':
      case 'card':
        return M3MotionEasingToken.standardDecelerate.value;
      case 'page':
        return M3MotionEasingToken.standard.value;
      default:
        return M3MotionEasingToken.standardDecelerate.value;
    }
  }

  /// Gets the appropriate easing curve for exiting elements.
  static Curve easingForExiting(String elementType) {
    switch (elementType.toLowerCase()) {
      case 'dialog':
      case 'bottomsheet':
        return M3MotionEasingToken.standardAccelerate.value;
      case 'button':
      case 'card':
        return M3MotionEasingToken.standard.value;
      case 'page':
        return M3MotionEasingToken.standardAccelerate.value;
      default:
        return M3MotionEasingToken.standardAccelerate.value;
    }
  }

  // --- Animation Builders ---

  /// Creates a fade-in animation builder.
  static Widget fadeIn({
    required Widget child,
    Duration? duration,
    Curve? curve,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: end),
      duration: duration ?? M3MotionDurationToken.medium1.value,
      curve: curve ?? M3MotionEasingToken.linear.value,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// Creates a slide-up animation builder.
  static Widget slideUp({
    required Widget child,
    Duration? duration,
    Curve? curve,
    double offset = 30.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: offset, end: 0),
      duration: duration ?? M3MotionDurationToken.medium2.value,
      curve: curve ?? M3MotionEasingToken.standardDecelerate.value,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Creates a scale-in animation builder.
  static Widget scaleIn({
    required Widget child,
    Duration? duration,
    Curve? curve,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: end),
      duration: duration ?? M3MotionDurationToken.medium2.value,
      curve: curve ?? M3MotionEasingToken.emphasizedDecelerate.value,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// Creates a slide and fade animation builder.
  static Widget slideAndFade({
    required Widget child,
    Duration? duration,
    Curve? curve,
    Offset slideOffset = const Offset(0, 30),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration ?? M3MotionDurationToken.medium3.value,
      curve: curve ?? M3MotionEasingToken.emphasizedDecelerate.value,
      builder: (context, value, child) {
        return Transform.translate(
          offset: slideOffset * (1 - value),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  // --- State Animation Helpers ---

  /// Creates an elevation animation that responds to interaction states.
  static Widget elevationAnimation({
    required BuildContext context,
    required Widget child,
    required double restingElevation,
    required double hoveredElevation,
    required double pressedElevation,
    Duration? duration,
    Curve? curve,
  }) {
    return MouseRegion(
      child: GestureDetector(
        child: AnimatedContainer(
          duration: duration ?? M3MotionDurationToken.short4.value,
          curve: curve ?? M3MotionEasingToken.standard.value,
          decoration: BoxDecoration(
            color: M3ElevationToken.fromValue(restingElevation)
                .surfaceColor(context),
            boxShadow: M3ElevationToken.fromValue(restingElevation).shadows,
          ),
          child: child,
        ),
      ),
    );
  }

  /// Checks if animations should be reduced based on user preferences.
  static bool shouldReduceAnimations(BuildContext context) {
    return MediaQuery.of(context).disableAnimations;
  }

  /// Returns a reduced duration if animations should be reduced.
  static Duration adaptiveDuration(
      BuildContext context, Duration normalDuration) {
    if (shouldReduceAnimations(context)) {
      return Duration(
          milliseconds: (normalDuration.inMilliseconds * 0.3).round());
    }
    return normalDuration;
  }

  /// Returns a linear curve if animations should be reduced.
  static Curve adaptiveCurve(BuildContext context, Curve normalCurve) {
    if (shouldReduceAnimations(context)) {
      return Curves.linear;
    }
    return normalCurve;
  }

  // --- Duration Categories ---

  /// Micro-interaction durations for immediate feedback.
  static List<Duration> microInteractions = [
    M3MotionDurationToken.short1.value,
    M3MotionDurationToken.short2.value,
    M3MotionDurationToken.short3.value,
    M3MotionDurationToken.short4.value,
  ];

  /// State change durations for component states.
  static List<Duration> stateChanges = [
    M3MotionDurationToken.medium1.value,
    M3MotionDurationToken.medium2.value,
    M3MotionDurationToken.medium3.value,
    M3MotionDurationToken.medium4.value,
  ];

  /// Standard transition durations for most animations.
  static List<Duration> standardTransitions = [
    M3MotionDurationToken.long1.value,
    M3MotionDurationToken.long2.value,
    M3MotionDurationToken.long3.value,
    M3MotionDurationToken.long4.value,
  ];

  /// Complex animation durations for sophisticated sequences.
  static List<Duration> complexAnimations = [
    M3MotionDurationToken.extraLong1.value,
    M3MotionDurationToken.extraLong2.value,
    M3MotionDurationToken.extraLong3.value,
    M3MotionDurationToken.extraLong4.value,
  ];

  // --- Duration Utilities ---

  /// Get duration by category and intensity (0.0 to 1.0).
  static Duration getDuration(List<Duration> category, double intensity) {
    final clampedIntensity = intensity.clamp(0.0, 1.0);
    final index = (clampedIntensity * (category.length - 1)).round();
    return category[index];
  }

  /// Check if duration is within M3 recommended ranges.
  static bool isRecommendedDuration(Duration duration) {
    final milliseconds = duration.inMilliseconds;
    return milliseconds >= 50 && milliseconds <= 1000;
  }

  // --- Common Duration Aliases ---

  /// Instant feedback duration for micro-interactions.
  static Duration instant = M3MotionDurationToken.short1.value;

  /// Quick interaction duration.
  static Duration quick = M3MotionDurationToken.short4.value;

  /// Standard animation duration.
  static Duration standard = M3MotionDurationToken.medium1.value;

  /// Emphasis animation duration.
  static Duration emphasis = M3MotionDurationToken.medium2.value;

  /// Entering element duration.
  static Duration entering = M3MotionDurationToken.medium2.value;

  /// Exiting element duration.
  static Duration exiting = M3MotionDurationToken.short4.value;

  /// Complex transition duration.
  static Duration complex = M3MotionDurationToken.long1.value;

  /// Page transition duration.
  static Duration pageTransition = M3MotionDurationToken.extraLong1.value;
}
