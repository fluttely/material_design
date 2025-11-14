part of '../design_tokens.dart';

/// Z-index values defining the stacking order of components.

/// Defines the stacking order for widgets using integer z-indexes.
class ZIndexTokens extends Equatable {
  const ZIndexTokens({
    int? background,
    int? content,
    int? dropdown,
    int? modal,
    int? tooltip,
    int? overlay,
  }) : background = background ?? ExtendedValues.zeroInt,
       content = content ?? ExtendedValues.x1Int,
       dropdown = dropdown ?? ExtendedValues.x10Int,
       modal = modal ?? ExtendedValues.x100Int,
       tooltip = tooltip ?? ExtendedValues.x1000Int,
       overlay = overlay ?? ExtendedValues.x9999Int;
  final int background;
  final int content;
  final int dropdown;
  final int modal;
  final int tooltip;
  final int overlay;

  @override
  List<Object?> get props => [
    background,
    content,
    dropdown,
    modal,
    tooltip,
    overlay,
  ];

  @override
  String toString() =>
      '''
ZIndexTokens(
  background: $background,
  content: $content,
  dropdown: $dropdown,
  modal: $modal,
  tooltip: $tooltip,
  overlay: $overlay,
)
''';
}
