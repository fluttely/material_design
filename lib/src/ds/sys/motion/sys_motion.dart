// import 'package:flutter/material.dart';
// import 'package:material_design/material_design.dart';

// /// Material Design 3 Motion Specifications
// /// Reference: https://m3.material.io/styles/motion/easing-and-duration/tokens
// @immutable
// class SysMotion extends ThemeExtension<SysMotion> {
//   // Duration tokens
//   final Duration short1;
//   final Duration short2;
//   final Duration short3;
//   final Duration short4;
//   final Duration medium1;
//   final Duration medium2;
//   final Duration medium3;
//   final Duration medium4;
//   final Duration long1;
//   final Duration long2;
//   final Duration long3;
//   final Duration long4;
//   final Duration extraLong1;
//   final Duration extraLong2;
//   final Duration extraLong3;
//   final Duration extraLong4;

//   // Easing tokens
//   final Curve emphasized;
//   final Curve emphasizedDecelerate;
//   final Curve emphasizedAccelerate;
//   final Curve standard;
//   final Curve standardDecelerate;
//   final Curve standardAccelerate;

//   SysMotion({
//     this.short1 = M3MotionDurationToken.short1
//         .value, // error: The property 'value' can't be accessed on the type 'M3MotionDurationToken' in a constant expression.
//     this.short2 = M3MotionDurationToken.short2.value,
//     this.short3 = M3MotionDurationToken.short3.value,
//     this.short4 = M3MotionDurationToken.short4.value,
//     this.medium1 = M3MotionDurationToken.medium1.value,
//     this.medium2 = M3MotionDurationToken.medium2.value,
//     this.medium3 = M3MotionDurationToken.medium3.value,
//     this.medium4 = M3MotionDurationToken.medium4.value,
//     this.long1 = M3MotionDurationToken.long1.value,
//     this.long2 = M3MotionDurationToken.long2.value,
//     this.long3 = M3MotionDurationToken.long3.value,
//     this.long4 = M3MotionDurationToken.long4.value,
//     this.extraLong1 = M3MotionDurationToken.extraLong1.value,
//     this.extraLong2 = M3MotionDurationToken.extraLong2.value,
//     this.extraLong3 = M3MotionDurationToken.extraLong3.value,
//     this.extraLong4 = M3MotionDurationToken.extraLong4.value,
//     this.emphasized = M3MotionEasingToken.emphasized.value,
//     this.emphasizedDecelerate = M3MotionEasingToken.emphasizedDecelerate.value,
//     this.emphasizedAccelerate = M3MotionEasingToken.emphasizedAccelerate.value,
//     this.standard = M3MotionEasingToken.standard.value,
//     this.standardDecelerate = M3MotionEasingToken.standardDecelerate.value,
//     this.standardAccelerate = M3MotionEasingToken.standardAccelerate.value,
//   });

//   @override
//   SysMotion copyWith({
//     Duration? short1,
//     Duration? short2,
//     Duration? short3,
//     Duration? short4,
//     Duration? medium1,
//     Duration? medium2,
//     Duration? medium3,
//     Duration? medium4,
//     Duration? long1,
//     Duration? long2,
//     Duration? long3,
//     Duration? long4,
//     Duration? extraLong1,
//     Duration? extraLong2,
//     Duration? extraLong3,
//     Duration? extraLong4,
//     Curve? emphasized,
//     Curve? emphasizedDecelerate,
//     Curve? emphasizedAccelerate,
//     Curve? standard,
//     Curve? standardDecelerate,
//     Curve? standardAccelerate,
//   }) {
//     return SysMotion(
//       short1: short1 ?? this.short1,
//       short2: short2 ?? this.short2,
//       short3: short3 ?? this.short3,
//       short4: short4 ?? this.short4,
//       medium1: medium1 ?? this.medium1,
//       medium2: medium2 ?? this.medium2,
//       medium3: medium3 ?? this.medium3,
//       medium4: medium4 ?? this.medium4,
//       long1: long1 ?? this.long1,
//       long2: long2 ?? this.long2,
//       long3: long3 ?? this.long3,
//       long4: long4 ?? this.long4,
//       extraLong1: extraLong1 ?? this.extraLong1,
//       extraLong2: extraLong2 ?? this.extraLong2,
//       extraLong3: extraLong3 ?? this.extraLong3,
//       extraLong4: extraLong4 ?? this.extraLong4,
//       emphasized: emphasized ?? this.emphasized,
//       emphasizedDecelerate: emphasizedDecelerate ?? this.emphasizedDecelerate,
//       emphasizedAccelerate: emphasizedAccelerate ?? this.emphasizedAccelerate,
//       standard: standard ?? this.standard,
//       standardDecelerate: standardDecelerate ?? this.standardDecelerate,
//       standardAccelerate: standardAccelerate ?? this.standardAccelerate,
//     );
//   }

//   @override
//   SysMotion lerp(ThemeExtension<SysMotion>? other, double t) {
//     if (other is! SysMotion) return this;

//     // For curves, we don't interpolate - we switch at midpoint
//     // For durations, we could interpolate but for consistency we also switch
//     return t < 0.5 ? this : other;
//   }

//   /// Get appropriate duration based on distance or complexity
//   Duration getDuration(MotionDistance distance) {
//     return M3MotionDurationToken.getDuration(distance);
//   }

//   /// Get appropriate easing based on motion type
//   Curve getEasing(MotionType type) {
//     return M3MotionEasingToken.getEasing(type);
//   }
// }
