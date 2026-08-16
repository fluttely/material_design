import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:url_launcher/url_launcher.dart';

/// A caption naming the API a block of the showcase demonstrates, linking to
/// the spec page behind it when there is one.
///
/// Link affordance comes from the color scheme's `primary` role and an
/// [M3StateLayer] — the same overlay the package gives any consumer — rather
/// than from a hard-coded blue with no hover feedback.
class ShowcaseLink extends StatelessWidget {
  const ShowcaseLink({
    required this.label,
    super.key,
    this.url,
    this.style,
  });

  /// The API name or section title.
  final String label;

  /// The page this caption links to. When null the caption is plain text.
  final String? url;

  /// Overrides the caption's text style. Defaults to `titleLarge`.
  final TextStyle? style;

  Future<void> _open() =>
      launchUrl(Uri.parse(url!), webOnlyWindowName: '_blank');

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseStyle = style ?? Theme.of(context).textTheme.titleLarge;

    if (url == null) {
      return M3Padding(
        padding: const M3EdgeInsets.symmetric(vertical: M3Spacings.s16),
        child: Text(label, style: baseStyle, textAlign: TextAlign.center),
      );
    }

    return M3Padding(
      padding: const M3EdgeInsets.symmetric(vertical: M3Spacings.s16),
      child: Tooltip(
        message: url!,
        child: M3StateLayer(
          overlayColor: colorScheme.primary,
          borderRadius: M3BorderRadius.small,
          onTap: _open,
          child: M3Padding(
            padding: const M3EdgeInsets.symmetric(
              horizontal: M3Spacings.s4,
              vertical: M3Spacings.s4,
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: baseStyle?.copyWith(
                color: colorScheme.primary,
                decoration: TextDecoration.underline,
                decorationColor: colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
