import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/main.dart';
import 'package:material_design_demo/showcase/showcase_destinations.dart';
import 'package:material_design_demo/showcase/showcase_drawer.dart';
import 'package:material_design_demo/showcase/showcase_rail.dart';
import 'package:material_design_demo/showcase_pages/foundations/icon_tokens_page.dart';
import 'package:material_design_demo/theme/theme_provider.dart';
import 'package:material_design_demo/widgets/showcase_link.dart';
import 'package:provider/provider.dart';

/// The showcase's navigation, which used to be two hand-synchronised lists
/// addressed by offset arithmetic.
void main() {
  Widget app() => ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const ShowcaseApp(),
      );

  /// Pumps a second of frames — long enough for every M3 motion duration and
  /// for a drawer or rail transition to land.
  ///
  /// Deliberately *not* `pumpAndSettle`. The shell renders whichever
  /// destination comes first in [showcaseSections], and several pages animate
  /// forever (the accessibility pulse, the expressive loading indicator).
  /// Settling would make every shell test depend on the navigation order, so
  /// reordering the rail would fail tests that have nothing to do with the
  /// change.
  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
  }

  Future<void> pumpAt(WidgetTester tester, Size size) async {
    tester.view
      ..physicalSize = size
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(app());
    await settle(tester);
  }

  group('destination model', () {
    test('every section contributes to the flat destination list', () {
      final total = showcaseSections.fold<int>(
        0,
        (sum, section) => sum + section.destinations.length,
      );
      expect(showcaseDestinations, hasLength(total));
    });

    test('section offsets address the flat list', () {
      for (final section in showcaseSections) {
        final offset = showcaseSectionOffset(section);
        for (final (index, destination) in section.destinations.indexed) {
          expect(showcaseDestinations[offset + index], same(destination));
        }
      }
    });

    test('labels are unique, so the rail never shows the same word twice', () {
      final labels = showcaseDestinations.map((d) => d.label).toSet();
      expect(labels, hasLength(showcaseDestinations.length));
    });

    test('every destination has a code page of its own', () {
      // Twenty-three pairs were wired by hand. Two destinations pointing at
      // the same recipe page is the copy-paste mistake that would look
      // completely fine in the rail.
      final codePages =
          showcaseDestinations.map((d) => d.codePage.runtimeType).toSet();
      expect(codePages, hasLength(showcaseDestinations.length));
    });

    test('a code page is never also a visual page', () {
      final visualPages =
          showcaseDestinations.map((d) => d.page.runtimeType).toSet();
      final codePages =
          showcaseDestinations.map((d) => d.codePage.runtimeType).toSet();
      expect(visualPages.intersection(codePages), isEmpty);
    });
  });

  testWidgets('expanded window shows the rail and switches pages',
      (tester) async {
    await pumpAt(tester, const Size(1400, 1000));

    expect(find.byType(ShowcaseRail), findsOneWidget);
    expect(find.byType(ShowcaseDrawer), findsNothing);
    expect(find.text('Spacing'), findsWidgets);

    // The rail scrolls: how far down a destination sits depends on how many
    // sections precede it, so scroll to it rather than assuming it is on
    // screen. Otherwise adding one destination at the top breaks this test.
    final icons = find.text('Icons').last;
    await tester.ensureVisible(icons);
    await settle(tester);

    await tester.tap(icons);
    await settle(tester);

    // The Icons page is up — its first section caption names the size scale.
    expect(find.text('M3IconSizes'), findsOneWidget);
  });

  testWidgets('the rail switches the body between Visual and Code',
      (tester) async {
    await pumpAt(tester, const Size(1400, 1000));

    // Read the destination off the model: the shell opens on whichever one is
    // first, and that is a navigation-order decision this test has no opinion
    // about.
    final opening = showcaseDestinations.first.label;

    Finder modeSegment(String label) => find.descendant(
          of: find.byType(ShowcaseRail),
          matching: find.text(label),
        );

    expect(find.text('$opening · Code'), findsNothing);

    await tester.tap(modeSegment('Code'));
    await settle(tester);
    expect(find.text('$opening · Code'), findsOneWidget);

    // The mode outlives a change of destination — a reader who came for the
    // code stays in the code. The rail scrolls, so reach the destination the
    // way a user would rather than assuming it is on screen.
    final second = showcaseDestinations[1].label;
    final target = find.text(second).last;
    await tester.ensureVisible(target);
    await settle(tester);

    await tester.tap(target);
    await settle(tester);
    expect(find.text('$second · Code'), findsOneWidget);

    await tester.tap(modeSegment('Visual'));
    await settle(tester);
    expect(find.text('$second · Code'), findsNothing);
  });

  // Every page is rendered once, in both modes. Several of them animate
  // forever (the accessibility pulse, the expressive loading indicator), so
  // this pumps frames rather than settling.
  for (final destination in showcaseDestinations) {
    testWidgets('${destination.label} page renders', (tester) async {
      tester.view
        ..physicalSize = const Size(1400, 1200)
        ..devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: MaterialApp(home: destination.page),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      expect(tester.takeException(), isNull);
    });

    testWidgets('${destination.label} code page renders', (tester) async {
      tester.view
        ..physicalSize = const Size(1400, 1200)
        ..devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: MaterialApp(home: destination.codePage),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      expect(tester.takeException(), isNull);

      // A code page titles itself with its destination's label, which is what
      // lets a reader switching modes know they are still in the same place.
      expect(find.text('${destination.label} · Code'), findsOneWidget);
    });
  }

  group('rail destination states', () {
    /// A destination's label inside the rail — the page under it may show the
    /// same word in its app bar.
    ///
    /// Section headers are `ShowcaseLink`s and can carry the same word as the
    /// only destination beneath them ("Expressive" does), so they are filtered
    /// out: this finder always means the tappable destination.
    Finder railLabel(String label) {
      final inRail = find.descendant(
        of: find.byType(ShowcaseRail),
        matching: find.text(label),
      );
      return find.byElementPredicate((element) {
        if (!inRail.evaluate().contains(element)) return false;
        var insideLink = false;
        element.visitAncestorElements((ancestor) {
          if (ancestor.widget is ShowcaseLink) {
            insideLink = true;
            return false;
          }
          return true;
        });
        return !insideLink;
      });
    }

    /// The indicator's fill and its state layer, read back off the two
    /// stacked containers the destination draws.
    ///
    /// A label can appear twice in the rail when a section and its only
    /// destination share a name — "Expressive" does. So rather than taking the
    /// nearest `SizedBox` ancestor, this walks the candidates and takes the
    /// smallest box holding exactly the indicator's two layers, which is the
    /// destination itself and never the section around it.
    List<Color?> indicatorLayers(WidgetTester tester, String label) {
      final boxes = find.ancestor(
        of: railLabel(label),
        matching: find.byType(SizedBox),
      );
      for (var i = 0; i < boxes.evaluate().length; i++) {
        final layers = tester
            .widgetList<AnimatedContainer>(
              find.descendant(
                of: boxes.at(i),
                matching: find.byType(AnimatedContainer),
              ),
            )
            .toList();
        if (layers.length == 2) {
          return layers
              .map((c) => (c.decoration as ShapeDecoration?)?.color)
              .toList();
        }
      }
      fail('No rail destination found for "$label".');
    }

    /// A single mouse pointer for the whole test — adding a second one trips
    /// an assertion in MouseTracker.
    Future<TestGesture> mouse(WidgetTester tester) async {
      final pointer = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await pointer.addPointer(location: Offset.zero);
      addTearDown(pointer.removePointer);
      return pointer;
    }

    Future<void> hover(
      WidgetTester tester,
      TestGesture pointer,
      Finder target,
    ) async {
      await pointer.moveTo(tester.getCenter(target));
      await settle(tester);
    }

    testWidgets('the state layer follows the M3 role for each state',
        (tester) async {
      await pumpAt(tester, const Size(1400, 1000));
      final colorScheme = Theme.of(
        tester.element(find.byType(ShowcaseRail)),
      ).colorScheme;

      // Read the two destinations off the model instead of naming them: the
      // shell opens on whichever one is first, and that is a navigation-order
      // decision this test has no opinion about.
      final selected = showcaseDestinations.first.label;
      final unselected = showcaseDestinations[1].label;

      // At rest: the selected destination is filled, nothing is overlaid.
      expect(
        indicatorLayers(tester, selected),
        [colorScheme.secondaryContainer, Colors.transparent],
      );
      expect(
        indicatorLayers(tester, unselected),
        [Colors.transparent, Colors.transparent],
      );

      // Hovering the *label* of an unselected destination lights the pill —
      // the whole destination is one target, not just the icon.
      final pointer = await mouse(tester);
      await hover(tester, pointer, railLabel(unselected));
      expect(
        indicatorLayers(tester, unselected).last,
        colorScheme.onSurface.withValues(
          alpha: M3InteractionState.hover.stateLayerOpacity,
        ),
      );

      // A selected destination gets the same feedback, in the content color
      // of the indicator it sits on.
      await hover(tester, pointer, railLabel(selected));
      expect(
        indicatorLayers(tester, selected).last,
        colorScheme.onSecondaryContainer.withValues(
          alpha: M3InteractionState.hover.stateLayerOpacity,
        ),
      );
    });

    testWidgets('deselecting never looks like a hover on the old destination',
        (tester) async {
      // Regression: the indicator used to fade its fill out over 500ms of
      // emphasized easing. A translucent `secondaryContainer` is precisely
      // what a hover state layer looks like, so picking a new destination
      // flashed the old one as if the pointer had passed over it.
      await pumpAt(tester, const Size(1400, 1000));

      /// The colors actually painted this frame, rather than the targets the
      /// AnimatedContainers are heading for.
      List<Color?> painted(String label) {
        final destination = find.ancestor(
          of: railLabel(label),
          matching: find.byType(SizedBox),
        );
        return tester
            .widgetList<DecoratedBox>(
              find.descendant(
                of: destination.first,
                matching: find.byType(DecoratedBox),
              ),
            )
            .map((box) => box.decoration)
            .whereType<ShapeDecoration>()
            .map((decoration) => decoration.color)
            .toList();
      }

      await tester.tap(railLabel('Density'));
      await tester.pump();

      // Watch the old destination for the length of an emphasized transition.
      var frames = 0;
      var fillGoneAt = Duration.zero;
      for (var elapsed = Duration.zero;
          elapsed < M3Motion.emphasized.duration;
          elapsed += const Duration(milliseconds: 16)) {
        await tester.pump(const Duration(milliseconds: 16));
        frames++;

        final layers = painted('Spacing');
        // The state layer stays down: nothing hovered this destination.
        expect(
          layers.last,
          Colors.transparent,
          reason: 'state layer lit ${elapsed.inMilliseconds}ms after the tap',
        );
        if (fillGoneAt == Duration.zero && (layers.first?.a ?? 0) == 0) {
          fillGoneAt = elapsed;
        }
      }
      expect(frames, greaterThan(10));

      // And the fill is gone within the 100ms the spec gives the indicator,
      // not lingering as a tint for the whole 500ms.
      expect(
        fillGoneAt,
        lessThanOrEqualTo(M3MotionDuration.short2 * 2),
        reason: 'the old indicator lingered as a translucent tint',
      );
    });

    testWidgets('labels keep the M3 onSurface role in both states',
        (tester) async {
      await pumpAt(tester, const Size(1400, 1000));
      final colorScheme = Theme.of(
        tester.element(find.byType(ShowcaseRail)),
      ).colorScheme;

      for (final label in ['Spacing', 'Density']) {
        final text = tester.widget<Text>(railLabel(label).first);
        expect(text.style?.color, colorScheme.onSurface, reason: label);
      }
    });
  });

  // The Icons page carries the longest labels in the showcase (whole axis
  // summaries), so it is the one most likely to overflow when the window
  // narrows. Checked at each of the first three window size classes.
  for (final width in const [360.0, 700.0, 1400.0]) {
    testWidgets('icons page lays out at ${width.toInt()}px', (tester) async {
      tester.view
        ..physicalSize = Size(width, 900)
        ..devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeProvider().darkTheme,
          home: const IconTokensPage(),
        ),
      );
      await tester.pump();
      expect(tester.takeException(), isNull);

      // Scroll to the bottom so every section actually lays out.
      for (var i = 0; i < 3; i++) {
        await tester.drag(find.byType(ListView), const Offset(0, -2000));
        await tester.pump();
      }
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('dark theme colors the icons that inherit their color',
      (tester) async {
    // Regression: the theme's iconTheme was replaced with an M3IconStyle that
    // carried no color, which drops Icon to its black fallback — black icons
    // on a dark surface, everywhere except the samples that pass a color.
    final theme = ThemeProvider().darkTheme;

    await tester.pumpWidget(
      MaterialApp(theme: theme, home: const IconTokensPage()),
    );
    await tester.pump();

    final icon = tester.widget<Icon>(
      find.byIcon(Icons.directions_boat_filled).first,
    );
    expect(icon.color, isNull, reason: 'this sample inherits its color');

    final resolved = IconTheme.of(
      tester.element(find.byIcon(Icons.directions_boat_filled).first),
    );
    expect(resolved.color, theme.colorScheme.onSurface);
    expect(resolved.color, isNot(const Color(0xFF000000)));
  });

  testWidgets('compact window shows the drawer', (tester) async {
    await pumpAt(tester, const Size(400, 900));

    expect(find.byType(ShowcaseRail), findsNothing);

    await tester.tap(find.byIcon(Icons.menu));
    await settle(tester);

    expect(find.byType(ShowcaseDrawer), findsOneWidget);
    expect(find.text('Foundations'), findsOneWidget);
  });
}
