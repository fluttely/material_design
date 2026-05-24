import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3Shape', () {
    test('all 7 shape scale tokens exist', () {
      expect(M3Shape.none, isA<M3Shape>());
      expect(M3Shape.extraSmall, isA<M3Shape>());
      expect(M3Shape.small, isA<M3Shape>());
      expect(M3Shape.medium, isA<M3Shape>());
      expect(M3Shape.large, isA<M3Shape>());
      expect(M3Shape.extraLarge, isA<M3Shape>());
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
      expect(M3BorderRadius.extraLarge.topLeft.x, equals(28));
      expect(M3BorderRadius.full.topLeft.x, equals(9999));
    });
  });
}
