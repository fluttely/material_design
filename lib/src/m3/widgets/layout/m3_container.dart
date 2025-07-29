part of '../../../../../material_design.dart';

// Example custom widgets that enforce token usage

/// A container that only accepts Material Design 3 shape tokens.
///
/// This widget provides a type-safe way to create containers that follow
/// Material Design 3 guidelines by enforcing the use of design tokens for
/// shapes and border radius values.
///
/// You can specify either a [shapeToken] or [borderRadiusToken], but not both.
/// If neither is provided, a standard Container without decoration is created.
class M3Container extends StatelessWidget {
  /// Creates an M3Container with Material Design 3 shape tokens.
  ///
  /// Either [shapeToken] or [borderRadiusToken] can be provided, but not both.
  /// If both are null, creates a standard container without shape decoration.
  const M3Container({
    super.key,
    this.child,
    this.shapeToken,
    this.borderRadiusToken,
    this.color,
    this.padding,
    this.margin,
    this.width,
    this.height,
  }) : assert(
          shapeToken == null || borderRadiusToken == null,
          'Cannot provide both shapeToken and borderRadiusToken',
        );

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The Material Design 3 shape token to apply to the container.
  ///
  /// Cannot be used together with [borderRadiusToken].
  final M3ShapeToken? shapeToken;

  /// The Material Design 3 border radius token to apply to the container.
  ///
  /// Cannot be used together with [shapeToken].
  final M3BorderRadiusToken? borderRadiusToken;

  /// The color to paint behind the [child].
  final Color? color;

  /// Empty space to inscribe inside the container.
  ///
  /// The [child], if any, is placed inside this padding.
  final EdgeInsetsGeometry? padding;

  /// Empty space to surround the container.
  final EdgeInsetsGeometry? margin;

  /// The width of the container.
  ///
  /// If null, the container will be as wide as possible.
  final double? width;

  /// The height of the container.
  ///
  /// If null, the container will be as tall as possible.
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (shapeToken != null) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: ShapeDecoration(
          shape: shapeToken!.value,
          color: color,
        ),
        child: child,
      );
    } else if (borderRadiusToken != null) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadiusToken!.value,
          color: color,
        ),
        child: child,
      );
    } else {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        color: color,
        child: child,
      );
    }
  }
}
