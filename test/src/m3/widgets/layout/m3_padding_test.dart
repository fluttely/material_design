import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3Padding', () {
    const testChild = Text('Test Child');

    testWidgets('creates uniform padding correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.all(
              M3SpacingToken.space16,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<M3Padding>(find.byType(M3Padding));
      expect(padding.padding, equals(const EdgeInsets.all(16)));
    });

    testWidgets('creates directional padding correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.only(
              left: M3SpacingToken.space8,
              top: M3SpacingToken.space12,
              right: M3SpacingToken.space16,
              bottom: M3SpacingToken.space20,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<M3Padding>(find.byType(M3Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.fromLTRB(8, 12, 16, 20)),
      );
    });

    testWidgets('creates symmetric padding correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.symmetric(
              horizontal: M3SpacingToken.space24,
              vertical: M3SpacingToken.space16,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<M3Padding>(find.byType(M3Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
      );
    });

    testWidgets('creates fromLTRB padding correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.fromLTRB(
              M3SpacingToken.space8,
              M3SpacingToken.space16,
              M3SpacingToken.space24,
              M3SpacingToken.space32,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<M3Padding>(find.byType(M3Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.fromLTRB(8, 16, 24, 32)),
      );
    });

    testWidgets('uses default none when not specified in only', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.only(
              left: M3SpacingToken.space16,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<M3Padding>(find.byType(M3Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.only(left: 16)),
      );
    });

    testWidgets('uses default none when not specified in symmetric',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.symmetric(
              horizontal: M3SpacingToken.space24,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<M3Padding>(find.byType(M3Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.symmetric(horizontal: 24)),
      );
    });

    test('extends Padding class', () {
      final padding = M3Padding.all(M3SpacingToken.space16, child: testChild);
      expect(padding, isA<Padding>());
    });

    testWidgets('preserves child widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.all(
              M3SpacingToken.space16,
              child: testChild,
            ),
          ),
        ),
      );

      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('works with zero spacing', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.all(
              M3SpacingToken.none,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<M3Padding>(find.byType(M3Padding));
      expect(padding.padding, equals(EdgeInsets.zero));
    });

    testWidgets('works with large spacing values', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.all(
              M3SpacingToken.space128,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<M3Padding>(find.byType(M3Padding));
      expect(padding.padding, equals(const EdgeInsets.all(128)));
    });

    testWidgets('supports asymmetric padding with only', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding.only(
              left: M3SpacingToken.space8,
              bottom: M3SpacingToken.space24,
              child: testChild,
            ),
          ),
        ),
      );

      final padding = tester.widget<M3Padding>(find.byType(M3Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.only(left: 8, bottom: 24)),
      );
    });

    testWidgets('integrates correctly with spacing token hierarchy',
        (tester) async {
      final spacings = [
        M3SpacingToken.none,
        M3SpacingToken.space4,
        M3SpacingToken.space8,
        M3SpacingToken.space16,
        M3SpacingToken.space32,
        M3SpacingToken.space64,
      ];

      for (final spacing in spacings) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: M3Padding.all(
                spacing,
                child: testChild,
              ),
            ),
          ),
        );

        final padding = tester.widget<M3Padding>(find.byType(M3Padding));
        expect(padding.padding, equals(EdgeInsets.all(spacing.value)));
      }
    });
  });
}
