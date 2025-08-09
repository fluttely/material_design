// part of '../../../../material_design.dart';

// // Example custom widgets that enforce token usage

// /// A container that only accepts Material Design 3 shape tokens.
// ///
// /// This widget provides a type-safe way to create containers that follow
// /// Material Design 3 guidelines by enforcing the use of design tokens for
// /// shapes and border radius values.
// ///
// /// You can specify either a [shape] or [borderRadius], but not both.
// /// If neither is provided, a standard Container without decoration is created.
// class M3Container extends StatelessWidget {
//   /// Creates an M3Container with Material Design 3 shape tokens.
//   ///
//   /// Either [shape] or [borderRadius] can be provided, but not both.
//   /// If both are null, creates a standard container without shape decoration.
//   const M3Container({
//     super.key,
//     this.child,
//     this.shape,
//     this.borderRadius,
//     this.color,
//     this.padding,
//     this.margin,
//     this.width,
//     this.height,
//   }) : assert(
//          shape == null || borderRadius == null,
//          'Cannot provide both shapeToken and borderRadiusToken',
//        );

//   /// The widget below this widget in the tree.
//   final Widget? child;

//   /// The Material Design 3 shape token to apply to the container.
//   ///
//   /// Cannot be used together with [borderRadius].
//   final M3Shape? shape;

//   /// The Material Design 3 border radius token to apply to the container.
//   ///
//   /// Cannot be used together with [shape].
//   final M3BorderRadius? borderRadius;

//   /// The color to paint behind the [child].
//   final Color? color;

//   /// Empty space to inscribe inside the container.
//   ///
//   /// The [child], if any, is placed inside this padding.
//   final EdgeInsetsGeometry? padding;

//   /// Empty space to surround the container.
//   final EdgeInsetsGeometry? margin;

//   /// The width of the container.
//   ///
//   /// If null, the container will be as wide as possible.
//   final double? width;

//   /// The height of the container.
//   ///
//   /// If null, the container will be as tall as possible.
//   final double? height;

//   @override
//   Widget build(BuildContext context) {
//     if (shape != null) {
//       return Container(
//         width: width,
//         height: height,
//         margin: margin,
//         padding: padding,
//         decoration: M3ShapeDecoration(
//           shape: shape!,
//           color: color,
//         ),
//         child: child,
//       );
//     } else if (borderRadius != null) {
//       return Container(
//         width: width,
//         height: height,
//         margin: margin,
//         padding: padding,
//         decoration: BoxDecoration(
//           borderRadius: borderRadius,
//           color: color,
//         ),
//         child: child,
//       );
//     } else {
//       return Container(
//         width: width,
//         height: height,
//         margin: margin,
//         padding: padding,
//         color: color,
//         child: child,
//       );
//     }
//   }
// }
