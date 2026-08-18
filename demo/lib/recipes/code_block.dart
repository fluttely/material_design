import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/dart_syntax.dart';

/// A snippet, highlighted from the ambient scheme and ready to copy.
///
/// Long lines scroll sideways rather than wrap: a wrapped line of Dart reads
/// as a different program from the one you would paste.
class CodeBlock extends StatelessWidget {
  const CodeBlock(this.code, {super.key});

  /// The snippet to show.
  ///
  /// Trimmed before it is shown or copied, so a recipe can open its `'''`
  /// string on its own line and keep the snippet flush-left in the source.
  final String code;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final snippet = code.trim();

    return DecoratedBox(
      decoration: M3ShapeDecoration(
        shape: M3Shape.medium,
        color: colorScheme.surfaceContainerHigh,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CodeBlockBar(code: snippet),
          M3Padding(
            padding: const M3EdgeInsets.fromLTRB(
              M3Spacings.s16,
              M3Spacings.none,
              M3Spacings.s16,
              M3Spacings.s16,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SelectableText.rich(
                TextSpan(
                  style: M3TextUtils.mono(M3TypeScale.bodyMedium).copyWith(
                    color: colorScheme.onSurface,
                  ),
                  children: DartSyntax.spans(snippet, colorScheme),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The language label and the copy action above a snippet.
class _CodeBlockBar extends StatelessWidget {
  const _CodeBlockBar({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return M3Padding(
      padding: const M3EdgeInsets.only(
        left: M3Spacings.s16,
        right: M3Spacings.s8,
        top: M3Spacings.s4,
      ),
      child: Row(
        children: [
          Text(
            'dart',
            style: M3TypeScale.labelSmall.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Spacer(),
          _CopyButton(code: code),
        ],
      ),
    );
  }
}

/// Copies the snippet and says so, by becoming a checkmark for a moment.
///
/// A snackbar would cover the next recipe down, which is the one a reader is
/// usually about to look at.
class _CopyButton extends StatefulWidget {
  const _CopyButton({required this.code});

  final String code;

  @override
  State<_CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<_CopyButton> {
  Timer? _reset;
  bool _copied = false;

  @override
  void dispose() {
    _reset?.cancel();
    super.dispose();
  }

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    if (!mounted) return;

    setState(() => _copied = true);
    _reset?.cancel();
    _reset = Timer(M3MotionDuration.extraLong4 * 2, () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      tooltip: _copied ? 'Copied' : 'Copy snippet',
      onPressed: _copy,
      iconSize: M3IconSizes.dense,
      icon: Icon(
        _copied ? Icons.check : Icons.content_copy_outlined,
        color: _copied ? colorScheme.primary : colorScheme.onSurfaceVariant,
      ),
    );
  }
}
