import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchURLText extends StatelessWidget {
  const LaunchURLText({
    super.key,
    required this.label,
    this.fontSize,
    this.url,
  });

  final String label;
  final double? fontSize;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return M3Padding(
      padding: M3EdgeInsets.symmetric(
        vertical: M3Spacings.s16,
      ),
      child: Tooltip(
        message: url ?? '',
        child: GestureDetector(
          onTap: url == null
              ? null
              : () async {
                  await launchUrl(
                    Uri.parse(url!),
                    webOnlyWindowName: '_blank',
                  );
                },
          child: Text(
            label,
            style: url == null
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
