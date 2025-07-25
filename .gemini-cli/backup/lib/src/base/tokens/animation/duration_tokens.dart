part of '../design_tokens.dart';

/// Duration values used for animations following Material Design specifications.
///
/// Material Design uses specific timing patterns:
/// - Micro-interactions: 100ms
/// - Small elements: 150ms
/// - Standard mobile: 200-300ms
/// - Desktop: 150-200ms
/// - Complex transitions: 400ms+
/// - Entrance animations are slightly longer than exit animations
///
/// Reference: https://m2.material.io/design/motion/speed.html
class DurationTokens extends Equatable {
  const DurationTokens({
    bool? areAnimationEnabled,
    Duration? microInteraction,
    Duration? quick,
    Duration? regular,
    Duration? slow,
    Duration? complex,
    Duration? pageTransition,
  }) : areAnimationEnabled = areAnimationEnabled ?? true,
       microInteraction =
           microInteraction ??
           const Duration(milliseconds: MaterialTimings.microInteraction),
       quick =
           quick ?? const Duration(milliseconds: MaterialTimings.smallElement),
       regular =
           regular ??
           const Duration(milliseconds: MaterialTimings.mobileStandard),
       slow =
           slow ?? const Duration(milliseconds: MaterialTimings.largeElement),
       complex =
           complex ??
           const Duration(milliseconds: MaterialTimings.complexTransition),
       pageTransition =
           pageTransition ??
           const Duration(milliseconds: MaterialTimings.pageTransition);

  factory DurationTokens.fromMap(Map<String, dynamic> map) {
    Duration? d(String key) {
      final value = map[key];
      if (value is int) return Duration(milliseconds: value);
      return null;
    }

    return DurationTokens(
      areAnimationEnabled: map['areAnimationEnabled'] as bool?,
      microInteraction: d('microInteraction'),
      quick: d('quick'),
      regular: d('regular'),
      slow: d('slow'),
      complex: d('complex'),
      pageTransition: d('pageTransition'),
    );
  }

  /// Whether animations are enabled globally
  final bool areAnimationEnabled;

  /// Micro-interactions (100ms) - icon changes, button press feedback
  final Duration microInteraction;

  /// Quick transitions (150ms) - small elements, hover effects
  final Duration quick;

  /// Regular transitions (250ms) - standard mobile animations
  final Duration regular;

  /// Slow transitions (300ms) - large elements, complex UI changes
  final Duration slow;

  /// Complex transitions (400ms) - morphing, multi-step animations
  final Duration complex;

  /// Page transitions (400ms) - route changes, navigation
  final Duration pageTransition;

  // ============================================
  // MATERIAL DESIGN SEMANTIC DURATIONS
  // ============================================

  /// No animation (0ms)
  Duration get none => Duration.zero;

  /// Desktop standard animations (200ms)
  Duration get desktop =>
      const Duration(milliseconds: MaterialTimings.desktopStandard);

  /// Mobile short animations (200ms)
  Duration get mobileShort =>
      const Duration(milliseconds: MaterialTimings.mobileShort);

  /// Mobile long animations (300ms)
  Duration get mobileLong =>
      const Duration(milliseconds: MaterialTimings.mobileLong);

  // ============================================
  // COMPONENT-SPECIFIC DURATIONS
  // ============================================

  /// Navigation drawer animations
  Duration get drawerOpen =>
      const Duration(milliseconds: MaterialTimings.drawerOpen);
  Duration get drawerClose =>
      const Duration(milliseconds: MaterialTimings.drawerClose);

  /// Card animations
  Duration get cardExpand =>
      const Duration(milliseconds: MaterialTimings.cardExpand);
  Duration get cardCollapse =>
      const Duration(milliseconds: MaterialTimings.cardCollapse);

  /// Dialog animations
  Duration get dialogEnter =>
      const Duration(milliseconds: MaterialTimings.dialogEnter);
  Duration get dialogExit =>
      const Duration(milliseconds: MaterialTimings.dialogExit);

  /// Bottom sheet animations
  Duration get bottomSheetEnter =>
      const Duration(milliseconds: MaterialTimings.bottomSheetEnter);
  Duration get bottomSheetExit =>
      const Duration(milliseconds: MaterialTimings.bottomSheetExit);

  /// FAB animations
  Duration get fabShow => const Duration(milliseconds: MaterialTimings.fabShow);
  Duration get fabHide => const Duration(milliseconds: MaterialTimings.fabHide);

  /// Snackbar animations
  Duration get snackbarEnter =>
      const Duration(milliseconds: MaterialTimings.snackbarEnter);
  Duration get snackbarExit =>
      const Duration(milliseconds: MaterialTimings.snackbarExit);

  /// Splash screen duration
  Duration get splash => const Duration(milliseconds: MaterialTimings.splash);

  // ============================================
  // DIRECT ACCESS TO MATERIAL TIMINGS
  // ============================================

  /// Direct access to all Material Design timing values
  Duration get x100 => const Duration(milliseconds: MaterialTimings.x100);
  Duration get x150 => const Duration(milliseconds: MaterialTimings.x150);
  Duration get x200 => const Duration(milliseconds: MaterialTimings.x200);
  Duration get x250 => const Duration(milliseconds: MaterialTimings.x250);
  Duration get x300 => const Duration(milliseconds: MaterialTimings.x300);
  Duration get x400 => const Duration(milliseconds: MaterialTimings.x400);
  Duration get x500 => const Duration(milliseconds: MaterialTimings.x500);

  // ============================================
  // DEVICE-SPECIFIC DURATIONS
  // ============================================

  /// Wearable device animations (30% faster than mobile)
  Duration get wearableShort =>
      const Duration(milliseconds: MaterialTimings.wearableShort);
  Duration get wearableStandard =>
      const Duration(milliseconds: MaterialTimings.wearableStandard);
  Duration get wearableLong =>
      const Duration(milliseconds: MaterialTimings.wearableLong);

  /// Tablet device animations (30% slower than mobile)
  Duration get tabletShort =>
      const Duration(milliseconds: MaterialTimings.tabletShort);
  Duration get tabletStandard =>
      const Duration(milliseconds: MaterialTimings.tabletStandard);
  Duration get tabletLong =>
      const Duration(milliseconds: MaterialTimings.tabletLong);

  // ============================================
  // UTILITY METHODS
  // ============================================

  /// Returns appropriate duration for entrance animations
  Duration forEntrance(Duration baseDuration) {
    if (!areAnimationEnabled) return Duration.zero;
    return baseDuration;
  }

  /// Returns appropriate duration for exit animations (20% faster)
  Duration forExit(Duration baseDuration) {
    if (!areAnimationEnabled) return Duration.zero;
    return Duration(milliseconds: (baseDuration.inMilliseconds * 0.8).round());
  }

  /// Scales duration based on distance/size
  Duration forDistance(Duration baseDuration, double distance) {
    if (!areAnimationEnabled) return Duration.zero;

    if (distance < 100) {
      return Duration(
        milliseconds: (baseDuration.inMilliseconds * 0.7).round(),
      );
    }
    if (distance > 500) {
      return Duration(
        milliseconds: (baseDuration.inMilliseconds * 1.3).round(),
      );
    }
    return baseDuration;
  }

  /// Returns duration based on device type
  Duration forDevice({
    required Duration mobile,
    Duration? desktop,
    Duration? tablet,
    Duration? wearable,
  }) {
    if (!areAnimationEnabled) return Duration.zero;

    // Em uma implementação real, você detectaria o tipo de device
    // Por enquanto, retorna mobile como padrão
    return mobile;
  }

  @override
  List<Object?> get props => [
    areAnimationEnabled,
    microInteraction,
    quick,
    regular,
    slow,
    complex,
    pageTransition,
  ];

  @override
  String toString() =>
      '''
DurationTokens(
  areAnimationEnabled: $areAnimationEnabled,
  microInteraction: ${microInteraction.inMilliseconds}ms,
  quick: ${quick.inMilliseconds}ms,
  regular: ${regular.inMilliseconds}ms,
  slow: ${slow.inMilliseconds}ms,
  complex: ${complex.inMilliseconds}ms,
  pageTransition: ${pageTransition.inMilliseconds}ms,
)
''';
}
