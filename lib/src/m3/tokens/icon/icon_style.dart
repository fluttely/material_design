part of '../../../tokens.dart';

/// An [IconThemeData] every axis of which comes from an M3 icon token.
///
/// This is the icon counterpart of `M3TypeScale`: the package does not ship an
/// icon *widget* — Flutter's [Icon] already renders the Material Symbols
/// axes — it ships the styling contract those axes are set from. Because
/// [M3IconStyle] **is** an [IconThemeData], it drops into
/// `ThemeData.iconTheme`, `IconTheme`, and every `iconTheme:` slot on a
/// Flutter component:
///
/// ```dart
/// MaterialApp(
///   theme: ThemeData(
///     iconTheme: M3IconStyle(color: colorScheme.onSurface),
///   ),
/// );
///
/// IconTheme.merge(                    // merge: keeps the inherited color
///   data: const M3IconStyle(
///     size: M3IconSizes.dense,
///     weight: M3IconWeights.medium,
///   ),
///   child: const Icon(Icons.star),
/// );
/// ```
///
/// [color] is deliberately not defaulted — icon color is a **color-scheme
/// role**, not an icon token, so the style cannot know whether it is painting
/// on a surface or a container. That has one consequence worth stating: an
/// [IconThemeData] with a null color leaves [Icon] on its black fallback, so
/// replacing `ThemeData.iconTheme` wholesale needs a `color` (typically
/// `colorScheme.onSurface`) or every icon goes black in dark mode. To restyle a
/// subtree without disturbing the inherited color, use `IconTheme.merge`
/// instead of `IconTheme`.
///
/// [opticalSize] defaults to [size], which is what the spec asks for: the
/// `opsz` axis tracks the rendered size so stroke weight stays perceptually
/// constant. Pass it explicitly only to deviate deliberately, and use
/// [M3IconOpticalSizes.forIconSize] when [size] came from [M3Contract] and may
/// fall outside the 20–48 axis.
///
/// Note that [copyWith] is inherited and therefore returns a plain
/// [IconThemeData] — the contract is expressed by the token types on the
/// constructor, and a `copyWith` on an already-M3 style is exactly the place a
/// deviation would be introduced.
///
/// Reference: https://m3.material.io/styles/icons/applying-icons
class M3IconStyle extends IconThemeData {
  /// Creates an icon style from M3 tokens.
  const M3IconStyle({
    M3IconSizeValue size = M3IconSizes.standard,
    M3IconWeightValue weight = M3IconWeights.regular,
    M3IconGradeValue grade = M3IconGrades.normal,
    M3IconFillValue fill = M3IconFills.unfilled,
    M3IconOpticalSizeValue? opticalSize,
    super.color,
    M3OpacityValue? opacity,
  }) : super(
          size: size,
          weight: weight,
          grade: grade,
          fill: fill,
          opticalSize: opticalSize ?? size,
          opacity: opacity,
        );

  /// The default M3 icon treatment: 24dp, regular weight, grade 0, unfilled.
  static const M3IconStyle standard = M3IconStyle();

  /// The 20dp treatment for dense layouts (list leading icons, chips, rails).
  static const M3IconStyle dense = M3IconStyle(size: M3IconSizes.dense);

  /// The selected-state treatment: the same icon, filled.
  ///
  /// M3 marks the active navigation destination by moving along the `FILL`
  /// axis rather than by swapping in a different glyph.
  static const M3IconStyle selected = M3IconStyle(fill: M3IconFills.filled);

  /// The treatment for a light icon on a dark surface — grade -25, which
  /// cancels the optical bloom of light-on-dark strokes.
  static const M3IconStyle onDarkSurface = M3IconStyle(
    grade: M3IconGrades.onDark,
  );

  /// The disabled treatment: 38% opacity, per [M3Opacities.disabledContent].
  static const M3IconStyle disabled = M3IconStyle(
    opacity: M3Opacities.disabledContent,
  );
}
