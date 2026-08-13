import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(
        home: Scaffold(body: Center(child: child)),
      );

  group('M3FocusRing', () {
    testWidgets('does not move its child when focus arrives', (tester) async {
      final node = FocusNode();
      addTearDown(node.dispose);

      await tester.pumpWidget(
        wrap(
          M3FocusRing(
            child: SizedBox(
              key: const Key('target'),
              width: 100,
              height: 40,
              child: Focus(focusNode: node, child: const SizedBox()),
            ),
          ),
        ),
      );

      final before = tester.getRect(find.byKey(const Key('target')));

      node.requestFocus();
      await tester.pumpAndSettle();

      final after = tester.getRect(find.byKey(const Key('target')));

      // The whole point of reserving the ring inset up front: tabbing to a
      // control must not shift it under the user's eye.
      expect(after, before);
    });

    testWidgets('reserves offset + thickness on every side', (tester) async {
      await tester.pumpWidget(
        wrap(
          const M3FocusRing(
            child: SizedBox(width: 100, height: 40),
          ),
        ),
      );

      final ring = tester.getRect(find.byType(M3FocusRing));
      final child = tester.getRect(find.byType(SizedBox).last);
      const inset = M3FocusIndicator.offset + M3FocusIndicator.thickness;

      expect(child.left - ring.left, inset);
      expect(ring.right - child.right, inset);
      expect(child.top - ring.top, inset);
      expect(ring.bottom - child.bottom, inset);
    });

    testWidgets('paints nothing while unfocused', (tester) async {
      await tester.pumpWidget(
        wrap(const M3FocusRing(child: SizedBox(width: 100, height: 40))),
      );

      final paint = tester.widget<CustomPaint>(
        find.descendant(
          of: find.byType(M3FocusRing),
          matching: find.byType(CustomPaint),
        ),
      );
      expect(paint.foregroundPainter, isNull);
    });

    testWidgets('paints a ring once focused', (tester) async {
      final node = FocusNode();
      addTearDown(node.dispose);

      await tester.pumpWidget(
        wrap(
          M3FocusRing(
            child: SizedBox(
              width: 100,
              height: 40,
              child: Focus(focusNode: node, child: const SizedBox()),
            ),
          ),
        ),
      );

      node.requestFocus();
      await tester.pumpAndSettle();

      final paint = tester.widget<CustomPaint>(
        find.descendant(
          of: find.byType(M3FocusRing),
          matching: find.byType(CustomPaint),
        ),
      );
      expect(paint.foregroundPainter, isNotNull);
    });

    testWidgets('never becomes a tab stop of its own', (tester) async {
      await tester.pumpWidget(
        wrap(const M3FocusRing(child: SizedBox(width: 100, height: 40))),
      );

      final focus = tester.widget<Focus>(
        find.descendant(
          of: find.byType(M3FocusRing),
          matching: find.byType(Focus),
        ),
      );
      expect(focus.canRequestFocus, isFalse);
      expect(focus.skipTraversal, isTrue);
    });

    testWidgets('does not dispose a caller-owned focus node', (tester) async {
      final node = FocusNode();
      addTearDown(node.dispose);

      await tester.pumpWidget(
        wrap(
          M3FocusRing(
            focusNode: node,
            child: const SizedBox(width: 100, height: 40),
          ),
        ),
      );
      await tester.pumpWidget(wrap(const SizedBox()));

      // Touching a disposed FocusNode throws; the caller still owns this one.
      expect(node.requestFocus, returnsNormally);
    });
  });
}
