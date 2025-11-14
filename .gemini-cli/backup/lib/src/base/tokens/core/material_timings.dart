part of '../design_tokens.dart';

/// Standard durations used across the Material Design animations.
///
/// Based on official Material Design specifications:
/// - Mobile: 200-300ms
/// - Desktop: 150-200ms
/// - Wearables: 30% faster than mobile
/// - Tablets: 30% slower than mobile
/// - Entrance animations: slightly longer than exit animations
/// - Small elements: shorter durations than large elements
///
/// Reference: https://m2.material.io/design/motion/speed.html
abstract final class MaterialTimings {
  // ============================================
  // BASIC SCALE
  // ============================================

  /// No animation (0ms)
  static const int zero = 0;

  /// Very fast micro-interactions (100ms)
  static const int x100 = 100;

  /// Fast transitions, hover effects (150ms)
  static const int x150 = 150;

  /// Desktop standard, small mobile elements (200ms)
  static const int x200 = 200;

  /// Mobile standard, medium transitions (250ms)
  static const int x250 = 250;

  /// Mobile standard, large transitions (300ms)
  static const int x300 = 300;

  /// Complex transitions (400ms)
  static const int x400 = 400;

  /// Long transitions, page changes (500ms)
  static const int x500 = 500;

  // ============================================
  // MATERIAL DESIGN SEMANTIC DURATIONS
  // ============================================

  /// Micro-interactions (icon changes, button press feedback)
  static const int microInteraction = x100;

  /// Small element transitions (buttons, chips, small cards)
  static const int smallElement = x150;

  /// Standard desktop animations
  static const int desktopStandard = x200;

  /// Medium element transitions (cards, dialogs)
  static const int mediumElement = x250;

  /// Large element transitions (drawers, bottom sheets)
  static const int largeElement = x300;

  /// Complex transitions (page transitions, morphing)
  static const int complexTransition = x400;

  /// Full screen transitions
  static const int fullScreen = x500;

  // ============================================
  // DEVICE-SPECIFIC DURATIONS
  // ============================================

  /// Mobile device animations (200-300ms range)
  static const int mobileShort = x200;
  static const int mobileStandard = x250;
  static const int mobileLong = x300;

  /// Desktop animations (150-200ms range)
  static const int desktopShort = x150;
  static const int desktopLong = x200;

  /// Wearable animations (30% faster than mobile)
  static const int wearableShort = 140; // 200ms * 0.7
  static const int wearableStandard = 175; // 250ms * 0.7
  static const int wearableLong = 210; // 300ms * 0.7

  /// Tablet animations (30% slower than mobile)
  static const int tabletShort = 260; // 200ms * 1.3
  static const int tabletStandard = 325; // 250ms * 1.3
  static const int tabletLong = 390; // 300ms * 1.3

  // ============================================
  // COMPONENT-SPECIFIC DURATIONS
  // ============================================

  /// Navigation drawer
  static const int drawerOpen = x250;
  static const int drawerClose = x200;

  /// Cards
  static const int cardExpand = x300;
  static const int cardCollapse = x250;

  /// Dialogs and modals
  static const int dialogEnter = x300;
  static const int dialogExit = x200;

  /// Bottom sheets
  static const int bottomSheetEnter = x300;
  static const int bottomSheetExit = x250;

  /// FAB (Floating Action Button)
  static const int fabShow = x200;
  static const int fabHide = x150;

  /// Snackbars
  static const int snackbarEnter = x300;
  static const int snackbarExit = x200;

  /// Page transitions
  static const int pageTransition = x400;

  /// Splash screens and loading
  static const int splash = x500;

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
