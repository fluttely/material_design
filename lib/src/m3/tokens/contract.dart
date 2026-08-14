part of '../../tokens.dart';

/// The single, deliberate escape hatch out of the M3 design contract.
///
/// ## Why this exists
///
/// The M3 token wrappers ([M3SpacingValue], [M3CornerValue], and friends) are
/// Dart extension types. Extension types are a *compile-time* construct: at
/// runtime they are erased to their representation type. That has one
/// consequence worth stating plainly — a cast is always available:
///
/// ```dart
/// const leaked = 17.3 as M3SpacingValue; // compiles, no warning
/// ```
///
/// No design in Dart can close that door. So rather than claim the contract is
/// unbreakable, this class makes the break **explicit, greppable, and
/// lintable**. Every deviation from the Material Design 3 scales flows through
/// one identifier.
///
/// ## When to use it
///
/// Legitimately: bridging a third-party design spec, matching a fixed asset
/// size, or animating *between* two tokens where the intermediate frames are
/// necessarily off-scale.
///
/// Not legitimately: "16 felt too tight". That is what the scale is for.
///
/// ## Enforcing it in your app
///
/// Because every deviation names `M3Contract`, you can audit or ban it:
///
/// ```sh
/// # Count every deliberate deviation in your codebase.
/// grep -rn 'M3Contract\.' lib/
/// ```
///
/// ```yaml
/// # analysis_options.yaml — forbid it outright in an app that wants
/// # zero deviations.
/// analyzer:
///   errors:
///     deprecated_member_use: error
/// ```
///
/// ## Usage
///
/// ```dart
/// // A brand asset that is genuinely 18dp, not 16 or 20.
/// M3Padding(
///   padding: M3EdgeInsets.all(M3Contract.spacing(18)),
///   child: brandLogo,
/// )
/// ```
abstract final class M3Contract {
  /// Constructs an off-scale spacing value.
  ///
  /// Prefer a constant from [M3Spacings], [M3Margins], or [M3Spacers].
  static M3SpacingValue spacing(double dp) => M3SpacingValue._(dp);

  /// Constructs an off-scale border width value.
  ///
  /// Prefer a constant from [M3BorderWidths].
  static M3BorderWidthValue borderWidth(double dp) => M3BorderWidthValue._(dp);

  /// Constructs an off-scale opacity value.
  ///
  /// Prefer a constant from [M3Opacities] or [M3StateLayerOpacities].
  ///
  /// Throws an [AssertionError] in debug mode if [alpha] is outside 0.0–1.0,
  /// since that is a bug rather than a design decision.
  static M3OpacityValue opacity(double alpha) {
    assert(
      alpha >= 0.0 && alpha <= 1.0,
      'Opacity must be between 0.0 and 1.0, got $alpha.',
    );
    return M3OpacityValue._(alpha);
  }

  /// Constructs an off-scale corner radius value.
  ///
  /// Prefer a constant from [M3Corners]. The M3 shape scale has exactly seven
  /// levels; stepping outside it is the most visible way to break an M3 UI.
  static M3CornerValue corner(double dp) => M3CornerValue._(dp);

  /// Constructs an off-scale icon size value.
  ///
  /// Prefer a constant from [M3IconSizes].
  static M3IconSizeValue iconSize(double dp) => M3IconSizeValue._(dp);

  /// Constructs an off-scale stacking order value.
  ///
  /// Prefer a constant from [M3ZIndexes].
  static M3ZIndexValue zIndex(int order) => M3ZIndexValue._(order);

  /// Constructs an off-scale breakpoint or layout width value.
  ///
  /// Prefer a constant from [M3Breakpoints] or [M3LayoutWidths].
  static M3BreakpointValue breakpoint(double dp) => M3BreakpointValue._(dp);

  /// Constructs an off-scale elevation value in dp.
  ///
  /// Prefer a constant from [M3ElevationDps], or the composite [M3Elevation]
  /// levels which pair a dp value with its matching shadows.
  static M3ElevationDpValue elevationDp(double dp) => M3ElevationDpValue._(dp);

  /// Constructs an off-scale contrast level.
  ///
  /// Prefer a constant from [M3ContrastLevels]. Contrast is a user preference
  /// surfaced by the platform, so an interpolated level is usually a bug —
  /// legitimate uses are animating between two levels, or honouring a
  /// finer-grained setting a platform exposes.
  ///
  /// Throws an [AssertionError] in debug mode if [level] is outside -1.0–1.0.
  static M3ContrastLevelValue contrastLevel(double level) {
    assert(
      level >= -1.0 && level <= 1.0,
      'Contrast level must be between -1.0 and 1.0, got $level.',
    );
    return M3ContrastLevelValue._(level);
  }
}
