import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_example/showcase_pages/widgets/launch_url_text.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = [
      ('Display Large', M3TypeScale.displayLarge),
      ('Display Medium', M3TypeScale.displayMedium),
      ('Display Small', M3TypeScale.displaySmall),
      ('Headline Large', M3TypeScale.headlineLarge),
      ('Headline Medium', M3TypeScale.headlineMedium),
      ('Headline Small', M3TypeScale.headlineSmall),
      ('Title Large', M3TypeScale.titleLarge),
      ('Title Medium', M3TypeScale.titleMedium),
      ('Title Small', M3TypeScale.titleSmall),
      ('Body Large', M3TypeScale.bodyLarge),
      ('Body Medium', M3TypeScale.bodyMedium),
      ('Body Small', M3TypeScale.bodySmall),
      ('Label Large', M3TypeScale.labelLarge),
      ('Label Medium', M3TypeScale.labelMedium),
      ('Label Small', M3TypeScale.labelSmall),
    ];

    return Scaffold(
      appBar: AppBar(
        title: LaunchURLText(
          label: 'M3TypeScale Tokens',
          m3Url: 'https://m3.material.io/styles/typography/type-scale-tokens',
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(M3Spacing.space16),
        itemCount: textStyles.length,
        itemBuilder: (context, index) {
          final (label, style) = textStyles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: M3Spacing.space16),
            child: Text(label, style: style),
          );
        },
      ),
    );
  }
}
