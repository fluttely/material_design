import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = [
      ('Display Large', M3TypeScaleToken.displayLarge),
      ('Display Medium', M3TypeScaleToken.displayMedium),
      ('Display Small', M3TypeScaleToken.displaySmall),
      ('Headline Large', M3TypeScaleToken.headlineLarge),
      ('Headline Medium', M3TypeScaleToken.headlineMedium),
      ('Headline Small', M3TypeScaleToken.headlineSmall),
      ('Title Large', M3TypeScaleToken.titleLarge),
      ('Title Medium', M3TypeScaleToken.titleMedium),
      ('Title Small', M3TypeScaleToken.titleSmall),
      ('Body Large', M3TypeScaleToken.bodyLarge),
      ('Body Medium', M3TypeScaleToken.bodyMedium),
      ('Body Small', M3TypeScaleToken.bodySmall),
      ('Label Large', M3TypeScaleToken.labelLarge),
      ('Label Medium', M3TypeScaleToken.labelMedium),
      ('Label Small', M3TypeScaleToken.labelSmall),
    ];

    return Scaffold(
      appBar: AppBar(
        title: LaunchURLText(
          label: 'M3TypeScaleToken',
          m3Url: 'https://m3.material.io/styles/typography/type-scale-tokens',
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        itemCount: textStyles.length,
        itemBuilder: (context, index) {
          final (label, style) = textStyles[index];
          return Padding(
            padding: EdgeInsets.only(bottom: M3SpacingToken.space16.value),
            child: Text(label, style: style.value),
          );
        },
      ),
    );
  }
}
