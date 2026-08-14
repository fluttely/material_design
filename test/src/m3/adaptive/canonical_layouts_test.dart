import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

/// Pumps [child] in a window [width] logical pixels wide.
Future<void> pumpAt(
  WidgetTester tester,
  double width,
  Widget child,
) async {
  tester.view
    ..devicePixelRatio = 1.0
    ..physicalSize = Size(width, 800);
  addTearDown(tester.view.reset);

  await tester.pumpWidget(MaterialApp(home: Scaffold(body: child)));
}

void main() {
  group('M3CanonicalLayout policy', () {
    test('two panes need expanded or wider', () {
      expect(
        M3CanonicalLayout.displayModeFor(M3ScreenSize.compact),
        M3PaneDisplayMode.single,
      );
      expect(
        M3CanonicalLayout.displayModeFor(M3ScreenSize.medium),
        M3PaneDisplayMode.single,
        reason: 'a 360dp pane at medium leaves the primary narrower than a '
            'phone',
      );
      for (final size in [
        M3ScreenSize.expanded,
        M3ScreenSize.large,
        M3ScreenSize.extraLarge,
      ]) {
        expect(
          M3CanonicalLayout.displayModeFor(size),
          M3PaneDisplayMode.dual,
        );
      }
    });

    test('the secondary pane is fixed and the primary is unbounded', () {
      for (final size in M3ScreenSize.values) {
        expect(
          M3CanonicalLayout.paneWidthFor(M3PaneRole.primary, size),
          M3LayoutWidths.unbounded,
        );
        expect(
          M3CanonicalLayout.paneWidthFor(M3PaneRole.secondary, size),
          size.paneWidth,
        );
      }
      expect(
        M3CanonicalLayout.paneWidthFor(
          M3PaneRole.secondary,
          M3ScreenSize.expanded,
        ),
        M3LayoutWidths.pane,
      );
    });
  });

  group('M3ListDetailLayout', () {
    const list = Text('LIST');
    const detail = Text('DETAIL');

    testWidgets('compact shows the list until something is selected',
        (tester) async {
      await pumpAt(
        tester,
        400,
        const M3ListDetailLayout(list: list, detail: null),
      );
      expect(find.text('LIST'), findsOneWidget);
      expect(find.text('DETAIL'), findsNothing);
    });

    testWidgets('compact shows the detail once selected, replacing the list',
        (tester) async {
      await pumpAt(
        tester,
        400,
        const M3ListDetailLayout(list: list, detail: detail),
      );
      expect(find.text('DETAIL'), findsOneWidget);
      expect(find.text('LIST'), findsNothing);
    });

    testWidgets('expanded shows both panes at once', (tester) async {
      await pumpAt(
        tester,
        1000,
        const M3ListDetailLayout(list: list, detail: detail),
      );
      expect(find.text('LIST'), findsOneWidget);
      expect(find.text('DETAIL'), findsOneWidget);
    });

    testWidgets('expanded falls back to the placeholder with no selection',
        (tester) async {
      await pumpAt(
        tester,
        1000,
        const M3ListDetailLayout(
          list: list,
          detail: null,
          placeholder: Text('PICK ONE'),
        ),
      );
      expect(find.text('LIST'), findsOneWidget);
      expect(find.text('PICK ONE'), findsOneWidget);
    });

    testWidgets('the list pane takes the spec pane width', (tester) async {
      await pumpAt(
        tester,
        1000,
        const M3ListDetailLayout(list: list, detail: detail),
      );
      expect(
        tester.getSize(find.text('LIST')).width,
        lessThanOrEqualTo(M3LayoutWidths.pane),
      );
    });
  });

  group('M3SupportingPaneLayout', () {
    const primary = Text('PRIMARY');
    const supporting = Text('SUPPORT');

    testWidgets('compact stacks rather than hiding the support',
        (tester) async {
      await pumpAt(
        tester,
        400,
        const M3SupportingPaneLayout(
          primary: primary,
          supporting: supporting,
        ),
      );
      // Both visible: the support is part of the same task, not a destination.
      expect(find.text('PRIMARY'), findsOneWidget);
      expect(find.text('SUPPORT'), findsOneWidget);
      expect(
        tester.getTopLeft(find.text('SUPPORT')).dy,
        greaterThan(tester.getTopLeft(find.text('PRIMARY')).dy),
      );
    });

    testWidgets('expanded places them side by side', (tester) async {
      await pumpAt(
        tester,
        1000,
        const M3SupportingPaneLayout(
          primary: primary,
          supporting: supporting,
        ),
      );
      expect(
        tester.getTopLeft(find.text('SUPPORT')).dx,
        greaterThan(tester.getTopLeft(find.text('PRIMARY')).dx),
      );
    });

    testWidgets('supportingFirst flips the order', (tester) async {
      await pumpAt(
        tester,
        1000,
        const M3SupportingPaneLayout(
          primary: primary,
          supporting: supporting,
          supportingFirst: true,
        ),
      );
      expect(
        tester.getTopLeft(find.text('SUPPORT')).dx,
        lessThan(tester.getTopLeft(find.text('PRIMARY')).dx),
      );
    });
  });

  group('M3FeedLayout', () {
    List<Widget> items() => [
          for (var i = 0; i < 6; i++) SizedBox(key: ValueKey(i), height: 40),
        ];

    testWidgets('column count follows the window size class', (tester) async {
      for (final (width, expectedColumns) in const <(double, int)>[
        (400, 1), // compact
        (700, 2), // medium
        (1000, 3), // expanded
        (1300, 4), // large
        (1700, 5), // extra-large
      ]) {
        await pumpAt(tester, width, M3FeedLayout(children: items()));
        await tester.pump();

        final delegate = tester
            .widget<GridView>(find.byType(GridView))
            .gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;

        expect(
          delegate.crossAxisCount,
          expectedColumns,
          reason: 'at ${width}dp',
        );
      }
    });

    testWidgets('gutters come from the size class, not a magic number',
        (tester) async {
      await pumpAt(tester, 1000, M3FeedLayout(children: items()));
      final delegate = tester
          .widget<GridView>(find.byType(GridView))
          .gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;

      expect(delegate.crossAxisSpacing, M3ScreenSize.expanded.gutterWidth);
      expect(delegate.mainAxisSpacing, M3ScreenSize.expanded.gutterWidth);
    });

    testWidgets('itemColumns overrides only the classes it names',
        (tester) async {
      await pumpAt(
        tester,
        400,
        M3FeedLayout(
          itemColumns: const {M3ScreenSize.compact: 2},
          children: items(),
        ),
      );
      var delegate = tester.widget<GridView>(find.byType(GridView)).gridDelegate
          as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, 2);

      // Expanded was not overridden, so it keeps the default.
      await pumpAt(
        tester,
        1000,
        M3FeedLayout(
          itemColumns: const {M3ScreenSize.compact: 2},
          children: items(),
        ),
      );
      delegate = tester.widget<GridView>(find.byType(GridView)).gridDelegate
          as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, 3);
    });
  });
}
