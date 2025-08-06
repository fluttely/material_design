part of '../../../../material_design.dart';

/// A responsive grid widget that follows Material Design 3 guidelines.
///
/// This widget creates a responsive grid layout that automatically adjusts
/// based on the current window size class.
class M3ResponsiveGrid extends StatelessWidget {
  /// Creates a responsive grid widget.
  const M3ResponsiveGrid({
    required this.children,
    super.key,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.childAspectRatio = 1.0,
  });

  /// The widgets to display in the grid.
  final List<Widget> children;

  /// Spacing between items along the cross axis.
  final double? crossAxisSpacing;

  /// Spacing between items along the main axis.
  final double? mainAxisSpacing;

  /// The aspect ratio of each child.
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return M3ResponsiveBuilder(
      builder: (context, screenSize) {
        final config = M3ResponsiveGridConfig.forScreenSize(screenSize);

        return Container(
          constraints: config.maxWidth != null
              ? BoxConstraints(maxWidth: config.maxWidth!)
              : null,
          padding: M3EdgeInsets.symmetric(horizontal: config.margin),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: config.columns,
            crossAxisSpacing: crossAxisSpacing ?? config.gutter,
            mainAxisSpacing: mainAxisSpacing ?? config.gutter,
            childAspectRatio: childAspectRatio,
            children: children,
          ),
        );
      },
    );
  }
}
