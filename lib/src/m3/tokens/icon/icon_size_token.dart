part of '../../../tokens.dart';

/// Type-safe wrapper for M3 icon size values.
///
/// Implements [double] so it can be passed to any Flutter API that accepts a
/// [double] (such as `Icon.size`), while preventing arbitrary raw doubles from
/// being used in M3-typed APIs.
///
/// See [M3Contract] for the escape hatch when you must step outside the scale.
extension type const M3IconSizeValue._(double dp) implements double {}

/// Material Design 3 icon size tokens.
///
/// Reference: https://m3.material.io/styles/icons/designing-icons
abstract final class M3IconSizes {
  /// Dense icon size (20dp) — compact layouts.
  static const M3IconSizeValue dense = M3IconSizeValue._(20);

  /// Standard icon size (24dp) — default for most UI icons.
  static const M3IconSizeValue standard = M3IconSizeValue._(24);

  /// Medium icon size (32dp) — enhanced visibility.
  static const M3IconSizeValue medium = M3IconSizeValue._(32);

  /// Large icon size (40dp) — dialogs, empty states.
  static const M3IconSizeValue large = M3IconSizeValue._(40);

  /// Extra-large icon size (48dp) — avatars, hero elements.
  static const M3IconSizeValue extraLarge = M3IconSizeValue._(48);

  /// The icon size scale, in ascending order.
  static const List<M3IconSizeValue> values = <M3IconSizeValue>[
    dense,
    standard,
    medium,
    large,
    extraLarge,
  ];
}
