// The emphasized scale is @experimental while Material iterates upstream.
// ignore_for_file: experimental_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3EmphasizedTypeScale', () {
    test('covers all 15 roles', () {
      expect(M3EmphasizedTypeScale.values, hasLength(15));
      expect(
        M3EmphasizedTypeScale.values,
        hasLength(M3TypeScale.values.length),
      );
    });

    test('preserves size and line height of every baseline role', () {
      // This is what makes an emphasized style a drop-in replacement: swapping
      // it in must never reflow the layout.
      for (var i = 0; i < M3TypeScale.values.length; i++) {
        final base = M3TypeScale.values[i];
        final emphasized = M3EmphasizedTypeScale.values[i];

        expect(emphasized.fontSize, base.fontSize, reason: 'size at $i');
        expect(emphasized.height, base.height, reason: 'line height at $i');
      }
    });

    test('every role is at least one weight step heavier', () {
      for (var i = 0; i < M3TypeScale.values.length; i++) {
        final base = M3TypeScale.values[i].fontWeight!;
        final emphasized = M3EmphasizedTypeScale.values[i].fontWeight!;

        expect(
          emphasized.value,
          greaterThan(base.value),
          reason: 'role $i must be heavier than its baseline',
        );
      }
    });

    test('follows the two spec weight relationships', () {
      // Regular roles become medium; roles already medium become bold.
      for (var i = 0; i < M3TypeScale.values.length; i++) {
        final base = M3TypeScale.values[i].fontWeight;
        final emphasized = M3EmphasizedTypeScale.values[i].fontWeight;

        if (base == FontWeight.w400) {
          expect(emphasized, FontWeight.w500, reason: 'role $i');
        } else {
          expect(base, FontWeight.w500, reason: 'unexpected baseline at $i');
          expect(emphasized, FontWeight.w700, reason: 'role $i');
        }
      }
    });

    test('spot-check spec values', () {
      expect(M3EmphasizedTypeScale.displayLarge.fontSize, 57);
      expect(M3EmphasizedTypeScale.displayLarge.fontWeight, FontWeight.w500);
      expect(M3EmphasizedTypeScale.displayLarge.letterSpacing, 0);

      expect(M3EmphasizedTypeScale.bodyLarge.fontWeight, FontWeight.w500);
      expect(M3EmphasizedTypeScale.bodyLarge.letterSpacing, 0.15);

      expect(M3EmphasizedTypeScale.labelSmall.fontSize, 11);
      expect(M3EmphasizedTypeScale.labelSmall.fontWeight, FontWeight.w700);
    });

    test('carries no color, like the baseline scale', () {
      for (final style in M3EmphasizedTypeScale.values) {
        expect(style.color, isNull);
      }
    });
  });

  group('M3EmphasizedTypeScale.of', () {
    test('maps every baseline style to its emphasized counterpart', () {
      for (var i = 0; i < M3TypeScale.values.length; i++) {
        expect(
          M3EmphasizedTypeScale.of(M3TypeScale.values[i]),
          M3EmphasizedTypeScale.values[i],
        );
      }
    });

    test('returns unknown styles unchanged', () {
      const custom = TextStyle(fontSize: 13.7);
      expect(M3EmphasizedTypeScale.of(custom), custom);
    });
  });

  group('M3TypeScale.values', () {
    test('is ordered display → headline → title → body → label', () {
      expect(M3TypeScale.values.first, M3TypeScale.displayLarge);
      expect(M3TypeScale.values.last, M3TypeScale.labelSmall);
      expect(M3TypeScale.values, hasLength(15));
    });

    test('titleSmall and labelLarge are metrically identical', () {
      // Not a bug: the M3 spec gives both roles 14sp / 20 line height /
      // 0.1 tracking / weight 500. They are distinct *roles* carrying the same
      // metrics, so the 15 styles collapse to 14 distinct TextStyle values.
      expect(M3TypeScale.titleSmall, M3TypeScale.labelLarge);
      expect(M3TypeScale.values.toSet(), hasLength(14));
    });

    test('their emphasized counterparts stay in step', () {
      // `of()` resolves by value, so the shared metrics would be a problem if
      // the two roles diverged under emphasis. They do not — both go to w700.
      expect(
        M3EmphasizedTypeScale.titleSmall,
        M3EmphasizedTypeScale.labelLarge,
      );
      expect(
        M3EmphasizedTypeScale.of(M3TypeScale.labelLarge),
        M3EmphasizedTypeScale.labelLarge,
      );
      expect(
        M3EmphasizedTypeScale.of(M3TypeScale.titleSmall),
        M3EmphasizedTypeScale.titleSmall,
      );
    });
  });
}
