import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  const base = Color(0xFF000000);

  Widget wrap(Widget child) => MaterialApp(
        home: Scaffold(body: Center(child: child)),
      );

  WidgetStateProperty<Color?>? overlayOf(WidgetTester tester) =>
      tester.widget<InkWell>(find.byType(InkWell)).overlayColor;

  group('M3InteractionState', () {
    test('carries the M3 state layer opacities', () {
      expect(M3InteractionState.hover.stateLayerOpacity, 0.08);
      expect(M3InteractionState.focus.stateLayerOpacity, 0.10);
      expect(M3InteractionState.pressed.stateLayerOpacity, 0.10);
      expect(M3InteractionState.dragged.stateLayerOpacity, 0.16);
    });
  });

  group('ColorScheme.stateLayerColor', () {
    test('applies the opacity for each state', () {
      const scheme = ColorScheme.light();
      for (final state in M3InteractionState.values) {
        expect(
          scheme.stateLayerColor(base, state).a,
          closeTo(state.stateLayerOpacity, 0.005),
        );
      }
    });
  });

  group('M3StateLayer', () {
    testWidgets('resolves one overlay per interaction state', (tester) async {
      await tester.pumpWidget(
        wrap(
          const M3StateLayer(
            overlayColor: base,
            child: SizedBox(width: 100, height: 40),
          ),
        ),
      );

      final overlay = overlayOf(tester);
      expect(overlay, isNotNull);

      expect(
        overlay!.resolve({WidgetState.hovered})?.a,
        closeTo(M3StateLayerOpacities.hover, 0.005),
      );
      expect(
        overlay.resolve({WidgetState.focused})?.a,
        closeTo(M3StateLayerOpacities.focus, 0.005),
      );
      expect(
        overlay.resolve({WidgetState.pressed})?.a,
        closeTo(M3StateLayerOpacities.pressed, 0.005),
      );
      expect(
        overlay.resolve({WidgetState.dragged})?.a,
        closeTo(M3StateLayerOpacities.dragged, 0.005),
      );
      expect(overlay.resolve({}), isNull);
    });

    testWidgets('the strongest active state wins', (tester) async {
      await tester.pumpWidget(
        wrap(
          const M3StateLayer(
            overlayColor: base,
            child: SizedBox(width: 100, height: 40),
          ),
        ),
      );

      // Hovering while pressing is the common case; press must show through.
      final overlay = overlayOf(tester)!;
      expect(
        overlay.resolve({WidgetState.hovered, WidgetState.pressed})?.a,
        closeTo(M3StateLayerOpacities.pressed, 0.005),
      );
      expect(
        overlay.resolve({WidgetState.hovered, WidgetState.dragged})?.a,
        closeTo(M3StateLayerOpacities.dragged, 0.005),
      );
    });

    testWidgets('disabled suppresses both overlay and callbacks',
        (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          M3StateLayer(
            overlayColor: base,
            enabled: false,
            onTap: () => tapped = true,
            child: const SizedBox(width: 100, height: 40),
          ),
        ),
      );

      expect(overlayOf(tester), isNull);
      await tester.tap(find.byType(M3StateLayer));
      await tester.pump();
      expect(tapped, isFalse);
    });

    testWidgets('forwards taps when enabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          M3StateLayer(
            overlayColor: base,
            onTap: () => tapped = true,
            child: const SizedBox(width: 100, height: 40),
          ),
        ),
      );

      await tester.tap(find.byType(M3StateLayer));
      await tester.pump();
      expect(tapped, isTrue);
    });
  });
}
