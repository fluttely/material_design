part of '../../../../../material_design.dart';

/// Custom RoundedRectangleBorder that enforces Material Design 3 tokens.
class M3RoundedRectangleBorder extends RoundedRectangleBorder {
  /// Creates a rounded rectangle border with uniform border radius.
  const M3RoundedRectangleBorder({
    M3BorderSide super.side = M3BorderSide.none,
    M3BorderRadius super.borderRadius = M3BorderRadius.zero,
  });

  // /// Creates a rounded rectangle border with only specific corners rounded.
  // const M3RoundedRectangleBorder.only({
  //   M3BorderSide super.side = M3BorderSide.none,
  //   M3Radius topLeft = M3Radius.zero,
  //   M3Radius topRight = M3Radius.zero,
  //   M3Radius bottomLeft = M3Radius.zero,
  //   M3Radius bottomRight = M3Radius.zero,
  // }) : super(
  //         borderRadius: M3BorderRadius.only(
  //           topLeft: topLeft,
  //           topRight: topRight,
  //           bottomLeft: bottomLeft,
  //           bottomRight: bottomRight,
  //         ),
  //       );

  // /// Creates a rounded rectangle border with vertical symmetry.
  // const M3RoundedRectangleBorder.vertical({
  //   M3BorderSide super.side = M3BorderSide.none,
  //   M3Radius top = M3Radius.zero,
  //   M3Radius bottom = M3Radius.zero,
  // }) : super(
  //         borderRadius: M3BorderRadius.vertical(
  //           top: top,
  //           bottom: bottom,
  //         ),
  //       );

  // /// Creates a rounded rectangle border with horizontal symmetry.
  // const M3RoundedRectangleBorder.horizontal({
  //   M3BorderSide super.side = M3BorderSide.none,
  //   M3Radius left = M3Radius.zero,
  //   M3Radius right = M3Radius.zero,
  // }) : super(
  //         borderRadius: M3BorderRadius.horizontal(
  //           left: left,
  //           right: right,
  //         ),
  //       );

  // /// Creates a circular border (stadium shape).
  // const M3RoundedRectangleBorder.stadium({
  //   M3BorderSide super.side = M3BorderSide.none,
  // }) : super(
  //         borderRadius: const M3BorderRadius.all(M3Radius.full),
  //       );
}
