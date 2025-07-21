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
          case 'press': return M3MotionDuration.short1;
          case 'hover': return M3MotionDuration.short2;
          case 'focus': return M3MotionDuration.short2;
          default: return M3MotionDuration.short4;
        }
        
      case 'card':
        switch (animationType.toLowerCase()) {
          case 'elevation': return M3MotionDuration.short4;
          case 'expand': return M3MotionDuration.medium2;
          case 'collapse': return M3MotionDuration.medium1;
          default: return M3MotionDuration.medium1;
        }
        
      case 'dialog':
        switch (animationType.toLowerCase()) {
          case 'enter': return M3MotionDuration.medium3;
          case 'exit': return M3MotionDuration.medium1;
          default: return M3MotionDuration.medium2;
        }
        
      case 'bottomsheet':
        switch (animationType.toLowerCase()) {
          case 'enter': return M3MotionDuration.long1;
          case 'exit': return M3MotionDuration.medium2;
          case 'drag': return M3MotionDuration.short1;
          default: return M3MotionDuration.long2;
        }
        
      case 'navigation':
        switch (animationType.toLowerCase()) {
          case 'page': return M3MotionDuration.medium4;
          case 'tab': return M3MotionDuration.medium1;
          case 'drawer': return M3MotionDuration.long1;
          default: return M3MotionDuration.medium2;
        }
        
      default:
        return M3MotionDuration.medium1;
    }
  }
  
  /// Gets duration based on travel distance (for spatial animations).
  static Duration durationForDistance(double distance) {
    if (distance < 100) return M3MotionDuration.short2;
    if (distance < 300) return M3MotionDuration.medium1;
    if (distance < 500) return M3MotionDuration.medium3;
    return M3MotionDuration.long2;
  }
  
  /// Gets duration based on complexity (number of animated elements).
  static Duration durationForComplexity(int elementCount) {
    if (elementCount <= 1) return M3MotionDuration.short4;
    if (elementCount <= 3) return M3MotionDuration.medium2;
    if (elementCount <= 5) return M3MotionDuration.medium4;
    return M3MotionDuration.long2;
  }
  
  // --- Context-Aware Easing Selection ---
  
  /// Gets the appropriate easing curve for entering elements.
  static Curve easingForEntering(String elementType) {
    switch (elementType.toLowerCase()) {
      case 'dialog':
      case 'bottomsheet':
        return M3MotionEasing.emphasizedDecelerate;
      case 'button':
      case 'card':
        return M3MotionEasing.standardDecelerate;
      case 'page':
        return M3MotionEasing.standard;
      default:
        return M3MotionEasing.standardDecelerate;
    }
  }
  
  /// Gets the appropriate easing curve for exiting elements.
  static Curve easingForExiting(String elementType) {
    switch (elementType.toLowerCase()) {
      case 'dialog':
      case 'bottomsheet':
        return M3MotionEasing.standardAccelerate;
      case 'button':
      case 'card':
        return M3MotionEasing.standard;
      case 'page':
        return M3MotionEasing.standardAccelerate;
      default:
        return M3MotionEasing.standardAccelerate;
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
      duration: duration ?? M3MotionDuration.medium1,
      curve: curve ?? M3MotionEasing.linear,
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
      tween: Tween(begin: offset, end: 0.0),
      duration: duration ?? M3MotionDuration.medium2,
      curve: curve ?? M3MotionEasing.standardDecelerate,
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
      duration: duration ?? M3MotionDuration.medium2,
      curve: curve ?? M3MotionEasing.emphasizedDecelerate,
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
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration ?? M3MotionDuration.medium3,
      curve: curve ?? M3MotionEasing.emphasizedDecelerate,
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
          duration: duration ?? M3MotionDuration.short4,
          curve: curve ?? M3MotionEasing.standard,
          decoration: BoxDecoration(
            boxShadow: M3Shadow.fromElevation(restingElevation),
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
  static Duration adaptiveDuration(BuildContext context, Duration normalDuration) {
    if (shouldReduceAnimations(context)) {
      return Duration(milliseconds: (normalDuration.inMilliseconds * 0.3).round());
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
}