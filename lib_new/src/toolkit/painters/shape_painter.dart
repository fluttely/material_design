/// Material 3 Shape Painter for custom shape effects.
///
/// Reference: https://m3.material.io/styles/shape/shape-scale-tokens
library;

import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A custom painter for Material 3 shape effects.
/// 
/// Creates custom shapes that follow M3 specifications for
/// rounded corners, cut corners, and mixed corner styles.
class M3ShapePainter extends CustomPainter {
  const M3ShapePainter({
    required this.shape,
    required this.color,
    this.strokeColor,
    this.strokeWidth,
  });

  /// The shape to paint.
  final ShapeBorder shape;

  /// Fill color of the shape.
  final Color color;

  /// Stroke color. If null, no stroke is painted.
  final Color? strokeColor;

  /// Stroke width. Only used if strokeColor is provided.
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final path = shape.getOuterPath(rect);

    // Fill the shape
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // Stroke the shape if specified
    if (strokeColor != null && strokeWidth != null && strokeWidth! > 0) {
      final strokePaint = Paint()
        ..color = strokeColor!
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth!;
      canvas.drawPath(path, strokePaint);
    }
  }

  @override
  bool shouldRepaint(M3ShapePainter oldDelegate) {
    return shape != oldDelegate.shape ||
        color != oldDelegate.color ||
        strokeColor != oldDelegate.strokeColor ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}

/// Custom shape border that supports M3 corner styles.
class M3ShapeBorder extends ShapeBorder {
  const M3ShapeBorder({
    this.topLeft = 0.0,
    this.topRight = 0.0,
    this.bottomLeft = 0.0,
    this.bottomRight = 0.0,
    this.cornerStyle = M3CornerStyle.rounded,
  });

  /// Top-left corner radius.
  final double topLeft;

  /// Top-right corner radius.
  final double topRight;

  /// Bottom-left corner radius.
  final double bottomLeft;

  /// Bottom-right corner radius.
  final double bottomRight;

  /// Style of the corners.
  final M3CornerStyle cornerStyle;

  /// Creates a shape with all corners having the same radius.
  const M3ShapeBorder.all(
    double radius, {
    M3CornerStyle cornerStyle = M3CornerStyle.rounded,
  }) : this(
         topLeft: radius,
         topRight: radius,
         bottomLeft: radius,
         bottomRight: radius,
         cornerStyle: cornerStyle,
       );

  /// Creates a circular shape.
  const M3ShapeBorder.circle()
      : this.all(1000.0); // Large radius for circular effect

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    switch (cornerStyle) {
      case M3CornerStyle.rounded:
        return _getRoundedPath(rect);
      case M3CornerStyle.cut:
        return _getCutPath(rect);
      case M3CornerStyle.mixed:
        return _getMixedPath(rect);
    }
  }

  /// Creates a path with rounded corners.
  Path _getRoundedPath(Rect rect) {
    return Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          rect,
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      );
  }

  /// Creates a path with cut corners.
  Path _getCutPath(Rect rect) {
    final path = Path();
    final left = rect.left;
    final top = rect.top;
    final right = rect.right;
    final bottom = rect.bottom;

    // Start from top-left, accounting for cut corner
    path.moveTo(left + topLeft, top);
    
    // Top edge to top-right corner
    path.lineTo(right - topRight, top);
    
    // Top-right cut corner
    if (topRight > 0) {
      path.lineTo(right, top + topRight);
    } else {
      path.lineTo(right, top);
    }
    
    // Right edge to bottom-right corner
    path.lineTo(right, bottom - bottomRight);
    
    // Bottom-right cut corner
    if (bottomRight > 0) {
      path.lineTo(right - bottomRight, bottom);
    } else {
      path.lineTo(right, bottom);
    }
    
    // Bottom edge to bottom-left corner
    path.lineTo(left + bottomLeft, bottom);
    
    // Bottom-left cut corner
    if (bottomLeft > 0) {
      path.lineTo(left, bottom - bottomLeft);
    } else {
      path.lineTo(left, bottom);
    }
    
    // Left edge back to start
    path.lineTo(left, top + topLeft);
    
    // Close the path
    if (topLeft > 0) {
      path.lineTo(left + topLeft, top);
    } else {
      path.lineTo(left, top);
    }
    
    path.close();
    return path;
  }

  /// Creates a path with mixed corner styles.
  Path _getMixedPath(Rect rect) {
    // For mixed style, alternate between rounded and cut corners
    final path = Path();
    final left = rect.left;
    final top = rect.top;
    final right = rect.right;
    final bottom = rect.bottom;

    // Top-left: rounded
    path.moveTo(left + topLeft, top);
    path.quadraticBezierTo(left, top, left, top + topLeft);
    
    // Left to bottom-left: cut corner
    path.lineTo(left, bottom - bottomLeft);
    if (bottomLeft > 0) {
      path.lineTo(left + bottomLeft, bottom);
    } else {
      path.lineTo(left, bottom);
    }
    
    // Bottom edge to bottom-right: rounded
    path.lineTo(right - bottomRight, bottom);
    path.quadraticBezierTo(right, bottom, right, bottom - bottomRight);
    
    // Right edge to top-right: cut corner
    path.lineTo(right, top + topRight);
    if (topRight > 0) {
      path.lineTo(right - topRight, top);
    } else {
      path.lineTo(right, top);
    }
    
    // Close back to start
    path.lineTo(left + topLeft, top);
    path.close();
    return path;
  }

  @override
  ShapeBorder scale(double t) {
    return M3ShapeBorder(
      topLeft: topLeft * t,
      topRight: topRight * t,
      bottomLeft: bottomLeft * t,
      bottomRight: bottomRight * t,
      cornerStyle: cornerStyle,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // This shape border doesn't paint itself - use M3ShapePainter instead
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is M3ShapeBorder &&
        other.topLeft == topLeft &&
        other.topRight == topRight &&
        other.bottomLeft == bottomLeft &&
        other.bottomRight == bottomRight &&
        other.cornerStyle == cornerStyle;
  }

  @override
  int get hashCode => Object.hash(
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
        cornerStyle,
      );
}

/// Corner styles for M3 shapes.
enum M3CornerStyle {
  /// Rounded corners using circular arcs.
  rounded,

  /// Cut corners using straight lines.
  cut,

  /// Mixed corners combining rounded and cut styles.
  mixed,
}

/// A widget that applies custom M3 shapes.
class M3ShapeEffect extends StatelessWidget {
  const M3ShapeEffect({
    super.key,
    required this.child,
    required this.shape,
    this.color,
    this.strokeColor,
    this.strokeWidth,
  });

  /// The child widget.
  final Widget child;

  /// The shape to apply.
  final M3ShapeBorder shape;

  /// Fill color. If null, no fill is applied.
  final Color? color;

  /// Stroke color. If null, no stroke is applied.
  final Color? strokeColor;

  /// Stroke width.
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    if (color == null && strokeColor == null) {
      // No painting needed, just clip
      return ClipPath(
        clipper: _ShapeClipper(shape),
        child: child,
      );
    }

    return CustomPaint(
      painter: color != null
          ? M3ShapePainter(
              shape: shape,
              color: color!,
              strokeColor: strokeColor,
              strokeWidth: strokeWidth,
            )
          : null,
      foregroundPainter: strokeColor != null && color == null
          ? M3ShapePainter(
              shape: shape,
              color: Colors.transparent,
              strokeColor: strokeColor,
              strokeWidth: strokeWidth,
            )
          : null,
      child: ClipPath(
        clipper: _ShapeClipper(shape),
        child: child,
      ),
    );
  }
}

/// Custom clipper for M3 shapes.
class _ShapeClipper extends CustomClipper<Path> {
  const _ShapeClipper(this.shape);

  final M3ShapeBorder shape;

  @override
  Path getClip(Size size) {
    return shape.getOuterPath(Offset.zero & size);
  }

  @override
  bool shouldReclip(_ShapeClipper oldClipper) {
    return shape != oldClipper.shape;
  }
}