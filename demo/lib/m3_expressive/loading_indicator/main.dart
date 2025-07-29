import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class LoadingIndicatorPage extends StatefulWidget {
  const LoadingIndicatorPage({super.key});

  @override
  State<LoadingIndicatorPage> createState() => _LoadingIndicatorPageState();
}

class _LoadingIndicatorPageState extends State<LoadingIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 80,
          runSpacing: 80,
          children: [
            SizedBox.square(
              dimension: 160,
              child: LoadingIndicator(),
            ),
            SizedBox.square(
              dimension: 160,
              child: LoadingIndicator.contained(),
            ),
          ],
        ),
      ),
    );
  }
}
