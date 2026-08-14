// The spring tokens are @experimental by design; testing them opts in.
// ignore_for_file: experimental_member_use

import 'package:flutter/physics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3ESpring spec values', () {
    test('standard scheme spatial springs', () {
      expect(M3ESpring.standardSpatialSlow.damping, 0.9);
      expect(M3ESpring.standardSpatialSlow.stiffness, 300);
      expect(M3ESpring.standardSpatialDefault.damping, 0.9);
      expect(M3ESpring.standardSpatialDefault.stiffness, 700);
      expect(M3ESpring.standardSpatialFast.damping, 0.9);
      expect(M3ESpring.standardSpatialFast.stiffness, 1400);
    });

    test('expressive scheme spatial springs', () {
      expect(M3ESpring.expressiveSpatialSlow.damping, 0.8);
      expect(M3ESpring.expressiveSpatialSlow.stiffness, 200);
      expect(M3ESpring.expressiveSpatialDefault.damping, 0.8);
      expect(M3ESpring.expressiveSpatialDefault.stiffness, 380);
      expect(M3ESpring.expressiveSpatialFast.damping, 0.6);
      expect(M3ESpring.expressiveSpatialFast.stiffness, 800);
    });

    test('effects springs are identical across both schemes', () {
      // Expression belongs to movement, not to color: Material ships the same
      // effects springs in both schemes.
      for (final speed in M3MotionSpeed.values) {
        expect(
          M3MotionScheme.standard.effects(speed).damping,
          M3MotionScheme.expressive.effects(speed).damping,
        );
        expect(
          M3MotionScheme.standard.effects(speed).stiffness,
          M3MotionScheme.expressive.effects(speed).stiffness,
        );
      }
      expect(M3ESpring.standardEffectsSlow.stiffness, 800);
      expect(M3ESpring.standardEffectsDefault.stiffness, 1600);
      expect(M3ESpring.standardEffectsFast.stiffness, 3800);
    });
  });

  group('M3ESpring invariants', () {
    test('every effects spring is critically damped', () {
      for (final scheme in M3MotionScheme.values) {
        for (final speed in M3MotionSpeed.values) {
          final spring = scheme.effects(speed);
          expect(spring.damping, 1.0, reason: '$spring must not overshoot');
          expect(spring.isBouncy, isFalse);
        }
      }
    });

    test('expressive spatial springs bounce, standard ones barely do', () {
      for (final speed in M3MotionSpeed.values) {
        expect(
          M3MotionScheme.expressive.spatial(speed).damping,
          lessThan(M3MotionScheme.standard.spatial(speed).damping + 0.001),
          reason: 'expressive is never stiffer-damped than standard',
        );
        expect(M3MotionScheme.expressive.spatial(speed).isBouncy, isTrue);
      }
    });

    test('faster speeds are stiffer within a scheme and kind', () {
      for (final scheme in M3MotionScheme.values) {
        expect(
          scheme.spatial(M3MotionSpeed.slow).stiffness,
          lessThan(scheme.spatial(M3MotionSpeed.standard).stiffness),
        );
        expect(
          scheme.spatial(M3MotionSpeed.standard).stiffness,
          lessThan(scheme.spatial(M3MotionSpeed.fast).stiffness),
        );
        expect(
          scheme.effects(M3MotionSpeed.slow).stiffness,
          lessThan(scheme.effects(M3MotionSpeed.standard).stiffness),
        );
      }
    });

    test('expressive spatial motion is softer than standard', () {
      // The point of the expressive scheme: lower stiffness, more travel time.
      expect(
        M3ESpring.expressiveSpatialDefault.stiffness,
        lessThan(M3ESpring.standardSpatialDefault.stiffness),
      );
    });
  });

  group('M3MotionScheme selectors', () {
    test('springs covers all twelve tokens exactly once', () {
      final all = <M3ESpring>[
        ...M3MotionScheme.standard.springs,
        ...M3MotionScheme.expressive.springs,
      ];
      expect(all.toSet(), M3ESpring.values.toSet());
      expect(all, hasLength(M3ESpring.values.length));
    });

    test('spring(kind, speed) agrees with the direct selectors', () {
      for (final scheme in M3MotionScheme.values) {
        for (final speed in M3MotionSpeed.values) {
          expect(
            scheme.spring(M3MotionSpringKind.spatial, speed),
            scheme.spatial(speed),
          );
          expect(
            scheme.spring(M3MotionSpringKind.effects, speed),
            scheme.effects(speed),
          );
        }
      }
    });
  });

  group('Flutter interop', () {
    test('description carries the token values with unit mass', () {
      const token = M3ESpring.expressiveSpatialDefault;
      final description = token.description;
      final expected = SpringDescription.withDampingRatio(
        mass: 1,
        stiffness: token.stiffness,
        ratio: token.damping,
      );

      expect(description.mass, 1.0);
      expect(description.stiffness, 380.0);
      expect(description.damping, closeTo(expected.damping, 1e-9));
    });

    test('a bouncy simulation overshoots its target', () {
      final simulation = M3ESpring.expressiveSpatialFast.simulation(
        start: 0,
        end: 1,
      );

      var overshot = false;
      for (var t = 0.0; t < 2.0; t += 1 / 240) {
        if (simulation.x(t) > 1.0) {
          overshot = true;
          break;
        }
      }
      expect(overshot, isTrue);
    });

    test('a critically damped simulation never overshoots', () {
      final simulation = M3ESpring.standardEffectsDefault.simulation(
        start: 0,
        end: 1,
      );

      for (var t = 0.0; t < 2.0; t += 1 / 240) {
        expect(simulation.x(t), lessThanOrEqualTo(1.0 + 1e-6));
      }
    });

    test('simulations settle at their target', () {
      for (final spring in M3ESpring.values) {
        final simulation = spring.simulation(start: 0, end: 1);
        expect(
          simulation.x(5),
          closeTo(1, 0.01),
          reason: '$spring should have settled after 5s',
        );
        expect(simulation.isDone(5), isTrue, reason: '$spring should be done');
      }
    });

    test('initial velocity is carried into the simulation', () {
      final still = M3ESpring.expressiveSpatialDefault.simulation(
        start: 0,
        end: 1,
      );
      final flung = M3ESpring.expressiveSpatialDefault.simulation(
        start: 0,
        end: 1,
        velocity: 5,
      );

      expect(flung.x(0.05), greaterThan(still.x(0.05)));
    });
  });
}
