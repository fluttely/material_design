import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design_demo/main.dart';
import 'package:material_design_demo/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('demo boots', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const TokenShowcaseApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    final ex = tester.takeException();
    if (ex != null) {
      // ignore: avoid_print
      print('EXCEPTION >>> $ex');
    }
    expect(ex, isNull);
  });
}
