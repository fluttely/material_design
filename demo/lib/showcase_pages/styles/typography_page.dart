import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = [
      ('Display Large', M3TextStyleToken.displayLarge),
      ('Display Medium', M3TextStyleToken.displayMedium),
      ('Display Small', M3TextStyleToken.displaySmall),
      ('Headline Large', M3TextStyleToken.headlineLarge),
      ('Headline Medium', M3TextStyleToken.headlineMedium),
      ('Headline Small', M3TextStyleToken.headlineSmall),
      ('Title Large', M3TextStyleToken.titleLarge),
      ('Title Medium', M3TextStyleToken.titleMedium),
      ('Title Small', M3TextStyleToken.titleSmall),
      ('Body Large', M3TextStyleToken.bodyLarge),
      ('Body Medium', M3TextStyleToken.bodyMedium),
      ('Body Small', M3TextStyleToken.bodySmall),
      ('Label Large', M3TextStyleToken.labelLarge),
      ('Label Medium', M3TextStyleToken.labelMedium),
      ('Label Small', M3TextStyleToken.labelSmall),
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
          return M3Padding.only(
            bottom: M3SpacingToken.space16,
            child: Text(label, style: style.value),
          );
        },
      ),
    );
  }
}
