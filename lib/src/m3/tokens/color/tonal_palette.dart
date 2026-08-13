part of '../../../tokens.dart';

/// Type-safe wrapper for a Material Design 3 tone value.
///
/// A tone is a lightness stop from 0 (black) to 100 (white) in the HCT color
/// space. Implements [int] so it can be compared and sorted directly.
///
/// See [M3Contract] for the escape hatch when you need a tone off the scale.
extension type const M3ToneValue._(int tone) implements int {}

/// The thirteen tone stops Material Design 3 samples from every palette.
///
/// The scale is deliberately uneven at the light end — 95 and 99 sit close
/// together because that is where surface colors live, and a linear step
/// there would make every container look the same.
///
/// Reference: https://m3.material.io/styles/color/system/how-the-system-works
abstract final class M3Tones {
  /// Tone 0 — pure black.
  static const M3ToneValue t0 = M3ToneValue._(0);

  /// Tone 10 — `onSurface` in dark schemes, `onPrimaryContainer` in light.
  static const M3ToneValue t10 = M3ToneValue._(10);

  /// Tone 20 — `primaryContainer` in dark schemes.
  static const M3ToneValue t20 = M3ToneValue._(20);

  /// Tone 30 — `onPrimaryContainer` in dark schemes.
  static const M3ToneValue t30 = M3ToneValue._(30);

  /// Tone 40 — the `primary` role in light schemes.
  static const M3ToneValue t40 = M3ToneValue._(40);

  /// Tone 50 — mid-tone, rarely mapped to a role directly.
  static const M3ToneValue t50 = M3ToneValue._(50);

  /// Tone 60 — medium-light.
  static const M3ToneValue t60 = M3ToneValue._(60);

  /// Tone 70 — light.
  static const M3ToneValue t70 = M3ToneValue._(70);

  /// Tone 80 — the `primary` role in dark schemes.
  static const M3ToneValue t80 = M3ToneValue._(80);

  /// Tone 90 — `primaryContainer` in light schemes.
  static const M3ToneValue t90 = M3ToneValue._(90);

  /// Tone 95 — `surfaceContainerHighest` territory in light schemes.
  static const M3ToneValue t95 = M3ToneValue._(95);

  /// Tone 99 — near-white surface.
  static const M3ToneValue t99 = M3ToneValue._(99);

  /// Tone 100 — pure white.
  static const M3ToneValue t100 = M3ToneValue._(100);

  /// All thirteen tones, from darkest to lightest.
  static const List<M3ToneValue> values = <M3ToneValue>[
    t0,
    t10,
    t20,
    t30,
    t40,
    t50,
    t60,
    t70,
    t80,
    t90,
    t95,
    t99,
    t100,
  ];
}

/// A Material Design 3 tonal palette — one hue and chroma sampled across the
/// tone scale.
///
/// This is the mechanism behind every M3 color role. A seed color is converted
/// to HCT, its hue and chroma are held fixed, and lightness is swept across
/// [M3Tones]. Light and dark schemes then pull different tones from the same
/// palette, which is why an M3 theme stays recognisable in both.
///
/// ```dart
/// final palette = M3TonalPalette.fromSeed(const Color(0xFF6750A4));
/// palette[M3Tones.t40];  // the light-scheme `primary`
/// palette[M3Tones.t80];  // the dark-scheme `primary`
/// ```
///
/// Reference: https://m3.material.io/styles/color/system/how-the-system-works
@immutable
class M3TonalPalette {
  const M3TonalPalette._(this._palette);

  /// Builds the palette for an arbitrary [color], preserving its exact hue
  /// and chroma.
  ///
  /// Use this to tone a brand color you must match precisely. For generating
  /// a scheme, prefer [M3TonalPalette.fromSeed], which lets Material adjust
  /// chroma for legibility.
  factory M3TonalPalette.fromColor(Color color) => M3TonalPalette._(
        mcu.TonalPalette.fromHct(mcu.Hct.fromInt(color.toARGB32())),
      );

  /// Builds the primary palette Material Design would generate from [seed].
  factory M3TonalPalette.fromSeed(Color seed) =>
      M3CorePalette.fromSeed(seed).primary;

  /// Builds a palette directly from a [hue] (0–360) and [chroma].
  factory M3TonalPalette.of({required double hue, required double chroma}) =>
      M3TonalPalette._(mcu.TonalPalette.of(hue, chroma));

  final mcu.TonalPalette _palette;

  /// Returns the color at [tone].
  ///
  /// Accepts any tone from 0 to 100, not only the [M3Tones] stops, so that
  /// gradients and animations between tones remain possible.
  Color tone(int tone) => Color(_palette.get(tone));

  /// Shorthand for [tone].
  Color operator [](int tone) => this.tone(tone);

  /// The palette sampled at every stop in [M3Tones], darkest first.
  List<Color> get tones =>
      M3Tones.values.map((t) => Color(_palette.get(t))).toList(growable: false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is M3TonalPalette && other._palette == _palette;

  @override
  int get hashCode => _palette.hashCode;

  @override
  String toString() => 'M3TonalPalette(${tone(M3Tones.t40)})';
}

/// The six tonal palettes Material Design 3 derives from a single seed color.
///
/// Every role in a [ColorScheme] is a tone drawn from one of these.
///
/// ```dart
/// final core = M3CorePalette.fromSeed(const Color(0xFF6750A4));
/// core.neutral[M3Tones.t99];  // the light-scheme `surface`
/// ```
///
/// Reference: https://m3.material.io/styles/color/system/how-the-system-works
@immutable
class M3CorePalette {
  const M3CorePalette._({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
    required this.neutralVariant,
    required this.error,
  });

  /// Generates the six palettes Material Design derives from [seed].
  factory M3CorePalette.fromSeed(Color seed) {
    // CorePalette is marked deprecated in favour of DynamicScheme, but it is
    // the one API present across every material_color_utilities version the
    // Flutter SDK pins within our supported range. Users cannot pick that
    // version themselves, so compatibility wins here.
    // ignore: deprecated_member_use
    final core = mcu.CorePalette.of(seed.toARGB32());
    return M3CorePalette._(
      primary: M3TonalPalette._(core.primary),
      secondary: M3TonalPalette._(core.secondary),
      tertiary: M3TonalPalette._(core.tertiary),
      neutral: M3TonalPalette._(core.neutral),
      neutralVariant: M3TonalPalette._(core.neutralVariant),
      error: M3TonalPalette._(core.error),
    );
  }

  /// The palette behind `primary`, `onPrimary`, and `primaryContainer`.
  final M3TonalPalette primary;

  /// The palette behind the `secondary` roles — less prominent accents.
  final M3TonalPalette secondary;

  /// The palette behind the `tertiary` roles — contrasting accents.
  final M3TonalPalette tertiary;

  /// The near-neutral palette behind `surface` and `background` roles.
  final M3TonalPalette neutral;

  /// The neutral variant palette behind `surfaceVariant` and `outline`.
  final M3TonalPalette neutralVariant;

  /// The fixed red palette behind the `error` roles.
  final M3TonalPalette error;

  /// The six palettes, in the order Material Design documents them.
  List<M3TonalPalette> get values => <M3TonalPalette>[
        primary,
        secondary,
        tertiary,
        neutral,
        neutralVariant,
        error,
      ];
}
