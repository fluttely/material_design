import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('IM3Token Interface', () {
    test('spacing tokens implement IM3Token correctly', () {
      const token = M3SpacingToken.space16;
      expect(token, isA<IM3Token<double>>());
      expect(token.value, isA<double>());
      expect(token.value, equals(16.0));
    });

    // test('shape tokens implement IM3Token correctly', () {
    //   const token = M3Shapes.medium;
    //   expect(token, isA<IM3Token<RoundedRectangleBorder>>());
    //   expect(token, isNotNull);
    // });

    test('margin tokens implement IM3Token correctly', () {
      const token = M3MarginToken.compactScreen;
      expect(token, isA<IM3Token<double>>());
      expect(token.value, isA<double>());
      expect(token.value, equals(16.0));
    });

    test('spacer tokens implement IM3Token correctly', () {
      const token = M3SpacerToken.pane;
      expect(token, isA<IM3Token<double>>());
      expect(token.value, isA<double>());
      expect(token.value, equals(24.0));
    });

    test('all tokens are immutable', () {
      // Test that tokens are const and immutable
      const token1 = M3SpacingToken.space16;
      const token2 = M3SpacingToken.space16;
      expect(identical(token1, token2), isTrue);

      const shapeToken1 = M3Shapes.medium;
      const shapeToken2 = M3Shapes.medium;
      expect(identical(shapeToken1, shapeToken2), isTrue);
    });

    test('token values are consistent across calls', () {
      final spacing1 = M3SpacingToken.space24.value;
      final spacing2 = M3SpacingToken.space24.value;
      expect(spacing1, equals(spacing2));

      const shape1 = M3Shapes.large;
      const shape2 = M3Shapes.large;
      expect(shape1, equals(shape2));
    });
  });

  group('IM3SpacingToken Interface', () {
    test('all spacing-related tokens implement IM3SpacingToken', () {
      expect(M3SpacingToken.space16, isA<IM3SpacingToken>());
      expect(M3MarginToken.compactScreen, isA<IM3SpacingToken>());
      expect(M3SpacerToken.pane, isA<IM3SpacingToken>());
    });

    test('IM3SpacingToken extends IM3Token<double>', () {
      const token = M3SpacingToken.space32;
      expect(token, isA<IM3Token<double>>());
      expect(token, isA<IM3SpacingToken>());
    });
  });
}
