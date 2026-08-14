// The expressive module is @experimental by design; testing it opts in.
// ignore_for_file: experimental_member_use

import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3EPoint.angleDegrees', () {
    // Regression: this shipped as `angleRadians * pi / 180` — the
    // degrees-to-radians factor applied to a value already in radians, so a
    // getter named `angleDegrees` returned neither degrees nor radians.
    test('converts radians to degrees, not the other way round', () {
      expect(const M3EPoint(1, 0).angleDegrees, closeTo(0, 1e-9));
      expect(const M3EPoint(0, 1).angleDegrees, closeTo(90, 1e-9));
      expect(const M3EPoint(-1, 0).angleDegrees, closeTo(180, 1e-9));
      expect(const M3EPoint(0, -1).angleDegrees, closeTo(-90, 1e-9));
      expect(const M3EPoint(1, 1).angleDegrees, closeTo(45, 1e-9));
    });

    test('agrees with angleRadians', () {
      for (final point in const [
        M3EPoint(3, 4),
        M3EPoint(-2, 5),
        M3EPoint(-7, -1),
        M3EPoint(0.5, -0.25),
      ]) {
        expect(
          point.angleDegrees,
          closeTo(point.angleRadians * 180 / math.pi, 1e-12),
          reason: '$point',
        );
      }
    });

    test('a quarter turn is 90 degrees', () {
      const point = M3EPoint(2, 0);
      expect(
        point.rotate90().angleDegrees - point.angleDegrees,
        closeTo(90, 1e-9),
      );
    });
  });
}
