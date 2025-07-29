import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3Gap', () {
    testWidgets('creates SizedBox with correct spacing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text('Top'),
                M3Gap(M3SpacingToken.space16),
                Text('Bottom'),
              ],
            ),
          ),
        ),
      );

      final gap = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(M3Gap),
          matching: find.byType(SizedBox),
        ),
      );

      expect(gap.height, equals(16));
      expect(gap.width, isNull);
    });

    testWidgets('works in horizontal layout', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                Text('Left'),
                M3Gap(M3SpacingToken.space24, orientation: Axis.horizontal),
                Text('Right'),
              ],
            ),
          ),
        ),
      );

      final gap = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(M3Gap),
          matching: find.byType(SizedBox),
        ),
      );

      expect(gap.width, equals(24));
      expect(gap.height, isNull);
    });

    testWidgets('accepts different spacing tokens', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                M3Gap(M3SpacingToken.space8),
                M3Gap(M3SpacingToken.space32),
                M3Gap(M3SpacingToken.space64),
              ],
            ),
          ),
        ),
      );

      final gaps = tester.widgetList<SizedBox>(
        find.descendant(
          of: find.byType(M3Gap),
          matching: find.byType(SizedBox),
        ),
      );

      expect(gaps.elementAt(0).height, equals(8));
      expect(gaps.elementAt(1).height, equals(32));
      expect(gaps.elementAt(2).height, equals(64));
    });

    testWidgets('works with margin tokens', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text('Top'),
                M3Gap(M3MarginToken.compactScreen),
                Text('Bottom'),
              ],
            ),
          ),
        ),
      );

      final gap = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(M3Gap),
          matching: find.byType(SizedBox),
        ),
      );

      expect(gap.height, equals(16));
    });

    testWidgets('works with spacer tokens', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text('Top'),
                M3Gap(M3SpacerToken.pane),
                Text('Bottom'),
              ],
            ),
          ),
        ),
      );

      final gap = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(M3Gap),
          matching: find.byType(SizedBox),
        ),
      );

      expect(gap.height, equals(24));
    });

    testWidgets('handles zero spacing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text('Top'),
                M3Gap(M3SpacingToken.none),
                Text('Bottom'),
              ],
            ),
          ),
        ),
      );

      final gap = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(M3Gap),
          matching: find.byType(SizedBox),
        ),
      );

      expect(gap.height, equals(0));
      expect(gap.width, isNull);
    });

    test('supports infinity spacing token', () {
      const gap = M3Gap(M3SpacingToken.infinity);
      expect(gap.spacing.value, equals(double.infinity));
    });

    test('is a StatelessWidget', () {
      const gap = M3Gap(M3SpacingToken.space16);
      expect(gap, isA<StatelessWidget>());
    });

    test('uses correct spacing value from token', () {
      const gap = M3Gap(M3SpacingToken.space32);
      expect(gap.spacing.value, equals(32));
    });
  });
}
