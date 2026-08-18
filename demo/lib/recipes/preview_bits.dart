import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// A plain filled block, for previews whose subject is not decoration.
///
/// A recipe about spacing should not also be a recipe about colour, so the
/// things being spaced are deliberately featureless. Sizes are still passed as
/// tokens at every call site — the demo does not get to opt out of its own
/// contract just because a box is a placeholder.
class PreviewBox extends StatelessWidget {
  const PreviewBox({
    this.label,
    this.width,
    this.height = M3Spacings.s40,
    this.color,
    super.key,
  });

  /// Centred caption, when the box needs to say what it is.
  final String? label;

  /// Null stretches the box to its parent's width.
  final double? width;

  final double height;

  /// Defaults to `secondaryContainer`.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final fill = color ?? colorScheme.secondaryContainer;
    final text = label;

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: M3BoxDecoration(
        color: fill,
        borderRadius: M3BorderRadius.small,
      ),
      child: text == null
          ? null
          : Text(
              text,
              style: M3TypeScale.labelMedium.copyWith(
                color: colorScheme.onSecondaryContainer,
              ),
            ),
    );
  }
}

/// A value a recipe computes at runtime, shown so the reader can see what the
/// call actually returned on this window.
///
/// Several M3 APIs answer a question rather than draw something —
/// `M3ScreenSize.of`, `M3Accessibility.shouldReduceMotion`. Printing the
/// answer is the honest preview for those.
class PreviewValue extends StatelessWidget {
  const PreviewValue(this.text, {this.label, super.key});

  /// What the call returned.
  final String text;

  /// What was called, when it is not obvious from the snippet above.
  final String? label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final caption = label;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (caption != null) ...[
          Text(
            caption,
            style: M3TypeScale.labelSmall.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const M3Gap(M3Spacings.s4),
        ],
        Text(
          text,
          style: M3TextUtils.mono(M3TypeScale.titleSmall).copyWith(
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
