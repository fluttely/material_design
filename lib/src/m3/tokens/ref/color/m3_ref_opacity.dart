// /// Material Design 3 Reference Opacity Values
// /// 
// /// Contains the base opacity values used throughout the M3 design system.
// /// These are fundamental opacity levels used for state layers, disabled states,
// /// and visual hierarchy.
// ///
// /// Reference tokens represent the primitive values that form the foundation
// /// of your design system. These opacity values are used across all components
// /// to ensure consistent visual feedback and accessibility compliance.
// /// 
// /// ## Usage
// ///
// /// ```dart
// /// // Use for state layer overlays
// /// Container(
// ///   color: Colors.blue.withOpacity(M3RefOpacity.hover),
// /// )
// /// 
// /// // Use for disabled elements
// /// Opacity(
// ///   opacity: M3RefOpacity.disabled,
// ///   child: Button(),
// /// )
// /// ```
// ///
// /// ## Accessibility
// ///
// /// These opacity values are carefully chosen to meet WCAG accessibility
// /// guidelines while providing clear visual hierarchy and interaction feedback.
// /// 
// /// Reference: https://m3.material.io/styles/color/the-color-system/tokens
// abstract class M3RefOpacity {
//   /// Level 1 opacity (8%) - Very subtle, for hover states on low emphasis elements
//   ///
//   /// Used for subtle hover effects that provide feedback without being
//   /// visually overwhelming. Ideal for large interactive areas.
//   static const double level1 = 0.08;

//   /// Level 2 opacity (12%) - Subtle, for hover states on medium emphasis elements  
//   ///
//   /// Provides more noticeable feedback while remaining subtle enough
//   /// for frequent interactions.
//   static const double level2 = 0.12;

//   /// Level 3 opacity (16%) - Medium, for pressed states and focus indicators
//   ///
//   /// Clear visual feedback for active interactions and focus states,
//   /// ensuring users understand their current interaction context.
//   static const double level3 = 0.16;

//   /// Level 4 opacity (24%) - Medium-high, for selected states
//   ///
//   /// Strong enough to indicate selection while maintaining readability
//   /// of underlying content.
//   static const double level4 = 0.24;

//   /// Level 5 opacity (38%) - High, for disabled states
//   ///
//   /// Significant reduction in visual prominence to clearly communicate
//   /// that an element is unavailable for interaction.
//   static const double level5 = 0.38;

//   // === SEMANTIC STATE MAPPINGS ===
  
//   /// Hover state layer opacity (8%)
//   ///
//   /// Applied when users hover over interactive elements to provide
//   /// immediate visual feedback.
//   static const double hover = level1;
  
//   /// Focus state layer opacity (12%)
//   ///
//   /// Applied when elements receive keyboard focus, ensuring accessibility
//   /// for users navigating with assistive technologies.
//   static const double focus = level2;
  
//   /// Pressed state layer opacity (16%)
//   ///
//   /// Applied during the brief moment when users press/click elements,
//   /// providing tactile-like feedback.
//   static const double pressed = level3;
  
//   /// Selected state layer opacity (24%)
//   ///
//   /// Applied to elements that are currently selected in lists, menus,
//   /// or other selection contexts.
//   static const double selected = level4;
  
//   /// Disabled state opacity (38%)
//   ///
//   /// Applied to elements that are temporarily unavailable, reducing
//   /// their visual prominence significantly.
//   static const double disabled = level5;

//   // === CONTAINER OPACITIES ===
  
//   /// Container opacity (5%) - For subtle surface differentiation
//   ///
//   /// Used for very subtle background tinting of containers and surfaces
//   /// where minimal visual separation is needed.
//   static const double container = 0.05;
  
//   /// Overlay opacity (32%) - For modal overlays and backdrops
//   ///
//   /// Applied to modal backdrops and overlays to focus attention on
//   /// foreground content while maintaining visibility of background context.
//   static const double overlay = 0.32;
  
//   /// Scrim opacity (32%) - For modal scrims and image overlays
//   ///
//   /// Used for darkening backgrounds behind modals, dialogs, and
//   /// bottom sheets to create visual hierarchy and focus.
//   static const double scrim = 0.32;

//   // === ELEVATION TINT OPACITIES ===
  
//   /// Elevation tint opacities for surface coloring at different elevation levels
//   ///
//   /// These values determine how much surface tint (usually primary color) 
//   /// is applied to elevated surfaces to simulate Material Design's
//   /// color-on-elevation system.
//   static final Map<double, double> elevationTint = {
//     0.0: 0.0,    // No elevation, no tint
//     1.0: 0.05,   // Subtle tint for low elevation
//     3.0: 0.08,   // Light tint for medium-low elevation  
//     6.0: 0.11,   // Moderate tint for medium elevation
//     8.0: 0.12,   // Stronger tint for medium-high elevation
//     12.0: 0.14,  // Strong tint for high elevation
//   };

//   /// Get elevation tint opacity for a given elevation level
//   ///
//   /// This method interpolates between defined elevation levels to provide
//   /// smooth tint transitions for any elevation value.
//   ///
//   /// Parameters:
//   /// - [elevation]: The elevation level in dp
//   ///
//   /// Returns: The appropriate tint opacity for the given elevation
//   static double getElevationTintOpacity(double elevation) {
//     // Handle exact matches first
//     if (elevationTint.containsKey(elevation)) {
//       return elevationTint[elevation]!;
//     }
    
//     // Find the closest defined elevations for interpolation
//     final elevations = elevationTint.keys.toList()..sort();
    
//     // Handle elevations below the minimum
//     if (elevation <= elevations.first) {
//       return elevationTint[elevations.first]!;
//     }
    
//     // Handle elevations above the maximum with linear extrapolation
//     if (elevation >= elevations.last) {
//       return elevationTint[elevations.last]! + 
//              (elevation - elevations.last) * 0.005; // Gentle increase
//     }
    
//     // Interpolate between the two closest elevations
//     for (int i = 0; i < elevations.length - 1; i++) {
//       final lower = elevations[i];
//       final upper = elevations[i + 1];
      
//       if (elevation >= lower && elevation <= upper) {
//         final lowerOpacity = elevationTint[lower]!;
//         final upperOpacity = elevationTint[upper]!;
//         final t = (elevation - lower) / (upper - lower);
        
//         return lowerOpacity + (upperOpacity - lowerOpacity) * t;
//       }
//     }
    
//     return 0.0; // Fallback
//   }
// }