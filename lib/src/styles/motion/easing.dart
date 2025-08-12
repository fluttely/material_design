/// Material Design 3 easing curves system with design tokens.
///
/// This file implements the Material Design 3 motion easing specifications
/// using the design token hierarchy system for maintainable and scalable
/// easing management.
///
/// Token Hierarchy:
/// - Reference tokens: Raw cubic-bezier values
/// - System tokens: Semantic easing curves
/// - Component tokens: Component-specific easing curves
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/styles/motion/easing-and-duration/tokens-specs
library;

import 'package:flutter/animation.dart';
import 'package:material_design/material_design.dart';

// ============================================================================
// REFERENCE TOKENS - Raw cubic-bezier control points
// ============================================================================

/// Container for cubic-bezier control points.
class CubicBezierPoints {
  const CubicBezierPoints(this.x1, this.y1, this.x2, this.y2);

  final double x1;
  final double y1;
  final double x2;
  final double y2;

  Cubic toCurve() => Cubic(x1, y1, x2, y2);
}

/// Reference tokens for cubic-bezier easing values.
class EasingReferenceTokens {
  EasingReferenceTokens._();

  // Standard curves
  static const standardPoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0.2, 0, 0, 1),
    'easing.standard',
    description: 'Standard emphasized decelerate curve',
  );

  static const standardLegacyPoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0.4, 0, 0.2, 1),
    'easing.standardLegacy',
    description: 'Legacy Material Design standard curve',
  );

  // Emphasized curves
  static const emphasizedPoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0.2, 0, 0, 1),
    'easing.emphasized',
    description: 'Emphasized curve for important transitions',
  );

  static const emphasizedDeceleratePoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0.05, 0.7, 0.1, 1),
    'easing.emphasizedDecelerate',
    description: 'Emphasized decelerate for incoming elements',
  );

  static const emphasizedAcceleratePoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0.3, 0, 0.8, 0.15),
    'easing.emphasizedAccelerate',
    description: 'Emphasized accelerate for exiting elements',
  );

  // Basic curves
  static const deceleratedPoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0, 0, 0, 1),
    'easing.decelerated',
    description: 'Decelerated curve for entering elements',
  );

  static const acceleratedPoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0.3, 0, 1, 1),
    'easing.accelerated',
    description: 'Accelerated curve for leaving elements',
  );

  // Linear (no easing)
  static const linearPoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0, 0, 1, 1),
    'easing.linear',
    description: 'Linear curve with no easing',
  );

  // Extended curves
  static const fastOutSlowInPoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0.4, 0, 0.2, 1),
    'easing.fastOutSlowIn',
    description: 'Android legacy fast out slow in',
  );

  static const fastOutLinearInPoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0.4, 0, 1, 1),
    'easing.fastOutLinearIn',
    description: 'Fast out linear in curve',
  );

  static const linearOutSlowInPoints = ReferenceToken<CubicBezierPoints>(
    CubicBezierPoints(0, 0, 0.2, 1),
    'easing.linearOutSlowIn',
    description: 'Linear out slow in curve',
  );
}

// ============================================================================
// SYSTEM TOKENS - Semantic easing curves
// ============================================================================

/// System tokens for standard easing curves.
class EasingSystemTokens {
  EasingSystemTokens._();

  static final SystemToken<Curve> standard =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.standardPoints,
    systemName: 'easing.standard',
    transformer: (points) => points.toCurve(),
    description: 'Standard curve for most transitions',
  );

  static final SystemToken<Curve> standardLegacy =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.standardLegacyPoints,
    systemName: 'easing.standardLegacy',
    transformer: (points) => points.toCurve(),
    description: 'Legacy standard curve for compatibility',
  );

  static final SystemToken<Curve> emphasized =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.emphasizedPoints,
    systemName: 'easing.emphasized',
    transformer: (points) => points.toCurve(),
    description: 'Emphasized curve for important transitions',
  );

  static final SystemToken<Curve> emphasizedDecelerate =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.emphasizedDeceleratePoints,
    systemName: 'easing.emphasizedDecelerate',
    transformer: (points) => points.toCurve(),
    description: 'Dramatic deceleration for incoming elements',
  );

  static final SystemToken<Curve> emphasizedAccelerate =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.emphasizedAcceleratePoints,
    systemName: 'easing.emphasizedAccelerate',
    transformer: (points) => points.toCurve(),
    description: 'Dramatic acceleration for exiting elements',
  );

  static final SystemToken<Curve> decelerated =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.deceleratedPoints,
    systemName: 'easing.decelerated',
    transformer: (points) => points.toCurve(),
    description: 'Decelerated curve for entering elements',
  );

  static final SystemToken<Curve> accelerated =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.acceleratedPoints,
    systemName: 'easing.accelerated',
    transformer: (points) => points.toCurve(),
    description: 'Accelerated curve for leaving elements',
  );

  static const linear = SystemToken<Curve>(
    Curves.linear,
    'easing.linear',
    description: 'Linear curve with constant rate of change',
  );
}

/// System tokens for extended easing curves.
class ExtendedEasingSystemTokens {
  ExtendedEasingSystemTokens._();

  static final SystemToken<Curve> fastOutSlowIn =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.fastOutSlowInPoints,
    systemName: 'easing.extended.fastOutSlowIn',
    transformer: (points) => points.toCurve(),
    description: 'Fast out slow in for Android compatibility',
  );

  static final SystemToken<Curve> fastOutLinearIn =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.fastOutLinearInPoints,
    systemName: 'easing.extended.fastOutLinearIn',
    transformer: (points) => points.toCurve(),
    description: 'Fast out linear in curve',
  );

  static final SystemToken<Curve> linearOutSlowIn =
      SystemToken.transform<Curve, CubicBezierPoints>(
    EasingReferenceTokens.linearOutSlowInPoints,
    systemName: 'easing.extended.linearOutSlowIn',
    transformer: (points) => points.toCurve(),
    description: 'Linear out slow in curve',
  );

  // Bounce curves
  static const bounceIn = SystemToken<Curve>(
    Curves.bounceIn,
    'easing.extended.bounceIn',
    description: 'Bounce in curve for playful animations',
  );

  static const bounceOut = SystemToken<Curve>(
    Curves.bounceOut,
    'easing.extended.bounceOut',
    description: 'Bounce out curve for playful animations',
  );

  static const bounceInOut = SystemToken<Curve>(
    Curves.bounceInOut,
    'easing.extended.bounceInOut',
    description: 'Bounce in and out curve for playful animations',
  );

  // Elastic curves
  static const elasticIn = SystemToken<Curve>(
    Curves.elasticIn,
    'easing.extended.elasticIn',
    description: 'Elastic in curve for spring-like animations',
  );

  static const elasticOut = SystemToken<Curve>(
    Curves.elasticOut,
    'easing.extended.elasticOut',
    description: 'Elastic out curve for spring-like animations',
  );

  static const elasticInOut = SystemToken<Curve>(
    Curves.elasticInOut,
    'easing.extended.elasticInOut',
    description: 'Elastic in and out curve for spring-like animations',
  );
}

// ============================================================================
// COMPONENT TOKENS - Component-specific easing curves
// ============================================================================

/// Component tokens for panel animations.
class PanelEasingTokens {
  PanelEasingTokens._();

  static final expand = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.emphasizedDecelerate,
    component: 'Panel',
    tokenName: 'easing',
    state: 'expand',
    description: 'Panel expansion easing',
  );

  static final collapse = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.emphasizedAccelerate,
    component: 'Panel',
    tokenName: 'easing',
    state: 'collapse',
    description: 'Panel collapse easing',
  );
}

/// Component tokens for FAB animations.
class FABEasingTokens {
  FABEasingTokens._();

  static final show = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.decelerated,
    component: 'FAB',
    tokenName: 'easing',
    state: 'show',
    description: 'FAB show animation easing',
  );

  static final hide = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.accelerated,
    component: 'FAB',
    tokenName: 'easing',
    state: 'hide',
    description: 'FAB hide animation easing',
  );

  static final transform = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.emphasized,
    component: 'FAB',
    tokenName: 'easing',
    state: 'transform',
    description: 'FAB transformation easing',
  );
}

/// Component tokens for sheet animations.
class SheetEasingTokens {
  SheetEasingTokens._();

  static final bottomSheetOpen = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.emphasizedDecelerate,
    component: 'BottomSheet',
    tokenName: 'easing',
    state: 'open',
    description: 'Bottom sheet opening easing',
  );

  static final bottomSheetClose = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.accelerated,
    component: 'BottomSheet',
    tokenName: 'easing',
    state: 'close',
    description: 'Bottom sheet closing easing',
  );

  static final sideSheetOpen = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.emphasizedDecelerate,
    component: 'SideSheet',
    tokenName: 'easing',
    state: 'open',
    description: 'Side sheet opening easing',
  );

  static final sideSheetClose = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.accelerated,
    component: 'SideSheet',
    tokenName: 'easing',
    state: 'close',
    description: 'Side sheet closing easing',
  );
}

/// Component tokens for dialog animations.
class DialogEasingTokens {
  DialogEasingTokens._();

  static final open = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.decelerated,
    component: 'Dialog',
    tokenName: 'easing',
    state: 'open',
    description: 'Dialog opening easing',
  );

  static final close = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.accelerated,
    component: 'Dialog',
    tokenName: 'easing',
    state: 'close',
    description: 'Dialog closing easing',
  );
}

/// Component tokens for navigation animations.
class NavigationEasingTokens {
  NavigationEasingTokens._();

  static final transition = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.emphasized,
    component: 'Navigation',
    tokenName: 'easing',
    state: 'transition',
    description: 'Navigation transition easing',
  );

  static final tabSwitch = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.standard,
    component: 'Tab',
    tokenName: 'easing',
    state: 'switch',
    description: 'Tab switch animation easing',
  );

  static final drawerSlide = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.emphasizedDecelerate,
    component: 'Drawer',
    tokenName: 'easing',
    state: 'slide',
    description: 'Navigation drawer slide easing',
  );
}

/// Component tokens for selection control animations.
class SelectionEasingTokens {
  SelectionEasingTokens._();

  static final switchToggle = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.standard,
    component: 'Switch',
    tokenName: 'easing',
    state: 'toggle',
    description: 'Switch toggle animation easing',
  );

  static final checkboxToggle = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.standard,
    component: 'Checkbox',
    tokenName: 'easing',
    state: 'toggle',
    description: 'Checkbox toggle animation easing',
  );

  static final radioSelect = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.standard,
    component: 'Radio',
    tokenName: 'easing',
    state: 'select',
    description: 'Radio selection animation easing',
  );
}

/// Component tokens for feedback animations.
class FeedbackEasingTokens {
  FeedbackEasingTokens._();

  static final ripple = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.decelerated,
    component: 'Ripple',
    tokenName: 'easing',
    description: 'Ripple effect easing',
  );

  static final hover = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.standard,
    component: 'Hover',
    tokenName: 'easing',
    description: 'Hover effect easing',
  );

  static final focus = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.standard,
    component: 'Focus',
    tokenName: 'easing',
    description: 'Focus effect easing',
  );
}

/// Component tokens for progress indicators.
class ProgressEasingTokens {
  ProgressEasingTokens._();

  static final linear = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.linear,
    component: 'Progress',
    tokenName: 'easing',
    state: 'linear',
    description: 'Linear progress indicator easing',
  );

  static final circular = ComponentToken<Curve>.fromSystem(
    EasingSystemTokens.linear,
    component: 'Progress',
    tokenName: 'easing',
    state: 'circular',
    description: 'Circular progress indicator easing',
  );
}

// ============================================================================
// PUBLIC API - Easing utilities and helpers
// ============================================================================

/// Material Design 3 easing curves.
class MaterialEasing {
  MaterialEasing._();

  // Standard curves
  static Curve get standard => EasingSystemTokens.standard.value;
  static Curve get standardLegacy => EasingSystemTokens.standardLegacy.value;
  static Curve get emphasized => EasingSystemTokens.emphasized.value;
  static Curve get emphasizedDecelerate =>
      EasingSystemTokens.emphasizedDecelerate.value;
  static Curve get emphasizedAccelerate =>
      EasingSystemTokens.emphasizedAccelerate.value;
  static Curve get decelerated => EasingSystemTokens.decelerated.value;
  static Curve get accelerated => EasingSystemTokens.accelerated.value;
  static Curve get linear => EasingSystemTokens.linear.value;

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
  static Curve reverse(Curve curve) {
    if (curve == decelerated) return accelerated;
    if (curve == accelerated) return decelerated;
    if (curve == emphasizedDecelerate) return emphasizedAccelerate;
    if (curve == emphasizedAccelerate) return emphasizedDecelerate;
    return curve;
  }

  /// Creates a custom cubic bezier curve.
  static Curve custom(double x1, double y1, double x2, double y2) {
    return Cubic(x1, y1, x2, y2);
  }

  /// Gets an easing token by its semantic name.
  static DesignToken<Curve>? getToken(String name) {
    final tokens = <String, DesignToken<Curve>>{
      'standard': EasingSystemTokens.standard,
      'emphasized': EasingSystemTokens.emphasized,
      'emphasizedDecelerate': EasingSystemTokens.emphasizedDecelerate,
      'emphasizedAccelerate': EasingSystemTokens.emphasizedAccelerate,
      'decelerated': EasingSystemTokens.decelerated,
      'accelerated': EasingSystemTokens.accelerated,
      'linear': EasingSystemTokens.linear,
    };
    return tokens[name];
  }
}

/// Extended easing curves.
class MaterialEasingExtended {
  MaterialEasingExtended._();

  // Symmetric transitions
  static Curve get fastOutSlowIn =>
      ExtendedEasingSystemTokens.fastOutSlowIn.value;
  static Curve get fastOutLinearIn =>
      ExtendedEasingSystemTokens.fastOutLinearIn.value;
  static Curve get linearOutSlowIn =>
      ExtendedEasingSystemTokens.linearOutSlowIn.value;

  // Bounce curves
  static Curve get bounceIn => ExtendedEasingSystemTokens.bounceIn.value;
  static Curve get bounceOut => ExtendedEasingSystemTokens.bounceOut.value;
  static Curve get bounceInOut => ExtendedEasingSystemTokens.bounceInOut.value;

  // Elastic curves
  static Curve get elasticIn => ExtendedEasingSystemTokens.elasticIn.value;
  static Curve get elasticOut => ExtendedEasingSystemTokens.elasticOut.value;
  static Curve get elasticInOut =>
      ExtendedEasingSystemTokens.elasticInOut.value;
}

/// Types of motion for selecting appropriate easing curves.
enum MotionType {
  incoming,
  outgoing,
  transition,
  persistent,
  emphasized,
}

/// Utilities for working with easing curves.
class EasingUtils {
  EasingUtils._();

  /// Chains two curves together.
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
    final delay = index / total * 0.5;
    return Interval(
      delay,
      delay + 0.5,
      curve: baseCurve,
    );
  }

  /// Converts a cubic-bezier string to a Curve.
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

// /// Extension methods for easy access to easing tokens.
// extension EasingContext on BuildContext {
//   /// Gets the panel easing tokens.
//   PanelEasingTokens get panelEasing => PanelEasingTokens();

//   /// Gets the FAB easing tokens.
//   FABEasingTokens get fabEasing => FABEasingTokens();

//   /// Gets the sheet easing tokens.
//   SheetEasingTokens get sheetEasing => SheetEasingTokens();

//   /// Gets the dialog easing tokens.
//   DialogEasingTokens get dialogEasing => DialogEasingTokens();

//   /// Gets the navigation easing tokens.
//   NavigationEasingTokens get navigationEasing => NavigationEasingTokens();

//   /// Gets the selection easing tokens.
//   SelectionEasingTokens get selectionEasing => SelectionEasingTokens();

//   /// Gets the feedback easing tokens.
//   FeedbackEasingTokens get feedbackEasing => FeedbackEasingTokens();

//   /// Gets the progress easing tokens.
//   ProgressEasingTokens get progressEasing => ProgressEasingTokens();
// }
