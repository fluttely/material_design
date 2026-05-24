import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3EdgeInsets', () {
    test('creates uniform edge insets correctly', () {
      const edgeInsets = M3EdgeInsets.all(M3Spacings.space16);

      expect(edgeInsets, isA<EdgeInsets>());
      expect(edgeInsets.left, equals(16));
      expect(edgeInsets.top, equals(16));
      expect(edgeInsets.right, equals(16));
      expect(edgeInsets.bottom, equals(16));
    });

    test('creates symmetric edge insets correctly', () {
      const edgeInsets = M3EdgeInsets.symmetric(
        horizontal: M3Spacings.space24,
        vertical: M3Spacings.space8,
      );

      expect(edgeInsets.left, equals(24));
      expect(edgeInsets.right, equals(24));
      expect(edgeInsets.top, equals(8));
      expect(edgeInsets.bottom, equals(8));
    });

    test('creates only edge insets correctly', () {
      const edgeInsets = M3EdgeInsets.only(
        left: M3Spacings.space4,
        top: M3Spacings.space8,
        right: M3Spacings.space12,
        bottom: M3Spacings.space16,
      );

      expect(edgeInsets.left, equals(4));
      expect(edgeInsets.top, equals(8));
      expect(edgeInsets.right, equals(12));
      expect(edgeInsets.bottom, equals(16));
    });

    test('uses default none when not specified', () {
      const edgeInsets = M3EdgeInsets.only();

      expect(edgeInsets.left, equals(0));
      expect(edgeInsets.top, equals(0));
      expect(edgeInsets.right, equals(0));
      expect(edgeInsets.bottom, equals(0));
    });

    test('symmetric constructor uses default none when not specified', () {
      const edgeInsets = M3EdgeInsets.symmetric();

      expect(edgeInsets.left, equals(0));
      expect(edgeInsets.top, equals(0));
      expect(edgeInsets.right, equals(0));
      expect(edgeInsets.bottom, equals(0));
    });

    test('extends EdgeInsets class', () {
      const edgeInsets = M3EdgeInsets.all(M3Spacings.space16);
      expect(edgeInsets, isA<EdgeInsets>());
    });

    test('works with margin tokens', () {
      const edgeInsets = M3EdgeInsets.all(M3Margins.compactScreen);

      expect(edgeInsets.left, equals(16));
      expect(edgeInsets.top, equals(16));
      expect(edgeInsets.right, equals(16));
      expect(edgeInsets.bottom, equals(16));
    });

    test('handles zero spacing', () {
      const edgeInsets = M3EdgeInsets.all(M3Spacings.none);

      expect(edgeInsets.left, equals(0));
      expect(edgeInsets.top, equals(0));
      expect(edgeInsets.right, equals(0));
      expect(edgeInsets.bottom, equals(0));
    });

    test('handles large spacing values', () {
      const edgeInsets = M3EdgeInsets.all(M3Spacings.space128);

      expect(edgeInsets.left, equals(128));
      expect(edgeInsets.top, equals(128));
      expect(edgeInsets.right, equals(128));
      expect(edgeInsets.bottom, equals(128));
    });

    test('supports asymmetric edge insets', () {
      const edgeInsets = M3EdgeInsets.only(
        left: M3Spacings.space8,
        right: M3Spacings.space32,
      );

      expect(edgeInsets.left, equals(8));
      expect(edgeInsets.top, equals(0));
      expect(edgeInsets.right, equals(32));
      expect(edgeInsets.bottom, equals(0));
    });

    test('supports partial symmetric specification', () {
      const horizontalOnly = M3EdgeInsets.symmetric(
        horizontal: M3Spacings.space20,
      );

      expect(horizontalOnly.left, equals(20));
      expect(horizontalOnly.right, equals(20));
      expect(horizontalOnly.top, equals(0));
      expect(horizontalOnly.bottom, equals(0));

      const verticalOnly = M3EdgeInsets.symmetric(
        vertical: M3Spacings.space12,
      );

      expect(verticalOnly.left, equals(0));
      expect(verticalOnly.right, equals(0));
      expect(verticalOnly.top, equals(12));
      expect(verticalOnly.bottom, equals(12));
    });

    test('integrates correctly with spacing token hierarchy', () {
      final spacings = [
        M3Spacings.none,
        M3Spacings.space4,
        M3Spacings.space8,
        M3Spacings.space16,
        M3Spacings.space32,
        M3Spacings.space64,
      ];

      for (final spacing in spacings) {
        final edgeInsets = M3EdgeInsets.all(spacing);
        final expectedValue = spacing;

        expect(edgeInsets.left, equals(expectedValue));
        expect(edgeInsets.top, equals(expectedValue));
        expect(edgeInsets.right, equals(expectedValue));
        expect(edgeInsets.bottom, equals(expectedValue));
      }
    });

    test('maintains immutability', () {
      const edgeInsets1 = M3EdgeInsets.all(M3Spacings.space16);
      const edgeInsets2 = M3EdgeInsets.all(M3Spacings.space16);

      expect(edgeInsets1.left, equals(edgeInsets2.left));
      expect(edgeInsets1.top, equals(edgeInsets2.top));
      expect(edgeInsets1.right, equals(edgeInsets2.right));
      expect(edgeInsets1.bottom, equals(edgeInsets2.bottom));
    });
  });
}
