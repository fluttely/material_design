/// Material 3 Ripple Painter for state layer effects.
///
/// Reference: https://m3.material.io/foundations/interaction/states
library;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

/// A custom painter for Material 3 ripple effects.
/// 
/// Creates ripple animations that follow M3 specifications for
/// state layers and interaction feedback.
class M3RipplePainter extends CustomPainter {
  const M3RipplePainter({
    required this.animation,
    required this.color,
    this.center,
    this.radius,
    this.clipBehavior = Clip.hardEdge,
  });

  /// Animation controller for the ripple effect.
  final Animation<double> animation;

  /// Color of the ripple effect.
  final Color color;

  /// Center point of the ripple. If null, uses the center of the widget.
  final Offset? center;

  /// Maximum radius of the ripple. If null, calculated from widget bounds.
  final double? radius;

  /// How to clip the ripple effect.
  final Clip clipBehavior;

  @override
  void paint(Canvas canvas, Size size) {
    if (animation.value == 0.0) return;

    final Paint paint = Paint()
      ..color = color.withValues(
        alpha: (color.a * (1.0 - animation.value)).clamp(0.0, 1.0),
      )
      ..style = PaintingStyle.fill;

    final Offset rippleCenter = center ?? Offset(size.width / 2, size.height / 2);
    final double maxRadius = radius ?? _getMaxRadius(size, rippleCenter);
    final double currentRadius = maxRadius * animation.value;

    // Apply clipping if needed
    if (clipBehavior != Clip.none) {
      final RRect clipRRect = RRect.fromRectAndRadius(
        Offset.zero & size,
        const Radius.circular(0),
      );
      canvas.clipRRect(clipRRect);
    }

    // Draw the ripple circle
    canvas.drawCircle(rippleCenter, currentRadius, paint);
  }

  /// Calculates the maximum radius for the ripple effect.
  double _getMaxRadius(Size size, Offset center) {
    final double dx = math.max(center.dx, size.width - center.dx);
    final double dy = math.max(center.dy, size.height - center.dy);
    return math.sqrt(dx * dx + dy * dy);
  }

  @override
  bool shouldRepaint(M3RipplePainter oldDelegate) {
    return animation != oldDelegate.animation ||
        color != oldDelegate.color ||
        center != oldDelegate.center ||
        radius != oldDelegate.radius ||
        clipBehavior != oldDelegate.clipBehavior;
  }
}

/// A widget that creates M3 ripple effects on tap.
class M3RippleEffect extends StatefulWidget {
  const M3RippleEffect({
    super.key,
    required this.child,
    this.color,
    this.duration = const Duration(milliseconds: 300),
    this.onTap,
    this.clipBehavior = Clip.hardEdge,
    this.borderRadius,
  });

  /// The child widget.
  final Widget child;

  /// Color of the ripple effect. If null, uses the theme's primary color.
  final Color? color;

  /// Duration of the ripple animation.
  final Duration duration;

  /// Callback when the widget is tapped.
  final VoidCallback? onTap;

  /// How to clip the ripple effect.
  final Clip clipBehavior;

  /// Border radius for clipping the ripple.
  final BorderRadius? borderRadius;

  @override
  State<M3RippleEffect> createState() => _M3RippleEffectState();
}

class _M3RippleEffectState extends State<M3RippleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Offset? _tapPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _tapPosition = details.localPosition;
    });
    _controller.forward(from: 0.0);
  }

  void _handleTap() {
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final rippleColor = widget.color ?? 
        Theme.of(context).colorScheme.primary.withValues(alpha: 0.12);

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTap: _handleTap,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        clipBehavior: widget.clipBehavior,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: M3RipplePainter(
                animation: _animation,
                color: rippleColor,
                center: _tapPosition,
                clipBehavior: widget.clipBehavior,
              ),
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}

/// State layer colors and opacities for different interaction states.
abstract class M3StateLayer {
  /// Hover state layer opacity.
  static const double hover = 0.08;

  /// Focus state layer opacity.
  static const double focus = 0.12;

  /// Press state layer opacity.
  static const double press = 0.12;

  /// Drag state layer opacity.
  static const double drag = 0.16;

  /// Creates a state layer color with the specified opacity.
  static Color createStateLayer(Color baseColor, double opacity) {
    return baseColor.withValues(alpha: opacity);
  }

  /// Gets the appropriate state layer opacity for a given state.
  static double getOpacityForState(MaterialState state) {
    switch (state) {
      case MaterialState.hovered:
        return hover;
      case MaterialState.focused:
        return focus;
      case MaterialState.pressed:
        return press;
      case MaterialState.dragged:
        return drag;
      default:
        return 0.0;
    }
  }
}