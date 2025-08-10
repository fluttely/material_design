/// Card specifications based on Material Design 3.
///
/// Reference: https://m3.material.io/components/cards/overview
library;

import '../../../design/sys/sys.dart';

/// Specifications for Material 3 cards.
abstract class M3CardSpecs {
  /// Elevated card specifications.
  static const M3CardSpec elevatedCard = M3CardSpec(
    containerElevation: M3ElevationLevels.level1,
    containerShape: M3ShapeScale.medium,
    containerColor: M3CardContainerColor.surfaceContainerLow,
    stateLayerShape: M3ShapeScale.medium,
  );

  /// Filled card specifications.
  static const M3CardSpec filledCard = M3CardSpec(
    containerElevation: M3ElevationLevels.level0,
    containerShape: M3ShapeScale.medium,
    containerColor: M3CardContainerColor.surfaceContainerHighest,
    stateLayerShape: M3ShapeScale.medium,
  );

  /// Outlined card specifications.
  static const M3CardSpec outlinedCard = M3CardSpec(
    containerElevation: M3ElevationLevels.level0,
    containerShape: M3ShapeScale.medium,
    containerColor: M3CardContainerColor.surface,
    stateLayerShape: M3ShapeScale.medium,
    outlineWidth: 1.0,
    outlineColor: M3CardOutlineColor.outlineVariant,
  );
}

/// Specification for a Material 3 card.
class M3CardSpec {
  const M3CardSpec({
    required this.containerElevation,
    required this.containerShape,
    required this.containerColor,
    required this.stateLayerShape,
    this.outlineWidth,
    this.outlineColor,
  });

  /// Elevation of the card container.
  final double containerElevation;

  /// Shape of the card container.
  final double containerShape;

  /// Color of the card container.
  final M3CardContainerColor containerColor;

  /// Shape of the state layer.
  final double stateLayerShape;

  /// Width of the card outline (for outlined cards).
  final double? outlineWidth;

  /// Color of the card outline (for outlined cards).
  final M3CardOutlineColor? outlineColor;
}

/// Container color options for cards.
enum M3CardContainerColor {
  surface,
  surfaceContainerLow,
  surfaceContainerHigh,
  surfaceContainerHighest,
  surfaceVariant,
}

/// Outline color options for cards.
enum M3CardOutlineColor {
  outline,
  outlineVariant,
  primary,
}

/// State specifications for cards.
abstract class M3CardStates {
  /// Enabled state specifications.
  static const M3CardStateSpec enabled = M3CardStateSpec(
    containerOpacity: 1.0,
  );

  /// Disabled state specifications.
  static const M3CardStateSpec disabled = M3CardStateSpec(
    containerOpacity: 0.38,
  );

  /// Hovered state specifications.
  static const M3CardStateSpec hovered = M3CardStateSpec(
    containerOpacity: 1.0,
    stateLayerOpacity: M3StateColors.hoveredOpacity,
  );

  /// Focused state specifications.
  static const M3CardStateSpec focused = M3CardStateSpec(
    containerOpacity: 1.0,
    stateLayerOpacity: M3StateColors.focusedOpacity,
  );

  /// Pressed state specifications.
  static const M3CardStateSpec pressed = M3CardStateSpec(
    containerOpacity: 1.0,
    stateLayerOpacity: M3StateColors.pressedOpacity,
  );
}

/// State specification for a card.
class M3CardStateSpec {
  const M3CardStateSpec({
    required this.containerOpacity,
    this.stateLayerOpacity = 0.0,
  });

  /// Opacity of the container in this state.
  final double containerOpacity;

  /// Opacity of the state layer in this state.
  final double stateLayerOpacity;
}