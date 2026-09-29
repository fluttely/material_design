// The spring tokens are @experimental by design; testing them opts in.
// ignore_for_file: experimental_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3Accessibility reduced motion', () {
    Future<M3ESpring> resolve(
      WidgetTester tester, {
      required bool disableAnimations,
      required M3ESpring spring,
    }) async {
      late M3ESpring resolved;
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(disableAnimations: disableAnimations),
          child: Builder(
            builder: (context) {
              resolved = M3Accessibility.adaptiveSpring(context, spring);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
      return resolved;
    }

    testWidgets('shouldReduceMotion reads the platform setting', (
      tester,
    ) async {
      late bool reduce;
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(disableAnimations: true),
          child: Builder(
            builder: (context) {
              reduce = M3Accessibility.shouldReduceMotion(context);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
      expect(reduce, isTrue);
    });

    testWidgets('adaptiveSpring passes the spring through by default', (
      tester,
    ) async {
      for (final spring in M3ESpring.values) {
        expect(
          await resolve(tester, disableAnimations: false, spring: spring),
          spring,
        );
      }
    });

    testWidgets('adaptiveSpring removes the bounce under reduced motion', (
      tester,
    ) async {
      for (final spring in M3ESpring.values) {
        final resolved = await resolve(
          tester,
          disableAnimations: true,
          spring: spring,
        );
        expect(resolved, spring.reduced, reason: '$spring');
        expect(resolved.isBouncy, isFalse, reason: '$spring');
      }
    });
  });
}
