import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// A simple dialog for picking a color.
Future<Color?> showColorPickerDialog(BuildContext context, Color initialColor) {
  return showDialog<Color>(
    context: context,
    builder: (context) {
      Color selectedColor = initialColor;
      return AlertDialog(
        title: const Text('Pick a seed color'),
        content: SingleChildScrollView(
          child: Wrap(
            spacing: M3Spacing.space8,
            runSpacing: M3Spacing.space8,
            children:
                [
                      Colors.red,
                      Colors.pink,
                      Colors.purple,
                      Colors.deepPurple,
                      Colors.indigo,
                      Colors.blue,
                      Colors.lightBlue,
                      Colors.cyan,
                      Colors.teal,
                      Colors.green,
                      Colors.lightGreen,
                      Colors.lime,
                      Colors.yellow,
                      Colors.amber,
                      Colors.orange,
                      Colors.deepOrange,
                      Colors.brown,
                      Colors.grey,
                      Colors.blueGrey,
                    ]
                    .map(
                      (color) => GestureDetector(
                        onTap: () => Navigator.of(context).pop(color),
                        child: CircleAvatar(backgroundColor: color, radius: 20),
                      ),
                    )
                    .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
