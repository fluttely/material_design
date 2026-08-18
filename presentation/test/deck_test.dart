// Renders every slide once. A slide that throws on build fails here rather
// than in front of the room.
//
// Frames are pumped rather than settled: the backdrop's polygons morph and
// rotate forever by design, so there is nothing to settle to.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m3_talk/main.dart';
import 'package:m3_talk/notes.dart';
import 'package:m3_talk/presenter.dart';
import 'package:m3_talk/slide_kit.dart';
import 'package:m3_talk/slides.dart';

/// How tall a slide's content may be on a 1080p projector.
///
/// The frame centres its content inside 48 px margins, and the footer covers
/// the bottom ~80 px — so anything past `1080 − 2×80 − 2×48` runs under the
/// progress bar even though the slide scrolls instead of overflowing.
const _contentBudget = 1080.0 - 2 * 80 - 2 * 48;

void main() {
  test('there is one note per slide', () {
    // A missing note is a range error in the middle of the talk, on the
    // screen you are reading from. Cheapest possible thing to pin.
    expect(speakerNotes, hasLength(deck.length));
  });

  test('every note carries an opening line and at least one beat', () {
    for (final (index, note) in speakerNotes.indexed) {
      expect(note.opening.trim(), isNotEmpty, reason: 'slide ${index + 1}');
      expect(note.beats, isNotEmpty, reason: 'slide ${index + 1}');
      expect(note.clock, isNotEmpty, reason: 'slide ${index + 1}');
    }
  });

  test('every FAQ card has a question and an answer', () {
    for (final card in faq) {
      expect(card.question.trim(), isNotEmpty);
      expect(card.answer.trim(), isNotEmpty);
    }
  });

  for (var page = 0; page < deck.length + faq.length; page++) {
    testWidgets('presenter page ${page + 1} renders', (tester) async {
      tester.view
        ..physicalSize = const Size(1280, 1600)
        ..devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: PresenterView(index: page))),
      );
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  }

  for (final (index, slide) in deck.indexed) {
    testWidgets('slide ${index + 1} (${slide.section}) renders',
        (tester) async {
      tester.view
        ..physicalSize = const Size(1920, 1080)
        ..devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(home: Builder(builder: slide.build)),
      );
      // Two pumps, and they are not interchangeable. The first has to outlast
      // the whole stagger — the longest slide has ten revealed elements, so
      // the last delayed callback lands at 540 ms — because a ticker started
      // *during* an elapse does not tick until the next frame. The second pump
      // then runs the springs to rest.
      await tester.pump(const Duration(milliseconds: 1500));
      await tester.pump(const Duration(seconds: 3));

      expect(tester.takeException(), isNull);

      // The entrance has to finish. A slide whose content never reaches full
      // opacity renders as an empty rectangle in front of the room, and no
      // exception is thrown when that happens.
      final opacities = tester
          .widgetList<Opacity>(find.byType(Opacity))
          .map((o) => o.opacity);
      expect(opacities, isNotEmpty, reason: 'nothing was revealed');
      expect(
        opacities.every((o) => o > 0.99),
        isTrue,
        reason: 'a Reveal never settled — the slide would show up blank',
      );

      // And it has to fit. The frame scrolls rather than overflowing, so a
      // slide that grew past the projector fails no other check — it just
      // quietly hides its last line behind the footer, on stage.
      final content = find
          .descendant(
            of: find.byType(SlideFrame),
            matching: find.byType(Column),
          )
          .first;
      expect(
        tester.getSize(content).height,
        lessThanOrEqualTo(_contentBudget),
        reason: 'slide ${index + 1} is too tall for 1080p — cut a line',
      );
    });
  }

  testWidgets('the deck runs end to end on the keyboard', (tester) async {
    tester.view
      ..physicalSize = const Size(1920, 1080)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const TalkApp());
    await tester.pump(const Duration(milliseconds: 400));

    for (var i = 0; i < deck.length + 2; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump(const Duration(milliseconds: 500));
    }
    expect(tester.takeException(), isNull);

    for (var i = 0; i < deck.length + 2; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump(const Duration(milliseconds: 500));
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets('P opens the notes, and they run past the deck into the Q&A',
      (tester) async {
    tester.view
      ..physicalSize = const Size(1280, 1600)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const TalkApp());
    await tester.pump(const Duration(milliseconds: 400));

    await tester.sendKeyEvent(LogicalKeyboardKey.keyP);
    await tester.pump();
    expect(find.byType(PresenterView), findsOneWidget);
    expect(find.text('FALE'), findsOneWidget);

    // Presenter mode keeps going after the last slide, into the Q&A cards.
    for (var i = 0; i < presenterPageCount + 2; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pump();
    }
    expect(tester.takeException(), isNull);
    expect(find.text('RESPONDA'), findsOneWidget);

    // Going back to the slides must clamp the index — the deck has fewer
    // pages than the notes, and the Q&A sits past its end.
    await tester.sendKeyEvent(LogicalKeyboardKey.keyP);
    await tester.pump();
    expect(find.byType(PresenterView), findsNothing);

    // Drain the stagger before the test ends: remounting a slide schedules a
    // delayed callback per revealed element, and flutter_test fails a test
    // that leaves timers pending.
    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pump(const Duration(seconds: 3));
    expect(tester.takeException(), isNull);
  });
}
