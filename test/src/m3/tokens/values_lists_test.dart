import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

/// Every scale class exposes a `values` list, and every list is complete,
/// ordered, and free of accidental duplicates.
///
/// Added in 1.6.0: `M3Margins`, `M3Spacers`, `M3Opacities`,
/// `M3StateLayerOpacities` and `M3LayoutWidths` previously had no `values`,
/// which made galleries and property tests hand-maintain their own lists.
void main() {
  group('values lists are complete', () {
    test('M3Margins covers every window size class', () {
      expect(M3Margins.values, hasLength(M3ScreenSize.values.length));
      expect(M3Margins.values, [
        M3Margins.compactScreen,
        M3Margins.mediumScreen,
        M3Margins.expandedScreen,
        M3Margins.largeScreen,
        M3Margins.extraLargeScreen,
      ]);
    });

    test('M3Margins.values is index-aligned with M3ScreenSize.pageMargin', () {
      for (final size in M3ScreenSize.values) {
        expect(M3Margins.values[size.index], size.pageMargin);
      }
    });

    test('M3Spacers', () {
      expect(M3Spacers.values, [M3Spacers.pane]);
    });

    test('M3Opacities', () {
      expect(M3Opacities.values, hasLength(4));
      expect(
        M3Opacities.values,
        containsAll([
          M3Opacities.disabledContent,
          M3Opacities.disabledContainer,
          M3Opacities.divider,
          M3Opacities.backdrop,
        ]),
      );
    });

    test('M3StateLayerOpacities matches M3InteractionState', () {
      expect(
        M3StateLayerOpacities.values,
        hasLength(M3InteractionState.values.length),
      );
      for (final state in M3InteractionState.values) {
        expect(
          M3StateLayerOpacities.values,
          contains(state.stateLayerOpacity),
        );
      }
    });

    test('M3LayoutWidths excludes the unbounded directive', () {
      expect(M3LayoutWidths.values, [
        M3LayoutWidths.pane,
        M3LayoutWidths.body,
        M3LayoutWidths.ultraWide,
      ]);
      expect(M3LayoutWidths.values, isNot(contains(M3LayoutWidths.unbounded)));
    });
  });

  group('values lists are ordered ascending', () {
    void expectAscending(List<num> values, String name) {
      for (var i = 1; i < values.length; i++) {
        expect(
          values[i] >= values[i - 1],
          isTrue,
          reason: '$name is not ascending at index $i',
        );
      }
    }

    test('every numeric scale', () {
      expectAscending(M3Spacings.values, 'M3Spacings');
      expectAscending(M3Corners.values, 'M3Corners');
      expectAscending(M3BorderWidths.values, 'M3BorderWidths');
      expectAscending(M3IconSizes.values, 'M3IconSizes');
      expectAscending(M3ZIndexes.values, 'M3ZIndexes');
      expectAscending(M3Breakpoints.values, 'M3Breakpoints');
      expectAscending(M3ElevationDps.values, 'M3ElevationDps');
      expectAscending(M3Tones.values, 'M3Tones');
      expectAscending(M3Opacities.values, 'M3Opacities');
      expectAscending(M3StateLayerOpacities.values, 'M3StateLayerOpacities');
      expectAscending(M3LayoutWidths.values, 'M3LayoutWidths');
    });
  });

  group('const-ness', () {
    test('M3Border.none is a compile-time constant', () {
      // Would not compile if `none` were a mutable static field.
      const border = M3Border.none;
      expect(border, same(M3Border.none));
    });
  });
}
