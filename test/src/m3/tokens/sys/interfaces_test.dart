import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3SpacingValue extension type', () {
    test('implements double', () {
      const value = M3Spacings.s16;
      expect(value, isA<double>());
      expect(value, equals(16.0));
    });

    test('is usable as a double in arithmetic', () {
      const value = M3Spacings.s16;
      expect(value * 2, equals(32.0));
      expect(value + M3Spacings.s8, equals(24.0));
    });

    test('const values are identical', () {
      const v1 = M3Spacings.s16;
      const v2 = M3Spacings.s16;
      expect(identical(v1, v2), isTrue);
    });

    test('values are consistent across access', () {
      expect(M3Spacings.s16, equals(M3Spacings.s16));
      expect(M3Spacings.s24, equals(M3Spacings.s24));
    });

    test('is a subtype of M3SpacingValue', () {
      expect(M3Spacings.s16, isA<M3SpacingValue>());
    });
  });

  group('M3Margins', () {
    test('compact screen margin is 16dp', () {
      expect(M3Margins.compactScreen, equals(16.0));
      expect(M3Margins.compactScreen, isA<M3SpacingValue>());
    });

    test('medium and larger screen margins are 24dp', () {
      expect(M3Margins.mediumScreen, equals(24.0));
      expect(M3Margins.expandedScreen, equals(24.0));
      expect(M3Margins.largeScreen, equals(24.0));
      expect(M3Margins.extraLargeScreen, equals(24.0));
    });
  });

  group('M3Spacers', () {
    test('pane spacer is 24dp', () {
      expect(M3Spacers.pane, equals(24.0));
      expect(M3Spacers.pane, isA<M3SpacingValue>());
    });
  });
}
