import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';

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
      appBar: AppBar(title: const Text('Type Scale')),
      body: Column(
        children: [
          M3Padding(
            padding: M3EdgeInsets.only(left: M3Spacings.s12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: LaunchURLText(
                label: 'M3TypeScale',
                m3Url:
                    'https://m3.material.io/styles/typography/type-scale-tokens',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: M3EdgeInsets.all(M3Spacings.s16),
              itemCount: textStyles.length,
              itemBuilder: (context, index) {
                final (label, style) = textStyles[index];
                return M3Padding(
                  padding: M3EdgeInsets.only(bottom: M3Spacings.s16),
                  child: Text(label, style: style),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
