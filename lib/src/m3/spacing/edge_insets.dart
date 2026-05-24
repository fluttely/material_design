part of '../../../material_design.dart';

/// Material Design 3 [EdgeInsets] that enforces M3 spacing tokens.
///
/// All parameters must be [M3SpacingValue] from [M3Spacings] or [M3Margins],
/// preventing arbitrary doubles that break the design system's spatial rhythm.
///
/// Example:
/// ```dart
/// M3EdgeInsets.all(M3Spacings.space16)
/// M3EdgeInsets.symmetric(horizontal: M3Margins.compactScreen)
/// M3EdgeInsets.only(top: M3Spacings.space8, bottom: M3Spacings.space24)
/// ```
class M3EdgeInsets extends EdgeInsets {
  const M3EdgeInsets.all(M3SpacingValue value)
      : super.fromLTRB(value, value, value, value);

  const M3EdgeInsets.symmetric({
    M3SpacingValue horizontal = M3Spacings.none,
    M3SpacingValue vertical = M3Spacings.none,
  }) : super.fromLTRB(horizontal, vertical, horizontal, vertical);

  const M3EdgeInsets.only({
    M3SpacingValue left = M3Spacings.none,
    M3SpacingValue top = M3Spacings.none,
    M3SpacingValue right = M3Spacings.none,
    M3SpacingValue bottom = M3Spacings.none,
  }) : super.fromLTRB(left, top, right, bottom);

  const M3EdgeInsets.fromLTRB(
    M3SpacingValue left,
    M3SpacingValue top,
    M3SpacingValue right,
    M3SpacingValue bottom,
  ) : super.fromLTRB(left, top, right, bottom);

  /// Zero insets on all sides.
  static const M3EdgeInsets zero = M3EdgeInsets.all(M3Spacings.none);
}

/// Common M3 EdgeInsets patterns.
abstract final class M3EdgeInsetsPatterns {
  /// Standard card padding (16dp all sides).
  static const M3EdgeInsets card = M3EdgeInsets.all(M3Spacings.space16);

  /// Dialog content padding (24dp all sides).
  static const M3EdgeInsets dialog = M3EdgeInsets.all(M3Spacings.space24);

  /// List item padding (horizontal 16dp, vertical 8dp).
  static const M3EdgeInsets listItem = M3EdgeInsets.symmetric(
    horizontal: M3Spacings.space16,
    vertical: M3Spacings.space8,
  );

  /// Button padding (horizontal 24dp, vertical 10dp → use space12 as closest).
  static const M3EdgeInsets button = M3EdgeInsets.symmetric(
    horizontal: M3Spacings.space24,
    vertical: M3Spacings.space12,
  );

  /// Compact screen page margin (horizontal 16dp).
  static const M3EdgeInsets compactPage = M3EdgeInsets.symmetric(
    horizontal: M3Margins.compactScreen,
  );

  /// Medium / expanded screen page margin (horizontal 24dp).
  static const M3EdgeInsets expandedPage = M3EdgeInsets.symmetric(
    horizontal: M3Margins.expandedScreen,
  );
}
