// test/styles/shape/shape_system_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('ShapeScale', () {
    test('should have correct M3 values', () {
      expect(ShapeScale.none, 0.0);
      expect(ShapeScale.extraSmall, 4.0);
      expect(ShapeScale.small, 8.0);
      expect(ShapeScale.medium, 12.0);
      expect(ShapeScale.large, 16.0);
      expect(ShapeScale.extraLarge, 28.0);
      expect(ShapeScale.full, 9999.0);
    });

    test('getFullRadius should calculate correctly', () {
      const size = Size(100, 50);
      expect(ShapeScale.getFullRadius(size), 25.0);
    });
  });

  group('CornerShape', () {
    test('should create uniform corners', () {
      const shape = CornerShape.all(10);
      expect(shape.topLeft, 10.0);
      expect(shape.topRight, 10.0);
      expect(shape.bottomLeft, 10.0);
      expect(shape.bottomRight, 10.0);
    });

    test('should convert to BorderRadius', () {
      const shape = CornerShape.top(16);
      final borderRadius = shape.toBorderRadius();

      expect(borderRadius.topLeft.x, 16.0);
      expect(borderRadius.topRight.x, 16.0);
      expect(borderRadius.bottomLeft.x, 0.0);
      expect(borderRadius.bottomRight.x, 0.0);
    });
  });

  group('ShapeScheme', () {
    test('should create correct shapes for corner family', () {
      final roundedScheme =
          ShapeScheme(cornerFamilyToken: ShapeFamilySystemTokens.rounded);
      final cutScheme =
          ShapeScheme(cornerFamilyToken: ShapeFamilySystemTokens.cut);

      final roundedShape =
          roundedScheme.getShape(ShapeScaleSystemTokens.medium);
      final cutShape = cutScheme.getShape(ShapeScaleSystemTokens.medium);

      expect(roundedShape, isA<RoundedRectangleBorder>());
      expect(cutShape, isA<BeveledRectangleBorder>());
    });
  });

  group('ComponentShapes', () {
    test('button should have full radius', () {
      final buttonShape = ComponentShapes.button as RoundedRectangleBorder;
      final radius = buttonShape.borderRadius as BorderRadius;

      expect(radius.topLeft.x, ShapeScale.full);
    });

    test('card should have medium radius', () {
      final cardShape = ComponentShapes.card as RoundedRectangleBorder;
      final radius = cardShape.borderRadius as BorderRadius;

      expect(radius.topLeft.x, ShapeScale.medium);
    });

    test('dialog should have extra large radius', () {
      final dialogShape = ComponentShapes.dialog as RoundedRectangleBorder;
      final radius = dialogShape.borderRadius as BorderRadius;

      expect(radius.topLeft.x, ShapeScale.extraLarge);
    });
  });
}
