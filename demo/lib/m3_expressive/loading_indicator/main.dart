import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Embeddable showcase of the M3 Expressive loading indicators.
class LoadingIndicatorPage extends StatelessWidget {
  const LoadingIndicatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: M3Spacings.s32,
      runSpacing: M3Spacings.s32,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 96,
              height: 96,
              child: M3ELoadingIndicator(),
            ),
            const M3Gap(M3Spacings.s8),
            Text('Default', style: textTheme.labelMedium),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 96,
              height: 96,
              child: M3ELoadingIndicator.contained(),
            ),
            const M3Gap(M3Spacings.s8),
            Text('Contained', style: textTheme.labelMedium),
          ],
        ),
      ],
    );
  }
}
