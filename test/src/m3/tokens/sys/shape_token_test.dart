import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3ShapeToken', () {
    test('returns correct RoundedRectangleBorder for all shape tokens', () {
      expect(M3ShapeToken.none.value, isA<RoundedRectangleBorder>());
      expect(M3ShapeToken.extraSmall.value, isA<RoundedRectangleBorder>());
      expect(M3ShapeToken.small.value, isA<RoundedRectangleBorder>());
      expect(M3ShapeToken.medium.value, isA<RoundedRectangleBorder>());
      expect(M3ShapeToken.large.value, isA<RoundedRectangleBorder>());
      expect(M3ShapeToken.largeIncreased.value, isA<RoundedRectangleBorder>());
      expect(M3ShapeToken.extraLarge.value, isA<RoundedRectangleBorder>());
      expect(M3ShapeToken.extraLargeIncreased.value,
          isA<RoundedRectangleBorder>());
      expect(M3ShapeToken.extraExtraLarge.value, isA<RoundedRectangleBorder>());
      expect(M3ShapeToken.full.value, isA<RoundedRectangleBorder>());
    });

    test('implements IM3Token interface', () {
      expect(M3ShapeToken.medium, isA<IM3Token<RoundedRectangleBorder>>());
    });

    test('borderRadius getter returns correct BorderRadius tokens', () {
      expect(M3BorderRadiusToken.none.value, equals(BorderRadius.zero));
      expect(M3BorderRadiusToken.extraSmall.value.topLeft.x, equals(4));
      expect(M3BorderRadiusToken.small.value.topLeft.x, equals(8));
      expect(M3BorderRadiusToken.medium.value.topLeft.x, equals(12));
      expect(M3BorderRadiusToken.large.value.topLeft.x, equals(16));
      expect(M3BorderRadiusToken.largeIncreased.value.topLeft.x, equals(20));
      expect(M3BorderRadiusToken.extraLarge.value.topLeft.x, equals(28));
      expect(
          M3BorderRadiusToken.extraLargeIncreased.value.topLeft.x, equals(32));
      expect(M3BorderRadiusToken.extraExtraLarge.value.topLeft.x, equals(48));
      expect(M3BorderRadiusToken.full.value.topLeft.x, equals(9999));
    });

    test('forComponentSize returns appropriate shapes', () {
      expect(M3ShapeToken.forComponentSize(ComponentSize.small),
          equals(M3ShapeToken.small));
      expect(M3ShapeToken.forComponentSize(ComponentSize.medium),
          equals(M3ShapeToken.medium));
      expect(M3ShapeToken.forComponentSize(ComponentSize.large),
          equals(M3ShapeToken.large));
    });

    test('forComponent returns appropriate shapes for components', () {
      expect(M3ShapeToken.forComponent(M3Component.button),
          equals(M3ShapeToken.small));
      expect(M3ShapeToken.forComponent(M3Component.fab),
          equals(M3ShapeToken.full));
      expect(M3ShapeToken.forComponent(M3Component.chip),
          equals(M3ShapeToken.extraSmall));
      expect(M3ShapeToken.forComponent(M3Component.card),
          equals(M3ShapeToken.medium));
      expect(M3ShapeToken.forComponent(M3Component.dialog),
          equals(M3ShapeToken.large));
      expect(M3ShapeToken.forComponent(M3Component.sheet),
          equals(M3ShapeToken.extraLarge));
      expect(M3ShapeToken.forComponent(M3Component.textField),
          equals(M3ShapeToken.small));
      expect(M3ShapeToken.forComponent(M3Component.menu),
          equals(M3ShapeToken.medium));
      expect(M3ShapeToken.forComponent(M3Component.other),
          equals(M3ShapeToken.medium));
    });

    test('shape values increase in correct order', () {
      final shapes = [
        M3ShapeToken.none,
        M3ShapeToken.extraSmall,
        M3ShapeToken.small,
        M3ShapeToken.medium,
        M3ShapeToken.large,
        M3ShapeToken.largeIncreased,
        M3ShapeToken.extraLarge,
        M3ShapeToken.extraLargeIncreased,
        M3ShapeToken.extraExtraLarge,
      ];

      for (var i = 1; i < shapes.length; i++) {
        final current = shapes[i].borderRadius.value.topLeft.x;
        final previous = shapes[i - 1].borderRadius.value.topLeft.x;
        expect(current, greaterThan(previous),
            reason:
                '${shapes[i]} should have larger radius than ${shapes[i - 1]}');
      }
    });
  });

  group('ComponentSize', () {
    test('has all expected values', () {
      expect(ComponentSize.values, hasLength(3));
      expect(ComponentSize.values, contains(ComponentSize.small));
      expect(ComponentSize.values, contains(ComponentSize.medium));
      expect(ComponentSize.values, contains(ComponentSize.large));
    });
  });

  group('M3Component', () {
    test('has all expected values', () {
      expect(M3Component.values, hasLength(11));
      expect(M3Component.values, contains(M3Component.button));
      expect(M3Component.values, contains(M3Component.fab));
      expect(M3Component.values, contains(M3Component.chip));
      expect(M3Component.values, contains(M3Component.card));
      expect(M3Component.values, contains(M3Component.dialog));
      expect(M3Component.values, contains(M3Component.sheet));
      expect(M3Component.values, contains(M3Component.textField));
      expect(M3Component.values, contains(M3Component.menu));
      expect(M3Component.values, contains(M3Component.navigationBar));
      expect(M3Component.values, contains(M3Component.navigationRail));
      expect(M3Component.values, contains(M3Component.other));
    });
  });
}
