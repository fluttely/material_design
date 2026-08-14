import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('token scales', () {
    test('spacing scale sits on the 4dp grid', () {
      for (final value in M3Spacings.values) {
        expect(
          value % 4,
          0,
          reason: '$value is not a multiple of 4',
        );
      }
    });

    test('spacing scale is strictly ascending', () {
      for (var i = 1; i < M3Spacings.values.length; i++) {
        expect(M3Spacings.values[i], greaterThan(M3Spacings.values[i - 1]));
      }
    });

    test('shape scale has exactly the 7 M3 levels', () {
      expect(M3Corners.values, hasLength(7));
      expect(
        M3Corners.values,
        orderedEquals(<double>[0, 4, 8, 12, 16, 28, 9999]),
      );
    });

    test('border widths cover none/thin/thick/extraThick', () {
      expect(M3BorderWidths.values, orderedEquals(<double>[0, 1, 2, 4]));
    });

    test('focus indicator is 3dp and off the border scale', () {
      expect(M3FocusIndicator.thickness, 3.0);
      expect(M3FocusIndicator.offset, 3.0);
      expect(
        M3BorderWidths.values,
        isNot(contains(M3FocusIndicator.thickness)),
        reason: 'a focus ring is not a component outline',
      );
    });

    test('opacities stay within 0..1', () {
      final opacities = <double>[
        M3Opacities.disabledContent,
        M3Opacities.disabledContainer,
        M3Opacities.divider,
        M3Opacities.backdrop,
        M3StateLayerOpacities.hover,
        M3StateLayerOpacities.focus,
        M3StateLayerOpacities.pressed,
        M3StateLayerOpacities.dragged,
      ];
      for (final o in opacities) {
        expect(o, inInclusiveRange(0.0, 1.0));
      }
    });

    test('breakpoints match the five M3 window size classes', () {
      expect(
        M3Breakpoints.values,
        orderedEquals(<double>[0, 600, 840, 1200, 1600]),
      );
    });

    test('elevation dps match the six M3 levels', () {
      expect(
        M3ElevationDps.values,
        orderedEquals(<double>[0, 1, 3, 6, 8, 12]),
      );
    });

    test('icon sizes ascend from dense to extraLarge', () {
      expect(M3IconSizes.values, orderedEquals(<double>[20, 24, 32, 40, 48]));
    });

    test('z-indexes ascend from background to tooltip', () {
      for (var i = 1; i < M3ZIndexes.values.length; i++) {
        expect(M3ZIndexes.values[i], greaterThan(M3ZIndexes.values[i - 1]));
      }
    });
  });

  group('M3Contract', () {
    test('produces values usable where tokens are demanded', () {
      // 18dp is deliberately off the 4dp grid — that is the whole point.
      const insets = M3EdgeInsets.all(M3Spacings.s16);
      final offScale = M3EdgeInsets.all(M3Contract.spacing(18));

      expect(insets.left, 16.0);
      expect(offScale.left, 18.0);
    });

    test('each escape hatch returns its own token type', () {
      expect(M3Contract.spacing(18), isA<M3SpacingValue>());
      expect(M3Contract.borderWidth(1.5), isA<M3BorderWidthValue>());
      expect(M3Contract.opacity(0.42), isA<M3OpacityValue>());
      expect(M3Contract.corner(10), isA<M3CornerValue>());
      expect(M3Contract.iconSize(18), isA<M3IconSizeValue>());
      expect(M3Contract.zIndex(42), isA<M3ZIndexValue>());
      expect(M3Contract.breakpoint(720), isA<M3BreakpointValue>());
      expect(M3Contract.elevationDp(2), isA<M3ElevationDpValue>());
    });

    test('opacity rejects values outside 0..1 in debug', () {
      expect(() => M3Contract.opacity(1.5), throwsAssertionError);
      expect(() => M3Contract.opacity(-0.1), throwsAssertionError);
    });
  });
}
