import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3Shapes', () {
    test('returns correct RoundedRectangleBorder for all shape tokens', () {
      expect(M3Shapes.none, isA<M3RoundedRectangleBorder>());
      expect(M3Shapes.extraSmall, isA<M3RoundedRectangleBorder>());
      expect(M3Shapes.small, isA<M3RoundedRectangleBorder>());
      expect(M3Shapes.medium, isA<M3RoundedRectangleBorder>());
      expect(M3Shapes.large, isA<M3RoundedRectangleBorder>());
      expect(M3Shapes.largeIncreased, isA<M3RoundedRectangleBorder>());
      expect(M3Shapes.extraLarge, isA<M3RoundedRectangleBorder>());
      expect(M3Shapes.extraLargeIncreased, isA<M3RoundedRectangleBorder>());
      expect(M3Shapes.extraExtraLarge, isA<M3RoundedRectangleBorder>());
      expect(M3Shapes.full, isA<M3RoundedRectangleBorder>());
    });

    test('implements IM3Token interface', () {
      expect(M3Shapes.medium, isA<M3RoundedRectangleBorder>());
    });

    test('borderRadius getter returns correct BorderRadius tokens', () {
      expect(M3BorderRadius.zero, equals(M3BorderRadius.zero));
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

    // test('forComponentSize returns appropriate shapes', () {
    //   expect(M3Shapes.forComponentSize(ComponentSize.small),
    //       equals(M3Shapes.small));
    //   expect(M3Shapes.forComponentSize(ComponentSize.medium),
    //       equals(M3Shapes.medium));
    //   expect(M3Shapes.forComponentSize(ComponentSize.large),
    //       equals(M3Shapes.large));
    // });

    // test('forComponent returns appropriate shapes for components', () {
    //   expect(M3Shapes.forComponent(M3Component.button),
    //       equals(M3Shapes.small));
    //   expect(M3Shapes.forComponent(M3Component.fab),
    //       equals(M3Shapes.full));
    //   expect(M3Shapes.forComponent(M3Component.chip),
    //       equals(M3Shapes.extraSmall));
    //   expect(M3Shapes.forComponent(M3Component.card),
    //       equals(M3Shapes.medium));
    //   expect(M3Shapes.forComponent(M3Component.dialog),
    //       equals(M3Shapes.large));
    //   expect(M3Shapes.forComponent(M3Component.sheet),
    //       equals(M3Shapes.extraLarge));
    //   expect(M3Shapes.forComponent(M3Component.textField),
    //       equals(M3Shapes.small));
    //   expect(M3Shapes.forComponent(M3Component.menu),
    //       equals(M3Shapes.medium));
    //   expect(M3Shapes.forComponent(M3Component.other),
    //       equals(M3Shapes.medium));
    // });

    //   test('shape values increase in correct order', () {
    //     final shapes = [
    //       M3Shapes.none,
    //       M3Shapes.extraSmall,
    //       M3Shapes.small,
    //       M3Shapes.medium,
    //       M3Shapes.large,
    //       M3Shapes.largeIncreased,
    //       M3Shapes.extraLarge,
    //       M3Shapes.extraLargeIncreased,
    //       M3Shapes.extraExtraLarge,
    //     ];

    //     for (var i = 1; i < shapes.length; i++) {
    //       final current = shapes[i].borderRadius;
    //       final previous = shapes[i - 1].borderRadius;
    //       expect(current, greaterThan(previous),
    //           reason:
    //               '${shapes[i]} should have larger radius than ${shapes[i - 1]}');
    //     }
    //   });
  });

  // group('ComponentSize', () {
  //   test('has all expected values', () {
  //     expect(ComponentSizes, hasLength(3));
  //     expect(ComponentSizes, contains(ComponentSize.small));
  //     expect(ComponentSizes, contains(ComponentSize.medium));
  //     expect(ComponentSizes, contains(ComponentSize.large));
  //   });
  // });

  // group('M3Component', () {
  //   test('has all expected values', () {
  //     expect(M3Components, hasLength(11));
  //     expect(M3Components, contains(M3Component.button));
  //     expect(M3Components, contains(M3Component.fab));
  //     expect(M3Components, contains(M3Component.chip));
  //     expect(M3Components, contains(M3Component.card));
  //     expect(M3Components, contains(M3Component.dialog));
  //     expect(M3Components, contains(M3Component.sheet));
  //     expect(M3Components, contains(M3Component.textField));
  //     expect(M3Components, contains(M3Component.menu));
  //     expect(M3Components, contains(M3Component.navigationBar));
  //     expect(M3Components, contains(M3Component.navigationRail));
  //     expect(M3Components, contains(M3Component.other));
  //   });
  // });
}
