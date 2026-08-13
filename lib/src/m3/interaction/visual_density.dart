part of '../../interaction.dart';

/// Material Design 3 visual density tokens.
///
/// Visual density controls component spacing and height. Lower values produce
/// more compact interfaces (desktop-friendly); higher values add breathing room
/// (touch-friendly).
class M3VisualDensity extends VisualDensity {
  /// Creates a visual density configuration.
  const M3VisualDensity({super.horizontal = 0.0, super.vertical = 0.0});

  /// The horizontal density value for [standard].
  static const double standardHorizontal = 0;

  /// The vertical density value for [standard].
  static const double standardVertical = 0;

  /// Standard density (0, 0) — M3 baseline. Good for mixed touch/mouse apps.
  static const M3VisualDensity standard = M3VisualDensity();

  /// The horizontal density value for [comfortable].
  static const double comfortableHorizontal = -1;

  /// The vertical density value for [comfortable].
  static const double comfortableVertical = -1;

  /// Comfortable density (-1, -1) — larger touch targets. Recommended for
  /// touch-primary apps and accessibility-focused interfaces.
  static const M3VisualDensity comfortable = M3VisualDensity(
    horizontal: comfortableHorizontal,
    vertical: comfortableVertical,
  );

  /// The horizontal density value for [compact].
  static const double compactHorizontal = -2;

  /// The vertical density value for [compact].
  static const double compactVertical = -2;

  /// Compact density (-2, -2) — maximizes information density. Best for
  /// desktop apps, data tables, and professional tools.
  static const M3VisualDensity compact = M3VisualDensity(
    horizontal: compactHorizontal,
    vertical: compactVertical,
  );

  /// Resolves to [comfortable] on mobile/touch platforms and [standard] on
  /// desktop.
  static M3VisualDensity get adaptivePlatformDensity =>
      forPlatform(defaultTargetPlatform);

  /// Returns the recommended density for [platform]:
  /// mobile/touch → [comfortable], desktop → [standard].
  static M3VisualDensity forPlatform(TargetPlatform platform) {
    return switch (platform) {
      TargetPlatform.android ||
      TargetPlatform.iOS ||
      TargetPlatform.fuchsia =>
        comfortable,
      _ => standard,
    };
  }

  /// Returns the recommended density for [screenSize]:
  /// compact → [compact], medium → [standard], large+ → [comfortable].
  static M3VisualDensity forScreenSize(M3ScreenSize screenSize) {
    return switch (screenSize) {
      M3ScreenSize.compact => compact,
      M3ScreenSize.medium => standard,
      _ => comfortable,
    };
  }
}

/// Comparison and adjustment utilities for [M3VisualDensity].
extension M3VisualDensityUtils on M3VisualDensity {
  /// Whether this density is more compact than [other].
  bool isMoreCompactThan(M3VisualDensity other) =>
      horizontal + vertical < other.horizontal + other.vertical;

  /// Whether this density has more spacing than [other].
  bool isMoreComfortableThan(M3VisualDensity other) =>
      horizontal + vertical > other.horizontal + other.vertical;

  /// Returns a new density with [horizontal] and [vertical] offsets applied.
  VisualDensity adjustBy({double horizontal = 0.0, double vertical = 0.0}) {
    return VisualDensity(
      horizontal: this.horizontal + horizontal,
      vertical: this.vertical + vertical,
    );
  }

  /// Linearly interpolates between this density and [other] at [t].
  VisualDensity lerpTo(M3VisualDensity other, double t) =>
      VisualDensity.lerp(this, other, t);

  /// Whether this density is suitable for touch interfaces (≥ -1).
  bool get isTouchFriendly => horizontal >= -1.0 && vertical >= -1.0;

  /// Whether this density is optimized for desktop use (≤ 0).
  bool get isDesktopOptimized => horizontal <= 0.0 && vertical <= 0.0;
}

/// Context-aware visual density utilities.
extension M3VisualDensityContext on BuildContext {
  /// The current [VisualDensity] from the active [Theme].
  VisualDensity get visualDensity => Theme.of(this).visualDensity;

  /// The recommended [M3VisualDensity] for the current platform.
  M3VisualDensity get recommendedDensity =>
      M3VisualDensity.forPlatform(Theme.of(this).platform);

  /// Whether the current theme density is compact.
  bool get prefersCompactDensity {
    final d = Theme.of(this).visualDensity;
    return d.horizontal < 0 || d.vertical < 0;
  }

  /// Returns a new [ThemeData] with [density] applied.
  ThemeData withVisualDensity(M3VisualDensity density) =>
      Theme.of(this).copyWith(visualDensity: density);
}
