// The test code constructs various widgets dynamically for comparison,
// so constant constructors cannot always be preferred here.
// ignore_for_file: prefer_const_constructors
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
            body: M3Padding(
              padding: M3EdgeInsets.all(M3Spacings.s16),
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
            body: M3Padding(
              padding: M3EdgeInsets.only(
                left: M3Spacings.s8,
                top: M3Spacings.s12,
                right: M3Spacings.s16,
                bottom: M3Spacings.s20,
              ),
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
            body: M3Padding(
              padding: M3EdgeInsets.symmetric(
                horizontal: M3Spacings.s24,
                vertical: M3Spacings.s16,
              ),
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
            body: M3Padding(
              padding: M3EdgeInsets.fromLTRB(
                M3Spacings.s8,
                M3Spacings.s16,
                M3Spacings.s24,
                M3Spacings.s32,
              ),
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
            body: M3Padding(
              padding: M3EdgeInsets.only(left: M3Spacings.s16),
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

    testWidgets('uses default none when not specified in symmetric', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding(
              padding: M3EdgeInsets.symmetric(
                horizontal: M3Spacings.s24,
              ),
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
      final padding = M3Padding(
        padding: M3EdgeInsets.all(M3Spacings.s16),
        child: testChild,
      );
      expect(padding, isA<Padding>());
    });

    testWidgets('preserves child widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: M3Padding(
              padding: M3EdgeInsets.all(M3Spacings.s16),
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
            body: M3Padding(
              padding: M3EdgeInsets.all(M3Spacings.none),
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
            body: M3Padding(
              padding: M3EdgeInsets.all(M3Spacings.s128),
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
            body: M3Padding(
              padding: M3EdgeInsets.only(
                left: M3Spacings.s8,
                bottom: M3Spacings.s24,
              ),
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

    testWidgets('integrates correctly with spacing token hierarchy', (
      tester,
    ) async {
      final spacings = [
        M3Spacings.none,
        M3Spacings.s4,
        M3Spacings.s8,
        M3Spacings.s16,
        M3Spacings.s32,
        M3Spacings.s64,
      ];

      for (final spacing in spacings) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: M3Padding(
                padding: M3EdgeInsets.all(spacing),
                child: testChild,
              ),
            ),
          ),
        );

        final padding = tester.widget<M3Padding>(find.byType(M3Padding));
        expect(padding.padding, equals(EdgeInsets.all(spacing)));
      }
    });
  });
}
