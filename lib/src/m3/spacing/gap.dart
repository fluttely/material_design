part of '../../../../material_design.dart';

/// Material Design 3 Gap widget with automatic orientation detection.
///
/// This widget creates spacing between elements in layouts by automatically
/// detecting the parent widget's orientation and applying the appropriate
/// spacing (horizontal or vertical). It uses Material Design 3 spacing tokens
/// to ensure consistent spacing throughout the application.
///
/// The widget automatically detects common layout widgets like Row, Column,
/// Flex, and Wrap to determine the appropriate spacing direction. If no
/// parent layout is detected, it defaults to vertical spacing.
///
/// ## Usage
///
/// ### Basic Usage
/// ```dart
/// Column(
///   children: [
///     Text('First item'),
///     M3Gap(M3Spacings.space16),
///     Text('Second item'),
///   ],
/// )
/// ```
///
/// ### With Different Tokens
/// ```dart
/// Row(
///   children: [
///     Icon(Icons.star),
///     M3Gap(M3Spacings.space8),
///     Text('Starred'),
///   ],
/// )
/// ```
///
/// ### Manual Orientation Override
/// ```dart
/// M3Gap(
///   M3Spacings.space24,
///   orientation: Axis.horizontal,
/// )
/// ```
///
/// ## Automatic Detection
///
/// The widget automatically detects these parent layout widgets:
/// - **Column**: Creates vertical spacing (SizedBox with height)
/// - **Row**: Creates horizontal spacing (SizedBox with width)
/// - **Flex**: Uses the flex direction to determine spacing
/// - **Wrap**: Uses the wrap direction to determine spacing
/// - **ListView**: Creates vertical spacing for default scroll direction
/// - **GridView**: Creates vertical spacing by default
///
/// ## Design Token Integration
///
/// All spacing values come from Material Design 3 spacing tokens:
/// - `M3Spacings.space4` - 4dp (tight spacing)
/// - `M3Spacings.space8` - 8dp (small spacing)
/// - `M3Spacings.space16` - 16dp (standard spacing)
/// - `M3Spacings.space24` - 24dp (large spacing)
/// - And many more predefined tokens...
///
/// ## Performance
///
/// This widget is lightweight and performs efficiently. The orientation
/// detection happens only once during widget creation and doesn't impact
/// runtime performance.
class M3Gap extends StatelessWidget {
  /// Creates a Material Design 3 gap with automatic orientation detection.
  ///
  /// The [spacing] parameter specifies the spacing token to use.
  /// The [orientation] parameter can be used to override automatic detection.
  const M3Gap(
    this.spacing, {
    super.key,
    this.orientation,
  });

  /// The spacing value that defines the gap size.
  final M3SpacingValue spacing;

  /// Optional orientation override for the gap direction.
  ///
  /// When null, the widget automatically detects the orientation based on
  /// the parent widget. Set to [Axis.horizontal] or [Axis.vertical] to
  /// manually specify the gap direction.
  final Axis? orientation;

  /// Detects the orientation based on the parent widget context.
  ///
  /// This method walks up the widget tree to find layout widgets and
  /// determines the appropriate spacing direction. Returns [Axis.vertical]
  /// as the default if no specific layout is detected.
  Axis _detectOrientation(BuildContext context) {
    if (orientation != null) {
      return orientation!;
    }

    Axis? detectedAxis;

    context.visitAncestorElements((element) {
      final widget = element.widget;

      if (widget is Row) {
        detectedAxis = Axis.horizontal;
        return false;
      } else if (widget is Column) {
        detectedAxis = Axis.vertical;
        return false;
      } else if (widget is Flex) {
        detectedAxis = widget.direction;
        return false;
      } else if (widget is Wrap) {
        detectedAxis = widget.direction;
        return false;
      } else if (widget is ListView) {
        final scrollDirection = widget.scrollDirection;
        detectedAxis = scrollDirection == Axis.horizontal
            ? Axis.horizontal
            : Axis.vertical;
        return false;
      } else if (widget is GridView) {
        final scrollDirection = widget.scrollDirection;
        detectedAxis = scrollDirection == Axis.horizontal
            ? Axis.horizontal
            : Axis.vertical;
        return false;
      } else if (widget is SingleChildScrollView) {
        final scrollDirection = widget.scrollDirection;
        detectedAxis = scrollDirection == Axis.horizontal
            ? Axis.horizontal
            : Axis.vertical;
        return false;
      } else if (widget is PageView) {
        final scrollDirection = widget.scrollDirection;
        detectedAxis = scrollDirection == Axis.horizontal
            ? Axis.horizontal
            : Axis.vertical;
        return false;
      }

      return true;
    });

    return detectedAxis ?? Axis.vertical;
  }

  @override
  Widget build(BuildContext context) {
    final detectedOrientation = _detectOrientation(context);

    return detectedOrientation == Axis.horizontal
        ? SizedBox(width: spacing)
        : SizedBox(height: spacing);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('spacing', spacing))
      ..add(EnumProperty<Axis?>('orientation', orientation));
  }
}

/// Extension methods for convenient gap creation.
///
/// Usage:
/// ```dart
/// Column(
///   children: [
///     Text('Item 1'),
///     M3Gap.small(),
///     Text('Item 2'),
///     M3Gap.medium(),
///     Text('Item 3'),
///   ],
/// )
/// ```
extension M3GapExtensions on M3Gap {
  static M3Gap none({Key? key, Axis? orientation}) {
    return M3Gap(M3Spacings.none, key: key, orientation: orientation);
  }

  static M3Gap extraSmall({Key? key, Axis? orientation}) {
    return M3Gap(M3Spacings.space4, key: key, orientation: orientation);
  }

  static M3Gap small({Key? key, Axis? orientation}) {
    return M3Gap(M3Spacings.space8, key: key, orientation: orientation);
  }

  static M3Gap medium({Key? key, Axis? orientation}) {
    return M3Gap(M3Spacings.space16, key: key, orientation: orientation);
  }

  static M3Gap large({Key? key, Axis? orientation}) {
    return M3Gap(M3Spacings.space24, key: key, orientation: orientation);
  }

  static M3Gap extraLarge({Key? key, Axis? orientation}) {
    return M3Gap(M3Spacings.space32, key: key, orientation: orientation);
  }
}

/// Utility class for creating multiple gaps at once.
///
/// Usage:
/// ```dart
/// Column(
///   children: M3GapUtils.addGaps(
///     [Text('Item 1'), Text('Item 2'), Text('Item 3')],
///     M3Spacings.space16,
///   ),
/// )
/// ```
class M3GapUtils {
  const M3GapUtils._();

  /// Adds gaps between widgets in a list.
  static List<Widget> addGaps(
    List<Widget> widgets,
    M3SpacingValue spacing, {
    Axis? orientation,
  }) {
    if (widgets.isEmpty) return widgets;

    final result = <Widget>[];

    for (var i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);
      if (i < widgets.length - 1) {
        result.add(M3Gap(spacing, orientation: orientation));
      }
    }

    return result;
  }

  /// Adds gaps before and after a widget.
  static List<Widget> wrapWithGaps(
    Widget widget,
    M3SpacingValue spacing, {
    Axis? orientation,
  }) {
    return [
      M3Gap(spacing, orientation: orientation),
      widget,
      M3Gap(spacing, orientation: orientation),
    ];
  }

  /// Creates a separator gap with visual indication.
  static Widget separator(
    M3SpacingValue spacing, {
    Color? color,
    double thickness = 0.5,
    Axis? orientation,
  }) {
    return Builder(
      builder: (context) {
        final actualOrientation = orientation ?? Axis.vertical;
        final lineColor = color ??
            Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3);

        if (actualOrientation == Axis.horizontal) {
          return Row(
            children: [
              M3Gap(spacing, orientation: Axis.horizontal),
              Container(
                width: thickness,
                height: 24,
                color: lineColor,
              ),
              M3Gap(spacing, orientation: Axis.horizontal),
            ],
          );
        } else {
          return Column(
            children: [
              M3Gap(spacing, orientation: Axis.vertical),
              Container(
                height: thickness,
                width: double.infinity,
                color: lineColor,
              ),
              M3Gap(spacing, orientation: Axis.vertical),
            ],
          );
        }
      },
    );
  }
}
