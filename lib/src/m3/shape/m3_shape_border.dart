// part of '../../../../../material_design.dart';

// /// Custom ShapeBorder that enforces Material Design 3 shape tokens.
// ///
// /// This is an abstract base class for M3 shape borders. For most use cases,
// /// use [M3RoundedRectangleBorder] or one of its predefined constants.
// abstract class M3ShapeBorder extends ShapeBorder {
//   /// Creates a Material Design 3 shape border.
//   const M3ShapeBorder();

//   /// Creates a rounded rectangle border with uniform corners.
//   const factory M3ShapeBorder.roundedRectangle({
//     M3BorderSide side,
//     M3BorderRadius borderRadius,
//   }) =
//       M3RoundedRectangleBorder; // error: The return type 'M3RoundedRectangleBorder' of the redirected constructor isn't a subtype of 'M3ShapeBorder'.
// // Try redirecting to a different constructor.

//   /// Creates a circular border.
//   const factory M3ShapeBorder.circle({
//     M3BorderSide side,
//   }) = M3CircleBorder;

//   /// Creates a stadium (pill) shaped border.
//   const factory M3ShapeBorder.stadium({
//     M3BorderSide side,
//   }) = M3StadiumBorder;

//   // Predefined shapes for common use cases

//   /// Sharp rectangular shape with no corner rounding.
//   static const M3ShapeBorder none = M3RoundedRectangleBorder();

//   /// Extra small rounded rectangular shape (4dp corners).
//   static const M3ShapeBorder extraSmall = M3RoundedRectangleBorder(
//     borderRadius: M3BorderRadius.all(M3Radius.extraSmall),
//   );

//   /// Small rounded rectangular shape (8dp corners).
//   static const M3ShapeBorder small = M3RoundedRectangleBorder(
//     borderRadius: M3BorderRadius.all(M3Radius.small),
//   );

//   /// Medium rounded rectangular shape (12dp corners).
//   static const M3ShapeBorder medium = M3RoundedRectangleBorder(
//     borderRadius: M3BorderRadius.all(M3Radius.medium),
//   );

//   /// Large rounded rectangular shape (16dp corners).
//   static const M3ShapeBorder large = M3RoundedRectangleBorder(
//     borderRadius: M3BorderRadius.all(M3Radius.large),
//   );

//   /// Large increased rounded rectangular shape (20dp corners).
//   static const M3ShapeBorder largeIncreased = M3RoundedRectangleBorder(
//     borderRadius: M3BorderRadius.all(M3Radius.largeIncreased),
//   );

//   /// Extra large rounded rectangular shape (28dp corners).
//   static const M3ShapeBorder extraLarge = M3RoundedRectangleBorder(
//     borderRadius: M3BorderRadius.all(M3Radius.extraLarge),
//   );

//   /// Extra large increased rounded rectangular shape (32dp corners).
//   static const M3ShapeBorder extraLargeIncreased = M3RoundedRectangleBorder(
//     borderRadius: M3BorderRadius.all(M3Radius.extraLargeIncreased),
//   );

//   /// Extra extra large rounded rectangular shape (48dp corners).
//   static const M3ShapeBorder extraExtraLarge = M3RoundedRectangleBorder(
//     borderRadius: M3BorderRadius.all(M3Radius.extraExtraLarge),
//   );

//   /// Fully rounded pill shape.
//   static const M3ShapeBorder full = M3StadiumBorder();

//   /// Circular shape.
//   static const M3ShapeBorder circle = M3CircleBorder();
// }

// /// Material Design 3 circle border.
// class M3CircleBorder extends CircleBorder implements M3ShapeBorder {
//   /// Creates a circle border with optional side.
//   const M3CircleBorder({
//     M3BorderSide side = M3BorderSide.none,
//     super.eccentricity,
//   }) : super(side: side);
// }

// /// Material Design 3 stadium (pill) border.
// class M3StadiumBorder extends StadiumBorder implements M3ShapeBorder {
//   /// Creates a stadium border with optional side.
//   const M3StadiumBorder({
//     M3BorderSide side = M3BorderSide.none,
//   }) : super(side: side);
// }
