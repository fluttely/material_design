import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('Material Design Package', () {
    test('package exports all necessary components', () {
      // Test that main exports are available
      expect(M3SpacingToken.space16, isA<M3SpacingToken>());
      expect(M3Shape.medium, isA<RoundedRectangleBorder>());
      expect(const M3BorderRadius.all(M3Radius.small), isA<M3BorderRadius>());
    });
  });
}
