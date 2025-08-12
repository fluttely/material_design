/// Material Design 3 duration system with design tokens.
///
/// This file implements the Material Design 3 motion duration specifications
/// using the design token hierarchy system for maintainable and scalable
/// duration management.
///
/// Token Hierarchy:
/// - Reference tokens: Raw millisecond values
/// - System tokens: Semantic duration categories
/// - Component tokens: Component-specific durations
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
library;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

// ============================================================================
// REFERENCE TOKENS - Raw duration values in milliseconds
// ============================================================================

/// Reference tokens for duration values in milliseconds.
class DurationReferenceTokens {
  DurationReferenceTokens._();

  // Short durations (50-200ms)
  static const ms50 = ReferenceToken<int>(
    50,
    'duration.ms50',
    description: '50 milliseconds',
  );

  static const ms100 = ReferenceToken<int>(
    100,
    'duration.ms100',
    description: '100 milliseconds',
  );

  static const ms150 = ReferenceToken<int>(
    150,
    'duration.ms150',
    description: '150 milliseconds',
  );

  static const ms200 = ReferenceToken<int>(
    200,
    'duration.ms200',
    description: '200 milliseconds',
  );

  // Medium durations (250-400ms)
  static const ms250 = ReferenceToken<int>(
    250,
    'duration.ms250',
    description: '250 milliseconds',
  );

  static const ms300 = ReferenceToken<int>(
    300,
    'duration.ms300',
    description: '300 milliseconds',
  );

  static const ms350 = ReferenceToken<int>(
    350,
    'duration.ms350',
    description: '350 milliseconds',
  );

  static const ms400 = ReferenceToken<int>(
    400,
    'duration.ms400',
    description: '400 milliseconds',
  );

  // Long durations (450-600ms)
  static const ms450 = ReferenceToken<int>(
    450,
    'duration.ms450',
    description: '450 milliseconds',
  );

  static const ms500 = ReferenceToken<int>(
    500,
    'duration.ms500',
    description: '500 milliseconds',
  );

  static const ms550 = ReferenceToken<int>(
    550,
    'duration.ms550',
    description: '550 milliseconds',
  );

  static const ms600 = ReferenceToken<int>(
    600,
    'duration.ms600',
    description: '600 milliseconds',
  );

  // Extra long durations (700-1000ms)
  static const ms700 = ReferenceToken<int>(
    700,
    'duration.ms700',
    description: '700 milliseconds',
  );

  static const ms800 = ReferenceToken<int>(
    800,
    'duration.ms800',
    description: '800 milliseconds',
  );

  static const ms900 = ReferenceToken<int>(
    900,
    'duration.ms900',
    description: '900 milliseconds',
  );

  static const ms1000 = ReferenceToken<int>(
    1000,
    'duration.ms1000',
    description: '1000 milliseconds (1 second)',
  );
}

// ============================================================================
// SYSTEM TOKENS - Semantic duration categories
// ============================================================================

/// System tokens for short durations (50-200ms).
class ShortDurationSystemTokens {
  ShortDurationSystemTokens._();

  static final SystemToken<Duration> short1 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms50,
    systemName: 'duration.short1',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Shortest duration for micro-interactions',
  );

  static final SystemToken<Duration> short2 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms100,
    systemName: 'duration.short2',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Short duration for small UI changes',
  );

  static final SystemToken<Duration> short3 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms150,
    systemName: 'duration.short3',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Short duration for quick feedback',
  );

  static final SystemToken<Duration> short4 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms200,
    systemName: 'duration.short4',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Longest short duration for simple animations',
  );
}

/// System tokens for medium durations (250-400ms).
class MediumDurationSystemTokens {
  MediumDurationSystemTokens._();

  static final SystemToken<Duration> medium1 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms250,
    systemName: 'duration.medium1',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Shortest medium duration',
  );

  static final SystemToken<Duration> medium2 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms300,
    systemName: 'duration.medium2',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Standard medium duration',
  );

  static final SystemToken<Duration> medium3 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms350,
    systemName: 'duration.medium3',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Extended medium duration',
  );

  static final SystemToken<Duration> medium4 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms400,
    systemName: 'duration.medium4',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Longest medium duration',
  );
}

/// System tokens for long durations (450-600ms).
class LongDurationSystemTokens {
  LongDurationSystemTokens._();

  static final SystemToken<Duration> long1 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms450,
    systemName: 'duration.long1',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Shortest long duration',
  );

  static final SystemToken<Duration> long2 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms500,
    systemName: 'duration.long2',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Standard long duration',
  );

  static final SystemToken<Duration> long3 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms550,
    systemName: 'duration.long3',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Extended long duration',
  );

  static final SystemToken<Duration> long4 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms600,
    systemName: 'duration.long4',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Longest long duration',
  );
}

/// System tokens for extra long durations (700-1000ms).
class ExtraLongDurationSystemTokens {
  ExtraLongDurationSystemTokens._();

  static final SystemToken<Duration> extraLong1 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms700,
    systemName: 'duration.extraLong1',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Shortest extra long duration',
  );

  static final SystemToken<Duration> extraLong2 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms800,
    systemName: 'duration.extraLong2',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Standard extra long duration',
  );

  static final SystemToken<Duration> extraLong3 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms900,
    systemName: 'duration.extraLong3',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Extended extra long duration',
  );

  static final SystemToken<Duration> extraLong4 =
      SystemToken.transform<Duration, int>(
    DurationReferenceTokens.ms1000,
    systemName: 'duration.extraLong4',
    transformer: (ms) => Duration(milliseconds: ms),
    description: 'Maximum recommended duration',
  );
}

// ============================================================================
// COMPONENT TOKENS - Component-specific durations
// ============================================================================

/// Component tokens for button durations.
class ButtonDurationTokens {
  ButtonDurationTokens._();

  static final press = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short2,
    component: 'Button',
    tokenName: 'duration',
    state: 'press',
    description: 'Button press animation duration',
  );

  static final release = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short4,
    component: 'Button',
    tokenName: 'duration',
    state: 'release',
    description: 'Button release animation duration',
  );

  static final fabTransform = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium2,
    component: 'FAB',
    tokenName: 'duration',
    state: 'transform',
    description: 'FAB transformation duration',
  );

  static final fabExtended = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium3,
    component: 'FAB',
    tokenName: 'duration',
    state: 'extended',
    description: 'FAB extend/collapse duration',
  );
}

/// Component tokens for card durations.
class CardDurationTokens {
  CardDurationTokens._();

  static final hover = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short3,
    component: 'Card',
    tokenName: 'duration',
    state: 'hover',
    description: 'Card hover animation duration',
  );

  static final expand = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium2,
    component: 'Card',
    tokenName: 'duration',
    state: 'expand',
    description: 'Card expansion duration',
  );

  static final collapse = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium1,
    component: 'Card',
    tokenName: 'duration',
    state: 'collapse',
    description: 'Card collapse duration',
  );

  static final flip = ComponentToken<Duration>.fromSystem(
    LongDurationSystemTokens.long1,
    component: 'Card',
    tokenName: 'duration',
    state: 'flip',
    description: 'Card flip animation duration',
  );
}

/// Component tokens for navigation durations.
class NavigationDurationTokens {
  NavigationDurationTokens._();

  static final transition = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium2,
    component: 'Navigation',
    tokenName: 'duration',
    state: 'transition',
    description: 'Navigation transition duration',
  );

  static final drawerSlide = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium1,
    component: 'Drawer',
    tokenName: 'duration',
    state: 'slide',
    description: 'Navigation drawer slide duration',
  );

  static final railExpand = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium2,
    component: 'NavigationRail',
    tokenName: 'duration',
    state: 'expand',
    description: 'Navigation rail expansion duration',
  );

  static final tabSwitch = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium1,
    component: 'Tab',
    tokenName: 'duration',
    state: 'switch',
    description: 'Tab switch animation duration',
  );
}

/// Component tokens for dialog and sheet durations.
class DialogSheetDurationTokens {
  DialogSheetDurationTokens._();

  static final dialogOpen = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium3,
    component: 'Dialog',
    tokenName: 'duration',
    state: 'open',
    description: 'Dialog open animation duration',
  );

  static final dialogClose = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium1,
    component: 'Dialog',
    tokenName: 'duration',
    state: 'close',
    description: 'Dialog close animation duration',
  );

  static final bottomSheetOpen = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium2,
    component: 'BottomSheet',
    tokenName: 'duration',
    state: 'open',
    description: 'Bottom sheet open duration',
  );

  static final bottomSheetClose = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short4,
    component: 'BottomSheet',
    tokenName: 'duration',
    state: 'close',
    description: 'Bottom sheet close duration',
  );
}

/// Component tokens for selection control durations.
class SelectionDurationTokens {
  SelectionDurationTokens._();

  static final checkboxToggle = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short2,
    component: 'Checkbox',
    tokenName: 'duration',
    state: 'toggle',
    description: 'Checkbox toggle animation duration',
  );

  static final radioSelect = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short2,
    component: 'Radio',
    tokenName: 'duration',
    state: 'select',
    description: 'Radio button selection duration',
  );

  static final switchToggle = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short3,
    component: 'Switch',
    tokenName: 'duration',
    state: 'toggle',
    description: 'Switch toggle animation duration',
  );

  static final sliderThumb = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short1,
    component: 'Slider',
    tokenName: 'duration',
    state: 'thumb',
    description: 'Slider thumb movement duration',
  );
}

/// Component tokens for input field durations.
class InputDurationTokens {
  InputDurationTokens._();

  static final textFieldFocus = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short3,
    component: 'TextField',
    tokenName: 'duration',
    state: 'focus',
    description: 'Text field focus animation duration',
  );

  static final textFieldError = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short4,
    component: 'TextField',
    tokenName: 'duration',
    state: 'error',
    description: 'Text field error animation duration',
  );

  static final labelFloat = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short4,
    component: 'TextField',
    tokenName: 'duration',
    state: 'labelFloat',
    description: 'Floating label animation duration',
  );
}

/// Component tokens for feedback durations.
class FeedbackDurationTokens {
  FeedbackDurationTokens._();

  static final ripple = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium1,
    component: 'Ripple',
    tokenName: 'duration',
    description: 'Ripple effect duration',
  );

  static final snackbar = ComponentToken<Duration>.fromSystem(
    MediumDurationSystemTokens.medium4,
    component: 'Snackbar',
    tokenName: 'duration',
    description: 'Snackbar animation duration',
  );

  static final tooltip = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short3,
    component: 'Tooltip',
    tokenName: 'duration',
    description: 'Tooltip fade duration',
  );
}

/// Component tokens for progress indicator durations.
class ProgressDurationTokens {
  ProgressDurationTokens._();

  static final indeterminate = ComponentToken<Duration>.fromSystem(
    ExtraLongDurationSystemTokens.extraLong4,
    component: 'Progress',
    tokenName: 'duration',
    state: 'indeterminate',
    description: 'Indeterminate progress animation duration',
  );

  static final step = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short4,
    component: 'Progress',
    tokenName: 'duration',
    state: 'step',
    description: 'Progress step animation duration',
  );
}

/// Component tokens for list durations.
class ListDurationTokens {
  ListDurationTokens._();

  static final itemSlide = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short4,
    component: 'List',
    tokenName: 'duration',
    state: 'itemSlide',
    description: 'List item slide animation duration',
  );

  static final itemFade = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short3,
    component: 'List',
    tokenName: 'duration',
    state: 'itemFade',
    description: 'List item fade animation duration',
  );

  static final stagger = ComponentToken<Duration>.fromSystem(
    ShortDurationSystemTokens.short1,
    component: 'List',
    tokenName: 'duration',
    state: 'stagger',
    description: 'List stagger delay between items',
  );
}

// ============================================================================
// PUBLIC API - Duration utilities and helpers
// ============================================================================

/// Material Design 3 duration system.
///
/// Provides access to duration tokens and utilities for working with
/// durations in Material Design 3.
class MaterialDuration {
  MaterialDuration._();

  // Short durations
  static Duration get short1 => ShortDurationSystemTokens.short1.value;
  static Duration get short2 => ShortDurationSystemTokens.short2.value;
  static Duration get short3 => ShortDurationSystemTokens.short3.value;
  static Duration get short4 => ShortDurationSystemTokens.short4.value;

  // Medium durations
  static Duration get medium1 => MediumDurationSystemTokens.medium1.value;
  static Duration get medium2 => MediumDurationSystemTokens.medium2.value;
  static Duration get medium3 => MediumDurationSystemTokens.medium3.value;
  static Duration get medium4 => MediumDurationSystemTokens.medium4.value;

  // Long durations
  static Duration get long1 => LongDurationSystemTokens.long1.value;
  static Duration get long2 => LongDurationSystemTokens.long2.value;
  static Duration get long3 => LongDurationSystemTokens.long3.value;
  static Duration get long4 => LongDurationSystemTokens.long4.value;

  // Extra long durations
  static Duration get extraLong1 =>
      ExtraLongDurationSystemTokens.extraLong1.value;
  static Duration get extraLong2 =>
      ExtraLongDurationSystemTokens.extraLong2.value;
  static Duration get extraLong3 =>
      ExtraLongDurationSystemTokens.extraLong3.value;
  static Duration get extraLong4 =>
      ExtraLongDurationSystemTokens.extraLong4.value;

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
  static Duration getByDistance(double distance) {
    if (distance < 100) return short4;
    if (distance < 200) return medium1;
    if (distance < 400) return medium4;
    if (distance < 800) return long2;
    return long4;
  }

  /// Scales a duration by a factor.
  static Duration scale(Duration duration, double factor) {
    return Duration(
      milliseconds: (duration.inMilliseconds * factor).round(),
    );
  }

  /// Returns zero duration for reduced motion accessibility.
  static Duration reduced(Duration duration, bool reduceMotion) {
    return reduceMotion ? Duration.zero : duration;
  }

  /// Gets a duration token by its semantic name.
  static DesignToken<Duration>? getToken(String name) {
    final tokens = <String, DesignToken<Duration>>{
      'short1': ShortDurationSystemTokens.short1,
      'short2': ShortDurationSystemTokens.short2,
      'short3': ShortDurationSystemTokens.short3,
      'short4': ShortDurationSystemTokens.short4,
      'medium1': MediumDurationSystemTokens.medium1,
      'medium2': MediumDurationSystemTokens.medium2,
      'medium3': MediumDurationSystemTokens.medium3,
      'medium4': MediumDurationSystemTokens.medium4,
      'long1': LongDurationSystemTokens.long1,
      'long2': LongDurationSystemTokens.long2,
      'long3': LongDurationSystemTokens.long3,
      'long4': LongDurationSystemTokens.long4,
      'extraLong1': ExtraLongDurationSystemTokens.extraLong1,
      'extraLong2': ExtraLongDurationSystemTokens.extraLong2,
      'extraLong3': ExtraLongDurationSystemTokens.extraLong3,
      'extraLong4': ExtraLongDurationSystemTokens.extraLong4,
    };
    return tokens[name];
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

/// Duration utilities for animations.
class DurationUtils {
  DurationUtils._();

  /// Calculates staggered delay for list animations.
  static Duration staggerDelay(
    int index, {
    DesignToken<Duration>? baseDelayToken,
    DesignToken<Duration>? maxDelayToken,
  }) {
    final baseDelay = baseDelayToken?.value ?? MaterialDuration.short1;
    final maxDelay = maxDelayToken?.value ?? MaterialDuration.long2;

    final delay = baseDelay * index;
    if (delay > maxDelay) {
      return maxDelay;
    }
    return delay;
  }

  /// Creates a duration curve for choreographed animations.
  static List<Duration> choreograph(
    int count, {
    DesignToken<Duration>? totalDurationToken,
    double overlap = 0.8,
  }) {
    final totalDuration = totalDurationToken?.value ?? MaterialDuration.long2;
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
    required DesignToken<Duration> durationToken,
    DesignToken<Duration>? delayToken,
    Curve curve = Curves.easeInOut,
  }) {
    _steps.add(AnimationStep(
      name: name,
      duration: durationToken.value,
      delay: delayToken?.value ?? Duration.zero,
      curve: curve,
    ));
    return this;
  }

  /// Adds a parallel animation group.
  AnimationSequence parallel(List<AnimationStep> steps) {
    var maxDuration = Duration.zero;
    for (final step in steps) {
      final totalDuration = step.delay + step.duration;
      if (totalDuration > maxDuration) {
        maxDuration = totalDuration;
      }
    }

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

// /// Extension methods for easy access to duration tokens.
// extension DurationContext on BuildContext {
//   /// Gets the button duration tokens.
//   ButtonDurationTokens get buttonDuration => ButtonDurationTokens();

//   /// Gets the card duration tokens.
//   CardDurationTokens get cardDuration => CardDurationTokens();

//   /// Gets the navigation duration tokens.
//   NavigationDurationTokens get navigationDuration => NavigationDurationTokens();

//   /// Gets the dialog and sheet duration tokens.
//   DialogSheetDurationTokens get dialogSheetDuration =>
//       DialogSheetDurationTokens();

//   /// Gets the selection duration tokens.
//   SelectionDurationTokens get selectionDuration => SelectionDurationTokens();

//   /// Gets the input duration tokens.
//   InputDurationTokens get inputDuration => InputDurationTokens();

//   /// Gets the feedback duration tokens.
//   FeedbackDurationTokens get feedbackDuration => FeedbackDurationTokens();

//   /// Gets the progress duration tokens.
//   ProgressDurationTokens get progressDuration => ProgressDurationTokens();

//   /// Gets the list duration tokens.
//   ListDurationTokens get listDuration => ListDurationTokens();
// }
