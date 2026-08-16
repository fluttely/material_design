part of '../../../tokens.dart';

/// Component-level Material Design 3 measurements.
///
/// ## What this layer is, and what it is not
///
/// M3 describes three token layers: reference (raw palettes), system (the
/// semantic scales this package is built on), and **component** — the values
/// an individual component is specified at. This is that third layer, and it
/// is deliberately *only* values.
///
/// The package does not ship M3 components. Flutter's Material library owns
/// `FilledButton`, `NavigationBar`, and the rest, and duplicating them here
/// would create migration debt for every consumer the day Flutter changes one.
/// What the package can usefully own is the numbers: the heights, sizes, and
/// insets the spec fixes, so an app building a custom control lands on the
/// same measurements as the built-in one next to it.
///
/// Everything here is expressed in existing token types, so component values
/// stay inside the same contract as the rest of the package.
///
/// Spec: https://m3.material.io/components

/// Heights of the five Material Expressive button size classes.
///
/// M3 Expressive replaced the single 40dp button with a five-step scale, so a
/// button can match the density of what surrounds it.
///
/// These are **visual** heights, not touch targets. [extraSmall] (32dp) and
/// [small] (40dp) are both below the 48dp mobile minimum, so a control at
/// those heights must expand its tap area rather than its box — Flutter's
/// built-in buttons do this with `MaterialTapTargetSize.padded`. See
/// `M3Accessibility.minTouchTarget` (adaptive module).
///
/// Spec: https://m3.material.io/components/buttons/specs
abstract final class M3ButtonHeights {
  /// Extra small — 32dp. Dense toolbars and inline actions.
  static const M3SpacingValue extraSmall = M3SpacingValue._(32);

  /// Small — 40dp. The pre-Expressive default.
  static const M3SpacingValue small = M3SpacingValue._(40);

  /// Medium — 56dp.
  static const M3SpacingValue medium = M3SpacingValue._(56);

  /// Large — 96dp.
  static const M3SpacingValue large = M3SpacingValue._(96);

  /// Extra large — 136dp. Hero actions.
  static const M3SpacingValue extraLarge = M3SpacingValue._(136);

  /// The five heights, ascending.
  static const List<M3SpacingValue> values = <M3SpacingValue>[
    extraSmall,
    small,
    medium,
    large,
    extraLarge,
  ];
}

/// Container sizes for the floating action button.
///
/// Spec: https://m3.material.io/components/floating-action-button/specs
abstract final class M3FabSizes {
  /// Small FAB — 40dp.
  static const M3SpacingValue small = M3SpacingValue._(40);

  /// Standard FAB — 56dp.
  static const M3SpacingValue standard = M3SpacingValue._(56);

  /// Large FAB — 96dp.
  static const M3SpacingValue large = M3SpacingValue._(96);

  /// The three sizes, ascending.
  static const List<M3SpacingValue> values = <M3SpacingValue>[
    small,
    standard,
    large,
  ];
}

/// Heights of the app bar in each of its states.
///
/// Spec: https://m3.material.io/components/top-app-bar/specs
abstract final class M3AppBarHeights {
  /// Small top app bar — 64dp.
  static const M3SpacingValue small = M3SpacingValue._(64);

  /// Medium top app bar — 112dp.
  static const M3SpacingValue medium = M3SpacingValue._(112);

  /// Large top app bar — 152dp.
  static const M3SpacingValue large = M3SpacingValue._(152);

  /// Bottom app bar / docked toolbar — 80dp.
  ///
  /// The spec deprecates the bottom app bar in favour of the docked toolbar,
  /// which is shorter and more flexible but keeps this height.
  static const M3SpacingValue bottom = M3SpacingValue._(80);

  /// The three top app bar heights, ascending. Excludes [bottom], which is a
  /// different component.
  static const List<M3SpacingValue> values = <M3SpacingValue>[
    small,
    medium,
    large,
  ];
}

/// Navigation component measurements.
///
/// These replace the magic numbers previously inlined in the responsive
/// navigation helpers.
///
/// Spec: https://m3.material.io/components/navigation-rail/specs
abstract final class M3NavigationSizes {
  /// Navigation bar height — 80dp.
  static const M3SpacingValue barHeight = M3SpacingValue._(80);

  /// Collapsed navigation rail width — 80dp.
  static const M3SpacingValue railWidth = M3SpacingValue._(80);

  /// Extended navigation rail width — 256dp.
  ///
  /// Matches Flutter's `NavigationRail.minExtendedWidth` default, so a custom
  /// rail lines up with the built-in one.
  static const M3SpacingValue extendedRailWidth = M3SpacingValue._(256);

  /// Standard navigation drawer width — 360dp.
  static const M3SpacingValue drawerWidth = M3SpacingValue._(360);

  /// Height of a destination's active indicator — 32dp.
  static const M3SpacingValue indicatorHeight = M3SpacingValue._(32);

  /// Width of a destination's active indicator — 56dp.
  ///
  /// The pill around a rail or bar destination is 56×32dp; only the height was
  /// here until 1.7.0, which left every caller inventing the width.
  static const M3SpacingValue indicatorWidth = M3SpacingValue._(56);

  /// Height of a rail destination, indicator plus label — 56dp.
  static const M3SpacingValue railDestinationHeight = M3SpacingValue._(56);
}

/// List item heights, by how many lines of text the item carries.
///
/// Spec: https://m3.material.io/components/lists/specs
abstract final class M3ListItemHeights {
  /// One line — 56dp.
  static const M3SpacingValue oneLine = M3SpacingValue._(56);

  /// Two lines — 72dp.
  static const M3SpacingValue twoLine = M3SpacingValue._(72);

  /// Three lines — 88dp.
  static const M3SpacingValue threeLine = M3SpacingValue._(88);

  /// The three heights, ascending.
  static const List<M3SpacingValue> values = <M3SpacingValue>[
    oneLine,
    twoLine,
    threeLine,
  ];
}
