import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3ScreenSize.fromWidth', () {
    test('maps each window size class to its M3 range', () {
      expect(M3ScreenSize.fromWidth(0), M3ScreenSize.compact);
      expect(M3ScreenSize.fromWidth(599), M3ScreenSize.compact);
      expect(M3ScreenSize.fromWidth(600), M3ScreenSize.medium);
      expect(M3ScreenSize.fromWidth(839), M3ScreenSize.medium);
      expect(M3ScreenSize.fromWidth(840), M3ScreenSize.expanded);
      expect(M3ScreenSize.fromWidth(1199), M3ScreenSize.expanded);
      expect(M3ScreenSize.fromWidth(1200), M3ScreenSize.large);
      expect(M3ScreenSize.fromWidth(1599), M3ScreenSize.large);
      expect(M3ScreenSize.fromWidth(1600), M3ScreenSize.extraLarge);
      expect(M3ScreenSize.fromWidth(4000), M3ScreenSize.extraLarge);
    });

    test('each class starts exactly at its own minWidth', () {
      for (final size in M3ScreenSize.values) {
        expect(M3ScreenSize.fromWidth(size.minWidth), size);
      }
    });
  });

  group('M3ScreenSize layout values', () {
    test('columns follow the 4/8/12 M3 grid', () {
      expect(M3ScreenSize.compact.columns, 4);
      expect(M3ScreenSize.medium.columns, 8);
      expect(M3ScreenSize.expanded.columns, 12);
      expect(M3ScreenSize.large.columns, 12);
      expect(M3ScreenSize.extraLarge.columns, 12);
    });

    test('gutters and margins are spacing tokens, not loose doubles', () {
      for (final size in M3ScreenSize.values) {
        expect(size.gutterWidth, isA<M3SpacingValue>());
        expect(size.pageMargin, isA<M3SpacingValue>());
      }
      expect(M3ScreenSize.compact.pageMargin, M3Margins.compactScreen);
      expect(M3ScreenSize.large.pageMargin, M3Margins.largeScreen);
    });

    test('body width is unbounded until the expanded class', () {
      expect(M3ScreenSize.compact.bodyWidth, isNull);
      expect(M3ScreenSize.medium.bodyWidth, isNull);
      expect(M3ScreenSize.expanded.bodyWidth, M3Breakpoints.expanded);
      expect(M3ScreenSize.large.bodyWidth, M3LayoutWidths.body);
    });

    test('max content width never decreases as screens grow', () {
      for (var i = 1; i < M3ScreenSize.values.length; i++) {
        final previous = M3ScreenSize.values[i - 1].maxContentWidth;
        final current = M3ScreenSize.values[i].maxContentWidth;
        if (previous.isFinite) {
          expect(current, greaterThanOrEqualTo(previous));
        }
      }
    });
  });

  group('M3ScreenSize predicates', () {
    test('mobile, tablet and desktop partition the classes', () {
      for (final size in M3ScreenSize.values) {
        final flags = [size.isMobile, size.isTablet, size.isDesktop];
        expect(flags.where((f) => f), hasLength(1), reason: '$size');
      }
    });

    test('isAtLeast and isAtMost follow the scale order', () {
      expect(M3ScreenSize.large.isAtLeast(M3ScreenSize.medium), isTrue);
      expect(M3ScreenSize.medium.isAtLeast(M3ScreenSize.large), isFalse);
      expect(M3ScreenSize.medium.isAtMost(M3ScreenSize.large), isTrue);
      expect(M3ScreenSize.compact.isAtLeast(M3ScreenSize.compact), isTrue);
    });
  });

  group('M3ScreenSize.of', () {
    testWidgets('reads the class from the ambient MediaQuery', (tester) async {
      late M3ScreenSize observed;

      Future<void> pumpAt(double width) async {
        await tester.pumpWidget(
          MediaQuery(
            data: MediaQueryData(size: Size(width, 800)),
            child: Builder(
              builder: (context) {
                observed = M3ScreenSize.of(context);
                return const SizedBox();
              },
            ),
          ),
        );
      }

      await pumpAt(400);
      expect(observed, M3ScreenSize.compact);

      await pumpAt(900);
      expect(observed, M3ScreenSize.expanded);

      await pumpAt(1700);
      expect(observed, M3ScreenSize.extraLarge);
    });
  });
}
