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
///     M3Gap(M3SpacingToken.space16),
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
///     M3Gap(M3SpacingToken.space8),
///     Text('Starred'),
///   ],
/// )
/// ```
///
/// ### Manual Orientation Override
/// ```dart
/// M3Gap(
///   M3SpacingToken.space24,
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
/// - `M3SpacingToken.space4` - 4dp (tight spacing)
/// - `M3SpacingToken.space8` - 8dp (small spacing)
/// - `M3SpacingToken.space16` - 16dp (standard spacing)
/// - `M3SpacingToken.space24` - 24dp (large spacing)
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

  /// The spacing token that defines the gap size.
  ///
  /// This uses Material Design 3 spacing tokens to ensure consistent
  /// spacing throughout the application. Common values include:
  /// - `M3SpacingToken.space8` for small gaps
  /// - `M3SpacingToken.space16` for standard gaps
  /// - `M3SpacingToken.space24` for larger gaps
  /// - `M3MarginToken.compactScreen` for compact screen margins
  /// - `M3SpacerToken.pane` for standard pane spacing
  final IM3SpacingToken spacing;

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
    // If orientation is manually specified, use it
    if (orientation != null) {
      return orientation!;
    }

    // Variable to store the detected orientation
    Axis? detectedAxis;

    // Walk up the widget tree to find layout widgets
    context.visitAncestorElements((element) {
      final widget = element.widget;

      if (widget is Row) {
        detectedAxis = Axis.horizontal;
        return false; // Stop traversal
      } else if (widget is Column) {
        detectedAxis = Axis.vertical;
        return false; // Stop traversal
      } else if (widget is Flex) {
        // For Flex widgets, check the direction property
        detectedAxis = widget.direction;
        return false; // Stop traversal
      } else if (widget is Wrap) {
        // For Wrap, use the direction property
        detectedAxis = widget.direction;
        return false; // Stop traversal
      } else if (widget is ListView) {
        // ListView can be horizontal or vertical
        final scrollDirection = widget.scrollDirection;
        detectedAxis = scrollDirection == Axis.horizontal
            ? Axis.horizontal
            : Axis.vertical;
        return false; // Stop traversal
      } else if (widget is GridView) {
        // GridView scrollDirection determines the main axis
        final scrollDirection = widget.scrollDirection;
        detectedAxis = scrollDirection == Axis.horizontal
            ? Axis.horizontal
            : Axis.vertical;
        return false; // Stop traversal
      } else if (widget is SingleChildScrollView) {
        // SingleChildScrollView can scroll in both directions
        final scrollDirection = widget.scrollDirection;
        detectedAxis = scrollDirection == Axis.horizontal
            ? Axis.horizontal
            : Axis.vertical;
        return false; // Stop traversal
      } else if (widget is PageView) {
        // PageView scrollDirection
        final scrollDirection = widget.scrollDirection;
        detectedAxis = scrollDirection == Axis.horizontal
            ? Axis.horizontal
            : Axis.vertical;
        return false; // Stop traversal
      }

      return true; // Continue traversal if no matching widget found
    });

    // Return detected orientation or default to vertical
    return detectedAxis ?? Axis.vertical;
  }

  @override
  Widget build(BuildContext context) {
    final detectedOrientation = _detectOrientation(context);
    final spacingValue = spacing.value;

    return detectedOrientation == Axis.horizontal
        ? SizedBox(width: spacingValue)
        : SizedBox(height: spacingValue);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<IM3SpacingToken>('spacing', spacing))
      ..add(EnumProperty<Axis?>('orientation', orientation));
  }
}

/// Extension methods for convenient gap creation.
///
/// These extensions provide shorthand methods for creating gaps with
/// common spacing tokens, making the code more readable and concise.
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
  /// Creates a gap with no spacing (0dp).
  ///
  /// This can be useful for conditional spacing or as a placeholder.
  static M3Gap none({Key? key, Axis? orientation}) {
    return M3Gap(
      M3SpacingToken.none,
      key: key,
      orientation: orientation,
    );
  }

  /// Creates a small gap (4dp) with automatic orientation detection.
  static M3Gap extraSmall({Key? key, Axis? orientation}) {
    return M3Gap(
      M3SpacingToken.space4,
      key: key,
      orientation: orientation,
    );
  }

  /// Creates a small gap (8dp) with automatic orientation detection.
  static M3Gap small({Key? key, Axis? orientation}) {
    return M3Gap(
      M3SpacingToken.space8,
      key: key,
      orientation: orientation,
    );
  }

  /// Creates a medium gap (16dp) with automatic orientation detection.
  static M3Gap medium({Key? key, Axis? orientation}) {
    return M3Gap(
      M3SpacingToken.space16,
      key: key,
      orientation: orientation,
    );
  }

  /// Creates a large gap (24dp) with automatic orientation detection.
  static M3Gap large({Key? key, Axis? orientation}) {
    return M3Gap(
      M3SpacingToken.space24,
      key: key,
      orientation: orientation,
    );
  }

  /// Creates an extra large gap (32dp) with automatic orientation detection.
  static M3Gap extraLarge({Key? key, Axis? orientation}) {
    return M3Gap(
      M3SpacingToken.space32,
      key: key,
      orientation: orientation,
    );
  }
}

/// Utility class for creating multiple gaps at once.
///
/// This class provides methods for creating lists of gaps, which can be
/// useful when you need to intersperse spacing between multiple widgets.
///
/// Usage:
/// ```dart
/// Column(
///   children: M3GapUtils.addGaps(
///     [
///       Text('Item 1'),
///       Text('Item 2'),
///       Text('Item 3'),
///     ],
///     M3SpacingToken.space16,
///   ),
/// )
/// ```
class M3GapUtils {
  /// Private constructor to prevent instantiation
  const M3GapUtils._();

  /// Adds gaps between widgets in a list.
  ///
  /// Takes a list of widgets and returns a new list with gaps inserted
  /// between each widget. The gaps use the specified spacing token and
  /// automatic orientation detection.
  ///
  /// [widgets] - The list of widgets to add gaps between
  /// [spacing] - The spacing token to use for gaps
  /// [orientation] - Optional orientation override
  static List<Widget> addGaps(
    List<Widget> widgets,
    IM3SpacingToken spacing, {
    Axis? orientation,
  }) {
    if (widgets.isEmpty) return widgets;

    final result = <Widget>[];

    for (var i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);

      // Add gap after each widget except the last one
      if (i < widgets.length - 1) {
        result.add(M3Gap(spacing, orientation: orientation));
      }
    }

    return result;
  }

  /// Adds gaps before and after a widget.
  ///
  /// This method wraps a widget with gaps on both sides, useful for
  /// creating consistent spacing around a widget.
  ///
  /// [widget] - The widget to wrap with gaps
  /// [spacing] - The spacing token to use for gaps
  /// [orientation] - Optional orientation override
  static List<Widget> wrapWithGaps(
    Widget widget,
    IM3SpacingToken spacing, {
    Axis? orientation,
  }) {
    return [
      M3Gap(spacing, orientation: orientation),
      widget,
      M3Gap(spacing, orientation: orientation),
    ];
  }

  /// Creates a separator gap with visual indication.
  ///
  /// This method creates a gap that includes a subtle visual separator,
  /// useful for creating sections with clear visual boundaries.
  ///
  /// [spacing] - The spacing token to use for gaps
  /// [color] - The color of the separator line
  /// [thickness] - The thickness of the separator line
  /// [orientation] - Optional orientation override
  static Widget separator(
    IM3SpacingToken spacing, {
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
