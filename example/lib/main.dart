import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

void main() {
  runApp(const App());
}

/// The main application widget.
class App extends StatelessWidget {
  /// Creates an [App].
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design Complete Example',
      home: const Page(),
    );
  }
}

/// The main page of the example application.
class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design Tokens Example'),
        elevation: MaterialElevation.level3,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              'MaterialElevation Tokens',
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildElevatedCard('Level 0', MaterialElevation.level0),
                  _buildElevatedCard('Level 1', MaterialElevation.level1),
                  _buildElevatedCard('Level 2', MaterialElevation.level2),
                  _buildElevatedCard('Level 3', MaterialElevation.level3),
                  _buildElevatedCard('Level 4', MaterialElevation.level4),
                  _buildElevatedCard('Level 5', MaterialElevation.level5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildElevatedCard(String label, double elevation) {
    return Card(
      elevation: elevation,
      child: SizedBox(
        width: 80,
        height: 80,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
