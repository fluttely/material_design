/// Material 3 Elevation Painter for shadow and surface tint effects.
///
/// Reference: https://m3.material.io/styles/elevation/overview
library;

import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A custom painter for Material 3 elevation effects.
/// 
/// Creates elevation through surface tinting and shadow effects
/// that follow M3 specifications.
class M3ElevationPainter extends CustomPainter {
  const M3ElevationPainter({
    required this.elevation,
    required this.surfaceColor,
    required this.surfaceTint,
    this.shadowColor,
    this.shape,
  });

  /// The elevation level (0-24).
  final double elevation;

  /// Base surface color.
  final Color surfaceColor;

  /// Surface tint color (usually primary color).
  final Color surfaceTint;

  /// Shadow color. If null, uses a dark shadow.
  final Color? shadowColor;

  /// Shape of the surface.
  final ShapeBorder? shape;

  @override
  void paint(Canvas canvas, Size size) {
    if (elevation <= 0) return;

    final rect = Offset.zero & size;
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Calculate surface tint opacity based on elevation
    final tintOpacity = _getSurfaceTintOpacity(elevation);
    final tintedColor = Color.alphaBlend(
      surfaceTint.withValues(alpha: tintOpacity),
      surfaceColor,
    );

    // Draw shadow if elevation > 0
    if (elevation > 0) {
      _drawShadow(canvas, rect, elevation);
    }

    // Draw the tinted surface
    paint.color = tintedColor;
    if (shape != null) {
      final path = shape!.getOuterPath(rect);
      canvas.drawPath(path, paint);
    } else {
      canvas.drawRect(rect, paint);
    }
  }

  /// Draws shadow based on Material 3 elevation specifications.
  void _drawShadow(Canvas canvas, Rect rect, double elevation) {
    final shadowColor = this.shadowColor ?? 
        const Color(0xFF000000).withValues(alpha: 0.2);

    // Key shadow
    final keyBlur = _getKeyBlur(elevation);
    final keyOffset = _getKeyOffset(elevation);
    
    final keyPaint = Paint()
      ..color = shadowColor.withValues(alpha: shadowColor.a * 0.15)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, keyBlur);

    // Ambient shadow
    final ambientBlur = _getAmbientBlur(elevation);
    
    final ambientPaint = Paint()
      ..color = shadowColor.withValues(alpha: shadowColor.a * 0.3)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, ambientBlur);

    // Draw ambient shadow
    if (shape != null) {
      final path = shape!.getOuterPath(rect);
      canvas.drawPath(path, ambientPaint);
      // Draw key shadow with offset
      canvas.save();
      canvas.translate(keyOffset.dx, keyOffset.dy);
      canvas.drawPath(path, keyPaint);
      canvas.restore();
    } else {
      canvas.drawRect(rect, ambientPaint);
      // Draw key shadow with offset
      canvas.drawRect(rect.shift(keyOffset), keyPaint);
    }
  }

  /// Gets surface tint opacity based on elevation level.
  double _getSurfaceTintOpacity(double elevation) {
    if (elevation <= 0) return 0.0;
    if (elevation <= 1) return 0.05;
    if (elevation <= 3) return 0.08;
    if (elevation <= 6) return 0.11;
    if (elevation <= 8) return 0.12;
    return 0.14;
  }

  /// Gets key shadow blur radius based on elevation.
  double _getKeyBlur(double elevation) {
    return math.max(1.0, elevation * 0.5);
  }

  /// Gets ambient shadow blur radius based on elevation.
  double _getAmbientBlur(double elevation) {
    return math.max(1.0, elevation * 0.75);
  }

  /// Gets key shadow offset based on elevation.
  Offset _getKeyOffset(double elevation) {
    final dy = math.max(1.0, elevation * 0.5);
    return Offset(0, dy);
  }

  @override
  bool shouldRepaint(M3ElevationPainter oldDelegate) {
    return elevation != oldDelegate.elevation ||
        surfaceColor != oldDelegate.surfaceColor ||
        surfaceTint != oldDelegate.surfaceTint ||
        shadowColor != oldDelegate.shadowColor ||
        shape != oldDelegate.shape;
  }
}

/// A widget that applies Material 3 elevation effects.
class M3ElevationEffect extends StatelessWidget {
  const M3ElevationEffect({
    super.key,
    required this.child,
    required this.elevation,
    this.surfaceColor,
    this.surfaceTint,
    this.shadowColor,
    this.shape,
  });

  /// The child widget.
  final Widget child;

  /// The elevation level.
  final double elevation;

  /// Surface color. If null, uses theme surface color.
  final Color? surfaceColor;

  /// Surface tint color. If null, uses theme primary color.
  final Color? surfaceTint;

  /// Shadow color. If null, uses a default dark shadow.
  final Color? shadowColor;

  /// Shape of the surface.
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveSurfaceColor = surfaceColor ?? colorScheme.surface;
    final effectiveSurfaceTint = surfaceTint ?? colorScheme.primary;

    return CustomPaint(
      painter: M3ElevationPainter(
        elevation: elevation,
        surfaceColor: effectiveSurfaceColor,
        surfaceTint: effectiveSurfaceTint,
        shadowColor: shadowColor,
        shape: shape,
      ),
      child: child,
    );
  }
}

/// Utility functions for working with Material 3 elevation effects.
abstract class M3ElevationEffectUtils {
  /// Calculates the surface tint color for a given elevation.
  static Color getSurfaceTintColor(
    Color baseColor,
    Color tintColor,
    double elevation,
  ) {
    final opacity = _getSurfaceTintOpacity(elevation);
    return Color.alphaBlend(
      tintColor.withValues(alpha: opacity),
      baseColor,
    );
  }

  /// Gets surface tint opacity based on elevation level.
  static double _getSurfaceTintOpacity(double elevation) {
    if (elevation <= 0) return 0.0;
    if (elevation <= 1) return 0.05;
    if (elevation <= 3) return 0.08;
    if (elevation <= 6) return 0.11;
    if (elevation <= 8) return 0.12;
    return 0.14;
  }

  /// Creates a Material 3 compliant box shadow for the given elevation.
  static List<BoxShadow> createElevationShadow(
    double elevation, {
    Color? shadowColor,
  }) {
    if (elevation <= 0) return [];

    final color = shadowColor ?? 
        const Color(0xFF000000).withValues(alpha: 0.2);

    // Key shadow
    final keyBlur = math.max(1.0, elevation * 0.5);
    final keyOffset = Offset(0, math.max(1.0, elevation * 0.5));
    
    // Ambient shadow
    final ambientBlur = math.max(1.0, elevation * 0.75);

    return [
      // Ambient shadow
      BoxShadow(
        color: color.withValues(alpha: color.a * 0.3),
        blurRadius: ambientBlur,
        offset: Offset.zero,
      ),
      // Key shadow
      BoxShadow(
        color: color.withValues(alpha: color.a * 0.15),
        blurRadius: keyBlur,
        offset: keyOffset,
      ),
    ];
  }

  /// Validates that an elevation value is within the valid range.
  static bool isValidElevation(double elevation) {
    return elevation >= 0 && elevation <= 24;
  }

  /// Clamps an elevation value to the valid range.
  static double clampElevation(double elevation) {
    return elevation.clamp(0.0, 24.0);
  }
}