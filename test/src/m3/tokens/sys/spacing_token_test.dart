import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3SpacingToken', () {
    test('returns correct values for all spacing tokens', () {
      expect(M3SpacingToken.none.value, equals(0));
      expect(M3SpacingToken.space4.value, equals(4));
      expect(M3SpacingToken.space8.value, equals(8));
      expect(M3SpacingToken.space12.value, equals(12));
      expect(M3SpacingToken.space16.value, equals(16));
      expect(M3SpacingToken.space20.value, equals(20));
      expect(M3SpacingToken.space24.value, equals(24));
      expect(M3SpacingToken.space28.value, equals(28));
      expect(M3SpacingToken.space32.value, equals(32));
      expect(M3SpacingToken.space36.value, equals(36));
      expect(M3SpacingToken.space40.value, equals(40));
      expect(M3SpacingToken.space48.value, equals(48));
      expect(M3SpacingToken.space56.value, equals(56));
      expect(M3SpacingToken.space64.value, equals(64));
      expect(M3SpacingToken.space72.value, equals(72));
      expect(M3SpacingToken.space80.value, equals(80));
      expect(M3SpacingToken.space96.value, equals(96));
      expect(M3SpacingToken.space128.value, equals(128));
      expect(M3SpacingToken.infinity.value, equals(double.infinity));
    });

    test('implements IM3SpacingToken interface', () {
      expect(M3SpacingToken.space16, isA<IM3SpacingToken>());
    });

    test('implements IM3Token interface', () {
      expect(M3SpacingToken.space16, isA<IM3Token<double>>());
    });

    test('spacing values follow 4dp grid system', () {
      final baseSpacings = [
        M3SpacingToken.space4,
        M3SpacingToken.space8,
        M3SpacingToken.space12,
        M3SpacingToken.space16,
        M3SpacingToken.space20,
        M3SpacingToken.space24,
        M3SpacingToken.space28,
        M3SpacingToken.space32,
        M3SpacingToken.space36,
        M3SpacingToken.space40,
        M3SpacingToken.space48,
        M3SpacingToken.space56,
        M3SpacingToken.space64,
      ];

      for (final spacing in baseSpacings) {
        expect(spacing.value % 4, equals(0), 
            reason: '${spacing.value} should be divisible by 4');
      }
    });
  });

  group('M3MarginToken', () {
    test('returns correct values for all margin tokens', () {
      expect(M3MarginToken.compactScreen.value, equals(16));
      expect(M3MarginToken.mediumScreen.value, equals(24));
      expect(M3MarginToken.expandedScreen.value, equals(24));
      expect(M3MarginToken.largeScreen.value, equals(24));
      expect(M3MarginToken.extraLargeScreen.value, equals(24));
    });

    test('implements IM3SpacingToken interface', () {
      expect(M3MarginToken.compactScreen, isA<IM3SpacingToken>());
    });

    test('implements IM3Token interface', () {
      expect(M3MarginToken.compactScreen, isA<IM3Token<double>>());
    });

    test('compact screen has smaller margin than others', () {
      expect(M3MarginToken.compactScreen.value, 
          lessThan(M3MarginToken.mediumScreen.value));
    });
  });

  group('M3SpacerToken', () {
    test('returns correct value for pane spacer', () {
      expect(M3SpacerToken.pane.value, equals(24));
    });

    test('implements IM3SpacingToken interface', () {
      expect(M3SpacerToken.pane, isA<IM3SpacingToken>());
    });

    test('implements IM3Token interface', () {
      expect(M3SpacerToken.pane, isA<IM3Token<double>>());
    });
  });
}