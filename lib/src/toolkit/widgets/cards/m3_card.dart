/// Material 3 Card widget implementation.
///
/// Reference: https://m3.material.io/components/cards/overview
library;

import 'package:flutter/material.dart';
import '../../../design/comp/comp.dart';

/// A Material 3 card widget.
/// 
/// Cards contain content and actions about a single subject.
/// They can be used to display information in an organized,
/// easily scannable format.
class M3Card extends StatelessWidget {
  const M3Card({
    super.key,
    this.child,
    this.elevation,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.margin,
    this.clipBehavior,
    this.borderOnForeground = true,
  });

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The z-coordinate at which to place this card.
  final double? elevation;

  /// The card's background color.
  final Color? color;

  /// The color to paint the shadow below the card.
  final Color? shadowColor;

  /// The color used as an overlay on [color] to indicate elevation.
  final Color? surfaceTintColor;

  /// The shape of the card's border.
  final ShapeBorder? shape;

  /// The empty space that surrounds the card.
  final EdgeInsetsGeometry? margin;

  /// The content will be clipped (or not) according to this option.
  final Clip? clipBehavior;

  /// Whether to paint the border in front of the child.
  final bool borderOnForeground;

  @override
  Widget build(BuildContext context) {
    final spec = M3CardSpecs.elevatedCard;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final defaultColor = switch (spec.containerColor) {
      M3CardContainerColor.surface => colorScheme.surface,
      M3CardContainerColor.surfaceContainerLow => colorScheme.surfaceContainerLow,
      M3CardContainerColor.surfaceContainerHigh => colorScheme.surfaceContainerHigh,
      M3CardContainerColor.surfaceContainerHighest => colorScheme.surfaceContainerHighest,
      M3CardContainerColor.surfaceVariant => colorScheme.surfaceVariant,
    };

    return Card(
      elevation: elevation ?? spec.containerElevation,
      color: color ?? defaultColor,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor ?? colorScheme.surfaceTint,
      shape: shape ?? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spec.containerShape),
      ),
      margin: margin,
      clipBehavior: clipBehavior,
      borderOnForeground: borderOnForeground,
      child: child,
    );
  }
}

/// A Material 3 filled card widget.
class M3FilledCard extends M3Card {
  const M3FilledCard({
    super.key,
    super.child,
    super.color,
    super.shadowColor,
    super.surfaceTintColor,
    super.shape,
    super.margin,
    super.clipBehavior,
    super.borderOnForeground,
  });

  @override
  Widget build(BuildContext context) {
    final spec = M3CardSpecs.filledCard;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final defaultColor = switch (spec.containerColor) {
      M3CardContainerColor.surface => colorScheme.surface,
      M3CardContainerColor.surfaceContainerLow => colorScheme.surfaceContainerLow,
      M3CardContainerColor.surfaceContainerHigh => colorScheme.surfaceContainerHigh,
      M3CardContainerColor.surfaceContainerHighest => colorScheme.surfaceContainerHighest,
      M3CardContainerColor.surfaceVariant => colorScheme.surfaceVariant,
    };

    return Card(
      elevation: spec.containerElevation,
      color: color ?? defaultColor,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor ?? colorScheme.surfaceTint,
      shape: shape ?? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spec.containerShape),
      ),
      margin: margin,
      clipBehavior: clipBehavior,
      borderOnForeground: borderOnForeground,
      child: child,
    );
  }
}

/// A Material 3 outlined card widget.
class M3OutlinedCard extends M3Card {
  const M3OutlinedCard({
    super.key,
    super.child,
    super.color,
    super.shadowColor,
    super.surfaceTintColor,
    super.shape,
    super.margin,
    super.clipBehavior,
    super.borderOnForeground,
  });

  @override
  Widget build(BuildContext context) {
    final spec = M3CardSpecs.outlinedCard;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final defaultColor = switch (spec.containerColor) {
      M3CardContainerColor.surface => colorScheme.surface,
      M3CardContainerColor.surfaceContainerLow => colorScheme.surfaceContainerLow,
      M3CardContainerColor.surfaceContainerHigh => colorScheme.surfaceContainerHigh,
      M3CardContainerColor.surfaceContainerHighest => colorScheme.surfaceContainerHighest,
      M3CardContainerColor.surfaceVariant => colorScheme.surfaceVariant,
    };

    final outlineColor = switch (spec.outlineColor) {
      M3CardOutlineColor.outline => colorScheme.outline,
      M3CardOutlineColor.outlineVariant => colorScheme.outlineVariant,
      M3CardOutlineColor.primary => colorScheme.primary,
      null => colorScheme.outlineVariant,
    };

    return Card(
      elevation: spec.containerElevation,
      color: color ?? defaultColor,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor ?? colorScheme.surfaceTint,
      shape: shape ?? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spec.containerShape),
        side: BorderSide(
          color: outlineColor,
          width: spec.outlineWidth ?? 1.0,
        ),
      ),
      margin: margin,
      clipBehavior: clipBehavior,
      borderOnForeground: borderOnForeground,
      child: child,
    );
  }
}