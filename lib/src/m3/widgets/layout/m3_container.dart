part of '../../../../../material_design.dart';

// Example custom widgets that enforce token usage

/// A container that only accepts Material Design 3 shape tokens.
class M3Container extends StatelessWidget {
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
  final Widget? child;
  final M3ShapeToken? shapeToken;
  final M3BorderRadiusToken? borderRadiusToken;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
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
