// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:material_design/material_design.dart';

// void main() {
//   group('M3ShapeExtensions', () {
//     testWidgets('withShape creates shaped container', (tester) async {
//       const testWidget = Text('Shaped Widget');

//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: testWidget.withShape(
//               M3ShapeToken.medium,
//               color: Colors.blue,
//             ),
//           ),
//         ),
//       );

//       final container = tester.widget<Container>(find.byType(Container));
//       expect(container.decoration, isA<ShapeDecoration>());

//       final decoration = container.decoration! as ShapeDecoration;
//       expect(decoration.shape, equals(M3ShapeToken.medium.value));
//       expect(decoration.color, equals(Colors.blue));

//       expect(find.text('Shaped Widget'), findsOneWidget);
//     });

//     testWidgets('withShape creates shaped container without color',
//         (tester) async {
//       const testWidget = Text('Shaped Widget');

//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: testWidget.withShape(M3ShapeToken.large),
//           ),
//         ),
//       );

//       final container = tester.widget<Container>(find.byType(Container));
//       expect(container.decoration, isA<ShapeDecoration>());

//       final decoration = container.decoration! as ShapeDecoration;
//       expect(decoration.shape, equals(M3ShapeToken.large.value));
//       expect(decoration.color, isNull);
//     });

//     testWidgets('clipWithShape clips widget with border radius',
//         (tester) async {
//       const testWidget = Text('Clipped Widget');

//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: testWidget.clipWithShape(M3ShapeToken.extraLarge),
//           ),
//         ),
//       );

//       final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));
//       expect(
//           clipRRect.borderRadius, equals(M3BorderRadiusToken.extraLarge.value));

//       expect(find.text('Clipped Widget'), findsOneWidget);
//     });

//     testWidgets('clipWithShape works with different shape tokens',
//         (tester) async {
//       const testWidget = Text('Clipped Widget');

//       final shapes = [
//         M3ShapeToken.none,
//         M3ShapeToken.small,
//         M3ShapeToken.medium,
//         M3ShapeToken.large,
//         M3ShapeToken.full,
//       ];

//       for (final shape in shapes) {
//         await tester.pumpWidget(
//           MaterialApp(
//             home: Scaffold(
//               body: testWidget.clipWithShape(shape),
//             ),
//           ),
//         );

//         final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));
//         expect(clipRRect.borderRadius, equals(shape.borderRadius.value));
//       }
//     });

//     testWidgets('withShape works with different colors', (tester) async {
//       const testWidget = Text('Colored Shape');

//       final colors = [
//         Colors.red,
//         Colors.green,
//         Colors.blue,
//         Colors.transparent,
//       ];

//       for (final color in colors) {
//         await tester.pumpWidget(
//           MaterialApp(
//             home: Scaffold(
//               body: testWidget.withShape(
//                 M3ShapeToken.medium,
//                 color: color,
//               ),
//             ),
//           ),
//         );

//         final container = tester.widget<Container>(find.byType(Container));
//         final decoration = container.decoration! as ShapeDecoration;
//         expect(decoration.color, equals(color));
//       }
//     });

//     testWidgets('extensions work with complex widgets', (tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: Scaffold(
//             body: Column(
//               children: [
//                 const Icon(Icons.star).withShape(
//                   M3ShapeToken.small,
//                   color: Colors.yellow,
//                 ),
//                 const Text('Clipped Text').clipWithShape(M3ShapeToken.large),
//               ],
//             ),
//           ),
//         ),
//       );

//       expect(find.byType(Container), findsOneWidget);
//       expect(find.byType(ClipRRect), findsOneWidget);
//       expect(find.byIcon(Icons.star), findsOneWidget);
//       expect(find.text('Clipped Text'), findsOneWidget);
//     });

//     // test('extensions preserve widget hierarchy', () {
//     //   const widget = Text('Test');

//     //   final shapedWidget = widget.withShape(M3ShapeToken.medium);
//     //   expect(shapedWidget, isA<Container>());
//     //   expect(shapedWidget.child, equals(widget));

//     //   final clippedWidget = widget.clipWithShape(M3ShapeToken.medium);
//     //   expect(clippedWidget, isA<ClipRRect>());
//     //   expect(clippedWidget.child, equals(widget));
//     // });
//   });
// }
