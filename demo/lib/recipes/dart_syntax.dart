import 'package:flutter/material.dart';

/// A Dart syntax highlighter small enough to read in one sitting.
///
/// The demo could pull in a highlighting package for this, but a code viewer
/// that ships a whole grammar engine to colour twelve-line snippets is a poor
/// trade — and, more to the point, every colour here comes out of the ambient
/// [ColorScheme], so the snippets restyle themselves when the visitor changes
/// the seed or the brightness. A third-party theme would not.
///
/// Roles are assigned by meaning, not by editor habit:
///
/// - **`M3` identifiers take `primary`.** They are what the page is about.
/// - **Numeric literals take `error`.** In a package whose entire argument is
///   that a raw `16.0` should be `M3Spacings.s16`, a bare number in a snippet
///   is the thing you are being taught not to write — so it reads as one. The
///   numbers that survive are the deliberate ones: `M3Contract.spacing(18)`.
/// - Keywords take `tertiary`, other types and strings `secondary`, comments
///   `onSurfaceVariant` in italic.
abstract final class DartSyntax {
  /// Splits [code] into spans coloured for [colorScheme].
  static List<TextSpan> spans(String code, ColorScheme colorScheme) {
    final spans = <TextSpan>[];
    var cursor = 0;

    void emit(String text, TextStyle? style) {
      if (text.isEmpty) return;
      spans.add(TextSpan(text: text, style: style));
    }

    for (final match in _token.allMatches(code)) {
      emit(code.substring(cursor, match.start), null);
      final token = match[0]!;
      emit(token, _styleFor(token, colorScheme));
      cursor = match.end;
    }
    emit(code.substring(cursor), null);

    return spans;
  }

  /// Everything worth colouring, in precedence order.
  ///
  /// Numbers precede identifiers because an identifier can never start with a
  /// digit; the raw-string prefix `r` is folded into the string alternatives so
  /// `r'…\d'` is not mistaken for an identifier followed by a string.
  static final RegExp _token = RegExp(
    <String>[
      r'//[^\n]*', // line comment
      r"r?'(?:\\.|[^'\\\n])*'", // 'string'
      r'r?"(?:\\.|[^"\\\n])*"', // "string"
      r'@[A-Za-z_]\w*', // @annotation
      r'\b\d+(?:\.\d+)?\b', // 42, 3.5
      r'\b[A-Za-z_]\w*\b', // identifier or keyword
    ].join('|'),
  );

  static TextStyle? _styleFor(String token, ColorScheme colorScheme) {
    if (token.startsWith('//')) {
      return TextStyle(
        color: colorScheme.onSurfaceVariant,
        fontStyle: FontStyle.italic,
      );
    }
    if (_isString(token)) return TextStyle(color: colorScheme.secondary);
    if (token.startsWith('@')) return TextStyle(color: colorScheme.tertiary);
    if (_startsWithDigit(token)) return TextStyle(color: colorScheme.error);
    if (_keywords.contains(token)) {
      return TextStyle(color: colorScheme.tertiary);
    }
    if (token.startsWith('M3')) {
      return TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
    }
    if (_startsUppercase(token)) return TextStyle(color: colorScheme.secondary);
    return null;
  }

  static bool _isString(String token) =>
      token.startsWith("'") ||
      token.startsWith('"') ||
      token.startsWith("r'") ||
      token.startsWith('r"');

  static bool _startsWithDigit(String token) =>
      token.codeUnitAt(0) >= 0x30 && token.codeUnitAt(0) <= 0x39;

  static bool _startsUppercase(String token) {
    final first = token[0];
    return first.toUpperCase() == first && first.toLowerCase() != first;
  }

  static const Set<String> _keywords = <String>{
    'abstract',
    'as',
    'async',
    'await',
    'break',
    'case',
    'class',
    'const',
    'continue',
    'default',
    'else',
    'enum',
    'extends',
    'external',
    'factory',
    'false',
    'final',
    'for',
    'get',
    'if',
    'implements',
    'import',
    'in',
    'is',
    'late',
    'library',
    'mixin',
    'new',
    'null',
    'on',
    'operator',
    'part',
    'required',
    'return',
    'set',
    'static',
    'super',
    'switch',
    'this',
    'throw',
    'true',
    'try',
    'typedef',
    'var',
    'void',
    'while',
    'with',
    'yield',
  };
}
