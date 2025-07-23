// /// Material Design 3 Reference Opacity Values
// /// 
// /// Contains the base opacity values used throughout the M3 design system.
// /// These are fundamental opacity levels used for state layers, disabled states,
// /// and visual hierarchy.
// /// 
// /// Based on: https://m3.material.io/styles/color/the-color-system/tokens
// abstract class M3RefOpacity {
//   /// Level 1 opacity - Very subtle, for hover states on low emphasis elements
//   static const double level1 = 0.08;

//   /// Level 2 opacity - Subtle, for hover states on medium emphasis elements  
//   static const double level2 = 0.12;

//   /// Level 3 opacity - Medium, for pressed states and focus indicators
//   static const double level3 = 0.16;

//   /// Level 4 opacity - Medium-high, for selected states
//   static const double level4 = 0.24;

//   /// Level 5 opacity - High, for disabled states
//   static const double level5 = 0.38;

//   /// State layer opacities for different interaction states
//   static const double hover = level1;
//   static const double focus = level2;
//   static const double pressed = level3;
//   static const double selected = level4;
//   static const double disabled = level5;

//   /// Container opacities for surfaces and overlays
//   static const double container = 0.05;
//   static const double overlay = 0.32;
//   static const double scrim = 0.32;

//   /// Elevation tint opacities for surface coloring
//   static final Map<double, double> elevationTint = {
//     0.0: 0.0,
//     1.0: 0.05,
//     3.0: 0.08,
//     6.0: 0.11,
//     8.0: 0.12,
//     12.0: 0.14,
//   };

//   /// Get elevation tint opacity for a given elevation level
//   static double getElevationTintOpacity(double elevation) {
//     // Find the closest defined elevation
//     final elevations = elevationTint.keys.toList()..sort();
    
//     for (int i = 0; i < elevations.length; i++) {
//       if (elevation <= elevations[i]) {
//         return elevationTint[elevations[i]]!;
//       }
//     }
    
//     // For elevations higher than defined, use interpolation
//     if (elevation > elevations.last) {
//       return elevationTint[elevations.last]! + 
//              (elevation - elevations.last) * 0.01;
//     }
    
//     return 0.0;
//   }
// }