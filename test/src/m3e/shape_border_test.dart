// The expressive module is @experimental by design; testing it opts in.
// ignore_for_file: experimental_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  const rect = Rect.fromLTWH(0, 0, 100, 100);

  group('M3EShapeBorder fits the polygon to the rect', () {
    // `Path.getBounds()` is conservative: for cubic segments it includes the
    // control points, which sit outside the curve they describe. A shape fitted
    // exactly therefore measures a little larger than its rect — how much
    // depends on how deeply the shape curves — so these assertions use a
    // relative tolerance rather than sub-pixel equality. The exact behaviour is
    // pinned by the scaling test below instead.
    void expectFits(Rect measured, Rect target) {
      final tolerance = target.shortestSide * 0.1;
      expect(measured.center.dx, closeTo(target.center.dx, tolerance));
      expect(measured.center.dy, closeTo(target.center.dy, tolerance));
      expect(measured.width, closeTo(target.width, tolerance));
      expect(measured.height, closeTo(target.height, tolerance));
    }

    test('the outer path fills the given rect', () {
      for (final shape in [
        M3EShapes.circle,
        M3EShapes.cookie7Sided,
        M3EShapes.heart,
        M3EShapes.pill,
      ]) {
        expectFits(
          M3EShapeBorder(shape).getOuterPath(rect).getBounds(),
          rect,
        );
      }
    });

    test('the fit scales exactly with the rect', () {
      // Conservative bounds cancel out under a ratio, so this pins the fitting
      // maths precisely: double the rect, double the shape.
      for (final shape in [M3EShapes.circle, M3EShapes.heart]) {
        final border = M3EShapeBorder(shape);
        final small = border.getOuterPath(rect).getBounds();
        final large = border
            .getOuterPath(const Rect.fromLTWH(0, 0, 200, 200))
            .getBounds();

        expect(large.width / small.width, closeTo(2, 1e-4));
        expect(large.height / small.height, closeTo(2, 1e-4));
      }
    });

    test('the fit follows the rect origin exactly', () {
      final border = M3EShapeBorder(M3EShapes.circle);
      final atOrigin = border.getOuterPath(rect).getBounds();
      final offset =
          border.getOuterPath(rect.shift(const Offset(37, 11))).getBounds();

      expect(offset.left - atOrigin.left, closeTo(37, 1e-4));
      expect(offset.top - atOrigin.top, closeTo(11, 1e-4));
    });

    test('a non-square rect stretches the shape to match', () {
      const wide = Rect.fromLTWH(10, 20, 300, 50);
      final bounds =
          M3EShapeBorder(M3EShapes.circle).getOuterPath(wide).getBounds();

      // Anisotropic: the shape is squashed to the box, not fitted uniformly.
      expect(bounds.width / bounds.height, closeTo(300 / 50, 0.5));
      expectFits(bounds, wide);
    });

    test('the inner path is inset by the side width', () {
      final border = M3EShapeBorder(
        M3EShapes.circle,
        side: const BorderSide(width: 8),
      );

      final outer = border.getOuterPath(rect).getBounds();
      final inner = border.getInnerPath(rect).getBounds();

      expect(inner.width, lessThan(outer.width));
    });
  });

  group('morphing through lerp', () {
    final from = M3EShapeBorder(M3EShapes.circle);
    final to = M3EShapeBorder(M3EShapes.burst);

    test('endpoints settle to plain, non-morphing borders', () {
      expect((from.lerpTo(to, 0)! as M3EShapeBorder).isMorphing, isFalse);
      expect((from.lerpTo(to, 1)! as M3EShapeBorder).isMorphing, isFalse);
      expect(from.lerpTo(to, 1), to);
    });

    test('a midpoint really morphs rather than crossfading', () {
      final mid = from.lerpTo(to, 0.5)! as M3EShapeBorder;

      expect(mid.isMorphing, isTrue);
      expect(mid, isNot(from));
      expect(mid, isNot(to));
    });

    test('lerpFrom is the mirror of lerpTo', () {
      expect(to.lerpFrom(from, 0.5), from.lerpTo(to, 0.5));
    });

    test('the fitted size stays stable across the whole morph', () {
      // Regression guard: fitting each frame to its own bounds would make the
      // shape breathe as it morphed. The union of the endpoints is used
      // instead, so every frame maps onto the same rect.
      for (var t = 0.0; t <= 1.0; t += 0.1) {
        final bounds = (from.lerpTo(to, t)! as M3EShapeBorder)
            .getOuterPath(rect)
            .getBounds();

        expect(bounds.width, closeTo(rect.width, 5), reason: 't=$t');
        expect(bounds.height, closeTo(rect.height, 5), reason: 't=$t');
      }
    });

    test('lerping to a non-M3E shape falls back instead of throwing', () {
      const other = RoundedRectangleBorder();
      expect(() => from.lerpTo(other, 0.5), returnsNormally);
    });
  });

  group('value semantics', () {
    test('equal shapes compare equal', () {
      expect(
        M3EShapeBorder(M3EShapes.circle),
        M3EShapeBorder(M3EShapes.circle),
      );
      expect(
        M3EShapeBorder(M3EShapes.circle).hashCode,
        M3EShapeBorder(M3EShapes.circle).hashCode,
      );
    });

    test('different shapes and sides compare unequal', () {
      expect(
        M3EShapeBorder(M3EShapes.circle),
        isNot(M3EShapeBorder(M3EShapes.square)),
      );
      expect(
        M3EShapeBorder(M3EShapes.circle),
        isNot(
          M3EShapeBorder(
            M3EShapes.circle,
            side: const BorderSide(width: 2),
          ),
        ),
      );
    });

    test('copyWith replaces only the side', () {
      final border = M3EShapeBorder(M3EShapes.pill);
      final copy = border.copyWith(side: const BorderSide(width: 3));

      expect(copy.polygon, border.polygon);
      expect(copy.side.width, 3);
    });
  });

  group('widget integration', () {
    testWidgets('drives a Material shape without a CustomPainter',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Material(
                shape: M3EShapeBorder(M3EShapes.clover4Leaf),
                clipBehavior: Clip.antiAlias,
                color: Colors.blue,
                child: const SizedBox.expand(),
              ),
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      expect(find.byType(Material), findsWidgets);
    });

    testWidgets('M3EShapeMorph animates between shapes', (tester) async {
      Widget build(M3ERoundedPolygon shape) => MaterialApp(
            home: Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: M3EShapeMorph(
                  shape: shape,
                  color: Colors.red,
                  duration: const Duration(milliseconds: 300),
                ),
              ),
            ),
          );

      await tester.pumpWidget(build(M3EShapes.circle));
      await tester.pumpWidget(build(M3EShapes.sunny));
      await tester.pump(const Duration(milliseconds: 150));

      final decoration = tester
          .widget<AnimatedContainer>(find.byType(AnimatedContainer))
          .decoration;
      expect(decoration, isA<ShapeDecoration>());

      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  });
}
