import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3BorderRadius', () {
    test('creates uniform border radius correctly', () {
      final borderRadius = M3BorderRadius.all(M3RadiusToken.medium);

      expect(borderRadius, isA<BorderRadius>());
      expect(borderRadius.topLeft.x, equals(12));
      expect(borderRadius.topRight.x, equals(12));
      expect(borderRadius.bottomLeft.x, equals(12));
      expect(borderRadius.bottomRight.x, equals(12));
    });

    test('creates vertical border radius correctly', () {
      final borderRadius = M3BorderRadius.vertical(
        top: M3RadiusToken.large,
        bottom: M3RadiusToken.small,
      );

      expect(borderRadius.topLeft.x, equals(16));
      expect(borderRadius.topRight.x, equals(16));
      expect(borderRadius.bottomLeft.x, equals(8));
      expect(borderRadius.bottomRight.x, equals(8));
    });

    test('creates horizontal border radius correctly', () {
      final borderRadius = M3BorderRadius.horizontal(
        left: M3RadiusToken.extraSmall,
        right: M3RadiusToken.extraLarge,
      );

      expect(borderRadius.topLeft.x, equals(4));
      expect(borderRadius.bottomLeft.x, equals(4));
      expect(borderRadius.topRight.x, equals(28));
      expect(borderRadius.bottomRight.x, equals(28));
    });

    test('creates individual corner border radius correctly', () {
      final borderRadius = M3BorderRadius.only(
        topRight: M3RadiusToken.small,
        bottomLeft: M3RadiusToken.medium,
        bottomRight: M3RadiusToken.large,
      );

      expect(borderRadius.topLeft.x, equals(0));
      expect(borderRadius.topRight.x, equals(8));
      expect(borderRadius.bottomLeft.x, equals(12));
      expect(borderRadius.bottomRight.x, equals(16));
    });

    test('uses default none radius when not specified', () {
      final borderRadius = M3BorderRadius.only();

      expect(borderRadius.topLeft.x, equals(0));
      expect(borderRadius.topRight.x, equals(0));
      expect(borderRadius.bottomLeft.x, equals(0));
      expect(borderRadius.bottomRight.x, equals(0));
    });

    test('vertical constructor uses default none when not specified', () {
      final borderRadius = M3BorderRadius.vertical();

      expect(borderRadius.topLeft.x, equals(0));
      expect(borderRadius.topRight.x, equals(0));
      expect(borderRadius.bottomLeft.x, equals(0));
      expect(borderRadius.bottomRight.x, equals(0));
    });

    test('horizontal constructor uses default none when not specified', () {
      final borderRadius = M3BorderRadius.horizontal();

      expect(borderRadius.topLeft.x, equals(0));
      expect(borderRadius.topRight.x, equals(0));
      expect(borderRadius.bottomLeft.x, equals(0));
      expect(borderRadius.bottomRight.x, equals(0));
    });

    test('extends BorderRadius class', () {
      final borderRadius = M3BorderRadius.all(M3RadiusToken.medium);
      expect(borderRadius, isA<BorderRadius>());
    });

    test('works with full radius token', () {
      final borderRadius = M3BorderRadius.all(M3RadiusToken.full);

      expect(borderRadius.topLeft.x, equals(9999));
      expect(borderRadius.topRight.x, equals(9999));
      expect(borderRadius.bottomLeft.x, equals(9999));
      expect(borderRadius.bottomRight.x, equals(9999));
    });

    test('supports asymmetric border radius', () {
      final borderRadius = M3BorderRadius.only(
        topLeft: M3RadiusToken.extraSmall,
        bottomRight: M3RadiusToken.extraLarge,
      );

      expect(borderRadius.topLeft.x, equals(4));
      expect(borderRadius.topRight.x, equals(0));
      expect(borderRadius.bottomLeft.x, equals(0));
      expect(borderRadius.bottomRight.x, equals(28));
    });

    test('creates equal x and y values for circular radius', () {
      final borderRadius = M3BorderRadius.all(M3RadiusToken.medium);

      expect(borderRadius.topLeft.x, equals(borderRadius.topLeft.y));
      expect(borderRadius.topRight.x, equals(borderRadius.topRight.y));
      expect(borderRadius.bottomLeft.x, equals(borderRadius.bottomLeft.y));
      expect(borderRadius.bottomRight.x, equals(borderRadius.bottomRight.y));
    });

    test('integrates correctly with radius token hierarchy', () {
      final radii = [
        M3RadiusToken.none,
        M3RadiusToken.extraSmall,
        M3RadiusToken.small,
        M3RadiusToken.medium,
        M3RadiusToken.large,
        M3RadiusToken.extraLarge,
      ];

      for (final radius in radii) {
        final borderRadius = M3BorderRadius.all(radius);
        final expectedRadius = radius.value.x;

        expect(borderRadius.topLeft.x, equals(expectedRadius));
        expect(borderRadius.topRight.x, equals(expectedRadius));
        expect(borderRadius.bottomLeft.x, equals(expectedRadius));
        expect(borderRadius.bottomRight.x, equals(expectedRadius));
      }
    });
  });
}
