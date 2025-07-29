import 'package:flutter/material.dart';
import 'package:material_design_demo/m3_expressive/loading_indicator/main.dart';
// import 'package:material_design_demo/m3_expressive/new_shapes/shapes_preview.dart';

class M3ExpressivePage extends StatefulWidget {
  const M3ExpressivePage({super.key});

  @override
  State<M3ExpressivePage> createState() => _M3ExpressivePageState();
}

class _M3ExpressivePageState extends State<M3ExpressivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M3 Expressive'),
      ),
      // body: SingleChildScrollView(
      //   padding: M3EdgeInsets.all(M3SpacingToken.space16),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const LaunchURLText(
      //         label: 'M3SpacingToken (for Padding)',
      //         m3Url:
      //             'https://m3.material.io/foundations/layout/understanding-layout/spacing',
      //       ),
      //       const M3Gap(M3SpacingToken.space8),
      //       Text(
      //         'Material Design uses a 4dp base unit for spacing. This creates visual rhythm and hierarchy.',
      //         style: textTheme.bodyMedium,
      //       ),
      //       const M3Gap(M3SpacingToken.space16),
      //       ...spacings.map((token) => _buildSpacingDemo(token.$1, token.$2)),
      //       const M3Gap(M3SpacingToken.space32),
      //       const LaunchURLText(
      //         label: 'M3MarginToken (by screen sizes)',
      //         m3Url:
      //             'https://m3.material.io/foundations/layout/applying-layout/compact',
      //       ),
      //       const M3Gap(M3SpacingToken.space8),
      //       ...margins.map((margin) => _buildSpacingDemo(margin.$1, margin.$2)),
      //       const M3Gap(M3SpacingToken.space32),
      //       const LaunchURLText(
      //         label: 'M3SpacerToken (between two panes)',
      //         m3Url:
      //             'https://m3.material.io/foundations/layout/understanding-layout/spacing',
      //       ),
      //       const M3Gap(M3SpacingToken.space8),
      //       ...spacers.map((spacer) => _buildSpacingDemo(spacer.$1, spacer.$2)),
      //     ],
      //   ),
      // ),

      body: Column(
        children: [
          // ShapesPreview(),
          SizedBox(
            height: 100,
            child: LoadingIndicatorPage(),
          ),
        ],
      ),
    );
  }

  // // This original method is kept as it's used by other lists.
  // Widget _buildSpacingRow(
  //   BuildContext context,
  //   String label,
  //   double value,
  // ) {
  //   final textTheme = Theme.of(context).textTheme;
  //   final colorScheme = Theme.of(context).colorScheme;

  //   final isInfinity = value == double.infinity;

  //   return M3Padding(
  //     padding: const M3EdgeInsets.symmetric(vertical: 4.0),
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 120,
  //           child: Text(
  //             '$label (${isInfinity ? "∞" : value.toInt()}dp):',
  //             style: textTheme.bodyMedium,
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //         const M3Gap(M3SpacingToken.space16),
  //         Expanded(
  //           child: isInfinity
  //               ? Text(
  //                   'Represents unbounded space',
  //                   style: textTheme.bodySmall?.copyWith(
  //                     color: colorScheme.onSurfaceVariant,
  //                     fontStyle: FontStyle.italic,
  //                   ),
  //                 )
  //               : Container(
  //                   height: value,
  //                   decoration: ShapeDecoration(
  //                     color: colorScheme.secondaryContainer,
  //                     shape: M3ShapeToken.extraSmall,
  //                   ),
  //                 ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
