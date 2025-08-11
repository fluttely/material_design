/// Material Design 3 duration system.
///
/// This file implements the Material Design 3 motion duration specifications
/// including duration tokens for different types of animations and transitions.
///
/// Durations work together with easing curves to create expressive motion.
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
library;

import 'package:flutter/material.dart';

/// Material Design 3 duration tokens.
///
/// Provides standardized durations for animations following Material Design 3
/// guidelines. Durations are organized into four categories:
/// - Short: 50-200ms (small, simple animations)
/// - Medium: 250-400ms (moderate complexity)
/// - Long: 450-700ms (complex or large-scale animations)
/// - Extra Long: 700-1000ms (very complex or full-screen transitions)
///
/// Reference: https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration
class MaterialDuration {
  MaterialDuration._();

  // Short durations (50-200ms)
  // Used for small, simple animations

  /// Short duration 1: 50ms
  ///
  /// Use cases:
  /// - Selection controls (checkbox, radio button)
  /// - Small icon transitions
  /// - Ripple effects initiation
  static const Duration short1 = Duration(milliseconds: 50);

  /// Short duration 2: 100ms
  ///
  /// Use cases:
  /// - Hover effects
  /// - Focus indicators
  /// - Small badge animations
  static const Duration short2 = Duration(milliseconds: 100);

  /// Short duration 3: 150ms
  ///
  /// Use cases:
  /// - Icon button transitions
  /// - Tooltip fade in/out
  /// - Progress indicator updates
  static const Duration short3 = Duration(milliseconds: 150);

  /// Short duration 4: 200ms
  ///
  /// Use cases:
  /// - Chip selection
  /// - Small card transitions
  /// - Tab indicator slides
  static const Duration short4 = Duration(milliseconds: 200);

  // Medium durations (250-400ms)
  // Used for moderate complexity animations

  /// Medium duration 1: 250ms
  ///
  /// Use cases:
  /// - FAB show/hide
  /// - Card expand/collapse
  /// - List item animations
  static const Duration medium1 = Duration(milliseconds: 250);

  /// Medium duration 2: 300ms
  ///
  /// Use cases:
  /// - Bottom sheet opening
  /// - Navigation drawer sliding
  /// - Standard page transitions
  static const Duration medium2 = Duration(milliseconds: 300);

  /// Medium duration 3: 350ms
  ///
  /// Use cases:
  /// - Dialog animations
  /// - Snackbar appearance
  /// - App bar transformations
  static const Duration medium3 = Duration(milliseconds: 350);

  /// Medium duration 4: 400ms
  ///
  /// Use cases:
  /// - Complex card transitions
  /// - Multi-step animations
  /// - Navigation rail expansion
  static const Duration medium4 = Duration(milliseconds: 400);

  // Long durations (450-700ms)
  // Used for complex or large-scale animations

  /// Long duration 1: 450ms
  ///
  /// Use cases:
  /// - Shared element transitions
  /// - Complex morphing animations
  /// - Large panel slides
  static const Duration long1 = Duration(milliseconds: 450);

  /// Long duration 2: 500ms
  ///
  /// Use cases:
  /// - Full-screen transitions
  /// - Complex layout changes
  /// - Staggered list animations
  static const Duration long2 = Duration(milliseconds: 500);

  /// Long duration 3: 550ms
  ///
  /// Use cases:
  /// - Page transitions with shared elements
  /// - Complex choreographed animations
  /// - Large content reveals
  static const Duration long3 = Duration(milliseconds: 550);

  /// Long duration 4: 600ms
  ///
  /// Use cases:
  /// - Extended FAB transformations
  /// - Complex shape morphing
  /// - Multi-stage animations
  static const Duration long4 = Duration(milliseconds: 600);

  // Extra long durations (700-1000ms)
  // Used for very complex or full-screen transitions

  /// Extra long duration 1: 700ms
  ///
  /// Use cases:
  /// - Complex full-screen transitions
  /// - Onboarding animations
  /// - Large data visualizations
  static const Duration extraLong1 = Duration(milliseconds: 700);

  /// Extra long duration 2: 800ms
  ///
  /// Use cases:
  /// - Multi-step onboarding flows
  /// - Complex dashboard transitions
  /// - Parallax scrolling effects
  static const Duration extraLong2 = Duration(milliseconds: 800);

  /// Extra long duration 3: 900ms
  ///
  /// Use cases:
  /// - Elaborate reveal animations
  /// - Complex data transitions
  /// - Cinematic effects
  static const Duration extraLong3 = Duration(milliseconds: 900);

  /// Extra long duration 4: 1000ms
  ///
  /// Use cases:
  /// - Maximum duration for any animation
  /// - Very complex orchestrated animations
  /// - Special emphasis transitions
  static const Duration extraLong4 = Duration(milliseconds: 1000);

  /// Gets the appropriate duration for a given animation complexity.
  static Duration getDuration(AnimationComplexity complexity) {
    switch (complexity) {
      case AnimationComplexity.simple:
        return short2;
      case AnimationComplexity.moderate:
        return medium2;
      case AnimationComplexity.complex:
        return long2;
      case AnimationComplexity.veryComplex:
        return extraLong2;
    }
  }

  /// Gets duration based on the distance of motion.
  ///
  /// Longer distances require longer durations for natural motion.
  static Duration getByDistance(double distance) {
    if (distance < 100) return short4;
    if (distance < 200) return medium1;
    if (distance < 400) return medium4;
    if (distance < 800) return long2;
    return long4;
  }

  /// Scales a duration by a factor.
  ///
  /// Useful for adjusting animation speed globally or
  /// for accessibility (reduced motion).
  static Duration scale(Duration duration, double factor) {
    return Duration(
      milliseconds: (duration.inMilliseconds * factor).round(),
    );
  }

  /// Returns zero duration for reduced motion accessibility.
  static Duration reduced(Duration duration, bool reduceMotion) {
    return reduceMotion ? Duration.zero : duration;
  }
}

/// Complexity levels for animations.
enum AnimationComplexity {
  /// Simple animations (small UI elements).
  simple,

  /// Moderate complexity (standard components).
  moderate,

  /// Complex animations (multiple elements).
  complex,

  /// Very complex (full-screen or orchestrated).
  veryComplex,
}

/// Predefined durations for common Material Design 3 components.
class ComponentDurations {
  ComponentDurations._();

  // Buttons
  static const Duration buttonPress = MaterialDuration.short2;
  static const Duration buttonRelease = MaterialDuration.short4;
  static const Duration fabTransform = MaterialDuration.medium2;
  static const Duration fabExtended = MaterialDuration.medium3;

  // Cards
  static const Duration cardHover = MaterialDuration.short3;
  static const Duration cardExpand = MaterialDuration.medium2;
  static const Duration cardCollapse = MaterialDuration.medium1;
  static const Duration cardFlip = MaterialDuration.long1;

  // Navigation
  static const Duration navigationTransition = MaterialDuration.medium2;
  static const Duration drawerSlide = MaterialDuration.medium1;
  static const Duration railExpand = MaterialDuration.medium2;
  static const Duration tabSwitch = MaterialDuration.medium1;

  // Dialogs and sheets
  static const Duration dialogOpen = MaterialDuration.medium3;
  static const Duration dialogClose = MaterialDuration.medium1;
  static const Duration bottomSheetOpen = MaterialDuration.medium2;
  static const Duration bottomSheetClose = MaterialDuration.short4;

  // Selection controls
  static const Duration checkboxToggle = MaterialDuration.short2;
  static const Duration radioSelect = MaterialDuration.short2;
  static const Duration switchToggle = MaterialDuration.short3;
  static const Duration sliderThumb = MaterialDuration.short1;

  // Input fields
  static const Duration textFieldFocus = MaterialDuration.short3;
  static const Duration textFieldError = MaterialDuration.short4;
  static const Duration labelFloat = MaterialDuration.short4;

  // Feedback
  static const Duration ripple = MaterialDuration.medium1;
  static const Duration snackbar = MaterialDuration.medium4;
  static const Duration tooltip = MaterialDuration.short3;

  // Progress
  static const Duration progressIndeterminate = MaterialDuration.extraLong4;
  static const Duration progressStep = MaterialDuration.short4;

  // Lists
  static const Duration listItemSlide = MaterialDuration.short4;
  static const Duration listItemFade = MaterialDuration.short3;
  static const Duration listStagger = MaterialDuration.short1;

  // Chips
  static const Duration chipSelect = MaterialDuration.short2;
  static const Duration chipDelete = MaterialDuration.short3;

  // Menus
  static const Duration menuOpen = MaterialDuration.short4;
  static const Duration menuClose = MaterialDuration.short3;
  static const Duration menuItemHighlight = MaterialDuration.short1;
}

/// Duration utilities for animations.
class DurationUtils {
  DurationUtils._();

  /// Calculates staggered delay for list animations.
  ///
  /// [index]: The index of the item in the list.
  /// [baseDelay]: The delay between each item.
  /// [maxDelay]: Maximum total delay to prevent very long staggers.
  static Duration staggerDelay(
    int index, {
    Duration baseDelay = MaterialDuration.short1,
    Duration maxDelay = MaterialDuration.long2,
  }) {
    final delay = baseDelay * index;
    if (delay > maxDelay) {
      return maxDelay;
    }
    return delay;
  }

  /// Creates a duration curve for choreographed animations.
  ///
  /// Returns a list of durations for multiple elements that
  /// animate together in a coordinated way.
  static List<Duration> choreograph(
    int count, {
    Duration totalDuration = MaterialDuration.long2,
    double overlap = 0.8,
  }) {
    final durations = <Duration>[];
    final itemDuration = Duration(
      milliseconds: (totalDuration.inMilliseconds * overlap).round(),
    );

    for (var i = 0; i < count; i++) {
      durations.add(itemDuration);
    }

    return durations;
  }

  /// Gets the total duration for a staggered animation.
  static Duration totalStaggerDuration(
    int itemCount,
    Duration itemDuration,
    Duration staggerDelay,
  ) {
    if (itemCount == 0) return Duration.zero;
    return itemDuration + (staggerDelay * (itemCount - 1));
  }

  /// Converts duration to a readable string format.
  static String format(Duration duration) {
    if (duration == Duration.zero) {
      return 'instant';
    }

    final ms = duration.inMilliseconds;
    if (ms < 1000) {
      return '${ms}ms';
    } else {
      final seconds = ms / 1000;
      return '${seconds.toStringAsFixed(1)}s';
    }
  }

  /// Gets the appropriate duration category name.
  static String getCategory(Duration duration) {
    final ms = duration.inMilliseconds;

    if (ms <= 200) return 'short';
    if (ms <= 400) return 'medium';
    if (ms <= 700) return 'long';
    return 'extra long';
  }
}

/// Motion choreography helper for complex animations.
class MotionChoreographer {
  /// Creates a choreographed animation sequence.
  ///
  /// This helps coordinate multiple animations to create
  /// smooth, cohesive motion.
  static AnimationSequence sequence() {
    return AnimationSequence();
  }
}

/// Represents a sequence of animations.
class AnimationSequence {
  final List<AnimationStep> _steps = [];

  /// Adds an animation step to the sequence.
  AnimationSequence add({
    required String name,
    required Duration duration,
    Duration delay = Duration.zero,
    Curve curve = Curves.easeInOut,
  }) {
    _steps.add(AnimationStep(
      name: name,
      duration: duration,
      delay: delay,
      curve: curve,
    ));
    return this;
  }

  /// Adds a parallel animation group.
  AnimationSequence parallel(List<AnimationStep> steps) {
    // Find the maximum duration in the group
    var maxDuration = Duration.zero;
    for (final step in steps) {
      final totalDuration = step.delay + step.duration;
      if (totalDuration > maxDuration) {
        maxDuration = totalDuration;
      }
    }

    // Add all steps with the same start time
    final currentDelay = totalDuration;
    for (final step in steps) {
      _steps.add(AnimationStep(
        name: step.name,
        duration: step.duration,
        delay: currentDelay + step.delay,
        curve: step.curve,
      ));
    }

    return this;
  }

  /// Gets the total duration of the sequence.
  Duration get totalDuration {
    var total = Duration.zero;
    for (final step in _steps) {
      final stepTotal = step.delay + step.duration;
      if (stepTotal > total) {
        total = stepTotal;
      }
    }
    return total;
  }

  /// Gets all animation steps.
  List<AnimationStep> get steps => List.unmodifiable(_steps);
}

/// Represents a single animation step.
class AnimationStep {
  const AnimationStep({
    required this.name,
    required this.duration,
    this.delay = Duration.zero,
    this.curve = Curves.easeInOut,
  });

  final String name;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  /// Gets the total duration including delay.
  Duration get totalDuration => delay + duration;
}
