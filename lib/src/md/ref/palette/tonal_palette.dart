import 'package:flutter/material.dart';

// TODO(Kevin): Verified
/// Base class for Material Design 3 tonal palettes.
///
/// Each tonal palette contains 13 tones ranging from black (0) to white (100).
/// Additional tones are available for neutral palettes to support subtle variations.
@immutable
class TonalPalette {
  final Map<int, Color> tones;

  const TonalPalette(this.tones);

  /// Gets a color at the specified tone.
  /// Returns null if tone doesn't exist.
  Color? operator [](int tone) => tones[tone];

  /// Gets a color at the specified tone with a fallback.
  Color get(int tone, {Color? fallback}) =>
      tones[tone] ?? fallback ?? tones[40]!;

  /// Checks if a tone exists in the palette
  bool hasTone(int tone) => tones.containsKey(tone);

  /// Gets all available tones
  List<int> get availableTones => tones.keys.toList()..sort();

  /// Interpolates between tones for smooth color transitions.
  /// Useful for animations and dynamic theming.
  Color interpolate(double tone) {
    if (tones.containsKey(tone.toInt())) {
      return tones[tone.toInt()]!;
    }

    final sortedTones = availableTones;

    // Find surrounding tones
    int? lowerTone, upperTone;
    for (final t in sortedTones) {
      if (t <= tone) lowerTone = t;
      if (t >= tone && upperTone == null) upperTone = t;
    }

    if (lowerTone == null || upperTone == null || lowerTone == upperTone) {
      return tones[40]!; // Default fallback
    }

    final lowerColor = tones[lowerTone]!;
    final upperColor = tones[upperTone]!;
    final t = (tone - lowerTone) / (upperTone - lowerTone);

    return Color.lerp(lowerColor, upperColor, t)!;
  }
}
