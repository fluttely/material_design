/// Standard motions used across the Material Design animations.
///
/// Based on official Material Design specifications:
/// - Mobile: 200-300ms
/// - Desktop: 150-200ms
/// - Wearables: 30% faster than mobile
/// - Tablets: 30% slower than mobile
/// - Entrance animations: slightly longer than exit animations
/// - Small elements: shorter motions than large elements
///
/// Reference: https://m2.material.io/design/motion/speed.html
abstract final class MaterialMotion {
  static const none = Duration();

  /// Micro-interactions (icon changes, button press feedback)
  static const microInteraction = Duration(milliseconds: 100);

  /// Small element transitions (buttons, chips, small cards)
  static const smallElement = Duration(milliseconds: 150);

  /// Medium element transitions (cards, dialogs)
  static const mediumElement = Duration(milliseconds: 250);

  /// Large element transitions (drawers, bottom sheets)
  static const largeElement = Duration(milliseconds: 300);

  /// Complex transitions (page transitions, morphing)
  static const complexTransition = Duration(milliseconds: 400);

  /// Full screen transitions
  static const int fullScreen = 500;

  // ============================================
  // DEVICE-SPECIFIC DURATIONS
  // ============================================

  /// Desktop animations (150-200ms range)
  static const desktopShort = Duration(milliseconds: 150);
  static const desktopLong = Duration(milliseconds: 200);

  /// Page transitions
  static const pageTransition = Duration(milliseconds: 400);

  /// Splash screens and loading
  // static const int splash = ;

  // ============================================
  // MATERIAL DESIGN SEMANTIC DURATIONS
  // ============================================

  /// Desktop standard animations (200ms)
  static const desktop = Duration(milliseconds: 200);

  /// Mobile short animations (200ms)
  static const mobileShort = Duration(milliseconds: 200);

  static const mobileStandard = Duration(milliseconds: 250);

  /// Mobile long animations (300ms)
  static const mobileLong = Duration(milliseconds: 300);

  // ============================================
  // COMPONENT-SPECIFIC DURATIONS
  // ============================================

  /// Navigation drawer animations
  static const drawerOpen = Duration(milliseconds: 250);
  static const drawerClose = Duration(milliseconds: 200);

  /// Card animations
  static const cardExpand = Duration(milliseconds: 300);
  static const cardCollapse = Duration(milliseconds: 250);

  /// Dialog animations
  static const dialogEnter = Duration(milliseconds: 300);
  static const dialogExit = Duration(milliseconds: 200);

  /// Bottom sheet animations
  static const bottomSheetEnter = Duration(milliseconds: 300);
  static const bottomSheetExit = Duration(milliseconds: 250);

  /// FAB animations
  static const fabShow = Duration(milliseconds: 200);
  static const fabHide = Duration(milliseconds: 150);

  /// Snackbar animations
  static const snackbarEnter = Duration(milliseconds: 300);
  static const snackbarExit = Duration(milliseconds: 200);

  /// Splash screen duration
  static const splash = Duration(milliseconds: 500);

  // ============================================
  // DEVICE-SPECIFIC DURATIONS
  // ============================================

  /// Wearable device animations (30% faster than mobile)
  static const wearableShort = Duration(milliseconds: 140); // 200ms * 0.7
  static const wearableStandard = Duration(milliseconds: 175); // 250ms * 0.7
  static const wearableLong = Duration(milliseconds: 210); // 300ms * 0.7

  /// Tablet device animations (30% slower than mobile)
  static const tabletShort = Duration(milliseconds: 260); // 200ms * 1.3
  static const tabletStandard = Duration(milliseconds: 325); // 250ms * 1.3
  static const tabletLong = Duration(milliseconds: 390); // 300ms * 1.3

  // ============================================
  // UTILITY METHODS
  // ============================================

  /// Returns appropriate duration for device type
  static int forDevice({
    required int mobile,
    int? desktop,
    int? tablet,
    int? wearable,
  }) {
    // Em uma implementação real, você detectaria o tipo de device
    // Por enquanto, retorna mobile como padrão
    return mobile;
  }

  /// Applies Material Design entrance/exit timing rules
  static int forEntrance(int baseDuration) => baseDuration;
  static int forExit(int baseDuration) => (baseDuration * 0.8).round();

  /// Scales duration based on distance/size
  static int forDistance(int baseDuration, double distance) {
    if (distance < 100) return (baseDuration * 0.7).round();
    if (distance > 500) return (baseDuration * 1.3).round();
    return baseDuration;
  }
}
