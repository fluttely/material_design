import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3Motion', () {
    test('every scheme pairs the duration and curve M3 specifies', () {
      expect(M3Motion.emphasized.duration, M3MotionDuration.long2);
      expect(M3Motion.emphasized.curve, M3MotionCurve.emphasized);

      expect(M3Motion.emphasizedIncoming.duration, M3MotionDuration.long1);
      expect(
        M3Motion.emphasizedIncoming.curve,
        M3MotionCurve.emphasizedDecelerate,
      );

      expect(M3Motion.emphasizedOutgoing.duration, M3MotionDuration.short3);
      expect(
        M3Motion.emphasizedOutgoing.curve,
        M3MotionCurve.emphasizedAccelerate,
      );

      expect(M3Motion.standard.duration, M3MotionDuration.medium2);
      expect(M3Motion.standard.curve, M3MotionCurve.standard);
    });

    test('outgoing motion is faster than incoming, as M3 requires', () {
      expect(
        M3Motion.emphasizedOutgoing.duration,
        lessThan(M3Motion.emphasizedIncoming.duration),
      );
      expect(
        M3Motion.standardOutgoing.duration,
        lessThan(M3Motion.standardIncoming.duration),
      );
    });

    test('const aliases match their scheme', () {
      // These exist so const contexts have a way through; if they drift from
      // the schemes they are worse than useless.
      const pairs = <(Duration, Curve, M3Motion)>[
        (
          M3Motion.emphasizedDuration,
          M3Motion.emphasizedCurve,
          M3Motion.emphasized
        ),
        (
          M3Motion.emphasizedIncomingDuration,
          M3Motion.emphasizedIncomingCurve,
          M3Motion.emphasizedIncoming
        ),
        (
          M3Motion.emphasizedOutgoingDuration,
          M3Motion.emphasizedOutgoingCurve,
          M3Motion.emphasizedOutgoing
        ),
        (M3Motion.standardDuration, M3Motion.standardCurve, M3Motion.standard),
        (
          M3Motion.standardIncomingDuration,
          M3Motion.standardIncomingCurve,
          M3Motion.standardIncoming
        ),
        (
          M3Motion.standardOutgoingDuration,
          M3Motion.standardOutgoingCurve,
          M3Motion.standardOutgoing
        ),
        (M3Motion.linearDuration, M3Motion.linearCurve, M3Motion.linear),
      ];

      for (final (duration, curve, scheme) in pairs) {
        expect(duration, scheme.duration);
        expect(curve, scheme.curve);
      }
    });

    test('durationFor and curveFor cover every selector', () {
      for (final distance in M3MotionDistance.values) {
        expect(M3Motion.durationFor(distance), isA<M3MotionDuration>());
      }
      for (final type in M3MotionType.values) {
        expect(M3Motion.curveFor(type), isA<M3MotionCurve>());
      }
    });

    test('longer travel gets a longer duration', () {
      expect(
        M3Motion.durationFor(M3MotionDistance.short),
        lessThan(M3Motion.durationFor(M3MotionDistance.medium)),
      );
      expect(
        M3Motion.durationFor(M3MotionDistance.medium),
        lessThan(M3Motion.durationFor(M3MotionDistance.long)),
      );
      expect(
        M3Motion.durationFor(M3MotionDistance.long),
        lessThan(M3Motion.durationFor(M3MotionDistance.extraLong)),
      );
    });

    test('asTween applies the scheme curve', () {
      final tween = M3Motion.standard.asTween<double>(begin: 0, end: 1);
      expect(tween.transform(0), 0);
      expect(tween.transform(1), closeTo(1, 1e-6));
    });
  });

  group('M3MotionDuration', () {
    test('the sixteen tokens ascend from 50ms to 1000ms', () {
      const durations = <M3MotionDuration>[
        M3MotionDuration.short1,
        M3MotionDuration.short2,
        M3MotionDuration.short3,
        M3MotionDuration.short4,
        M3MotionDuration.medium1,
        M3MotionDuration.medium2,
        M3MotionDuration.medium3,
        M3MotionDuration.medium4,
        M3MotionDuration.long1,
        M3MotionDuration.long2,
        M3MotionDuration.long3,
        M3MotionDuration.long4,
        M3MotionDuration.extraLong1,
        M3MotionDuration.extraLong2,
        M3MotionDuration.extraLong3,
        M3MotionDuration.extraLong4,
      ];

      expect(durations.first.inMilliseconds, 50);
      expect(durations.last.inMilliseconds, 1000);
      for (var i = 1; i < durations.length; i++) {
        expect(durations[i], greaterThan(durations[i - 1]));
      }
    });
  });

  group('M3MotionCurve', () {
    test('every curve starts at 0 and ends at 1', () {
      const curves = <M3MotionCurve>[
        M3MotionCurve.emphasized,
        M3MotionCurve.emphasizedDecelerate,
        M3MotionCurve.emphasizedAccelerate,
        M3MotionCurve.standard,
        M3MotionCurve.standardDecelerate,
        M3MotionCurve.standardAccelerate,
        M3MotionCurve.linear,
      ];

      for (final curve in curves) {
        expect(curve.transform(0), closeTo(0, 1e-6));
        expect(curve.transform(1), closeTo(1, 1e-6));
      }
    });

    test('decelerate front-loads progress, accelerate back-loads it', () {
      expect(
        M3MotionCurve.standardDecelerate.transform(0.25),
        greaterThan(M3MotionCurve.standardAccelerate.transform(0.25)),
      );
    });
  });
}
