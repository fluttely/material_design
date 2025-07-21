/// Material Design 3 Reference Motion Duration
/// 
/// Contains the base duration values used throughout the M3 motion system.
/// These are fundamental timing values for animations and transitions.
/// 
/// Based on: https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
abstract class M3RefDuration {
  /// Extra short duration - For very quick micro-interactions
  static const Duration extraShort1 = Duration(milliseconds: 50);
  static const Duration extraShort2 = Duration(milliseconds: 100);
  static const Duration extraShort3 = Duration(milliseconds: 150);
  static const Duration extraShort4 = Duration(milliseconds: 200);

  /// Short duration - For quick state changes and feedback
  static const Duration short1 = Duration(milliseconds: 250);
  static const Duration short2 = Duration(milliseconds: 300);
  static const Duration short3 = Duration(milliseconds: 350);
  static const Duration short4 = Duration(milliseconds: 400);

  /// Medium duration - For standard transitions
  static const Duration medium1 = Duration(milliseconds: 450);
  static const Duration medium2 = Duration(milliseconds: 500);
  static const Duration medium3 = Duration(milliseconds: 550);
  static const Duration medium4 = Duration(milliseconds: 600);

  /// Long duration - For complex transitions and entrances
  static const Duration long1 = Duration(milliseconds: 700);
  static const Duration long2 = Duration(milliseconds: 800);
  static const Duration long3 = Duration(milliseconds: 900);
  static const Duration long4 = Duration(milliseconds: 1000);

  /// Extra long duration - For page transitions and complex animations
  static const Duration extraLong1 = Duration(milliseconds: 1200);
  static const Duration extraLong2 = Duration(milliseconds: 1400);
  static const Duration extraLong3 = Duration(milliseconds: 1600);
  static const Duration extraLong4 = Duration(milliseconds: 1800);

  /// Commonly used duration aliases
  static const Duration instant = extraShort1;
  static const Duration quick = extraShort4;
  static const Duration standard = short1;
  static const Duration emphasis = short2;
  static const Duration entering = medium2;
  static const Duration exiting = short4;
  static const Duration complex = long1;
  static const Duration pageTransition = extraLong1;

  /// Duration categories by use case
  static const List<Duration> microInteractions = [
    extraShort1,
    extraShort2,
    extraShort3,
    extraShort4,
  ];

  static const List<Duration> stateChanges = [
    short1,
    short2,
    short3,
    short4,
  ];

  static const List<Duration> standardTransitions = [
    medium1,
    medium2,
    medium3,
    medium4,
  ];

  static const List<Duration> complexAnimations = [
    long1,
    long2,
    long3,
    long4,
  ];

  /// Get duration by category and intensity (0.0 to 1.0)
  static Duration getDuration(List<Duration> category, double intensity) {
    final clampedIntensity = intensity.clamp(0.0, 1.0);
    final index = (clampedIntensity * (category.length - 1)).round();
    return category[index];
  }

  /// Check if duration is within M3 recommended ranges
  static bool isRecommendedDuration(Duration duration) {
    final milliseconds = duration.inMilliseconds;
    return milliseconds >= 50 && milliseconds <= 1800;
  }
}