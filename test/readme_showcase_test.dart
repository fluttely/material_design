import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

/// The showcase published in README.md, kept honest by compiling it here.
///
/// If the public API changes shape, this file stops compiling and the README
/// gets fixed with it.
class PremiumCardShowcase extends StatelessWidget {
  const PremiumCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return M3FocusRing(
      borderRadius: M3BorderRadius.large,
      child: M3StateLayer(
        overlayColor: colorScheme.onSurface,
        borderRadius: M3BorderRadius.large,
        onTap: () {
          // Action handler
        },
        child: AnimatedContainer(
          duration: M3Motion.emphasized.duration,
          curve: M3Motion.emphasized.curve,
          padding: const M3EdgeInsets.all(M3Spacings.s24),
          decoration: M3BoxDecoration(
            color: colorScheme.surfaceAtElevation(M3Elevation.level1),
            borderRadius: M3BorderRadius.large,
            border: M3Border.all(
              outlineColor: colorScheme.outlineVariant,
              // Spelled out in the README even though it is the default —
              // showing the token is the point of the example.
              // ignore: avoid_redundant_argument_values
              width: M3BorderWidths.thin,
            ),
            boxShadow: M3ElevationShadows.level1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'COMPILATION SAFE',
                style: M3TypeScale.labelMedium.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              const M3Gap(M3Spacings.s8),
              Text(
                'Material 3 Contract Design',
                style: M3TypeScale.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const M3Gap(M3Spacings.s16),
              Text(
                'Every spacing, border width, opacity, and text style here '
                'flows through an M3 token.',
                style: M3TypeScale.bodyMedium.copyWith(
                  color: colorScheme.disabledContent(colorScheme.onSurface),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('the README showcase builds and renders', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          textTheme: M3TextTheme.toTextTheme(),
          visualDensity: M3VisualDensity.standard,
        ),
        home: const Scaffold(
          body: Center(child: PremiumCardShowcase()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Material 3 Contract Design'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
