import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchURLText extends StatelessWidget {
  const LaunchURLText({
    super.key,
    required this.label,
    this.fontSize,
    this.m3Url,
  });

  final String label;
  final double? fontSize;
  final String? m3Url;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return M3Padding(
      padding: M3EdgeInsets.symmetric(
        vertical: M3SpacingToken.space16,
      ),
      child: Tooltip(
        message: m3Url ?? '',
        child: GestureDetector(
          onTap: m3Url == null
              ? null
              : () async {
                  await launchUrl(
                    Uri.parse(m3Url!),
                    webOnlyWindowName: '_blank',
                  );
                },
          child: Text(
            label,
            style: m3Url == null
                ? textTheme.titleLarge
                : textTheme.titleLarge?.copyWith(
                    fontSize: fontSize,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
          ),
        ),
      ),
    );
  }
}
