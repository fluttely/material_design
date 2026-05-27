import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('Material Design Package', () {
    test('package exports all necessary components', () {
      expect(M3Spacings.space16, isA<M3SpacingValue>());
      expect(M3Shape.medium, isA<RoundedRectangleBorder>());
      expect(M3BorderRadius.small, isA<M3BorderRadius>());
    });
  });
}
