part of '../../../../material_design.dart';

/// Type-safe wrapper for M3 spacing values. Implements [double] so it can
/// be passed directly to any Flutter API that accepts a [double], while
/// preventing arbitrary raw doubles from being used in M3-typed APIs.
extension type const M3SpacingValue._(double _) implements double {}

/// Material Design 3 spacing tokens based on a 4dp grid system.
abstract final class M3Spacings {
  /// No spacing (0dp).
  static const M3SpacingValue none = M3SpacingValue._(0);

  /// 4dp spacing token.
  static const M3SpacingValue s4 = M3SpacingValue._(4);

  /// 8dp spacing token.
  static const M3SpacingValue s8 = M3SpacingValue._(8);

  /// 12dp spacing token.
  static const M3SpacingValue s12 = M3SpacingValue._(12);

  /// 16dp spacing token — the most commonly used M3 spacing value.
  static const M3SpacingValue s16 = M3SpacingValue._(16);

  /// 20dp spacing token.
  static const M3SpacingValue s20 = M3SpacingValue._(20);

  /// 24dp spacing token.
  static const M3SpacingValue s24 = M3SpacingValue._(24);

  /// 28dp spacing token.
  static const M3SpacingValue s28 = M3SpacingValue._(28);

  /// 32dp spacing token.
  static const M3SpacingValue s32 = M3SpacingValue._(32);

  /// 36dp spacing token.
  static const M3SpacingValue s36 = M3SpacingValue._(36);

  /// 40dp spacing token.
  static const M3SpacingValue s40 = M3SpacingValue._(40);

  /// 48dp spacing token.
  static const M3SpacingValue s48 = M3SpacingValue._(48);

  /// 56dp spacing token.
  static const M3SpacingValue s56 = M3SpacingValue._(56);

  /// 64dp spacing token.
  static const M3SpacingValue s64 = M3SpacingValue._(64);

  /// 72dp spacing token.
  static const M3SpacingValue s72 = M3SpacingValue._(72);

  /// 80dp spacing token.
  static const M3SpacingValue s80 = M3SpacingValue._(80);

  /// 96dp spacing token.
  static const M3SpacingValue s96 = M3SpacingValue._(96);

  /// 128dp spacing token.
  static const M3SpacingValue s128 = M3SpacingValue._(128);

  /// Infinite spacing — for flexible layouts.
  static const M3SpacingValue infinity = M3SpacingValue._(double.infinity);
}

/// Material Design 3 margin tokens for responsive screen layouts.
///
/// Maps to the five M3 window size classes.
abstract final class M3Margins {
  /// Compact screen margin (16dp).
  static const M3SpacingValue compactScreen = M3SpacingValue._(16);

  /// Medium screen margin (24dp).
  static const M3SpacingValue mediumScreen = M3SpacingValue._(24);

  /// Expanded screen margin (24dp).
  static const M3SpacingValue expandedScreen = M3SpacingValue._(24);

  /// Large screen margin (24dp).
  static const M3SpacingValue largeScreen = M3SpacingValue._(24);

  /// Extra-large screen margin (24dp).
  static const M3SpacingValue extraLargeScreen = M3SpacingValue._(24);
}

/// Standard spacer widths for multi-pane layouts.
abstract final class M3Spacers {
  /// Standard pane spacer (24dp).
  static const M3SpacingValue pane = M3SpacingValue._(24);
}
