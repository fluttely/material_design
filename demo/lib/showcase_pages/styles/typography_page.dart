import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = [
      ('Display Large', M3TextStyle.displayLarge),
      ('Display Medium', M3TextStyle.displayMedium),
      ('Display Small', M3TextStyle.displaySmall),
      ('Headline Large', M3TextStyle.headlineLarge),
      ('Headline Medium', M3TextStyle.headlineMedium),
      ('Headline Small', M3TextStyle.headlineSmall),
      ('Title Large', M3TextStyle.titleLarge),
      ('Title Medium', M3TextStyle.titleMedium),
      ('Title Small', M3TextStyle.titleSmall),
      ('Body Large', M3TextStyle.bodyLarge),
      ('Body Medium', M3TextStyle.bodyMedium),
      ('Body Small', M3TextStyle.bodySmall),
      ('Label Large', M3TextStyle.labelLarge),
      ('Label Medium', M3TextStyle.labelMedium),
      ('Label Small', M3TextStyle.labelSmall),
    ];

    return Scaffold(
      appBar: AppBar(
        title: LaunchURLText(
          label: 'M3TextStyleToken',
          m3Url: 'https://m3.material.io/styles/typography/type-scale-tokens',
        ),
      ),
      body: ListView.builder(
        padding: M3EdgeInsets.all(M3SpacingToken.space16),
        itemCount: textStyles.length,
        itemBuilder: (context, index) {
          final (label, style) = textStyles[index];
          return M3Padding(
            padding: M3EdgeInsets.only(bottom: M3SpacingToken.space16),
            child: Text(label, style: style),
          );
        },
      ),
    );
  }
}
