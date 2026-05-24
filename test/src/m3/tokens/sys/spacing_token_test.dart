import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3Spacings', () {
    test('returns correct values for all spacing tokens', () {
      expect(M3Spacings.none, equals(0));
      expect(M3Spacings.space4, equals(4));
      expect(M3Spacings.space8, equals(8));
      expect(M3Spacings.space12, equals(12));
      expect(M3Spacings.space16, equals(16));
      expect(M3Spacings.space20, equals(20));
      expect(M3Spacings.space24, equals(24));
      expect(M3Spacings.space28, equals(28));
      expect(M3Spacings.space32, equals(32));
      expect(M3Spacings.space36, equals(36));
      expect(M3Spacings.space40, equals(40));
      expect(M3Spacings.space48, equals(48));
      expect(M3Spacings.space56, equals(56));
      expect(M3Spacings.space64, equals(64));
      expect(M3Spacings.space72, equals(72));
      expect(M3Spacings.space80, equals(80));
      expect(M3Spacings.space96, equals(96));
      expect(M3Spacings.space128, equals(128));
      expect(M3Spacings.infinity, equals(double.infinity));
    });

    test('all tokens are M3SpacingValue', () {
      expect(M3Spacings.space16, isA<M3SpacingValue>());
    });

    test('spacing values follow 4dp grid system', () {
      final baseSpacings = [
        M3Spacings.space4,
        M3Spacings.space8,
        M3Spacings.space12,
        M3Spacings.space16,
        M3Spacings.space20,
        M3Spacings.space24,
        M3Spacings.space28,
        M3Spacings.space32,
        M3Spacings.space36,
        M3Spacings.space40,
        M3Spacings.space48,
        M3Spacings.space56,
        M3Spacings.space64,
      ];

      for (final spacing in baseSpacings) {
        expect(
          spacing % 4,
          equals(0),
          reason: '$spacing should be divisible by 4',
        );
      }
    });
  });

  group('M3Margins', () {
    test('returns correct values for all margin tokens', () {
      expect(M3Margins.compactScreen, equals(16));
      expect(M3Margins.mediumScreen, equals(24));
      expect(M3Margins.expandedScreen, equals(24));
      expect(M3Margins.largeScreen, equals(24));
      expect(M3Margins.extraLargeScreen, equals(24));
    });

    test('compact screen has smaller margin than others', () {
      expect(M3Margins.compactScreen, lessThan(M3Margins.mediumScreen));
    });
  });

  group('M3Spacers', () {
    test('returns correct value for pane spacer', () {
      expect(M3Spacers.pane, equals(24));
    });
  });
}
