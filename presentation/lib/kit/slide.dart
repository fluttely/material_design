import 'package:flutter/material.dart';

/// One slide: how to build it, and the block it belongs to.
class Slide {
  const Slide({required this.section, required this.build});

  /// Shown bottom-left, so the room always knows which block it is in.
  final String section;

  final WidgetBuilder build;
}

/// The deck has one running argument — context that rots versus context a
/// machine enforces — so it has exactly two colours beyond the scheme.
///
/// They are fixed rather than derived: ✗ and ✓ have to mean the same thing on
/// every slide, in both brightnesses.
extension DeckColors on ColorScheme {
  /// Prose, conventions, memory: true when written, silently false later.
  Color get rots => brightness == Brightness.dark
      ? const Color(0xFFFFB4A8)
      : const Color(0xFFB3261E);

  /// Types, tests, scripts: things that fail out loud when they stop matching.
  Color get enforced => brightness == Brightness.dark
      ? const Color(0xFF7BDCA0)
      : const Color(0xFF1E6B3C);
}
