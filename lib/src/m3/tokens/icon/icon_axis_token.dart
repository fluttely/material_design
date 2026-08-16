part of '../../../tokens.dart';

/// Type-safe wrapper for the Material Symbols **weight** axis (`wght`).
///
/// Implements [double] so it can be passed to `Icon.weight` and
/// `IconThemeData.weight` directly, while keeping arbitrary raw doubles out of
/// M3-typed APIs.
///
/// See [M3Contract] for the escape hatch when you must step outside the scale.
extension type const M3IconWeightValue._(double weight) implements double {}

/// Type-safe wrapper for the Material Symbols **grade** axis (`GRAD`).
extension type const M3IconGradeValue._(double grade) implements double {}

/// Type-safe wrapper for the Material Symbols **fill** axis (`FILL`).
extension type const M3IconFillValue._(double fill) implements double {}

/// Type-safe wrapper for the Material Symbols **optical size** axis (`opsz`).
extension type const M3IconOpticalSizeValue._(double dp) implements double {}

/// Material Design 3 icon **weight** tokens — the `wght` axis of the Material
/// Symbols variable font.
///
/// Weight changes stroke thickness without changing the icon's footprint, so
/// an icon can match the weight of the text beside it. [regular] (400) is the
/// default and the only value Flutter assumes when `weight` is omitted.
///
/// Reference: https://m3.material.io/styles/icons/applying-icons
abstract final class M3IconWeights {
  /// 100 — the thinnest stroke, for very large display icons.
  static const M3IconWeightValue thin = M3IconWeightValue._(100);

  /// 200 — extra light stroke.
  static const M3IconWeightValue extraLight = M3IconWeightValue._(200);

  /// 300 — light stroke, pairs with light text weights.
  static const M3IconWeightValue light = M3IconWeightValue._(300);

  /// 400 — the default icon weight.
  static const M3IconWeightValue regular = M3IconWeightValue._(400);

  /// 500 — medium stroke, pairs with M3 label/title styles.
  static const M3IconWeightValue medium = M3IconWeightValue._(500);

  /// 600 — semi-bold stroke.
  static const M3IconWeightValue semiBold = M3IconWeightValue._(600);

  /// 700 — the heaviest stroke, for small icons that must stay legible.
  static const M3IconWeightValue bold = M3IconWeightValue._(700);

  /// The weight axis, in ascending order.
  static const List<M3IconWeightValue> values = <M3IconWeightValue>[
    thin,
    extraLight,
    light,
    regular,
    medium,
    semiBold,
    bold,
  ];
}

/// Material Design 3 icon **grade** tokens — the `GRAD` axis.
///
/// Grade is weight's fine-grained sibling: it thickens or thins strokes
/// *without* changing the icon's width, which makes it the axis to reach for
/// when compensating for optical effects rather than restyling.
///
/// Light-on-dark rendering makes strokes bloom, so a light icon on a dark
/// surface uses [onDark] (-25) to come back to the same apparent weight as its
/// dark-on-light counterpart.
///
/// Reference: https://m3.material.io/styles/icons/applying-icons
abstract final class M3IconGrades {
  /// -25 — light icons on a dark surface, cancelling the optical bloom.
  static const M3IconGradeValue onDark = M3IconGradeValue._(-25);

  /// 0 — the default grade, for dark icons on a light surface.
  static const M3IconGradeValue normal = M3IconGradeValue._(0);

  /// 200 — emphasis grade, for icons that must stand out at small sizes.
  static const M3IconGradeValue emphasis = M3IconGradeValue._(200);

  /// The grade axis, in ascending order.
  static const List<M3IconGradeValue> values = <M3IconGradeValue>[
    onDark,
    normal,
    emphasis,
  ];
}

/// Material Design 3 icon **fill** tokens — the `FILL` axis.
///
/// Fill is a state, not a style: M3 uses the filled form to mark the selected
/// destination in a navigation component and the unfilled form for the rest.
/// The axis is continuous, so animating between the two is a legal transition
/// rather than an icon swap.
///
/// Reference: https://m3.material.io/styles/icons/applying-icons
abstract final class M3IconFills {
  /// 0 — the outlined form, for unselected or inactive states.
  static const M3IconFillValue unfilled = M3IconFillValue._(0);

  /// 1 — the filled form, for the selected or active state.
  static const M3IconFillValue filled = M3IconFillValue._(1);

  /// The fill axis, in ascending order.
  static const List<M3IconFillValue> values = <M3IconFillValue>[
    unfilled,
    filled,
  ];
}

/// Material Design 3 icon **optical size** tokens — the `opsz` axis.
///
/// Optical size keeps stroke weight *perceptually* constant across sizes: a
/// 20dp icon needs proportionally thicker strokes than a 48dp one to read the
/// same. The axis therefore tracks the rendered size — these tokens mirror
/// [M3IconSizes] one for one.
///
/// The axis is defined over 20–48; [forIconSize] clamps to that range so an
/// off-scale size routed through [M3Contract] still lands on a legal value.
///
/// Reference: https://m3.material.io/styles/icons/applying-icons
abstract final class M3IconOpticalSizes {
  /// 20dp — matches [M3IconSizes.dense].
  static const M3IconOpticalSizeValue dense = M3IconOpticalSizeValue._(20);

  /// 24dp — matches [M3IconSizes.standard], the default.
  static const M3IconOpticalSizeValue standard = M3IconOpticalSizeValue._(24);

  /// 32dp — matches [M3IconSizes.medium].
  static const M3IconOpticalSizeValue medium = M3IconOpticalSizeValue._(32);

  /// 40dp — matches [M3IconSizes.large].
  static const M3IconOpticalSizeValue large = M3IconOpticalSizeValue._(40);

  /// 48dp — matches [M3IconSizes.extraLarge], the top of the axis.
  static const M3IconOpticalSizeValue extraLarge = M3IconOpticalSizeValue._(48);

  /// The optical size axis, in ascending order.
  static const List<M3IconOpticalSizeValue> values = <M3IconOpticalSizeValue>[
    dense,
    standard,
    medium,
    large,
    extraLarge,
  ];

  /// The optical size that matches a rendered icon [size].
  ///
  /// For every token in [M3IconSizes] this is the same number; for a size
  /// obtained through `M3Contract.iconSize` it is that number clamped into the
  /// 20–48 range the axis is defined over.
  static M3IconOpticalSizeValue forIconSize(M3IconSizeValue size) =>
      M3IconOpticalSizeValue._(size.clamp(dense, extraLarge));
}
