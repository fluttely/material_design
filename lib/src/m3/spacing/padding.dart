part of '../../../../material_design.dart';

/// Material Design 3 Padding widget with design token enforcement.
///
/// Unlike Flutter's built-in Padding widget, M3Padding only accepts
/// [M3EdgeInsets], preventing the use of arbitrary values that could
/// break the design system's visual rhythm.
///
/// ## Usage
///
/// ```dart
/// M3Padding(
///   padding: M3EdgeInsets.all(M3Spacings.space16),
///   child: Text('Consistently padded text'),
/// )
/// ```
class M3Padding extends Padding {
  const M3Padding({
    required M3EdgeInsets super.padding,
    super.child,
    super.key,
  });
}
