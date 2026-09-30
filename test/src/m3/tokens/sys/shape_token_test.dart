import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3Corners', () {
    test('the three levels added by the 2025 update carry spec values', () {
      expect(M3Corners.largeIncreased, 20);
      expect(M3Corners.extraLargeIncreased, 32);
      expect(M3Corners.extraExtraLarge, 48);
    });

    test('each added level sits between its neighbours', () {
      expect(M3Corners.largeIncreased, greaterThan(M3Corners.large));
      expect(M3Corners.largeIncreased, lessThan(M3Corners.extraLarge));
      expect(M3Corners.extraLargeIncreased, greaterThan(M3Corners.extraLarge));
      expect(M3Corners.extraExtraLarge,
          greaterThan(M3Corners.extraLargeIncreased));
      expect(M3Corners.extraExtraLarge, lessThan(M3Corners.full));
    });
  });

  group('M3Shape', () {
    test('all 10 corner radius levels exist', () {
      expect(M3Shape.none, isA<M3Shape>());
      expect(M3Shape.extraSmall, isA<M3Shape>());
      expect(M3Shape.small, isA<M3Shape>());
      expect(M3Shape.medium, isA<M3Shape>());
      expect(M3Shape.large, isA<M3Shape>());
      expect(M3Shape.largeIncreased, isA<M3Shape>());
      expect(M3Shape.extraLarge, isA<M3Shape>());
      expect(M3Shape.extraLargeIncreased, isA<M3Shape>());
      expect(M3Shape.extraExtraLarge, isA<M3Shape>());
      expect(M3Shape.full, isA<M3Shape>());
    });

    test('implements RoundedRectangleBorder', () {
      expect(M3Shape.medium, isA<RoundedRectangleBorder>());
    });

    test('borderRadius values match shape scale', () {
      expect(M3BorderRadius.none, equals(M3BorderRadius.none));
      expect(M3BorderRadius.extraSmall.topLeft.x, equals(4));
      expect(M3BorderRadius.small.topLeft.x, equals(8));
      expect(M3BorderRadius.medium.topLeft.x, equals(12));
      expect(M3BorderRadius.large.topLeft.x, equals(16));
      expect(M3BorderRadius.largeIncreased.topLeft.x, equals(20));
      expect(M3BorderRadius.extraLarge.topLeft.x, equals(28));
      expect(M3BorderRadius.extraLargeIncreased.topLeft.x, equals(32));
      expect(M3BorderRadius.extraExtraLarge.topLeft.x, equals(48));
      expect(M3BorderRadius.full.topLeft.x, equals(9999));
    });

    test('every level of the four shape classes reads the same token', () {
      const radii = <M3Radius>[
        M3Radius.none,
        M3Radius.extraSmall,
        M3Radius.small,
        M3Radius.medium,
        M3Radius.large,
        M3Radius.largeIncreased,
        M3Radius.extraLarge,
        M3Radius.extraLargeIncreased,
        M3Radius.extraExtraLarge,
        M3Radius.full,
      ];
      const borderRadii = <M3BorderRadius>[
        M3BorderRadius.none,
        M3BorderRadius.extraSmall,
        M3BorderRadius.small,
        M3BorderRadius.medium,
        M3BorderRadius.large,
        M3BorderRadius.largeIncreased,
        M3BorderRadius.extraLarge,
        M3BorderRadius.extraLargeIncreased,
        M3BorderRadius.extraExtraLarge,
        M3BorderRadius.full,
      ];
      const shapes = <M3Shape>[
        M3Shape.none,
        M3Shape.extraSmall,
        M3Shape.small,
        M3Shape.medium,
        M3Shape.large,
        M3Shape.largeIncreased,
        M3Shape.extraLarge,
        M3Shape.extraLargeIncreased,
        M3Shape.extraExtraLarge,
        M3Shape.full,
      ];
      for (var i = 0; i < M3Corners.values.length; i++) {
        final corner = M3Corners.values[i];
        expect(radii[i].x, corner, reason: 'M3Radius level $i');
        expect(borderRadii[i].topLeft.x, corner, reason: 'M3BorderRadius $i');
        expect(
          (shapes[i].borderRadius as BorderRadius).topLeft.x,
          corner,
          reason: 'M3Shape level $i',
        );
      }
    });
  });
}
