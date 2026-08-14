part of '../../../color.dart';

/// A custom brand color expanded into the four Material Design 3 roles.
///
/// M3 calls these "custom colors": a color your product owns (a status green,
/// a brand orange) that still has to sit inside a seeded scheme without
/// clashing. The spec derives four roles from a tonal palette of that color,
/// at fixed tone stops per brightness.
///
/// ```dart
/// final success = M3ExtendedColor.harmonized(
///   name: 'success',
///   source: const Color(0xFF2E7D32),
///   harmonizeWith: colorScheme.primary,
///   brightness: Theme.of(context).brightness,
/// );
/// Container(
///   color: success.colorContainer,
///   child: Text('Saved', style: TextStyle(color: success.onColorContainer)),
/// );
/// ```
///
/// Spec: https://m3.material.io/styles/color/advanced/define-new-colors
@immutable
class M3ExtendedColor {
  /// Derives the four roles from [source] without shifting its hue.
  ///
  /// Use this when the color is a fixed brand asset that must not move.
  factory M3ExtendedColor({
    required String name,
    required Color source,
    required Brightness brightness,
  }) {
    final palette = M3TonalPalette.fromColor(source);
    final isLight = brightness == Brightness.light;
    return M3ExtendedColor._(
      name: name,
      source: source,
      color: palette[isLight ? M3Tones.t40 : M3Tones.t80],
      onColor: palette[isLight ? M3Tones.t100 : M3Tones.t20],
      colorContainer: palette[isLight ? M3Tones.t90 : M3Tones.t30],
      onColorContainer: palette[isLight ? M3Tones.t10 : M3Tones.t90],
    );
  }

  /// Derives the four roles after rotating [source] toward [harmonizeWith].
  ///
  /// Harmonization shifts the hue a limited amount (at most 15°) in HCT space
  /// so the custom color reads as part of the seeded scheme. This is the
  /// spec algorithm — `Blend.harmonize` from `material_color_utilities` — not
  /// an HSL approximation.
  factory M3ExtendedColor.harmonized({
    required String name,
    required Color source,
    required Color harmonizeWith,
    required Brightness brightness,
  }) {
    return M3ExtendedColor(
      name: name,
      source: M3ColorUtils.harmonize(source, harmonizeWith),
      brightness: brightness,
    );
  }

  const M3ExtendedColor._({
    required this.name,
    required this.source,
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  /// Identifier used to look this color up in [M3ExtendedColors].
  final String name;

  /// The color the roles were derived from, after any harmonization.
  final Color source;

  /// The main role — tone 40 in light schemes, tone 80 in dark.
  final Color color;

  /// Content drawn on top of [color].
  final Color onColor;

  /// The container role — tone 90 in light schemes, tone 30 in dark.
  final Color colorContainer;

  /// Content drawn on top of [colorContainer].
  final Color onColorContainer;

  /// Linearly interpolates between two extended colors.
  ///
  /// Static rather than a constructor, matching `Color.lerp` and
  /// `ThemeExtension.lerp`.
  // ignore: prefer_constructors_over_static_methods
  static M3ExtendedColor lerp(M3ExtendedColor a, M3ExtendedColor b, double t) {
    return M3ExtendedColor._(
      name: t < 0.5 ? a.name : b.name,
      source: Color.lerp(a.source, b.source, t)!,
      color: Color.lerp(a.color, b.color, t)!,
      onColor: Color.lerp(a.onColor, b.onColor, t)!,
      colorContainer: Color.lerp(a.colorContainer, b.colorContainer, t)!,
      onColorContainer: Color.lerp(a.onColorContainer, b.onColorContainer, t)!,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is M3ExtendedColor &&
      other.name == name &&
      other.source == source &&
      other.color == color &&
      other.onColor == onColor &&
      other.colorContainer == colorContainer &&
      other.onColorContainer == onColorContainer;

  @override
  int get hashCode => Object.hash(
        name,
        source,
        color,
        onColor,
        colorContainer,
        onColorContainer,
      );

  @override
  String toString() => 'M3ExtendedColor($name, source: $source)';
}

/// Carries [M3ExtendedColor]s through the theme.
///
/// ```dart
/// ThemeData(
///   extensions: [
///     M3ExtendedColors.of({
///       'success': const Color(0xFF2E7D32),
///       'warning': const Color(0xFFF9A825),
///     }, harmonizeWith: scheme.primary, brightness: Brightness.light),
///   ],
/// );
///
/// // later
/// final success = M3ExtendedColors.from(context)['success']!;
/// ```
@immutable
class M3ExtendedColors extends ThemeExtension<M3ExtendedColors> {
  /// Wraps an already-built set of colors.
  const M3ExtendedColors(this.colors);

  /// Builds and harmonizes a set of named brand colors in one call.
  factory M3ExtendedColors.of(
    Map<String, Color> sources, {
    required Brightness brightness,
    Color? harmonizeWith,
  }) {
    return M3ExtendedColors({
      for (final MapEntry(key: name, value: source) in sources.entries)
        name: harmonizeWith == null
            ? M3ExtendedColor(
                name: name,
                source: source,
                brightness: brightness,
              )
            : M3ExtendedColor.harmonized(
                name: name,
                source: source,
                harmonizeWith: harmonizeWith,
                brightness: brightness,
              ),
    });
  }

  /// The colors, keyed by [M3ExtendedColor.name].
  final Map<String, M3ExtendedColor> colors;

  /// Reads the extended colors from the ambient theme.
  ///
  /// Returns an empty set rather than throwing when the extension is absent,
  /// so a widget can degrade instead of crashing.
  ///
  /// Static rather than a constructor: it resolves an existing instance out of
  /// the theme rather than building a new one.
  // ignore: prefer_constructors_over_static_methods
  static M3ExtendedColors from(BuildContext context) =>
      Theme.of(context).extension<M3ExtendedColors>() ??
      const M3ExtendedColors({});

  /// Looks a color up by name.
  M3ExtendedColor? operator [](String name) => colors[name];

  @override
  M3ExtendedColors copyWith({Map<String, M3ExtendedColor>? colors}) =>
      M3ExtendedColors(colors ?? this.colors);

  @override
  M3ExtendedColors lerp(ThemeExtension<M3ExtendedColors>? other, double t) {
    if (other is! M3ExtendedColors) return this;
    return M3ExtendedColors({
      for (final MapEntry(key: name, value: color) in colors.entries)
        name: other.colors[name] == null
            ? color
            : M3ExtendedColor.lerp(color, other.colors[name]!, t),
    });
  }
}
