// part of '../../../../../material_design.dart';

// /// Utility functions for working with Material Design 3 shapes.
// ///
// /// Provides component-specific shape mapping, shape manipulation,
// /// and responsive shape utilities.
// @immutable
// abstract interface class M3ShapeUtils {
//   // --- Component Shape Mapping ---

//   /// Gets the appropriate shape for a component type and variant.
//   static BorderRadius getComponentShape(
//     String componentType, {
//     String? variant,
//     String? size,
//   }) {
//     switch (componentType.toLowerCase()) {
//       case 'button':
//         switch (size?.toLowerCase()) {
//           case 'small':
//             return M3ShapeToken.extraSmall;
//           case 'large':
//             return M3ShapeToken.medium;
//           default:
//             return M3ShapeToken.small;
//         }

//       case 'fab':
//         return variant == 'extended' ? M3ShapeToken.large : M3ShapeToken.large;

//       case 'card':
//         return M3ShapeToken.medium;

//       case 'textfield':
//         return variant == 'outlined'
//             ? M3ShapeToken.extraSmall
//             : M3ShapeToken.extraSmall;

//       case 'chip':
//         return M3ShapeToken.small;

//       case 'bottomsheet':
//         return BorderRadius.vertical(
//           top: M3ShapeToken.extraSmall.borderRadius.radius.value,
//         );

//       case 'dialog':
//         return M3ShapeToken.extraLarge;

//       case 'menu':
//         return M3ShapeToken.extraSmall;

//       case 'snackbar':
//         return M3ShapeToken.extraSmall;

//       case 'searchbar':
//         return M3ShapeToken.full;

//       default:
//         return BorderRadius.zero;
//     }
//   }

//   // --- Shape Families ---

//   /// Creates a rounded shape with the specified radius.
//   static BorderRadius rounded(double radius) {
//     return BorderRadius.circular(radius);
//   }

//   /// Creates a squared shape (no rounding).
//   static BorderRadius squared() {
//     return BorderRadius.zero;
//   }

//   /// Creates an asymmetric shape with different corner radii.
//   static BorderRadius asymmetric({
//     double topLeft = 0,
//     double topRight = 0,
//     double bottomLeft = 0,
//     double bottomRight = 0,
//   }) {
//     return BorderRadius.only(
//       topLeft: Radius.circular(topLeft),
//       topRight: Radius.circular(topRight),
//       bottomLeft: Radius.circular(bottomLeft),
//       bottomRight: Radius.circular(bottomRight),
//     );
//   }

//   /// Creates a shape with rounding only on the top corners.
//   static BorderRadius topRounded(double radius) {
//     return BorderRadius.vertical(top: Radius.circular(radius));
//   }

//   /// Creates a shape with rounding only on the bottom corners.
//   static BorderRadius bottomRounded(double radius) {
//     return BorderRadius.vertical(bottom: Radius.circular(radius));
//   }

//   /// Creates a shape with rounding only on the left corners.
//   static BorderRadius leftRounded(double radius) {
//     return BorderRadius.horizontal(left: Radius.circular(radius));
//   }

//   /// Creates a shape with rounding only on the right corners.
//   static BorderRadius rightRounded(double radius) {
//     return BorderRadius.horizontal(right: Radius.circular(radius));
//   }

//   // --- Shape Validation and Manipulation ---

//   /// Validates if a radius value is within acceptable range.
//   static bool isValidRadius(double radius) {
//     return radius >= 0 && radius <= 9999;
//   }

//   /// Clamps a radius value to the acceptable range.
//   static double clampRadius(double radius) {
//     return radius.clamp(0.0, 9999.0);
//   }

//   /// Interpolates between two BorderRadius values.
//   static BorderRadius lerpShape(BorderRadius a, BorderRadius b, double t) {
//     return BorderRadius.lerp(a, b, t) ?? a;
//   }

//   /// Scales a BorderRadius by a given factor.
//   static BorderRadius scaleShape(BorderRadius shape, double scaleFactor) {
//     return BorderRadius.only(
//       topLeft: Radius.circular(shape.topLeft.x * scaleFactor),
//       topRight: Radius.circular(shape.topRight.x * scaleFactor),
//       bottomLeft: Radius.circular(shape.bottomLeft.x * scaleFactor),
//       bottomRight: Radius.circular(shape.bottomRight.x * scaleFactor),
//     );
//   }

//   // --- Responsive Shape Utilities ---

//   /// Creates a responsive shape that adapts to screen size.
//   static BorderRadius responsiveShape({
//     required BuildContext context,
//     BorderRadius? small,
//     BorderRadius? medium,
//     BorderRadius? large,
//   }) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (screenWidth < M3BreakpointToken.medium.value) {
//       return small ?? M3ShapeToken.small;
//     } else if (screenWidth < M3BreakpointToken.large.value) {
//       return medium ?? M3ShapeToken.medium;
//     } else {
//       return large ?? M3ShapeToken.large;
//     }
//   }

//   /// Adapts shape based on visual density.
//   static BorderRadius densityAdaptedShape({
//     required BuildContext context,
//     required BorderRadius baseShape,
//   }) {
//     final visualDensity = Theme.of(context).visualDensity;

//     if (visualDensity.horizontal < -1) {
//       // Compact density - reduce radius
//       return scaleShape(baseShape, 0.8);
//     } else if (visualDensity.horizontal > 1) {
//       // Comfortable density - increase radius
//       return scaleShape(baseShape, 1.2);
//     } else {
//       // Standard density
//       return baseShape;
//     }
//   }

//   // --- Accessibility Enhancements ---

//   /// Creates a high contrast shape variant.
//   static BorderRadius highContrastShape(BorderRadius baseShape) {
//     // Slightly reduce corner radius for better edge definition
//     return scaleShape(baseShape, 0.8);
//   }

//   /// Creates a decoration with accessible shape and borders.
//   static Decoration accessibleDecoration({
//     required BorderRadius borderRadius,
//     required Color backgroundColor,
//     required Color borderColor,
//     double borderWidth = 2.0,
//   }) {
//     return M3BoxDecoration(
//       color: backgroundColor,
//       shape: borderRadius,
//       border: M3Border.all(
//         color: borderColor,
//         width: borderWidth,
//       ),
//     );
//   }

//   // --- Shape Animation Helpers ---

//   /// Creates an animated container with shape transitions.
//   static Widget animatedShape({
//     required Widget child,
//     required BorderRadius shape,
//     Duration duration = const Duration(milliseconds: 200),
//     Curve curve = Curves.easeInOut,
//     Color? backgroundColor,
//     Border? border,
//   }) {
//     return AnimatedContainer(
//       duration: duration,
//       curve: curve,
//       decoration: M3BoxDecoration(
//         color: backgroundColor,
//         shape: shape,
//         border: border,
//       ),
//       child: child,
//     );
//   }

//   // --- Brand Shape Utilities ---

//   /// Creates a brand-specific shape style.
//   static BorderRadius brandShape({
//     required double primary,
//     double? secondary,
//     BrandShapeStyle style = BrandShapeStyle.consistent,
//   }) {
//     final secondaryRadius = secondary ?? primary;

//     switch (style) {
//       case BrandShapeStyle.consistent:
//         return BorderRadius.circular(primary);

//       case BrandShapeStyle.playful:
//         return asymmetric(
//           topLeft: primary,
//           topRight: secondaryRadius,
//           bottomLeft: secondaryRadius,
//           bottomRight: primary,
//         );

//       case BrandShapeStyle.modern:
//         return asymmetric(
//           topLeft: primary,
//           bottomRight: primary,
//         );

//       case BrandShapeStyle.organic:
//         return BorderRadius.only(
//           topLeft: Radius.elliptical(primary, secondaryRadius),
//           topRight: Radius.elliptical(secondaryRadius, primary),
//           bottomLeft: Radius.elliptical(secondaryRadius, primary),
//           bottomRight: Radius.elliptical(primary, secondaryRadius),
//         );
//     }
//   }
// }

// /// Different brand shape styles for customization.
// enum BrandShapeStyle {
//   /// Consistent rounding on all corners.
//   consistent,

//   /// Playful asymmetric rounding.
//   playful,

//   /// Modern cut-corner style.
//   modern,

//   /// Organic elliptical rounding.
//   organic,
// }
