part of '../../layout.dart';

/// Material Design 3 [EdgeInsets] that enforces M3 spacing tokens.
///
/// All parameters must be [M3SpacingValue] from [M3Spacings] or [M3Margins],
/// preventing arbitrary doubles that break the design system's spatial rhythm.
///
/// Example:
/// ```dart
/// M3EdgeInsets.all(M3Spacings.s16)
/// M3EdgeInsets.symmetric(horizontal: M3Margins.compactScreen)
/// M3EdgeInsets.only(top: M3Spacings.s8, bottom: M3Spacings.s24)
/// ```
class M3EdgeInsets extends EdgeInsets {
  /// Creates an insets where all sides have the same [value] spacing.
  const M3EdgeInsets.all(M3SpacingValue value)
      : super.fromLTRB(value, value, value, value);

  /// Creates symmetric insets with [horizontal] and [vertical] spacing.
  const M3EdgeInsets.symmetric({
    M3SpacingValue horizontal = M3Spacings.none,
    M3SpacingValue vertical = M3Spacings.none,
  }) : super.fromLTRB(horizontal, vertical, horizontal, vertical);

  /// Creates insets with only the specified sides having non-zero spacing.
  const M3EdgeInsets.only({
    M3SpacingValue left = M3Spacings.none,
    M3SpacingValue top = M3Spacings.none,
    M3SpacingValue right = M3Spacings.none,
    M3SpacingValue bottom = M3Spacings.none,
  }) : super.fromLTRB(left, top, right, bottom);

  /// Creates insets from left, top, right, and bottom spacing values.
  const M3EdgeInsets.fromLTRB(
    M3SpacingValue super.left,
    M3SpacingValue super.top,
    M3SpacingValue super.right,
    M3SpacingValue super.bottom,
  ) : super.fromLTRB();

  /// Zero insets on all sides.
  static const M3EdgeInsets zero = M3EdgeInsets.all(M3Spacings.none);
}

/// Component padding patterns specified by Material Design 3.
///
/// Every entry here is a value the M3 spec states outright. Patterns whose
/// spec value falls off the 4dp grid are deliberately absent rather than
/// rounded to the nearest token — a button's 40dp minimum height, for
/// instance, is a size constraint and not a padding token, so approximating
/// it here would smuggle an off-spec value into a package that promises
/// none.
abstract final class M3EdgeInsetsPatterns {
  /// Standard card padding (16dp all sides).
  static const M3EdgeInsets card = M3EdgeInsets.all(M3Spacings.s16);

  /// Dialog content padding (24dp all sides).
  static const M3EdgeInsets dialog = M3EdgeInsets.all(M3Spacings.s24);

  /// List item padding (horizontal 16dp, vertical 8dp).
  static const M3EdgeInsets listItem = M3EdgeInsets.symmetric(
    horizontal: M3Spacings.s16,
    vertical: M3Spacings.s8,
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
